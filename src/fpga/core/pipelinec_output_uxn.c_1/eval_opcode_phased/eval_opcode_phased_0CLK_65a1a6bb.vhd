-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 371
entity eval_opcode_phased_0CLK_65a1a6bb is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out eval_opcode_result_t);
end eval_opcode_phased_0CLK_65a1a6bb;
architecture arch of eval_opcode_phased_0CLK_65a1a6bb is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal sp0 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal sp1 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal ins_a_3f : unsigned(7 downto 0) := to_unsigned(0, 8);
signal opc : unsigned(7 downto 0) := to_unsigned(0, 8);
signal stack_index : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_wait : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_imm : unsigned(0 downto 0) := to_unsigned(0, 1);
signal stack_address : unsigned(8 downto 0) := to_unsigned(0, 9);
signal previous_stack_read : unsigned(7 downto 0) := to_unsigned(0, 8);
signal opc_result : opcode_result_t := (
is_pc_updated => to_unsigned(0, 1),
is_stack_index_flipped => to_unsigned(0, 1),
sp_relative_shift => to_signed(0, 4),
is_stack_write => to_unsigned(0, 1),
stack_address_sp_offset => to_unsigned(0, 4),
is_ram_write => to_unsigned(0, 1),
is_device_ram_write => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
u8_value => to_unsigned(0, 8),
u16_value => to_unsigned(0, 16),
is_opc_done => to_unsigned(0, 1))
;
signal opc_eval_result : eval_opcode_result_t := (
is_waiting => to_unsigned(0, 1),
is_pc_updated => to_unsigned(0, 1),
is_ram_write => to_unsigned(0, 1),
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
is_device_ram_write => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
u8_value => to_unsigned(0, 8),
u16_value => to_unsigned(0, 16),
is_opc_done => to_unsigned(0, 1))
;
signal REG_COMB_sp0 : unsigned(7 downto 0);
signal REG_COMB_sp1 : unsigned(7 downto 0);
signal REG_COMB_ins_a_3f : unsigned(7 downto 0);
signal REG_COMB_opc : unsigned(7 downto 0);
signal REG_COMB_stack_index : unsigned(0 downto 0);
signal REG_COMB_is_wait : unsigned(0 downto 0);
signal REG_COMB_is_imm : unsigned(0 downto 0);
signal REG_COMB_stack_address : unsigned(8 downto 0);
signal REG_COMB_previous_stack_read : unsigned(7 downto 0);
signal REG_COMB_opc_result : opcode_result_t;
signal REG_COMB_opc_eval_result : eval_opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_AND[uxn_opcodes_h_l2863_c14_05db]
signal BIN_OP_AND_uxn_opcodes_h_l2863_c14_05db_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2863_c14_05db_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2863_c14_05db_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2864_c14_5f5d]
signal BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5f5d_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5f5d_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5f5d_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2864_c14_2a91]
signal BIN_OP_OR_uxn_opcodes_h_l2864_c14_2a91_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2864_c14_2a91_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2864_c14_2a91_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l2864_c14_8de6]
signal UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_8de6_expr : unsigned(7 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_8de6_return_output : unsigned(7 downto 0);

-- BIN_OP_NEQ[uxn_opcodes_h_l2864_c14_0259]
signal BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_0259_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_0259_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_0259_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2864_c14_f4d0]
signal MUX_uxn_opcodes_h_l2864_c14_f4d0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2864_c14_f4d0_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2864_c14_f4d0_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2864_c14_f4d0_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2865_c8_d3a5]
signal MUX_uxn_opcodes_h_l2865_c8_d3a5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2865_c8_d3a5_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2865_c8_d3a5_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2871_c6_82b7]
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c6_82b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c6_82b7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c6_82b7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2872_c7_bbf6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_bbf6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_bbf6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_bbf6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_bbf6_return_output : unsigned(0 downto 0);

-- is_wait_MUX[uxn_opcodes_h_l2871_c2_ccbf]
signal is_wait_MUX_uxn_opcodes_h_l2871_c2_ccbf_cond : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2871_c2_ccbf_iftrue : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2871_c2_ccbf_iffalse : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2871_c2_ccbf_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2871_c2_ccbf]
signal opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_return_output : opcode_result_t;

-- brk[uxn_opcodes_h_l2871_c48_25ee]
signal brk_uxn_opcodes_h_l2871_c48_25ee_phase : unsigned(7 downto 0);
signal brk_uxn_opcodes_h_l2871_c48_25ee_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2872_c11_569f]
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c11_569f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c11_569f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c11_569f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2872_c1_770a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_770a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_770a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_770a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_770a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c7_4205]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_4205_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_4205_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_4205_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_4205_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2872_c7_bbf6]
signal opc_result_MUX_uxn_opcodes_h_l2872_c7_bbf6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2872_c7_bbf6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2872_c7_bbf6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2872_c7_bbf6_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l2872_c40_d019]
signal jci_uxn_opcodes_h_l2872_c40_d019_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l2872_c40_d019_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2872_c40_d019_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l2872_c40_d019_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2872_c40_d019_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2872_c40_d019_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2873_c11_341c]
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c11_341c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c11_341c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c11_341c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c1_ec0c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_ec0c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_ec0c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_ec0c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_ec0c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c7_de8b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_de8b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_de8b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_de8b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_de8b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2873_c7_4205]
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_4205_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_4205_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_4205_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_4205_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l2873_c40_d19d]
signal jmi_uxn_opcodes_h_l2873_c40_d19d_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l2873_c40_d19d_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2873_c40_d19d_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l2873_c40_d19d_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2873_c40_d19d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_869e]
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_869e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_869e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_869e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c1_2b8e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_2b8e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_2b8e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_2b8e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_2b8e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c7_7c1f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_7c1f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_7c1f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_7c1f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_7c1f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2874_c7_de8b]
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_de8b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_de8b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_de8b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_de8b_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l2874_c40_1591]
signal jsi_uxn_opcodes_h_l2874_c40_1591_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l2874_c40_1591_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2874_c40_1591_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l2874_c40_1591_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2874_c40_1591_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2875_c11_a19b]
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a19b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a19b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a19b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c1_5b0d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_5b0d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_5b0d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_5b0d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_5b0d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c7_15c6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_15c6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_15c6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_15c6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_15c6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2875_c7_7c1f]
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_7c1f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_7c1f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_7c1f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_7c1f_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2875_c40_4dff]
signal lit_uxn_opcodes_h_l2875_c40_4dff_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2875_c40_4dff_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2875_c40_4dff_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2875_c40_4dff_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2875_c40_4dff_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2876_c11_ad5e]
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ad5e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ad5e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ad5e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c1_3d93]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_3d93_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_3d93_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_3d93_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_3d93_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c7_92ca]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_92ca_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_92ca_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_92ca_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_92ca_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2876_c7_15c6]
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_15c6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_15c6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_15c6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_15c6_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2876_c40_28ba]
signal lit2_uxn_opcodes_h_l2876_c40_28ba_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2876_c40_28ba_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2876_c40_28ba_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2876_c40_28ba_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2876_c40_28ba_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2877_c11_19d1]
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_19d1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_19d1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_19d1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c1_dc78]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dc78_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dc78_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dc78_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dc78_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c7_a75f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a75f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a75f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a75f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a75f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2877_c7_92ca]
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_92ca_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_92ca_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_92ca_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_92ca_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2877_c40_2ef0]
signal lit_uxn_opcodes_h_l2877_c40_2ef0_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2877_c40_2ef0_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2877_c40_2ef0_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2877_c40_2ef0_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2877_c40_2ef0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_5299]
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_5299_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_5299_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_5299_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c1_d427]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_d427_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_d427_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_d427_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_d427_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c7_c60f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_c60f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_c60f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_c60f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_c60f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2878_c7_a75f]
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_a75f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_a75f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_a75f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_a75f_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2878_c40_b282]
signal lit2_uxn_opcodes_h_l2878_c40_b282_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2878_c40_b282_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2878_c40_b282_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2878_c40_b282_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2878_c40_b282_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_d85f]
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_d85f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_d85f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_d85f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c1_3707]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_3707_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_3707_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_3707_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_3707_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c7_fa28]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_fa28_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_fa28_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_fa28_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_fa28_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2879_c7_c60f]
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_c60f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_c60f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_c60f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_c60f_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l2879_c40_2cb7]
signal inc_uxn_opcodes_h_l2879_c40_2cb7_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l2879_c40_2cb7_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2879_c40_2cb7_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2879_c40_2cb7_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2879_c40_2cb7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2880_c11_2257]
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_2257_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_2257_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_2257_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c1_9a37]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_9a37_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_9a37_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_9a37_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_9a37_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c7_ff6f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_ff6f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_ff6f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_ff6f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_ff6f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2880_c7_fa28]
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_fa28_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_fa28_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_fa28_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_fa28_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l2880_c40_89cb]
signal inc2_uxn_opcodes_h_l2880_c40_89cb_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l2880_c40_89cb_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2880_c40_89cb_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2880_c40_89cb_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2880_c40_89cb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2881_c11_b10c]
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_b10c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_b10c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_b10c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c1_3c1f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3c1f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3c1f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3c1f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3c1f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c7_7e38]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7e38_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7e38_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7e38_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7e38_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2881_c7_ff6f]
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_ff6f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_ff6f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_ff6f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_ff6f_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l2881_c40_fe8c]
signal pop_uxn_opcodes_h_l2881_c40_fe8c_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l2881_c40_fe8c_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2881_c40_fe8c_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2881_c40_fe8c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_c385]
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c385_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c385_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c385_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c1_09f6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_09f6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_09f6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_09f6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_09f6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c7_a047]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_a047_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_a047_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_a047_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_a047_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2882_c7_7e38]
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_7e38_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_7e38_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_7e38_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_7e38_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l2882_c40_74cc]
signal pop2_uxn_opcodes_h_l2882_c40_74cc_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l2882_c40_74cc_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2882_c40_74cc_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2882_c40_74cc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2883_c11_88f7]
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_88f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_88f7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_88f7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c1_07b8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_07b8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_07b8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_07b8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_07b8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c7_b8f5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_b8f5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_b8f5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_b8f5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_b8f5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2883_c7_a047]
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_a047_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_a047_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_a047_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_a047_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l2883_c40_03e0]
signal nip_uxn_opcodes_h_l2883_c40_03e0_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l2883_c40_03e0_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2883_c40_03e0_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2883_c40_03e0_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2883_c40_03e0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2884_c11_e6b9]
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_e6b9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_e6b9_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_e6b9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c1_35cc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_35cc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_35cc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_35cc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_35cc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c7_13e5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_13e5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_13e5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_13e5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_13e5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2884_c7_b8f5]
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_b8f5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_b8f5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_b8f5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_b8f5_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l2884_c40_1852]
signal nip2_uxn_opcodes_h_l2884_c40_1852_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l2884_c40_1852_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2884_c40_1852_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2884_c40_1852_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2884_c40_1852_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2885_c11_1910]
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_1910_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_1910_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_1910_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c1_aaec]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_aaec_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_aaec_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_aaec_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_aaec_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c7_7519]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7519_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7519_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7519_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7519_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2885_c7_13e5]
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_13e5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_13e5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_13e5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_13e5_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l2885_c40_a116]
signal swp_uxn_opcodes_h_l2885_c40_a116_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l2885_c40_a116_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2885_c40_a116_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2885_c40_a116_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2885_c40_a116_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_160d]
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_160d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_160d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_160d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c1_98f3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_98f3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_98f3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_98f3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_98f3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c7_082a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_082a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_082a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_082a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_082a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2886_c7_7519]
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_7519_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_7519_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_7519_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_7519_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l2886_c40_b68d]
signal swp2_uxn_opcodes_h_l2886_c40_b68d_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l2886_c40_b68d_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2886_c40_b68d_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2886_c40_b68d_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2886_c40_b68d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2887_c11_d1ed]
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_d1ed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_d1ed_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_d1ed_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c1_19f4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_19f4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_19f4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_19f4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_19f4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c7_123e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_123e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_123e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_123e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_123e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2887_c7_082a]
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_082a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_082a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_082a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_082a_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l2887_c40_7295]
signal rot_uxn_opcodes_h_l2887_c40_7295_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l2887_c40_7295_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2887_c40_7295_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2887_c40_7295_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2887_c40_7295_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2888_c11_1a10]
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_1a10_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_1a10_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_1a10_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c1_b760]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b760_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b760_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b760_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b760_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c7_7e08]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7e08_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7e08_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7e08_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7e08_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2888_c7_123e]
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_123e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_123e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_123e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_123e_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l2888_c40_e209]
signal rot2_uxn_opcodes_h_l2888_c40_e209_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l2888_c40_e209_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2888_c40_e209_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2888_c40_e209_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2888_c40_e209_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_a13b]
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_a13b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_a13b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_a13b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c1_469e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_469e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_469e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_469e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_469e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c7_fc47]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_fc47_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_fc47_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_fc47_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_fc47_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2889_c7_7e08]
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_7e08_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_7e08_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_7e08_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_7e08_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l2889_c40_331d]
signal dup_uxn_opcodes_h_l2889_c40_331d_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l2889_c40_331d_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2889_c40_331d_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2889_c40_331d_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2889_c40_331d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2890_c11_abab]
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_abab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_abab_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_abab_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c1_4e3f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_4e3f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_4e3f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_4e3f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_4e3f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c7_b3d1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_b3d1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_b3d1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_b3d1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_b3d1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2890_c7_fc47]
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_fc47_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_fc47_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_fc47_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_fc47_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l2890_c40_0424]
signal dup2_uxn_opcodes_h_l2890_c40_0424_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l2890_c40_0424_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2890_c40_0424_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2890_c40_0424_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2890_c40_0424_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2891_c11_672f]
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_672f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_672f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_672f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c1_b005]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_b005_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_b005_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_b005_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_b005_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c7_6aa8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_6aa8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_6aa8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_6aa8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_6aa8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2891_c7_b3d1]
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_b3d1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_b3d1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_b3d1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_b3d1_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l2891_c40_8070]
signal ovr_uxn_opcodes_h_l2891_c40_8070_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l2891_c40_8070_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2891_c40_8070_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2891_c40_8070_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2891_c40_8070_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_c341]
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c341_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c341_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c341_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c1_380b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_380b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_380b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_380b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_380b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c7_03bc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_03bc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_03bc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_03bc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_03bc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2892_c7_6aa8]
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_6aa8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_6aa8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_6aa8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_6aa8_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l2892_c40_3ac8]
signal ovr2_uxn_opcodes_h_l2892_c40_3ac8_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l2892_c40_3ac8_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2892_c40_3ac8_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2892_c40_3ac8_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2892_c40_3ac8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2893_c11_4c7e]
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4c7e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4c7e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4c7e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c1_28bb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_28bb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_28bb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_28bb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_28bb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c7_a0a5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_a0a5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_a0a5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_a0a5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_a0a5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2893_c7_03bc]
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_03bc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_03bc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_03bc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_03bc_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l2893_c40_bff7]
signal equ_uxn_opcodes_h_l2893_c40_bff7_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l2893_c40_bff7_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2893_c40_bff7_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2893_c40_bff7_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2893_c40_bff7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_5d37]
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_5d37_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_5d37_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_5d37_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c1_31e4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_31e4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_31e4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_31e4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_31e4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c7_ef19]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_ef19_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_ef19_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_ef19_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_ef19_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2894_c7_a0a5]
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_a0a5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_a0a5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_a0a5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_a0a5_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l2894_c40_273e]
signal equ2_uxn_opcodes_h_l2894_c40_273e_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l2894_c40_273e_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2894_c40_273e_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2894_c40_273e_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2894_c40_273e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_50f6]
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_50f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_50f6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_50f6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c1_8b99]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8b99_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8b99_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8b99_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8b99_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c7_6423]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6423_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6423_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6423_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6423_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2895_c7_ef19]
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_ef19_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_ef19_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_ef19_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_ef19_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l2895_c40_bb2a]
signal neq_uxn_opcodes_h_l2895_c40_bb2a_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l2895_c40_bb2a_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2895_c40_bb2a_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2895_c40_bb2a_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2895_c40_bb2a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_06a3]
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_06a3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_06a3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_06a3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c1_3555]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3555_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3555_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3555_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3555_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c7_a94d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_a94d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_a94d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_a94d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_a94d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2896_c7_6423]
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_6423_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_6423_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_6423_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_6423_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l2896_c40_66ec]
signal neq2_uxn_opcodes_h_l2896_c40_66ec_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l2896_c40_66ec_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2896_c40_66ec_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2896_c40_66ec_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2896_c40_66ec_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_7f78]
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_7f78_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_7f78_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_7f78_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c1_d082]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_d082_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_d082_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_d082_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_d082_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c7_76d0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_76d0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_76d0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_76d0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_76d0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2897_c7_a94d]
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_a94d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_a94d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_a94d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_a94d_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l2897_c40_0e8e]
signal gth_uxn_opcodes_h_l2897_c40_0e8e_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l2897_c40_0e8e_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2897_c40_0e8e_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2897_c40_0e8e_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2897_c40_0e8e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2898_c11_4202]
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4202_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4202_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4202_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_1ae6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1ae6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1ae6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1ae6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1ae6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_b48d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_b48d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_b48d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_b48d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_b48d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2898_c7_76d0]
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_76d0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_76d0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_76d0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_76d0_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l2898_c40_3336]
signal gth2_uxn_opcodes_h_l2898_c40_3336_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l2898_c40_3336_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2898_c40_3336_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2898_c40_3336_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2898_c40_3336_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_1649]
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1649_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1649_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1649_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_75d6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_75d6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_75d6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_75d6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_75d6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_feb8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_feb8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_feb8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_feb8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_feb8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2899_c7_b48d]
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_b48d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_b48d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_b48d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_b48d_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l2899_c40_d21f]
signal lth_uxn_opcodes_h_l2899_c40_d21f_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l2899_c40_d21f_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2899_c40_d21f_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2899_c40_d21f_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2899_c40_d21f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_bc77]
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_bc77_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_bc77_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_bc77_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_3ece]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3ece_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3ece_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3ece_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3ece_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_0193]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_0193_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_0193_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_0193_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_0193_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2900_c7_feb8]
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_feb8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_feb8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_feb8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_feb8_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l2900_c40_c1f5]
signal lth2_uxn_opcodes_h_l2900_c40_c1f5_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l2900_c40_c1f5_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2900_c40_c1f5_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2900_c40_c1f5_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2900_c40_c1f5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_b68d]
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_b68d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_b68d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_b68d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_df1c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_df1c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_df1c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_df1c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_df1c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_5780]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5780_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5780_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5780_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5780_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2901_c7_0193]
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_0193_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_0193_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_0193_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_0193_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l2901_c40_32e7]
signal jmp_uxn_opcodes_h_l2901_c40_32e7_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l2901_c40_32e7_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2901_c40_32e7_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2901_c40_32e7_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l2901_c40_32e7_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2901_c40_32e7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_b3a2]
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b3a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b3a2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b3a2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_edc6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_edc6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_edc6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_edc6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_edc6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_16fa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_16fa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_16fa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_16fa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_16fa_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2902_c7_5780]
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_5780_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_5780_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_5780_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_5780_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l2902_c40_6f95]
signal jmp2_uxn_opcodes_h_l2902_c40_6f95_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l2902_c40_6f95_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2902_c40_6f95_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2902_c40_6f95_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2902_c40_6f95_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_046c]
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_046c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_046c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_046c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_c931]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c931_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c931_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c931_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c931_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_2da1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2da1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2da1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2da1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2da1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2903_c7_16fa]
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_16fa_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_16fa_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_16fa_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_16fa_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l2903_c40_5135]
signal jcn_uxn_opcodes_h_l2903_c40_5135_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l2903_c40_5135_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2903_c40_5135_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2903_c40_5135_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l2903_c40_5135_previous_stack_read : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2903_c40_5135_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_38ec]
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_38ec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_38ec_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_38ec_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_1893]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1893_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1893_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1893_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1893_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_0b6d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0b6d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0b6d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0b6d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0b6d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2904_c7_2da1]
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_2da1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_2da1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_2da1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_2da1_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l2904_c40_e211]
signal jcn2_uxn_opcodes_h_l2904_c40_e211_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l2904_c40_e211_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2904_c40_e211_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2904_c40_e211_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2904_c40_e211_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_0168]
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0168_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0168_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0168_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_03e6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_03e6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_03e6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_03e6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_03e6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_f6b1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_f6b1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_f6b1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_f6b1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_f6b1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2905_c7_0b6d]
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_0b6d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_0b6d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_0b6d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_0b6d_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l2905_c40_eb2a]
signal jsr_uxn_opcodes_h_l2905_c40_eb2a_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l2905_c40_eb2a_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2905_c40_eb2a_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2905_c40_eb2a_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l2905_c40_eb2a_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2905_c40_eb2a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_a219]
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_a219_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_a219_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_a219_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_6b80]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6b80_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6b80_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6b80_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6b80_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_1c1b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_1c1b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_1c1b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_1c1b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_1c1b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2906_c7_f6b1]
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_f6b1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_f6b1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_f6b1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_f6b1_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l2906_c40_be12]
signal jsr2_uxn_opcodes_h_l2906_c40_be12_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l2906_c40_be12_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2906_c40_be12_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2906_c40_be12_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l2906_c40_be12_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2906_c40_be12_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_6dba]
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6dba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6dba_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6dba_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_c6ac]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_c6ac_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_c6ac_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_c6ac_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_c6ac_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_4b87]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4b87_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4b87_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4b87_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4b87_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2907_c7_1c1b]
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_1c1b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_1c1b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_1c1b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_1c1b_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l2907_c40_5016]
signal sth_uxn_opcodes_h_l2907_c40_5016_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l2907_c40_5016_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2907_c40_5016_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2907_c40_5016_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2907_c40_5016_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_e48c]
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_e48c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_e48c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_e48c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_d945]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d945_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d945_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d945_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d945_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_a9f7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a9f7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a9f7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a9f7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a9f7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2908_c7_4b87]
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_4b87_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_4b87_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_4b87_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_4b87_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l2908_c40_2433]
signal sth2_uxn_opcodes_h_l2908_c40_2433_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l2908_c40_2433_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2908_c40_2433_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2908_c40_2433_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2908_c40_2433_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_bf44]
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_bf44_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_bf44_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_bf44_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_f727]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_f727_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_f727_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_f727_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_f727_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_6feb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_6feb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_6feb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_6feb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_6feb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2909_c7_a9f7]
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_a9f7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_a9f7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_a9f7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_a9f7_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l2909_c40_64a9]
signal ldz_uxn_opcodes_h_l2909_c40_64a9_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l2909_c40_64a9_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2909_c40_64a9_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2909_c40_64a9_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2909_c40_64a9_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2909_c40_64a9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_5a29]
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_5a29_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_5a29_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_5a29_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_cb41]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_cb41_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_cb41_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_cb41_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_cb41_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_af8e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_af8e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_af8e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_af8e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_af8e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2910_c7_6feb]
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_6feb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_6feb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_6feb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_6feb_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l2910_c40_a8f0]
signal ldz2_uxn_opcodes_h_l2910_c40_a8f0_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l2910_c40_a8f0_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2910_c40_a8f0_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2910_c40_a8f0_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2910_c40_a8f0_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2910_c40_a8f0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_fdda]
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_fdda_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_fdda_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_fdda_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_779e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_779e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_779e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_779e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_779e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_99f2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_99f2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_99f2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_99f2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_99f2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2911_c7_af8e]
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_af8e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_af8e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_af8e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_af8e_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l2911_c40_7d0e]
signal stz_uxn_opcodes_h_l2911_c40_7d0e_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l2911_c40_7d0e_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2911_c40_7d0e_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2911_c40_7d0e_previous_stack_read : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2911_c40_7d0e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_a2fc]
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a2fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a2fc_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a2fc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_dd8d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_dd8d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_dd8d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_dd8d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_dd8d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_3bd2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3bd2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3bd2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3bd2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3bd2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2912_c7_99f2]
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_99f2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_99f2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_99f2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_99f2_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l2912_c40_4717]
signal stz2_uxn_opcodes_h_l2912_c40_4717_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l2912_c40_4717_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2912_c40_4717_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2912_c40_4717_previous_stack_read : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2912_c40_4717_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_d142]
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_d142_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_d142_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_d142_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_2f11]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f11_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f11_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f11_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f11_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_6fd2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_6fd2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_6fd2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_6fd2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_6fd2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2913_c7_3bd2]
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_3bd2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_3bd2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_3bd2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_3bd2_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l2913_c40_ef78]
signal ldr_uxn_opcodes_h_l2913_c40_ef78_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l2913_c40_ef78_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2913_c40_ef78_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2913_c40_ef78_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l2913_c40_ef78_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2913_c40_ef78_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2913_c40_ef78_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_cd99]
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_cd99_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_cd99_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_cd99_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_49d2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49d2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49d2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49d2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49d2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_a2fc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_a2fc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_a2fc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_a2fc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_a2fc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2914_c7_6fd2]
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_6fd2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_6fd2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_6fd2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_6fd2_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l2914_c40_fc66]
signal ldr2_uxn_opcodes_h_l2914_c40_fc66_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l2914_c40_fc66_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2914_c40_fc66_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2914_c40_fc66_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l2914_c40_fc66_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2914_c40_fc66_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2914_c40_fc66_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_5cf4]
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_5cf4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_5cf4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_5cf4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_a4db]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a4db_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a4db_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a4db_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a4db_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_1b3d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_1b3d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_1b3d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_1b3d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_1b3d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2915_c7_a2fc]
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_a2fc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_a2fc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_a2fc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_a2fc_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l2915_c40_f3ab]
signal str1_uxn_opcodes_h_l2915_c40_f3ab_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l2915_c40_f3ab_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2915_c40_f3ab_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2915_c40_f3ab_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l2915_c40_f3ab_previous_stack_read : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2915_c40_f3ab_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_1036]
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_1036_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_1036_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_1036_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_9bec]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9bec_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9bec_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9bec_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9bec_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_7424]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7424_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7424_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7424_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7424_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2916_c7_1b3d]
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_1b3d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_1b3d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_1b3d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_1b3d_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l2916_c40_53ec]
signal str2_uxn_opcodes_h_l2916_c40_53ec_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l2916_c40_53ec_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2916_c40_53ec_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2916_c40_53ec_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l2916_c40_53ec_previous_stack_read : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2916_c40_53ec_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_0b0e]
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0b0e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0b0e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0b0e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_bc3c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_bc3c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_bc3c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_bc3c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_bc3c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_f6b7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_f6b7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_f6b7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_f6b7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_f6b7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2917_c7_7424]
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_7424_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_7424_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_7424_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_7424_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l2917_c40_025f]
signal lda_uxn_opcodes_h_l2917_c40_025f_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l2917_c40_025f_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2917_c40_025f_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2917_c40_025f_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2917_c40_025f_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2917_c40_025f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_578e]
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_578e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_578e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_578e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_7625]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_7625_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_7625_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_7625_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_7625_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_0988]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0988_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0988_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0988_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0988_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2918_c7_f6b7]
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_f6b7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_f6b7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_f6b7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_f6b7_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l2918_c40_6eeb]
signal lda2_uxn_opcodes_h_l2918_c40_6eeb_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l2918_c40_6eeb_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2918_c40_6eeb_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2918_c40_6eeb_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2918_c40_6eeb_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2918_c40_6eeb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_ea53]
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ea53_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ea53_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ea53_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_b2e8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_b2e8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_b2e8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_b2e8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_b2e8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_6ab5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_6ab5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_6ab5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_6ab5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_6ab5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2919_c7_0988]
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_0988_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_0988_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_0988_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_0988_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l2919_c40_0aa2]
signal sta_uxn_opcodes_h_l2919_c40_0aa2_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l2919_c40_0aa2_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2919_c40_0aa2_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2919_c40_0aa2_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2919_c40_0aa2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_5f57]
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5f57_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5f57_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5f57_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_1737]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_1737_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_1737_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_1737_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_1737_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_0118]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_0118_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_0118_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_0118_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_0118_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2920_c7_6ab5]
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_6ab5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_6ab5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_6ab5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_6ab5_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l2920_c40_bcf5]
signal sta2_uxn_opcodes_h_l2920_c40_bcf5_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l2920_c40_bcf5_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2920_c40_bcf5_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2920_c40_bcf5_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2920_c40_bcf5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_b92d]
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b92d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b92d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b92d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_0fcf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0fcf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0fcf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0fcf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0fcf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_4384]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_4384_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_4384_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_4384_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_4384_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2921_c7_0118]
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_0118_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_0118_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_0118_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_0118_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l2921_c40_7b40]
signal dei_uxn_opcodes_h_l2921_c40_7b40_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l2921_c40_7b40_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2921_c40_7b40_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2921_c40_7b40_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2921_c40_7b40_previous_device_ram_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2921_c40_7b40_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_d26c]
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d26c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d26c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d26c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_d5de]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d5de_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d5de_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d5de_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d5de_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_c223]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_c223_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_c223_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_c223_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_c223_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2922_c7_4384]
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_4384_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_4384_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_4384_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_4384_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l2922_c40_30a5]
signal dei2_uxn_opcodes_h_l2922_c40_30a5_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l2922_c40_30a5_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2922_c40_30a5_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2922_c40_30a5_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2922_c40_30a5_previous_device_ram_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2922_c40_30a5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_d7cf]
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d7cf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d7cf_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d7cf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_467e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_467e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_467e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_467e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_467e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_63e8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_63e8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_63e8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_63e8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_63e8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2923_c7_c223]
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_c223_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_c223_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_c223_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_c223_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l2923_c40_4ca7]
signal deo_uxn_opcodes_h_l2923_c40_4ca7_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l2923_c40_4ca7_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2923_c40_4ca7_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2923_c40_4ca7_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2923_c40_4ca7_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2923_c40_4ca7_previous_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2923_c40_4ca7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_a25b]
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_a25b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_a25b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_a25b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_5439]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_5439_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_5439_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_5439_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_5439_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_6f04]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_6f04_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_6f04_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_6f04_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_6f04_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2924_c7_63e8]
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_63e8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_63e8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_63e8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_63e8_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l2924_c40_a34e]
signal deo2_uxn_opcodes_h_l2924_c40_a34e_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l2924_c40_a34e_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2924_c40_a34e_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2924_c40_a34e_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2924_c40_a34e_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2924_c40_a34e_previous_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2924_c40_a34e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_febb]
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_febb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_febb_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_febb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_36ab]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_36ab_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_36ab_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_36ab_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_36ab_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_e663]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e663_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e663_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e663_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e663_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2925_c7_6f04]
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_6f04_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_6f04_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_6f04_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_6f04_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l2925_c40_b133]
signal add_uxn_opcodes_h_l2925_c40_b133_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l2925_c40_b133_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2925_c40_b133_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2925_c40_b133_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2925_c40_b133_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_c59d]
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c59d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c59d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c59d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_cb5e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_cb5e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_cb5e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_cb5e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_cb5e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_76e1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_76e1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_76e1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_76e1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_76e1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2926_c7_e663]
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_e663_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_e663_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_e663_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_e663_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l2926_c40_7dbe]
signal add2_uxn_opcodes_h_l2926_c40_7dbe_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l2926_c40_7dbe_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2926_c40_7dbe_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2926_c40_7dbe_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2926_c40_7dbe_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_8478]
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8478_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8478_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8478_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_ebd8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ebd8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ebd8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ebd8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ebd8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_85ac]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_85ac_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_85ac_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_85ac_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_85ac_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2927_c7_76e1]
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_76e1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_76e1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_76e1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_76e1_return_output : opcode_result_t;

-- sub[uxn_opcodes_h_l2927_c40_23ae]
signal sub_uxn_opcodes_h_l2927_c40_23ae_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub_uxn_opcodes_h_l2927_c40_23ae_phase : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2927_c40_23ae_ins : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2927_c40_23ae_previous_stack_read : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2927_c40_23ae_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_7095]
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7095_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7095_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7095_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_2220]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_2220_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_2220_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_2220_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_2220_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_41af]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_41af_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_41af_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_41af_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_41af_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2928_c7_85ac]
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_85ac_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_85ac_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_85ac_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_85ac_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l2928_c40_785e]
signal sub2_uxn_opcodes_h_l2928_c40_785e_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l2928_c40_785e_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2928_c40_785e_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2928_c40_785e_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2928_c40_785e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_0d25]
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0d25_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0d25_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0d25_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_70fb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_70fb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_70fb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_70fb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_70fb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_b79c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b79c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b79c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b79c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b79c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2929_c7_41af]
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_41af_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_41af_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_41af_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_41af_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l2929_c40_120a]
signal mul_uxn_opcodes_h_l2929_c40_120a_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l2929_c40_120a_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2929_c40_120a_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2929_c40_120a_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2929_c40_120a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_7b9b]
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_7b9b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_7b9b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_7b9b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_a39f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_a39f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_a39f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_a39f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_a39f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_12f3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_12f3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_12f3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_12f3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_12f3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2930_c7_b79c]
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_b79c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_b79c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_b79c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_b79c_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l2930_c40_d33c]
signal mul2_uxn_opcodes_h_l2930_c40_d33c_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l2930_c40_d33c_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2930_c40_d33c_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2930_c40_d33c_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2930_c40_d33c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_caa6]
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_caa6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_caa6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_caa6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_5db8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5db8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5db8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5db8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5db8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_b43d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b43d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b43d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b43d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b43d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2931_c7_12f3]
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_12f3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_12f3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_12f3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_12f3_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l2931_c40_ca74]
signal div_uxn_opcodes_h_l2931_c40_ca74_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l2931_c40_ca74_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2931_c40_ca74_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2931_c40_ca74_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2931_c40_ca74_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_e09c]
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_e09c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_e09c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_e09c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_3296]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3296_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3296_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3296_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3296_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_982e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_982e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_982e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_982e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_982e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2932_c7_b43d]
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_b43d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_b43d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_b43d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_b43d_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l2932_c40_e2aa]
signal div2_uxn_opcodes_h_l2932_c40_e2aa_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l2932_c40_e2aa_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2932_c40_e2aa_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2932_c40_e2aa_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2932_c40_e2aa_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_f733]
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f733_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f733_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f733_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_b0a3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b0a3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b0a3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b0a3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b0a3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_3562]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_3562_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_3562_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_3562_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_3562_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2933_c7_982e]
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_982e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_982e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_982e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_982e_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l2933_c40_3577]
signal and_uxn_opcodes_h_l2933_c40_3577_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l2933_c40_3577_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2933_c40_3577_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2933_c40_3577_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2933_c40_3577_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_ecba]
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ecba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ecba_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ecba_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_fd55]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_fd55_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_fd55_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_fd55_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_fd55_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_be09]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_be09_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_be09_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_be09_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_be09_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2934_c7_3562]
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_3562_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_3562_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_3562_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_3562_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l2934_c40_29c3]
signal and2_uxn_opcodes_h_l2934_c40_29c3_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l2934_c40_29c3_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2934_c40_29c3_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2934_c40_29c3_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2934_c40_29c3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_9e52]
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9e52_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9e52_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9e52_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_5013]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5013_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5013_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5013_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5013_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_fe83]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fe83_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fe83_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fe83_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fe83_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2935_c7_be09]
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_be09_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_be09_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_be09_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_be09_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l2935_c40_afa7]
signal ora_uxn_opcodes_h_l2935_c40_afa7_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l2935_c40_afa7_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2935_c40_afa7_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2935_c40_afa7_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2935_c40_afa7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_0fdc]
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0fdc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0fdc_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0fdc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_e69b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e69b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e69b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e69b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e69b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_97a0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_97a0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_97a0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_97a0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_97a0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2936_c7_fe83]
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_fe83_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_fe83_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_fe83_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_fe83_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l2936_c40_79e7]
signal ora2_uxn_opcodes_h_l2936_c40_79e7_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l2936_c40_79e7_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2936_c40_79e7_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2936_c40_79e7_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2936_c40_79e7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_9387]
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_9387_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_9387_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_9387_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_54cd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_54cd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_54cd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_54cd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_54cd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_174c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_174c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_174c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_174c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_174c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2937_c7_97a0]
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_97a0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_97a0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_97a0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_97a0_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l2937_c40_8514]
signal eor_uxn_opcodes_h_l2937_c40_8514_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l2937_c40_8514_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2937_c40_8514_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2937_c40_8514_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2937_c40_8514_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_5ad7]
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_5ad7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_5ad7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_5ad7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_90a5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_90a5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_90a5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_90a5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_90a5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_4b7a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4b7a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4b7a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4b7a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4b7a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2938_c7_174c]
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_174c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_174c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_174c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_174c_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l2938_c40_d819]
signal eor2_uxn_opcodes_h_l2938_c40_d819_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l2938_c40_d819_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2938_c40_d819_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2938_c40_d819_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2938_c40_d819_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_f49d]
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f49d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f49d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f49d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_d14e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_d14e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_d14e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_d14e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_d14e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_9399]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9399_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9399_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9399_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9399_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2939_c7_4b7a]
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_4b7a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_4b7a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_4b7a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_4b7a_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l2939_c40_5619]
signal sft_uxn_opcodes_h_l2939_c40_5619_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l2939_c40_5619_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2939_c40_5619_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2939_c40_5619_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2939_c40_5619_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_86c4]
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_86c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_86c4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_86c4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_333b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_333b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_333b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_333b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_333b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2940_c7_9399]
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_9399_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_9399_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_9399_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_9399_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l2940_c40_180c]
signal sft2_uxn_opcodes_h_l2940_c40_180c_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l2940_c40_180c_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2940_c40_180c_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2940_c40_180c_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2940_c40_180c_return_output : opcode_result_t;

