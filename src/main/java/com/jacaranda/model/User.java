package com.jacaranda.model;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="USERS")
public class User {
	@Id
	private String username;
	private String password;
	@Column(name="first_name")
	private String firstName;
	@Column(name="last_name")
	private String lastName;
	@Column(name="date_of_birth")
	private LocalDate dateOfBirth;
	private String genre; //hacer enumerado?
	private boolean admin;

	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(String username, String password, String firstName, String lastName, LocalDate dateOfBirth,
			String genre) throws UserException {
		this.username = username;
		this.password = password; //TO DO comprobar que la contraseña esté cifrada, si no lo está cifrarla
		this.firstName = firstName;
		this.lastName = lastName;
		this.dateOfBirth = dateOfBirth;
		this.setGenre(genre);
		this.admin = false;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() { //la recibe ya codificada
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public LocalDate getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(LocalDate dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) throws UserException {
		if(genre.equals("Male") || genre.equals("Female")) {
			this.genre = genre;
		}else {
			throw new UserException("El género no es correcto");
		}
	}

	public boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}
	

}
