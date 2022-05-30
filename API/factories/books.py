def factory_new_book():
    book = {
        "id": 202,
        "title": "O livro do suicidio",
        "description": "O livro e um compilado dos diarios achados, do cidadao Bruce",
        "pageCount": 202,
        "excerpt": "Teste",
        "publishDate": "2022-05-30T17:29:52.697Z"
    }
    return book

def factory_update_book():
    book = {
        "id": 202,
        "title": "O livro do suicidio alterado",
        "description": "O livro e um compilado dos diarios achados, do cidadao Bruce, alterado",
        "pageCount": 202,
        "excerpt": "Teste alterado",
        "publishDate": "2022-05-30T17:29:52.697Z"
    }
    return book