-- CONST_SR_6[uxn_opcodes_h_l2942_c16_ddec]
signal CONST_SR_6_uxn_opcodes_h_l2942_c16_ddec_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_opcodes_h_l2942_c16_ddec_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2943_c2_2a80]
signal BIN_OP_XOR_uxn_opcodes_h_l2943_c2_2a80_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2943_c2_2a80_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2943_c2_2a80_return_output : unsigned(0 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2945_c2_2619]
signal sp0_MUX_uxn_opcodes_h_l2945_c2_2619_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2945_c2_2619_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2945_c2_2619_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2945_c2_2619_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2945_c2_2619]
signal sp1_MUX_uxn_opcodes_h_l2945_c2_2619_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2945_c2_2619_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2945_c2_2619_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2945_c2_2619_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2946_c3_3101]
signal BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_3101_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_3101_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_3101_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2948_c3_956e]
signal BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_956e_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_956e_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_956e_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l2951_c29_c53a]
signal MUX_uxn_opcodes_h_l2951_c29_c53a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2951_c29_c53a_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2951_c29_c53a_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2951_c29_c53a_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2951_c19_1ae1]
signal BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_1ae1_left : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_1ae1_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_1ae1_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l2952_c20_7b4b]
signal MUX_uxn_opcodes_h_l2952_c20_7b4b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2952_c20_7b4b_iftrue : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2952_c20_7b4b_iffalse : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2952_c20_7b4b_return_output : unsigned(8 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2952_c2_4e93]
signal BIN_OP_OR_uxn_opcodes_h_l2952_c2_4e93_left : unsigned(8 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2952_c2_4e93_right : unsigned(8 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2952_c2_4e93_return_output : unsigned(8 downto 0);

-- stack_ram_update[uxn_opcodes_h_l2954_c24_35a2]
signal stack_ram_update_uxn_opcodes_h_l2954_c24_35a2_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2954_c24_35a2_stack_address : unsigned(8 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2954_c24_35a2_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2954_c24_35a2_write_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2954_c24_35a2_return_output : unsigned(7 downto 0);

function CAST_TO_uint9_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(8 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,9)));
    return return_output;
end function;

function CAST_TO_uint9_t_uint4_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(3 downto 0);
  variable return_output : unsigned(8 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,9)));
    return return_output;
end function;

function CAST_TO_int8_t_int4_t( rhs : signed) return signed is

  --variable rhs : signed(3 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return eval_opcode_result_t is
 
  variable base : eval_opcode_result_t; 
  variable return_output : eval_opcode_result_t;
begin
      base.is_waiting := ref_toks_0;
      base.device_ram_address := ref_toks_1;
      base.is_device_ram_write := ref_toks_2;
      base.is_pc_updated := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.vram_write_layer := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_opcodes_h_l2863_c14_05db
BIN_OP_AND_uxn_opcodes_h_l2863_c14_05db : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2863_c14_05db_left,
BIN_OP_AND_uxn_opcodes_h_l2863_c14_05db_right,
BIN_OP_AND_uxn_opcodes_h_l2863_c14_05db_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5f5d
BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5f5d : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5f5d_left,
BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5f5d_right,
BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5f5d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2864_c14_2a91
BIN_OP_OR_uxn_opcodes_h_l2864_c14_2a91 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2864_c14_2a91_left,
BIN_OP_OR_uxn_opcodes_h_l2864_c14_2a91_right,
BIN_OP_OR_uxn_opcodes_h_l2864_c14_2a91_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_8de6
UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_8de6 : entity work.UNARY_OP_NOT_uint8_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_8de6_expr,
UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_8de6_return_output);

-- BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_0259
BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_0259 : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_0259_left,
BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_0259_right,
BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_0259_return_output);

-- MUX_uxn_opcodes_h_l2864_c14_f4d0
MUX_uxn_opcodes_h_l2864_c14_f4d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2864_c14_f4d0_cond,
MUX_uxn_opcodes_h_l2864_c14_f4d0_iftrue,
MUX_uxn_opcodes_h_l2864_c14_f4d0_iffalse,
MUX_uxn_opcodes_h_l2864_c14_f4d0_return_output);

-- MUX_uxn_opcodes_h_l2865_c8_d3a5
MUX_uxn_opcodes_h_l2865_c8_d3a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2865_c8_d3a5_cond,
MUX_uxn_opcodes_h_l2865_c8_d3a5_iftrue,
MUX_uxn_opcodes_h_l2865_c8_d3a5_iffalse,
MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2871_c6_82b7
BIN_OP_EQ_uxn_opcodes_h_l2871_c6_82b7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2871_c6_82b7_left,
BIN_OP_EQ_uxn_opcodes_h_l2871_c6_82b7_right,
BIN_OP_EQ_uxn_opcodes_h_l2871_c6_82b7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_bbf6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_bbf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_bbf6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_bbf6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_bbf6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_bbf6_return_output);

-- is_wait_MUX_uxn_opcodes_h_l2871_c2_ccbf
is_wait_MUX_uxn_opcodes_h_l2871_c2_ccbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_wait_MUX_uxn_opcodes_h_l2871_c2_ccbf_cond,
is_wait_MUX_uxn_opcodes_h_l2871_c2_ccbf_iftrue,
is_wait_MUX_uxn_opcodes_h_l2871_c2_ccbf_iffalse,
is_wait_MUX_uxn_opcodes_h_l2871_c2_ccbf_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf
opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_cond,
opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_iftrue,
opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_iffalse,
opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_return_output);

-- brk_uxn_opcodes_h_l2871_c48_25ee
brk_uxn_opcodes_h_l2871_c48_25ee : entity work.brk_0CLK_b45f1687 port map (
brk_uxn_opcodes_h_l2871_c48_25ee_phase,
brk_uxn_opcodes_h_l2871_c48_25ee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2872_c11_569f
BIN_OP_EQ_uxn_opcodes_h_l2872_c11_569f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2872_c11_569f_left,
BIN_OP_EQ_uxn_opcodes_h_l2872_c11_569f_right,
BIN_OP_EQ_uxn_opcodes_h_l2872_c11_569f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_770a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_770a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_770a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_770a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_770a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_770a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_4205
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_4205 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_4205_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_4205_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_4205_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_4205_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2872_c7_bbf6
opc_result_MUX_uxn_opcodes_h_l2872_c7_bbf6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2872_c7_bbf6_cond,
opc_result_MUX_uxn_opcodes_h_l2872_c7_bbf6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2872_c7_bbf6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2872_c7_bbf6_return_output);

-- jci_uxn_opcodes_h_l2872_c40_d019
jci_uxn_opcodes_h_l2872_c40_d019 : entity work.jci_0CLK_4351dde2 port map (
clk,
jci_uxn_opcodes_h_l2872_c40_d019_CLOCK_ENABLE,
jci_uxn_opcodes_h_l2872_c40_d019_phase,
jci_uxn_opcodes_h_l2872_c40_d019_pc,
jci_uxn_opcodes_h_l2872_c40_d019_previous_stack_read,
jci_uxn_opcodes_h_l2872_c40_d019_previous_ram_read,
jci_uxn_opcodes_h_l2872_c40_d019_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2873_c11_341c
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_341c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_341c_left,
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_341c_right,
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_341c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_ec0c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_ec0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_ec0c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_ec0c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_ec0c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_ec0c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_de8b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_de8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_de8b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_de8b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_de8b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_de8b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2873_c7_4205
opc_result_MUX_uxn_opcodes_h_l2873_c7_4205 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2873_c7_4205_cond,
opc_result_MUX_uxn_opcodes_h_l2873_c7_4205_iftrue,
opc_result_MUX_uxn_opcodes_h_l2873_c7_4205_iffalse,
opc_result_MUX_uxn_opcodes_h_l2873_c7_4205_return_output);

-- jmi_uxn_opcodes_h_l2873_c40_d19d
jmi_uxn_opcodes_h_l2873_c40_d19d : entity work.jmi_0CLK_937caaea port map (
clk,
jmi_uxn_opcodes_h_l2873_c40_d19d_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l2873_c40_d19d_phase,
jmi_uxn_opcodes_h_l2873_c40_d19d_pc,
jmi_uxn_opcodes_h_l2873_c40_d19d_previous_ram_read,
jmi_uxn_opcodes_h_l2873_c40_d19d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2874_c11_869e
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_869e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_869e_left,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_869e_right,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_869e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_2b8e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_2b8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_2b8e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_2b8e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_2b8e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_2b8e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_7c1f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_7c1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_7c1f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_7c1f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_7c1f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_7c1f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2874_c7_de8b
opc_result_MUX_uxn_opcodes_h_l2874_c7_de8b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2874_c7_de8b_cond,
opc_result_MUX_uxn_opcodes_h_l2874_c7_de8b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2874_c7_de8b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2874_c7_de8b_return_output);

-- jsi_uxn_opcodes_h_l2874_c40_1591
jsi_uxn_opcodes_h_l2874_c40_1591 : entity work.jsi_0CLK_4c8178ef port map (
clk,
jsi_uxn_opcodes_h_l2874_c40_1591_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l2874_c40_1591_phase,
jsi_uxn_opcodes_h_l2874_c40_1591_pc,
jsi_uxn_opcodes_h_l2874_c40_1591_previous_ram_read,
jsi_uxn_opcodes_h_l2874_c40_1591_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a19b
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a19b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a19b_left,
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a19b_right,
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a19b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_5b0d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_5b0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_5b0d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_5b0d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_5b0d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_5b0d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_15c6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_15c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_15c6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_15c6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_15c6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_15c6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2875_c7_7c1f
opc_result_MUX_uxn_opcodes_h_l2875_c7_7c1f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2875_c7_7c1f_cond,
opc_result_MUX_uxn_opcodes_h_l2875_c7_7c1f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2875_c7_7c1f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2875_c7_7c1f_return_output);

-- lit_uxn_opcodes_h_l2875_c40_4dff
lit_uxn_opcodes_h_l2875_c40_4dff : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2875_c40_4dff_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2875_c40_4dff_phase,
lit_uxn_opcodes_h_l2875_c40_4dff_pc,
lit_uxn_opcodes_h_l2875_c40_4dff_previous_ram_read,
lit_uxn_opcodes_h_l2875_c40_4dff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ad5e
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ad5e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ad5e_left,
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ad5e_right,
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ad5e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_3d93
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_3d93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_3d93_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_3d93_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_3d93_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_3d93_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_92ca
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_92ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_92ca_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_92ca_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_92ca_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_92ca_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2876_c7_15c6
opc_result_MUX_uxn_opcodes_h_l2876_c7_15c6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2876_c7_15c6_cond,
opc_result_MUX_uxn_opcodes_h_l2876_c7_15c6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2876_c7_15c6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2876_c7_15c6_return_output);

-- lit2_uxn_opcodes_h_l2876_c40_28ba
lit2_uxn_opcodes_h_l2876_c40_28ba : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2876_c40_28ba_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2876_c40_28ba_phase,
lit2_uxn_opcodes_h_l2876_c40_28ba_pc,
lit2_uxn_opcodes_h_l2876_c40_28ba_previous_ram_read,
lit2_uxn_opcodes_h_l2876_c40_28ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2877_c11_19d1
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_19d1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_19d1_left,
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_19d1_right,
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_19d1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dc78
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dc78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dc78_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dc78_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dc78_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dc78_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a75f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a75f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a75f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a75f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a75f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a75f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2877_c7_92ca
opc_result_MUX_uxn_opcodes_h_l2877_c7_92ca : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2877_c7_92ca_cond,
opc_result_MUX_uxn_opcodes_h_l2877_c7_92ca_iftrue,
opc_result_MUX_uxn_opcodes_h_l2877_c7_92ca_iffalse,
opc_result_MUX_uxn_opcodes_h_l2877_c7_92ca_return_output);

-- lit_uxn_opcodes_h_l2877_c40_2ef0
lit_uxn_opcodes_h_l2877_c40_2ef0 : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2877_c40_2ef0_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2877_c40_2ef0_phase,
lit_uxn_opcodes_h_l2877_c40_2ef0_pc,
lit_uxn_opcodes_h_l2877_c40_2ef0_previous_ram_read,
lit_uxn_opcodes_h_l2877_c40_2ef0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2878_c11_5299
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_5299 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_5299_left,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_5299_right,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_5299_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_d427
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_d427 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_d427_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_d427_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_d427_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_d427_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_c60f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_c60f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_c60f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_c60f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_c60f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_c60f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2878_c7_a75f
opc_result_MUX_uxn_opcodes_h_l2878_c7_a75f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2878_c7_a75f_cond,
opc_result_MUX_uxn_opcodes_h_l2878_c7_a75f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2878_c7_a75f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2878_c7_a75f_return_output);

-- lit2_uxn_opcodes_h_l2878_c40_b282
lit2_uxn_opcodes_h_l2878_c40_b282 : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2878_c40_b282_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2878_c40_b282_phase,
lit2_uxn_opcodes_h_l2878_c40_b282_pc,
lit2_uxn_opcodes_h_l2878_c40_b282_previous_ram_read,
lit2_uxn_opcodes_h_l2878_c40_b282_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2879_c11_d85f
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_d85f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_d85f_left,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_d85f_right,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_d85f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_3707
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_3707 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_3707_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_3707_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_3707_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_3707_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_fa28
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_fa28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_fa28_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_fa28_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_fa28_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_fa28_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2879_c7_c60f
opc_result_MUX_uxn_opcodes_h_l2879_c7_c60f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2879_c7_c60f_cond,
opc_result_MUX_uxn_opcodes_h_l2879_c7_c60f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2879_c7_c60f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2879_c7_c60f_return_output);

-- inc_uxn_opcodes_h_l2879_c40_2cb7
inc_uxn_opcodes_h_l2879_c40_2cb7 : entity work.inc_0CLK_121b1df5 port map (
clk,
inc_uxn_opcodes_h_l2879_c40_2cb7_CLOCK_ENABLE,
inc_uxn_opcodes_h_l2879_c40_2cb7_phase,
inc_uxn_opcodes_h_l2879_c40_2cb7_ins,
inc_uxn_opcodes_h_l2879_c40_2cb7_previous_stack_read,
inc_uxn_opcodes_h_l2879_c40_2cb7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2880_c11_2257
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_2257 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_2257_left,
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_2257_right,
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_2257_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_9a37
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_9a37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_9a37_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_9a37_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_9a37_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_9a37_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_ff6f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_ff6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_ff6f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_ff6f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_ff6f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_ff6f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2880_c7_fa28
opc_result_MUX_uxn_opcodes_h_l2880_c7_fa28 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2880_c7_fa28_cond,
opc_result_MUX_uxn_opcodes_h_l2880_c7_fa28_iftrue,
opc_result_MUX_uxn_opcodes_h_l2880_c7_fa28_iffalse,
opc_result_MUX_uxn_opcodes_h_l2880_c7_fa28_return_output);

-- inc2_uxn_opcodes_h_l2880_c40_89cb
inc2_uxn_opcodes_h_l2880_c40_89cb : entity work.inc2_0CLK_180c5210 port map (
clk,
inc2_uxn_opcodes_h_l2880_c40_89cb_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l2880_c40_89cb_phase,
inc2_uxn_opcodes_h_l2880_c40_89cb_ins,
inc2_uxn_opcodes_h_l2880_c40_89cb_previous_stack_read,
inc2_uxn_opcodes_h_l2880_c40_89cb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2881_c11_b10c
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_b10c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_b10c_left,
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_b10c_right,
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_b10c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3c1f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3c1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3c1f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3c1f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3c1f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3c1f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7e38
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7e38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7e38_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7e38_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7e38_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7e38_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2881_c7_ff6f
opc_result_MUX_uxn_opcodes_h_l2881_c7_ff6f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2881_c7_ff6f_cond,
opc_result_MUX_uxn_opcodes_h_l2881_c7_ff6f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2881_c7_ff6f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2881_c7_ff6f_return_output);

-- pop_uxn_opcodes_h_l2881_c40_fe8c
pop_uxn_opcodes_h_l2881_c40_fe8c : entity work.pop_0CLK_b0b628a3 port map (
clk,
pop_uxn_opcodes_h_l2881_c40_fe8c_CLOCK_ENABLE,
pop_uxn_opcodes_h_l2881_c40_fe8c_phase,
pop_uxn_opcodes_h_l2881_c40_fe8c_ins,
pop_uxn_opcodes_h_l2881_c40_fe8c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c385
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c385 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c385_left,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c385_right,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c385_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_09f6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_09f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_09f6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_09f6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_09f6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_09f6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_a047
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_a047 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_a047_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_a047_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_a047_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_a047_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2882_c7_7e38
opc_result_MUX_uxn_opcodes_h_l2882_c7_7e38 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2882_c7_7e38_cond,
opc_result_MUX_uxn_opcodes_h_l2882_c7_7e38_iftrue,
opc_result_MUX_uxn_opcodes_h_l2882_c7_7e38_iffalse,
opc_result_MUX_uxn_opcodes_h_l2882_c7_7e38_return_output);

-- pop2_uxn_opcodes_h_l2882_c40_74cc
pop2_uxn_opcodes_h_l2882_c40_74cc : entity work.pop2_0CLK_b0b628a3 port map (
clk,
pop2_uxn_opcodes_h_l2882_c40_74cc_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l2882_c40_74cc_phase,
pop2_uxn_opcodes_h_l2882_c40_74cc_ins,
pop2_uxn_opcodes_h_l2882_c40_74cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2883_c11_88f7
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_88f7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_88f7_left,
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_88f7_right,
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_88f7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_07b8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_07b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_07b8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_07b8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_07b8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_07b8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_b8f5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_b8f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_b8f5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_b8f5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_b8f5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_b8f5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2883_c7_a047
opc_result_MUX_uxn_opcodes_h_l2883_c7_a047 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2883_c7_a047_cond,
opc_result_MUX_uxn_opcodes_h_l2883_c7_a047_iftrue,
opc_result_MUX_uxn_opcodes_h_l2883_c7_a047_iffalse,
opc_result_MUX_uxn_opcodes_h_l2883_c7_a047_return_output);

-- nip_uxn_opcodes_h_l2883_c40_03e0
nip_uxn_opcodes_h_l2883_c40_03e0 : entity work.nip_0CLK_d0ab213f port map (
clk,
nip_uxn_opcodes_h_l2883_c40_03e0_CLOCK_ENABLE,
nip_uxn_opcodes_h_l2883_c40_03e0_phase,
nip_uxn_opcodes_h_l2883_c40_03e0_ins,
nip_uxn_opcodes_h_l2883_c40_03e0_previous_stack_read,
nip_uxn_opcodes_h_l2883_c40_03e0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2884_c11_e6b9
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_e6b9 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_e6b9_left,
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_e6b9_right,
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_e6b9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_35cc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_35cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_35cc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_35cc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_35cc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_35cc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_13e5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_13e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_13e5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_13e5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_13e5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_13e5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2884_c7_b8f5
opc_result_MUX_uxn_opcodes_h_l2884_c7_b8f5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2884_c7_b8f5_cond,
opc_result_MUX_uxn_opcodes_h_l2884_c7_b8f5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2884_c7_b8f5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2884_c7_b8f5_return_output);

-- nip2_uxn_opcodes_h_l2884_c40_1852
nip2_uxn_opcodes_h_l2884_c40_1852 : entity work.nip2_0CLK_1a2ef46d port map (
clk,
nip2_uxn_opcodes_h_l2884_c40_1852_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l2884_c40_1852_phase,
nip2_uxn_opcodes_h_l2884_c40_1852_ins,
nip2_uxn_opcodes_h_l2884_c40_1852_previous_stack_read,
nip2_uxn_opcodes_h_l2884_c40_1852_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2885_c11_1910
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_1910 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_1910_left,
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_1910_right,
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_1910_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_aaec
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_aaec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_aaec_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_aaec_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_aaec_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_aaec_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7519
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7519 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7519_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7519_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7519_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7519_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2885_c7_13e5
opc_result_MUX_uxn_opcodes_h_l2885_c7_13e5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2885_c7_13e5_cond,
opc_result_MUX_uxn_opcodes_h_l2885_c7_13e5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2885_c7_13e5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2885_c7_13e5_return_output);

-- swp_uxn_opcodes_h_l2885_c40_a116
swp_uxn_opcodes_h_l2885_c40_a116 : entity work.swp_0CLK_0d289325 port map (
clk,
swp_uxn_opcodes_h_l2885_c40_a116_CLOCK_ENABLE,
swp_uxn_opcodes_h_l2885_c40_a116_phase,
swp_uxn_opcodes_h_l2885_c40_a116_ins,
swp_uxn_opcodes_h_l2885_c40_a116_previous_stack_read,
swp_uxn_opcodes_h_l2885_c40_a116_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2886_c11_160d
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_160d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_160d_left,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_160d_right,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_160d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_98f3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_98f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_98f3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_98f3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_98f3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_98f3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_082a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_082a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_082a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_082a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_082a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_082a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2886_c7_7519
opc_result_MUX_uxn_opcodes_h_l2886_c7_7519 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2886_c7_7519_cond,
opc_result_MUX_uxn_opcodes_h_l2886_c7_7519_iftrue,
opc_result_MUX_uxn_opcodes_h_l2886_c7_7519_iffalse,
opc_result_MUX_uxn_opcodes_h_l2886_c7_7519_return_output);

-- swp2_uxn_opcodes_h_l2886_c40_b68d
swp2_uxn_opcodes_h_l2886_c40_b68d : entity work.swp2_0CLK_814c2afd port map (
clk,
swp2_uxn_opcodes_h_l2886_c40_b68d_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l2886_c40_b68d_phase,
swp2_uxn_opcodes_h_l2886_c40_b68d_ins,
swp2_uxn_opcodes_h_l2886_c40_b68d_previous_stack_read,
swp2_uxn_opcodes_h_l2886_c40_b68d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2887_c11_d1ed
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_d1ed : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_d1ed_left,
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_d1ed_right,
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_d1ed_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_19f4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_19f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_19f4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_19f4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_19f4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_19f4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_123e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_123e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_123e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_123e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_123e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_123e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2887_c7_082a
opc_result_MUX_uxn_opcodes_h_l2887_c7_082a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2887_c7_082a_cond,
opc_result_MUX_uxn_opcodes_h_l2887_c7_082a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2887_c7_082a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2887_c7_082a_return_output);

-- rot_uxn_opcodes_h_l2887_c40_7295
rot_uxn_opcodes_h_l2887_c40_7295 : entity work.rot_0CLK_b288bfb7 port map (
clk,
rot_uxn_opcodes_h_l2887_c40_7295_CLOCK_ENABLE,
rot_uxn_opcodes_h_l2887_c40_7295_phase,
rot_uxn_opcodes_h_l2887_c40_7295_ins,
rot_uxn_opcodes_h_l2887_c40_7295_previous_stack_read,
rot_uxn_opcodes_h_l2887_c40_7295_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2888_c11_1a10
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_1a10 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_1a10_left,
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_1a10_right,
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_1a10_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b760
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b760 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b760_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b760_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b760_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b760_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7e08
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7e08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7e08_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7e08_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7e08_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7e08_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2888_c7_123e
opc_result_MUX_uxn_opcodes_h_l2888_c7_123e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2888_c7_123e_cond,
opc_result_MUX_uxn_opcodes_h_l2888_c7_123e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2888_c7_123e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2888_c7_123e_return_output);

-- rot2_uxn_opcodes_h_l2888_c40_e209
rot2_uxn_opcodes_h_l2888_c40_e209 : entity work.rot2_0CLK_8e773831 port map (
clk,
rot2_uxn_opcodes_h_l2888_c40_e209_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l2888_c40_e209_phase,
rot2_uxn_opcodes_h_l2888_c40_e209_ins,
rot2_uxn_opcodes_h_l2888_c40_e209_previous_stack_read,
rot2_uxn_opcodes_h_l2888_c40_e209_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2889_c11_a13b
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_a13b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_a13b_left,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_a13b_right,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_a13b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_469e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_469e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_469e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_469e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_469e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_469e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_fc47
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_fc47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_fc47_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_fc47_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_fc47_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_fc47_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2889_c7_7e08
opc_result_MUX_uxn_opcodes_h_l2889_c7_7e08 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2889_c7_7e08_cond,
opc_result_MUX_uxn_opcodes_h_l2889_c7_7e08_iftrue,
opc_result_MUX_uxn_opcodes_h_l2889_c7_7e08_iffalse,
opc_result_MUX_uxn_opcodes_h_l2889_c7_7e08_return_output);

-- dup_uxn_opcodes_h_l2889_c40_331d
dup_uxn_opcodes_h_l2889_c40_331d : entity work.dup_0CLK_d4b33a56 port map (
clk,
dup_uxn_opcodes_h_l2889_c40_331d_CLOCK_ENABLE,
dup_uxn_opcodes_h_l2889_c40_331d_phase,
dup_uxn_opcodes_h_l2889_c40_331d_ins,
dup_uxn_opcodes_h_l2889_c40_331d_previous_stack_read,
dup_uxn_opcodes_h_l2889_c40_331d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2890_c11_abab
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_abab : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_abab_left,
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_abab_right,
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_abab_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_4e3f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_4e3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_4e3f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_4e3f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_4e3f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_4e3f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_b3d1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_b3d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_b3d1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_b3d1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_b3d1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_b3d1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2890_c7_fc47
opc_result_MUX_uxn_opcodes_h_l2890_c7_fc47 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2890_c7_fc47_cond,
opc_result_MUX_uxn_opcodes_h_l2890_c7_fc47_iftrue,
opc_result_MUX_uxn_opcodes_h_l2890_c7_fc47_iffalse,
opc_result_MUX_uxn_opcodes_h_l2890_c7_fc47_return_output);

-- dup2_uxn_opcodes_h_l2890_c40_0424
dup2_uxn_opcodes_h_l2890_c40_0424 : entity work.dup2_0CLK_e4095020 port map (
clk,
dup2_uxn_opcodes_h_l2890_c40_0424_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l2890_c40_0424_phase,
dup2_uxn_opcodes_h_l2890_c40_0424_ins,
dup2_uxn_opcodes_h_l2890_c40_0424_previous_stack_read,
dup2_uxn_opcodes_h_l2890_c40_0424_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2891_c11_672f
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_672f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_672f_left,
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_672f_right,
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_672f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_b005
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_b005 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_b005_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_b005_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_b005_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_b005_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_6aa8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_6aa8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_6aa8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_6aa8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_6aa8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_6aa8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2891_c7_b3d1
opc_result_MUX_uxn_opcodes_h_l2891_c7_b3d1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2891_c7_b3d1_cond,
opc_result_MUX_uxn_opcodes_h_l2891_c7_b3d1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2891_c7_b3d1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2891_c7_b3d1_return_output);

-- ovr_uxn_opcodes_h_l2891_c40_8070
ovr_uxn_opcodes_h_l2891_c40_8070 : entity work.ovr_0CLK_61914e8d port map (
clk,
ovr_uxn_opcodes_h_l2891_c40_8070_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l2891_c40_8070_phase,
ovr_uxn_opcodes_h_l2891_c40_8070_ins,
ovr_uxn_opcodes_h_l2891_c40_8070_previous_stack_read,
ovr_uxn_opcodes_h_l2891_c40_8070_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c341
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c341 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c341_left,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c341_right,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c341_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_380b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_380b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_380b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_380b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_380b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_380b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_03bc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_03bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_03bc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_03bc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_03bc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_03bc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2892_c7_6aa8
opc_result_MUX_uxn_opcodes_h_l2892_c7_6aa8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2892_c7_6aa8_cond,
opc_result_MUX_uxn_opcodes_h_l2892_c7_6aa8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2892_c7_6aa8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2892_c7_6aa8_return_output);

-- ovr2_uxn_opcodes_h_l2892_c40_3ac8
ovr2_uxn_opcodes_h_l2892_c40_3ac8 : entity work.ovr2_0CLK_bb09c2cb port map (
clk,
ovr2_uxn_opcodes_h_l2892_c40_3ac8_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l2892_c40_3ac8_phase,
ovr2_uxn_opcodes_h_l2892_c40_3ac8_ins,
ovr2_uxn_opcodes_h_l2892_c40_3ac8_previous_stack_read,
ovr2_uxn_opcodes_h_l2892_c40_3ac8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4c7e
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4c7e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4c7e_left,
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4c7e_right,
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4c7e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_28bb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_28bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_28bb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_28bb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_28bb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_28bb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_a0a5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_a0a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_a0a5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_a0a5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_a0a5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_a0a5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2893_c7_03bc
opc_result_MUX_uxn_opcodes_h_l2893_c7_03bc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2893_c7_03bc_cond,
opc_result_MUX_uxn_opcodes_h_l2893_c7_03bc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2893_c7_03bc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2893_c7_03bc_return_output);

-- equ_uxn_opcodes_h_l2893_c40_bff7
equ_uxn_opcodes_h_l2893_c40_bff7 : entity work.equ_0CLK_226c8821 port map (
clk,
equ_uxn_opcodes_h_l2893_c40_bff7_CLOCK_ENABLE,
equ_uxn_opcodes_h_l2893_c40_bff7_phase,
equ_uxn_opcodes_h_l2893_c40_bff7_ins,
equ_uxn_opcodes_h_l2893_c40_bff7_previous_stack_read,
equ_uxn_opcodes_h_l2893_c40_bff7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2894_c11_5d37
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_5d37 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_5d37_left,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_5d37_right,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_5d37_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_31e4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_31e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_31e4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_31e4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_31e4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_31e4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_ef19
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_ef19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_ef19_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_ef19_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_ef19_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_ef19_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2894_c7_a0a5
opc_result_MUX_uxn_opcodes_h_l2894_c7_a0a5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2894_c7_a0a5_cond,
opc_result_MUX_uxn_opcodes_h_l2894_c7_a0a5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2894_c7_a0a5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2894_c7_a0a5_return_output);

-- equ2_uxn_opcodes_h_l2894_c40_273e
equ2_uxn_opcodes_h_l2894_c40_273e : entity work.equ2_0CLK_609876da port map (
clk,
equ2_uxn_opcodes_h_l2894_c40_273e_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l2894_c40_273e_phase,
equ2_uxn_opcodes_h_l2894_c40_273e_ins,
equ2_uxn_opcodes_h_l2894_c40_273e_previous_stack_read,
equ2_uxn_opcodes_h_l2894_c40_273e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2895_c11_50f6
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_50f6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_50f6_left,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_50f6_right,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_50f6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8b99
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8b99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8b99_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8b99_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8b99_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8b99_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6423
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6423 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6423_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6423_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6423_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6423_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2895_c7_ef19
opc_result_MUX_uxn_opcodes_h_l2895_c7_ef19 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2895_c7_ef19_cond,
opc_result_MUX_uxn_opcodes_h_l2895_c7_ef19_iftrue,
opc_result_MUX_uxn_opcodes_h_l2895_c7_ef19_iffalse,
opc_result_MUX_uxn_opcodes_h_l2895_c7_ef19_return_output);

-- neq_uxn_opcodes_h_l2895_c40_bb2a
neq_uxn_opcodes_h_l2895_c40_bb2a : entity work.neq_0CLK_226c8821 port map (
clk,
neq_uxn_opcodes_h_l2895_c40_bb2a_CLOCK_ENABLE,
neq_uxn_opcodes_h_l2895_c40_bb2a_phase,
neq_uxn_opcodes_h_l2895_c40_bb2a_ins,
neq_uxn_opcodes_h_l2895_c40_bb2a_previous_stack_read,
neq_uxn_opcodes_h_l2895_c40_bb2a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2896_c11_06a3
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_06a3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_06a3_left,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_06a3_right,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_06a3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3555
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3555 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3555_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3555_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3555_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3555_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_a94d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_a94d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_a94d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_a94d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_a94d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_a94d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2896_c7_6423
opc_result_MUX_uxn_opcodes_h_l2896_c7_6423 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2896_c7_6423_cond,
opc_result_MUX_uxn_opcodes_h_l2896_c7_6423_iftrue,
opc_result_MUX_uxn_opcodes_h_l2896_c7_6423_iffalse,
opc_result_MUX_uxn_opcodes_h_l2896_c7_6423_return_output);

-- neq2_uxn_opcodes_h_l2896_c40_66ec
neq2_uxn_opcodes_h_l2896_c40_66ec : entity work.neq2_0CLK_609876da port map (
clk,
neq2_uxn_opcodes_h_l2896_c40_66ec_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l2896_c40_66ec_phase,
neq2_uxn_opcodes_h_l2896_c40_66ec_ins,
neq2_uxn_opcodes_h_l2896_c40_66ec_previous_stack_read,
neq2_uxn_opcodes_h_l2896_c40_66ec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2897_c11_7f78
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_7f78 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_7f78_left,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_7f78_right,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_7f78_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_d082
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_d082 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_d082_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_d082_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_d082_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_d082_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_76d0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_76d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_76d0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_76d0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_76d0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_76d0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2897_c7_a94d
opc_result_MUX_uxn_opcodes_h_l2897_c7_a94d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2897_c7_a94d_cond,
opc_result_MUX_uxn_opcodes_h_l2897_c7_a94d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2897_c7_a94d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2897_c7_a94d_return_output);

-- gth_uxn_opcodes_h_l2897_c40_0e8e
gth_uxn_opcodes_h_l2897_c40_0e8e : entity work.gth_0CLK_226c8821 port map (
clk,
gth_uxn_opcodes_h_l2897_c40_0e8e_CLOCK_ENABLE,
gth_uxn_opcodes_h_l2897_c40_0e8e_phase,
gth_uxn_opcodes_h_l2897_c40_0e8e_ins,
gth_uxn_opcodes_h_l2897_c40_0e8e_previous_stack_read,
gth_uxn_opcodes_h_l2897_c40_0e8e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4202
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4202 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4202_left,
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4202_right,
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4202_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1ae6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1ae6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1ae6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1ae6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1ae6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1ae6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_b48d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_b48d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_b48d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_b48d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_b48d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_b48d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2898_c7_76d0
opc_result_MUX_uxn_opcodes_h_l2898_c7_76d0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2898_c7_76d0_cond,
opc_result_MUX_uxn_opcodes_h_l2898_c7_76d0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2898_c7_76d0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2898_c7_76d0_return_output);

-- gth2_uxn_opcodes_h_l2898_c40_3336
gth2_uxn_opcodes_h_l2898_c40_3336 : entity work.gth2_0CLK_609876da port map (
clk,
gth2_uxn_opcodes_h_l2898_c40_3336_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l2898_c40_3336_phase,
gth2_uxn_opcodes_h_l2898_c40_3336_ins,
gth2_uxn_opcodes_h_l2898_c40_3336_previous_stack_read,
gth2_uxn_opcodes_h_l2898_c40_3336_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1649
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1649 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1649_left,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1649_right,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1649_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_75d6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_75d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_75d6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_75d6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_75d6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_75d6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_feb8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_feb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_feb8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_feb8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_feb8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_feb8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2899_c7_b48d
opc_result_MUX_uxn_opcodes_h_l2899_c7_b48d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2899_c7_b48d_cond,
opc_result_MUX_uxn_opcodes_h_l2899_c7_b48d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2899_c7_b48d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2899_c7_b48d_return_output);

-- lth_uxn_opcodes_h_l2899_c40_d21f
lth_uxn_opcodes_h_l2899_c40_d21f : entity work.lth_0CLK_226c8821 port map (
clk,
lth_uxn_opcodes_h_l2899_c40_d21f_CLOCK_ENABLE,
lth_uxn_opcodes_h_l2899_c40_d21f_phase,
lth_uxn_opcodes_h_l2899_c40_d21f_ins,
lth_uxn_opcodes_h_l2899_c40_d21f_previous_stack_read,
lth_uxn_opcodes_h_l2899_c40_d21f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2900_c11_bc77
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_bc77 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_bc77_left,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_bc77_right,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_bc77_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3ece
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3ece : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3ece_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3ece_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3ece_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3ece_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_0193
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_0193 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_0193_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_0193_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_0193_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_0193_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2900_c7_feb8
opc_result_MUX_uxn_opcodes_h_l2900_c7_feb8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2900_c7_feb8_cond,
opc_result_MUX_uxn_opcodes_h_l2900_c7_feb8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2900_c7_feb8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2900_c7_feb8_return_output);

-- lth2_uxn_opcodes_h_l2900_c40_c1f5
lth2_uxn_opcodes_h_l2900_c40_c1f5 : entity work.lth2_0CLK_609876da port map (
clk,
lth2_uxn_opcodes_h_l2900_c40_c1f5_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l2900_c40_c1f5_phase,
lth2_uxn_opcodes_h_l2900_c40_c1f5_ins,
lth2_uxn_opcodes_h_l2900_c40_c1f5_previous_stack_read,
lth2_uxn_opcodes_h_l2900_c40_c1f5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2901_c11_b68d
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_b68d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_b68d_left,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_b68d_right,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_b68d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_df1c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_df1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_df1c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_df1c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_df1c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_df1c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5780
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5780 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5780_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5780_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5780_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5780_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2901_c7_0193
opc_result_MUX_uxn_opcodes_h_l2901_c7_0193 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2901_c7_0193_cond,
opc_result_MUX_uxn_opcodes_h_l2901_c7_0193_iftrue,
opc_result_MUX_uxn_opcodes_h_l2901_c7_0193_iffalse,
opc_result_MUX_uxn_opcodes_h_l2901_c7_0193_return_output);

-- jmp_uxn_opcodes_h_l2901_c40_32e7
jmp_uxn_opcodes_h_l2901_c40_32e7 : entity work.jmp_0CLK_121b1df5 port map (
clk,
jmp_uxn_opcodes_h_l2901_c40_32e7_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l2901_c40_32e7_phase,
jmp_uxn_opcodes_h_l2901_c40_32e7_ins,
jmp_uxn_opcodes_h_l2901_c40_32e7_pc,
jmp_uxn_opcodes_h_l2901_c40_32e7_previous_stack_read,
jmp_uxn_opcodes_h_l2901_c40_32e7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b3a2
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b3a2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b3a2_left,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b3a2_right,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b3a2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_edc6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_edc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_edc6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_edc6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_edc6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_edc6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_16fa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_16fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_16fa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_16fa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_16fa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_16fa_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2902_c7_5780
opc_result_MUX_uxn_opcodes_h_l2902_c7_5780 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2902_c7_5780_cond,
opc_result_MUX_uxn_opcodes_h_l2902_c7_5780_iftrue,
opc_result_MUX_uxn_opcodes_h_l2902_c7_5780_iffalse,
opc_result_MUX_uxn_opcodes_h_l2902_c7_5780_return_output);

-- jmp2_uxn_opcodes_h_l2902_c40_6f95
jmp2_uxn_opcodes_h_l2902_c40_6f95 : entity work.jmp2_0CLK_d6642053 port map (
clk,
jmp2_uxn_opcodes_h_l2902_c40_6f95_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l2902_c40_6f95_phase,
jmp2_uxn_opcodes_h_l2902_c40_6f95_ins,
jmp2_uxn_opcodes_h_l2902_c40_6f95_previous_stack_read,
jmp2_uxn_opcodes_h_l2902_c40_6f95_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2903_c11_046c
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_046c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_046c_left,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_046c_right,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_046c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c931
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c931 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c931_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c931_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c931_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c931_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2da1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2da1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2da1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2da1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2da1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2da1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2903_c7_16fa
opc_result_MUX_uxn_opcodes_h_l2903_c7_16fa : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2903_c7_16fa_cond,
opc_result_MUX_uxn_opcodes_h_l2903_c7_16fa_iftrue,
opc_result_MUX_uxn_opcodes_h_l2903_c7_16fa_iffalse,
opc_result_MUX_uxn_opcodes_h_l2903_c7_16fa_return_output);

