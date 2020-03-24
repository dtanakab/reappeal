import Vue from 'vue/dist/vue.esm'
import Slide from './components/Slide.vue'
import ActionCable from 'actioncable';

const cable = ActionCable.createConsumer("/cable");

Vue.prototype.$cable = cable;
document.addEventListener('DOMContentLoaded', () => {
  // eslint-disable-next-line no-new
  new Vue({
    el: '#slide',
    components: { Slide }
  })
})
