package com.book.api.controllers;

import com.book.api.entities.Book;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BookController extends CrudRepository<Book,Long> {

}
