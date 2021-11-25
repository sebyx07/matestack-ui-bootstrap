import * as bootstrap from 'bootstrap';
import Vue from 'vue/dist/vue.esm';

import MatestackUiCore from 'matestack-ui-core';

Vue.component('matestack-ui-bootstrap-modal', {
  mixins: [MatestackUiCore.componentMixin],

  data() {
    return {
      modalInstance: undefined,
    };
  },

  methods: {
    toggle() {
      this.modalInstance.toggle();
    },
    show() {
      this.modalInstance.show();
    },
    hide() {
      this.modalInstance.hide();
    },
    handleUpdate() {
      this.modalInstance.handleUpdate();
    },
    dispose() {
      this.modalInstance.dispose();
    },
  },

  mounted() {
    const self = this;
    const modal = self.$el;
    self.modalInstance = new bootstrap.Modal(modal);
  },

  created() {
    const self = this;
    const eventHub = MatestackUiCore.matestackEventHub;
    // toggle_on event registration
    if (self.props.toggle_on !== undefined) {
      const toggle_events = self.props.toggle_on.split(',');
      toggle_events.forEach((toggle_event) => eventHub.$on(toggle_event.trim(), self.toggle));
    }
    // show_on event registration
    if (self.props.show_on !== undefined) {
      const show_events = self.props.show_on.split(',');
      show_events.forEach((show_event) => eventHub.$on(show_event.trim(), self.show));
    }
    // hide_on event registration
    if (self.props.hide_on !== undefined) {
      const hide_events = self.props.hide_on.split(',');
      hide_events.forEach((hide_event) => eventHub.$on(hide_event.trim(), self.hide));
    }
    // handle_update_on event registration
    if (self.props.handle_update_on !== undefined) {
      const handle_update_events = self.props.handle_update_on.split(',');
      handle_update_events.forEach((handle_update_event) => eventHub.$on(handle_update_event.trim(), self.handle_update));
    }
    // dispose_on event registration
    if (self.props.dispose_on !== undefined) {
      const dispose_events = self.props.dispose_on.split(',');
      dispose_events.forEach((dispose_event) => eventHub.$on(dispose_event.trim(), self.dispose));
    }
  },

  beforeDestroy() {
    const self = this;
    const eventHub = MatestackUiCore.matestackEventHub;
    if (self.props.toggle_on !== undefined) {
      const toggle_events = self.props.toggle_on.split(',');
      toggle_events.forEach((toggle_event) => eventHub.$off(toggle_event.trim(), self.toggle));
    }
    if (self.props.show_on !== undefined) {
      const show_events = self.props.show_on.split(',');
      show_events.forEach((show_event) => eventHub.$off(show_event.trim(), self.show));
    }
    if (self.props.hide_on !== undefined) {
      const hide_events = self.props.hide_on.split(',');
      hide_events.forEach((hide_event) => eventHub.$off(hide_event.trim(), self.hide));
    }
    if (self.props.handle_update_on !== undefined) {
      const handle_update_events = self.props.handle_update_on.split(',');
      handle_update_events.forEach((handle_update_event) => eventHub.$off(handle_update_event.trim(), self.handle_update));
    }
    if (self.props.dispose_on !== undefined) {
      const dispose_events = self.props.dispose_on.split(',');
      dispose_events.forEach((dispose_event) => eventHub.$off(dispose_event.trim(), self.dispose));
    }
  },
});
