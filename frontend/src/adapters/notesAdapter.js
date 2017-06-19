class NotesAdapter {
  constructor() {
    this.baseUrl = 'http://localhost:3000/api/v1/notes'
  }

  getNotes() {
    return fetch(this.baseUrl)
    .then( resp => resp.json() )
  }

  deleteNote(noteId) {
    const deleteUrl = `${this.baseUrl}/${noteId}`
    const noteDeleteParams = {
      method: 'DELETE',
      headers: {
        'Content-Type':'application/json'
      }
      }
      return fetch(deleteUrl,noteDeleteParams).then( resp => resp.json() )
  }

  loadAllNotesInto(array) {
    return this.getNotes()
    .then( notesJSON => notesJSON.forEach( note => array.push( new Note(note) )))
  }

  createNote(body) {
    const noteCreateParams = {
      method: 'POST',
      headers: {
        'Content-Type':'application/json'
      },
      body: JSON.stringify({body:body})
    }
    return fetch(this.baseUrl,noteCreateParams).then( resp => resp.json() )
  }
}
