# Java Project
# S.O.A.R (Support Our Adoption Rescue)

## Project Overview

S.O.A.R (Support Our Adoption Rescue) is a user-friendly website dedicated to facilitating pet adoption and providing shelter to pets in need. The primary goal is to offer an accessible platform where users can explore, learn about, and ultimately adopt pets. By leveraging technology, the website seeks to enhance the adoption experience, ensuring that pets find loving homes while encouraging responsible pet ownership.

## What does S.O.A.R mean?
Support Our Adoption Rescue.

## Objectives

- **Pet Adoption Facilitation:** Enable users to browse profiles of pets available for adoption, including detailed descriptions and images to facilitate informed decisions.
- **Educational Resources:** Provide resources and information on pet care, adoption processes, and responsible pet ownership to support potential adopters.
- **User-Friendly Interface:** Design an intuitive interface that enhances the user experience, making it easy for visitors to navigate and interact with the website.

## Requirements

### Functional Requirements

1. **Different Interfaces for Admin, Shop Owner, and Adopter**
    - Separate interfaces for admin, shop owner, and adopter with distinct functionalities.
    - Admins have the ability to create, update, and delete shops.
    - Shop owners have the ability to create, update, and delete their pets. They can also see the adopters' requests.
    - Adopters can browse a comprehensive list of all available pets and view detailed information about each pet. They can submit a request to adopt a pet and manage their favorites list by adding and removing pets.

2. **User Registration and Authentication**
    - Users can register and create accounts.
    - Secure authentication mechanisms (e.g., email verification, password encryption).

3. **Pet Listing Management**
    - Authorized users (shelters, shops) can add/edit/delete pet profiles.
    - Pet profiles include name, breed, age, and photos.

4. **User Interaction Features**
    - Registered users can like pets to create a favorites list.

5. **Responsive Design**
    - Mobile-friendly and responsive design.

6. **Security and Privacy**
    - Data protection and compliance with regulations.
    - User privacy settings management.

7. **Validations**
    - Include validation for each user, pet, or shop added.

## Design
![HTML5 Valid](https://img.shields.io/badge/HTML5-valid-blue?logo=html5)
![Bootstrap](https://img.shields.io/badge/Bootstrap-5.1.0-563d7c?logo=bootstrap)
![CSS3](https://img.shields.io/badge/CSS3-valid-blue?logo=css3)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-2.6.4-6db33f?logo=spring)
![Java](https://img.shields.io/badge/Java-11-red?logo=java)
![JavaScript](https://img.shields.io/badge/JavaScript-valid-yellow?logo=javascript)
![MySQL](https://img.shields.io/badge/MySQL-valid-blue?logo=mysql)




### User Interface Design

1. **Home Page**
    - Quick links to search and browse pets.

2. **Registration/Login Page**
    - Simple and secure registration and login forms.

3. **Category Page**
    - Displays a list of all pets within a specific category, providing brief information without detailed descriptions. Each pet has a clickable link to view more detailed information on a separate page.

4. **Pet Profile Page**
    - Detailed information about each pet.
    - Photos and descriptions.

5. **User Dashboard**
    - Favorites list.

6. **Admin Dashboard**
    - Admins have the ability to create, update, and delete shops.

7. **Contact Us Page**
    - Provides information about our organization.

8. **About Us Page**
    - Showcases a list of all available pets from our partner shops. Each shop is displayed with brief information.

9. **Shop Owner Dashboard**
    - Shop owners have the ability to create, update, and delete pets.
    - Shop owners can see the user adoption requests.

## Architecture

### System Architecture

1. **Frontend**
    - Developed using modern frameworks (Spring Boot).
    - Responsive design with HTML, CSS, and JavaScript.

2. **Backend**
    - RESTful API for handling data requests.
    - Built with a robust framework (Spring Boot).

3. **Database**
    - Relational database (MySQL) for structured data.

4. **Hosting and Deployment**
    - Cloud-based hosting (AWS) for scalability and reliability.

## Installation

### Prerequisites

- Java 11 or higher
- Maven
- MySQL

### Steps

1. Clone the repository:
    ```bash
    git clone https://github.com/your-username/soar.git
    cd soar
    ```

2. Set up the database:
    - Create a new MySQL database.
    - Update the `application.properties` file with your database configuration.

3. Build and run the project:
    ```bash
    mvn clean install
    mvn spring-boot:run
    ```

## Usage

- Navigate to `http://localhost:8080` to access the website.
- Register a new account or log in with existing credentials.
- Browse pets, add them to your favorites, and submit adoption requests.

## Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For any inquiries or support, please contact us at GitHub accounts.