-- jcn_uxn_opcodes_h_l2903_c40_5135
jcn_uxn_opcodes_h_l2903_c40_5135 : entity work.jcn_0CLK_226c8821 port map (
clk,
jcn_uxn_opcodes_h_l2903_c40_5135_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l2903_c40_5135_phase,
jcn_uxn_opcodes_h_l2903_c40_5135_ins,
jcn_uxn_opcodes_h_l2903_c40_5135_pc,
jcn_uxn_opcodes_h_l2903_c40_5135_previous_stack_read,
jcn_uxn_opcodes_h_l2903_c40_5135_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2904_c11_38ec
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_38ec : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_38ec_left,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_38ec_right,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_38ec_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1893
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1893 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1893_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1893_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1893_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1893_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0b6d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0b6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0b6d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0b6d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0b6d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0b6d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2904_c7_2da1
opc_result_MUX_uxn_opcodes_h_l2904_c7_2da1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2904_c7_2da1_cond,
opc_result_MUX_uxn_opcodes_h_l2904_c7_2da1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2904_c7_2da1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2904_c7_2da1_return_output);

-- jcn2_uxn_opcodes_h_l2904_c40_e211
jcn2_uxn_opcodes_h_l2904_c40_e211 : entity work.jcn2_0CLK_12273847 port map (
clk,
jcn2_uxn_opcodes_h_l2904_c40_e211_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l2904_c40_e211_phase,
jcn2_uxn_opcodes_h_l2904_c40_e211_ins,
jcn2_uxn_opcodes_h_l2904_c40_e211_previous_stack_read,
jcn2_uxn_opcodes_h_l2904_c40_e211_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0168
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0168 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0168_left,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0168_right,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0168_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_03e6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_03e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_03e6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_03e6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_03e6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_03e6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_f6b1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_f6b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_f6b1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_f6b1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_f6b1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_f6b1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2905_c7_0b6d
opc_result_MUX_uxn_opcodes_h_l2905_c7_0b6d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2905_c7_0b6d_cond,
opc_result_MUX_uxn_opcodes_h_l2905_c7_0b6d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2905_c7_0b6d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2905_c7_0b6d_return_output);

-- jsr_uxn_opcodes_h_l2905_c40_eb2a
jsr_uxn_opcodes_h_l2905_c40_eb2a : entity work.jsr_0CLK_fedec265 port map (
clk,
jsr_uxn_opcodes_h_l2905_c40_eb2a_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l2905_c40_eb2a_phase,
jsr_uxn_opcodes_h_l2905_c40_eb2a_ins,
jsr_uxn_opcodes_h_l2905_c40_eb2a_pc,
jsr_uxn_opcodes_h_l2905_c40_eb2a_previous_stack_read,
jsr_uxn_opcodes_h_l2905_c40_eb2a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2906_c11_a219
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_a219 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_a219_left,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_a219_right,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_a219_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6b80
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6b80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6b80_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6b80_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6b80_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6b80_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_1c1b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_1c1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_1c1b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_1c1b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_1c1b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_1c1b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2906_c7_f6b1
opc_result_MUX_uxn_opcodes_h_l2906_c7_f6b1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2906_c7_f6b1_cond,
opc_result_MUX_uxn_opcodes_h_l2906_c7_f6b1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2906_c7_f6b1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2906_c7_f6b1_return_output);

-- jsr2_uxn_opcodes_h_l2906_c40_be12
jsr2_uxn_opcodes_h_l2906_c40_be12 : entity work.jsr2_0CLK_609876da port map (
clk,
jsr2_uxn_opcodes_h_l2906_c40_be12_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l2906_c40_be12_phase,
jsr2_uxn_opcodes_h_l2906_c40_be12_ins,
jsr2_uxn_opcodes_h_l2906_c40_be12_pc,
jsr2_uxn_opcodes_h_l2906_c40_be12_previous_stack_read,
jsr2_uxn_opcodes_h_l2906_c40_be12_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6dba
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6dba : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6dba_left,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6dba_right,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6dba_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_c6ac
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_c6ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_c6ac_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_c6ac_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_c6ac_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_c6ac_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4b87
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4b87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4b87_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4b87_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4b87_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4b87_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2907_c7_1c1b
opc_result_MUX_uxn_opcodes_h_l2907_c7_1c1b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2907_c7_1c1b_cond,
opc_result_MUX_uxn_opcodes_h_l2907_c7_1c1b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2907_c7_1c1b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2907_c7_1c1b_return_output);

-- sth_uxn_opcodes_h_l2907_c40_5016
sth_uxn_opcodes_h_l2907_c40_5016 : entity work.sth_0CLK_a9f1e08f port map (
clk,
sth_uxn_opcodes_h_l2907_c40_5016_CLOCK_ENABLE,
sth_uxn_opcodes_h_l2907_c40_5016_phase,
sth_uxn_opcodes_h_l2907_c40_5016_ins,
sth_uxn_opcodes_h_l2907_c40_5016_previous_stack_read,
sth_uxn_opcodes_h_l2907_c40_5016_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2908_c11_e48c
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_e48c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_e48c_left,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_e48c_right,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_e48c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d945
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d945 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d945_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d945_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d945_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d945_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a9f7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a9f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a9f7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a9f7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a9f7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a9f7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2908_c7_4b87
opc_result_MUX_uxn_opcodes_h_l2908_c7_4b87 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2908_c7_4b87_cond,
opc_result_MUX_uxn_opcodes_h_l2908_c7_4b87_iftrue,
opc_result_MUX_uxn_opcodes_h_l2908_c7_4b87_iffalse,
opc_result_MUX_uxn_opcodes_h_l2908_c7_4b87_return_output);

-- sth2_uxn_opcodes_h_l2908_c40_2433
sth2_uxn_opcodes_h_l2908_c40_2433 : entity work.sth2_0CLK_55b6500a port map (
clk,
sth2_uxn_opcodes_h_l2908_c40_2433_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l2908_c40_2433_phase,
sth2_uxn_opcodes_h_l2908_c40_2433_ins,
sth2_uxn_opcodes_h_l2908_c40_2433_previous_stack_read,
sth2_uxn_opcodes_h_l2908_c40_2433_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2909_c11_bf44
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_bf44 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_bf44_left,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_bf44_right,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_bf44_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_f727
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_f727 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_f727_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_f727_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_f727_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_f727_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_6feb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_6feb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_6feb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_6feb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_6feb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_6feb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2909_c7_a9f7
opc_result_MUX_uxn_opcodes_h_l2909_c7_a9f7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2909_c7_a9f7_cond,
opc_result_MUX_uxn_opcodes_h_l2909_c7_a9f7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2909_c7_a9f7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2909_c7_a9f7_return_output);

-- ldz_uxn_opcodes_h_l2909_c40_64a9
ldz_uxn_opcodes_h_l2909_c40_64a9 : entity work.ldz_0CLK_b128164d port map (
clk,
ldz_uxn_opcodes_h_l2909_c40_64a9_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l2909_c40_64a9_phase,
ldz_uxn_opcodes_h_l2909_c40_64a9_ins,
ldz_uxn_opcodes_h_l2909_c40_64a9_previous_stack_read,
ldz_uxn_opcodes_h_l2909_c40_64a9_previous_ram_read,
ldz_uxn_opcodes_h_l2909_c40_64a9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2910_c11_5a29
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_5a29 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_5a29_left,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_5a29_right,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_5a29_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_cb41
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_cb41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_cb41_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_cb41_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_cb41_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_cb41_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_af8e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_af8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_af8e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_af8e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_af8e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_af8e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2910_c7_6feb
opc_result_MUX_uxn_opcodes_h_l2910_c7_6feb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2910_c7_6feb_cond,
opc_result_MUX_uxn_opcodes_h_l2910_c7_6feb_iftrue,
opc_result_MUX_uxn_opcodes_h_l2910_c7_6feb_iffalse,
opc_result_MUX_uxn_opcodes_h_l2910_c7_6feb_return_output);

-- ldz2_uxn_opcodes_h_l2910_c40_a8f0
ldz2_uxn_opcodes_h_l2910_c40_a8f0 : entity work.ldz2_0CLK_2ab048cc port map (
clk,
ldz2_uxn_opcodes_h_l2910_c40_a8f0_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l2910_c40_a8f0_phase,
ldz2_uxn_opcodes_h_l2910_c40_a8f0_ins,
ldz2_uxn_opcodes_h_l2910_c40_a8f0_previous_stack_read,
ldz2_uxn_opcodes_h_l2910_c40_a8f0_previous_ram_read,
ldz2_uxn_opcodes_h_l2910_c40_a8f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2911_c11_fdda
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_fdda : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_fdda_left,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_fdda_right,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_fdda_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_779e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_779e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_779e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_779e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_779e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_779e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_99f2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_99f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_99f2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_99f2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_99f2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_99f2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2911_c7_af8e
opc_result_MUX_uxn_opcodes_h_l2911_c7_af8e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2911_c7_af8e_cond,
opc_result_MUX_uxn_opcodes_h_l2911_c7_af8e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2911_c7_af8e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2911_c7_af8e_return_output);

-- stz_uxn_opcodes_h_l2911_c40_7d0e
stz_uxn_opcodes_h_l2911_c40_7d0e : entity work.stz_0CLK_bacf6a1d port map (
clk,
stz_uxn_opcodes_h_l2911_c40_7d0e_CLOCK_ENABLE,
stz_uxn_opcodes_h_l2911_c40_7d0e_phase,
stz_uxn_opcodes_h_l2911_c40_7d0e_ins,
stz_uxn_opcodes_h_l2911_c40_7d0e_previous_stack_read,
stz_uxn_opcodes_h_l2911_c40_7d0e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a2fc
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a2fc : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a2fc_left,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a2fc_right,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a2fc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_dd8d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_dd8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_dd8d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_dd8d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_dd8d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_dd8d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3bd2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3bd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3bd2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3bd2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3bd2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3bd2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2912_c7_99f2
opc_result_MUX_uxn_opcodes_h_l2912_c7_99f2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2912_c7_99f2_cond,
opc_result_MUX_uxn_opcodes_h_l2912_c7_99f2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2912_c7_99f2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2912_c7_99f2_return_output);

-- stz2_uxn_opcodes_h_l2912_c40_4717
stz2_uxn_opcodes_h_l2912_c40_4717 : entity work.stz2_0CLK_75b4bee3 port map (
clk,
stz2_uxn_opcodes_h_l2912_c40_4717_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l2912_c40_4717_phase,
stz2_uxn_opcodes_h_l2912_c40_4717_ins,
stz2_uxn_opcodes_h_l2912_c40_4717_previous_stack_read,
stz2_uxn_opcodes_h_l2912_c40_4717_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2913_c11_d142
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_d142 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_d142_left,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_d142_right,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_d142_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f11
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f11_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f11_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f11_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f11_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_6fd2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_6fd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_6fd2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_6fd2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_6fd2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_6fd2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2913_c7_3bd2
opc_result_MUX_uxn_opcodes_h_l2913_c7_3bd2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2913_c7_3bd2_cond,
opc_result_MUX_uxn_opcodes_h_l2913_c7_3bd2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2913_c7_3bd2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2913_c7_3bd2_return_output);

-- ldr_uxn_opcodes_h_l2913_c40_ef78
ldr_uxn_opcodes_h_l2913_c40_ef78 : entity work.ldr_0CLK_f74745d5 port map (
clk,
ldr_uxn_opcodes_h_l2913_c40_ef78_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l2913_c40_ef78_phase,
ldr_uxn_opcodes_h_l2913_c40_ef78_ins,
ldr_uxn_opcodes_h_l2913_c40_ef78_pc,
ldr_uxn_opcodes_h_l2913_c40_ef78_previous_stack_read,
ldr_uxn_opcodes_h_l2913_c40_ef78_previous_ram_read,
ldr_uxn_opcodes_h_l2913_c40_ef78_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2914_c11_cd99
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_cd99 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_cd99_left,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_cd99_right,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_cd99_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49d2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49d2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49d2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49d2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49d2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_a2fc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_a2fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_a2fc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_a2fc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_a2fc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_a2fc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2914_c7_6fd2
opc_result_MUX_uxn_opcodes_h_l2914_c7_6fd2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2914_c7_6fd2_cond,
opc_result_MUX_uxn_opcodes_h_l2914_c7_6fd2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2914_c7_6fd2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2914_c7_6fd2_return_output);

-- ldr2_uxn_opcodes_h_l2914_c40_fc66
ldr2_uxn_opcodes_h_l2914_c40_fc66 : entity work.ldr2_0CLK_b7cf2331 port map (
clk,
ldr2_uxn_opcodes_h_l2914_c40_fc66_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l2914_c40_fc66_phase,
ldr2_uxn_opcodes_h_l2914_c40_fc66_ins,
ldr2_uxn_opcodes_h_l2914_c40_fc66_pc,
ldr2_uxn_opcodes_h_l2914_c40_fc66_previous_stack_read,
ldr2_uxn_opcodes_h_l2914_c40_fc66_previous_ram_read,
ldr2_uxn_opcodes_h_l2914_c40_fc66_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2915_c11_5cf4
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_5cf4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_5cf4_left,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_5cf4_right,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_5cf4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a4db
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a4db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a4db_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a4db_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a4db_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a4db_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_1b3d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_1b3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_1b3d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_1b3d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_1b3d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_1b3d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2915_c7_a2fc
opc_result_MUX_uxn_opcodes_h_l2915_c7_a2fc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2915_c7_a2fc_cond,
opc_result_MUX_uxn_opcodes_h_l2915_c7_a2fc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2915_c7_a2fc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2915_c7_a2fc_return_output);

-- str1_uxn_opcodes_h_l2915_c40_f3ab
str1_uxn_opcodes_h_l2915_c40_f3ab : entity work.str1_0CLK_85d5529e port map (
clk,
str1_uxn_opcodes_h_l2915_c40_f3ab_CLOCK_ENABLE,
str1_uxn_opcodes_h_l2915_c40_f3ab_phase,
str1_uxn_opcodes_h_l2915_c40_f3ab_ins,
str1_uxn_opcodes_h_l2915_c40_f3ab_pc,
str1_uxn_opcodes_h_l2915_c40_f3ab_previous_stack_read,
str1_uxn_opcodes_h_l2915_c40_f3ab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2916_c11_1036
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_1036 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_1036_left,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_1036_right,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_1036_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9bec
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9bec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9bec_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9bec_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9bec_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9bec_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7424
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7424 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7424_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7424_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7424_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7424_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2916_c7_1b3d
opc_result_MUX_uxn_opcodes_h_l2916_c7_1b3d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2916_c7_1b3d_cond,
opc_result_MUX_uxn_opcodes_h_l2916_c7_1b3d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2916_c7_1b3d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2916_c7_1b3d_return_output);

-- str2_uxn_opcodes_h_l2916_c40_53ec
str2_uxn_opcodes_h_l2916_c40_53ec : entity work.str2_0CLK_75b4bee3 port map (
clk,
str2_uxn_opcodes_h_l2916_c40_53ec_CLOCK_ENABLE,
str2_uxn_opcodes_h_l2916_c40_53ec_phase,
str2_uxn_opcodes_h_l2916_c40_53ec_ins,
str2_uxn_opcodes_h_l2916_c40_53ec_pc,
str2_uxn_opcodes_h_l2916_c40_53ec_previous_stack_read,
str2_uxn_opcodes_h_l2916_c40_53ec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0b0e
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0b0e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0b0e_left,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0b0e_right,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0b0e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_bc3c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_bc3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_bc3c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_bc3c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_bc3c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_bc3c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_f6b7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_f6b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_f6b7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_f6b7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_f6b7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_f6b7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2917_c7_7424
opc_result_MUX_uxn_opcodes_h_l2917_c7_7424 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2917_c7_7424_cond,
opc_result_MUX_uxn_opcodes_h_l2917_c7_7424_iftrue,
opc_result_MUX_uxn_opcodes_h_l2917_c7_7424_iffalse,
opc_result_MUX_uxn_opcodes_h_l2917_c7_7424_return_output);

-- lda_uxn_opcodes_h_l2917_c40_025f
lda_uxn_opcodes_h_l2917_c40_025f : entity work.lda_0CLK_c634cda8 port map (
clk,
lda_uxn_opcodes_h_l2917_c40_025f_CLOCK_ENABLE,
lda_uxn_opcodes_h_l2917_c40_025f_phase,
lda_uxn_opcodes_h_l2917_c40_025f_ins,
lda_uxn_opcodes_h_l2917_c40_025f_previous_stack_read,
lda_uxn_opcodes_h_l2917_c40_025f_previous_ram_read,
lda_uxn_opcodes_h_l2917_c40_025f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2918_c11_578e
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_578e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_578e_left,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_578e_right,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_578e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_7625
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_7625 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_7625_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_7625_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_7625_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_7625_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0988
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0988 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0988_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0988_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0988_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0988_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2918_c7_f6b7
opc_result_MUX_uxn_opcodes_h_l2918_c7_f6b7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2918_c7_f6b7_cond,
opc_result_MUX_uxn_opcodes_h_l2918_c7_f6b7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2918_c7_f6b7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2918_c7_f6b7_return_output);

-- lda2_uxn_opcodes_h_l2918_c40_6eeb
lda2_uxn_opcodes_h_l2918_c40_6eeb : entity work.lda2_0CLK_19339e1d port map (
clk,
lda2_uxn_opcodes_h_l2918_c40_6eeb_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l2918_c40_6eeb_phase,
lda2_uxn_opcodes_h_l2918_c40_6eeb_ins,
lda2_uxn_opcodes_h_l2918_c40_6eeb_previous_stack_read,
lda2_uxn_opcodes_h_l2918_c40_6eeb_previous_ram_read,
lda2_uxn_opcodes_h_l2918_c40_6eeb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ea53
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ea53 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ea53_left,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ea53_right,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ea53_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_b2e8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_b2e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_b2e8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_b2e8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_b2e8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_b2e8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_6ab5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_6ab5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_6ab5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_6ab5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_6ab5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_6ab5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2919_c7_0988
opc_result_MUX_uxn_opcodes_h_l2919_c7_0988 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2919_c7_0988_cond,
opc_result_MUX_uxn_opcodes_h_l2919_c7_0988_iftrue,
opc_result_MUX_uxn_opcodes_h_l2919_c7_0988_iffalse,
opc_result_MUX_uxn_opcodes_h_l2919_c7_0988_return_output);

-- sta_uxn_opcodes_h_l2919_c40_0aa2
sta_uxn_opcodes_h_l2919_c40_0aa2 : entity work.sta_0CLK_bce25fe8 port map (
clk,
sta_uxn_opcodes_h_l2919_c40_0aa2_CLOCK_ENABLE,
sta_uxn_opcodes_h_l2919_c40_0aa2_phase,
sta_uxn_opcodes_h_l2919_c40_0aa2_ins,
sta_uxn_opcodes_h_l2919_c40_0aa2_previous_stack_read,
sta_uxn_opcodes_h_l2919_c40_0aa2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5f57
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5f57 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5f57_left,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5f57_right,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5f57_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_1737
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_1737 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_1737_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_1737_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_1737_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_1737_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_0118
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_0118 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_0118_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_0118_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_0118_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_0118_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2920_c7_6ab5
opc_result_MUX_uxn_opcodes_h_l2920_c7_6ab5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2920_c7_6ab5_cond,
opc_result_MUX_uxn_opcodes_h_l2920_c7_6ab5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2920_c7_6ab5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2920_c7_6ab5_return_output);

-- sta2_uxn_opcodes_h_l2920_c40_bcf5
sta2_uxn_opcodes_h_l2920_c40_bcf5 : entity work.sta2_0CLK_4674db74 port map (
clk,
sta2_uxn_opcodes_h_l2920_c40_bcf5_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l2920_c40_bcf5_phase,
sta2_uxn_opcodes_h_l2920_c40_bcf5_ins,
sta2_uxn_opcodes_h_l2920_c40_bcf5_previous_stack_read,
sta2_uxn_opcodes_h_l2920_c40_bcf5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b92d
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b92d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b92d_left,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b92d_right,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b92d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0fcf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0fcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0fcf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0fcf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0fcf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0fcf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_4384
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_4384 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_4384_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_4384_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_4384_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_4384_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2921_c7_0118
opc_result_MUX_uxn_opcodes_h_l2921_c7_0118 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2921_c7_0118_cond,
opc_result_MUX_uxn_opcodes_h_l2921_c7_0118_iftrue,
opc_result_MUX_uxn_opcodes_h_l2921_c7_0118_iffalse,
opc_result_MUX_uxn_opcodes_h_l2921_c7_0118_return_output);

-- dei_uxn_opcodes_h_l2921_c40_7b40
dei_uxn_opcodes_h_l2921_c40_7b40 : entity work.dei_0CLK_9bcaee2f port map (
clk,
dei_uxn_opcodes_h_l2921_c40_7b40_CLOCK_ENABLE,
dei_uxn_opcodes_h_l2921_c40_7b40_phase,
dei_uxn_opcodes_h_l2921_c40_7b40_ins,
dei_uxn_opcodes_h_l2921_c40_7b40_previous_stack_read,
dei_uxn_opcodes_h_l2921_c40_7b40_previous_device_ram_read,
dei_uxn_opcodes_h_l2921_c40_7b40_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d26c
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d26c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d26c_left,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d26c_right,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d26c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d5de
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d5de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d5de_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d5de_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d5de_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d5de_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_c223
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_c223 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_c223_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_c223_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_c223_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_c223_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2922_c7_4384
opc_result_MUX_uxn_opcodes_h_l2922_c7_4384 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2922_c7_4384_cond,
opc_result_MUX_uxn_opcodes_h_l2922_c7_4384_iftrue,
opc_result_MUX_uxn_opcodes_h_l2922_c7_4384_iffalse,
opc_result_MUX_uxn_opcodes_h_l2922_c7_4384_return_output);

-- dei2_uxn_opcodes_h_l2922_c40_30a5
dei2_uxn_opcodes_h_l2922_c40_30a5 : entity work.dei2_0CLK_919eceda port map (
clk,
dei2_uxn_opcodes_h_l2922_c40_30a5_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l2922_c40_30a5_phase,
dei2_uxn_opcodes_h_l2922_c40_30a5_ins,
dei2_uxn_opcodes_h_l2922_c40_30a5_previous_stack_read,
dei2_uxn_opcodes_h_l2922_c40_30a5_previous_device_ram_read,
dei2_uxn_opcodes_h_l2922_c40_30a5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d7cf
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d7cf : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d7cf_left,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d7cf_right,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d7cf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_467e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_467e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_467e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_467e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_467e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_467e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_63e8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_63e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_63e8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_63e8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_63e8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_63e8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2923_c7_c223
opc_result_MUX_uxn_opcodes_h_l2923_c7_c223 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2923_c7_c223_cond,
opc_result_MUX_uxn_opcodes_h_l2923_c7_c223_iftrue,
opc_result_MUX_uxn_opcodes_h_l2923_c7_c223_iffalse,
opc_result_MUX_uxn_opcodes_h_l2923_c7_c223_return_output);

-- deo_uxn_opcodes_h_l2923_c40_4ca7
deo_uxn_opcodes_h_l2923_c40_4ca7 : entity work.deo_0CLK_71870e21 port map (
clk,
deo_uxn_opcodes_h_l2923_c40_4ca7_CLOCK_ENABLE,
deo_uxn_opcodes_h_l2923_c40_4ca7_phase,
deo_uxn_opcodes_h_l2923_c40_4ca7_ins,
deo_uxn_opcodes_h_l2923_c40_4ca7_previous_stack_read,
deo_uxn_opcodes_h_l2923_c40_4ca7_previous_device_ram_read,
deo_uxn_opcodes_h_l2923_c40_4ca7_previous_ram_read,
deo_uxn_opcodes_h_l2923_c40_4ca7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2924_c11_a25b
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_a25b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_a25b_left,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_a25b_right,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_a25b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_5439
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_5439 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_5439_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_5439_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_5439_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_5439_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_6f04
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_6f04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_6f04_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_6f04_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_6f04_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_6f04_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2924_c7_63e8
opc_result_MUX_uxn_opcodes_h_l2924_c7_63e8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2924_c7_63e8_cond,
opc_result_MUX_uxn_opcodes_h_l2924_c7_63e8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2924_c7_63e8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2924_c7_63e8_return_output);

-- deo2_uxn_opcodes_h_l2924_c40_a34e
deo2_uxn_opcodes_h_l2924_c40_a34e : entity work.deo2_0CLK_ba9fabfb port map (
clk,
deo2_uxn_opcodes_h_l2924_c40_a34e_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l2924_c40_a34e_phase,
deo2_uxn_opcodes_h_l2924_c40_a34e_ins,
deo2_uxn_opcodes_h_l2924_c40_a34e_previous_stack_read,
deo2_uxn_opcodes_h_l2924_c40_a34e_previous_device_ram_read,
deo2_uxn_opcodes_h_l2924_c40_a34e_previous_ram_read,
deo2_uxn_opcodes_h_l2924_c40_a34e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2925_c11_febb
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_febb : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_febb_left,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_febb_right,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_febb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_36ab
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_36ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_36ab_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_36ab_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_36ab_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_36ab_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e663
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e663 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e663_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e663_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e663_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e663_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2925_c7_6f04
opc_result_MUX_uxn_opcodes_h_l2925_c7_6f04 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2925_c7_6f04_cond,
opc_result_MUX_uxn_opcodes_h_l2925_c7_6f04_iftrue,
opc_result_MUX_uxn_opcodes_h_l2925_c7_6f04_iffalse,
opc_result_MUX_uxn_opcodes_h_l2925_c7_6f04_return_output);

-- add_uxn_opcodes_h_l2925_c40_b133
add_uxn_opcodes_h_l2925_c40_b133 : entity work.add_0CLK_64d180f1 port map (
clk,
add_uxn_opcodes_h_l2925_c40_b133_CLOCK_ENABLE,
add_uxn_opcodes_h_l2925_c40_b133_phase,
add_uxn_opcodes_h_l2925_c40_b133_ins,
add_uxn_opcodes_h_l2925_c40_b133_previous_stack_read,
add_uxn_opcodes_h_l2925_c40_b133_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c59d
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c59d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c59d_left,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c59d_right,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c59d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_cb5e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_cb5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_cb5e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_cb5e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_cb5e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_cb5e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_76e1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_76e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_76e1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_76e1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_76e1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_76e1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2926_c7_e663
opc_result_MUX_uxn_opcodes_h_l2926_c7_e663 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2926_c7_e663_cond,
opc_result_MUX_uxn_opcodes_h_l2926_c7_e663_iftrue,
opc_result_MUX_uxn_opcodes_h_l2926_c7_e663_iffalse,
opc_result_MUX_uxn_opcodes_h_l2926_c7_e663_return_output);

-- add2_uxn_opcodes_h_l2926_c40_7dbe
add2_uxn_opcodes_h_l2926_c40_7dbe : entity work.add2_0CLK_50b92fe2 port map (
clk,
add2_uxn_opcodes_h_l2926_c40_7dbe_CLOCK_ENABLE,
add2_uxn_opcodes_h_l2926_c40_7dbe_phase,
add2_uxn_opcodes_h_l2926_c40_7dbe_ins,
add2_uxn_opcodes_h_l2926_c40_7dbe_previous_stack_read,
add2_uxn_opcodes_h_l2926_c40_7dbe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8478
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8478 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8478_left,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8478_right,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8478_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ebd8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ebd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ebd8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ebd8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ebd8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ebd8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_85ac
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_85ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_85ac_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_85ac_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_85ac_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_85ac_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2927_c7_76e1
opc_result_MUX_uxn_opcodes_h_l2927_c7_76e1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2927_c7_76e1_cond,
opc_result_MUX_uxn_opcodes_h_l2927_c7_76e1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2927_c7_76e1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2927_c7_76e1_return_output);

-- sub_uxn_opcodes_h_l2927_c40_23ae
sub_uxn_opcodes_h_l2927_c40_23ae : entity work.sub_0CLK_64d180f1 port map (
clk,
sub_uxn_opcodes_h_l2927_c40_23ae_CLOCK_ENABLE,
sub_uxn_opcodes_h_l2927_c40_23ae_phase,
sub_uxn_opcodes_h_l2927_c40_23ae_ins,
sub_uxn_opcodes_h_l2927_c40_23ae_previous_stack_read,
sub_uxn_opcodes_h_l2927_c40_23ae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7095
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7095 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7095_left,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7095_right,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7095_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_2220
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_2220 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_2220_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_2220_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_2220_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_2220_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_41af
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_41af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_41af_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_41af_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_41af_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_41af_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2928_c7_85ac
opc_result_MUX_uxn_opcodes_h_l2928_c7_85ac : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2928_c7_85ac_cond,
opc_result_MUX_uxn_opcodes_h_l2928_c7_85ac_iftrue,
opc_result_MUX_uxn_opcodes_h_l2928_c7_85ac_iffalse,
opc_result_MUX_uxn_opcodes_h_l2928_c7_85ac_return_output);

-- sub2_uxn_opcodes_h_l2928_c40_785e
sub2_uxn_opcodes_h_l2928_c40_785e : entity work.sub2_0CLK_50b92fe2 port map (
clk,
sub2_uxn_opcodes_h_l2928_c40_785e_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l2928_c40_785e_phase,
sub2_uxn_opcodes_h_l2928_c40_785e_ins,
sub2_uxn_opcodes_h_l2928_c40_785e_previous_stack_read,
sub2_uxn_opcodes_h_l2928_c40_785e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0d25
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0d25 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0d25_left,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0d25_right,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0d25_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_70fb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_70fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_70fb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_70fb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_70fb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_70fb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b79c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b79c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b79c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b79c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b79c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b79c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2929_c7_41af
opc_result_MUX_uxn_opcodes_h_l2929_c7_41af : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2929_c7_41af_cond,
opc_result_MUX_uxn_opcodes_h_l2929_c7_41af_iftrue,
opc_result_MUX_uxn_opcodes_h_l2929_c7_41af_iffalse,
opc_result_MUX_uxn_opcodes_h_l2929_c7_41af_return_output);

-- mul_uxn_opcodes_h_l2929_c40_120a
mul_uxn_opcodes_h_l2929_c40_120a : entity work.mul_0CLK_64d180f1 port map (
clk,
mul_uxn_opcodes_h_l2929_c40_120a_CLOCK_ENABLE,
mul_uxn_opcodes_h_l2929_c40_120a_phase,
mul_uxn_opcodes_h_l2929_c40_120a_ins,
mul_uxn_opcodes_h_l2929_c40_120a_previous_stack_read,
mul_uxn_opcodes_h_l2929_c40_120a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2930_c11_7b9b
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_7b9b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_7b9b_left,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_7b9b_right,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_7b9b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_a39f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_a39f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_a39f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_a39f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_a39f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_a39f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_12f3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_12f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_12f3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_12f3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_12f3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_12f3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2930_c7_b79c
opc_result_MUX_uxn_opcodes_h_l2930_c7_b79c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2930_c7_b79c_cond,
opc_result_MUX_uxn_opcodes_h_l2930_c7_b79c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2930_c7_b79c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2930_c7_b79c_return_output);

-- mul2_uxn_opcodes_h_l2930_c40_d33c
mul2_uxn_opcodes_h_l2930_c40_d33c : entity work.mul2_0CLK_50b92fe2 port map (
clk,
mul2_uxn_opcodes_h_l2930_c40_d33c_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l2930_c40_d33c_phase,
mul2_uxn_opcodes_h_l2930_c40_d33c_ins,
mul2_uxn_opcodes_h_l2930_c40_d33c_previous_stack_read,
mul2_uxn_opcodes_h_l2930_c40_d33c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2931_c11_caa6
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_caa6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_caa6_left,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_caa6_right,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_caa6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5db8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5db8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5db8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5db8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5db8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5db8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b43d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b43d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b43d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b43d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b43d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b43d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2931_c7_12f3
opc_result_MUX_uxn_opcodes_h_l2931_c7_12f3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2931_c7_12f3_cond,
opc_result_MUX_uxn_opcodes_h_l2931_c7_12f3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2931_c7_12f3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2931_c7_12f3_return_output);

-- div_uxn_opcodes_h_l2931_c40_ca74
div_uxn_opcodes_h_l2931_c40_ca74 : entity work.div_0CLK_09f6f009 port map (
clk,
div_uxn_opcodes_h_l2931_c40_ca74_CLOCK_ENABLE,
div_uxn_opcodes_h_l2931_c40_ca74_phase,
div_uxn_opcodes_h_l2931_c40_ca74_ins,
div_uxn_opcodes_h_l2931_c40_ca74_previous_stack_read,
div_uxn_opcodes_h_l2931_c40_ca74_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2932_c11_e09c
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_e09c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_e09c_left,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_e09c_right,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_e09c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3296
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3296 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3296_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3296_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3296_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3296_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_982e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_982e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_982e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_982e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_982e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_982e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2932_c7_b43d
opc_result_MUX_uxn_opcodes_h_l2932_c7_b43d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2932_c7_b43d_cond,
opc_result_MUX_uxn_opcodes_h_l2932_c7_b43d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2932_c7_b43d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2932_c7_b43d_return_output);

-- div2_uxn_opcodes_h_l2932_c40_e2aa
div2_uxn_opcodes_h_l2932_c40_e2aa : entity work.div2_0CLK_7cf9dac2 port map (
clk,
div2_uxn_opcodes_h_l2932_c40_e2aa_CLOCK_ENABLE,
div2_uxn_opcodes_h_l2932_c40_e2aa_phase,
div2_uxn_opcodes_h_l2932_c40_e2aa_ins,
div2_uxn_opcodes_h_l2932_c40_e2aa_previous_stack_read,
div2_uxn_opcodes_h_l2932_c40_e2aa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f733
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f733 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f733_left,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f733_right,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f733_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b0a3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b0a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b0a3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b0a3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b0a3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b0a3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_3562
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_3562 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_3562_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_3562_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_3562_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_3562_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2933_c7_982e
opc_result_MUX_uxn_opcodes_h_l2933_c7_982e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2933_c7_982e_cond,
opc_result_MUX_uxn_opcodes_h_l2933_c7_982e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2933_c7_982e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2933_c7_982e_return_output);

-- and_uxn_opcodes_h_l2933_c40_3577
and_uxn_opcodes_h_l2933_c40_3577 : entity work.and_0CLK_64d180f1 port map (
clk,
and_uxn_opcodes_h_l2933_c40_3577_CLOCK_ENABLE,
and_uxn_opcodes_h_l2933_c40_3577_phase,
and_uxn_opcodes_h_l2933_c40_3577_ins,
and_uxn_opcodes_h_l2933_c40_3577_previous_stack_read,
and_uxn_opcodes_h_l2933_c40_3577_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ecba
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ecba : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ecba_left,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ecba_right,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ecba_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_fd55
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_fd55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_fd55_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_fd55_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_fd55_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_fd55_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_be09
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_be09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_be09_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_be09_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_be09_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_be09_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2934_c7_3562
opc_result_MUX_uxn_opcodes_h_l2934_c7_3562 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2934_c7_3562_cond,
opc_result_MUX_uxn_opcodes_h_l2934_c7_3562_iftrue,
opc_result_MUX_uxn_opcodes_h_l2934_c7_3562_iffalse,
opc_result_MUX_uxn_opcodes_h_l2934_c7_3562_return_output);

-- and2_uxn_opcodes_h_l2934_c40_29c3
and2_uxn_opcodes_h_l2934_c40_29c3 : entity work.and2_0CLK_50b92fe2 port map (
clk,
and2_uxn_opcodes_h_l2934_c40_29c3_CLOCK_ENABLE,
and2_uxn_opcodes_h_l2934_c40_29c3_phase,
and2_uxn_opcodes_h_l2934_c40_29c3_ins,
and2_uxn_opcodes_h_l2934_c40_29c3_previous_stack_read,
and2_uxn_opcodes_h_l2934_c40_29c3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9e52
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9e52 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9e52_left,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9e52_right,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9e52_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5013
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5013 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5013_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5013_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5013_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5013_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fe83
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fe83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fe83_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fe83_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fe83_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fe83_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2935_c7_be09
opc_result_MUX_uxn_opcodes_h_l2935_c7_be09 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2935_c7_be09_cond,
opc_result_MUX_uxn_opcodes_h_l2935_c7_be09_iftrue,
opc_result_MUX_uxn_opcodes_h_l2935_c7_be09_iffalse,
opc_result_MUX_uxn_opcodes_h_l2935_c7_be09_return_output);

-- ora_uxn_opcodes_h_l2935_c40_afa7
ora_uxn_opcodes_h_l2935_c40_afa7 : entity work.ora_0CLK_64d180f1 port map (
clk,
ora_uxn_opcodes_h_l2935_c40_afa7_CLOCK_ENABLE,
ora_uxn_opcodes_h_l2935_c40_afa7_phase,
ora_uxn_opcodes_h_l2935_c40_afa7_ins,
ora_uxn_opcodes_h_l2935_c40_afa7_previous_stack_read,
ora_uxn_opcodes_h_l2935_c40_afa7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0fdc
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0fdc : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0fdc_left,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0fdc_right,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0fdc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e69b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e69b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e69b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e69b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e69b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e69b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_97a0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_97a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_97a0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_97a0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_97a0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_97a0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2936_c7_fe83
opc_result_MUX_uxn_opcodes_h_l2936_c7_fe83 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2936_c7_fe83_cond,
opc_result_MUX_uxn_opcodes_h_l2936_c7_fe83_iftrue,
opc_result_MUX_uxn_opcodes_h_l2936_c7_fe83_iffalse,
opc_result_MUX_uxn_opcodes_h_l2936_c7_fe83_return_output);

-- ora2_uxn_opcodes_h_l2936_c40_79e7
ora2_uxn_opcodes_h_l2936_c40_79e7 : entity work.ora2_0CLK_50b92fe2 port map (
clk,
ora2_uxn_opcodes_h_l2936_c40_79e7_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l2936_c40_79e7_phase,
ora2_uxn_opcodes_h_l2936_c40_79e7_ins,
ora2_uxn_opcodes_h_l2936_c40_79e7_previous_stack_read,
ora2_uxn_opcodes_h_l2936_c40_79e7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2937_c11_9387
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_9387 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_9387_left,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_9387_right,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_9387_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_54cd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_54cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_54cd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_54cd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_54cd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_54cd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_174c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_174c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_174c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_174c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_174c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_174c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2937_c7_97a0
opc_result_MUX_uxn_opcodes_h_l2937_c7_97a0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2937_c7_97a0_cond,
opc_result_MUX_uxn_opcodes_h_l2937_c7_97a0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2937_c7_97a0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2937_c7_97a0_return_output);

