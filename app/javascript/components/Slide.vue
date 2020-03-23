<template>
  <div class="contents">
    <div class="slide_body">
      <img v-bind:src="slideList[nowIndex]" />
    </div>

    <div class="slides_footer">
      <button v-on:click="preview()" v-bind:disabled="nowIndex == 0">PREV</button>
      <div class="slides_footer_dot">{{ nowIndex + 1 }} ／ {{ slideList.length }} ページ</div>
      <button v-on:click="next()" v-bind:disabled="nowIndex == slideList.length - 1">NEXT</button>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { csrfToken } from "rails-ujs";
axios.defaults.headers.common["X-CSRF-TOKEN"] = csrfToken();

export default {
  props: ["userId"],
  data() {
    return {
      slideList: [],
      index: 0
    };
  },
  computed: {
    nowIndex: function() {
      return this.index;
    },
    visibleSlide() {
      return this.slideList[this.nowIndex].image.url;
    }
  },
  created: function() {
    this.fetchPathsByUserId().then(result => {
      for (let i = 0, len = result.length; i < len; ++i) {
        this.slideList.push(result[i].image.url);
      }
    });
  },
  methods: {
    preview() {
      if (this.index > 0) {
        this.index--;
      }
    },
    next() {
      if (this.index < this.slideList.length - 1) {
        this.index++;
      }
    },
    fetchPathsByUserId: async function() {
      const res = await axios.get(`/users/${this.userId}/api/slides`);
      if (res.status !== 200) {
        process.exit();
      }
      return res.data;
    }
  }
};
</script>
