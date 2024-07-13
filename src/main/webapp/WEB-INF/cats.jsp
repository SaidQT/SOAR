<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Movie List</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
    integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
</head>

<body>
  <!-- navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="./index.html">Movie List</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="index.html">Home
            <span class="sr-only">(current)</span>
          </a>
        </li>
        <li class="nav-item" v-if="currentPage === 'home'">
          <a class="nav-link pointer" @click.prevent="changePage('favorite')">favorite</a>
        </li>
        <li class="nav-item active" v-else-if="currentPage === 'favorite'">
          <a class="nav-link pointer" @click.prevent="changePage('favorite')">favorite</a>
        </li>
      </ul>
    </div>
  </nav>

  <!-- search bar -->
  <div class="container mt-5">
    <div class="row" id="search-bar">
      <div class="col-6">
        <form id="search" class="form-inline">
          <label class="sr-only" for="inlineFormInputName2">Name</label>
          <input type="text" class="form-control mb-2 mr-sm-2" id="search-input" placeholder="search name...">
          <button type="submit" class="btn bt-primary mb-2">Search</button>
        </form>
      </div>
      <div class="col-6 d-flex justify-content-end" id="modeSwitch">
        <i class="listItem fa fa-bars mr-2 fa-lg" aria-hidden="true"></i>
        <i class="cardItem fa fa-th fa-lg" aria-hidden="true"></i>
      </div>
    </div>
  </div>

  <!-- data-panel -->
  <div class="container mt-5">
    <div class="row" id="data-panel">
      <!-- print movie list here -->
    </div>
  </div>

  <!-- Modal -->
  <div class="modal fade" id="show-movie-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="show-movie-title"></h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body" id="show-movie-body">
          <div class="row">
            <div class="col-7" id="show-movie-image"></div>
            <div class="col-5">
              <p><em id="show-movie-date"></em></p>
              <p id="show-movie-description"></p>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Pagination -->
  <nav aria-label="Page navigation">
    <ul class="pagination justify-content-center" id="pagination">
      <li class="page-item">
        <a class="page-link" href="#">1</a>
      </li>
    </ul>
  </nav>

  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
    integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
    integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
    crossorigin="anonymous"></script>
  <script src="index.js"></script>
</body>

</html>