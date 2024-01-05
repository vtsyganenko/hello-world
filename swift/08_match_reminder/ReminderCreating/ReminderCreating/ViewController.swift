//
//  ViewController.swift
//  ReminderCreating
//
//  Created by Виталий Цыганенко on 17.10.2023.
//

import UIKit

import EventKit

class ViewController: UIViewController {
    
    @IBOutlet var accessToCalendarLabel: UILabel!
    @IBOutlet var accessToRemindersLabel: UILabel!
    
    @IBOutlet var simpleReminderTextField: UITextField!
    
    
    let database = EKEventStore()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.accessToCalendarLabel.text = getDescription(EKEventStore.authorizationStatus(for: .event))
        self.accessToRemindersLabel.text = getDescription(EKEventStore.authorizationStatus(for: .reminder))
    }
    
    func getDescription(_ status:EKAuthorizationStatus) -> String {
        switch status {
        case .notDetermined:
            return "notDetermined"
        case .restricted:
            return "restricted"
        case .denied:
            return "denied"
        case .authorized:
            return "authorized"
        default:
            return "unknown"
        }
    }
    
    @IBAction func requestAccessToCalendarButtonTouch() {
        // Info.plist
        // “Privacy — Calendars Usage Description”
        self.database.requestAccess(to: .event, completion: requestAccessToCalendarHandler(granted:error:))
    }
    
    func requestAccessToCalendarHandler(granted: Bool, error: Error?) {
        if let error = error {
            print("access to calendar error:", error)
        } else {
            print("access to calendar \(granted ? "is" : "is not") granted")
            DispatchQueue.main.async {
                self.accessToCalendarLabel.text = self.getDescription(EKEventStore.authorizationStatus(for: .event))
            }
        }
    }
    
    @IBAction func requestAccessToRemindersButtonTouch() {
        // Info.plist
        // “Privacy — Reminders Usage Description”
        self.database.requestAccess(to: .reminder, completion: requestAccessToRemindersHandler(granted:error:))
    }
    
    func requestAccessToRemindersHandler(granted: Bool, error: Error?) {
        if let error = error {
            print("access to reminders error:", error)
        } else {
            print("access to reminders \(granted ? "is" : "is not") granted")
            DispatchQueue.main.async {
                self.accessToRemindersLabel.text = self.getDescription(EKEventStore.authorizationStatus(for: .reminder))
            }
        }
    }
    
    @IBAction func createSimpleReminderWithoutDateButtonTouch() {
        let calendar = self.database.defaultCalendarForNewReminders()
        let reminder = EKReminder(eventStore: self.database)
        
        reminder.title = simpleReminderTextField.text
        reminder.calendar = calendar
        
        do {
            try self.database.save(reminder, commit: true)
        } catch {
            print("createSimpleReminderWithoutDateButtonTouch error with saving to db: \(error)")
        }
    }
    
    @IBAction func createSimpleReminderForTomorrowButtonTouch() {
        let calendar = self.database.defaultCalendarForNewReminders()
        let reminder = EKReminder(eventStore: self.database)
        
        reminder.title = simpleReminderTextField.text
        reminder.calendar = calendar
        
        let gregorian = Calendar(identifier: .gregorian)
        
        let tomorrow = gregorian.date(byAdding: DateComponents(day:1), to: Date())
        
        let components : Set<Calendar.Component> = [.year, .month, .day]
        
        reminder.dueDateComponents = gregorian.dateComponents(components, from: tomorrow!)
        
        do {
            try self.database.save(reminder, commit: true)
        } catch {
            print("createSimpleReminderForTomorrowButtonTouch error with saving to db: \(error)")
        }
    }
    
    
}

