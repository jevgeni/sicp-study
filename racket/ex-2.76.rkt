#lang racket

; 1. generic op with explicit dispatch. 
; to add new op: one need to add new operation with support for all types
; to add new type: one need to modify all exisiting operations to add new type there
; 2. data-driven dispatch
; to add new op: one need to modify all packages for all types
; to add new type: one need to create new package
; 3. message passing
; to add new op: one need to modify all type creation operations
; to add new type: one need to create new type creation operation.

; if there are coming much more new op in the system, I would use generic op with explicit dispatch.
; if there are coming much more new types in the sytem, I would use the message passing or data-driven dispatch. Probably, would prefer data-driven dispatch as it may simplify the integration with existing codebase.