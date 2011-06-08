#ifndef PNACL_UNWIND_H
#define PNACL_UNWIND_H

/*
 * NOTE: this value is insanely high and may cause issues if the stack is
 * too small as arrays of length PNACL_MAX_DWARF_FRAME_REGISTERS
 * are created on the stack by various unwind functions.
 */

/* NOTE: On itanium this value is 334 */
#define PNACL_MAX_DWARF_FRAME_REGISTERS 512
#ifdef DWARF_FRAME_REGISTERS
#undef DWARF_FRAME_REGISTERS
#endif

/* hijack gcc's __builtin_dwarf_sp_column */
#define __builtin_dwarf_sp_column() pnacl_unwind_dwarf_sp_column()

/* hijack gcc's DWARF_FRAME_REGISTERS but only where syntactically possible
   other places use PNACL_MAX_DWARF_FRAME_REGISTERS */
#define  DWARF_FRAME_REGISTERS pnacl_unwind_dwarf_frame_registers()

/* define in native_client/src/untrusted/stubs/unwind_support.c */
extern int pnacl_unwind_dwarf_sp_column();
extern int pnacl_unwind_result0_reg();
extern int pnacl_unwind_result1_reg();
extern int pnacl_unwind_dwarf_frame_registers();
extern int pnacl_unwind_init_dwarf_reg_size_table();

#endif /* PNACL_UNWIND_H */