-- eor_uxn_opcodes_h_l2937_c40_8514
eor_uxn_opcodes_h_l2937_c40_8514 : entity work.eor_0CLK_64d180f1 port map (
clk,
eor_uxn_opcodes_h_l2937_c40_8514_CLOCK_ENABLE,
eor_uxn_opcodes_h_l2937_c40_8514_phase,
eor_uxn_opcodes_h_l2937_c40_8514_ins,
eor_uxn_opcodes_h_l2937_c40_8514_previous_stack_read,
eor_uxn_opcodes_h_l2937_c40_8514_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2938_c11_5ad7
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_5ad7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_5ad7_left,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_5ad7_right,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_5ad7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_90a5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_90a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_90a5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_90a5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_90a5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_90a5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4b7a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4b7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4b7a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4b7a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4b7a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4b7a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2938_c7_174c
opc_result_MUX_uxn_opcodes_h_l2938_c7_174c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2938_c7_174c_cond,
opc_result_MUX_uxn_opcodes_h_l2938_c7_174c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2938_c7_174c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2938_c7_174c_return_output);

-- eor2_uxn_opcodes_h_l2938_c40_d819
eor2_uxn_opcodes_h_l2938_c40_d819 : entity work.eor2_0CLK_50b92fe2 port map (
clk,
eor2_uxn_opcodes_h_l2938_c40_d819_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l2938_c40_d819_phase,
eor2_uxn_opcodes_h_l2938_c40_d819_ins,
eor2_uxn_opcodes_h_l2938_c40_d819_previous_stack_read,
eor2_uxn_opcodes_h_l2938_c40_d819_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f49d
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f49d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f49d_left,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f49d_right,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f49d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_d14e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_d14e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_d14e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_d14e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_d14e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_d14e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9399
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9399 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9399_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9399_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9399_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9399_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2939_c7_4b7a
opc_result_MUX_uxn_opcodes_h_l2939_c7_4b7a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2939_c7_4b7a_cond,
opc_result_MUX_uxn_opcodes_h_l2939_c7_4b7a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2939_c7_4b7a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2939_c7_4b7a_return_output);

-- sft_uxn_opcodes_h_l2939_c40_5619
sft_uxn_opcodes_h_l2939_c40_5619 : entity work.sft_0CLK_46cced44 port map (
clk,
sft_uxn_opcodes_h_l2939_c40_5619_CLOCK_ENABLE,
sft_uxn_opcodes_h_l2939_c40_5619_phase,
sft_uxn_opcodes_h_l2939_c40_5619_ins,
sft_uxn_opcodes_h_l2939_c40_5619_previous_stack_read,
sft_uxn_opcodes_h_l2939_c40_5619_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2940_c11_86c4
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_86c4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_86c4_left,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_86c4_right,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_86c4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_333b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_333b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_333b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_333b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_333b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_333b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2940_c7_9399
opc_result_MUX_uxn_opcodes_h_l2940_c7_9399 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2940_c7_9399_cond,
opc_result_MUX_uxn_opcodes_h_l2940_c7_9399_iftrue,
opc_result_MUX_uxn_opcodes_h_l2940_c7_9399_iffalse,
opc_result_MUX_uxn_opcodes_h_l2940_c7_9399_return_output);

-- sft2_uxn_opcodes_h_l2940_c40_180c
sft2_uxn_opcodes_h_l2940_c40_180c : entity work.sft2_0CLK_e8b37bfc port map (
clk,
sft2_uxn_opcodes_h_l2940_c40_180c_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l2940_c40_180c_phase,
sft2_uxn_opcodes_h_l2940_c40_180c_ins,
sft2_uxn_opcodes_h_l2940_c40_180c_previous_stack_read,
sft2_uxn_opcodes_h_l2940_c40_180c_return_output);

-- CONST_SR_6_uxn_opcodes_h_l2942_c16_ddec
CONST_SR_6_uxn_opcodes_h_l2942_c16_ddec : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_opcodes_h_l2942_c16_ddec_x,
CONST_SR_6_uxn_opcodes_h_l2942_c16_ddec_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2943_c2_2a80
BIN_OP_XOR_uxn_opcodes_h_l2943_c2_2a80 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2943_c2_2a80_left,
BIN_OP_XOR_uxn_opcodes_h_l2943_c2_2a80_right,
BIN_OP_XOR_uxn_opcodes_h_l2943_c2_2a80_return_output);

-- sp0_MUX_uxn_opcodes_h_l2945_c2_2619
sp0_MUX_uxn_opcodes_h_l2945_c2_2619 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2945_c2_2619_cond,
sp0_MUX_uxn_opcodes_h_l2945_c2_2619_iftrue,
sp0_MUX_uxn_opcodes_h_l2945_c2_2619_iffalse,
sp0_MUX_uxn_opcodes_h_l2945_c2_2619_return_output);

-- sp1_MUX_uxn_opcodes_h_l2945_c2_2619
sp1_MUX_uxn_opcodes_h_l2945_c2_2619 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2945_c2_2619_cond,
sp1_MUX_uxn_opcodes_h_l2945_c2_2619_iftrue,
sp1_MUX_uxn_opcodes_h_l2945_c2_2619_iffalse,
sp1_MUX_uxn_opcodes_h_l2945_c2_2619_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_3101
BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_3101 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_3101_left,
BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_3101_right,
BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_3101_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_956e
BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_956e : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_956e_left,
BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_956e_right,
BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_956e_return_output);

-- MUX_uxn_opcodes_h_l2951_c29_c53a
MUX_uxn_opcodes_h_l2951_c29_c53a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2951_c29_c53a_cond,
MUX_uxn_opcodes_h_l2951_c29_c53a_iftrue,
MUX_uxn_opcodes_h_l2951_c29_c53a_iffalse,
MUX_uxn_opcodes_h_l2951_c29_c53a_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_1ae1
BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_1ae1 : entity work.BIN_OP_MINUS_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_1ae1_left,
BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_1ae1_right,
BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_1ae1_return_output);

-- MUX_uxn_opcodes_h_l2952_c20_7b4b
MUX_uxn_opcodes_h_l2952_c20_7b4b : entity work.MUX_uint1_t_uint9_t_uint9_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2952_c20_7b4b_cond,
MUX_uxn_opcodes_h_l2952_c20_7b4b_iftrue,
MUX_uxn_opcodes_h_l2952_c20_7b4b_iffalse,
MUX_uxn_opcodes_h_l2952_c20_7b4b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2952_c2_4e93
BIN_OP_OR_uxn_opcodes_h_l2952_c2_4e93 : entity work.BIN_OP_OR_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2952_c2_4e93_left,
BIN_OP_OR_uxn_opcodes_h_l2952_c2_4e93_right,
BIN_OP_OR_uxn_opcodes_h_l2952_c2_4e93_return_output);

