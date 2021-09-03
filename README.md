
<h1 align="center">StackActive Backend</h1>
      
<p align="center">
  <a href="https://cinemafaces.herokuapp.com/" targer="_blank">Live Demo</a> •
  <a href="#getting-started">Getting Started</a> •
  <a href="#development-information">Development Information</a> •
  <a href="#contributing">Contributing</a> •
  <a href="#authors">Authors</a> 
</p>

This repo contains the backend for the StackActive application. The backend is an API only Rails application. 
<hr>


## Getting Started

#### Cloning

To clone the project on your local machine, run the following command. 

```
git clone https://github.com/smcommits/stack-show-backend
```

#### Navigating

Navigate to the project directory using the following command.

```
cd stack-show-backend
```

#### Dependencies 

To install all the dependencies required to run the project, execute the following command. 

```
bundle install
```
#### Launching

To launch the application, run the following command. 

```
rails s
```

<hr>

## Development Information

### Stack

This project is a backend-end solution. It is an API only application which means it only has limited middlewares available for service. It primarily makes use of the following components of Rails: 

- Active Records
- ActiveModel Serializer
- Action Cable
- Action Controller

To know more about API only application in Rails please refer to the [Rails Guides.](https://guides.rubyonrails.org/api_app.html)
### API

The API offers the following essential services. 

- CRUD Operations
- Data persistence 
- Authentication
- Serialization
- WebSocket channels and subscriptions
- Caching

### Tests

This application uses rspec-rails to implement the tests. Additionaly, shoulda-matchers are used to implement assertions for ActiveRecord Assosiations and Validations. 

To run the tests, please use the following command:
```
rspec
```

<hr>

## Authors

👤 **Anas Siddiqui**

- GitHub: [Anas Siddiqui](https://github.com/smcommits)
- LinkedIn: [Anas Siddiqui](www.linkedin.com/in/sm-anas)

<hr>

## 🤝Contributing

Contributions, issues, and feature requests are welcome!

<hr>

## Show your support

Give a ⭐️ if you like this project!
   
