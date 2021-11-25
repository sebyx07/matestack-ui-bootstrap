import * as bootstrap from 'bootstrap';
import Vue from 'vue/dist/vue.esm';

import MatestackUiCore from 'matestack-ui-core';

Vue.component('matestack-ui-bootstrap-collapse', {
  mixins: [MatestackUiCore.componentMixin],
  data() {
    return {
      collapseInstance: undefined,
    };
  },

  methods: {
    toggle() {
      const self = this;
      self.collapseInstance.toggle();
    },
    show() {
      const self = this;
      self.collapseInstance.show();
    },
    hide() {
      const self = this;
      self.collapseInstance.hide();
    },
    dispose() {
      const self = this;
      self.collapseInstance.hide();
      self.collapseInstance.dispose();
      // ToDo: Error occurs after dispose when click on the button again
    },
  },

  mounted() {
    const self = this;
    const myCollapse = self.$el;
    self.collapseInstance = new bootstrap.Collapse(myCollapse, {
      toggle: false,
    });
  },

  created() {
    const self = this;

    // toggle_on event registration
    if (self.props.toggle_on !== undefined) {
      const toggle_events = self.props.toggle_on.split(',');
      toggle_events.forEach((toggle_event) => MatestackUiCore.matestackEventHub.$on(toggle_event.trim(), self.toggle));
    }
    // show_on event registration
    if (self.props.show_on !== undefined) {
      const show_events = self.props.show_on.split(',');
      show_events.forEach((show_event) => MatestackUiCore.matestackEventHub.$on(show_event.trim(), self.show));
    }
    // hide_on event registration
    if (self.props.hide_on !== undefined) {
      const hide_events = self.props.hide_on.split(',');
      hide_events.forEach((hide_event) => MatestackUiCore.matestackEventHub.$on(hide_event.trim(), self.hide));
    }
    // dispose_on event registration
    if (self.props.dispose_on !== undefined) {
      const dispose_events = self.props.dispose_on.split(',');
      dispose_events.forEach((dispose_event) => MatestackUiCore.matestackEventHub.$on(dispose_event.trim(), self.dispose));
    }
  },

  beforeDestroy() {
    let show_events;
    const self = this;
    if (self.props.toggle_on !== undefined) {
      show_events = self.props.toggle_on.split(',');
      show_events.forEach((show_event) => MatestackUiCore.matestackEventHub.$off(show_event.trim(), self.show));
    }
    if (self.props.show_on !== undefined) {
      show_events = self.props.show_on.split(',');
      show_events.forEach((show_event) => MatestackUiCore.matestackEventHub.$off(show_event.trim(), self.show));
    }
    if (self.props.hide_on !== undefined) {
      const hide_events = self.props.hide_on.split(',');
      hide_events.forEach((hide_event) => MatestackUiCore.matestackEventHub.$off(hide_event.trim(), self.hide));
    }
    if (self.props.dispose_on !== undefined) {
      const dispose_events = self.props.dispose_on.split(',');
      dispose_events.forEach((dispose_event) => MatestackUiCore.matestackEventHub.$off(dispose_event.trim(), self.dispose));
    }
  },
});
