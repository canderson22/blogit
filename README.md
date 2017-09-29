# BlogIT

---

A web application created for users to blog about anything they wish to express thier thoughts.

Click on [BlogIT](https://justblogit.herokuapp.com/) to check out the app.

---

## How it Works:

Go on the site and sign up. After signing up you'll have the options of viewing other users blogs, create your own blogs, and leave comments on other blogs.

Each blog created will have your name and the date you created it, it's that easy! If you dont like a comment or blog you made you can easily delete them, no worries.

## Development and Technologies used:

BlogIT was built using the following technologies:

- HTML
- CSS
- JavaScript
- jQuery
- Ruby
- Bootstrap front-end framework
- Ruby on Rails web application framework
- Font-Awesome Icon Library

## Wireframes

### Data Model:

![Data Model](https://go.gliffy.com/go/share/image/sydhjf900y7hes3hwwke.png?utm_medium=live-embed&utm_source=trello)

### wireframe

![Layout of site](https://go.gliffy.com/go/share/image/s80v6fisalll07xml41p.png?utm_medium=live-embed&utm_source=custom)

## Approach taken:

The approach I took for this app was the MVC model.

- Created three models: users, blogs, comments
- Included a sign up/ log in feature, making the emails unique and using bcrypt for the storing the passwords
- Implemented RESTful routes for each of my models
-  Used CRUD for users, blogs, comments
-  Added a new model category
-  Created two different controllers for the blogs/comments
-  Nested blogs/comments in the user resources and category resources
-  the blogs/comments for the category routes would be used as the public viewing pages for the user
-  the blogs/comments for the user routes would be used to access the users blogs/comments for CRUD operations

## Installation/Start-up:

Users can access the web application through [blogIT](https://justblogit.herokuapp.com), or by downloading the git repo. When downloading the git repo, after cloning repo, you must open the application in the terminal. Type in the following commands in the terminal -- <mark>bundle install</mark>,
<mark>rails db:create</mark>, <mark>rails db:migrate</mark>, <mark>rails server</mark>.

## Next Steps

1) Create functionality where users can create thier own categories.

2) Create a more functional profile editing form

3) Be able to add images and links to blogs

4) Add searching functionality

## Acknowledgments

Code for sidebar nav based on [startbootstrap/sidenav](https://startbootstrap.com/template-overviews/simple-sidebar/).

