package com.axsos.project.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.axsos.project.models.Contact;
import com.axsos.project.repositories.ContactRepository;

@Service
public class ContactService {

	@Autowired
	private ContactRepository contactRepository;

	public Contact saveContact(Contact contact) {
		return contactRepository.save(contact);
	}
}
