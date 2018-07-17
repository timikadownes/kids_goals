/* global Vue, VueRouter, axios */
var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Kids and Goals Index!",
      kids: [],
      currentKid: {},
      nameFilter: '',
      sortAttribute: 'name',
      sortAscending: true
    };
  },
  created: function() {
    axios.get("/api/kids").then(function(response){
      this.kids = response.data;
      console.log(this.kids);
    }.bind(this));
  },
  methods: {
      setCurrentkid: function(kid){
        this.currentkid = kid;
        console.log(this.currentKid);
      },
      setSortAttribute: function(attribute){
        if(this.sortAttribute === attribute){
          this.sortAscending =!this.sortAscending;
      } else{
        this.sortAttribute = attribute;
        this.sortAscending = true;
      }
    }
  },
  computed: {
    sortedProducts: function(){
      return this.kids.sort(function(kid1, kid2){
        var lowerName1 = kid1[this.sortAttribute].toLowerCase();
        var lowerName2 = kid2[this.sortAttribute].toLowerCase();
        if (this.sortAscending) {
         return lowerName1.localeCompare(lowerName2); 
       } else{ 
        return lowerName2.localeCompare(lowerName1);
       }
        
      }.bind(this));
    }
  }
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
                  })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  template: "<h1>Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/logout", component: LogoutPage }
  ]
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});