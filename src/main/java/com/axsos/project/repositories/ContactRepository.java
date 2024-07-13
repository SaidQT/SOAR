package com.axsos.project.repositories;

import org.springframework.data.repository.CrudRepository;

import com.axsos.project.models.Contact;



public interface ContactRepository extends CrudRepository<Contact, Long> {
}
