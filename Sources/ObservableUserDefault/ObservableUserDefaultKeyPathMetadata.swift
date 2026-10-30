//
//  ObservableUserDefaultKeyPathMetadata.swift
//
//  Copyright © 2026 Rivia Corp s.r.o.
//

import Foundation

/// Metadata for a non-optional preference whose storage key belongs to the enclosing instance.
public struct ObservableUserDefaultKeyPathMetadata<Root, DefaultValue> {
    let key: KeyPath<Root, String>
    let defaultValue: DefaultValue
    let store: UserDefaults

    public init(key: KeyPath<Root, String>, defaultValue: DefaultValue, store: UserDefaults) {
        self.key = key
        self.defaultValue = defaultValue
        self.store = store
    }
}
