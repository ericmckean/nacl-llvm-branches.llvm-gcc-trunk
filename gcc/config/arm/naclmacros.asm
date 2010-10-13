@LOCALMOD_START - NativeClient SFI macros
  .macro sfi_long_based_on_pos p0 p1 p2 p3 val
	.set pos, (. - XmagicX) % 16
	.fill  (((\p3<<12)|(\p2<<8)|(\p1<<4)|\p0)>>pos) & 15, 4, \val
	.endm


  .macro sfi_new_bundle
  .align 4
  .endm

	.macro sfi_illegal_if_at_bundle_begining
	sfi_long_based_on_pos 1 0 0 0 0xe1277777
	.endm


	.macro sfi_nop_if_at_bundle_end
	sfi_long_based_on_pos 0 0 0 1 0xe1a00000
	.endm


	.macro sfi_nops_to_force_slot3
	sfi_long_based_on_pos 3 2 1 0 0xe1a00000
	.endm


	.macro sfi_nops_to_force_slot2
	sfi_long_based_on_pos 2 1 0 3 0xe1a00000
	.endm


	.macro sfi_nops_to_force_slot1
	sfi_long_based_on_pos 1 0 3 2 0xe1a00000
	.endm


 @ ========================================
	.macro sfi_data_mask reg cond
	bic\cond \reg, \reg, #0xc0000000
	.endm


	.macro sfi_code_mask reg cond=
	bic\cond \reg, \reg, #0xf000000f
	.endm


 @ ========================================
	.macro sfi_call_preamble
	sfi_nops_to_force_slot3
	.endm


	.macro sfi_return_alignment_and_code_mask reg cond=
	sfi_nop_if_at_bundle_end
	sfi_code_mask \reg \cond
	.endm


 @ ========================================
	.macro sfi_store_preamble reg cond
	.if \reg != sp
	sfi_nop_if_at_bundle_end
	sfi_data_mask \reg, \cond
	.endif
	.endm


 @ ========================================
	.macro sfi_add rega regb imm rot=0
	sfi_nop_if_at_bundle_end
	add \rega, \regb, \imm, \rot
	sfi_data_mask \rega
	.endm


	.macro sfi_addeq rega regb imm rot=0
	sfi_nop_if_at_bundle_end
	addeq \rega, \regb, \imm, \rot
	sfi_data_mask \rega, eq
	.endm


	.macro sfi_addne rega regb imm rot=0
	sfi_nop_if_at_bundle_end
	addne \rega, \regb, \imm, \rot
	sfi_data_mask \rega, ne
	.endm


	.macro sfi_addlt rega regb imm rot=0
	sfi_nop_if_at_bundle_end
	addlt \rega, \regb, \imm, \rot
	sfi_data_mask \rega, lt
	.endm


	.macro sfi_addle rega regb imm rot=0
	sfi_nop_if_at_bundle_end
	addle \rega, \regb, \imm, \rot
	sfi_data_mask \rega, le
	.endm


	.macro sfi_addls rega regb imm rot=0
	sfi_nop_if_at_bundle_end
	addls \rega, \regb, \imm, \rot
	sfi_data_mask \rega, ls
	.endm


	.macro sfi_addge rega regb imm rot=0
	sfi_nop_if_at_bundle_end
	addge \rega, \regb, \imm, \rot
	sfi_data_mask \rega, ge
	.endm


	.macro sfi_addgt rega regb imm rot=0
	sfi_nop_if_at_bundle_end
	addgt \rega, \regb, \imm, \rot
	sfi_data_mask \rega, gt
	.endm


	.macro sfi_addhs rega regb imm rot=0
	sfi_nop_if_at_bundle_end
	addhs \rega, \regb, \imm, \rot
	sfi_data_mask \rega, hs
	.endm


	.macro sfi_addhi rega regb imm rot=0
	sfi_nop_if_at_bundle_end
	addhi \rega, \regb, \imm, \rot
	sfi_data_mask \rega, hi
	.endm


	.macro sfi_addlo rega regb imm rot=0
	sfi_nop_if_at_bundle_end
	addlo \rega, \regb, \imm, \rot
	sfi_data_mask \rega, lo
	.endm


 @ ========================================
	.macro sfi_sub rega regb imm rot=0
	sfi_nop_if_at_bundle_end
	sub \rega, \regb, \imm, \rot
	sfi_data_mask \rega
	.endm


	.macro sfi_subeq rega regb imm rot=0
	sfi_nop_if_at_bundle_end
	subeq \rega, \regb, \imm, \rot
	sfi_data_mask \rega, eq
	.endm


	.macro sfi_subne rega regb imm rot=0
	sfi_nop_if_at_bundle_end
	subne \rega, \regb, \imm, \rot
	sfi_data_mask \rega, ne
	.endm


	.macro sfi_sublt rega regb imm rot=0
	sfi_nop_if_at_bundle_end
	sublt \rega, \regb, \imm, \rot
	sfi_data_mask \rega, lt
	.endm


	.macro sfi_suble rega regb imm rot=0
	sfi_nop_if_at_bundle_end
	suble \rega, \regb, \imm, \rot
	sfi_data_mask \rega, le
	.endm


	.macro sfi_subls rega regb imm rot=0
	sfi_nop_if_at_bundle_end
	subls \rega, \regb, \imm, \rot
	sfi_data_mask \rega, ls
	.endm


	.macro sfi_subge rega regb imm rot=0
	sfi_nop_if_at_bundle_end
	subge \rega, \regb, \imm, \rot
	sfi_data_mask \rega, ge
	.endm


	.macro sfi_subgt rega regb imm rot=0
	sfi_nop_if_at_bundle_end
	subgt \rega, \regb, \imm, \rot
	sfi_data_mask \rega, gt
	.endm


	.macro sfi_subhs rega regb imm rot=0
	sfi_nop_if_at_bundle_end
	subhs \rega, \regb, \imm, \rot
	sfi_data_mask \rega, hs
	.endm


	.macro sfi_subhi rega regb imm rot=0
	sfi_nop_if_at_bundle_end
	subhi \rega, \regb, \imm, \rot
	sfi_data_mask \rega, hi
	.endm


	.macro sfi_sublo rega regb imm rot=0
	sfi_nop_if_at_bundle_end
	sublo \rega, \regb, \imm, \rot
	sfi_data_mask \rega, lo
	.endm


 @ ========================================
	.macro sfi_mov rega regb
	sfi_nop_if_at_bundle_end
	mov \rega, \regb
	sfi_data_mask \rega
	.endm


	.macro mov_subeq rega regb imm rot=0
	sfi_nop_if_at_bundle_end
	moveq \rega, \regb, \imm, \rot
	sfi_data_mask \rega, eq
	.endm


	.macro mov_subne rega regb imm rot=0
	sfi_nop_if_at_bundle_end
	movne \rega, \regb, \imm, \rot
	sfi_data_mask \rega, ne
	.endm


	.macro mov_sublt rega regb imm rot=0
	sfi_nop_if_at_bundle_end
	movlt \rega, \regb, \imm, \rot
	sfi_data_mask \rega, lt
	.endm


	.macro mov_suble rega regb imm rot=0
	sfi_nop_if_at_bundle_end
	movle \rega, \regb, \imm, \rot
	sfi_data_mask \rega, le
	.endm


	.macro mov_subls rega regb imm rot=0
	sfi_nop_if_at_bundle_end
	movls \rega, \regb, \imm, \rot
	sfi_data_mask \rega, ls
	.endm


	.macro mov_subge rega regb imm rot=0
	sfi_nop_if_at_bundle_end
	movge \rega, \regb, \imm, \rot
	sfi_data_mask \rega, ge
	.endm


	.macro mov_subgt rega regb imm rot=0
	sfi_nop_if_at_bundle_end
	movgt \rega, \regb, \imm, \rot
	sfi_data_mask \rega, gt
	.endm


	.macro mov_subhs rega regb imm rot=0
	sfi_nop_if_at_bundle_end
	movhs \rega, \regb, \imm, \rot
	sfi_data_mask \rega, hs
	.endm


	.macro mov_subhi rega regb imm rot=0
	sfi_nop_if_at_bundle_end
	movhi \rega, \regb, \imm, \rot
	sfi_data_mask \rega, hi
	.endm


	.macro mov_sublo rega regb imm rot=0
	sfi_nop_if_at_bundle_end
	movlo \rega, \regb, \imm, \rot
	sfi_data_mask \rega, lo
	.endm


 @ ========================================
	.macro sfi_bx link
	sfi_return_alignment_and_code_mask \link
	bx \link
	.endm


	.macro sfi_bxeq link
	sfi_return_alignment_and_code_mask \link eq
	bxeq \link
	.endm


	.macro sfi_bxne link
	sfi_return_alignment_and_code_mask \link ne
	bxne \link
	.endm


	.macro sfi_bxlt link
	sfi_return_alignment_and_code_mask \link lt
	bxlt \link
	.endm


	.macro sfi_bxle link
	sfi_return_alignment_and_code_mask \link le
	bxle \link
	.endm


	.macro sfi_bxls link
	sfi_return_alignment_and_code_mask \link ls
	bxls \link
	.endm


	.macro sfi_bxge link
	sfi_return_alignment_and_code_mask \link ge
	bxge \link
	.endm


	.macro sfi_bxgt link
	sfi_return_alignment_and_code_mask \link gt
	bxgt \link
	.endm


	.macro sfi_bxhs link
	sfi_return_alignment_and_code_mask \link hs
	bxhs \link
	.endm


	.macro sfi_bxhi link
	sfi_return_alignment_and_code_mask \link hi
	bxhi \link
	.endm


	.macro sfi_bxlo link
	sfi_return_alignment_and_code_mask \link lo
	bxlo \link
	.endm

	.macro sfi_bxcc link
	sfi_return_alignment_and_code_mask \link lo
	bxcc \link
	.endm


 @ ========================================
	.macro sfi_indirect_jump_preamble link
	sfi_nop_if_at_bundle_end
	sfi_code_mask \link
	.endm


	.macro sfi_indirect_call_preamble link
	sfi_nops_to_force_slot2
	sfi_code_mask \link
  .endm
@LOCALMOD_END

.align 4
XmagicX:

#define NACL_HALT         bkpt 0x6666

