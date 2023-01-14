#if os(macOS)
    import AppKit

    open class PluggableApplicationDelegate: NSObject, ApplicationDelegate {
        open var applicationServices: [ApplicationService] { return [] }
        internal lazy var __applicationServices: [ApplicationService] = self.applicationServices

        public func applicationWillFinishLaunching(_ notification: Notification) {
            __applicationServices.forEach {
                $0.applicationWillFinishLaunching?(notification)
            }
        }

        public func applicationDidFinishLaunching(_ notification: Notification) {
            __applicationServices.forEach {
                $0.applicationDidFinishLaunching?(notification)
            }
        }

        public func applicationWillTerminate(_ notification: Notification) {
            __applicationServices.forEach {
                $0.applicationWillTerminate?(notification)
            }
        }

        public func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
            var result = false
            __applicationServices.forEach {
                if $0.applicationSupportsSecureRestorableState?(app) ?? false {
                    result = true
                }
            }
            return result
        }

        public func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
            var result = false
            __applicationServices.forEach {
                if $0.applicationShouldHandleReopen?(sender, hasVisibleWindows: flag) ?? false {
                    result = true
                }
            }
            return result
        }

        public func application(_ application: NSApplication, open urls: [URL]) {
            __applicationServices.forEach {
                $0.application?(application, open: urls)
            }
        }

        public func application(_ sender: NSApplication, openFile filename: String) -> Bool {
            var result = false
            __applicationServices.forEach {
                if $0.application?(sender, openFile: filename) ?? false {
                    result = true
                }
            }
            return result
        }

        public func application(_ sender: NSApplication, openFiles filenames: [String]) {
            __applicationServices.forEach {
                $0.application?(sender, openFiles: filenames)
            }
        }

        public func application(_ sender: Any, openFileWithoutUI filename: String) -> Bool {
            var result = false
            __applicationServices.forEach {
                if $0.application?(sender, openFileWithoutUI: filename) ?? false {
                    result = true
                }
            }
            return result
        }

        public func application(
            _ application: NSApplication,
            didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
        ) {
            __applicationServices.forEach {
                $0.application?(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
            }
        }

        public func application(
            _ application: NSApplication,
            continue userActivity: NSUserActivity,
            restorationHandler: @escaping ([NSUserActivityRestoring]) -> Void
        ) -> Bool {
            var result = false
            __applicationServices.forEach {
                let r = $0.application?(
                    application,
                    continue: userActivity,
                    restorationHandler: restorationHandler
                ) ?? false

                if r {
                    result = true
                }
            }
            return result
        }

        public func application(_ app: NSApplication, willEncodeRestorableState coder: NSCoder) {
            __applicationServices.forEach {
                $0.application?(app, willEncodeRestorableState: coder)
            }
        }

        public func application(_ app: NSApplication, didDecodeRestorableState coder: NSCoder) {
            __applicationServices.forEach {
                $0.application?(app, didDecodeRestorableState: coder)
            }
        }
    }
#endif
