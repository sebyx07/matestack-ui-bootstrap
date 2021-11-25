(() => {
  var __create = Object.create;
  var __defProp = Object.defineProperty;
  var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
  var __getOwnPropNames = Object.getOwnPropertyNames;
  var __getProtoOf = Object.getPrototypeOf;
  var __hasOwnProp = Object.prototype.hasOwnProperty;
  var __markAsModule = (target) => __defProp(target, "__esModule", { value: true });
  var __require = /* @__PURE__ */ ((x) => typeof require !== "undefined" ? require : typeof Proxy !== "undefined" ? new Proxy(x, {
    get: (a, b) => (typeof require !== "undefined" ? require : a)[b]
  }) : x)(function(x) {
    if (typeof require !== "undefined")
      return require.apply(this, arguments);
    throw new Error('Dynamic require of "' + x + '" is not supported');
  });
  var __reExport = (target, module, desc) => {
    if (module && typeof module === "object" || typeof module === "function") {
      for (let key of __getOwnPropNames(module))
        if (!__hasOwnProp.call(target, key) && key !== "default")
          __defProp(target, key, { get: () => module[key], enumerable: !(desc = __getOwnPropDesc(module, key)) || desc.enumerable });
    }
    return target;
  };
  var __toModule = (module) => {
    return __reExport(__markAsModule(__defProp(module != null ? __create(__getProtoOf(module)) : {}, "default", module && module.__esModule && "default" in module ? { get: () => module.default, enumerable: true } : { value: module, enumerable: true })), module);
  };

  // lib/matestack/ui/bootstrap/index.js
  var import_bootstrap = __toModule(__require("bootstrap"));

  // lib/matestack/ui/bootstrap/components/alert.js
  var bootstrap = __toModule(__require("bootstrap"));
  var import_vue = __toModule(__require("vue/dist/vue.esm"));
  var import_matestack_ui_core = __toModule(__require("matestack-ui-core"));
  import_vue.default.component("matestack-ui-bootstrap-alert", {
    mixins: [import_matestack_ui_core.default.componentMixin],
    data() {
      return {
        alertInstance: void 0
      };
    },
    methods: {
      close: function() {
        this.alertInstance.close();
      },
      dispose: function() {
        this.alertInstance.dispose();
      }
    },
    mounted: function() {
      const self = this;
      var alert = self.$el;
      self.alertInstance = new bootstrap.Alert(alert);
    },
    created: function() {
      const self = this;
      if (self.props["close_on"] != void 0) {
        var close_events = self.props["close_on"].split(",");
        close_events.forEach((close_event) => import_matestack_ui_core.default.matestackEventHub.$on(close_event.trim(), self.close));
      }
      if (self.props["dispose_on"] != void 0) {
        var dispose_events = self.props["dispose_on"].split(",");
        dispose_events.forEach((dispose_event) => import_matestack_ui_core.default.matestackEventHub.$on(dispose_event.trim(), self.dispose));
      }
    },
    beforeDestroy: function() {
      const self = this;
      if (self.props["close_on"] != void 0) {
        var closen_events = self.props["close_on"].split(",");
        closen_events.forEach((close_event) => import_matestack_ui_core.default.matestackEventHub.$off(close_event.trim(), self.close));
      }
      if (self.props["dispose_on"] != void 0) {
        var dispose_events = self.props["dispose_on"].split(",");
        dispose_events.forEach((dispose_event) => import_matestack_ui_core.default.matestackEventHub.$off(dispose_event.trim(), self.dispose));
      }
    }
  });

  // lib/matestack/ui/bootstrap/components/carousel.js
  var bootstrap2 = __toModule(__require("bootstrap"));
  var import_vue2 = __toModule(__require("vue/dist/vue.esm"));
  var import_matestack_ui_core2 = __toModule(__require("matestack-ui-core"));
  import_vue2.default.component("matestack-ui-bootstrap-carousel", {
    mixins: [import_matestack_ui_core2.default.componentMixin],
    data() {
      return {
        carouselInstance: void 0
      };
    },
    methods: {
      cycle: function() {
        const self = this;
        self.carouselInstance.cycle();
      },
      pause: function() {
        const self = this;
        self.carouselInstance.pause();
      },
      prev: function() {
        const self = this;
        self.carouselInstance.prev();
      },
      next: function() {
        const self = this;
        self.carouselInstance.next();
      }
    },
    mounted: function() {
      const self = this;
      var myCarousel = self.$el;
      self.carouselInstance = new bootstrap2.Carousel(myCarousel, {
        interval: self.props["interval"] || 5e3
      });
    },
    created: function() {
      const self = this;
      if (self.props["cycle_on"] != void 0) {
        var cycle_events = self.props["cycle_on"].split(",");
        cycle_events.forEach((cycle_event) => import_matestack_ui_core2.default.matestackEventHub.$on(cycle_event.trim(), self.cycle));
      }
      if (self.props["pause_on"] != void 0) {
        var pause_events = self.props["pause_on"].split(",");
        pause_events.forEach((pause_event) => import_matestack_ui_core2.default.matestackEventHub.$on(pause_event.trim(), self.pause));
      }
      if (self.props["prev_on"] != void 0) {
        var prev_events = self.props["prev_on"].split(",");
        prev_events.forEach((prev_event) => import_matestack_ui_core2.default.matestackEventHub.$on(prev_event.trim(), self.prev));
      }
      if (self.props["next_on"] != void 0) {
        var next_events = self.props["next_on"].split(",");
        next_events.forEach((next_event) => import_matestack_ui_core2.default.matestackEventHub.$on(next_event.trim(), self.next));
      }
    },
    beforeDestroy: function() {
      const self = this;
      if (self.props["cycle_on"] != void 0) {
        var cycle_events = self.props["cycle_on"].split(",");
        cycle_events.forEach((cycle_event) => import_matestack_ui_core2.default.matestackEventHub.$off(cycle_event.trim(), self.cycle));
      }
      if (self.props["pause_on"] != void 0) {
        var pause_events = self.props["pause_on"].split(",");
        pause_events.forEach((pause_event) => import_matestack_ui_core2.default.matestackEventHub.$off(pause_event.trim(), self.pause));
      }
      if (self.props["prev_on"] != void 0) {
        var prev_events = self.props["prev_on"].split(",");
        prev_events.forEach((prev_event) => import_matestack_ui_core2.default.matestackEventHub.$off(prev_event.trim(), self.prev));
      }
      if (self.props["next_on"] != void 0) {
        var next_events = self.props["next_on"].split(",");
        next_events.forEach((next_event) => import_matestack_ui_core2.default.matestackEventHub.$off(next_event.trim(), self.next));
      }
    }
  });

  // lib/matestack/ui/bootstrap/components/collapse.js
  var bootstrap3 = __toModule(__require("bootstrap"));
  var import_vue3 = __toModule(__require("vue/dist/vue.esm"));
  var import_matestack_ui_core3 = __toModule(__require("matestack-ui-core"));
  import_vue3.default.component("matestack-ui-bootstrap-collapse", {
    mixins: [import_matestack_ui_core3.default.componentMixin],
    data() {
      return {
        collapseInstance: void 0
      };
    },
    methods: {
      toggle: function() {
        const self = this;
        self.collapseInstance.toggle();
      },
      show: function() {
        const self = this;
        self.collapseInstance.show();
      },
      hide: function() {
        const self = this;
        self.collapseInstance.hide();
      },
      dispose: function() {
        const self = this;
        self.collapseInstance.hide();
        self.collapseInstance.dispose();
      }
    },
    mounted: function() {
      const self = this;
      var myCollapse = self.$el;
      self.collapseInstance = new bootstrap3.Collapse(myCollapse, {
        toggle: false
      });
    },
    created: function() {
      const self = this;
      if (self.props["toggle_on"] != void 0) {
        var toggle_events = self.props["toggle_on"].split(",");
        toggle_events.forEach((toggle_event) => import_matestack_ui_core3.default.matestackEventHub.$on(toggle_event.trim(), self.toggle));
      }
      if (self.props["show_on"] != void 0) {
        var show_events = self.props["show_on"].split(",");
        show_events.forEach((show_event) => import_matestack_ui_core3.default.matestackEventHub.$on(show_event.trim(), self.show));
      }
      if (self.props["hide_on"] != void 0) {
        var hide_events = self.props["hide_on"].split(",");
        hide_events.forEach((hide_event) => import_matestack_ui_core3.default.matestackEventHub.$on(hide_event.trim(), self.hide));
      }
      if (self.props["dispose_on"] != void 0) {
        var dispose_events = self.props["dispose_on"].split(",");
        dispose_events.forEach((dispose_event) => import_matestack_ui_core3.default.matestackEventHub.$on(dispose_event.trim(), self.dispose));
      }
    },
    beforeDestroy: function() {
      const self = this;
      if (self.props["toggle_on"] != void 0) {
        var show_events = self.props["toggle_on"].split(",");
        show_events.forEach((show_event) => import_matestack_ui_core3.default.matestackEventHub.$off(show_event.trim(), self.show));
      }
      if (self.props["show_on"] != void 0) {
        var show_events = self.props["show_on"].split(",");
        show_events.forEach((show_event) => import_matestack_ui_core3.default.matestackEventHub.$off(show_event.trim(), self.show));
      }
      if (self.props["hide_on"] != void 0) {
        var hide_events = self.props["hide_on"].split(",");
        hide_events.forEach((hide_event) => import_matestack_ui_core3.default.matestackEventHub.$off(hide_event.trim(), self.hide));
      }
      if (self.props["dispose_on"] != void 0) {
        var dispose_events = self.props["dispose_on"].split(",");
        dispose_events.forEach((dispose_event) => import_matestack_ui_core3.default.matestackEventHub.$off(dispose_event.trim(), self.dispose));
      }
    }
  });

  // lib/matestack/ui/bootstrap/components/dropdown.js
  var bootstrap4 = __toModule(__require("bootstrap"));
  var import_vue4 = __toModule(__require("vue/dist/vue.esm"));
  var import_matestack_ui_core4 = __toModule(__require("matestack-ui-core"));
  import_vue4.default.component("matestack-ui-bootstrap-dropdown", {
    mixins: [import_matestack_ui_core4.default.componentMixin],
    data() {
      return {
        dropdownInstance: void 0
      };
    },
    mounted() {
    }
  });

  // lib/matestack/ui/bootstrap/components/modal.js
  var bootstrap5 = __toModule(__require("bootstrap"));
  var import_vue5 = __toModule(__require("vue/dist/vue.esm"));
  var import_matestack_ui_core5 = __toModule(__require("matestack-ui-core"));
  import_vue5.default.component("matestack-ui-bootstrap-modal", {
    mixins: [import_matestack_ui_core5.default.componentMixin],
    data() {
      return {
        modalInstance: void 0
      };
    },
    methods: {
      toggle: function() {
        this.modalInstance.toggle();
      },
      show: function() {
        this.modalInstance.show();
      },
      hide: function() {
        this.modalInstance.hide();
      },
      handleUpdate: function() {
        this.modalInstance.handleUpdate();
      },
      dispose: function() {
        this.modalInstance.dispose();
      }
    },
    mounted: function() {
      const self = this;
      var modal = self.$el;
      self.modalInstance = new bootstrap5.Modal(modal);
    },
    created: function() {
      const self = this;
      var eventHub = import_matestack_ui_core5.default.matestackEventHub;
      if (self.props["toggle_on"] != void 0) {
        var toggle_events = self.props["toggle_on"].split(",");
        toggle_events.forEach((toggle_event) => eventHub.$on(toggle_event.trim(), self.toggle));
      }
      if (self.props["show_on"] != void 0) {
        var show_events = self.props["show_on"].split(",");
        show_events.forEach((show_event) => eventHub.$on(show_event.trim(), self.show));
      }
      if (self.props["hide_on"] != void 0) {
        var hide_events = self.props["hide_on"].split(",");
        hide_events.forEach((hide_event) => eventHub.$on(hide_event.trim(), self.hide));
      }
      if (self.props["handle_update_on"] != void 0) {
        var handle_update_events = self.props["handle_update_on"].split(",");
        handle_update_events.forEach((handle_update_event) => eventHub.$on(handle_update_event.trim(), self.handle_update));
      }
      if (self.props["dispose_on"] != void 0) {
        var dispose_events = self.props["dispose_on"].split(",");
        dispose_events.forEach((dispose_event) => eventHub.$on(dispose_event.trim(), self.dispose));
      }
    },
    beforeDestroy: function() {
      const self = this;
      var eventHub = import_matestack_ui_core5.default.matestackEventHub;
      if (self.props["toggle_on"] != void 0) {
        var toggle_events = self.props["toggle_on"].split(",");
        toggle_events.forEach((toggle_event) => eventHub.$off(toggle_event.trim(), self.toggle));
      }
      if (self.props["show_on"] != void 0) {
        var show_events = self.props["show_on"].split(",");
        show_events.forEach((show_event) => eventHub.$off(show_event.trim(), self.show));
      }
      if (self.props["hide_on"] != void 0) {
        var hide_events = self.props["hide_on"].split(",");
        hide_events.forEach((hide_event) => eventHub.$off(hide_event.trim(), self.hide));
      }
      if (self.props["handle_update_on"] != void 0) {
        var handle_update_events = self.props["handle_update_on"].split(",");
        handle_update_events.forEach((handle_update_event) => eventHub.$off(handle_update_event.trim(), self.handle_update));
      }
      if (self.props["dispose_on"] != void 0) {
        var dispose_events = self.props["dispose_on"].split(",");
        dispose_events.forEach((dispose_event) => eventHub.$off(dispose_event.trim(), self.dispose));
      }
    }
  });

  // lib/matestack/ui/bootstrap/components/toast.js
  var bootstrap6 = __toModule(__require("bootstrap"));
  var import_vue6 = __toModule(__require("vue/dist/vue.esm"));
  var import_matestack_ui_core6 = __toModule(__require("matestack-ui-core"));
  import_vue6.default.component("matestack-ui-bootstrap-toast", {
    mixins: [import_matestack_ui_core6.default.componentMixin],
    data() {
      return {
        toastsInstance: void 0,
        eventData: {},
        showing: false
      };
    },
    methods: {
      show: function(event) {
        const self = this;
        if (this.props["autohide"]) {
          setTimeout(function() {
            self.showing = false;
          }, 5e3);
        }
        if (this.props["delay"]) {
          setTimeout(function() {
            self.showing = true;
          }, parseInt(self.props["delay"]));
        } else {
          self.showing = true;
        }
        this.eventData = event;
      },
      hide: function(event) {
        const self = this;
        this.showing = false;
        setTimeout(function() {
          self.eventData = false;
        }, 500);
      },
      dispose: function() {
        const self = this;
        self.toastsInstance.dispose();
        self.toastsInstance = new bootstrap6.Toast(self.$el);
      }
    },
    mounted: function() {
      const self = this;
      var myToasts = self.$el;
      self.toastsInstance = new bootstrap6.Toast(myToasts);
    },
    created: function() {
      const self = this;
      if (this.props["show_on"] != void 0) {
        var show_events = this.props["show_on"].split(",");
        show_events.forEach((show_event) => import_matestack_ui_core6.default.matestackEventHub.$on(show_event.trim(), self.show));
      }
      if (this.props["hide_on"] != void 0) {
        var show_events = this.props["hide_on"].split(",");
        show_events.forEach((show_event) => import_matestack_ui_core6.default.matestackEventHub.$on(show_event.trim(), self.hide));
      }
      if (this.props["dispose_on"] != void 0) {
        var show_events = this.props["dispose_on"].split(",");
        show_events.forEach((show_event) => import_matestack_ui_core6.default.matestackEventHub.$on(show_event.trim(), self.dispose));
      }
    },
    beforeDestroy: function() {
      const self = this;
      import_matestack_ui_core6.default.matestackEventHub.$off(this.props["show_on"], self.show);
      import_matestack_ui_core6.default.matestackEventHub.$off(this.props["hide_on"], self.hide);
      import_matestack_ui_core6.default.matestackEventHub.$off(this.props["dispose_on"], self.hide);
      if (this.props["show_on"] != void 0) {
        var shown_events = this.props["show_on"].split(",");
        shown_events.forEach((show_event) => import_matestack_ui_core6.default.matestackEventHub.$off(show_event.trim(), self.show));
      }
      if (this.props["hide_on"] != void 0) {
        var hiden_events = this.props["hide_on"].split(",");
        hiden_events.forEach((hide_event) => import_matestack_ui_core6.default.matestackEventHub.$off(hide_event.trim(), self.hide));
      }
      if (this.props["dispose_on"] != void 0) {
        var hiden_events = this.props["dispose_on"].split(",");
        hiden_events.forEach((hide_event) => import_matestack_ui_core6.default.matestackEventHub.$off(hide_event.trim(), self.dispose));
      }
    }
  });

  // lib/matestack/ui/bootstrap/components/popover.js
  var bootstrap7 = __toModule(__require("bootstrap"));
  var import_vue7 = __toModule(__require("vue/dist/vue.esm"));
  var import_matestack_ui_core7 = __toModule(__require("matestack-ui-core"));
  import_vue7.default.component("matestack-ui-bootstrap-popover", {
    mixins: [import_matestack_ui_core7.default.componentMixin],
    data() {
      return {
        popoverInstance: void 0
      };
    },
    methods: {},
    mounted: function() {
      const self = this;
      var popover = self.$el;
      self.popoverInstance = new bootstrap7.Popover(popover, {});
    },
    created: function() {
    },
    beforeDestroy: function() {
    }
  });

  // lib/matestack/ui/bootstrap/components/tooltip.js
  var bootstrap8 = __toModule(__require("bootstrap"));
  var import_vue8 = __toModule(__require("vue/dist/vue.esm"));
  var import_matestack_ui_core8 = __toModule(__require("matestack-ui-core"));
  import_vue8.default.component("matestack-ui-bootstrap-tooltip", {
    mixins: [import_matestack_ui_core8.default.componentMixin],
    data() {
      return {};
    },
    methods: {},
    mounted: function() {
      const self = this;
      var tooltip = self.$el;
      self.tooltipInstance = new bootstrap8.Tooltip(tooltip);
    }
  });

  // lib/matestack/ui/bootstrap/layout/sidebar.js
  var bootstrap9 = __toModule(__require("bootstrap"));
  var import_vue9 = __toModule(__require("vue/dist/vue.esm"));
  var import_matestack_ui_core9 = __toModule(__require("matestack-ui-core"));
  import_vue9.default.component("matestack-ui-bootstrap-sidebar", {
    mixins: [import_matestack_ui_core9.default.componentMixin],
    data() {
      return {
        sidebarOpen: false
      };
    },
    methods: {
      sidebarToggle: function() {
        var sidebarElement = document.getElementById("sidebar");
        if (sidebarElement.classList.contains("closed")) {
          this.openSideBar();
        } else {
          this.closeSideBar();
        }
      },
      openSideBar: function() {
        var sidebarElement = document.getElementById("sidebar");
        var contentElement = document.getElementById("content");
        this.sidebarOpen = true;
        sidebarElement.classList.remove("closed");
        sidebarElement.classList.add("open");
        contentElement.classList.add("sidebar-open");
      },
      closeSideBar: function() {
        var sidebarElement = document.getElementById("sidebar");
        var contentElement = document.getElementById("content");
        this.sidebarOpen = false;
        sidebarElement.classList.add("closed");
        sidebarElement.classList.remove("open");
        contentElement.classList.remove("sidebar-open");
      },
      resizeCallback: function() {
        if (window.innerWidth <= 992) {
          this.closeSideBar();
        } else {
          this.openSideBar();
        }
      }
    },
    mounted: function() {
      if (window.innerWidth <= 992) {
        this.sidebarOpen = true;
      }
      window.addEventListener("resize", this.resizeCallback);
      var self = this;
      import_matestack_ui_core9.default.matestackEventHub.$on("page_loaded", function() {
        if (window.innerWidth <= 992) {
          self.closeSideBar();
        }
      });
      import_matestack_ui_core9.default.matestackEventHub.$on("page_loading_triggered", function() {
        if (window.innerWidth <= 992) {
          self.closeSideBar();
        }
      });
    }
  });

  // lib/matestack/ui/bootstrap/index.js
  var MatestackUiBootstrap = {};
  window.MatestackUiBootstrap = MatestackUiBootstrap;
  var bootstrap_default = MatestackUiBootstrap;
})();
