/* global Vue, VueRouter, axios */
var HomePage = {
  template: "#home-page",
  data: function() {
    return {};
  },
  created: function() {
  },
  methods: {},
  computed: {}
};

var UserShowPage = {
  template: "#user-show-page",
  data: function() {
    return {
      message: "Kids and Goals Page!",
      user: {},
    };
  },
  created: function() {
    axios.get("/api/users/" +this.$route.params.id).then(function(response){
      this.user = response.data;
      console.log(this.user);
    }.bind(this));
  },

  methods: {},
  computed: {}
};

var KidShowPage = {
  template: "#kid-show-page",
  data: function() {
    return {
      kid: {},
    };
  },
  created: function() {
    axios.get("/api/kids/" +this.$route.params.id).then(function(response){
      this.kid = response.data;
      console.log(this.kid);
    }.bind(this));
  },

  methods: {},
  computed: {}
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
          router.push("/users/me");
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

var KidNewPage = {
  template: "#kid-new-page",
  data: function() {
    return {
      name: "",
      grade: "",
      age: "",
      school: "",
      teacher: "",
      image_url: "",
      user_id: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        grade: this.grade,
        age: this.age,
        school: this.school,
        teacher: this.teacher,
        image_url: this.image_url,
        user_id: this.user_id
      };
      axios
        .post("/api/kids", params)
        .then(function(response) {
          router.push("/#/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    },
  },
  computed: {}
};

var KidEditPage = {
  template: "#kid-edit-page",
  data: function() {
    return {
      name: "",
      grade: "",
      age: "",
      school: "",
      teacher: "",
      image_url: "",
      user_id: "",
      errors: []
    };
  },
  created: function (){
    axios.get("/api/kids/" + this.$route.params.id).then(function(response) {
      this.name = response.data.name;
      this.grade = response.date.grade;
      this.age = response.data.age;
      this.school = response.data.school;
      this.teacher = response.data.teacher;
      this.image_url = response.data.image_url;
      this.user_id = response.data.user_id;
    }.bind(this));
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        grade: this.grade,
        age: this.age,
        school: this.school,
        teacher: this.teacher,
        image_url: this.image_url,
        user_id: this.user_id
      };
      axios
        .patch("/api/kids" +this.$route.params.id, params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
        }.bind(this)
      );
    },
  },
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/logout", component: LogoutPage },
    { path: "/kids/new", component: KidNewPage },
    { path: "/kids/:id/edit", component: KidEditPage },
    { path: "/users/:id/", component: UserShowPage },
    { path: "/kids/:id/", component: KidShowPage },
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