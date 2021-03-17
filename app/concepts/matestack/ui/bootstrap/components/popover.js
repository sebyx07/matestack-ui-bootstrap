import * as bootstrap from 'bootstrap'
import Vue from 'vue/dist/vue.esm'

import MatestackUiCore from 'matestack-ui-core'

Vue.component('matestack-ui-bootstrap-popover', {

  mixins: [MatestackUiCore.componentMixin],
  data() {
    return {
      popoverInstance: undefined

    };
  },
  methods: {

  },
  mounted: function() {
    const self = this;
    var popover = self.$el
    self.popoverInstance = new bootstrap.Popover(popover, {})
  },
  created: function() {
  },

  beforeDestroy: function() {

  },
});
