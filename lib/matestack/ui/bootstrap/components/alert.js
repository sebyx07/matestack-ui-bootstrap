import * as bootstrap from 'bootstrap';
import Vue from 'vue/dist/vue.esm';

import MatestackUiCore from 'matestack-ui-core';

Vue.component('matestack-ui-bootstrap-alert', {
  mixins: [MatestackUiCore.componentMixin],

  data() {
    return {
      alertInstance: undefined,
    };
  },

  methods: {
    close() {
      this.alertInstance.close();
    },
    dispose() {
      this.alertInstance.dispose();
      // this.alertInstance = new bootstrap.Alert(self.$el)
    },
  },

  mounted() {
    const self = this;
    const alert = self.$el;
    self.alertInstance = new bootstrap.Alert(alert);
  },

  created() {
    const self = this;
    // close_on event registration
    if (self.props.close_on !== undefined) {
      const close_events = self.props.close_on.split(',');
      close_events.forEach((close_event) => MatestackUiCore.matestackEventHub.$on(close_event.trim(), self.close));
    }
    // dispose_on event registration
    if (self.props.dispose_on !== undefined) {
      const dispose_events = self.props.dispose_on.split(',');
      dispose_events.forEach((dispose_event) => MatestackUiCore.matestackEventHub.$on(dispose_event.trim(), self.dispose));
    }
  },

  beforeDestroy() {
    const self = this;
    if (self.props.close_on !== undefined) {
      const closen_events = self.props.close_on.split(',');
      closen_events.forEach((close_event) => MatestackUiCore.matestackEventHub.$off(close_event.trim(), self.close));
    }
    if (self.props.dispose_on !== undefined) {
      const dispose_events = self.props.dispose_on.split(',');
      dispose_events.forEach((dispose_event) => MatestackUiCore.matestackEventHub.$off(dispose_event.trim(), self.dispose));
    }
  },
});
