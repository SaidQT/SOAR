# Java Project
# S.O.A.R (Support Our Adoption Rescue)

## Project Overview

S.O.A.R (Support Our Adoption Rescue) is a user-friendly website dedicated to facilitating pet adoption and providing shelter to pets in need. The primary goal is to offer an accessible platform where users can explore, learn about, and ultimately adopt pets. By leveraging technology, the website seeks to enhance the adoption experience, ensuring that pets find loving homes while encouraging responsible pet ownership.

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

## Public Pages

### Home Page
![image](https://github.com/SaidQT/SOAR/blob/master/src/main/resources/static/read/Home%20page.png)
Welcome to our home page. Here, you'll find easy access to important links, including our cart, as well as a warm introduction to our website. We aim to provide a welcoming experience and guide you through our offerings, making it simple to explore what we have to offer. The page is styled with custom CSS and includes JavaScript for interactive elements. Icons are used for visual enhancement, and external libraries are loaded for additional functionality.

### Navbar Section
![image](https://github.com/SaidQT/SOAR/blob/master/src/main/resources/static/read/Navbar%20for%20user%20interfaces.jpg)
- **Favourite Button**: Redirects users to their favourite pets or to the login/register page if no user is logged in. Implemented with AJAX for a seamless experience.
- **Logout Button**: Visible only when a user is logged in.
- **Profile Button**: Redirects to the login/register page if not logged in or to the profile update page if logged in.

### Pet Filtering
![image](https://github.com/SaidQT/SOAR/blob/master/src/main/resources/static/read/Pet%20filltering.jpg)
Data filtering is managed via AJAX in the navbar, icons on the home page, and the cart page. Clicking a filter updates the display to show relevant pets.

### About Us Page
![image](https://github.com/SaidQT/SOAR/blob/master/src/main/resources/static/read/About%20us%20page.png)
Provides details about our brand, including information about rescued pets, successful adoptions, dedicated volunteers, and community events. Styled with custom CSS and JavaScript for interactivity.

### Cart Page
![Image of Cart Page](https://github.com/SaidQT/SOAR/blob/master/src/main/resources/static/read/Cart%20page.png).
Displays pets available for adoption with a dynamic and user-friendly interface. Features include a banner, filterable gallery, donation section, and AJAX-managed favourite forms. 

### FAQS Page
![Image of FAQS Page](https://github.com/SaidQT/SOAR/blob/master/src/main/resources/static/read/FAQs%20page.png).
Contains answers to frequently asked questions from the "Contact Us" form. 

### Contact Us Page
![Image of Contact Us Page](https://github.com/SaidQT/SOAR/blob/master/src/main/resources/static/read/Contact%20us%20page.png).
Offers a form for visitors to send us an email, requesting their name, email address, and message. 
![sample image](https://github.com/SaidQT/SOAR/blob/master/src/main/resources/static/read/email.png)
### Pet Details Page
![Image of Pet Details Page](https://github.com/SaidQT/SOAR/blob/master/src/main/resources/static/read/Details%20page.png).
Provides comprehensive details about each pet, including their story, age, breed, and city. Users can request to adopt the pet. 

### Partners Page
![Image of Partners Page](https://github.com/SaidQT/SOAR/blob/master/src/main/resources/static/read/Partners%20page.png)
Details about our partner shops, including names and locations. 

## User Interfaces

### Besties Page
![Image of Besties Page](https://github.com/SaidQT/SOAR/blob/master/src/main/resources/static/read/My%20besties%20page.png)
Displays the pets that the user has requested to adopt, organized into pending and accepted requests. 

### Edit Profile Page
![Image of Edit Profile Page](https://github.com/SaidQT/SOAR/blob/master/src/main/resources/static/read/Edit%20profile%20page.png)
Provides a form for users to update their account information, including email address and password. 

### Favourites Page
![Image of Favourites Page](https://github.com/SaidQT/SOAR/blob/master/src/main/resources/static/read/Favoirte%20list%20page.png)
Shows pets liked by the user and provides options to request adoption or unlike a pet. Implemented with AJAX. 

## Validations for the User

- **Username**: Between 3 and 30 characters, must be unique.
- **Email**: Required and in valid email format.
- **Password**: Required, must be longer than 5 characters.
- **Confirm Password**: Must match the password field.

## Spring Security

1. **Role-Based Access Control**: Differentiates access based on user roles (Admins, Users, Shop Owners).
2. **Password Encoding**: Utilizes BCrypt hashing for secure password storage.
3. **Custom Authentication Success Handling**: Redirects users based on their role after login.
4. **Login and Logout Configuration**: Custom login page with role-based redirection and logout functionality.
5. **Exception Handling**: Custom access denied page for unauthorized access attempts.

## Shop Interface

### Shop Home Page
![Image of Shop Home Page](https://github.com/SaidQT/SOAR/blob/master/src/main/resources/static/read/shophome.png)
The shop dashboard for managing pets includes a navigation menu and a table of pets with options to edit or delete. 

### Add Pet Page
![Image of Add Pet Page](https://github.com/SaidQT/SOAR/blob/master/src/main/resources/static/read/addpet.png)
Form for adding new pets with validation for pet details. Styled with CSS and includes JavaScript for interactivity. 

### Edit Pet Page
![Image of Edit Pet Page](https://github.com/SaidQT/SOAR/blob/master/src/main/resources/static/read/editpet.png)
Allows Shop owners to update pet details with validation and error messages. .

### Request Page
![Image of Request Page](https://github.com/SaidQT/SOAR/blob/master/src/main/resources/static/read/Request%20page.png)
Displays a list of pet adoption requests with options to accept or refuse. Includes a button to add a new pet. .

### Pet Validations

Ensures pet data integrity with validations for name, type, breed, city, image URL, description, and age.

## Admin Interface

### Admin Dashboard Page
![Image of Admin Dashboard Page](https://github.com/SaidQT/SOAR/blob/master/src/main/resources/static/read/Admin%20dashboard%20page.png)
Overview of key metrics including partners, adopted pets, unadopted pets, and donations. Features data visualizations with Chart.js. 

### Tables Page
![Image of Tables Page](https://github.com/SaidQT/SOAR/blob/master/src/main/resources/static/read/Admin%20tables%20page.png)
Displays tables for shops and users with options to edit or delete entries. Includes Chart.js for visual data representations. 

### Admin Add Shop Page
![Image of Admin Add Shop Page](https://github.com/SaidQT/SOAR/blob/master/src/main/resources/static/read/Admin%20add%20shop%20page.png)
Form for adding new shops, including validation for shop and user details. 

### Edit Shop Page
![Image of Edit Shop Page](https://github.com/SaidQT/SOAR/blob/master/src/main/resources/static/read/Admin%20edit%20shop%20page.png)
Allows administrators to update existing shop details with validation. 

### Shop Validations

Ensures shop data consistency with validations for name, city, maximum capacity, current pet count, and phone number.

---




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


