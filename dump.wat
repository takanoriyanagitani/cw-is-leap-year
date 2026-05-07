(module
  (type (;0;) (func (param i32) (result i32)))
  (memory (;0;) 16)
  (global (;0;) (mut i32) i32.const 1048576)
  (export "memory" (memory 0))
  (export "isleap" (func 0))
  (func (;0;) (type 0) (param i32) (result i32)
    (local i32)
    i32.const 0
    local.set 1
    block ;; label = @1
      local.get 0
      i32.const 3
      i32.and
      br_if 0 (;@1;)
      local.get 0
      i32.const 100
      i32.rem_u
      i32.const 0
      i32.ne
      local.get 0
      i32.const 400
      i32.rem_u
      i32.eqz
      i32.or
      local.set 1
    end
    local.get 1
  )
)
