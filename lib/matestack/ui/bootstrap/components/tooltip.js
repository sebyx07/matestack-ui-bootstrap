import * as bootstrap from 'bootstrap';
import Vue from 'vue/dist/vue.esm';

import MatestackUiCore from 'matestack-ui-core';

Vue.component('matestack-ui-bootstrap-tooltip', {

  mixins: [MatestackUiCore.componentMixin],
  data() {
    return {
      // tooltipInstance: undefined

    };
  },
  methods: {

  },
  mounted() {
    const self = this;
    const tooltip = self.$el;
    self.tooltipInstance = new bootstrap.Tooltip(tooltip);
  },
  // created: function() {
  // },

  // beforeDestroy: function() {

  // },
});
