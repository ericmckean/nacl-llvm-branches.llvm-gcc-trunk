/* Definitions for Unix assembler syntax for the Intel 80386.
   Copyright (C) 1988, 1994, 1999, 2000, 2001, 2002 Free Software Foundation, Inc.

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2, or (at your option)
any later version.

GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with GCC; see the file COPYING.  If not, write to
the Free Software Foundation, 51 Franklin Street, Fifth Floor,
Boston, MA 02110-1301, USA.  */

/* This file defines the aspects of assembler syntax
   that are the same for all the i386 Unix systems
   (though they may differ in non-Unix systems).  */

/* Define macro used to output shift-double opcodes when the shift
   count is in %cl.  Some assemblers require %cl as an argument;
   some don't.  This macro controls what to do: by default, don't
   print %cl.  */
#define SHIFT_DOUBLE_OMITS_COUNT 1

/* Define the syntax of pseudo-ops, labels and comments.  */

/* String containing the assembler's comment-starter.  */

#define ASM_COMMENT_START "/"

/* Output to assembler file text saying following lines
   may contain character constants, extra white space, comments, etc.  */

#define ASM_APP_ON "/APP\n"

/* Output to assembler file text saying following lines
   no longer contain unusual constructs.  */

#define ASM_APP_OFF "/NO_APP\n"

/* Output before read-only data.  */

#define TEXT_SECTION_ASM_OP "\t.text"

/* Output before writable (initialized) data.  */

#define DATA_SECTION_ASM_OP "\t.data"

/* Output before writable (uninitialized) data.  */

#define BSS_SECTION_ASM_OP "\t.bss"

/* Globalizing directive for a label.  */
#define GLOBAL_ASM_OP ".globl "

/* By default, target has a 80387, uses IEEE compatible arithmetic,
   and returns float values in the 387.  */
/* LLVM LOCAL begin mainline */
#define TARGET_SUBTARGET_DEFAULT \
	(MASK_80387 | MASK_IEEE_FP | MASK_FLOAT_RETURNS)

// @LOCALMOD-BEGIN: Added MASK_ALIGN_DOUBLE for X86-32.
#undef TARGET_SUBTARGET32_DEFAULT
#define TARGET_SUBTARGET32_DEFAULT \
	(MASK_ALIGN_DOUBLE)
// @LOCALMOD-END

/* By default, 64-bit mode uses 128-bit long double.  */
#undef TARGET_SUBTARGET64_DEFAULT
#define TARGET_SUBTARGET64_DEFAULT \
	MASK_128BIT_LONG_DOUBLE
/* LLVM LOCAL end mainline */
