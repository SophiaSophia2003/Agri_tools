// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// Within source files, import statements are resolved relative to the file doing the import,
// so import Bar from "./foo" finds a foo.js file in the same directory as the current file, while import Bar from "../src/foo"
// finds a file in a sibling directory named src.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import jquery from 'jquery';
window.$ = window.jquery = window.jQuery = jquery;
global.$ = jQuery;

Rails.start()
// Turbolinks.start()
ActiveStorage.start()

require("moment")
import 'core-js/actual'
// import '../src/moment' // not required because installed via yarn

import '../src/bootstrap.min'
import '../src/bootstrap-tabsdrop'
import '../src/jquery-ui.custom.min'

require("trix")
require("@rails/actiontext")