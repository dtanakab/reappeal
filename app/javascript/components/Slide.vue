<template>
  <div class="contents">
    <div class="slide_body">
      <img v-bind:src="slideList[nowIndex]" />
    </div>

    <div class="slides_footer">
      <button v-on:click="preview()" v-bind:disabled="nowIndex == 0">前へ</button>
      <div class="slides_footer_dot">{{ nowIndex + 1 }} ／ {{ slideList.length }} ページ</div>
      <button v-on:click="next()" v-bind:disabled="nowIndex == slideList.length - 1">次へ</button>
    </div>

    <div class="connect_button" v-if="screenChannel">
      <p>あなたの他に本スライドショーの閲覧者が存在し、</p>
      <p>同期設定にしている場合、閲覧スライドページが共有されます</p>
      <button v-on:click="disConnectChannel()">他閲覧者とのスライドページの同期を解除</button>
    </div>
    <div class="disconnect_button" v-else>
      <p>現在あなたの閲覧スライドページは共有されていません</p>
      <button v-on:click="connectChannel()">他閲覧者とスライドページを同期する</button>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { csrfToken } from "rails-ujs";
axios.defaults.headers.common["X-CSRF-TOKEN"] = csrfToken();

export default {
  props: ["slideShowId"],
  data() {
    return {
      slideList: [],
      index: 0,
      screenChannel: null
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
    this.fetchPathsBySlideShowId().then(result => {
      for (let i = 0, len = result.length; i < len; ++i) {
        this.slideList.push(result[i].image.url);
      }
    });
    this.screenChannel = this.$cable.subscriptions.create(
      {
        channel: "ScreenChannel",
        slide_show_id: this.slideShowId
      },
      {
        received: data => {
          this.index = data["operate"];
        }
      }
    );
  },
  methods: {
    preview() {
      this.index--;
      if (this.screenChannel != null) {
        this.screenChannel.perform("operate", {
          operate: this.index,
          slide_show_id: this.slideShowId
        });
      }
    },
    next() {
      this.index++;
      if (this.screenChannel != null) {
        this.screenChannel.perform("operate", {
          operate: this.index,
          slide_show_id: this.slideShowId
        });
      }
    },
    fetchPathsBySlideShowId: async function() {
      const res = await axios.get(
        `/slide_shows/${this.slideShowId}/api/slides`
      );
      if (res.status !== 200) {
        process.exit();
      }
      return res.data;
    },
    connectChannel() {
      this.screenChannel = this.$cable.subscriptions.create(
        {
          channel: "ScreenChannel",
          slide_show_id: this.slideShowId
        },
        {
          received: data => {
            this.index = data["operate"];
          }
        }
      );
    },
    disConnectChannel() {
      this.screenChannel.perform("unsubscribed", {});
      this.screenChannel = null;
    }
  }
};
</script>