-- stack_ram_update_uxn_opcodes_h_l2954_c24_35a2
stack_ram_update_uxn_opcodes_h_l2954_c24_35a2 : entity work.stack_ram_update_0CLK_23f04728 port map (
clk,
stack_ram_update_uxn_opcodes_h_l2954_c24_35a2_CLOCK_ENABLE,
stack_ram_update_uxn_opcodes_h_l2954_c24_35a2_stack_address,
stack_ram_update_uxn_opcodes_h_l2954_c24_35a2_value,
stack_ram_update_uxn_opcodes_h_l2954_c24_35a2_write_enable,
stack_ram_update_uxn_opcodes_h_l2954_c24_35a2_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_ram_read,
 previous_device_ram_read,
 -- Registers
 sp0,
 sp1,
 ins_a_3f,
 opc,
 stack_index,
 is_wait,
 is_imm,
 stack_address,
 previous_stack_read,
 opc_result,
 opc_eval_result,
 -- All submodule outputs
 BIN_OP_AND_uxn_opcodes_h_l2863_c14_05db_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5f5d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2864_c14_2a91_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_8de6_return_output,
 BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_0259_return_output,
 MUX_uxn_opcodes_h_l2864_c14_f4d0_return_output,
 MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2871_c6_82b7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_bbf6_return_output,
 is_wait_MUX_uxn_opcodes_h_l2871_c2_ccbf_return_output,
 opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_return_output,
 brk_uxn_opcodes_h_l2871_c48_25ee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2872_c11_569f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_770a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_4205_return_output,
 opc_result_MUX_uxn_opcodes_h_l2872_c7_bbf6_return_output,
 jci_uxn_opcodes_h_l2872_c40_d019_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2873_c11_341c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_ec0c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_de8b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2873_c7_4205_return_output,
 jmi_uxn_opcodes_h_l2873_c40_d19d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2874_c11_869e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_2b8e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_7c1f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2874_c7_de8b_return_output,
 jsi_uxn_opcodes_h_l2874_c40_1591_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a19b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_5b0d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_15c6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2875_c7_7c1f_return_output,
 lit_uxn_opcodes_h_l2875_c40_4dff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ad5e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_3d93_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_92ca_return_output,
 opc_result_MUX_uxn_opcodes_h_l2876_c7_15c6_return_output,
 lit2_uxn_opcodes_h_l2876_c40_28ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2877_c11_19d1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dc78_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a75f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2877_c7_92ca_return_output,
 lit_uxn_opcodes_h_l2877_c40_2ef0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2878_c11_5299_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_d427_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_c60f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2878_c7_a75f_return_output,
 lit2_uxn_opcodes_h_l2878_c40_b282_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2879_c11_d85f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_3707_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_fa28_return_output,
 opc_result_MUX_uxn_opcodes_h_l2879_c7_c60f_return_output,
 inc_uxn_opcodes_h_l2879_c40_2cb7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2880_c11_2257_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_9a37_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_ff6f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2880_c7_fa28_return_output,
 inc2_uxn_opcodes_h_l2880_c40_89cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2881_c11_b10c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3c1f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7e38_return_output,
 opc_result_MUX_uxn_opcodes_h_l2881_c7_ff6f_return_output,
 pop_uxn_opcodes_h_l2881_c40_fe8c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c385_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_09f6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_a047_return_output,
 opc_result_MUX_uxn_opcodes_h_l2882_c7_7e38_return_output,
 pop2_uxn_opcodes_h_l2882_c40_74cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2883_c11_88f7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_07b8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_b8f5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2883_c7_a047_return_output,
 nip_uxn_opcodes_h_l2883_c40_03e0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2884_c11_e6b9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_35cc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_13e5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2884_c7_b8f5_return_output,
 nip2_uxn_opcodes_h_l2884_c40_1852_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2885_c11_1910_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_aaec_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7519_return_output,
 opc_result_MUX_uxn_opcodes_h_l2885_c7_13e5_return_output,
 swp_uxn_opcodes_h_l2885_c40_a116_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2886_c11_160d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_98f3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_082a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2886_c7_7519_return_output,
 swp2_uxn_opcodes_h_l2886_c40_b68d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2887_c11_d1ed_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_19f4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_123e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2887_c7_082a_return_output,
 rot_uxn_opcodes_h_l2887_c40_7295_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2888_c11_1a10_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b760_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7e08_return_output,
 opc_result_MUX_uxn_opcodes_h_l2888_c7_123e_return_output,
 rot2_uxn_opcodes_h_l2888_c40_e209_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2889_c11_a13b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_469e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_fc47_return_output,
 opc_result_MUX_uxn_opcodes_h_l2889_c7_7e08_return_output,
 dup_uxn_opcodes_h_l2889_c40_331d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2890_c11_abab_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_4e3f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_b3d1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2890_c7_fc47_return_output,
 dup2_uxn_opcodes_h_l2890_c40_0424_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2891_c11_672f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_b005_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_6aa8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2891_c7_b3d1_return_output,
 ovr_uxn_opcodes_h_l2891_c40_8070_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c341_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_380b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_03bc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2892_c7_6aa8_return_output,
 ovr2_uxn_opcodes_h_l2892_c40_3ac8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4c7e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_28bb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_a0a5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2893_c7_03bc_return_output,
 equ_uxn_opcodes_h_l2893_c40_bff7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2894_c11_5d37_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_31e4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_ef19_return_output,
 opc_result_MUX_uxn_opcodes_h_l2894_c7_a0a5_return_output,
 equ2_uxn_opcodes_h_l2894_c40_273e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2895_c11_50f6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8b99_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6423_return_output,
 opc_result_MUX_uxn_opcodes_h_l2895_c7_ef19_return_output,
 neq_uxn_opcodes_h_l2895_c40_bb2a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2896_c11_06a3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3555_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_a94d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2896_c7_6423_return_output,
 neq2_uxn_opcodes_h_l2896_c40_66ec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2897_c11_7f78_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_d082_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_76d0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2897_c7_a94d_return_output,
 gth_uxn_opcodes_h_l2897_c40_0e8e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4202_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1ae6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_b48d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2898_c7_76d0_return_output,
 gth2_uxn_opcodes_h_l2898_c40_3336_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1649_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_75d6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_feb8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2899_c7_b48d_return_output,
 lth_uxn_opcodes_h_l2899_c40_d21f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2900_c11_bc77_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3ece_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_0193_return_output,
 opc_result_MUX_uxn_opcodes_h_l2900_c7_feb8_return_output,
 lth2_uxn_opcodes_h_l2900_c40_c1f5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2901_c11_b68d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_df1c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5780_return_output,
 opc_result_MUX_uxn_opcodes_h_l2901_c7_0193_return_output,
 jmp_uxn_opcodes_h_l2901_c40_32e7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b3a2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_edc6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_16fa_return_output,
 opc_result_MUX_uxn_opcodes_h_l2902_c7_5780_return_output,
 jmp2_uxn_opcodes_h_l2902_c40_6f95_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2903_c11_046c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c931_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2da1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2903_c7_16fa_return_output,
 jcn_uxn_opcodes_h_l2903_c40_5135_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2904_c11_38ec_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1893_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0b6d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2904_c7_2da1_return_output,
 jcn2_uxn_opcodes_h_l2904_c40_e211_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0168_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_03e6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_f6b1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2905_c7_0b6d_return_output,
 jsr_uxn_opcodes_h_l2905_c40_eb2a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2906_c11_a219_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6b80_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_1c1b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2906_c7_f6b1_return_output,
 jsr2_uxn_opcodes_h_l2906_c40_be12_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6dba_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_c6ac_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4b87_return_output,
 opc_result_MUX_uxn_opcodes_h_l2907_c7_1c1b_return_output,
 sth_uxn_opcodes_h_l2907_c40_5016_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2908_c11_e48c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d945_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a9f7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2908_c7_4b87_return_output,
 sth2_uxn_opcodes_h_l2908_c40_2433_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2909_c11_bf44_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_f727_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_6feb_return_output,
 opc_result_MUX_uxn_opcodes_h_l2909_c7_a9f7_return_output,
 ldz_uxn_opcodes_h_l2909_c40_64a9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2910_c11_5a29_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_cb41_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_af8e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2910_c7_6feb_return_output,
 ldz2_uxn_opcodes_h_l2910_c40_a8f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2911_c11_fdda_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_779e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_99f2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2911_c7_af8e_return_output,
 stz_uxn_opcodes_h_l2911_c40_7d0e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a2fc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_dd8d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3bd2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2912_c7_99f2_return_output,
 stz2_uxn_opcodes_h_l2912_c40_4717_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2913_c11_d142_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f11_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_6fd2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2913_c7_3bd2_return_output,
 ldr_uxn_opcodes_h_l2913_c40_ef78_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2914_c11_cd99_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49d2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_a2fc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2914_c7_6fd2_return_output,
 ldr2_uxn_opcodes_h_l2914_c40_fc66_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2915_c11_5cf4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a4db_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_1b3d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2915_c7_a2fc_return_output,
 str1_uxn_opcodes_h_l2915_c40_f3ab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2916_c11_1036_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9bec_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7424_return_output,
 opc_result_MUX_uxn_opcodes_h_l2916_c7_1b3d_return_output,
 str2_uxn_opcodes_h_l2916_c40_53ec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0b0e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_bc3c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_f6b7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2917_c7_7424_return_output,
 lda_uxn_opcodes_h_l2917_c40_025f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2918_c11_578e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_7625_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0988_return_output,
 opc_result_MUX_uxn_opcodes_h_l2918_c7_f6b7_return_output,
 lda2_uxn_opcodes_h_l2918_c40_6eeb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ea53_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_b2e8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_6ab5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2919_c7_0988_return_output,
 sta_uxn_opcodes_h_l2919_c40_0aa2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5f57_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_1737_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_0118_return_output,
 opc_result_MUX_uxn_opcodes_h_l2920_c7_6ab5_return_output,
 sta2_uxn_opcodes_h_l2920_c40_bcf5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b92d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0fcf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_4384_return_output,
 opc_result_MUX_uxn_opcodes_h_l2921_c7_0118_return_output,
 dei_uxn_opcodes_h_l2921_c40_7b40_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d26c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d5de_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_c223_return_output,
 opc_result_MUX_uxn_opcodes_h_l2922_c7_4384_return_output,
 dei2_uxn_opcodes_h_l2922_c40_30a5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d7cf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_467e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_63e8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2923_c7_c223_return_output,
 deo_uxn_opcodes_h_l2923_c40_4ca7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2924_c11_a25b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_5439_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_6f04_return_output,
 opc_result_MUX_uxn_opcodes_h_l2924_c7_63e8_return_output,
 deo2_uxn_opcodes_h_l2924_c40_a34e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2925_c11_febb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_36ab_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e663_return_output,
 opc_result_MUX_uxn_opcodes_h_l2925_c7_6f04_return_output,
 add_uxn_opcodes_h_l2925_c40_b133_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c59d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_cb5e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_76e1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2926_c7_e663_return_output,
 add2_uxn_opcodes_h_l2926_c40_7dbe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8478_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ebd8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_85ac_return_output,
 opc_result_MUX_uxn_opcodes_h_l2927_c7_76e1_return_output,
 sub_uxn_opcodes_h_l2927_c40_23ae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7095_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_2220_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_41af_return_output,
 opc_result_MUX_uxn_opcodes_h_l2928_c7_85ac_return_output,
 sub2_uxn_opcodes_h_l2928_c40_785e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0d25_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_70fb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b79c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2929_c7_41af_return_output,
 mul_uxn_opcodes_h_l2929_c40_120a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2930_c11_7b9b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_a39f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_12f3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2930_c7_b79c_return_output,
 mul2_uxn_opcodes_h_l2930_c40_d33c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2931_c11_caa6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5db8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b43d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2931_c7_12f3_return_output,
 div_uxn_opcodes_h_l2931_c40_ca74_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2932_c11_e09c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3296_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_982e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2932_c7_b43d_return_output,
 div2_uxn_opcodes_h_l2932_c40_e2aa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f733_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b0a3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_3562_return_output,
 opc_result_MUX_uxn_opcodes_h_l2933_c7_982e_return_output,
 and_uxn_opcodes_h_l2933_c40_3577_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ecba_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_fd55_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_be09_return_output,
 opc_result_MUX_uxn_opcodes_h_l2934_c7_3562_return_output,
 and2_uxn_opcodes_h_l2934_c40_29c3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9e52_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5013_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fe83_return_output,
 opc_result_MUX_uxn_opcodes_h_l2935_c7_be09_return_output,
 ora_uxn_opcodes_h_l2935_c40_afa7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0fdc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e69b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_97a0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2936_c7_fe83_return_output,
 ora2_uxn_opcodes_h_l2936_c40_79e7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2937_c11_9387_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_54cd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_174c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2937_c7_97a0_return_output,
 eor_uxn_opcodes_h_l2937_c40_8514_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2938_c11_5ad7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_90a5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4b7a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2938_c7_174c_return_output,
 eor2_uxn_opcodes_h_l2938_c40_d819_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f49d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_d14e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9399_return_output,
 opc_result_MUX_uxn_opcodes_h_l2939_c7_4b7a_return_output,
 sft_uxn_opcodes_h_l2939_c40_5619_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2940_c11_86c4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_333b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2940_c7_9399_return_output,
 sft2_uxn_opcodes_h_l2940_c40_180c_return_output,
 CONST_SR_6_uxn_opcodes_h_l2942_c16_ddec_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2943_c2_2a80_return_output,
 sp0_MUX_uxn_opcodes_h_l2945_c2_2619_return_output,
 sp1_MUX_uxn_opcodes_h_l2945_c2_2619_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_3101_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_956e_return_output,
 MUX_uxn_opcodes_h_l2951_c29_c53a_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_1ae1_return_output,
 MUX_uxn_opcodes_h_l2952_c20_7b4b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2952_c2_4e93_return_output,
 stack_ram_update_uxn_opcodes_h_l2954_c24_35a2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_05db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_05db_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_05db_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2864_c14_f4d0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5f5d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5f5d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5f5d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_2a91_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_2a91_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_2a91_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_8de6_expr : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_8de6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_0259_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_0259_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_0259_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2864_c14_f4d0_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2864_c14_f4d0_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2864_c14_f4d0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_82b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_82b7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_82b7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_bbf6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_bbf6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_bbf6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_bbf6_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_ccbf_iftrue : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_ccbf_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_ccbf_return_output : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_ccbf_cond : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_bbf6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_cond : unsigned(0 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2871_c48_25ee_phase : unsigned(7 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2871_c48_25ee_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_569f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_569f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_569f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_770a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_770a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_770a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_770a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_4205_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_4205_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_4205_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_4205_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_bbf6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_bbf6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_4205_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_bbf6_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2872_c40_d019_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2872_c40_d019_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2872_c40_d019_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2872_c40_d019_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2872_c40_d019_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2872_c40_d019_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_341c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_341c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_341c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_ec0c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_ec0c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_ec0c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_ec0c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_de8b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_de8b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_de8b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_de8b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_4205_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_4205_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_de8b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_4205_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2873_c40_d19d_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2873_c40_d19d_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2873_c40_d19d_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2873_c40_d19d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2873_c40_d19d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_869e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_869e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_869e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_2b8e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_2b8e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_2b8e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_2b8e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_7c1f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_7c1f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_7c1f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_7c1f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_de8b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_de8b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_7c1f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_de8b_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2874_c40_1591_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2874_c40_1591_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2874_c40_1591_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2874_c40_1591_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2874_c40_1591_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a19b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a19b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a19b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_5b0d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_5b0d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_5b0d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_5b0d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_15c6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_15c6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_15c6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_15c6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_7c1f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_7c1f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_15c6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_7c1f_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2875_c40_4dff_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2875_c40_4dff_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2875_c40_4dff_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2875_c40_4dff_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2875_c40_4dff_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ad5e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ad5e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ad5e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_3d93_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_3d93_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_3d93_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_3d93_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_92ca_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_92ca_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_92ca_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_92ca_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_15c6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_15c6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_92ca_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_15c6_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2876_c40_28ba_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2876_c40_28ba_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2876_c40_28ba_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2876_c40_28ba_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2876_c40_28ba_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_19d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_19d1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_19d1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dc78_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dc78_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dc78_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dc78_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a75f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a75f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a75f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a75f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_92ca_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_92ca_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_a75f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_92ca_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2877_c40_2ef0_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2877_c40_2ef0_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2877_c40_2ef0_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2877_c40_2ef0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2877_c40_2ef0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_5299_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_5299_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_5299_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_d427_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_d427_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_d427_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_d427_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_c60f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_c60f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_c60f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_c60f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_a75f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_a75f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_c60f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_a75f_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2878_c40_b282_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2878_c40_b282_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2878_c40_b282_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2878_c40_b282_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2878_c40_b282_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_d85f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_d85f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_d85f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_3707_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_3707_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_3707_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_3707_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_fa28_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_fa28_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_fa28_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_fa28_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_c60f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_c60f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_fa28_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_c60f_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2879_c40_2cb7_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2879_c40_2cb7_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2879_c40_2cb7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2879_c40_2cb7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2879_c40_2cb7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_2257_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_2257_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_2257_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_9a37_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_9a37_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_9a37_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_9a37_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_ff6f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_ff6f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_ff6f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_ff6f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_fa28_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_fa28_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_ff6f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_fa28_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2880_c40_89cb_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2880_c40_89cb_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2880_c40_89cb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2880_c40_89cb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2880_c40_89cb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_b10c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_b10c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_b10c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3c1f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3c1f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3c1f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3c1f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7e38_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7e38_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7e38_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7e38_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_ff6f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_ff6f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_7e38_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_ff6f_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2881_c40_fe8c_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2881_c40_fe8c_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2881_c40_fe8c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2881_c40_fe8c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c385_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c385_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c385_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_09f6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_09f6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_09f6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_09f6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_a047_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_a047_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_a047_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_a047_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_7e38_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_7e38_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_a047_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_7e38_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2882_c40_74cc_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2882_c40_74cc_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2882_c40_74cc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2882_c40_74cc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_88f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_88f7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_88f7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_07b8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_07b8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_07b8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_07b8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_b8f5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_b8f5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_b8f5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_b8f5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_a047_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_a047_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_b8f5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_a047_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2883_c40_03e0_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2883_c40_03e0_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2883_c40_03e0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2883_c40_03e0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2883_c40_03e0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_e6b9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_e6b9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_e6b9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_35cc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_35cc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_35cc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_35cc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_13e5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_13e5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_13e5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_13e5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_b8f5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_b8f5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_13e5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_b8f5_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2884_c40_1852_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2884_c40_1852_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2884_c40_1852_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2884_c40_1852_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2884_c40_1852_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_1910_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_1910_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_1910_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_aaec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_aaec_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_aaec_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_aaec_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7519_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7519_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7519_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7519_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_13e5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_13e5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7519_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_13e5_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2885_c40_a116_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2885_c40_a116_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2885_c40_a116_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2885_c40_a116_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2885_c40_a116_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_160d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_160d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_160d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_98f3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_98f3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_98f3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_98f3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_082a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_082a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_082a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_082a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7519_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7519_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_082a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7519_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2886_c40_b68d_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2886_c40_b68d_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2886_c40_b68d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2886_c40_b68d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2886_c40_b68d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_d1ed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_d1ed_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_d1ed_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_19f4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_19f4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_19f4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_19f4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_123e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_123e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_123e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_123e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_082a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_082a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_123e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_082a_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2887_c40_7295_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2887_c40_7295_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2887_c40_7295_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2887_c40_7295_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2887_c40_7295_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_1a10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_1a10_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_1a10_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b760_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b760_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b760_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b760_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7e08_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7e08_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7e08_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7e08_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_123e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_123e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_7e08_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_123e_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2888_c40_e209_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2888_c40_e209_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2888_c40_e209_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2888_c40_e209_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2888_c40_e209_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_a13b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_a13b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_a13b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_469e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_469e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_469e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_469e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_fc47_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_fc47_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_fc47_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_fc47_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_7e08_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_7e08_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_fc47_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_7e08_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2889_c40_331d_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2889_c40_331d_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2889_c40_331d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2889_c40_331d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2889_c40_331d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_abab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_abab_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_abab_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_4e3f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_4e3f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_4e3f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_4e3f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_b3d1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_b3d1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_b3d1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_b3d1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_fc47_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_fc47_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_b3d1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_fc47_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2890_c40_0424_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2890_c40_0424_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2890_c40_0424_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2890_c40_0424_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2890_c40_0424_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_672f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_672f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_672f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_b005_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_b005_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_b005_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_b005_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_6aa8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_6aa8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_6aa8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_6aa8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_b3d1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_b3d1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_6aa8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_b3d1_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2891_c40_8070_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2891_c40_8070_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2891_c40_8070_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2891_c40_8070_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2891_c40_8070_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c341_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c341_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c341_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_380b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_380b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_380b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_380b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_03bc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_03bc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_03bc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_03bc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_6aa8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_6aa8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_03bc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_6aa8_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2892_c40_3ac8_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2892_c40_3ac8_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2892_c40_3ac8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2892_c40_3ac8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2892_c40_3ac8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4c7e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4c7e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4c7e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_28bb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_28bb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_28bb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_28bb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_a0a5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_a0a5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_a0a5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_a0a5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_03bc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_03bc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_a0a5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_03bc_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2893_c40_bff7_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2893_c40_bff7_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2893_c40_bff7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2893_c40_bff7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2893_c40_bff7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_5d37_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_5d37_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_5d37_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_31e4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_31e4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_31e4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_31e4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_ef19_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_ef19_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_ef19_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_ef19_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_a0a5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_a0a5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_ef19_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_a0a5_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2894_c40_273e_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2894_c40_273e_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2894_c40_273e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2894_c40_273e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2894_c40_273e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_50f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_50f6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_50f6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8b99_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8b99_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8b99_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8b99_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6423_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6423_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6423_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6423_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_ef19_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_ef19_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_6423_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_ef19_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2895_c40_bb2a_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2895_c40_bb2a_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2895_c40_bb2a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2895_c40_bb2a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2895_c40_bb2a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_06a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_06a3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_06a3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3555_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3555_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3555_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3555_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_a94d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_a94d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_a94d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_a94d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_6423_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_6423_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_a94d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_6423_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2896_c40_66ec_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2896_c40_66ec_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2896_c40_66ec_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2896_c40_66ec_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2896_c40_66ec_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_7f78_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_7f78_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_7f78_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_d082_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_d082_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_d082_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_d082_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_76d0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_76d0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_76d0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_76d0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_a94d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_a94d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_76d0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_a94d_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2897_c40_0e8e_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2897_c40_0e8e_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2897_c40_0e8e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2897_c40_0e8e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2897_c40_0e8e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4202_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4202_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4202_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1ae6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1ae6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1ae6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1ae6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_b48d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_b48d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_b48d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_b48d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_76d0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_76d0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_b48d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_76d0_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2898_c40_3336_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2898_c40_3336_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2898_c40_3336_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2898_c40_3336_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2898_c40_3336_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1649_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1649_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1649_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_75d6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_75d6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_75d6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_75d6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_feb8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_feb8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_feb8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_feb8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_b48d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_b48d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_feb8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_b48d_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2899_c40_d21f_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2899_c40_d21f_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2899_c40_d21f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2899_c40_d21f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2899_c40_d21f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_bc77_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_bc77_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_bc77_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3ece_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3ece_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3ece_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3ece_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_0193_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_0193_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_0193_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_0193_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_feb8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_feb8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_0193_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_feb8_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2900_c40_c1f5_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2900_c40_c1f5_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2900_c40_c1f5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2900_c40_c1f5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2900_c40_c1f5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_b68d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_b68d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_b68d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_df1c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_df1c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_df1c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_df1c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5780_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5780_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5780_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5780_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_0193_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_0193_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_5780_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_0193_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2901_c40_32e7_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2901_c40_32e7_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2901_c40_32e7_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2901_c40_32e7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2901_c40_32e7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2901_c40_32e7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b3a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b3a2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b3a2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_edc6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_edc6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_edc6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_edc6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_16fa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_16fa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_16fa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_16fa_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_5780_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_5780_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_16fa_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_5780_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2902_c40_6f95_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2902_c40_6f95_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2902_c40_6f95_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2902_c40_6f95_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2902_c40_6f95_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_046c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_046c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_046c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c931_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c931_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c931_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c931_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2da1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2da1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2da1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2da1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_16fa_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_16fa_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_2da1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_16fa_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2903_c40_5135_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2903_c40_5135_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2903_c40_5135_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2903_c40_5135_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2903_c40_5135_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2903_c40_5135_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_38ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_38ec_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_38ec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1893_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1893_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1893_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1893_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0b6d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0b6d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0b6d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0b6d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_2da1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_2da1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0b6d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_2da1_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2904_c40_e211_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2904_c40_e211_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2904_c40_e211_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2904_c40_e211_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2904_c40_e211_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0168_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0168_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0168_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_03e6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_03e6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_03e6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_03e6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_f6b1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_f6b1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_f6b1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_f6b1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0b6d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0b6d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_f6b1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0b6d_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2905_c40_eb2a_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2905_c40_eb2a_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2905_c40_eb2a_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2905_c40_eb2a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2905_c40_eb2a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2905_c40_eb2a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_a219_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_a219_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_a219_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6b80_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6b80_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6b80_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6b80_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_1c1b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_1c1b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_1c1b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_1c1b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_f6b1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_f6b1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_1c1b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_f6b1_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2906_c40_be12_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2906_c40_be12_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2906_c40_be12_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2906_c40_be12_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2906_c40_be12_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2906_c40_be12_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6dba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6dba_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6dba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_c6ac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_c6ac_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_c6ac_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_c6ac_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4b87_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4b87_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4b87_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4b87_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_1c1b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_1c1b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_4b87_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_1c1b_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2907_c40_5016_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2907_c40_5016_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2907_c40_5016_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2907_c40_5016_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2907_c40_5016_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_e48c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_e48c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_e48c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d945_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d945_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d945_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d945_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a9f7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a9f7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a9f7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a9f7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_4b87_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_4b87_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_a9f7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_4b87_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2908_c40_2433_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2908_c40_2433_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2908_c40_2433_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2908_c40_2433_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2908_c40_2433_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_bf44_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_bf44_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_bf44_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_f727_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_f727_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_f727_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_f727_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_6feb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_6feb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_6feb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_6feb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_a9f7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_a9f7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_6feb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_a9f7_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2909_c40_64a9_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2909_c40_64a9_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2909_c40_64a9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2909_c40_64a9_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2909_c40_64a9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2909_c40_64a9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_5a29_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_5a29_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_5a29_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_cb41_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_cb41_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_cb41_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_cb41_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_af8e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_af8e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_af8e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_af8e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_6feb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_6feb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_af8e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_6feb_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2910_c40_a8f0_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2910_c40_a8f0_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2910_c40_a8f0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2910_c40_a8f0_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2910_c40_a8f0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2910_c40_a8f0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_fdda_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_fdda_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_fdda_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_779e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_779e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_779e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_779e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_99f2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_99f2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_99f2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_99f2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_af8e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_af8e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_99f2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_af8e_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2911_c40_7d0e_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2911_c40_7d0e_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2911_c40_7d0e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2911_c40_7d0e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2911_c40_7d0e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a2fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a2fc_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a2fc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_dd8d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_dd8d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_dd8d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_dd8d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3bd2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3bd2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3bd2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3bd2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_99f2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_99f2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_3bd2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_99f2_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2912_c40_4717_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2912_c40_4717_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2912_c40_4717_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2912_c40_4717_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2912_c40_4717_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_d142_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_d142_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_d142_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f11_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f11_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f11_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f11_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_6fd2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_6fd2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_6fd2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_6fd2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_3bd2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_3bd2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_6fd2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_3bd2_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2913_c40_ef78_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2913_c40_ef78_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2913_c40_ef78_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2913_c40_ef78_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2913_c40_ef78_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2913_c40_ef78_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2913_c40_ef78_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_cd99_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_cd99_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_cd99_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49d2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49d2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49d2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49d2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_a2fc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_a2fc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_a2fc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_a2fc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_6fd2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_6fd2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_a2fc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_6fd2_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2914_c40_fc66_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2914_c40_fc66_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2914_c40_fc66_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2914_c40_fc66_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2914_c40_fc66_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2914_c40_fc66_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2914_c40_fc66_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_5cf4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_5cf4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_5cf4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a4db_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a4db_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a4db_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a4db_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_1b3d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_1b3d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_1b3d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_1b3d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_a2fc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_a2fc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_1b3d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_a2fc_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2915_c40_f3ab_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2915_c40_f3ab_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2915_c40_f3ab_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2915_c40_f3ab_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2915_c40_f3ab_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2915_c40_f3ab_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_1036_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_1036_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_1036_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9bec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9bec_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9bec_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9bec_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7424_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7424_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7424_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7424_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_1b3d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_1b3d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_7424_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_1b3d_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2916_c40_53ec_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2916_c40_53ec_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2916_c40_53ec_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2916_c40_53ec_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2916_c40_53ec_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2916_c40_53ec_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0b0e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0b0e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0b0e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_bc3c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_bc3c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_bc3c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_bc3c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_f6b7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_f6b7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_f6b7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_f6b7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_7424_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_7424_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_f6b7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_7424_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2917_c40_025f_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2917_c40_025f_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2917_c40_025f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2917_c40_025f_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2917_c40_025f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2917_c40_025f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_578e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_578e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_578e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_7625_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_7625_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_7625_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_7625_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0988_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0988_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0988_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0988_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_f6b7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_f6b7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_0988_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_f6b7_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2918_c40_6eeb_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2918_c40_6eeb_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2918_c40_6eeb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2918_c40_6eeb_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2918_c40_6eeb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2918_c40_6eeb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ea53_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ea53_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ea53_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_b2e8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_b2e8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_b2e8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_b2e8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_6ab5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_6ab5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_6ab5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_6ab5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_0988_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_0988_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_6ab5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_0988_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2919_c40_0aa2_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2919_c40_0aa2_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2919_c40_0aa2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2919_c40_0aa2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2919_c40_0aa2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5f57_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5f57_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5f57_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_1737_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_1737_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_1737_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_1737_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_0118_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_0118_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_0118_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_0118_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_6ab5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_6ab5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_0118_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_6ab5_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2920_c40_bcf5_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2920_c40_bcf5_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2920_c40_bcf5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2920_c40_bcf5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2920_c40_bcf5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b92d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b92d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b92d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0fcf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0fcf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0fcf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0fcf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_4384_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_4384_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_4384_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_4384_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_0118_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_0118_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_4384_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_0118_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2921_c40_7b40_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2921_c40_7b40_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2921_c40_7b40_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2921_c40_7b40_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2921_c40_7b40_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2921_c40_7b40_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d26c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d26c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d26c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d5de_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d5de_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d5de_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d5de_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_c223_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_c223_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_c223_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_c223_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_4384_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_4384_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_c223_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_4384_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2922_c40_30a5_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2922_c40_30a5_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2922_c40_30a5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2922_c40_30a5_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2922_c40_30a5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2922_c40_30a5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d7cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d7cf_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d7cf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_467e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_467e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_467e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_467e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_63e8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_63e8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_63e8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_63e8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_c223_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_c223_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_63e8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_c223_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2923_c40_4ca7_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2923_c40_4ca7_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2923_c40_4ca7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2923_c40_4ca7_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2923_c40_4ca7_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2923_c40_4ca7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2923_c40_4ca7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_a25b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_a25b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_a25b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_5439_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_5439_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_5439_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_5439_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_6f04_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_6f04_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_6f04_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_6f04_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_63e8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_63e8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_6f04_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_63e8_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2924_c40_a34e_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2924_c40_a34e_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2924_c40_a34e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2924_c40_a34e_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2924_c40_a34e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2924_c40_a34e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2924_c40_a34e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_febb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_febb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_febb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_36ab_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_36ab_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_36ab_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_36ab_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e663_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e663_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e663_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e663_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_6f04_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_6f04_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_e663_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_6f04_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2925_c40_b133_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2925_c40_b133_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2925_c40_b133_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2925_c40_b133_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2925_c40_b133_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c59d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c59d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c59d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_cb5e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_cb5e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_cb5e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_cb5e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_76e1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_76e1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_76e1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_76e1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_e663_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_e663_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_76e1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_e663_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2926_c40_7dbe_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2926_c40_7dbe_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2926_c40_7dbe_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2926_c40_7dbe_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2926_c40_7dbe_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8478_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8478_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8478_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ebd8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ebd8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ebd8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ebd8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_85ac_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_85ac_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_85ac_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_85ac_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_76e1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_76e1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_85ac_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_76e1_cond : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2927_c40_23ae_phase : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2927_c40_23ae_ins : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2927_c40_23ae_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2927_c40_23ae_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2927_c40_23ae_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7095_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7095_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7095_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_2220_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_2220_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_2220_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_2220_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_41af_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_41af_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_41af_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_41af_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_85ac_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_85ac_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_41af_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_85ac_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2928_c40_785e_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2928_c40_785e_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2928_c40_785e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2928_c40_785e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2928_c40_785e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0d25_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0d25_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0d25_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_70fb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_70fb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_70fb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_70fb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b79c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b79c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b79c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b79c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_41af_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_41af_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b79c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_41af_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2929_c40_120a_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2929_c40_120a_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2929_c40_120a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2929_c40_120a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2929_c40_120a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_7b9b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_7b9b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_7b9b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_a39f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_a39f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_a39f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_a39f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_12f3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_12f3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_12f3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_12f3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b79c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b79c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_12f3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b79c_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2930_c40_d33c_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2930_c40_d33c_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2930_c40_d33c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2930_c40_d33c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2930_c40_d33c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_caa6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_caa6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_caa6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5db8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5db8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5db8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5db8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b43d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b43d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b43d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b43d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_12f3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_12f3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_b43d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_12f3_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2931_c40_ca74_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2931_c40_ca74_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2931_c40_ca74_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2931_c40_ca74_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2931_c40_ca74_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_e09c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_e09c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_e09c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3296_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3296_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3296_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3296_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_982e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_982e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_982e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_982e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_b43d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_b43d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_982e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_b43d_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2932_c40_e2aa_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2932_c40_e2aa_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2932_c40_e2aa_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2932_c40_e2aa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2932_c40_e2aa_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f733_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f733_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f733_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b0a3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b0a3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b0a3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b0a3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_3562_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_3562_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_3562_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_3562_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_982e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_982e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_3562_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_982e_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2933_c40_3577_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2933_c40_3577_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2933_c40_3577_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2933_c40_3577_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2933_c40_3577_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ecba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ecba_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ecba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_fd55_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_fd55_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_fd55_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_fd55_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_be09_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_be09_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_be09_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_be09_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_3562_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_3562_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_be09_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_3562_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2934_c40_29c3_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2934_c40_29c3_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2934_c40_29c3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2934_c40_29c3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2934_c40_29c3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9e52_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9e52_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9e52_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5013_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5013_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5013_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5013_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fe83_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fe83_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fe83_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fe83_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_be09_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_be09_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_fe83_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_be09_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2935_c40_afa7_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2935_c40_afa7_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2935_c40_afa7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2935_c40_afa7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2935_c40_afa7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0fdc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0fdc_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0fdc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e69b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e69b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e69b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e69b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_97a0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_97a0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_97a0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_97a0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_fe83_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_fe83_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_97a0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_fe83_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2936_c40_79e7_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2936_c40_79e7_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2936_c40_79e7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2936_c40_79e7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2936_c40_79e7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_9387_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_9387_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_9387_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_54cd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_54cd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_54cd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_54cd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_174c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_174c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_174c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_174c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_97a0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_97a0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_174c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_97a0_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2937_c40_8514_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2937_c40_8514_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2937_c40_8514_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2937_c40_8514_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2937_c40_8514_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_5ad7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_5ad7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_5ad7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_90a5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_90a5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_90a5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_90a5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4b7a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4b7a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4b7a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4b7a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_174c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_174c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_4b7a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_174c_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2938_c40_d819_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2938_c40_d819_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2938_c40_d819_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2938_c40_d819_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2938_c40_d819_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f49d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f49d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f49d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_d14e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_d14e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_d14e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_d14e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9399_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9399_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9399_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9399_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_4b7a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_4b7a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_9399_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_4b7a_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2939_c40_5619_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2939_c40_5619_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2939_c40_5619_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2939_c40_5619_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2939_c40_5619_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_86c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_86c4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_86c4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_333b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_333b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_333b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_333b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_9399_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_9399_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_9399_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2940_c40_180c_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2940_c40_180c_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2940_c40_180c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2940_c40_180c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2940_c40_180c_return_output : opcode_result_t;
 variable VAR_stack_index_uxn_opcodes_h_l2942_c2_ce49 : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2942_c16_ddec_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2942_c16_ddec_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_2a80_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2943_c17_e3e6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_2a80_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_2a80_return_output : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_2619_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_2619_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l2948_c3_9271 : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_2619_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_2619_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_2619_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l2946_c3_4206 : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_2619_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_2619_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_2619_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_3101_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_3101_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_3101_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_956e_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_956e_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_956e_return_output : signed(9 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2951_c29_c53a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2951_c29_c53a_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2951_c29_c53a_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2951_c29_c53a_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2951_c19_76b4_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_1ae1_left : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2951_c68_4c3c_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2951_c58_8f83_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_1ae1_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_1ae1_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2952_c2_4e93_left : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c20_7b4b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c20_7b4b_iftrue : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c20_7b4b_iffalse : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c20_7b4b_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2952_c2_4e93_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2952_c2_4e93_return_output : unsigned(8 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_35a2_stack_address : unsigned(8 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_35a2_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_35a2_write_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2957_c3_f4b6_return_output : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_35a2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_35a2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2961_c39_1c34_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2962_c40_17d8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2963_c34_77a5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2964_c30_d865_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2965_c33_c4db_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2966_c34_a635_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2967_c37_6cd8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2969_c32_c14c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2948_l2946_DUPLICATE_5113_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2946_l2948_DUPLICATE_ecd1_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2968_l2956_DUPLICATE_3d78_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2848_l2971_DUPLICATE_9f23_return_output : eval_opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_sp0 : unsigned(7 downto 0);
variable REG_VAR_sp1 : unsigned(7 downto 0);
variable REG_VAR_ins_a_3f : unsigned(7 downto 0);
variable REG_VAR_opc : unsigned(7 downto 0);
variable REG_VAR_stack_index : unsigned(0 downto 0);
variable REG_VAR_is_wait : unsigned(0 downto 0);
variable REG_VAR_is_imm : unsigned(0 downto 0);
variable REG_VAR_stack_address : unsigned(8 downto 0);
variable REG_VAR_previous_stack_read : unsigned(7 downto 0);
variable REG_VAR_opc_result : opcode_result_t;
variable REG_VAR_opc_eval_result : eval_opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_sp0 := sp0;
  REG_VAR_sp1 := sp1;
  REG_VAR_ins_a_3f := ins_a_3f;
  REG_VAR_opc := opc;
  REG_VAR_stack_index := stack_index;
  REG_VAR_is_wait := is_wait;
  REG_VAR_is_imm := is_imm;
  REG_VAR_stack_address := stack_address;
  REG_VAR_previous_stack_read := previous_stack_read;
  REG_VAR_opc_result := opc_result;
  REG_VAR_opc_eval_result := opc_eval_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b92d_right := to_unsigned(22, 8);
     VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_ccbf_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_b8f5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_07b8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_fdda_right := to_unsigned(17, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7e08_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b760_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_c223_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d5de_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5013_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fe83_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_b68d_right := to_unsigned(12, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_febb_right := to_unsigned(24, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_ef19_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_31e4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7e38_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3c1f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_bf44_right := to_unsigned(16, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_16fa_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_edc6_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4c7e_right := to_unsigned(8, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_082a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_98f3_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_ec0c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_de8b_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_3562_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b0a3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_672f_right := to_unsigned(7, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_7b9b_right := to_unsigned(58, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_869e_right := to_unsigned(96, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_bc3c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_f6b7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ecba_right := to_unsigned(60, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4202_right := to_unsigned(42, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f733_right := to_unsigned(28, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_aaec_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7519_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d7cf_right := to_unsigned(23, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_9387_right := to_unsigned(30, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3ece_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_0193_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_af8e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_cb41_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_c6ac_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4b87_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_569f_right := to_unsigned(32, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_38ec_right := to_unsigned(45, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_f6b1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_03e6_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c59d_right := to_unsigned(56, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_1910_right := to_unsigned(4, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_467e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_63e8_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2952_c20_7b4b_iffalse := resize(to_unsigned(0, 1), 9);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f11_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_6fd2_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_13e5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_35cc_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_5299_right := to_unsigned(224, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d945_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a9f7_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_fc47_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_469e_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dc78_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a75f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a2fc_right := to_unsigned(49, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0b0e_right := to_unsigned(20, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d26c_right := to_unsigned(54, 8);
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_0259_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_88f7_right := to_unsigned(3, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_4384_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0fcf_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f49d_right := to_unsigned(31, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_341c_right := to_unsigned(64, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_be09_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_fd55_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0168_right := to_unsigned(14, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9e52_right := to_unsigned(29, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0988_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_7625_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_1a10_right := to_unsigned(37, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6b80_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_1c1b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_e09c_right := to_unsigned(59, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49d2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_a2fc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_3707_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_fa28_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_caa6_right := to_unsigned(27, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5f57_right := to_unsigned(53, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c385_right := to_unsigned(34, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c931_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2da1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5db8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b43d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_5a29_right := to_unsigned(48, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_578e_right := to_unsigned(52, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_ff6f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_9a37_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_174c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_54cd_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_2a91_right := to_unsigned(32, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_3d93_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_92ca_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_abab_right := to_unsigned(38, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_0118_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_1737_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2864_c14_f4d0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_160d_right := to_unsigned(36, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_15c6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_5b0d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_06a3_right := to_unsigned(41, 8);
     VAR_MUX_uxn_opcodes_h_l2864_c14_f4d0_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_76d0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_d082_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_a25b_right := to_unsigned(55, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_90a5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4b7a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_5d37_right := to_unsigned(40, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_d85f_right := to_unsigned(1, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ea53_right := to_unsigned(21, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b79c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_70fb_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6dba_right := to_unsigned(15, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8478_right := to_unsigned(25, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_d142_right := to_unsigned(18, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_28bb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_a0a5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_bc77_right := to_unsigned(43, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_a219_right := to_unsigned(46, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_d1ed_right := to_unsigned(5, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_6feb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_f727_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7095_right := to_unsigned(57, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6423_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8b99_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_046c_right := to_unsigned(13, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0fdc_right := to_unsigned(61, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7424_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9bec_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_b10c_right := to_unsigned(2, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_82b7_right := to_unsigned(0, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_6f04_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_5439_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_380b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_03bc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_d427_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_c60f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1ae6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_b48d_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_97a0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e69b_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_df1c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5780_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0d25_right := to_unsigned(26, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0b6d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1893_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_75d6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_feb8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_4e3f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_b3d1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_2257_right := to_unsigned(33, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_a047_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_09f6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_1b3d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a4db_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ad5e_right := to_unsigned(160, 8);
     VAR_MUX_uxn_opcodes_h_l2952_c20_7b4b_iftrue := to_unsigned(256, 9);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_6ab5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_b2e8_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_333b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_982e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3296_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_5ad7_right := to_unsigned(62, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_86c4_right := to_unsigned(63, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_2220_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_41af_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_05db_right := to_unsigned(63, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1649_right := to_unsigned(11, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_7c1f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_2b8e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_12f3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_a39f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_99f2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_779e_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ebd8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_85ac_iftrue := to_unsigned(0, 1);
     VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_ccbf_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c341_right := to_unsigned(39, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_d14e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9399_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_1036_right := to_unsigned(51, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_cb5e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_76e1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a19b_right := to_unsigned(128, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_dd8d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3bd2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_5cf4_right := to_unsigned(19, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_e6b9_right := to_unsigned(35, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b3a2_right := to_unsigned(44, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3555_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_a94d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_e48c_right := to_unsigned(47, 8);
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5f5d_right := to_unsigned(223, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_cd99_right := to_unsigned(50, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_6aa8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_b005_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_a13b_right := to_unsigned(6, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_bbf6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_19f4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_123e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_36ab_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e663_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_770a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_4205_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_7f78_right := to_unsigned(10, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_50f6_right := to_unsigned(9, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_19d1_right := to_unsigned(192, 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_ram_read := previous_ram_read;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_bbf6_iffalse := VAR_CLOCK_ENABLE;
     VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_35a2_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_05db_left := VAR_ins;
     VAR_CONST_SR_6_uxn_opcodes_h_l2942_c16_ddec_x := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_iftrue := VAR_ins;
     VAR_add2_uxn_opcodes_h_l2926_c40_7dbe_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l2925_c40_b133_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l2934_c40_29c3_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l2933_c40_3577_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l2922_c40_30a5_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l2921_c40_7b40_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l2924_c40_a34e_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l2923_c40_4ca7_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l2932_c40_e2aa_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l2931_c40_ca74_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l2890_c40_0424_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l2889_c40_331d_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l2938_c40_d819_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l2937_c40_8514_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l2894_c40_273e_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l2893_c40_bff7_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l2898_c40_3336_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l2897_c40_0e8e_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l2880_c40_89cb_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l2879_c40_2cb7_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l2904_c40_e211_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l2903_c40_5135_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l2902_c40_6f95_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l2901_c40_32e7_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l2906_c40_be12_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l2905_c40_eb2a_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l2918_c40_6eeb_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l2917_c40_025f_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l2914_c40_fc66_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l2913_c40_ef78_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l2910_c40_a8f0_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l2909_c40_64a9_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l2900_c40_c1f5_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l2899_c40_d21f_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l2930_c40_d33c_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l2929_c40_120a_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l2896_c40_66ec_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l2895_c40_bb2a_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l2884_c40_1852_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l2883_c40_03e0_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l2936_c40_79e7_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l2935_c40_afa7_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l2892_c40_3ac8_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l2891_c40_8070_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l2882_c40_74cc_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l2881_c40_fe8c_ins := VAR_ins;
     VAR_rot2_uxn_opcodes_h_l2888_c40_e209_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l2887_c40_7295_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l2940_c40_180c_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l2939_c40_5619_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l2920_c40_bcf5_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l2919_c40_0aa2_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l2908_c40_2433_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l2907_c40_5016_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l2915_c40_f3ab_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l2916_c40_53ec_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l2912_c40_4717_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l2911_c40_7d0e_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l2928_c40_785e_ins := VAR_ins;
     VAR_sub_uxn_opcodes_h_l2927_c40_23ae_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l2886_c40_b68d_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l2885_c40_a116_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_9399_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l2872_c40_d019_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l2903_c40_5135_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l2873_c40_d19d_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l2901_c40_32e7_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l2874_c40_1591_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l2906_c40_be12_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l2905_c40_eb2a_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l2914_c40_fc66_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l2913_c40_ef78_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2876_c40_28ba_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2878_c40_b282_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2875_c40_4dff_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2877_c40_2ef0_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l2915_c40_f3ab_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l2916_c40_53ec_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l2926_c40_7dbe_phase := VAR_phase;
     VAR_add_uxn_opcodes_h_l2925_c40_b133_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l2934_c40_29c3_phase := VAR_phase;
     VAR_and_uxn_opcodes_h_l2933_c40_3577_phase := VAR_phase;
     VAR_brk_uxn_opcodes_h_l2871_c48_25ee_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2922_c40_30a5_phase := VAR_phase;
     VAR_dei_uxn_opcodes_h_l2921_c40_7b40_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l2924_c40_a34e_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l2923_c40_4ca7_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l2932_c40_e2aa_phase := VAR_phase;
     VAR_div_uxn_opcodes_h_l2931_c40_ca74_phase := VAR_phase;
     VAR_dup2_uxn_opcodes_h_l2890_c40_0424_phase := VAR_phase;
     VAR_dup_uxn_opcodes_h_l2889_c40_331d_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l2938_c40_d819_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l2937_c40_8514_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l2894_c40_273e_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l2893_c40_bff7_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l2898_c40_3336_phase := VAR_phase;
     VAR_gth_uxn_opcodes_h_l2897_c40_0e8e_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l2880_c40_89cb_phase := VAR_phase;
     VAR_inc_uxn_opcodes_h_l2879_c40_2cb7_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l2872_c40_d019_phase := VAR_phase;
     VAR_jcn2_uxn_opcodes_h_l2904_c40_e211_phase := VAR_phase;
     VAR_jcn_uxn_opcodes_h_l2903_c40_5135_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l2873_c40_d19d_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l2902_c40_6f95_phase := VAR_phase;
     VAR_jmp_uxn_opcodes_h_l2901_c40_32e7_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l2874_c40_1591_phase := VAR_phase;
     VAR_jsr2_uxn_opcodes_h_l2906_c40_be12_phase := VAR_phase;
     VAR_jsr_uxn_opcodes_h_l2905_c40_eb2a_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l2918_c40_6eeb_phase := VAR_phase;
     VAR_lda_uxn_opcodes_h_l2917_c40_025f_phase := VAR_phase;
     VAR_ldr2_uxn_opcodes_h_l2914_c40_fc66_phase := VAR_phase;
     VAR_ldr_uxn_opcodes_h_l2913_c40_ef78_phase := VAR_phase;
     VAR_ldz2_uxn_opcodes_h_l2910_c40_a8f0_phase := VAR_phase;
     VAR_ldz_uxn_opcodes_h_l2909_c40_64a9_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2876_c40_28ba_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2878_c40_b282_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2875_c40_4dff_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2877_c40_2ef0_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l2900_c40_c1f5_phase := VAR_phase;
     VAR_lth_uxn_opcodes_h_l2899_c40_d21f_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l2930_c40_d33c_phase := VAR_phase;
     VAR_mul_uxn_opcodes_h_l2929_c40_120a_phase := VAR_phase;
     VAR_neq2_uxn_opcodes_h_l2896_c40_66ec_phase := VAR_phase;
     VAR_neq_uxn_opcodes_h_l2895_c40_bb2a_phase := VAR_phase;
     VAR_nip2_uxn_opcodes_h_l2884_c40_1852_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l2883_c40_03e0_phase := VAR_phase;
     VAR_ora2_uxn_opcodes_h_l2936_c40_79e7_phase := VAR_phase;
     VAR_ora_uxn_opcodes_h_l2935_c40_afa7_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l2892_c40_3ac8_phase := VAR_phase;
     VAR_ovr_uxn_opcodes_h_l2891_c40_8070_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l2882_c40_74cc_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l2881_c40_fe8c_phase := VAR_phase;
     VAR_rot2_uxn_opcodes_h_l2888_c40_e209_phase := VAR_phase;
     VAR_rot_uxn_opcodes_h_l2887_c40_7295_phase := VAR_phase;
     VAR_sft2_uxn_opcodes_h_l2940_c40_180c_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l2939_c40_5619_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l2920_c40_bcf5_phase := VAR_phase;
     VAR_sta_uxn_opcodes_h_l2919_c40_0aa2_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l2908_c40_2433_phase := VAR_phase;
     VAR_sth_uxn_opcodes_h_l2907_c40_5016_phase := VAR_phase;
     VAR_str1_uxn_opcodes_h_l2915_c40_f3ab_phase := VAR_phase;
     VAR_str2_uxn_opcodes_h_l2916_c40_53ec_phase := VAR_phase;
     VAR_stz2_uxn_opcodes_h_l2912_c40_4717_phase := VAR_phase;
     VAR_stz_uxn_opcodes_h_l2911_c40_7d0e_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l2928_c40_785e_phase := VAR_phase;
     VAR_sub_uxn_opcodes_h_l2927_c40_23ae_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l2886_c40_b68d_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l2885_c40_a116_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2922_c40_30a5_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_dei_uxn_opcodes_h_l2921_c40_7b40_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2924_c40_a34e_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo_uxn_opcodes_h_l2923_c40_4ca7_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2924_c40_a34e_previous_ram_read := VAR_previous_ram_read;
     VAR_deo_uxn_opcodes_h_l2923_c40_4ca7_previous_ram_read := VAR_previous_ram_read;
     VAR_jci_uxn_opcodes_h_l2872_c40_d019_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l2873_c40_d19d_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l2874_c40_1591_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l2918_c40_6eeb_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l2917_c40_025f_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l2914_c40_fc66_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l2913_c40_ef78_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l2910_c40_a8f0_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l2909_c40_64a9_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2876_c40_28ba_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2878_c40_b282_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2875_c40_4dff_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2877_c40_2ef0_previous_ram_read := VAR_previous_ram_read;
     VAR_add2_uxn_opcodes_h_l2926_c40_7dbe_previous_stack_read := previous_stack_read;
     VAR_add_uxn_opcodes_h_l2925_c40_b133_previous_stack_read := previous_stack_read;
     VAR_and2_uxn_opcodes_h_l2934_c40_29c3_previous_stack_read := previous_stack_read;
     VAR_and_uxn_opcodes_h_l2933_c40_3577_previous_stack_read := previous_stack_read;
     VAR_dei2_uxn_opcodes_h_l2922_c40_30a5_previous_stack_read := previous_stack_read;
     VAR_dei_uxn_opcodes_h_l2921_c40_7b40_previous_stack_read := previous_stack_read;
     VAR_deo2_uxn_opcodes_h_l2924_c40_a34e_previous_stack_read := previous_stack_read;
     VAR_deo_uxn_opcodes_h_l2923_c40_4ca7_previous_stack_read := previous_stack_read;
     VAR_div2_uxn_opcodes_h_l2932_c40_e2aa_previous_stack_read := previous_stack_read;
     VAR_div_uxn_opcodes_h_l2931_c40_ca74_previous_stack_read := previous_stack_read;
     VAR_dup2_uxn_opcodes_h_l2890_c40_0424_previous_stack_read := previous_stack_read;
     VAR_dup_uxn_opcodes_h_l2889_c40_331d_previous_stack_read := previous_stack_read;
     VAR_eor2_uxn_opcodes_h_l2938_c40_d819_previous_stack_read := previous_stack_read;
     VAR_eor_uxn_opcodes_h_l2937_c40_8514_previous_stack_read := previous_stack_read;
     VAR_equ2_uxn_opcodes_h_l2894_c40_273e_previous_stack_read := previous_stack_read;
     VAR_equ_uxn_opcodes_h_l2893_c40_bff7_previous_stack_read := previous_stack_read;
     VAR_gth2_uxn_opcodes_h_l2898_c40_3336_previous_stack_read := previous_stack_read;
     VAR_gth_uxn_opcodes_h_l2897_c40_0e8e_previous_stack_read := previous_stack_read;
     VAR_inc2_uxn_opcodes_h_l2880_c40_89cb_previous_stack_read := previous_stack_read;
     VAR_inc_uxn_opcodes_h_l2879_c40_2cb7_previous_stack_read := previous_stack_read;
     VAR_jci_uxn_opcodes_h_l2872_c40_d019_previous_stack_read := previous_stack_read;
     VAR_jcn2_uxn_opcodes_h_l2904_c40_e211_previous_stack_read := previous_stack_read;
     VAR_jcn_uxn_opcodes_h_l2903_c40_5135_previous_stack_read := previous_stack_read;
     VAR_jmp2_uxn_opcodes_h_l2902_c40_6f95_previous_stack_read := previous_stack_read;
     VAR_jmp_uxn_opcodes_h_l2901_c40_32e7_previous_stack_read := previous_stack_read;
     VAR_jsr2_uxn_opcodes_h_l2906_c40_be12_previous_stack_read := previous_stack_read;
     VAR_jsr_uxn_opcodes_h_l2905_c40_eb2a_previous_stack_read := previous_stack_read;
     VAR_lda2_uxn_opcodes_h_l2918_c40_6eeb_previous_stack_read := previous_stack_read;
     VAR_lda_uxn_opcodes_h_l2917_c40_025f_previous_stack_read := previous_stack_read;
     VAR_ldr2_uxn_opcodes_h_l2914_c40_fc66_previous_stack_read := previous_stack_read;
     VAR_ldr_uxn_opcodes_h_l2913_c40_ef78_previous_stack_read := previous_stack_read;
     VAR_ldz2_uxn_opcodes_h_l2910_c40_a8f0_previous_stack_read := previous_stack_read;
     VAR_ldz_uxn_opcodes_h_l2909_c40_64a9_previous_stack_read := previous_stack_read;
     VAR_lth2_uxn_opcodes_h_l2900_c40_c1f5_previous_stack_read := previous_stack_read;
     VAR_lth_uxn_opcodes_h_l2899_c40_d21f_previous_stack_read := previous_stack_read;
     VAR_mul2_uxn_opcodes_h_l2930_c40_d33c_previous_stack_read := previous_stack_read;
     VAR_mul_uxn_opcodes_h_l2929_c40_120a_previous_stack_read := previous_stack_read;
     VAR_neq2_uxn_opcodes_h_l2896_c40_66ec_previous_stack_read := previous_stack_read;
     VAR_neq_uxn_opcodes_h_l2895_c40_bb2a_previous_stack_read := previous_stack_read;
     VAR_nip2_uxn_opcodes_h_l2884_c40_1852_previous_stack_read := previous_stack_read;
     VAR_nip_uxn_opcodes_h_l2883_c40_03e0_previous_stack_read := previous_stack_read;
     VAR_ora2_uxn_opcodes_h_l2936_c40_79e7_previous_stack_read := previous_stack_read;
     VAR_ora_uxn_opcodes_h_l2935_c40_afa7_previous_stack_read := previous_stack_read;
     VAR_ovr2_uxn_opcodes_h_l2892_c40_3ac8_previous_stack_read := previous_stack_read;
     VAR_ovr_uxn_opcodes_h_l2891_c40_8070_previous_stack_read := previous_stack_read;
     VAR_rot2_uxn_opcodes_h_l2888_c40_e209_previous_stack_read := previous_stack_read;
     VAR_rot_uxn_opcodes_h_l2887_c40_7295_previous_stack_read := previous_stack_read;
     VAR_sft2_uxn_opcodes_h_l2940_c40_180c_previous_stack_read := previous_stack_read;
     VAR_sft_uxn_opcodes_h_l2939_c40_5619_previous_stack_read := previous_stack_read;
     VAR_sta2_uxn_opcodes_h_l2920_c40_bcf5_previous_stack_read := previous_stack_read;
     VAR_sta_uxn_opcodes_h_l2919_c40_0aa2_previous_stack_read := previous_stack_read;
     VAR_sth2_uxn_opcodes_h_l2908_c40_2433_previous_stack_read := previous_stack_read;
     VAR_sth_uxn_opcodes_h_l2907_c40_5016_previous_stack_read := previous_stack_read;
     VAR_str1_uxn_opcodes_h_l2915_c40_f3ab_previous_stack_read := previous_stack_read;
     VAR_str2_uxn_opcodes_h_l2916_c40_53ec_previous_stack_read := previous_stack_read;
     VAR_stz2_uxn_opcodes_h_l2912_c40_4717_previous_stack_read := previous_stack_read;
     VAR_stz_uxn_opcodes_h_l2911_c40_7d0e_previous_stack_read := previous_stack_read;
     VAR_sub2_uxn_opcodes_h_l2928_c40_785e_previous_stack_read := previous_stack_read;
     VAR_sub_uxn_opcodes_h_l2927_c40_23ae_previous_stack_read := previous_stack_read;
     VAR_swp2_uxn_opcodes_h_l2886_c40_b68d_previous_stack_read := previous_stack_read;
     VAR_swp_uxn_opcodes_h_l2885_c40_a116_previous_stack_read := previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_956e_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_2619_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_3101_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_2619_iffalse := sp1;
     -- BIN_OP_AND[uxn_opcodes_h_l2863_c14_05db] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2863_c14_05db_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_05db_left;
     BIN_OP_AND_uxn_opcodes_h_l2863_c14_05db_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_05db_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_05db_return_output := BIN_OP_AND_uxn_opcodes_h_l2863_c14_05db_return_output;

     -- CONST_SR_6[uxn_opcodes_h_l2942_c16_ddec] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_opcodes_h_l2942_c16_ddec_x <= VAR_CONST_SR_6_uxn_opcodes_h_l2942_c16_ddec_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_opcodes_h_l2942_c16_ddec_return_output := CONST_SR_6_uxn_opcodes_h_l2942_c16_ddec_return_output;

     -- brk[uxn_opcodes_h_l2871_c48_25ee] LATENCY=0
     -- Inputs
     brk_uxn_opcodes_h_l2871_c48_25ee_phase <= VAR_brk_uxn_opcodes_h_l2871_c48_25ee_phase;
     -- Outputs
     VAR_brk_uxn_opcodes_h_l2871_c48_25ee_return_output := brk_uxn_opcodes_h_l2871_c48_25ee_return_output;

     -- Submodule level 1
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5f5d_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_05db_return_output;
     VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_05db_return_output;
     REG_VAR_ins_a_3f := VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_05db_return_output;
     VAR_stack_index_uxn_opcodes_h_l2942_c2_ce49 := resize(VAR_CONST_SR_6_uxn_opcodes_h_l2942_c16_ddec_return_output, 1);
     VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_iftrue := VAR_brk_uxn_opcodes_h_l2871_c48_25ee_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_2a80_left := VAR_stack_index_uxn_opcodes_h_l2942_c2_ce49;
     -- BIN_OP_XOR[uxn_opcodes_h_l2864_c14_5f5d] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5f5d_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5f5d_left;
     BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5f5d_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5f5d_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5f5d_return_output := BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5f5d_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_2a91_left := VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5f5d_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2864_c14_2a91] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2864_c14_2a91_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_2a91_left;
     BIN_OP_OR_uxn_opcodes_h_l2864_c14_2a91_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_2a91_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_2a91_return_output := BIN_OP_OR_uxn_opcodes_h_l2864_c14_2a91_return_output;

     -- Submodule level 3
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_8de6_expr := VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_2a91_return_output;
     -- UNARY_OP_NOT[uxn_opcodes_h_l2864_c14_8de6] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_8de6_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_8de6_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_8de6_return_output := UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_8de6_return_output;

     -- Submodule level 4
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_0259_left := VAR_UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_8de6_return_output;
     -- BIN_OP_NEQ[uxn_opcodes_h_l2864_c14_0259] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_0259_left <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_0259_left;
     BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_0259_right <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_0259_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_0259_return_output := BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_0259_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_opcodes_h_l2864_c14_f4d0_cond := VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_0259_return_output;
     -- MUX[uxn_opcodes_h_l2864_c14_f4d0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2864_c14_f4d0_cond <= VAR_MUX_uxn_opcodes_h_l2864_c14_f4d0_cond;
     MUX_uxn_opcodes_h_l2864_c14_f4d0_iftrue <= VAR_MUX_uxn_opcodes_h_l2864_c14_f4d0_iftrue;
     MUX_uxn_opcodes_h_l2864_c14_f4d0_iffalse <= VAR_MUX_uxn_opcodes_h_l2864_c14_f4d0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2864_c14_f4d0_return_output := MUX_uxn_opcodes_h_l2864_c14_f4d0_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_cond := VAR_MUX_uxn_opcodes_h_l2864_c14_f4d0_return_output;
     REG_VAR_is_imm := VAR_MUX_uxn_opcodes_h_l2864_c14_f4d0_return_output;
     -- MUX[uxn_opcodes_h_l2865_c8_d3a5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2865_c8_d3a5_cond <= VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_cond;
     MUX_uxn_opcodes_h_l2865_c8_d3a5_iftrue <= VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_iftrue;
     MUX_uxn_opcodes_h_l2865_c8_d3a5_iffalse <= VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output := MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;

     -- Submodule level 7
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_82b7_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_569f_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_341c_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_869e_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a19b_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ad5e_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_19d1_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_5299_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_d85f_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_2257_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_b10c_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c385_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_88f7_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_e6b9_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_1910_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_160d_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_d1ed_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_1a10_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_a13b_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_abab_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_672f_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c341_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4c7e_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_5d37_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_50f6_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_06a3_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_7f78_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4202_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1649_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_bc77_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_b68d_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b3a2_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_046c_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_38ec_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0168_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_a219_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6dba_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_e48c_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_bf44_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_5a29_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_fdda_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a2fc_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_d142_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_cd99_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_5cf4_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_1036_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0b0e_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_578e_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ea53_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5f57_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b92d_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d26c_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d7cf_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_a25b_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_febb_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c59d_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8478_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7095_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0d25_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_7b9b_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_caa6_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_e09c_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f733_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ecba_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9e52_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0fdc_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_9387_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_5ad7_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f49d_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_86c4_left := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     REG_VAR_opc := VAR_MUX_uxn_opcodes_h_l2865_c8_d3a5_return_output;
     -- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_6dba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6dba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6dba_left;
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6dba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6dba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6dba_return_output := BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6dba_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_0fdc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0fdc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0fdc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0fdc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0fdc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0fdc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0fdc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2890_c11_abab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2890_c11_abab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_abab_left;
     BIN_OP_EQ_uxn_opcodes_h_l2890_c11_abab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_abab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_abab_return_output := BIN_OP_EQ_uxn_opcodes_h_l2890_c11_abab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_b92d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b92d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b92d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b92d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b92d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b92d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b92d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_86c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_86c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_86c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_86c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_86c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_86c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2940_c11_86c4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2887_c11_d1ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2887_c11_d1ed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_d1ed_left;
     BIN_OP_EQ_uxn_opcodes_h_l2887_c11_d1ed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_d1ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_d1ed_return_output := BIN_OP_EQ_uxn_opcodes_h_l2887_c11_d1ed_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2883_c11_88f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2883_c11_88f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_88f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2883_c11_88f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_88f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_88f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2883_c11_88f7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2875_c11_a19b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a19b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a19b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a19b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a19b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a19b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a19b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2898_c11_4202] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4202_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4202_left;
     BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4202_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4202_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4202_return_output := BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4202_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_d85f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_d85f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_d85f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_d85f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_d85f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_d85f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2879_c11_d85f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_f733] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f733_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f733_left;
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f733_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f733_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f733_return_output := BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f733_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_b3a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b3a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b3a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b3a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b3a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b3a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b3a2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_caa6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_caa6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_caa6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_caa6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_caa6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_caa6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2931_c11_caa6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_cd99] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_cd99_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_cd99_left;
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_cd99_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_cd99_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_cd99_return_output := BIN_OP_EQ_uxn_opcodes_h_l2914_c11_cd99_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_d26c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d26c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d26c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d26c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d26c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d26c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d26c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_1649] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1649_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1649_left;
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1649_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1649_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1649_return_output := BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1649_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_d142] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_d142_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_d142_left;
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_d142_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_d142_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_d142_return_output := BIN_OP_EQ_uxn_opcodes_h_l2913_c11_d142_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_bf44] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_bf44_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_bf44_left;
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_bf44_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_bf44_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_bf44_return_output := BIN_OP_EQ_uxn_opcodes_h_l2909_c11_bf44_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_5a29] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_5a29_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_5a29_left;
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_5a29_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_5a29_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_5a29_return_output := BIN_OP_EQ_uxn_opcodes_h_l2910_c11_5a29_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_9387] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_9387_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_9387_left;
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_9387_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_9387_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_9387_return_output := BIN_OP_EQ_uxn_opcodes_h_l2937_c11_9387_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_8478] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8478_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8478_left;
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8478_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8478_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8478_return_output := BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8478_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_bc77] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_bc77_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_bc77_left;
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_bc77_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_bc77_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_bc77_return_output := BIN_OP_EQ_uxn_opcodes_h_l2900_c11_bc77_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_578e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_578e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_578e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_578e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_578e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_578e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2918_c11_578e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_ecba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ecba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ecba_left;
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ecba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ecba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ecba_return_output := BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ecba_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2893_c11_4c7e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4c7e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4c7e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4c7e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4c7e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4c7e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4c7e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_160d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_160d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_160d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_160d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_160d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_160d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2886_c11_160d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_c341] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c341_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c341_left;
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c341_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c341_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c341_return_output := BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c341_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2873_c11_341c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2873_c11_341c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_341c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2873_c11_341c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_341c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_341c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2873_c11_341c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2880_c11_2257] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2880_c11_2257_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_2257_left;
     BIN_OP_EQ_uxn_opcodes_h_l2880_c11_2257_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_2257_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_2257_return_output := BIN_OP_EQ_uxn_opcodes_h_l2880_c11_2257_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_50f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_50f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_50f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_50f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_50f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_50f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2895_c11_50f6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_5299] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_5299_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_5299_left;
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_5299_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_5299_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_5299_return_output := BIN_OP_EQ_uxn_opcodes_h_l2878_c11_5299_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_d7cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d7cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d7cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d7cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d7cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d7cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d7cf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_06a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_06a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_06a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_06a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_06a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_06a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2896_c11_06a3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_7f78] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_7f78_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_7f78_left;
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_7f78_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_7f78_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_7f78_return_output := BIN_OP_EQ_uxn_opcodes_h_l2897_c11_7f78_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2881_c11_b10c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2881_c11_b10c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_b10c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2881_c11_b10c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_b10c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_b10c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2881_c11_b10c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_ea53] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ea53_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ea53_left;
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ea53_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ea53_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ea53_return_output := BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ea53_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2884_c11_e6b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2884_c11_e6b9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_e6b9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2884_c11_e6b9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_e6b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_e6b9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2884_c11_e6b9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_b68d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_b68d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_b68d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_b68d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_b68d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_b68d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2901_c11_b68d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_5ad7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_5ad7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_5ad7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_5ad7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_5ad7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_5ad7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2938_c11_5ad7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_1036] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_1036_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_1036_left;
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_1036_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_1036_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_1036_return_output := BIN_OP_EQ_uxn_opcodes_h_l2916_c11_1036_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2891_c11_672f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2891_c11_672f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_672f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2891_c11_672f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_672f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_672f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2891_c11_672f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_0d25] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0d25_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0d25_left;
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0d25_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0d25_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0d25_return_output := BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0d25_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_a2fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a2fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a2fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a2fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a2fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a2fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a2fc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_046c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_046c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_046c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_046c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_046c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_046c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2903_c11_046c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_c385] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c385_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c385_left;
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c385_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c385_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c385_return_output := BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c385_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_9e52] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9e52_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9e52_left;
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9e52_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9e52_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9e52_return_output := BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9e52_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_e48c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_e48c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_e48c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_e48c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_e48c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_e48c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2908_c11_e48c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_a219] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_a219_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_a219_left;
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_a219_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_a219_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_a219_return_output := BIN_OP_EQ_uxn_opcodes_h_l2906_c11_a219_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_c59d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c59d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c59d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c59d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c59d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c59d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c59d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_5d37] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_5d37_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_5d37_left;
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_5d37_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_5d37_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_5d37_return_output := BIN_OP_EQ_uxn_opcodes_h_l2894_c11_5d37_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_7095] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7095_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7095_left;
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7095_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7095_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7095_return_output := BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7095_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_e09c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_e09c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_e09c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_e09c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_e09c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_e09c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2932_c11_e09c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2872_c11_569f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2872_c11_569f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_569f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2872_c11_569f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_569f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_569f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2872_c11_569f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_5f57] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5f57_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5f57_left;
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5f57_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5f57_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5f57_return_output := BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5f57_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2885_c11_1910] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2885_c11_1910_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_1910_left;
     BIN_OP_EQ_uxn_opcodes_h_l2885_c11_1910_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_1910_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_1910_return_output := BIN_OP_EQ_uxn_opcodes_h_l2885_c11_1910_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_a25b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_a25b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_a25b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_a25b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_a25b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_a25b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2924_c11_a25b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_38ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_38ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_38ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_38ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_38ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_38ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l2904_c11_38ec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_0168] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0168_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0168_left;
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0168_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0168_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0168_return_output := BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0168_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_febb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_febb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_febb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_febb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_febb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_febb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2925_c11_febb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2888_c11_1a10] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2888_c11_1a10_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_1a10_left;
     BIN_OP_EQ_uxn_opcodes_h_l2888_c11_1a10_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_1a10_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_1a10_return_output := BIN_OP_EQ_uxn_opcodes_h_l2888_c11_1a10_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2876_c11_ad5e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ad5e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ad5e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ad5e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ad5e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ad5e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ad5e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_5cf4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_5cf4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_5cf4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_5cf4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_5cf4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_5cf4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2915_c11_5cf4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_869e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_869e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_869e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_869e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_869e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_869e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2874_c11_869e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_a13b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_a13b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_a13b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_a13b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_a13b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_a13b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2889_c11_a13b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_f49d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f49d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f49d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f49d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f49d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f49d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f49d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_0b0e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0b0e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0b0e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0b0e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0b0e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0b0e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0b0e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2877_c11_19d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2877_c11_19d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_19d1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2877_c11_19d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_19d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_19d1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2877_c11_19d1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2871_c6_82b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2871_c6_82b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_82b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2871_c6_82b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_82b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_82b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2871_c6_82b7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_fdda] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_fdda_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_fdda_left;
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_fdda_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_fdda_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_fdda_return_output := BIN_OP_EQ_uxn_opcodes_h_l2911_c11_fdda_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_7b9b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_7b9b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_7b9b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_7b9b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_7b9b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_7b9b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2930_c11_7b9b_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_bbf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_82b7_return_output;
     VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_ccbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_82b7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_82b7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_4205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_569f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_770a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_569f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_bbf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_569f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_de8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_341c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_ec0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_341c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_4205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_341c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_7c1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_869e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_2b8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_869e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_de8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_869e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_15c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a19b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_5b0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a19b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_7c1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a19b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_92ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ad5e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_3d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ad5e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_15c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ad5e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a75f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_19d1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dc78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_19d1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_92ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_19d1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_c60f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_5299_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_d427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_5299_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_a75f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_5299_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_fa28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_d85f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_3707_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_d85f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_c60f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_d85f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_ff6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_2257_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_9a37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_2257_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_fa28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_2257_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7e38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_b10c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3c1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_b10c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_ff6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_b10c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_a047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c385_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_09f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c385_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_7e38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_c385_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_b8f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_88f7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_07b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_88f7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_a047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_88f7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_13e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_e6b9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_35cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_e6b9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_b8f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_e6b9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7519_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_1910_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_aaec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_1910_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_13e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_1910_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_082a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_160d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_98f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_160d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7519_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_160d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_123e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_d1ed_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_19f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_d1ed_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_082a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_d1ed_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7e08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_1a10_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_1a10_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_123e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_1a10_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_fc47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_a13b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_469e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_a13b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_7e08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_a13b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_b3d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_abab_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_4e3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_abab_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_fc47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_abab_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_6aa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_672f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_b005_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_672f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_b3d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_672f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_03bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c341_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_380b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c341_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_6aa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c341_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_a0a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4c7e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_28bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4c7e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_03bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4c7e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_ef19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_5d37_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_31e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_5d37_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_a0a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_5d37_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_50f6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8b99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_50f6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_ef19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_50f6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_a94d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_06a3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3555_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_06a3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_6423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_06a3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_76d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_7f78_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_d082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_7f78_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_a94d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_7f78_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_b48d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4202_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1ae6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4202_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_76d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4202_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_feb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1649_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_75d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1649_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_b48d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1649_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_0193_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_bc77_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3ece_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_bc77_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_feb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_bc77_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_b68d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_df1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_b68d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_0193_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_b68d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_16fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b3a2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_edc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b3a2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_5780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b3a2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2da1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_046c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_046c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_16fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_046c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0b6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_38ec_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1893_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_38ec_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_2da1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_38ec_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_f6b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0168_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_03e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0168_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0b6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0168_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_1c1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_a219_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6b80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_a219_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_f6b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_a219_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6dba_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_c6ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6dba_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_1c1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6dba_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a9f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_e48c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d945_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_e48c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_4b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_e48c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_6feb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_bf44_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_f727_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_bf44_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_a9f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_bf44_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_af8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_5a29_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_cb41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_5a29_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_6feb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_5a29_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_99f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_fdda_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_779e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_fdda_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_af8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_fdda_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a2fc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_dd8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a2fc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_99f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a2fc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_6fd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_d142_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_d142_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_3bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_d142_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_a2fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_cd99_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_cd99_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_6fd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_cd99_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_1b3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_5cf4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a4db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_5cf4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_a2fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_5cf4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7424_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_1036_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_1036_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_1b3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_1036_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_f6b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0b0e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_bc3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0b0e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_7424_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0b0e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0988_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_578e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_7625_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_578e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_f6b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_578e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_6ab5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ea53_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_b2e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ea53_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_0988_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ea53_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_0118_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5f57_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_1737_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5f57_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_6ab5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5f57_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_4384_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b92d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0fcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b92d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_0118_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b92d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_c223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d26c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d5de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d26c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_4384_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d26c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_63e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d7cf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_467e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d7cf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_c223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d7cf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_6f04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_a25b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_5439_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_a25b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_63e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_a25b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e663_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_febb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_36ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_febb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_6f04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_febb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_76e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c59d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_cb5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c59d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_e663_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c59d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_85ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8478_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ebd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8478_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_76e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8478_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_41af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7095_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_2220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7095_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_85ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7095_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b79c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0d25_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_70fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0d25_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_41af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0d25_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_12f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_7b9b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_a39f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_7b9b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b79c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_7b9b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b43d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_caa6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5db8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_caa6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_12f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_caa6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_982e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_e09c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_e09c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_b43d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_e09c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_3562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f733_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b0a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f733_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_982e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f733_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_be09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ecba_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_fd55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ecba_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_3562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ecba_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fe83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9e52_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5013_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9e52_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_be09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9e52_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_97a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0fdc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e69b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0fdc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_fe83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0fdc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_174c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_9387_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_54cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_9387_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_97a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_9387_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4b7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_5ad7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_90a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_5ad7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_174c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_5ad7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f49d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_d14e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f49d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_4b7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f49d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_333b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_86c4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_9399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_86c4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2872_c7_bbf6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_bbf6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_bbf6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_bbf6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_bbf6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_bbf6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_bbf6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_bbf6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_bbf6_return_output;

     -- is_wait_MUX[uxn_opcodes_h_l2871_c2_ccbf] LATENCY=0
     -- Inputs
     is_wait_MUX_uxn_opcodes_h_l2871_c2_ccbf_cond <= VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_ccbf_cond;
     is_wait_MUX_uxn_opcodes_h_l2871_c2_ccbf_iftrue <= VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_ccbf_iftrue;
     is_wait_MUX_uxn_opcodes_h_l2871_c2_ccbf_iffalse <= VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_ccbf_iffalse;
     -- Outputs
     VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_ccbf_return_output := is_wait_MUX_uxn_opcodes_h_l2871_c2_ccbf_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_4205_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_bbf6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_770a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_bbf6_return_output;
     REG_VAR_is_wait := VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_ccbf_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c7_4205] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_4205_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_4205_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_4205_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_4205_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_4205_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_4205_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_4205_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_4205_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2872_c1_770a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_770a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_770a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_770a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_770a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_770a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_770a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_770a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_770a_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_de8b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_4205_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_ec0c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_4205_return_output;
     VAR_jci_uxn_opcodes_h_l2872_c40_d019_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_770a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c1_ec0c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_ec0c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_ec0c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_ec0c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_ec0c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_ec0c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_ec0c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_ec0c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_ec0c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c7_de8b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_de8b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_de8b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_de8b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_de8b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_de8b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_de8b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_de8b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_de8b_return_output;

     -- jci[uxn_opcodes_h_l2872_c40_d019] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l2872_c40_d019_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l2872_c40_d019_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l2872_c40_d019_phase <= VAR_jci_uxn_opcodes_h_l2872_c40_d019_phase;
     jci_uxn_opcodes_h_l2872_c40_d019_pc <= VAR_jci_uxn_opcodes_h_l2872_c40_d019_pc;
     jci_uxn_opcodes_h_l2872_c40_d019_previous_stack_read <= VAR_jci_uxn_opcodes_h_l2872_c40_d019_previous_stack_read;
     jci_uxn_opcodes_h_l2872_c40_d019_previous_ram_read <= VAR_jci_uxn_opcodes_h_l2872_c40_d019_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l2872_c40_d019_return_output := jci_uxn_opcodes_h_l2872_c40_d019_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_7c1f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_de8b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_2b8e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_de8b_return_output;
     VAR_jmi_uxn_opcodes_h_l2873_c40_d19d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_ec0c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_bbf6_iftrue := VAR_jci_uxn_opcodes_h_l2872_c40_d019_return_output;
     -- jmi[uxn_opcodes_h_l2873_c40_d19d] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l2873_c40_d19d_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l2873_c40_d19d_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l2873_c40_d19d_phase <= VAR_jmi_uxn_opcodes_h_l2873_c40_d19d_phase;
     jmi_uxn_opcodes_h_l2873_c40_d19d_pc <= VAR_jmi_uxn_opcodes_h_l2873_c40_d19d_pc;
     jmi_uxn_opcodes_h_l2873_c40_d19d_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l2873_c40_d19d_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l2873_c40_d19d_return_output := jmi_uxn_opcodes_h_l2873_c40_d19d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c7_7c1f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_7c1f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_7c1f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_7c1f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_7c1f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_7c1f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_7c1f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_7c1f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_7c1f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c1_2b8e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_2b8e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_2b8e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_2b8e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_2b8e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_2b8e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_2b8e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_2b8e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_2b8e_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_15c6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_7c1f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_5b0d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_7c1f_return_output;
     VAR_jsi_uxn_opcodes_h_l2874_c40_1591_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_2b8e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_4205_iftrue := VAR_jmi_uxn_opcodes_h_l2873_c40_d19d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c7_15c6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_15c6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_15c6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_15c6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_15c6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_15c6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_15c6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_15c6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_15c6_return_output;

     -- jsi[uxn_opcodes_h_l2874_c40_1591] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l2874_c40_1591_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l2874_c40_1591_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l2874_c40_1591_phase <= VAR_jsi_uxn_opcodes_h_l2874_c40_1591_phase;
     jsi_uxn_opcodes_h_l2874_c40_1591_pc <= VAR_jsi_uxn_opcodes_h_l2874_c40_1591_pc;
     jsi_uxn_opcodes_h_l2874_c40_1591_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l2874_c40_1591_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l2874_c40_1591_return_output := jsi_uxn_opcodes_h_l2874_c40_1591_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c1_5b0d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_5b0d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_5b0d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_5b0d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_5b0d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_5b0d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_5b0d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_5b0d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_5b0d_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_92ca_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_15c6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_3d93_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_15c6_return_output;
     VAR_lit_uxn_opcodes_h_l2875_c40_4dff_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_5b0d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_de8b_iftrue := VAR_jsi_uxn_opcodes_h_l2874_c40_1591_return_output;
     -- lit[uxn_opcodes_h_l2875_c40_4dff] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2875_c40_4dff_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2875_c40_4dff_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2875_c40_4dff_phase <= VAR_lit_uxn_opcodes_h_l2875_c40_4dff_phase;
     lit_uxn_opcodes_h_l2875_c40_4dff_pc <= VAR_lit_uxn_opcodes_h_l2875_c40_4dff_pc;
     lit_uxn_opcodes_h_l2875_c40_4dff_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2875_c40_4dff_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2875_c40_4dff_return_output := lit_uxn_opcodes_h_l2875_c40_4dff_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c7_92ca] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_92ca_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_92ca_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_92ca_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_92ca_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_92ca_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_92ca_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_92ca_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_92ca_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c1_3d93] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_3d93_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_3d93_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_3d93_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_3d93_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_3d93_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_3d93_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_3d93_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_3d93_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a75f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_92ca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dc78_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_92ca_return_output;
     VAR_lit2_uxn_opcodes_h_l2876_c40_28ba_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_3d93_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_7c1f_iftrue := VAR_lit_uxn_opcodes_h_l2875_c40_4dff_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c1_dc78] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dc78_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dc78_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dc78_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dc78_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dc78_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dc78_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dc78_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dc78_return_output;

     -- lit2[uxn_opcodes_h_l2876_c40_28ba] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2876_c40_28ba_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2876_c40_28ba_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2876_c40_28ba_phase <= VAR_lit2_uxn_opcodes_h_l2876_c40_28ba_phase;
     lit2_uxn_opcodes_h_l2876_c40_28ba_pc <= VAR_lit2_uxn_opcodes_h_l2876_c40_28ba_pc;
     lit2_uxn_opcodes_h_l2876_c40_28ba_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2876_c40_28ba_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2876_c40_28ba_return_output := lit2_uxn_opcodes_h_l2876_c40_28ba_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c7_a75f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a75f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a75f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a75f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a75f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a75f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a75f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a75f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a75f_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_c60f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a75f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_d427_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_a75f_return_output;
     VAR_lit_uxn_opcodes_h_l2877_c40_2ef0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dc78_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_15c6_iftrue := VAR_lit2_uxn_opcodes_h_l2876_c40_28ba_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c7_c60f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_c60f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_c60f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_c60f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_c60f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_c60f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_c60f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_c60f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_c60f_return_output;

     -- lit[uxn_opcodes_h_l2877_c40_2ef0] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2877_c40_2ef0_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2877_c40_2ef0_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2877_c40_2ef0_phase <= VAR_lit_uxn_opcodes_h_l2877_c40_2ef0_phase;
     lit_uxn_opcodes_h_l2877_c40_2ef0_pc <= VAR_lit_uxn_opcodes_h_l2877_c40_2ef0_pc;
     lit_uxn_opcodes_h_l2877_c40_2ef0_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2877_c40_2ef0_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2877_c40_2ef0_return_output := lit_uxn_opcodes_h_l2877_c40_2ef0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c1_d427] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_d427_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_d427_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_d427_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_d427_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_d427_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_d427_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_d427_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_d427_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_fa28_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_c60f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_3707_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_c60f_return_output;
     VAR_lit2_uxn_opcodes_h_l2878_c40_b282_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_d427_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_92ca_iftrue := VAR_lit_uxn_opcodes_h_l2877_c40_2ef0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c7_fa28] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_fa28_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_fa28_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_fa28_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_fa28_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_fa28_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_fa28_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_fa28_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_fa28_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c1_3707] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_3707_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_3707_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_3707_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_3707_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_3707_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_3707_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_3707_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_3707_return_output;

     -- lit2[uxn_opcodes_h_l2878_c40_b282] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2878_c40_b282_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2878_c40_b282_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2878_c40_b282_phase <= VAR_lit2_uxn_opcodes_h_l2878_c40_b282_phase;
     lit2_uxn_opcodes_h_l2878_c40_b282_pc <= VAR_lit2_uxn_opcodes_h_l2878_c40_b282_pc;
     lit2_uxn_opcodes_h_l2878_c40_b282_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2878_c40_b282_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2878_c40_b282_return_output := lit2_uxn_opcodes_h_l2878_c40_b282_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_ff6f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_fa28_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_9a37_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_fa28_return_output;
     VAR_inc_uxn_opcodes_h_l2879_c40_2cb7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_3707_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_a75f_iftrue := VAR_lit2_uxn_opcodes_h_l2878_c40_b282_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c7_ff6f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_ff6f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_ff6f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_ff6f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_ff6f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_ff6f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_ff6f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_ff6f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_ff6f_return_output;

     -- inc[uxn_opcodes_h_l2879_c40_2cb7] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l2879_c40_2cb7_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l2879_c40_2cb7_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l2879_c40_2cb7_phase <= VAR_inc_uxn_opcodes_h_l2879_c40_2cb7_phase;
     inc_uxn_opcodes_h_l2879_c40_2cb7_ins <= VAR_inc_uxn_opcodes_h_l2879_c40_2cb7_ins;
     inc_uxn_opcodes_h_l2879_c40_2cb7_previous_stack_read <= VAR_inc_uxn_opcodes_h_l2879_c40_2cb7_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l2879_c40_2cb7_return_output := inc_uxn_opcodes_h_l2879_c40_2cb7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c1_9a37] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_9a37_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_9a37_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_9a37_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_9a37_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_9a37_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_9a37_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_9a37_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_9a37_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7e38_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_ff6f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3c1f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_ff6f_return_output;
     VAR_inc2_uxn_opcodes_h_l2880_c40_89cb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_9a37_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_c60f_iftrue := VAR_inc_uxn_opcodes_h_l2879_c40_2cb7_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c1_3c1f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3c1f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3c1f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3c1f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3c1f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3c1f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3c1f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3c1f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3c1f_return_output;

     -- inc2[uxn_opcodes_h_l2880_c40_89cb] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l2880_c40_89cb_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l2880_c40_89cb_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l2880_c40_89cb_phase <= VAR_inc2_uxn_opcodes_h_l2880_c40_89cb_phase;
     inc2_uxn_opcodes_h_l2880_c40_89cb_ins <= VAR_inc2_uxn_opcodes_h_l2880_c40_89cb_ins;
     inc2_uxn_opcodes_h_l2880_c40_89cb_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l2880_c40_89cb_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l2880_c40_89cb_return_output := inc2_uxn_opcodes_h_l2880_c40_89cb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c7_7e38] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7e38_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7e38_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7e38_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7e38_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7e38_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7e38_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7e38_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7e38_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_a047_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7e38_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_09f6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7e38_return_output;
     VAR_pop_uxn_opcodes_h_l2881_c40_fe8c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3c1f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_fa28_iftrue := VAR_inc2_uxn_opcodes_h_l2880_c40_89cb_return_output;
     -- pop[uxn_opcodes_h_l2881_c40_fe8c] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l2881_c40_fe8c_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l2881_c40_fe8c_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l2881_c40_fe8c_phase <= VAR_pop_uxn_opcodes_h_l2881_c40_fe8c_phase;
     pop_uxn_opcodes_h_l2881_c40_fe8c_ins <= VAR_pop_uxn_opcodes_h_l2881_c40_fe8c_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l2881_c40_fe8c_return_output := pop_uxn_opcodes_h_l2881_c40_fe8c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c7_a047] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_a047_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_a047_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_a047_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_a047_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_a047_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_a047_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_a047_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_a047_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c1_09f6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_09f6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_09f6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_09f6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_09f6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_09f6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_09f6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_09f6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_09f6_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_b8f5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_a047_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_07b8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_a047_return_output;
     VAR_pop2_uxn_opcodes_h_l2882_c40_74cc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_09f6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_ff6f_iftrue := VAR_pop_uxn_opcodes_h_l2881_c40_fe8c_return_output;
     -- pop2[uxn_opcodes_h_l2882_c40_74cc] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l2882_c40_74cc_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l2882_c40_74cc_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l2882_c40_74cc_phase <= VAR_pop2_uxn_opcodes_h_l2882_c40_74cc_phase;
     pop2_uxn_opcodes_h_l2882_c40_74cc_ins <= VAR_pop2_uxn_opcodes_h_l2882_c40_74cc_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l2882_c40_74cc_return_output := pop2_uxn_opcodes_h_l2882_c40_74cc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c7_b8f5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_b8f5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_b8f5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_b8f5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_b8f5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_b8f5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_b8f5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_b8f5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_b8f5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c1_07b8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_07b8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_07b8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_07b8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_07b8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_07b8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_07b8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_07b8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_07b8_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_13e5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_b8f5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_35cc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_b8f5_return_output;
     VAR_nip_uxn_opcodes_h_l2883_c40_03e0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_07b8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_7e38_iftrue := VAR_pop2_uxn_opcodes_h_l2882_c40_74cc_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c7_13e5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_13e5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_13e5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_13e5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_13e5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_13e5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_13e5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_13e5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_13e5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c1_35cc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_35cc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_35cc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_35cc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_35cc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_35cc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_35cc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_35cc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_35cc_return_output;

     -- nip[uxn_opcodes_h_l2883_c40_03e0] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l2883_c40_03e0_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l2883_c40_03e0_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l2883_c40_03e0_phase <= VAR_nip_uxn_opcodes_h_l2883_c40_03e0_phase;
     nip_uxn_opcodes_h_l2883_c40_03e0_ins <= VAR_nip_uxn_opcodes_h_l2883_c40_03e0_ins;
     nip_uxn_opcodes_h_l2883_c40_03e0_previous_stack_read <= VAR_nip_uxn_opcodes_h_l2883_c40_03e0_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l2883_c40_03e0_return_output := nip_uxn_opcodes_h_l2883_c40_03e0_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7519_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_13e5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_aaec_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_13e5_return_output;
     VAR_nip2_uxn_opcodes_h_l2884_c40_1852_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_35cc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_a047_iftrue := VAR_nip_uxn_opcodes_h_l2883_c40_03e0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c7_7519] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7519_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7519_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7519_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7519_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7519_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7519_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7519_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7519_return_output;

     -- nip2[uxn_opcodes_h_l2884_c40_1852] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l2884_c40_1852_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l2884_c40_1852_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l2884_c40_1852_phase <= VAR_nip2_uxn_opcodes_h_l2884_c40_1852_phase;
     nip2_uxn_opcodes_h_l2884_c40_1852_ins <= VAR_nip2_uxn_opcodes_h_l2884_c40_1852_ins;
     nip2_uxn_opcodes_h_l2884_c40_1852_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l2884_c40_1852_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l2884_c40_1852_return_output := nip2_uxn_opcodes_h_l2884_c40_1852_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c1_aaec] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_aaec_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_aaec_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_aaec_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_aaec_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_aaec_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_aaec_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_aaec_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_aaec_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_082a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7519_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_98f3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7519_return_output;
     VAR_swp_uxn_opcodes_h_l2885_c40_a116_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_aaec_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_b8f5_iftrue := VAR_nip2_uxn_opcodes_h_l2884_c40_1852_return_output;
     -- swp[uxn_opcodes_h_l2885_c40_a116] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l2885_c40_a116_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l2885_c40_a116_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l2885_c40_a116_phase <= VAR_swp_uxn_opcodes_h_l2885_c40_a116_phase;
     swp_uxn_opcodes_h_l2885_c40_a116_ins <= VAR_swp_uxn_opcodes_h_l2885_c40_a116_ins;
     swp_uxn_opcodes_h_l2885_c40_a116_previous_stack_read <= VAR_swp_uxn_opcodes_h_l2885_c40_a116_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l2885_c40_a116_return_output := swp_uxn_opcodes_h_l2885_c40_a116_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c1_98f3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_98f3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_98f3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_98f3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_98f3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_98f3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_98f3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_98f3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_98f3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c7_082a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_082a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_082a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_082a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_082a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_082a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_082a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_082a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_082a_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_123e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_082a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_19f4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_082a_return_output;
     VAR_swp2_uxn_opcodes_h_l2886_c40_b68d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_98f3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_13e5_iftrue := VAR_swp_uxn_opcodes_h_l2885_c40_a116_return_output;
     -- swp2[uxn_opcodes_h_l2886_c40_b68d] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l2886_c40_b68d_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l2886_c40_b68d_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l2886_c40_b68d_phase <= VAR_swp2_uxn_opcodes_h_l2886_c40_b68d_phase;
     swp2_uxn_opcodes_h_l2886_c40_b68d_ins <= VAR_swp2_uxn_opcodes_h_l2886_c40_b68d_ins;
     swp2_uxn_opcodes_h_l2886_c40_b68d_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l2886_c40_b68d_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l2886_c40_b68d_return_output := swp2_uxn_opcodes_h_l2886_c40_b68d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c7_123e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_123e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_123e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_123e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_123e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_123e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_123e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_123e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_123e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c1_19f4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_19f4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_19f4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_19f4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_19f4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_19f4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_19f4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_19f4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_19f4_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7e08_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_123e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b760_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_123e_return_output;
     VAR_rot_uxn_opcodes_h_l2887_c40_7295_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_19f4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7519_iftrue := VAR_swp2_uxn_opcodes_h_l2886_c40_b68d_return_output;
     -- rot[uxn_opcodes_h_l2887_c40_7295] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l2887_c40_7295_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l2887_c40_7295_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l2887_c40_7295_phase <= VAR_rot_uxn_opcodes_h_l2887_c40_7295_phase;
     rot_uxn_opcodes_h_l2887_c40_7295_ins <= VAR_rot_uxn_opcodes_h_l2887_c40_7295_ins;
     rot_uxn_opcodes_h_l2887_c40_7295_previous_stack_read <= VAR_rot_uxn_opcodes_h_l2887_c40_7295_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l2887_c40_7295_return_output := rot_uxn_opcodes_h_l2887_c40_7295_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c7_7e08] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7e08_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7e08_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7e08_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7e08_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7e08_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7e08_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7e08_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7e08_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c1_b760] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b760_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b760_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b760_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b760_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b760_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b760_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b760_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b760_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_fc47_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7e08_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_469e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7e08_return_output;
     VAR_rot2_uxn_opcodes_h_l2888_c40_e209_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b760_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_082a_iftrue := VAR_rot_uxn_opcodes_h_l2887_c40_7295_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c1_469e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_469e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_469e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_469e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_469e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_469e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_469e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_469e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_469e_return_output;

     -- rot2[uxn_opcodes_h_l2888_c40_e209] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l2888_c40_e209_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l2888_c40_e209_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l2888_c40_e209_phase <= VAR_rot2_uxn_opcodes_h_l2888_c40_e209_phase;
     rot2_uxn_opcodes_h_l2888_c40_e209_ins <= VAR_rot2_uxn_opcodes_h_l2888_c40_e209_ins;
     rot2_uxn_opcodes_h_l2888_c40_e209_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l2888_c40_e209_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l2888_c40_e209_return_output := rot2_uxn_opcodes_h_l2888_c40_e209_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c7_fc47] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_fc47_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_fc47_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_fc47_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_fc47_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_fc47_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_fc47_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_fc47_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_fc47_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_b3d1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_fc47_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_4e3f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_fc47_return_output;
     VAR_dup_uxn_opcodes_h_l2889_c40_331d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_469e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_123e_iftrue := VAR_rot2_uxn_opcodes_h_l2888_c40_e209_return_output;
     -- dup[uxn_opcodes_h_l2889_c40_331d] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l2889_c40_331d_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l2889_c40_331d_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l2889_c40_331d_phase <= VAR_dup_uxn_opcodes_h_l2889_c40_331d_phase;
     dup_uxn_opcodes_h_l2889_c40_331d_ins <= VAR_dup_uxn_opcodes_h_l2889_c40_331d_ins;
     dup_uxn_opcodes_h_l2889_c40_331d_previous_stack_read <= VAR_dup_uxn_opcodes_h_l2889_c40_331d_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l2889_c40_331d_return_output := dup_uxn_opcodes_h_l2889_c40_331d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c7_b3d1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_b3d1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_b3d1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_b3d1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_b3d1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_b3d1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_b3d1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_b3d1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_b3d1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c1_4e3f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_4e3f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_4e3f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_4e3f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_4e3f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_4e3f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_4e3f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_4e3f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_4e3f_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_6aa8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_b3d1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_b005_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_b3d1_return_output;
     VAR_dup2_uxn_opcodes_h_l2890_c40_0424_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_4e3f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_7e08_iftrue := VAR_dup_uxn_opcodes_h_l2889_c40_331d_return_output;
     -- dup2[uxn_opcodes_h_l2890_c40_0424] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l2890_c40_0424_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l2890_c40_0424_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l2890_c40_0424_phase <= VAR_dup2_uxn_opcodes_h_l2890_c40_0424_phase;
     dup2_uxn_opcodes_h_l2890_c40_0424_ins <= VAR_dup2_uxn_opcodes_h_l2890_c40_0424_ins;
     dup2_uxn_opcodes_h_l2890_c40_0424_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l2890_c40_0424_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l2890_c40_0424_return_output := dup2_uxn_opcodes_h_l2890_c40_0424_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c7_6aa8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_6aa8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_6aa8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_6aa8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_6aa8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_6aa8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_6aa8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_6aa8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_6aa8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c1_b005] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_b005_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_b005_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_b005_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_b005_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_b005_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_b005_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_b005_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_b005_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_03bc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_6aa8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_380b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_6aa8_return_output;
     VAR_ovr_uxn_opcodes_h_l2891_c40_8070_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_b005_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_fc47_iftrue := VAR_dup2_uxn_opcodes_h_l2890_c40_0424_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c1_380b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_380b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_380b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_380b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_380b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_380b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_380b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_380b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_380b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c7_03bc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_03bc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_03bc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_03bc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_03bc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_03bc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_03bc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_03bc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_03bc_return_output;

     -- ovr[uxn_opcodes_h_l2891_c40_8070] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l2891_c40_8070_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l2891_c40_8070_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l2891_c40_8070_phase <= VAR_ovr_uxn_opcodes_h_l2891_c40_8070_phase;
     ovr_uxn_opcodes_h_l2891_c40_8070_ins <= VAR_ovr_uxn_opcodes_h_l2891_c40_8070_ins;
     ovr_uxn_opcodes_h_l2891_c40_8070_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l2891_c40_8070_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l2891_c40_8070_return_output := ovr_uxn_opcodes_h_l2891_c40_8070_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_a0a5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_03bc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_28bb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_03bc_return_output;
     VAR_ovr2_uxn_opcodes_h_l2892_c40_3ac8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_380b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_b3d1_iftrue := VAR_ovr_uxn_opcodes_h_l2891_c40_8070_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c7_a0a5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_a0a5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_a0a5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_a0a5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_a0a5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_a0a5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_a0a5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_a0a5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_a0a5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c1_28bb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_28bb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_28bb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_28bb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_28bb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_28bb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_28bb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_28bb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_28bb_return_output;

     -- ovr2[uxn_opcodes_h_l2892_c40_3ac8] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l2892_c40_3ac8_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l2892_c40_3ac8_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l2892_c40_3ac8_phase <= VAR_ovr2_uxn_opcodes_h_l2892_c40_3ac8_phase;
     ovr2_uxn_opcodes_h_l2892_c40_3ac8_ins <= VAR_ovr2_uxn_opcodes_h_l2892_c40_3ac8_ins;
     ovr2_uxn_opcodes_h_l2892_c40_3ac8_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l2892_c40_3ac8_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l2892_c40_3ac8_return_output := ovr2_uxn_opcodes_h_l2892_c40_3ac8_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_ef19_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_a0a5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_31e4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_a0a5_return_output;
     VAR_equ_uxn_opcodes_h_l2893_c40_bff7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_28bb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_6aa8_iftrue := VAR_ovr2_uxn_opcodes_h_l2892_c40_3ac8_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c1_31e4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_31e4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_31e4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_31e4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_31e4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_31e4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_31e4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_31e4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_31e4_return_output;

     -- equ[uxn_opcodes_h_l2893_c40_bff7] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l2893_c40_bff7_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l2893_c40_bff7_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l2893_c40_bff7_phase <= VAR_equ_uxn_opcodes_h_l2893_c40_bff7_phase;
     equ_uxn_opcodes_h_l2893_c40_bff7_ins <= VAR_equ_uxn_opcodes_h_l2893_c40_bff7_ins;
     equ_uxn_opcodes_h_l2893_c40_bff7_previous_stack_read <= VAR_equ_uxn_opcodes_h_l2893_c40_bff7_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l2893_c40_bff7_return_output := equ_uxn_opcodes_h_l2893_c40_bff7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c7_ef19] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_ef19_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_ef19_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_ef19_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_ef19_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_ef19_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_ef19_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_ef19_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_ef19_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6423_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_ef19_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8b99_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_ef19_return_output;
     VAR_equ2_uxn_opcodes_h_l2894_c40_273e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_31e4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_03bc_iftrue := VAR_equ_uxn_opcodes_h_l2893_c40_bff7_return_output;
     -- equ2[uxn_opcodes_h_l2894_c40_273e] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l2894_c40_273e_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l2894_c40_273e_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l2894_c40_273e_phase <= VAR_equ2_uxn_opcodes_h_l2894_c40_273e_phase;
     equ2_uxn_opcodes_h_l2894_c40_273e_ins <= VAR_equ2_uxn_opcodes_h_l2894_c40_273e_ins;
     equ2_uxn_opcodes_h_l2894_c40_273e_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l2894_c40_273e_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l2894_c40_273e_return_output := equ2_uxn_opcodes_h_l2894_c40_273e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c1_8b99] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8b99_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8b99_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8b99_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8b99_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8b99_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8b99_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8b99_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8b99_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c7_6423] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6423_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6423_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6423_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6423_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6423_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6423_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6423_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6423_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_a94d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6423_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3555_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6423_return_output;
     VAR_neq_uxn_opcodes_h_l2895_c40_bb2a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8b99_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_a0a5_iftrue := VAR_equ2_uxn_opcodes_h_l2894_c40_273e_return_output;
     -- neq[uxn_opcodes_h_l2895_c40_bb2a] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l2895_c40_bb2a_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l2895_c40_bb2a_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l2895_c40_bb2a_phase <= VAR_neq_uxn_opcodes_h_l2895_c40_bb2a_phase;
     neq_uxn_opcodes_h_l2895_c40_bb2a_ins <= VAR_neq_uxn_opcodes_h_l2895_c40_bb2a_ins;
     neq_uxn_opcodes_h_l2895_c40_bb2a_previous_stack_read <= VAR_neq_uxn_opcodes_h_l2895_c40_bb2a_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l2895_c40_bb2a_return_output := neq_uxn_opcodes_h_l2895_c40_bb2a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c7_a94d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_a94d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_a94d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_a94d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_a94d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_a94d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_a94d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_a94d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_a94d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c1_3555] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3555_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3555_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3555_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3555_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3555_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3555_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3555_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3555_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_76d0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_a94d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_d082_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_a94d_return_output;
     VAR_neq2_uxn_opcodes_h_l2896_c40_66ec_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3555_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_ef19_iftrue := VAR_neq_uxn_opcodes_h_l2895_c40_bb2a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c1_d082] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_d082_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_d082_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_d082_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_d082_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_d082_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_d082_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_d082_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_d082_return_output;

     -- neq2[uxn_opcodes_h_l2896_c40_66ec] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l2896_c40_66ec_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l2896_c40_66ec_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l2896_c40_66ec_phase <= VAR_neq2_uxn_opcodes_h_l2896_c40_66ec_phase;
     neq2_uxn_opcodes_h_l2896_c40_66ec_ins <= VAR_neq2_uxn_opcodes_h_l2896_c40_66ec_ins;
     neq2_uxn_opcodes_h_l2896_c40_66ec_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l2896_c40_66ec_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l2896_c40_66ec_return_output := neq2_uxn_opcodes_h_l2896_c40_66ec_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c7_76d0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_76d0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_76d0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_76d0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_76d0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_76d0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_76d0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_76d0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_76d0_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_b48d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_76d0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1ae6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_76d0_return_output;
     VAR_gth_uxn_opcodes_h_l2897_c40_0e8e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_d082_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_6423_iftrue := VAR_neq2_uxn_opcodes_h_l2896_c40_66ec_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_1ae6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1ae6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1ae6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1ae6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1ae6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1ae6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1ae6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1ae6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1ae6_return_output;

     -- gth[uxn_opcodes_h_l2897_c40_0e8e] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l2897_c40_0e8e_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l2897_c40_0e8e_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l2897_c40_0e8e_phase <= VAR_gth_uxn_opcodes_h_l2897_c40_0e8e_phase;
     gth_uxn_opcodes_h_l2897_c40_0e8e_ins <= VAR_gth_uxn_opcodes_h_l2897_c40_0e8e_ins;
     gth_uxn_opcodes_h_l2897_c40_0e8e_previous_stack_read <= VAR_gth_uxn_opcodes_h_l2897_c40_0e8e_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l2897_c40_0e8e_return_output := gth_uxn_opcodes_h_l2897_c40_0e8e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_b48d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_b48d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_b48d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_b48d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_b48d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_b48d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_b48d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_b48d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_b48d_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_feb8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_b48d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_75d6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_b48d_return_output;
     VAR_gth2_uxn_opcodes_h_l2898_c40_3336_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_1ae6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_a94d_iftrue := VAR_gth_uxn_opcodes_h_l2897_c40_0e8e_return_output;
     -- gth2[uxn_opcodes_h_l2898_c40_3336] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l2898_c40_3336_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l2898_c40_3336_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l2898_c40_3336_phase <= VAR_gth2_uxn_opcodes_h_l2898_c40_3336_phase;
     gth2_uxn_opcodes_h_l2898_c40_3336_ins <= VAR_gth2_uxn_opcodes_h_l2898_c40_3336_ins;
     gth2_uxn_opcodes_h_l2898_c40_3336_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l2898_c40_3336_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l2898_c40_3336_return_output := gth2_uxn_opcodes_h_l2898_c40_3336_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_feb8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_feb8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_feb8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_feb8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_feb8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_feb8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_feb8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_feb8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_feb8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_75d6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_75d6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_75d6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_75d6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_75d6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_75d6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_75d6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_75d6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_75d6_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_0193_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_feb8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3ece_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_feb8_return_output;
     VAR_lth_uxn_opcodes_h_l2899_c40_d21f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_75d6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_76d0_iftrue := VAR_gth2_uxn_opcodes_h_l2898_c40_3336_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_3ece] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3ece_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3ece_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3ece_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3ece_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3ece_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3ece_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3ece_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3ece_return_output;

     -- lth[uxn_opcodes_h_l2899_c40_d21f] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l2899_c40_d21f_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l2899_c40_d21f_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l2899_c40_d21f_phase <= VAR_lth_uxn_opcodes_h_l2899_c40_d21f_phase;
     lth_uxn_opcodes_h_l2899_c40_d21f_ins <= VAR_lth_uxn_opcodes_h_l2899_c40_d21f_ins;
     lth_uxn_opcodes_h_l2899_c40_d21f_previous_stack_read <= VAR_lth_uxn_opcodes_h_l2899_c40_d21f_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l2899_c40_d21f_return_output := lth_uxn_opcodes_h_l2899_c40_d21f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_0193] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_0193_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_0193_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_0193_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_0193_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_0193_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_0193_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_0193_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_0193_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5780_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_0193_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_df1c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_0193_return_output;
     VAR_lth2_uxn_opcodes_h_l2900_c40_c1f5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_3ece_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_b48d_iftrue := VAR_lth_uxn_opcodes_h_l2899_c40_d21f_return_output;
     -- lth2[uxn_opcodes_h_l2900_c40_c1f5] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l2900_c40_c1f5_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l2900_c40_c1f5_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l2900_c40_c1f5_phase <= VAR_lth2_uxn_opcodes_h_l2900_c40_c1f5_phase;
     lth2_uxn_opcodes_h_l2900_c40_c1f5_ins <= VAR_lth2_uxn_opcodes_h_l2900_c40_c1f5_ins;
     lth2_uxn_opcodes_h_l2900_c40_c1f5_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l2900_c40_c1f5_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l2900_c40_c1f5_return_output := lth2_uxn_opcodes_h_l2900_c40_c1f5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_df1c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_df1c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_df1c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_df1c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_df1c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_df1c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_df1c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_df1c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_df1c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_5780] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5780_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5780_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5780_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5780_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5780_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5780_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5780_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5780_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_16fa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5780_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_edc6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5780_return_output;
     VAR_jmp_uxn_opcodes_h_l2901_c40_32e7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_df1c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_feb8_iftrue := VAR_lth2_uxn_opcodes_h_l2900_c40_c1f5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_16fa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_16fa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_16fa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_16fa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_16fa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_16fa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_16fa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_16fa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_16fa_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_edc6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_edc6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_edc6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_edc6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_edc6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_edc6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_edc6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_edc6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_edc6_return_output;

     -- jmp[uxn_opcodes_h_l2901_c40_32e7] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l2901_c40_32e7_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l2901_c40_32e7_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l2901_c40_32e7_phase <= VAR_jmp_uxn_opcodes_h_l2901_c40_32e7_phase;
     jmp_uxn_opcodes_h_l2901_c40_32e7_ins <= VAR_jmp_uxn_opcodes_h_l2901_c40_32e7_ins;
     jmp_uxn_opcodes_h_l2901_c40_32e7_pc <= VAR_jmp_uxn_opcodes_h_l2901_c40_32e7_pc;
     jmp_uxn_opcodes_h_l2901_c40_32e7_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l2901_c40_32e7_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l2901_c40_32e7_return_output := jmp_uxn_opcodes_h_l2901_c40_32e7_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2da1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_16fa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c931_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_16fa_return_output;
     VAR_jmp2_uxn_opcodes_h_l2902_c40_6f95_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_edc6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_0193_iftrue := VAR_jmp_uxn_opcodes_h_l2901_c40_32e7_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_c931] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c931_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c931_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c931_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c931_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c931_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c931_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c931_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c931_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_2da1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2da1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2da1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2da1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2da1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2da1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2da1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2da1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2da1_return_output;

     -- jmp2[uxn_opcodes_h_l2902_c40_6f95] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l2902_c40_6f95_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l2902_c40_6f95_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l2902_c40_6f95_phase <= VAR_jmp2_uxn_opcodes_h_l2902_c40_6f95_phase;
     jmp2_uxn_opcodes_h_l2902_c40_6f95_ins <= VAR_jmp2_uxn_opcodes_h_l2902_c40_6f95_ins;
     jmp2_uxn_opcodes_h_l2902_c40_6f95_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l2902_c40_6f95_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l2902_c40_6f95_return_output := jmp2_uxn_opcodes_h_l2902_c40_6f95_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0b6d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2da1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1893_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2da1_return_output;
     VAR_jcn_uxn_opcodes_h_l2903_c40_5135_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c931_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_5780_iftrue := VAR_jmp2_uxn_opcodes_h_l2902_c40_6f95_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_0b6d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0b6d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0b6d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0b6d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0b6d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0b6d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0b6d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0b6d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0b6d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_1893] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1893_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1893_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1893_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1893_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1893_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1893_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1893_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1893_return_output;

     -- jcn[uxn_opcodes_h_l2903_c40_5135] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l2903_c40_5135_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l2903_c40_5135_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l2903_c40_5135_phase <= VAR_jcn_uxn_opcodes_h_l2903_c40_5135_phase;
     jcn_uxn_opcodes_h_l2903_c40_5135_ins <= VAR_jcn_uxn_opcodes_h_l2903_c40_5135_ins;
     jcn_uxn_opcodes_h_l2903_c40_5135_pc <= VAR_jcn_uxn_opcodes_h_l2903_c40_5135_pc;
     jcn_uxn_opcodes_h_l2903_c40_5135_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l2903_c40_5135_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l2903_c40_5135_return_output := jcn_uxn_opcodes_h_l2903_c40_5135_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_f6b1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0b6d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_03e6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0b6d_return_output;
     VAR_jcn2_uxn_opcodes_h_l2904_c40_e211_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1893_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_16fa_iftrue := VAR_jcn_uxn_opcodes_h_l2903_c40_5135_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_f6b1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_f6b1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_f6b1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_f6b1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_f6b1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_f6b1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_f6b1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_f6b1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_f6b1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_03e6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_03e6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_03e6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_03e6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_03e6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_03e6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_03e6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_03e6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_03e6_return_output;

     -- jcn2[uxn_opcodes_h_l2904_c40_e211] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l2904_c40_e211_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l2904_c40_e211_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l2904_c40_e211_phase <= VAR_jcn2_uxn_opcodes_h_l2904_c40_e211_phase;
     jcn2_uxn_opcodes_h_l2904_c40_e211_ins <= VAR_jcn2_uxn_opcodes_h_l2904_c40_e211_ins;
     jcn2_uxn_opcodes_h_l2904_c40_e211_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l2904_c40_e211_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l2904_c40_e211_return_output := jcn2_uxn_opcodes_h_l2904_c40_e211_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_1c1b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_f6b1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6b80_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_f6b1_return_output;
     VAR_jsr_uxn_opcodes_h_l2905_c40_eb2a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_03e6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_2da1_iftrue := VAR_jcn2_uxn_opcodes_h_l2904_c40_e211_return_output;
     -- jsr[uxn_opcodes_h_l2905_c40_eb2a] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l2905_c40_eb2a_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l2905_c40_eb2a_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l2905_c40_eb2a_phase <= VAR_jsr_uxn_opcodes_h_l2905_c40_eb2a_phase;
     jsr_uxn_opcodes_h_l2905_c40_eb2a_ins <= VAR_jsr_uxn_opcodes_h_l2905_c40_eb2a_ins;
     jsr_uxn_opcodes_h_l2905_c40_eb2a_pc <= VAR_jsr_uxn_opcodes_h_l2905_c40_eb2a_pc;
     jsr_uxn_opcodes_h_l2905_c40_eb2a_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l2905_c40_eb2a_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l2905_c40_eb2a_return_output := jsr_uxn_opcodes_h_l2905_c40_eb2a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_1c1b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_1c1b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_1c1b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_1c1b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_1c1b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_1c1b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_1c1b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_1c1b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_1c1b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_6b80] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6b80_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6b80_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6b80_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6b80_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6b80_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6b80_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6b80_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6b80_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4b87_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_1c1b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_c6ac_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_1c1b_return_output;
     VAR_jsr2_uxn_opcodes_h_l2906_c40_be12_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6b80_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0b6d_iftrue := VAR_jsr_uxn_opcodes_h_l2905_c40_eb2a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_c6ac] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_c6ac_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_c6ac_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_c6ac_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_c6ac_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_c6ac_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_c6ac_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_c6ac_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_c6ac_return_output;

     -- jsr2[uxn_opcodes_h_l2906_c40_be12] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l2906_c40_be12_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l2906_c40_be12_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l2906_c40_be12_phase <= VAR_jsr2_uxn_opcodes_h_l2906_c40_be12_phase;
     jsr2_uxn_opcodes_h_l2906_c40_be12_ins <= VAR_jsr2_uxn_opcodes_h_l2906_c40_be12_ins;
     jsr2_uxn_opcodes_h_l2906_c40_be12_pc <= VAR_jsr2_uxn_opcodes_h_l2906_c40_be12_pc;
     jsr2_uxn_opcodes_h_l2906_c40_be12_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l2906_c40_be12_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l2906_c40_be12_return_output := jsr2_uxn_opcodes_h_l2906_c40_be12_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_4b87] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4b87_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4b87_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4b87_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4b87_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4b87_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4b87_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4b87_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4b87_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a9f7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4b87_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d945_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4b87_return_output;
     VAR_sth_uxn_opcodes_h_l2907_c40_5016_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_c6ac_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_f6b1_iftrue := VAR_jsr2_uxn_opcodes_h_l2906_c40_be12_return_output;
     -- sth[uxn_opcodes_h_l2907_c40_5016] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l2907_c40_5016_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l2907_c40_5016_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l2907_c40_5016_phase <= VAR_sth_uxn_opcodes_h_l2907_c40_5016_phase;
     sth_uxn_opcodes_h_l2907_c40_5016_ins <= VAR_sth_uxn_opcodes_h_l2907_c40_5016_ins;
     sth_uxn_opcodes_h_l2907_c40_5016_previous_stack_read <= VAR_sth_uxn_opcodes_h_l2907_c40_5016_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l2907_c40_5016_return_output := sth_uxn_opcodes_h_l2907_c40_5016_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_d945] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d945_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d945_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d945_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d945_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d945_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d945_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d945_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d945_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_a9f7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a9f7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a9f7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a9f7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a9f7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a9f7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a9f7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a9f7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a9f7_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_6feb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a9f7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_f727_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a9f7_return_output;
     VAR_sth2_uxn_opcodes_h_l2908_c40_2433_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d945_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_1c1b_iftrue := VAR_sth_uxn_opcodes_h_l2907_c40_5016_return_output;
     -- sth2[uxn_opcodes_h_l2908_c40_2433] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l2908_c40_2433_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l2908_c40_2433_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l2908_c40_2433_phase <= VAR_sth2_uxn_opcodes_h_l2908_c40_2433_phase;
     sth2_uxn_opcodes_h_l2908_c40_2433_ins <= VAR_sth2_uxn_opcodes_h_l2908_c40_2433_ins;
     sth2_uxn_opcodes_h_l2908_c40_2433_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l2908_c40_2433_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l2908_c40_2433_return_output := sth2_uxn_opcodes_h_l2908_c40_2433_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_6feb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_6feb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_6feb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_6feb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_6feb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_6feb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_6feb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_6feb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_6feb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_f727] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_f727_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_f727_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_f727_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_f727_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_f727_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_f727_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_f727_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_f727_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_af8e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_6feb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_cb41_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_6feb_return_output;
     VAR_ldz_uxn_opcodes_h_l2909_c40_64a9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_f727_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_4b87_iftrue := VAR_sth2_uxn_opcodes_h_l2908_c40_2433_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_af8e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_af8e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_af8e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_af8e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_af8e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_af8e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_af8e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_af8e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_af8e_return_output;

     -- ldz[uxn_opcodes_h_l2909_c40_64a9] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l2909_c40_64a9_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l2909_c40_64a9_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l2909_c40_64a9_phase <= VAR_ldz_uxn_opcodes_h_l2909_c40_64a9_phase;
     ldz_uxn_opcodes_h_l2909_c40_64a9_ins <= VAR_ldz_uxn_opcodes_h_l2909_c40_64a9_ins;
     ldz_uxn_opcodes_h_l2909_c40_64a9_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l2909_c40_64a9_previous_stack_read;
     ldz_uxn_opcodes_h_l2909_c40_64a9_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l2909_c40_64a9_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l2909_c40_64a9_return_output := ldz_uxn_opcodes_h_l2909_c40_64a9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_cb41] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_cb41_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_cb41_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_cb41_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_cb41_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_cb41_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_cb41_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_cb41_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_cb41_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_99f2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_af8e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_779e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_af8e_return_output;
     VAR_ldz2_uxn_opcodes_h_l2910_c40_a8f0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_cb41_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_a9f7_iftrue := VAR_ldz_uxn_opcodes_h_l2909_c40_64a9_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_99f2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_99f2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_99f2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_99f2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_99f2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_99f2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_99f2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_99f2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_99f2_return_output;

     -- ldz2[uxn_opcodes_h_l2910_c40_a8f0] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l2910_c40_a8f0_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l2910_c40_a8f0_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l2910_c40_a8f0_phase <= VAR_ldz2_uxn_opcodes_h_l2910_c40_a8f0_phase;
     ldz2_uxn_opcodes_h_l2910_c40_a8f0_ins <= VAR_ldz2_uxn_opcodes_h_l2910_c40_a8f0_ins;
     ldz2_uxn_opcodes_h_l2910_c40_a8f0_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l2910_c40_a8f0_previous_stack_read;
     ldz2_uxn_opcodes_h_l2910_c40_a8f0_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l2910_c40_a8f0_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l2910_c40_a8f0_return_output := ldz2_uxn_opcodes_h_l2910_c40_a8f0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_779e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_779e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_779e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_779e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_779e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_779e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_779e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_779e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_779e_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3bd2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_99f2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_dd8d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_99f2_return_output;
     VAR_stz_uxn_opcodes_h_l2911_c40_7d0e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_779e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_6feb_iftrue := VAR_ldz2_uxn_opcodes_h_l2910_c40_a8f0_return_output;
     -- stz[uxn_opcodes_h_l2911_c40_7d0e] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l2911_c40_7d0e_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l2911_c40_7d0e_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l2911_c40_7d0e_phase <= VAR_stz_uxn_opcodes_h_l2911_c40_7d0e_phase;
     stz_uxn_opcodes_h_l2911_c40_7d0e_ins <= VAR_stz_uxn_opcodes_h_l2911_c40_7d0e_ins;
     stz_uxn_opcodes_h_l2911_c40_7d0e_previous_stack_read <= VAR_stz_uxn_opcodes_h_l2911_c40_7d0e_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l2911_c40_7d0e_return_output := stz_uxn_opcodes_h_l2911_c40_7d0e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_dd8d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_dd8d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_dd8d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_dd8d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_dd8d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_dd8d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_dd8d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_dd8d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_dd8d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_3bd2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3bd2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3bd2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3bd2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3bd2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3bd2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3bd2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3bd2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3bd2_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_6fd2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3bd2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f11_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3bd2_return_output;
     VAR_stz2_uxn_opcodes_h_l2912_c40_4717_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_dd8d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_af8e_iftrue := VAR_stz_uxn_opcodes_h_l2911_c40_7d0e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_2f11] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f11_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f11_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f11_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f11_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f11_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f11_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f11_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f11_return_output;

     -- stz2[uxn_opcodes_h_l2912_c40_4717] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l2912_c40_4717_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l2912_c40_4717_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l2912_c40_4717_phase <= VAR_stz2_uxn_opcodes_h_l2912_c40_4717_phase;
     stz2_uxn_opcodes_h_l2912_c40_4717_ins <= VAR_stz2_uxn_opcodes_h_l2912_c40_4717_ins;
     stz2_uxn_opcodes_h_l2912_c40_4717_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l2912_c40_4717_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l2912_c40_4717_return_output := stz2_uxn_opcodes_h_l2912_c40_4717_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_6fd2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_6fd2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_6fd2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_6fd2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_6fd2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_6fd2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_6fd2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_6fd2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_6fd2_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_a2fc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_6fd2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49d2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_6fd2_return_output;
     VAR_ldr_uxn_opcodes_h_l2913_c40_ef78_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f11_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_99f2_iftrue := VAR_stz2_uxn_opcodes_h_l2912_c40_4717_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_49d2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49d2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49d2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49d2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49d2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49d2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49d2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49d2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49d2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_a2fc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_a2fc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_a2fc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_a2fc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_a2fc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_a2fc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_a2fc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_a2fc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_a2fc_return_output;

     -- ldr[uxn_opcodes_h_l2913_c40_ef78] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l2913_c40_ef78_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l2913_c40_ef78_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l2913_c40_ef78_phase <= VAR_ldr_uxn_opcodes_h_l2913_c40_ef78_phase;
     ldr_uxn_opcodes_h_l2913_c40_ef78_ins <= VAR_ldr_uxn_opcodes_h_l2913_c40_ef78_ins;
     ldr_uxn_opcodes_h_l2913_c40_ef78_pc <= VAR_ldr_uxn_opcodes_h_l2913_c40_ef78_pc;
     ldr_uxn_opcodes_h_l2913_c40_ef78_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l2913_c40_ef78_previous_stack_read;
     ldr_uxn_opcodes_h_l2913_c40_ef78_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l2913_c40_ef78_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l2913_c40_ef78_return_output := ldr_uxn_opcodes_h_l2913_c40_ef78_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_1b3d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_a2fc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a4db_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_a2fc_return_output;
     VAR_ldr2_uxn_opcodes_h_l2914_c40_fc66_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49d2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_3bd2_iftrue := VAR_ldr_uxn_opcodes_h_l2913_c40_ef78_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_1b3d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_1b3d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_1b3d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_1b3d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_1b3d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_1b3d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_1b3d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_1b3d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_1b3d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_a4db] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a4db_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a4db_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a4db_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a4db_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a4db_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a4db_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a4db_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a4db_return_output;

     -- ldr2[uxn_opcodes_h_l2914_c40_fc66] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l2914_c40_fc66_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l2914_c40_fc66_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l2914_c40_fc66_phase <= VAR_ldr2_uxn_opcodes_h_l2914_c40_fc66_phase;
     ldr2_uxn_opcodes_h_l2914_c40_fc66_ins <= VAR_ldr2_uxn_opcodes_h_l2914_c40_fc66_ins;
     ldr2_uxn_opcodes_h_l2914_c40_fc66_pc <= VAR_ldr2_uxn_opcodes_h_l2914_c40_fc66_pc;
     ldr2_uxn_opcodes_h_l2914_c40_fc66_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l2914_c40_fc66_previous_stack_read;
     ldr2_uxn_opcodes_h_l2914_c40_fc66_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l2914_c40_fc66_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l2914_c40_fc66_return_output := ldr2_uxn_opcodes_h_l2914_c40_fc66_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7424_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_1b3d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9bec_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_1b3d_return_output;
     VAR_str1_uxn_opcodes_h_l2915_c40_f3ab_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_a4db_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_6fd2_iftrue := VAR_ldr2_uxn_opcodes_h_l2914_c40_fc66_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_7424] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7424_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7424_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7424_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7424_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7424_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7424_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7424_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7424_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_9bec] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9bec_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9bec_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9bec_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9bec_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9bec_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9bec_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9bec_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9bec_return_output;

     -- str1[uxn_opcodes_h_l2915_c40_f3ab] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l2915_c40_f3ab_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l2915_c40_f3ab_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l2915_c40_f3ab_phase <= VAR_str1_uxn_opcodes_h_l2915_c40_f3ab_phase;
     str1_uxn_opcodes_h_l2915_c40_f3ab_ins <= VAR_str1_uxn_opcodes_h_l2915_c40_f3ab_ins;
     str1_uxn_opcodes_h_l2915_c40_f3ab_pc <= VAR_str1_uxn_opcodes_h_l2915_c40_f3ab_pc;
     str1_uxn_opcodes_h_l2915_c40_f3ab_previous_stack_read <= VAR_str1_uxn_opcodes_h_l2915_c40_f3ab_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l2915_c40_f3ab_return_output := str1_uxn_opcodes_h_l2915_c40_f3ab_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_f6b7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7424_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_bc3c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7424_return_output;
     VAR_str2_uxn_opcodes_h_l2916_c40_53ec_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9bec_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_a2fc_iftrue := VAR_str1_uxn_opcodes_h_l2915_c40_f3ab_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_bc3c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_bc3c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_bc3c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_bc3c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_bc3c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_bc3c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_bc3c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_bc3c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_bc3c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_f6b7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_f6b7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_f6b7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_f6b7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_f6b7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_f6b7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_f6b7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_f6b7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_f6b7_return_output;

     -- str2[uxn_opcodes_h_l2916_c40_53ec] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l2916_c40_53ec_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l2916_c40_53ec_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l2916_c40_53ec_phase <= VAR_str2_uxn_opcodes_h_l2916_c40_53ec_phase;
     str2_uxn_opcodes_h_l2916_c40_53ec_ins <= VAR_str2_uxn_opcodes_h_l2916_c40_53ec_ins;
     str2_uxn_opcodes_h_l2916_c40_53ec_pc <= VAR_str2_uxn_opcodes_h_l2916_c40_53ec_pc;
     str2_uxn_opcodes_h_l2916_c40_53ec_previous_stack_read <= VAR_str2_uxn_opcodes_h_l2916_c40_53ec_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l2916_c40_53ec_return_output := str2_uxn_opcodes_h_l2916_c40_53ec_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0988_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_f6b7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_7625_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_f6b7_return_output;
     VAR_lda_uxn_opcodes_h_l2917_c40_025f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_bc3c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_1b3d_iftrue := VAR_str2_uxn_opcodes_h_l2916_c40_53ec_return_output;
     -- lda[uxn_opcodes_h_l2917_c40_025f] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l2917_c40_025f_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l2917_c40_025f_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l2917_c40_025f_phase <= VAR_lda_uxn_opcodes_h_l2917_c40_025f_phase;
     lda_uxn_opcodes_h_l2917_c40_025f_ins <= VAR_lda_uxn_opcodes_h_l2917_c40_025f_ins;
     lda_uxn_opcodes_h_l2917_c40_025f_previous_stack_read <= VAR_lda_uxn_opcodes_h_l2917_c40_025f_previous_stack_read;
     lda_uxn_opcodes_h_l2917_c40_025f_previous_ram_read <= VAR_lda_uxn_opcodes_h_l2917_c40_025f_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l2917_c40_025f_return_output := lda_uxn_opcodes_h_l2917_c40_025f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_7625] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_7625_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_7625_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_7625_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_7625_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_7625_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_7625_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_7625_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_7625_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_0988] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0988_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0988_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0988_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0988_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0988_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0988_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0988_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0988_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_6ab5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0988_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_b2e8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0988_return_output;
     VAR_lda2_uxn_opcodes_h_l2918_c40_6eeb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_7625_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_7424_iftrue := VAR_lda_uxn_opcodes_h_l2917_c40_025f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_b2e8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_b2e8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_b2e8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_b2e8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_b2e8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_b2e8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_b2e8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_b2e8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_b2e8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_6ab5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_6ab5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_6ab5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_6ab5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_6ab5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_6ab5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_6ab5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_6ab5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_6ab5_return_output;

     -- lda2[uxn_opcodes_h_l2918_c40_6eeb] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l2918_c40_6eeb_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l2918_c40_6eeb_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l2918_c40_6eeb_phase <= VAR_lda2_uxn_opcodes_h_l2918_c40_6eeb_phase;
     lda2_uxn_opcodes_h_l2918_c40_6eeb_ins <= VAR_lda2_uxn_opcodes_h_l2918_c40_6eeb_ins;
     lda2_uxn_opcodes_h_l2918_c40_6eeb_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l2918_c40_6eeb_previous_stack_read;
     lda2_uxn_opcodes_h_l2918_c40_6eeb_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l2918_c40_6eeb_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l2918_c40_6eeb_return_output := lda2_uxn_opcodes_h_l2918_c40_6eeb_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_0118_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_6ab5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_1737_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_6ab5_return_output;
     VAR_sta_uxn_opcodes_h_l2919_c40_0aa2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_b2e8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_f6b7_iftrue := VAR_lda2_uxn_opcodes_h_l2918_c40_6eeb_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_1737] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_1737_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_1737_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_1737_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_1737_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_1737_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_1737_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_1737_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_1737_return_output;

     -- sta[uxn_opcodes_h_l2919_c40_0aa2] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l2919_c40_0aa2_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l2919_c40_0aa2_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l2919_c40_0aa2_phase <= VAR_sta_uxn_opcodes_h_l2919_c40_0aa2_phase;
     sta_uxn_opcodes_h_l2919_c40_0aa2_ins <= VAR_sta_uxn_opcodes_h_l2919_c40_0aa2_ins;
     sta_uxn_opcodes_h_l2919_c40_0aa2_previous_stack_read <= VAR_sta_uxn_opcodes_h_l2919_c40_0aa2_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l2919_c40_0aa2_return_output := sta_uxn_opcodes_h_l2919_c40_0aa2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_0118] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_0118_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_0118_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_0118_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_0118_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_0118_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_0118_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_0118_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_0118_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_4384_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_0118_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0fcf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_0118_return_output;
     VAR_sta2_uxn_opcodes_h_l2920_c40_bcf5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_1737_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_0988_iftrue := VAR_sta_uxn_opcodes_h_l2919_c40_0aa2_return_output;
     -- sta2[uxn_opcodes_h_l2920_c40_bcf5] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l2920_c40_bcf5_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l2920_c40_bcf5_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l2920_c40_bcf5_phase <= VAR_sta2_uxn_opcodes_h_l2920_c40_bcf5_phase;
     sta2_uxn_opcodes_h_l2920_c40_bcf5_ins <= VAR_sta2_uxn_opcodes_h_l2920_c40_bcf5_ins;
     sta2_uxn_opcodes_h_l2920_c40_bcf5_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l2920_c40_bcf5_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l2920_c40_bcf5_return_output := sta2_uxn_opcodes_h_l2920_c40_bcf5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_0fcf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0fcf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0fcf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0fcf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0fcf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0fcf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0fcf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0fcf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0fcf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_4384] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_4384_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_4384_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_4384_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_4384_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_4384_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_4384_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_4384_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_4384_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_c223_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_4384_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d5de_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_4384_return_output;
     VAR_dei_uxn_opcodes_h_l2921_c40_7b40_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0fcf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_6ab5_iftrue := VAR_sta2_uxn_opcodes_h_l2920_c40_bcf5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_c223] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_c223_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_c223_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_c223_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_c223_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_c223_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_c223_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_c223_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_c223_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_d5de] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d5de_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d5de_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d5de_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d5de_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d5de_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d5de_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d5de_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d5de_return_output;

     -- dei[uxn_opcodes_h_l2921_c40_7b40] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l2921_c40_7b40_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l2921_c40_7b40_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l2921_c40_7b40_phase <= VAR_dei_uxn_opcodes_h_l2921_c40_7b40_phase;
     dei_uxn_opcodes_h_l2921_c40_7b40_ins <= VAR_dei_uxn_opcodes_h_l2921_c40_7b40_ins;
     dei_uxn_opcodes_h_l2921_c40_7b40_previous_stack_read <= VAR_dei_uxn_opcodes_h_l2921_c40_7b40_previous_stack_read;
     dei_uxn_opcodes_h_l2921_c40_7b40_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l2921_c40_7b40_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l2921_c40_7b40_return_output := dei_uxn_opcodes_h_l2921_c40_7b40_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_63e8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_c223_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_467e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_c223_return_output;
     VAR_dei2_uxn_opcodes_h_l2922_c40_30a5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d5de_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_0118_iftrue := VAR_dei_uxn_opcodes_h_l2921_c40_7b40_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_467e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_467e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_467e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_467e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_467e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_467e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_467e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_467e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_467e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_63e8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_63e8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_63e8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_63e8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_63e8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_63e8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_63e8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_63e8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_63e8_return_output;

     -- dei2[uxn_opcodes_h_l2922_c40_30a5] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l2922_c40_30a5_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l2922_c40_30a5_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l2922_c40_30a5_phase <= VAR_dei2_uxn_opcodes_h_l2922_c40_30a5_phase;
     dei2_uxn_opcodes_h_l2922_c40_30a5_ins <= VAR_dei2_uxn_opcodes_h_l2922_c40_30a5_ins;
     dei2_uxn_opcodes_h_l2922_c40_30a5_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l2922_c40_30a5_previous_stack_read;
     dei2_uxn_opcodes_h_l2922_c40_30a5_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l2922_c40_30a5_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l2922_c40_30a5_return_output := dei2_uxn_opcodes_h_l2922_c40_30a5_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_6f04_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_63e8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_5439_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_63e8_return_output;
     VAR_deo_uxn_opcodes_h_l2923_c40_4ca7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_467e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_4384_iftrue := VAR_dei2_uxn_opcodes_h_l2922_c40_30a5_return_output;
     -- deo[uxn_opcodes_h_l2923_c40_4ca7] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l2923_c40_4ca7_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l2923_c40_4ca7_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l2923_c40_4ca7_phase <= VAR_deo_uxn_opcodes_h_l2923_c40_4ca7_phase;
     deo_uxn_opcodes_h_l2923_c40_4ca7_ins <= VAR_deo_uxn_opcodes_h_l2923_c40_4ca7_ins;
     deo_uxn_opcodes_h_l2923_c40_4ca7_previous_stack_read <= VAR_deo_uxn_opcodes_h_l2923_c40_4ca7_previous_stack_read;
     deo_uxn_opcodes_h_l2923_c40_4ca7_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l2923_c40_4ca7_previous_device_ram_read;
     deo_uxn_opcodes_h_l2923_c40_4ca7_previous_ram_read <= VAR_deo_uxn_opcodes_h_l2923_c40_4ca7_previous_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l2923_c40_4ca7_return_output := deo_uxn_opcodes_h_l2923_c40_4ca7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_5439] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_5439_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_5439_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_5439_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_5439_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_5439_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_5439_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_5439_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_5439_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_6f04] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_6f04_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_6f04_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_6f04_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_6f04_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_6f04_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_6f04_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_6f04_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_6f04_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e663_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_6f04_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_36ab_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_6f04_return_output;
     VAR_deo2_uxn_opcodes_h_l2924_c40_a34e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_5439_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_c223_iftrue := VAR_deo_uxn_opcodes_h_l2923_c40_4ca7_return_output;
     -- deo2[uxn_opcodes_h_l2924_c40_a34e] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l2924_c40_a34e_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l2924_c40_a34e_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l2924_c40_a34e_phase <= VAR_deo2_uxn_opcodes_h_l2924_c40_a34e_phase;
     deo2_uxn_opcodes_h_l2924_c40_a34e_ins <= VAR_deo2_uxn_opcodes_h_l2924_c40_a34e_ins;
     deo2_uxn_opcodes_h_l2924_c40_a34e_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l2924_c40_a34e_previous_stack_read;
     deo2_uxn_opcodes_h_l2924_c40_a34e_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l2924_c40_a34e_previous_device_ram_read;
     deo2_uxn_opcodes_h_l2924_c40_a34e_previous_ram_read <= VAR_deo2_uxn_opcodes_h_l2924_c40_a34e_previous_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l2924_c40_a34e_return_output := deo2_uxn_opcodes_h_l2924_c40_a34e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_36ab] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_36ab_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_36ab_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_36ab_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_36ab_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_36ab_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_36ab_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_36ab_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_36ab_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_e663] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e663_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e663_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e663_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e663_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e663_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e663_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e663_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e663_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_76e1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e663_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_cb5e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e663_return_output;
     VAR_add_uxn_opcodes_h_l2925_c40_b133_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_36ab_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_63e8_iftrue := VAR_deo2_uxn_opcodes_h_l2924_c40_a34e_return_output;
     -- add[uxn_opcodes_h_l2925_c40_b133] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l2925_c40_b133_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l2925_c40_b133_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l2925_c40_b133_phase <= VAR_add_uxn_opcodes_h_l2925_c40_b133_phase;
     add_uxn_opcodes_h_l2925_c40_b133_ins <= VAR_add_uxn_opcodes_h_l2925_c40_b133_ins;
     add_uxn_opcodes_h_l2925_c40_b133_previous_stack_read <= VAR_add_uxn_opcodes_h_l2925_c40_b133_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l2925_c40_b133_return_output := add_uxn_opcodes_h_l2925_c40_b133_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_76e1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_76e1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_76e1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_76e1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_76e1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_76e1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_76e1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_76e1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_76e1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_cb5e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_cb5e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_cb5e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_cb5e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_cb5e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_cb5e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_cb5e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_cb5e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_cb5e_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_85ac_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_76e1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ebd8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_76e1_return_output;
     VAR_add2_uxn_opcodes_h_l2926_c40_7dbe_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_cb5e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_6f04_iftrue := VAR_add_uxn_opcodes_h_l2925_c40_b133_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_85ac] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_85ac_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_85ac_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_85ac_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_85ac_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_85ac_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_85ac_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_85ac_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_85ac_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_ebd8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ebd8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ebd8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ebd8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ebd8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ebd8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ebd8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ebd8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ebd8_return_output;

     -- add2[uxn_opcodes_h_l2926_c40_7dbe] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l2926_c40_7dbe_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l2926_c40_7dbe_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l2926_c40_7dbe_phase <= VAR_add2_uxn_opcodes_h_l2926_c40_7dbe_phase;
     add2_uxn_opcodes_h_l2926_c40_7dbe_ins <= VAR_add2_uxn_opcodes_h_l2926_c40_7dbe_ins;
     add2_uxn_opcodes_h_l2926_c40_7dbe_previous_stack_read <= VAR_add2_uxn_opcodes_h_l2926_c40_7dbe_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l2926_c40_7dbe_return_output := add2_uxn_opcodes_h_l2926_c40_7dbe_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_41af_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_85ac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_2220_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_85ac_return_output;
     VAR_sub_uxn_opcodes_h_l2927_c40_23ae_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ebd8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_e663_iftrue := VAR_add2_uxn_opcodes_h_l2926_c40_7dbe_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_41af] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_41af_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_41af_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_41af_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_41af_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_41af_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_41af_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_41af_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_41af_return_output;

     -- sub[uxn_opcodes_h_l2927_c40_23ae] LATENCY=0
     -- Clock enable
     sub_uxn_opcodes_h_l2927_c40_23ae_CLOCK_ENABLE <= VAR_sub_uxn_opcodes_h_l2927_c40_23ae_CLOCK_ENABLE;
     -- Inputs
     sub_uxn_opcodes_h_l2927_c40_23ae_phase <= VAR_sub_uxn_opcodes_h_l2927_c40_23ae_phase;
     sub_uxn_opcodes_h_l2927_c40_23ae_ins <= VAR_sub_uxn_opcodes_h_l2927_c40_23ae_ins;
     sub_uxn_opcodes_h_l2927_c40_23ae_previous_stack_read <= VAR_sub_uxn_opcodes_h_l2927_c40_23ae_previous_stack_read;
     -- Outputs
     VAR_sub_uxn_opcodes_h_l2927_c40_23ae_return_output := sub_uxn_opcodes_h_l2927_c40_23ae_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_2220] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_2220_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_2220_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_2220_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_2220_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_2220_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_2220_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_2220_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_2220_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b79c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_41af_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_70fb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_41af_return_output;
     VAR_sub2_uxn_opcodes_h_l2928_c40_785e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_2220_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_76e1_iftrue := VAR_sub_uxn_opcodes_h_l2927_c40_23ae_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_b79c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b79c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b79c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b79c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b79c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b79c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b79c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b79c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b79c_return_output;

     -- sub2[uxn_opcodes_h_l2928_c40_785e] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l2928_c40_785e_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l2928_c40_785e_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l2928_c40_785e_phase <= VAR_sub2_uxn_opcodes_h_l2928_c40_785e_phase;
     sub2_uxn_opcodes_h_l2928_c40_785e_ins <= VAR_sub2_uxn_opcodes_h_l2928_c40_785e_ins;
     sub2_uxn_opcodes_h_l2928_c40_785e_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l2928_c40_785e_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l2928_c40_785e_return_output := sub2_uxn_opcodes_h_l2928_c40_785e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_70fb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_70fb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_70fb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_70fb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_70fb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_70fb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_70fb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_70fb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_70fb_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_12f3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b79c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_a39f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b79c_return_output;
     VAR_mul_uxn_opcodes_h_l2929_c40_120a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_70fb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_85ac_iftrue := VAR_sub2_uxn_opcodes_h_l2928_c40_785e_return_output;
     -- mul[uxn_opcodes_h_l2929_c40_120a] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l2929_c40_120a_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l2929_c40_120a_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l2929_c40_120a_phase <= VAR_mul_uxn_opcodes_h_l2929_c40_120a_phase;
     mul_uxn_opcodes_h_l2929_c40_120a_ins <= VAR_mul_uxn_opcodes_h_l2929_c40_120a_ins;
     mul_uxn_opcodes_h_l2929_c40_120a_previous_stack_read <= VAR_mul_uxn_opcodes_h_l2929_c40_120a_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l2929_c40_120a_return_output := mul_uxn_opcodes_h_l2929_c40_120a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_12f3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_12f3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_12f3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_12f3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_12f3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_12f3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_12f3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_12f3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_12f3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_a39f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_a39f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_a39f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_a39f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_a39f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_a39f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_a39f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_a39f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_a39f_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b43d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_12f3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5db8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_12f3_return_output;
     VAR_mul2_uxn_opcodes_h_l2930_c40_d33c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_a39f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_41af_iftrue := VAR_mul_uxn_opcodes_h_l2929_c40_120a_return_output;
     -- mul2[uxn_opcodes_h_l2930_c40_d33c] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l2930_c40_d33c_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l2930_c40_d33c_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l2930_c40_d33c_phase <= VAR_mul2_uxn_opcodes_h_l2930_c40_d33c_phase;
     mul2_uxn_opcodes_h_l2930_c40_d33c_ins <= VAR_mul2_uxn_opcodes_h_l2930_c40_d33c_ins;
     mul2_uxn_opcodes_h_l2930_c40_d33c_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l2930_c40_d33c_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l2930_c40_d33c_return_output := mul2_uxn_opcodes_h_l2930_c40_d33c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_5db8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5db8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5db8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5db8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5db8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5db8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5db8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5db8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5db8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_b43d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b43d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b43d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b43d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b43d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b43d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b43d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b43d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b43d_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_982e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b43d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3296_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b43d_return_output;
     VAR_div_uxn_opcodes_h_l2931_c40_ca74_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_5db8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b79c_iftrue := VAR_mul2_uxn_opcodes_h_l2930_c40_d33c_return_output;
     -- div[uxn_opcodes_h_l2931_c40_ca74] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l2931_c40_ca74_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l2931_c40_ca74_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l2931_c40_ca74_phase <= VAR_div_uxn_opcodes_h_l2931_c40_ca74_phase;
     div_uxn_opcodes_h_l2931_c40_ca74_ins <= VAR_div_uxn_opcodes_h_l2931_c40_ca74_ins;
     div_uxn_opcodes_h_l2931_c40_ca74_previous_stack_read <= VAR_div_uxn_opcodes_h_l2931_c40_ca74_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l2931_c40_ca74_return_output := div_uxn_opcodes_h_l2931_c40_ca74_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_3296] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3296_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3296_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3296_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3296_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3296_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3296_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3296_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3296_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_982e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_982e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_982e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_982e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_982e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_982e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_982e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_982e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_982e_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_3562_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_982e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b0a3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_982e_return_output;
     VAR_div2_uxn_opcodes_h_l2932_c40_e2aa_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3296_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_12f3_iftrue := VAR_div_uxn_opcodes_h_l2931_c40_ca74_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_3562] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_3562_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_3562_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_3562_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_3562_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_3562_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_3562_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_3562_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_3562_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_b0a3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b0a3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b0a3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b0a3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b0a3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b0a3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b0a3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b0a3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b0a3_return_output;

     -- div2[uxn_opcodes_h_l2932_c40_e2aa] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l2932_c40_e2aa_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l2932_c40_e2aa_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l2932_c40_e2aa_phase <= VAR_div2_uxn_opcodes_h_l2932_c40_e2aa_phase;
     div2_uxn_opcodes_h_l2932_c40_e2aa_ins <= VAR_div2_uxn_opcodes_h_l2932_c40_e2aa_ins;
     div2_uxn_opcodes_h_l2932_c40_e2aa_previous_stack_read <= VAR_div2_uxn_opcodes_h_l2932_c40_e2aa_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l2932_c40_e2aa_return_output := div2_uxn_opcodes_h_l2932_c40_e2aa_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_be09_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_3562_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_fd55_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_3562_return_output;
     VAR_and_uxn_opcodes_h_l2933_c40_3577_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b0a3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_b43d_iftrue := VAR_div2_uxn_opcodes_h_l2932_c40_e2aa_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_be09] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_be09_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_be09_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_be09_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_be09_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_be09_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_be09_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_be09_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_be09_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_fd55] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_fd55_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_fd55_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_fd55_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_fd55_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_fd55_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_fd55_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_fd55_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_fd55_return_output;

     -- and[uxn_opcodes_h_l2933_c40_3577] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l2933_c40_3577_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l2933_c40_3577_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l2933_c40_3577_phase <= VAR_and_uxn_opcodes_h_l2933_c40_3577_phase;
     and_uxn_opcodes_h_l2933_c40_3577_ins <= VAR_and_uxn_opcodes_h_l2933_c40_3577_ins;
     and_uxn_opcodes_h_l2933_c40_3577_previous_stack_read <= VAR_and_uxn_opcodes_h_l2933_c40_3577_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l2933_c40_3577_return_output := and_uxn_opcodes_h_l2933_c40_3577_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fe83_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_be09_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5013_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_be09_return_output;
     VAR_and2_uxn_opcodes_h_l2934_c40_29c3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_fd55_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_982e_iftrue := VAR_and_uxn_opcodes_h_l2933_c40_3577_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_5013] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5013_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5013_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5013_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5013_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5013_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5013_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5013_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5013_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_fe83] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fe83_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fe83_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fe83_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fe83_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fe83_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fe83_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fe83_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fe83_return_output;

     -- and2[uxn_opcodes_h_l2934_c40_29c3] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l2934_c40_29c3_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l2934_c40_29c3_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l2934_c40_29c3_phase <= VAR_and2_uxn_opcodes_h_l2934_c40_29c3_phase;
     and2_uxn_opcodes_h_l2934_c40_29c3_ins <= VAR_and2_uxn_opcodes_h_l2934_c40_29c3_ins;
     and2_uxn_opcodes_h_l2934_c40_29c3_previous_stack_read <= VAR_and2_uxn_opcodes_h_l2934_c40_29c3_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l2934_c40_29c3_return_output := and2_uxn_opcodes_h_l2934_c40_29c3_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_97a0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fe83_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e69b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fe83_return_output;
     VAR_ora_uxn_opcodes_h_l2935_c40_afa7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_5013_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_3562_iftrue := VAR_and2_uxn_opcodes_h_l2934_c40_29c3_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_e69b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e69b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e69b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e69b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e69b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e69b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e69b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e69b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e69b_return_output;

     -- ora[uxn_opcodes_h_l2935_c40_afa7] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l2935_c40_afa7_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l2935_c40_afa7_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l2935_c40_afa7_phase <= VAR_ora_uxn_opcodes_h_l2935_c40_afa7_phase;
     ora_uxn_opcodes_h_l2935_c40_afa7_ins <= VAR_ora_uxn_opcodes_h_l2935_c40_afa7_ins;
     ora_uxn_opcodes_h_l2935_c40_afa7_previous_stack_read <= VAR_ora_uxn_opcodes_h_l2935_c40_afa7_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l2935_c40_afa7_return_output := ora_uxn_opcodes_h_l2935_c40_afa7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_97a0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_97a0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_97a0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_97a0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_97a0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_97a0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_97a0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_97a0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_97a0_return_output;

     -- Submodule level 74
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_174c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_97a0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_54cd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_97a0_return_output;
     VAR_ora2_uxn_opcodes_h_l2936_c40_79e7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e69b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_be09_iftrue := VAR_ora_uxn_opcodes_h_l2935_c40_afa7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_174c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_174c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_174c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_174c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_174c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_174c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_174c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_174c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_174c_return_output;

     -- ora2[uxn_opcodes_h_l2936_c40_79e7] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l2936_c40_79e7_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l2936_c40_79e7_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l2936_c40_79e7_phase <= VAR_ora2_uxn_opcodes_h_l2936_c40_79e7_phase;
     ora2_uxn_opcodes_h_l2936_c40_79e7_ins <= VAR_ora2_uxn_opcodes_h_l2936_c40_79e7_ins;
     ora2_uxn_opcodes_h_l2936_c40_79e7_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l2936_c40_79e7_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l2936_c40_79e7_return_output := ora2_uxn_opcodes_h_l2936_c40_79e7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_54cd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_54cd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_54cd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_54cd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_54cd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_54cd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_54cd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_54cd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_54cd_return_output;

     -- Submodule level 75
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4b7a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_174c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_90a5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_174c_return_output;
     VAR_eor_uxn_opcodes_h_l2937_c40_8514_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_54cd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_fe83_iftrue := VAR_ora2_uxn_opcodes_h_l2936_c40_79e7_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_90a5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_90a5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_90a5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_90a5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_90a5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_90a5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_90a5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_90a5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_90a5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_4b7a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4b7a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4b7a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4b7a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4b7a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4b7a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4b7a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4b7a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4b7a_return_output;

     -- eor[uxn_opcodes_h_l2937_c40_8514] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l2937_c40_8514_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l2937_c40_8514_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l2937_c40_8514_phase <= VAR_eor_uxn_opcodes_h_l2937_c40_8514_phase;
     eor_uxn_opcodes_h_l2937_c40_8514_ins <= VAR_eor_uxn_opcodes_h_l2937_c40_8514_ins;
     eor_uxn_opcodes_h_l2937_c40_8514_previous_stack_read <= VAR_eor_uxn_opcodes_h_l2937_c40_8514_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l2937_c40_8514_return_output := eor_uxn_opcodes_h_l2937_c40_8514_return_output;

     -- Submodule level 76
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9399_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4b7a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_d14e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4b7a_return_output;
     VAR_eor2_uxn_opcodes_h_l2938_c40_d819_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_90a5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_97a0_iftrue := VAR_eor_uxn_opcodes_h_l2937_c40_8514_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_d14e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_d14e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_d14e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_d14e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_d14e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_d14e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_d14e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_d14e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_d14e_return_output;

     -- eor2[uxn_opcodes_h_l2938_c40_d819] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l2938_c40_d819_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l2938_c40_d819_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l2938_c40_d819_phase <= VAR_eor2_uxn_opcodes_h_l2938_c40_d819_phase;
     eor2_uxn_opcodes_h_l2938_c40_d819_ins <= VAR_eor2_uxn_opcodes_h_l2938_c40_d819_ins;
     eor2_uxn_opcodes_h_l2938_c40_d819_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l2938_c40_d819_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l2938_c40_d819_return_output := eor2_uxn_opcodes_h_l2938_c40_d819_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_9399] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9399_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9399_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9399_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9399_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9399_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9399_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9399_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9399_return_output;

     -- Submodule level 77
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_333b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9399_return_output;
     VAR_sft_uxn_opcodes_h_l2939_c40_5619_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_d14e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_174c_iftrue := VAR_eor2_uxn_opcodes_h_l2938_c40_d819_return_output;
     -- sft[uxn_opcodes_h_l2939_c40_5619] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l2939_c40_5619_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l2939_c40_5619_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l2939_c40_5619_phase <= VAR_sft_uxn_opcodes_h_l2939_c40_5619_phase;
     sft_uxn_opcodes_h_l2939_c40_5619_ins <= VAR_sft_uxn_opcodes_h_l2939_c40_5619_ins;
     sft_uxn_opcodes_h_l2939_c40_5619_previous_stack_read <= VAR_sft_uxn_opcodes_h_l2939_c40_5619_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l2939_c40_5619_return_output := sft_uxn_opcodes_h_l2939_c40_5619_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_333b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_333b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_333b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_333b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_333b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_333b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_333b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_333b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_333b_return_output;

     -- Submodule level 78
     VAR_sft2_uxn_opcodes_h_l2940_c40_180c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_333b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_4b7a_iftrue := VAR_sft_uxn_opcodes_h_l2939_c40_5619_return_output;
     -- sft2[uxn_opcodes_h_l2940_c40_180c] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l2940_c40_180c_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l2940_c40_180c_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l2940_c40_180c_phase <= VAR_sft2_uxn_opcodes_h_l2940_c40_180c_phase;
     sft2_uxn_opcodes_h_l2940_c40_180c_ins <= VAR_sft2_uxn_opcodes_h_l2940_c40_180c_ins;
     sft2_uxn_opcodes_h_l2940_c40_180c_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l2940_c40_180c_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l2940_c40_180c_return_output := sft2_uxn_opcodes_h_l2940_c40_180c_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_9399_iftrue := VAR_sft2_uxn_opcodes_h_l2940_c40_180c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2940_c7_9399] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2940_c7_9399_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_9399_cond;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_9399_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_9399_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_9399_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_9399_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_9399_return_output := opc_result_MUX_uxn_opcodes_h_l2940_c7_9399_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_4b7a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_9399_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2939_c7_4b7a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2939_c7_4b7a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_4b7a_cond;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_4b7a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_4b7a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_4b7a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_4b7a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_4b7a_return_output := opc_result_MUX_uxn_opcodes_h_l2939_c7_4b7a_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_174c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_4b7a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2938_c7_174c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2938_c7_174c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_174c_cond;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_174c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_174c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_174c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_174c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_174c_return_output := opc_result_MUX_uxn_opcodes_h_l2938_c7_174c_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_97a0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_174c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2937_c7_97a0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2937_c7_97a0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_97a0_cond;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_97a0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_97a0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_97a0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_97a0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_97a0_return_output := opc_result_MUX_uxn_opcodes_h_l2937_c7_97a0_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_fe83_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_97a0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2936_c7_fe83] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2936_c7_fe83_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_fe83_cond;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_fe83_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_fe83_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_fe83_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_fe83_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_fe83_return_output := opc_result_MUX_uxn_opcodes_h_l2936_c7_fe83_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_be09_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_fe83_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2935_c7_be09] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2935_c7_be09_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_be09_cond;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_be09_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_be09_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_be09_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_be09_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_be09_return_output := opc_result_MUX_uxn_opcodes_h_l2935_c7_be09_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_3562_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_be09_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2934_c7_3562] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2934_c7_3562_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_3562_cond;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_3562_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_3562_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_3562_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_3562_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_3562_return_output := opc_result_MUX_uxn_opcodes_h_l2934_c7_3562_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_982e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_3562_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2933_c7_982e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2933_c7_982e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_982e_cond;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_982e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_982e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_982e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_982e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_982e_return_output := opc_result_MUX_uxn_opcodes_h_l2933_c7_982e_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_b43d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_982e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2932_c7_b43d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2932_c7_b43d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_b43d_cond;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_b43d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_b43d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_b43d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_b43d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_b43d_return_output := opc_result_MUX_uxn_opcodes_h_l2932_c7_b43d_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_12f3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_b43d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2931_c7_12f3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2931_c7_12f3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_12f3_cond;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_12f3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_12f3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_12f3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_12f3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_12f3_return_output := opc_result_MUX_uxn_opcodes_h_l2931_c7_12f3_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b79c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_12f3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2930_c7_b79c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2930_c7_b79c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b79c_cond;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_b79c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b79c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_b79c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b79c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b79c_return_output := opc_result_MUX_uxn_opcodes_h_l2930_c7_b79c_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_41af_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b79c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2929_c7_41af] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2929_c7_41af_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_41af_cond;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_41af_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_41af_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_41af_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_41af_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_41af_return_output := opc_result_MUX_uxn_opcodes_h_l2929_c7_41af_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_85ac_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_41af_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2928_c7_85ac] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2928_c7_85ac_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_85ac_cond;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_85ac_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_85ac_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_85ac_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_85ac_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_85ac_return_output := opc_result_MUX_uxn_opcodes_h_l2928_c7_85ac_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_76e1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_85ac_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2927_c7_76e1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2927_c7_76e1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_76e1_cond;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_76e1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_76e1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_76e1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_76e1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_76e1_return_output := opc_result_MUX_uxn_opcodes_h_l2927_c7_76e1_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_e663_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_76e1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2926_c7_e663] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2926_c7_e663_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_e663_cond;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_e663_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_e663_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_e663_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_e663_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_e663_return_output := opc_result_MUX_uxn_opcodes_h_l2926_c7_e663_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_6f04_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_e663_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2925_c7_6f04] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2925_c7_6f04_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_6f04_cond;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_6f04_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_6f04_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_6f04_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_6f04_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_6f04_return_output := opc_result_MUX_uxn_opcodes_h_l2925_c7_6f04_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_63e8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_6f04_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2924_c7_63e8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2924_c7_63e8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_63e8_cond;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_63e8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_63e8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_63e8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_63e8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_63e8_return_output := opc_result_MUX_uxn_opcodes_h_l2924_c7_63e8_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_c223_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_63e8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2923_c7_c223] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2923_c7_c223_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_c223_cond;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_c223_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_c223_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_c223_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_c223_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_c223_return_output := opc_result_MUX_uxn_opcodes_h_l2923_c7_c223_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_4384_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_c223_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2922_c7_4384] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2922_c7_4384_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_4384_cond;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_4384_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_4384_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_4384_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_4384_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_4384_return_output := opc_result_MUX_uxn_opcodes_h_l2922_c7_4384_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_0118_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_4384_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2921_c7_0118] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2921_c7_0118_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_0118_cond;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_0118_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_0118_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_0118_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_0118_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_0118_return_output := opc_result_MUX_uxn_opcodes_h_l2921_c7_0118_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_6ab5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_0118_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2920_c7_6ab5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2920_c7_6ab5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_6ab5_cond;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_6ab5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_6ab5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_6ab5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_6ab5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_6ab5_return_output := opc_result_MUX_uxn_opcodes_h_l2920_c7_6ab5_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_0988_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_6ab5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2919_c7_0988] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2919_c7_0988_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_0988_cond;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_0988_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_0988_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_0988_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_0988_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_0988_return_output := opc_result_MUX_uxn_opcodes_h_l2919_c7_0988_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_f6b7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_0988_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2918_c7_f6b7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2918_c7_f6b7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_f6b7_cond;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_f6b7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_f6b7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_f6b7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_f6b7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_f6b7_return_output := opc_result_MUX_uxn_opcodes_h_l2918_c7_f6b7_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_7424_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_f6b7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2917_c7_7424] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2917_c7_7424_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_7424_cond;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_7424_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_7424_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_7424_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_7424_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_7424_return_output := opc_result_MUX_uxn_opcodes_h_l2917_c7_7424_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_1b3d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_7424_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2916_c7_1b3d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2916_c7_1b3d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_1b3d_cond;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_1b3d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_1b3d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_1b3d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_1b3d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_1b3d_return_output := opc_result_MUX_uxn_opcodes_h_l2916_c7_1b3d_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_a2fc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_1b3d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2915_c7_a2fc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2915_c7_a2fc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_a2fc_cond;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_a2fc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_a2fc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_a2fc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_a2fc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_a2fc_return_output := opc_result_MUX_uxn_opcodes_h_l2915_c7_a2fc_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_6fd2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_a2fc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2914_c7_6fd2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2914_c7_6fd2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_6fd2_cond;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_6fd2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_6fd2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_6fd2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_6fd2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_6fd2_return_output := opc_result_MUX_uxn_opcodes_h_l2914_c7_6fd2_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_3bd2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_6fd2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2913_c7_3bd2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2913_c7_3bd2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_3bd2_cond;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_3bd2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_3bd2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_3bd2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_3bd2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_3bd2_return_output := opc_result_MUX_uxn_opcodes_h_l2913_c7_3bd2_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_99f2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_3bd2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2912_c7_99f2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2912_c7_99f2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_99f2_cond;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_99f2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_99f2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_99f2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_99f2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_99f2_return_output := opc_result_MUX_uxn_opcodes_h_l2912_c7_99f2_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_af8e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_99f2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2911_c7_af8e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2911_c7_af8e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_af8e_cond;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_af8e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_af8e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_af8e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_af8e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_af8e_return_output := opc_result_MUX_uxn_opcodes_h_l2911_c7_af8e_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_6feb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_af8e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2910_c7_6feb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2910_c7_6feb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_6feb_cond;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_6feb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_6feb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_6feb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_6feb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_6feb_return_output := opc_result_MUX_uxn_opcodes_h_l2910_c7_6feb_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_a9f7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_6feb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2909_c7_a9f7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2909_c7_a9f7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_a9f7_cond;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_a9f7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_a9f7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_a9f7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_a9f7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_a9f7_return_output := opc_result_MUX_uxn_opcodes_h_l2909_c7_a9f7_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_4b87_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_a9f7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2908_c7_4b87] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2908_c7_4b87_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_4b87_cond;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_4b87_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_4b87_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_4b87_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_4b87_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_4b87_return_output := opc_result_MUX_uxn_opcodes_h_l2908_c7_4b87_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_1c1b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_4b87_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2907_c7_1c1b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2907_c7_1c1b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_1c1b_cond;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_1c1b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_1c1b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_1c1b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_1c1b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_1c1b_return_output := opc_result_MUX_uxn_opcodes_h_l2907_c7_1c1b_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_f6b1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_1c1b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2906_c7_f6b1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2906_c7_f6b1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_f6b1_cond;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_f6b1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_f6b1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_f6b1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_f6b1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_f6b1_return_output := opc_result_MUX_uxn_opcodes_h_l2906_c7_f6b1_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0b6d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_f6b1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2905_c7_0b6d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2905_c7_0b6d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0b6d_cond;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_0b6d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0b6d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_0b6d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0b6d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0b6d_return_output := opc_result_MUX_uxn_opcodes_h_l2905_c7_0b6d_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_2da1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0b6d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2904_c7_2da1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2904_c7_2da1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_2da1_cond;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_2da1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_2da1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_2da1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_2da1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_2da1_return_output := opc_result_MUX_uxn_opcodes_h_l2904_c7_2da1_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_16fa_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_2da1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2903_c7_16fa] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2903_c7_16fa_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_16fa_cond;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_16fa_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_16fa_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_16fa_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_16fa_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_16fa_return_output := opc_result_MUX_uxn_opcodes_h_l2903_c7_16fa_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_5780_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_16fa_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2902_c7_5780] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2902_c7_5780_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_5780_cond;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_5780_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_5780_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_5780_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_5780_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_5780_return_output := opc_result_MUX_uxn_opcodes_h_l2902_c7_5780_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_0193_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_5780_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2901_c7_0193] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2901_c7_0193_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_0193_cond;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_0193_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_0193_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_0193_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_0193_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_0193_return_output := opc_result_MUX_uxn_opcodes_h_l2901_c7_0193_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_feb8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_0193_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2900_c7_feb8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2900_c7_feb8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_feb8_cond;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_feb8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_feb8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_feb8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_feb8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_feb8_return_output := opc_result_MUX_uxn_opcodes_h_l2900_c7_feb8_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_b48d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_feb8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2899_c7_b48d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2899_c7_b48d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_b48d_cond;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_b48d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_b48d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_b48d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_b48d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_b48d_return_output := opc_result_MUX_uxn_opcodes_h_l2899_c7_b48d_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_76d0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_b48d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2898_c7_76d0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2898_c7_76d0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_76d0_cond;
     opc_result_MUX_uxn_opcodes_h_l2898_c7_76d0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_76d0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2898_c7_76d0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_76d0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_76d0_return_output := opc_result_MUX_uxn_opcodes_h_l2898_c7_76d0_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_a94d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_76d0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2897_c7_a94d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2897_c7_a94d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_a94d_cond;
     opc_result_MUX_uxn_opcodes_h_l2897_c7_a94d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_a94d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2897_c7_a94d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_a94d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_a94d_return_output := opc_result_MUX_uxn_opcodes_h_l2897_c7_a94d_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_6423_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_a94d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2896_c7_6423] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2896_c7_6423_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_6423_cond;
     opc_result_MUX_uxn_opcodes_h_l2896_c7_6423_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_6423_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2896_c7_6423_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_6423_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_6423_return_output := opc_result_MUX_uxn_opcodes_h_l2896_c7_6423_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_ef19_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_6423_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2895_c7_ef19] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2895_c7_ef19_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_ef19_cond;
     opc_result_MUX_uxn_opcodes_h_l2895_c7_ef19_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_ef19_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2895_c7_ef19_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_ef19_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_ef19_return_output := opc_result_MUX_uxn_opcodes_h_l2895_c7_ef19_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_a0a5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_ef19_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2894_c7_a0a5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2894_c7_a0a5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_a0a5_cond;
     opc_result_MUX_uxn_opcodes_h_l2894_c7_a0a5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_a0a5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2894_c7_a0a5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_a0a5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_a0a5_return_output := opc_result_MUX_uxn_opcodes_h_l2894_c7_a0a5_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_03bc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_a0a5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2893_c7_03bc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2893_c7_03bc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_03bc_cond;
     opc_result_MUX_uxn_opcodes_h_l2893_c7_03bc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_03bc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2893_c7_03bc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_03bc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_03bc_return_output := opc_result_MUX_uxn_opcodes_h_l2893_c7_03bc_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_6aa8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_03bc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2892_c7_6aa8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2892_c7_6aa8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_6aa8_cond;
     opc_result_MUX_uxn_opcodes_h_l2892_c7_6aa8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_6aa8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2892_c7_6aa8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_6aa8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_6aa8_return_output := opc_result_MUX_uxn_opcodes_h_l2892_c7_6aa8_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_b3d1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_6aa8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2891_c7_b3d1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2891_c7_b3d1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_b3d1_cond;
     opc_result_MUX_uxn_opcodes_h_l2891_c7_b3d1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_b3d1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2891_c7_b3d1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_b3d1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_b3d1_return_output := opc_result_MUX_uxn_opcodes_h_l2891_c7_b3d1_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_fc47_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_b3d1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2890_c7_fc47] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2890_c7_fc47_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_fc47_cond;
     opc_result_MUX_uxn_opcodes_h_l2890_c7_fc47_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_fc47_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2890_c7_fc47_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_fc47_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_fc47_return_output := opc_result_MUX_uxn_opcodes_h_l2890_c7_fc47_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_7e08_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_fc47_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2889_c7_7e08] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2889_c7_7e08_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_7e08_cond;
     opc_result_MUX_uxn_opcodes_h_l2889_c7_7e08_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_7e08_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2889_c7_7e08_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_7e08_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_7e08_return_output := opc_result_MUX_uxn_opcodes_h_l2889_c7_7e08_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_123e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_7e08_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2888_c7_123e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2888_c7_123e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_123e_cond;
     opc_result_MUX_uxn_opcodes_h_l2888_c7_123e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_123e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2888_c7_123e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_123e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_123e_return_output := opc_result_MUX_uxn_opcodes_h_l2888_c7_123e_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_082a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_123e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2887_c7_082a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2887_c7_082a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_082a_cond;
     opc_result_MUX_uxn_opcodes_h_l2887_c7_082a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_082a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2887_c7_082a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_082a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_082a_return_output := opc_result_MUX_uxn_opcodes_h_l2887_c7_082a_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7519_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_082a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2886_c7_7519] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2886_c7_7519_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7519_cond;
     opc_result_MUX_uxn_opcodes_h_l2886_c7_7519_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7519_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2886_c7_7519_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7519_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7519_return_output := opc_result_MUX_uxn_opcodes_h_l2886_c7_7519_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_13e5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7519_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2885_c7_13e5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2885_c7_13e5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_13e5_cond;
     opc_result_MUX_uxn_opcodes_h_l2885_c7_13e5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_13e5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2885_c7_13e5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_13e5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_13e5_return_output := opc_result_MUX_uxn_opcodes_h_l2885_c7_13e5_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_b8f5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_13e5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2884_c7_b8f5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2884_c7_b8f5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_b8f5_cond;
     opc_result_MUX_uxn_opcodes_h_l2884_c7_b8f5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_b8f5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2884_c7_b8f5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_b8f5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_b8f5_return_output := opc_result_MUX_uxn_opcodes_h_l2884_c7_b8f5_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_a047_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_b8f5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2883_c7_a047] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2883_c7_a047_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_a047_cond;
     opc_result_MUX_uxn_opcodes_h_l2883_c7_a047_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_a047_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2883_c7_a047_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_a047_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_a047_return_output := opc_result_MUX_uxn_opcodes_h_l2883_c7_a047_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_7e38_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_a047_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2882_c7_7e38] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2882_c7_7e38_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_7e38_cond;
     opc_result_MUX_uxn_opcodes_h_l2882_c7_7e38_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_7e38_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2882_c7_7e38_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_7e38_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_7e38_return_output := opc_result_MUX_uxn_opcodes_h_l2882_c7_7e38_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_ff6f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_7e38_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2881_c7_ff6f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2881_c7_ff6f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_ff6f_cond;
     opc_result_MUX_uxn_opcodes_h_l2881_c7_ff6f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_ff6f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2881_c7_ff6f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_ff6f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_ff6f_return_output := opc_result_MUX_uxn_opcodes_h_l2881_c7_ff6f_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_fa28_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_ff6f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2880_c7_fa28] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2880_c7_fa28_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_fa28_cond;
     opc_result_MUX_uxn_opcodes_h_l2880_c7_fa28_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_fa28_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2880_c7_fa28_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_fa28_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_fa28_return_output := opc_result_MUX_uxn_opcodes_h_l2880_c7_fa28_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_c60f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_fa28_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2879_c7_c60f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2879_c7_c60f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_c60f_cond;
     opc_result_MUX_uxn_opcodes_h_l2879_c7_c60f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_c60f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2879_c7_c60f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_c60f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_c60f_return_output := opc_result_MUX_uxn_opcodes_h_l2879_c7_c60f_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_a75f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_c60f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2878_c7_a75f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2878_c7_a75f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_a75f_cond;
     opc_result_MUX_uxn_opcodes_h_l2878_c7_a75f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_a75f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2878_c7_a75f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_a75f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_a75f_return_output := opc_result_MUX_uxn_opcodes_h_l2878_c7_a75f_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_92ca_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_a75f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2877_c7_92ca] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2877_c7_92ca_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_92ca_cond;
     opc_result_MUX_uxn_opcodes_h_l2877_c7_92ca_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_92ca_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2877_c7_92ca_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_92ca_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_92ca_return_output := opc_result_MUX_uxn_opcodes_h_l2877_c7_92ca_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_15c6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_92ca_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2876_c7_15c6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2876_c7_15c6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_15c6_cond;
     opc_result_MUX_uxn_opcodes_h_l2876_c7_15c6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_15c6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2876_c7_15c6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_15c6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_15c6_return_output := opc_result_MUX_uxn_opcodes_h_l2876_c7_15c6_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_7c1f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_15c6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2875_c7_7c1f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2875_c7_7c1f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_7c1f_cond;
     opc_result_MUX_uxn_opcodes_h_l2875_c7_7c1f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_7c1f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2875_c7_7c1f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_7c1f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_7c1f_return_output := opc_result_MUX_uxn_opcodes_h_l2875_c7_7c1f_return_output;

     -- Submodule level 145
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_de8b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_7c1f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2874_c7_de8b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2874_c7_de8b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_de8b_cond;
     opc_result_MUX_uxn_opcodes_h_l2874_c7_de8b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_de8b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2874_c7_de8b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_de8b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_de8b_return_output := opc_result_MUX_uxn_opcodes_h_l2874_c7_de8b_return_output;

     -- Submodule level 146
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_4205_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_de8b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2873_c7_4205] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2873_c7_4205_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_4205_cond;
     opc_result_MUX_uxn_opcodes_h_l2873_c7_4205_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_4205_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2873_c7_4205_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_4205_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_4205_return_output := opc_result_MUX_uxn_opcodes_h_l2873_c7_4205_return_output;

     -- Submodule level 147
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_bbf6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_4205_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2872_c7_bbf6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2872_c7_bbf6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_bbf6_cond;
     opc_result_MUX_uxn_opcodes_h_l2872_c7_bbf6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_bbf6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2872_c7_bbf6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_bbf6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_bbf6_return_output := opc_result_MUX_uxn_opcodes_h_l2872_c7_bbf6_return_output;

     -- Submodule level 148
     VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_bbf6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2871_c2_ccbf] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_cond;
     opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_return_output := opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_return_output;

     -- Submodule level 149
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_return_output;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l2962_c40_17d8] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2962_c40_17d8_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l2964_c30_d865] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2964_c30_d865_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2966_c34_a635] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2966_c34_a635_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2968_l2956_DUPLICATE_3d78 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2968_l2956_DUPLICATE_3d78_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2943_c17_e3e6] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2943_c17_e3e6_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d[uxn_opcodes_h_l2961_c39_1c34] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2961_c39_1c34_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2963_c34_77a5] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2963_c34_77a5_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2965_c33_c4db] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2965_c33_c4db_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_return_output.is_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2948_l2946_DUPLICATE_5113 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2948_l2946_DUPLICATE_5113_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2951_c68_4c3c] LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2951_c68_4c3c_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l2969_c32_c14c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2969_c32_c14c_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_return_output.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d[uxn_opcodes_h_l2967_c37_6cd8] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2967_c37_6cd8_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2957_c3_f4b6] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2957_c3_f4b6_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_ccbf_return_output.is_stack_write;

     -- Submodule level 150
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_2a80_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2943_c17_e3e6_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_35a2_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2957_c3_f4b6_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_35a2_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2968_l2956_DUPLICATE_3d78_return_output;
     -- CAST_TO_uint9_t[uxn_opcodes_h_l2951_c58_8f83] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2951_c58_8f83_return_output := CAST_TO_uint9_t_uint4_t(
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2951_c68_4c3c_return_output);

     -- CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2946_l2948_DUPLICATE_ecd1 LATENCY=0
     VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2946_l2948_DUPLICATE_ecd1_return_output := CAST_TO_int8_t_int4_t(
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2948_l2946_DUPLICATE_5113_return_output);

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2848_l2971_DUPLICATE_9f23 LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2848_l2971_DUPLICATE_9f23_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0(
     VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_ccbf_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2961_c39_1c34_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2962_c40_17d8_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2963_c34_77a5_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2964_c30_d865_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2965_c33_c4db_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2966_c34_a635_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2967_c37_6cd8_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2968_l2956_DUPLICATE_3d78_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2969_c32_c14c_return_output);

     -- BIN_OP_XOR[uxn_opcodes_h_l2943_c2_2a80] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2943_c2_2a80_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_2a80_left;
     BIN_OP_XOR_uxn_opcodes_h_l2943_c2_2a80_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_2a80_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_2a80_return_output := BIN_OP_XOR_uxn_opcodes_h_l2943_c2_2a80_return_output;

     -- Submodule level 151
     VAR_MUX_uxn_opcodes_h_l2951_c29_c53a_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_2a80_return_output;
     VAR_MUX_uxn_opcodes_h_l2952_c20_7b4b_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_2a80_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_2619_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_2a80_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_2619_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_2a80_return_output;
     REG_VAR_stack_index := VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_2a80_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_3101_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2946_l2948_DUPLICATE_ecd1_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_956e_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2946_l2948_DUPLICATE_ecd1_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_1ae1_right := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2951_c58_8f83_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2848_l2971_DUPLICATE_9f23_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2848_l2971_DUPLICATE_9f23_return_output;
     -- MUX[uxn_opcodes_h_l2952_c20_7b4b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2952_c20_7b4b_cond <= VAR_MUX_uxn_opcodes_h_l2952_c20_7b4b_cond;
     MUX_uxn_opcodes_h_l2952_c20_7b4b_iftrue <= VAR_MUX_uxn_opcodes_h_l2952_c20_7b4b_iftrue;
     MUX_uxn_opcodes_h_l2952_c20_7b4b_iffalse <= VAR_MUX_uxn_opcodes_h_l2952_c20_7b4b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2952_c20_7b4b_return_output := MUX_uxn_opcodes_h_l2952_c20_7b4b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2946_c3_3101] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_3101_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_3101_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_3101_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_3101_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_3101_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_3101_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2948_c3_956e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_956e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_956e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_956e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_956e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_956e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_956e_return_output;

     -- Submodule level 152
     VAR_sp1_uxn_opcodes_h_l2946_c3_4206 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_3101_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l2948_c3_9271 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_956e_return_output)),8);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2952_c2_4e93_right := VAR_MUX_uxn_opcodes_h_l2952_c20_7b4b_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_2619_iffalse := VAR_sp0_uxn_opcodes_h_l2948_c3_9271;
     VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_2619_iftrue := VAR_sp1_uxn_opcodes_h_l2946_c3_4206;
     -- sp1_MUX[uxn_opcodes_h_l2945_c2_2619] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2945_c2_2619_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_2619_cond;
     sp1_MUX_uxn_opcodes_h_l2945_c2_2619_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_2619_iftrue;
     sp1_MUX_uxn_opcodes_h_l2945_c2_2619_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_2619_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_2619_return_output := sp1_MUX_uxn_opcodes_h_l2945_c2_2619_return_output;

     -- sp0_MUX[uxn_opcodes_h_l2945_c2_2619] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2945_c2_2619_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_2619_cond;
     sp0_MUX_uxn_opcodes_h_l2945_c2_2619_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_2619_iftrue;
     sp0_MUX_uxn_opcodes_h_l2945_c2_2619_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_2619_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_2619_return_output := sp0_MUX_uxn_opcodes_h_l2945_c2_2619_return_output;

     -- Submodule level 153
     VAR_MUX_uxn_opcodes_h_l2951_c29_c53a_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_2619_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_2619_return_output;
     VAR_MUX_uxn_opcodes_h_l2951_c29_c53a_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_2619_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_2619_return_output;
     -- MUX[uxn_opcodes_h_l2951_c29_c53a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2951_c29_c53a_cond <= VAR_MUX_uxn_opcodes_h_l2951_c29_c53a_cond;
     MUX_uxn_opcodes_h_l2951_c29_c53a_iftrue <= VAR_MUX_uxn_opcodes_h_l2951_c29_c53a_iftrue;
     MUX_uxn_opcodes_h_l2951_c29_c53a_iffalse <= VAR_MUX_uxn_opcodes_h_l2951_c29_c53a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2951_c29_c53a_return_output := MUX_uxn_opcodes_h_l2951_c29_c53a_return_output;

     -- Submodule level 154
     -- CAST_TO_uint9_t[uxn_opcodes_h_l2951_c19_76b4] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2951_c19_76b4_return_output := CAST_TO_uint9_t_uint8_t(
     VAR_MUX_uxn_opcodes_h_l2951_c29_c53a_return_output);

     -- Submodule level 155
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_1ae1_left := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2951_c19_76b4_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l2951_c19_1ae1] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_1ae1_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_1ae1_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_1ae1_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_1ae1_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_1ae1_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_1ae1_return_output;

     -- Submodule level 156
     VAR_BIN_OP_OR_uxn_opcodes_h_l2952_c2_4e93_left := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_1ae1_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2952_c2_4e93] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2952_c2_4e93_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2952_c2_4e93_left;
     BIN_OP_OR_uxn_opcodes_h_l2952_c2_4e93_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2952_c2_4e93_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2952_c2_4e93_return_output := BIN_OP_OR_uxn_opcodes_h_l2952_c2_4e93_return_output;

     -- Submodule level 157
     REG_VAR_stack_address := VAR_BIN_OP_OR_uxn_opcodes_h_l2952_c2_4e93_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_35a2_stack_address := VAR_BIN_OP_OR_uxn_opcodes_h_l2952_c2_4e93_return_output;
     -- stack_ram_update[uxn_opcodes_h_l2954_c24_35a2] LATENCY=0
     -- Clock enable
     stack_ram_update_uxn_opcodes_h_l2954_c24_35a2_CLOCK_ENABLE <= VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_35a2_CLOCK_ENABLE;
     -- Inputs
     stack_ram_update_uxn_opcodes_h_l2954_c24_35a2_stack_address <= VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_35a2_stack_address;
     stack_ram_update_uxn_opcodes_h_l2954_c24_35a2_value <= VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_35a2_value;
     stack_ram_update_uxn_opcodes_h_l2954_c24_35a2_write_enable <= VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_35a2_write_enable;
     -- Outputs
     VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_35a2_return_output := stack_ram_update_uxn_opcodes_h_l2954_c24_35a2_return_output;

     -- Submodule level 158
     REG_VAR_previous_stack_read := VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_35a2_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_sp0 <= REG_VAR_sp0;
