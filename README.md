<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO 
<br />
<div align="center">
  <a href="https://github.com/banosl/rails-engine">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">Rails Engine</h3>

  <p align="center">
    project_description
    <br />
    <a href="https://github.com/banosl/rails-engine"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/banosl/rails-engine">View Demo</a>
    ·
    <a href="https://github.com/banosl/rails-engine/issues">Report Bug</a>
    ·
    <a href="https://github.com/banosl/rails-engine/issues">Request Feature</a>
  </p>
</div>
-->


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

This project involves developing an E-commerce application using a service-oriented architecture where the front and back ends communicate through APIs. The task is to expose the data that powers the site through an API for the front end to consume. The project requires using serializers to format JSON responses, testing API exposure, and using SQL and AR to gather data. 

The learning goals range from having a functional understanding to a familiar understanding of the concepts involved. Implicit skills that can be developed include reading documentation, time management, prioritizing work, breaking down large projects into small pieces, and project management. The project spec is organized by feature type, and an Agile approach is encouraged to complete the assignment with estimated milestones.


<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

* [Rails][Rails-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

### Prerequisites
 * Ruby v 2.7.4
 * Ruby on Rails v 5.2.8.1

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/banosl/rails-engine.git
   ```
2. Install gems
   ```sh
   bundle install
   ```
3. Setup db
   ```rb
   rake db:{drop,create,migrate,seed} 
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- ROADMAP -->
## Exposed Endpoints

### RESTful Endpoints
Merchants:
* GET all merchants, ```/api/v1/merchants```
* GET one merchant,  ```/api/v1/merchants/merchant_id```
* GET all items for a given merchant ID, ```/api/v1/merchants/merchant_id/items```

Items:
* GET all items, ```/api/v1/items```
* GET one item, ```/api/v1/items/item_id```
* POST create an item ```/api/v1/items```
* PUT edit an item, ```/api/v1/items/item_id```
* delete an item
* GET the merchant data for a given item ID, ```/api/v1/items/item_id/merchant```

### Non-RESTful Endpoints
* find one ITEM based on search criteria AND find all MERCHANTS based on search criteria
* GET all merchants, ```/api/v1/merchants/find_all?name=query```
* GET one item by name, ```/api/v1/items/find?name=query```
* GET one item by prices, ```/api/v1/items/find?min_price=qty&max_price=qty```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- USAGE EXAMPLES -->
## Usage Examples on Postman

* GET all merchants <img width="1062" alt="Screen Shot 2023-02-23 at 1 17 59 PM" src="https://user-images.githubusercontent.com/111591731/221303929-2e2c27a2-c30a-4133-8c6d-44cfda931cb7.png">

* GET a merchant's items <img width="1062" alt="Screen Shot 2023-02-23 at 1 18 18 PM" src="https://user-images.githubusercontent.com/111591731/221303869-77b63b03-e06b-4c47-b1b2-e3694ce22476.png">

* POST create one item <img width="1062" alt="Screen Shot 2023-02-23 at 1 18 41 PM" src="https://user-images.githubusercontent.com/111591731/221303832-f4bc0be4-cee4-4c59-97a5-05f779507d0f.png">

* GET One Item by Name Fragment <img width="1062" alt="Screen Shot 2023-02-23 at 1 19 04 PM" src="https://user-images.githubusercontent.com/111591731/221303767-51a9bcda-acf6-4316-8aa6-7d9260b66428.png">


<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- CONTRIBUTING 
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>
-->


<!-- LICENSE 
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

-->

<!-- CONTACT -->
## Contact

Leo Banos Garcia - bsleo625@gmail.com

Project Link: [https://github.com/banosl/rails-engine](https://github.com/banosl/rails-engine)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS 
## Acknowledgments

* []()
* []()
* []()

<p align="right">(<a href="#readme-top">back to top</a>)</p>
-->


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/banosl/rails-engine.svg?style=for-the-badge
[contributors-url]: https://github.com/banosl/rails-engine/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/banosl/rails-engine.svg?style=for-the-badge
[forks-url]: https://github.com/banosl/rails-engine/network/members
[stars-shield]: https://img.shields.io/github/stars/banosl/rails-engine.svg?style=for-the-badge
[stars-url]: https://github.com/banosl/rails-engine/stargazers
[issues-shield]: https://img.shields.io/github/issues/banosl/rails-engine.svg?style=for-the-badge
[issues-url]: https://github.com/banosl/rails-engine/issues
[license-shield]: https://img.shields.io/github/license/banosl/rails-engine.svg?style=for-the-badge
[license-url]: https://github.com/banosl/rails-engine/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/leo-banos-garcia
[product-screenshot]: images/screenshot.png
[Rails]: https://img.shields.io/badge/-Ruby%20on%20Rails-CC0000?logo=ruby-on-rails&logoColor=white&style=for-the-badge
[Rails-url]: https://rubyonrails.org 
