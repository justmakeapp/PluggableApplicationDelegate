#if os(macOS)
    import AppKit

    open class PluggableApplicationDelegate: NSObject, ApplicationDelegate {
        open var applicationServices: [ApplicationService] { return [] }
        lazy var __applicationServices: [ApplicationService] = self.applicationServices

        public func applicationWillFinishLaunching(_ notification: Notification) {
            for __applicationService in __applicationServices {
                __applicationService.applicationWillFinishLaunching?(notification)
            }
        }

        public func applicationDidFinishLaunching(_ notification: Notification) {
            for __applicationService in __applicationServices {
                __applicationService.applicationDidFinishLaunching?(notification)
            }
        }

        public func applicationWillTerminate(_ notification: Notification) {
            for __applicationService in __applicationServices {
                __applicationService.applicationWillTerminate?(notification)
            }
        }

        public func applicationShouldTerminate(_ sender: NSApplication) -> NSApplication.TerminateReply {
            var finalResult: NSApplication.TerminateReply = .terminateNow
            for __applicationService in __applicationServices {
                if let result = __applicationService.applicationShouldTerminate?(sender) {
                    switch result {
                    case .terminateCancel:
                        finalResult = .terminateCancel
                    case .terminateLater:
                        if finalResult == .terminateNow {
                            finalResult = .terminateLater
                        }

                    case .terminateNow:
                        break
                    @unknown default:
                        break
                    }
                }
            }
            return finalResult
        }

        public func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
            var result = false
            for __applicationService in __applicationServices {
                if __applicationService.applicationShouldTerminateAfterLastWindowClosed?(sender) ?? false {
                    result = true
                }
            }
            return result
        }

        public func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
            var result = false
            for __applicationService in __applicationServices {
                if __applicationService.applicationSupportsSecureRestorableState?(app) ?? false {
                    result = true
                }
            }
            return result
        }

        public func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
            var result = false
            for __applicationService in __applicationServices {
                if __applicationService.applicationShouldHandleReopen?(sender, hasVisibleWindows: flag) ?? false {
                    result = true
                }
            }
            return result
        }

        public func application(_ application: NSApplication, open urls: [URL]) {
            for __applicationService in __applicationServices {
                __applicationService.application?(application, open: urls)
            }
        }

        public func application(_ sender: NSApplication, openFile filename: String) -> Bool {
            var result = false
            for __applicationService in __applicationServices {
                if __applicationService.application?(sender, openFile: filename) ?? false {
                    result = true
                }
            }
            return result
        }

        public func application(_ sender: NSApplication, openFiles filenames: [String]) {
            for __applicationService in __applicationServices {
                __applicationService.application?(sender, openFiles: filenames)
            }
        }

        public func application(_ sender: Any, openFileWithoutUI filename: String) -> Bool {
            var result = false
            for __applicationService in __applicationServices {
                if __applicationService.application?(sender, openFileWithoutUI: filename) ?? false {
                    result = true
                }
            }
            return result
        }

        public func application(
            _ application: NSApplication,
            didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
        ) {
            for __applicationService in __applicationServices {
                __applicationService.application?(
                    application,
                    didRegisterForRemoteNotificationsWithDeviceToken: deviceToken
                )
            }
        }

        public func application(
            _ application: NSApplication,
            continue userActivity: NSUserActivity,
            restorationHandler: @escaping ([NSUserActivityRestoring]) -> Void
        ) -> Bool {
            var result = false
            for __applicationService in __applicationServices {
                let r = __applicationService.application?(
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
            for __applicationService in __applicationServices {
                __applicationService.application?(app, willEncodeRestorableState: coder)
            }
        }

        public func application(_ app: NSApplication, didDecodeRestorableState coder: NSCoder) {
            for __applicationService in __applicationServices {
                __applicationService.application?(app, didDecodeRestorableState: coder)
            }
        }
    }
#endif
