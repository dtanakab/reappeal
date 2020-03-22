import Vue from 'vue/dist/vue.esm'
import Slide from './components/Slide.vue'

document.addEventListener('DOMContentLoaded', () => {
  // eslint-disable-next-line no-new
  new Vue({
    el: '#slide',
    components: { Slide }
  })
})