REG_COMB_sp1 <= REG_VAR_sp1;
REG_COMB_ins_a_3f <= REG_VAR_ins_a_3f;
REG_COMB_opc <= REG_VAR_opc;
REG_COMB_stack_index <= REG_VAR_stack_index;
REG_COMB_is_wait <= REG_VAR_is_wait;
REG_COMB_is_imm <= REG_VAR_is_imm;
REG_COMB_stack_address <= REG_VAR_stack_address;
REG_COMB_previous_stack_read <= REG_VAR_previous_stack_read;
REG_COMB_opc_result <= REG_VAR_opc_result;
REG_COMB_opc_eval_result <= REG_VAR_opc_eval_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     sp0 <= REG_COMB_sp0;
     sp1 <= REG_COMB_sp1;
     ins_a_3f <= REG_COMB_ins_a_3f;
     opc <= REG_COMB_opc;
     stack_index <= REG_COMB_stack_index;
     is_wait <= REG_COMB_is_wait;
     is_imm <= REG_COMB_is_imm;
     stack_address <= REG_COMB_stack_address;
     previous_stack_read <= REG_COMB_previous_stack_read;
     opc_result <= REG_COMB_opc_result;
     opc_eval_result <= REG_COMB_opc_eval_result;
 end if;
 end if;
end process;

end arch;
