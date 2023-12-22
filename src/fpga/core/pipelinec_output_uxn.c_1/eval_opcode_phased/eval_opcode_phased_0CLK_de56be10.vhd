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
entity eval_opcode_phased_0CLK_de56be10 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out eval_opcode_result_t);
end eval_opcode_phased_0CLK_de56be10;
architecture arch of eval_opcode_phased_0CLK_de56be10 is
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
-- BIN_OP_AND[uxn_opcodes_h_l2881_c14_9fde]
signal BIN_OP_AND_uxn_opcodes_h_l2881_c14_9fde_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2881_c14_9fde_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2881_c14_9fde_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2882_c14_1402]
signal BIN_OP_XOR_uxn_opcodes_h_l2882_c14_1402_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2882_c14_1402_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2882_c14_1402_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2882_c14_00ea]
signal BIN_OP_OR_uxn_opcodes_h_l2882_c14_00ea_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2882_c14_00ea_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2882_c14_00ea_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l2882_c14_ca9d]
signal UNARY_OP_NOT_uxn_opcodes_h_l2882_c14_ca9d_expr : unsigned(7 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l2882_c14_ca9d_return_output : unsigned(7 downto 0);

-- BIN_OP_NEQ[uxn_opcodes_h_l2882_c14_eb9a]
signal BIN_OP_NEQ_uxn_opcodes_h_l2882_c14_eb9a_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2882_c14_eb9a_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2882_c14_eb9a_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2882_c14_c701]
signal MUX_uxn_opcodes_h_l2882_c14_c701_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2882_c14_c701_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2882_c14_c701_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2882_c14_c701_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2883_c8_0758]
signal MUX_uxn_opcodes_h_l2883_c8_0758_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2883_c8_0758_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2883_c8_0758_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2883_c8_0758_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2889_c6_90ad]
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c6_90ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c6_90ad_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c6_90ad_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c7_d402]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d402_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d402_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d402_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d402_return_output : unsigned(0 downto 0);

-- is_wait_MUX[uxn_opcodes_h_l2889_c2_ac95]
signal is_wait_MUX_uxn_opcodes_h_l2889_c2_ac95_cond : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2889_c2_ac95_iftrue : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2889_c2_ac95_iffalse : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2889_c2_ac95_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2889_c2_ac95]
signal opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_return_output : opcode_result_t;

-- brk[uxn_opcodes_h_l2889_c48_5e4f]
signal brk_uxn_opcodes_h_l2889_c48_5e4f_phase : unsigned(7 downto 0);
signal brk_uxn_opcodes_h_l2889_c48_5e4f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2890_c11_1f15]
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1f15_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1f15_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1f15_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c1_8c3f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_8c3f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_8c3f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_8c3f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_8c3f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c7_27a4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_27a4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_27a4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_27a4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_27a4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2890_c7_d402]
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_d402_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_d402_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_d402_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_d402_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l2890_c40_ebae]
signal jci_uxn_opcodes_h_l2890_c40_ebae_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l2890_c40_ebae_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2890_c40_ebae_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l2890_c40_ebae_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2890_c40_ebae_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2890_c40_ebae_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2891_c11_daa3]
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_daa3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_daa3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_daa3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c1_ad00]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ad00_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ad00_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ad00_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ad00_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c7_07db]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_07db_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_07db_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_07db_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_07db_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2891_c7_27a4]
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_27a4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_27a4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_27a4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_27a4_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l2891_c40_12f6]
signal jmi_uxn_opcodes_h_l2891_c40_12f6_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l2891_c40_12f6_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2891_c40_12f6_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l2891_c40_12f6_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2891_c40_12f6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_1305]
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_1305_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_1305_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_1305_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c1_46a9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_46a9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_46a9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_46a9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_46a9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c7_4a49]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_4a49_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_4a49_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_4a49_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_4a49_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2892_c7_07db]
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_07db_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_07db_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_07db_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_07db_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l2892_c40_7ef2]
signal jsi_uxn_opcodes_h_l2892_c40_7ef2_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l2892_c40_7ef2_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2892_c40_7ef2_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l2892_c40_7ef2_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2892_c40_7ef2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2893_c11_4677]
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4677_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4677_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4677_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c1_6ea9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_6ea9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_6ea9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_6ea9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_6ea9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c7_5457]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_5457_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_5457_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_5457_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_5457_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2893_c7_4a49]
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_4a49_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_4a49_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_4a49_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_4a49_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2893_c40_ecac]
signal lit_uxn_opcodes_h_l2893_c40_ecac_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2893_c40_ecac_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2893_c40_ecac_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2893_c40_ecac_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2893_c40_ecac_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_fc3b]
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_fc3b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_fc3b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_fc3b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c1_9afe]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_9afe_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_9afe_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_9afe_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_9afe_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c7_d0e8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_d0e8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_d0e8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_d0e8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_d0e8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2894_c7_5457]
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_5457_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_5457_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_5457_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_5457_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2894_c40_fc02]
signal lit2_uxn_opcodes_h_l2894_c40_fc02_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2894_c40_fc02_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2894_c40_fc02_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2894_c40_fc02_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2894_c40_fc02_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_3368]
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3368_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3368_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3368_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c1_3b1a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3b1a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3b1a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3b1a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3b1a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c7_c86f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_c86f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_c86f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_c86f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_c86f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2895_c7_d0e8]
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_d0e8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_d0e8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_d0e8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_d0e8_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2895_c40_9062]
signal lit_uxn_opcodes_h_l2895_c40_9062_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2895_c40_9062_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2895_c40_9062_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2895_c40_9062_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2895_c40_9062_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_b543]
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_b543_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_b543_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_b543_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c1_31b5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31b5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31b5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31b5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31b5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c7_6fee]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fee_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fee_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fee_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fee_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2896_c7_c86f]
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_c86f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_c86f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_c86f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_c86f_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2896_c40_3ad0]
signal lit2_uxn_opcodes_h_l2896_c40_3ad0_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2896_c40_3ad0_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2896_c40_3ad0_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2896_c40_3ad0_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2896_c40_3ad0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_2162]
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_2162_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_2162_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_2162_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c1_bf9d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_bf9d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_bf9d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_bf9d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_bf9d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c7_f54c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f54c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f54c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f54c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f54c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2897_c7_6fee]
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_6fee_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_6fee_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_6fee_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_6fee_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l2897_c40_3f15]
signal inc_uxn_opcodes_h_l2897_c40_3f15_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l2897_c40_3f15_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2897_c40_3f15_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2897_c40_3f15_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2897_c40_3f15_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2898_c11_5698]
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_5698_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_5698_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_5698_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_30da]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_30da_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_30da_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_30da_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_30da_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_2b32]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2b32_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2b32_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2b32_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2b32_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2898_c7_f54c]
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_f54c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_f54c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_f54c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_f54c_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l2898_c40_e3a1]
signal inc2_uxn_opcodes_h_l2898_c40_e3a1_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l2898_c40_e3a1_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2898_c40_e3a1_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2898_c40_e3a1_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2898_c40_e3a1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_8062]
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_8062_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_8062_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_8062_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_7a01]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7a01_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7a01_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7a01_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7a01_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_89d5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_89d5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_89d5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_89d5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_89d5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2899_c7_2b32]
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_2b32_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_2b32_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_2b32_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_2b32_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l2899_c40_ce4a]
signal pop_uxn_opcodes_h_l2899_c40_ce4a_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l2899_c40_ce4a_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2899_c40_ce4a_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2899_c40_ce4a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_55f1]
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_55f1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_55f1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_55f1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_455f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_455f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_455f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_455f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_455f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_4b8a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4b8a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4b8a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4b8a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4b8a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2900_c7_89d5]
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_89d5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_89d5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_89d5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_89d5_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l2900_c40_61c0]
signal pop2_uxn_opcodes_h_l2900_c40_61c0_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l2900_c40_61c0_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2900_c40_61c0_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2900_c40_61c0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_12b0]
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_12b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_12b0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_12b0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_5a28]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_5a28_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_5a28_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_5a28_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_5a28_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_5ca8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5ca8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5ca8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5ca8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5ca8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2901_c7_4b8a]
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_4b8a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_4b8a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_4b8a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_4b8a_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l2901_c40_c96b]
signal nip_uxn_opcodes_h_l2901_c40_c96b_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l2901_c40_c96b_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2901_c40_c96b_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2901_c40_c96b_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2901_c40_c96b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_8b2b]
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8b2b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8b2b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8b2b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_0900]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_0900_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_0900_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_0900_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_0900_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_24d6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_24d6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_24d6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_24d6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_24d6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2902_c7_5ca8]
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_5ca8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_5ca8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_5ca8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_5ca8_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l2902_c40_7979]
signal nip2_uxn_opcodes_h_l2902_c40_7979_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l2902_c40_7979_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2902_c40_7979_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2902_c40_7979_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2902_c40_7979_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_2c9a]
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2c9a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2c9a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2c9a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_aac9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_aac9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_aac9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_aac9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_aac9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_1bfc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1bfc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1bfc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1bfc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1bfc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2903_c7_24d6]
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_24d6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_24d6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_24d6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_24d6_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l2903_c40_183e]
signal swp_uxn_opcodes_h_l2903_c40_183e_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l2903_c40_183e_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2903_c40_183e_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2903_c40_183e_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2903_c40_183e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_4448]
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4448_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4448_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4448_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_83cd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_83cd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_83cd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_83cd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_83cd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_fdd3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fdd3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fdd3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fdd3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fdd3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2904_c7_1bfc]
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_1bfc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_1bfc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_1bfc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_1bfc_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l2904_c40_4776]
signal swp2_uxn_opcodes_h_l2904_c40_4776_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l2904_c40_4776_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2904_c40_4776_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2904_c40_4776_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2904_c40_4776_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_eb86]
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_eb86_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_eb86_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_eb86_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_431a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_431a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_431a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_431a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_431a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_30fd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_30fd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_30fd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_30fd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_30fd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2905_c7_fdd3]
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_fdd3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_fdd3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_fdd3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_fdd3_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l2905_c40_5d08]
signal rot_uxn_opcodes_h_l2905_c40_5d08_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l2905_c40_5d08_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2905_c40_5d08_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2905_c40_5d08_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2905_c40_5d08_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_c483]
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_c483_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_c483_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_c483_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_4ecb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_4ecb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_4ecb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_4ecb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_4ecb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_d53c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d53c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d53c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d53c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d53c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2906_c7_30fd]
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_30fd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_30fd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_30fd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_30fd_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l2906_c40_1572]
signal rot2_uxn_opcodes_h_l2906_c40_1572_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l2906_c40_1572_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2906_c40_1572_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2906_c40_1572_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2906_c40_1572_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_c602]
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c602_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c602_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c602_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_cf71]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cf71_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cf71_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cf71_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cf71_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_cd44]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_cd44_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_cd44_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_cd44_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_cd44_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2907_c7_d53c]
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_d53c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_d53c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_d53c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_d53c_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l2907_c40_ffc6]
signal dup_uxn_opcodes_h_l2907_c40_ffc6_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l2907_c40_ffc6_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2907_c40_ffc6_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2907_c40_ffc6_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2907_c40_ffc6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_55ee]
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_55ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_55ee_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_55ee_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_ca3e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ca3e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ca3e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ca3e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ca3e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_e639]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e639_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e639_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e639_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e639_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2908_c7_cd44]
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_cd44_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_cd44_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_cd44_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_cd44_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l2908_c40_c8fc]
signal dup2_uxn_opcodes_h_l2908_c40_c8fc_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l2908_c40_c8fc_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2908_c40_c8fc_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2908_c40_c8fc_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2908_c40_c8fc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_7b58]
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7b58_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7b58_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7b58_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_0d5a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0d5a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0d5a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0d5a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0d5a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_94ca]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_94ca_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_94ca_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_94ca_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_94ca_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2909_c7_e639]
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_e639_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_e639_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_e639_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_e639_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l2909_c40_28a1]
signal ovr_uxn_opcodes_h_l2909_c40_28a1_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l2909_c40_28a1_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2909_c40_28a1_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2909_c40_28a1_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2909_c40_28a1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_89cd]
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_89cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_89cd_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_89cd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_895b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_895b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_895b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_895b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_895b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_cacc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_cacc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_cacc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_cacc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_cacc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2910_c7_94ca]
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_94ca_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_94ca_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_94ca_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_94ca_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l2910_c40_dde0]
signal ovr2_uxn_opcodes_h_l2910_c40_dde0_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l2910_c40_dde0_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2910_c40_dde0_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2910_c40_dde0_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2910_c40_dde0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_f85c]
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_f85c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_f85c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_f85c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_1ce9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1ce9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1ce9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1ce9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1ce9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_8f7e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_8f7e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_8f7e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_8f7e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_8f7e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2911_c7_cacc]
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_cacc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_cacc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_cacc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_cacc_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l2911_c40_edb9]
signal equ_uxn_opcodes_h_l2911_c40_edb9_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l2911_c40_edb9_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2911_c40_edb9_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2911_c40_edb9_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2911_c40_edb9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_52a6]
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_52a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_52a6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_52a6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_bdb8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_bdb8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_bdb8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_bdb8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_bdb8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_0f12]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0f12_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0f12_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0f12_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0f12_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2912_c7_8f7e]
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_8f7e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_8f7e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_8f7e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_8f7e_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l2912_c40_6614]
signal equ2_uxn_opcodes_h_l2912_c40_6614_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l2912_c40_6614_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2912_c40_6614_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2912_c40_6614_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2912_c40_6614_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_8326]
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8326_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8326_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8326_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_fea9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_fea9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_fea9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_fea9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_fea9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_8458]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8458_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8458_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8458_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8458_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2913_c7_0f12]
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_0f12_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_0f12_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_0f12_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_0f12_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l2913_c40_7553]
signal neq_uxn_opcodes_h_l2913_c40_7553_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l2913_c40_7553_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2913_c40_7553_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2913_c40_7553_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2913_c40_7553_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_d754]
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d754_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d754_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d754_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_2121]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_2121_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_2121_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_2121_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_2121_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_60a2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_60a2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_60a2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_60a2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_60a2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2914_c7_8458]
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_8458_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_8458_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_8458_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_8458_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l2914_c40_aef0]
signal neq2_uxn_opcodes_h_l2914_c40_aef0_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l2914_c40_aef0_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2914_c40_aef0_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2914_c40_aef0_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2914_c40_aef0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_b457]
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b457_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b457_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b457_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_2748]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_2748_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_2748_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_2748_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_2748_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_ec5e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ec5e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ec5e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ec5e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ec5e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2915_c7_60a2]
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_60a2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_60a2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_60a2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_60a2_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l2915_c40_7d0a]
signal gth_uxn_opcodes_h_l2915_c40_7d0a_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l2915_c40_7d0a_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2915_c40_7d0a_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2915_c40_7d0a_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2915_c40_7d0a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_68ad]
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_68ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_68ad_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_68ad_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_0df6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0df6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0df6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0df6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0df6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_8d46]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8d46_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8d46_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8d46_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8d46_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2916_c7_ec5e]
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_ec5e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_ec5e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_ec5e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_ec5e_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l2916_c40_6fd0]
signal gth2_uxn_opcodes_h_l2916_c40_6fd0_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l2916_c40_6fd0_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2916_c40_6fd0_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2916_c40_6fd0_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2916_c40_6fd0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_3b17]
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3b17_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3b17_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3b17_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_fa16]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fa16_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fa16_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fa16_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fa16_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_8f8d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8f8d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8f8d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8f8d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8f8d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2917_c7_8d46]
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_8d46_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_8d46_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_8d46_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_8d46_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l2917_c40_4a65]
signal lth_uxn_opcodes_h_l2917_c40_4a65_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l2917_c40_4a65_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2917_c40_4a65_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2917_c40_4a65_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2917_c40_4a65_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_3a36]
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_3a36_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_3a36_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_3a36_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_c6bf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_c6bf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_c6bf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_c6bf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_c6bf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_4bcd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4bcd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4bcd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4bcd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4bcd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2918_c7_8f8d]
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_8f8d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_8f8d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_8f8d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_8f8d_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l2918_c40_7c6d]
signal lth2_uxn_opcodes_h_l2918_c40_7c6d_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l2918_c40_7c6d_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2918_c40_7c6d_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2918_c40_7c6d_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2918_c40_7c6d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_f9ef]
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f9ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f9ef_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f9ef_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_4ee5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4ee5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4ee5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4ee5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4ee5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_b546]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_b546_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_b546_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_b546_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_b546_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2919_c7_4bcd]
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_4bcd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_4bcd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_4bcd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_4bcd_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l2919_c40_7a28]
signal jmp_uxn_opcodes_h_l2919_c40_7a28_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l2919_c40_7a28_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2919_c40_7a28_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2919_c40_7a28_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l2919_c40_7a28_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2919_c40_7a28_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_64a3]
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_64a3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_64a3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_64a3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_d66d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d66d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d66d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d66d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d66d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_b35c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_b35c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_b35c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_b35c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_b35c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2920_c7_b546]
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_b546_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_b546_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_b546_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_b546_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l2920_c40_b488]
signal jmp2_uxn_opcodes_h_l2920_c40_b488_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l2920_c40_b488_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2920_c40_b488_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2920_c40_b488_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2920_c40_b488_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_63a2]
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_63a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_63a2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_63a2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_ac21]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_ac21_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_ac21_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_ac21_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_ac21_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_0723]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0723_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0723_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0723_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0723_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2921_c7_b35c]
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_b35c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_b35c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_b35c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_b35c_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l2921_c40_37fc]
signal jcn_uxn_opcodes_h_l2921_c40_37fc_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l2921_c40_37fc_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2921_c40_37fc_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2921_c40_37fc_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l2921_c40_37fc_previous_stack_read : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2921_c40_37fc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_db69]
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_db69_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_db69_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_db69_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_fd5c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_fd5c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_fd5c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_fd5c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_fd5c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_f85d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f85d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f85d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f85d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f85d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2922_c7_0723]
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_0723_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_0723_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_0723_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_0723_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l2922_c40_a994]
signal jcn2_uxn_opcodes_h_l2922_c40_a994_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l2922_c40_a994_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2922_c40_a994_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2922_c40_a994_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2922_c40_a994_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_7fe2]
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7fe2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7fe2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7fe2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_8ce0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_8ce0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_8ce0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_8ce0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_8ce0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_c25a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_c25a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_c25a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_c25a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_c25a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2923_c7_f85d]
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_f85d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_f85d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_f85d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_f85d_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l2923_c40_514c]
signal jsr_uxn_opcodes_h_l2923_c40_514c_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l2923_c40_514c_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2923_c40_514c_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2923_c40_514c_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l2923_c40_514c_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2923_c40_514c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_bcf8]
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_bcf8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_bcf8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_bcf8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_1d99]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_1d99_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_1d99_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_1d99_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_1d99_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_5cec]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5cec_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5cec_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5cec_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5cec_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2924_c7_c25a]
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_c25a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_c25a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_c25a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_c25a_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l2924_c40_9b2a]
signal jsr2_uxn_opcodes_h_l2924_c40_9b2a_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l2924_c40_9b2a_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2924_c40_9b2a_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2924_c40_9b2a_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l2924_c40_9b2a_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2924_c40_9b2a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_5c03]
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_5c03_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_5c03_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_5c03_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_bd5d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bd5d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bd5d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bd5d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bd5d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_e7bf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e7bf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e7bf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e7bf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e7bf_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2925_c7_5cec]
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_5cec_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_5cec_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_5cec_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_5cec_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l2925_c40_d655]
signal sth_uxn_opcodes_h_l2925_c40_d655_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l2925_c40_d655_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2925_c40_d655_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2925_c40_d655_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2925_c40_d655_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_becd]
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_becd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_becd_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_becd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_68d3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_68d3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_68d3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_68d3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_68d3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_3c0d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3c0d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3c0d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3c0d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3c0d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2926_c7_e7bf]
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_e7bf_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_e7bf_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_e7bf_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_e7bf_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l2926_c40_b6c9]
signal sth2_uxn_opcodes_h_l2926_c40_b6c9_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l2926_c40_b6c9_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2926_c40_b6c9_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2926_c40_b6c9_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2926_c40_b6c9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_d52f]
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_d52f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_d52f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_d52f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_00b3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_00b3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_00b3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_00b3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_00b3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_71d1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_71d1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_71d1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_71d1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_71d1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2927_c7_3c0d]
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_3c0d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_3c0d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_3c0d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_3c0d_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l2927_c40_77b4]
signal ldz_uxn_opcodes_h_l2927_c40_77b4_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l2927_c40_77b4_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2927_c40_77b4_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2927_c40_77b4_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2927_c40_77b4_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2927_c40_77b4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_e69a]
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e69a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e69a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e69a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_1556]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1556_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1556_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1556_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1556_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_60b1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_60b1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_60b1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_60b1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_60b1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2928_c7_71d1]
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_71d1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_71d1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_71d1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_71d1_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l2928_c40_fbce]
signal ldz2_uxn_opcodes_h_l2928_c40_fbce_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l2928_c40_fbce_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2928_c40_fbce_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2928_c40_fbce_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2928_c40_fbce_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2928_c40_fbce_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_61e2]
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_4489]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4489_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4489_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4489_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4489_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_b88d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b88d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b88d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b88d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b88d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2929_c7_60b1]
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_60b1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_60b1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_60b1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_60b1_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l2929_c40_a37c]
signal stz_uxn_opcodes_h_l2929_c40_a37c_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l2929_c40_a37c_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2929_c40_a37c_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2929_c40_a37c_previous_stack_read : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2929_c40_a37c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_de9c]
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_de9c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_de9c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_de9c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_428f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_428f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_428f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_428f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_428f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_729b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_729b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_729b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_729b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_729b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2930_c7_b88d]
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_b88d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_b88d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_b88d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_b88d_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l2930_c40_2f77]
signal stz2_uxn_opcodes_h_l2930_c40_2f77_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l2930_c40_2f77_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2930_c40_2f77_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2930_c40_2f77_previous_stack_read : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2930_c40_2f77_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_ca75]
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_ca75_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_ca75_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_ca75_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_0e50]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_0e50_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_0e50_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_0e50_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_0e50_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_307d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_307d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_307d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_307d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_307d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2931_c7_729b]
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_729b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_729b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_729b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_729b_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l2931_c40_c27d]
signal ldr_uxn_opcodes_h_l2931_c40_c27d_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l2931_c40_c27d_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2931_c40_c27d_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2931_c40_c27d_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l2931_c40_c27d_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2931_c40_c27d_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2931_c40_c27d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_3006]
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3006_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3006_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3006_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_6c24]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_6c24_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_6c24_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_6c24_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_6c24_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_0745]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_0745_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_0745_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_0745_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_0745_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2932_c7_307d]
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_307d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_307d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_307d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_307d_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l2932_c40_8e0e]
signal ldr2_uxn_opcodes_h_l2932_c40_8e0e_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l2932_c40_8e0e_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2932_c40_8e0e_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2932_c40_8e0e_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l2932_c40_8e0e_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2932_c40_8e0e_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2932_c40_8e0e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_7980]
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_7980_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_7980_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_7980_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_eabd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_eabd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_eabd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_eabd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_eabd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_0585]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_0585_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_0585_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_0585_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_0585_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2933_c7_0745]
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_0745_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_0745_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_0745_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_0745_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l2933_c40_ac2f]
signal str1_uxn_opcodes_h_l2933_c40_ac2f_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l2933_c40_ac2f_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2933_c40_ac2f_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2933_c40_ac2f_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l2933_c40_ac2f_previous_stack_read : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2933_c40_ac2f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_c3b4]
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c3b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c3b4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c3b4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_04d4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_04d4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_04d4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_04d4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_04d4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_8064]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8064_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8064_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8064_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8064_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2934_c7_0585]
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_0585_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_0585_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_0585_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_0585_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l2934_c40_521d]
signal str2_uxn_opcodes_h_l2934_c40_521d_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l2934_c40_521d_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2934_c40_521d_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2934_c40_521d_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l2934_c40_521d_previous_stack_read : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2934_c40_521d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_651b]
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_651b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_651b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_651b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_3c43]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3c43_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3c43_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3c43_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3c43_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_0b25]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0b25_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0b25_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0b25_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0b25_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2935_c7_8064]
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_8064_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_8064_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_8064_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_8064_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l2935_c40_b1b2]
signal lda_uxn_opcodes_h_l2935_c40_b1b2_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l2935_c40_b1b2_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2935_c40_b1b2_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2935_c40_b1b2_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2935_c40_b1b2_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2935_c40_b1b2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_445d]
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_445d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_445d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_445d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_f81c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_f81c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_f81c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_f81c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_f81c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_3786]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3786_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3786_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3786_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3786_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2936_c7_0b25]
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_0b25_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_0b25_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_0b25_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_0b25_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l2936_c40_3a81]
signal lda2_uxn_opcodes_h_l2936_c40_3a81_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l2936_c40_3a81_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2936_c40_3a81_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2936_c40_3a81_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2936_c40_3a81_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2936_c40_3a81_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_d7a2]
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_d7a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_d7a2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_d7a2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_ab1c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_ab1c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_ab1c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_ab1c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_ab1c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_4cb0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4cb0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4cb0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4cb0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4cb0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2937_c7_3786]
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_3786_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_3786_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_3786_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_3786_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l2937_c40_e0fa]
signal sta_uxn_opcodes_h_l2937_c40_e0fa_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l2937_c40_e0fa_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2937_c40_e0fa_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2937_c40_e0fa_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2937_c40_e0fa_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_7f56]
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7f56_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7f56_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7f56_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_82f2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_82f2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_82f2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_82f2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_82f2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_4841]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4841_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4841_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4841_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4841_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2938_c7_4cb0]
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_4cb0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_4cb0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_4cb0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_4cb0_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l2938_c40_7ae4]
signal sta2_uxn_opcodes_h_l2938_c40_7ae4_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l2938_c40_7ae4_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2938_c40_7ae4_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2938_c40_7ae4_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2938_c40_7ae4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_3a3a]
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3a3a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3a3a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3a3a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_2a1d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2a1d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2a1d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2a1d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2a1d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_7c8b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_7c8b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_7c8b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_7c8b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_7c8b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2939_c7_4841]
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_4841_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_4841_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_4841_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_4841_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l2939_c40_610a]
signal dei_uxn_opcodes_h_l2939_c40_610a_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l2939_c40_610a_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2939_c40_610a_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2939_c40_610a_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2939_c40_610a_previous_device_ram_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2939_c40_610a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_9834]
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_9834_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_9834_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_9834_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_5e1b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_5e1b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_5e1b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_5e1b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_5e1b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c7_636d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_636d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_636d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_636d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_636d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2940_c7_7c8b]
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_7c8b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_7c8b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_7c8b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_7c8b_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l2940_c40_47ff]
signal dei2_uxn_opcodes_h_l2940_c40_47ff_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l2940_c40_47ff_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2940_c40_47ff_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2940_c40_47ff_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2940_c40_47ff_previous_device_ram_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2940_c40_47ff_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2941_c11_68c3]
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_68c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_68c3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_68c3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c1_518d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_518d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_518d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_518d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_518d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2942_c7_4f24]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4f24_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4f24_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4f24_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4f24_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2941_c7_636d]
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_636d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_636d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_636d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_636d_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l2941_c40_40b4]
signal deo_uxn_opcodes_h_l2941_c40_40b4_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l2941_c40_40b4_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2941_c40_40b4_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2941_c40_40b4_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2941_c40_40b4_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2941_c40_40b4_previous_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2941_c40_40b4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2942_c11_1ed2]
signal BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1ed2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1ed2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1ed2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2942_c1_8823]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_8823_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_8823_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_8823_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_8823_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2943_c7_10e6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_10e6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_10e6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_10e6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_10e6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2942_c7_4f24]
signal opc_result_MUX_uxn_opcodes_h_l2942_c7_4f24_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2942_c7_4f24_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2942_c7_4f24_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2942_c7_4f24_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l2942_c40_b92c]
signal deo2_uxn_opcodes_h_l2942_c40_b92c_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l2942_c40_b92c_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2942_c40_b92c_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2942_c40_b92c_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2942_c40_b92c_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2942_c40_b92c_previous_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2942_c40_b92c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2943_c11_2357]
signal BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2357_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2357_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2357_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2943_c1_98d5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_98d5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_98d5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_98d5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_98d5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2944_c7_9702]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_9702_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_9702_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_9702_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_9702_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2943_c7_10e6]
signal opc_result_MUX_uxn_opcodes_h_l2943_c7_10e6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2943_c7_10e6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2943_c7_10e6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2943_c7_10e6_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l2943_c40_f784]
signal add_uxn_opcodes_h_l2943_c40_f784_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l2943_c40_f784_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2943_c40_f784_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2943_c40_f784_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2943_c40_f784_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2944_c11_149b]
signal BIN_OP_EQ_uxn_opcodes_h_l2944_c11_149b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2944_c11_149b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2944_c11_149b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2944_c1_6b48]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_6b48_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_6b48_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_6b48_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_6b48_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2945_c7_875e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_875e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_875e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_875e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_875e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2944_c7_9702]
signal opc_result_MUX_uxn_opcodes_h_l2944_c7_9702_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2944_c7_9702_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2944_c7_9702_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2944_c7_9702_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l2944_c40_01ed]
signal add2_uxn_opcodes_h_l2944_c40_01ed_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l2944_c40_01ed_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2944_c40_01ed_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2944_c40_01ed_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2944_c40_01ed_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2945_c11_14bf]
signal BIN_OP_EQ_uxn_opcodes_h_l2945_c11_14bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2945_c11_14bf_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2945_c11_14bf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2945_c1_2ac1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_2ac1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_2ac1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_2ac1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_2ac1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2946_c7_7106]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_7106_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_7106_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_7106_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_7106_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2945_c7_875e]
signal opc_result_MUX_uxn_opcodes_h_l2945_c7_875e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2945_c7_875e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2945_c7_875e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2945_c7_875e_return_output : opcode_result_t;

-- sub[uxn_opcodes_h_l2945_c40_26e9]
signal sub_uxn_opcodes_h_l2945_c40_26e9_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub_uxn_opcodes_h_l2945_c40_26e9_phase : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2945_c40_26e9_ins : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2945_c40_26e9_previous_stack_read : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2945_c40_26e9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2946_c11_3f68]
signal BIN_OP_EQ_uxn_opcodes_h_l2946_c11_3f68_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2946_c11_3f68_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2946_c11_3f68_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2946_c1_e34d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_e34d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_e34d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_e34d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_e34d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2947_c7_8f5d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_8f5d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_8f5d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_8f5d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_8f5d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2946_c7_7106]
signal opc_result_MUX_uxn_opcodes_h_l2946_c7_7106_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2946_c7_7106_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2946_c7_7106_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2946_c7_7106_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l2946_c40_0ad8]
signal sub2_uxn_opcodes_h_l2946_c40_0ad8_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l2946_c40_0ad8_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2946_c40_0ad8_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2946_c40_0ad8_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2946_c40_0ad8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2947_c11_6672]
signal BIN_OP_EQ_uxn_opcodes_h_l2947_c11_6672_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2947_c11_6672_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2947_c11_6672_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2947_c1_9eee]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_9eee_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_9eee_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_9eee_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_9eee_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2948_c7_e52a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_e52a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_e52a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_e52a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_e52a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2947_c7_8f5d]
signal opc_result_MUX_uxn_opcodes_h_l2947_c7_8f5d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2947_c7_8f5d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2947_c7_8f5d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2947_c7_8f5d_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l2947_c40_459f]
signal mul_uxn_opcodes_h_l2947_c40_459f_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l2947_c40_459f_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2947_c40_459f_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2947_c40_459f_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2947_c40_459f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2948_c11_f3db]
signal BIN_OP_EQ_uxn_opcodes_h_l2948_c11_f3db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2948_c11_f3db_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2948_c11_f3db_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2948_c1_cbbb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_cbbb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_cbbb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_cbbb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_cbbb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2949_c7_1fe8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_1fe8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_1fe8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_1fe8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_1fe8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2948_c7_e52a]
signal opc_result_MUX_uxn_opcodes_h_l2948_c7_e52a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2948_c7_e52a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2948_c7_e52a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2948_c7_e52a_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l2948_c40_7792]
signal mul2_uxn_opcodes_h_l2948_c40_7792_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l2948_c40_7792_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2948_c40_7792_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2948_c40_7792_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2948_c40_7792_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2949_c11_ca08]
signal BIN_OP_EQ_uxn_opcodes_h_l2949_c11_ca08_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2949_c11_ca08_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2949_c11_ca08_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2949_c1_2b07]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2b07_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2b07_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2b07_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2b07_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2950_c7_dd18]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_dd18_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_dd18_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_dd18_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_dd18_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2949_c7_1fe8]
signal opc_result_MUX_uxn_opcodes_h_l2949_c7_1fe8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2949_c7_1fe8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2949_c7_1fe8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2949_c7_1fe8_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l2949_c40_6d2e]
signal div_uxn_opcodes_h_l2949_c40_6d2e_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l2949_c40_6d2e_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2949_c40_6d2e_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2949_c40_6d2e_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2949_c40_6d2e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2950_c11_4ad2]
signal BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4ad2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4ad2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4ad2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2950_c1_5f61]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_5f61_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_5f61_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_5f61_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_5f61_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2951_c7_56b7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_56b7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_56b7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_56b7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_56b7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2950_c7_dd18]
signal opc_result_MUX_uxn_opcodes_h_l2950_c7_dd18_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2950_c7_dd18_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2950_c7_dd18_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2950_c7_dd18_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l2950_c40_e5d7]
signal div2_uxn_opcodes_h_l2950_c40_e5d7_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l2950_c40_e5d7_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2950_c40_e5d7_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2950_c40_e5d7_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2950_c40_e5d7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2951_c11_a168]
signal BIN_OP_EQ_uxn_opcodes_h_l2951_c11_a168_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2951_c11_a168_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2951_c11_a168_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2951_c1_acd2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_acd2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_acd2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_acd2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_acd2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2952_c7_946b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_946b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_946b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_946b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_946b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2951_c7_56b7]
signal opc_result_MUX_uxn_opcodes_h_l2951_c7_56b7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2951_c7_56b7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2951_c7_56b7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2951_c7_56b7_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l2951_c40_0680]
signal and_uxn_opcodes_h_l2951_c40_0680_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l2951_c40_0680_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2951_c40_0680_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2951_c40_0680_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2951_c40_0680_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2952_c11_e60b]
signal BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e60b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e60b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e60b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2952_c1_a391]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_a391_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_a391_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_a391_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_a391_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2953_c7_04ec]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_04ec_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_04ec_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_04ec_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_04ec_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2952_c7_946b]
signal opc_result_MUX_uxn_opcodes_h_l2952_c7_946b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2952_c7_946b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2952_c7_946b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2952_c7_946b_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l2952_c40_9546]
signal and2_uxn_opcodes_h_l2952_c40_9546_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l2952_c40_9546_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2952_c40_9546_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2952_c40_9546_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2952_c40_9546_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2953_c11_6499]
signal BIN_OP_EQ_uxn_opcodes_h_l2953_c11_6499_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2953_c11_6499_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2953_c11_6499_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2953_c1_7ec8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_7ec8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_7ec8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_7ec8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_7ec8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2954_c7_8594]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_8594_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_8594_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_8594_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_8594_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2953_c7_04ec]
signal opc_result_MUX_uxn_opcodes_h_l2953_c7_04ec_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2953_c7_04ec_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2953_c7_04ec_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2953_c7_04ec_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l2953_c40_d394]
signal ora_uxn_opcodes_h_l2953_c40_d394_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l2953_c40_d394_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2953_c40_d394_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2953_c40_d394_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2953_c40_d394_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2954_c11_9e75]
signal BIN_OP_EQ_uxn_opcodes_h_l2954_c11_9e75_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2954_c11_9e75_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2954_c11_9e75_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2954_c1_95b1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_95b1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_95b1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_95b1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_95b1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2955_c7_ab66]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ab66_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ab66_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ab66_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ab66_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2954_c7_8594]
signal opc_result_MUX_uxn_opcodes_h_l2954_c7_8594_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2954_c7_8594_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2954_c7_8594_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2954_c7_8594_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l2954_c40_3c0e]
signal ora2_uxn_opcodes_h_l2954_c40_3c0e_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l2954_c40_3c0e_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2954_c40_3c0e_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2954_c40_3c0e_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2954_c40_3c0e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2955_c11_e2e9]
signal BIN_OP_EQ_uxn_opcodes_h_l2955_c11_e2e9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2955_c11_e2e9_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2955_c11_e2e9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2955_c1_14ae]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_14ae_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_14ae_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_14ae_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_14ae_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2956_c7_904a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_904a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_904a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_904a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_904a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2955_c7_ab66]
signal opc_result_MUX_uxn_opcodes_h_l2955_c7_ab66_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2955_c7_ab66_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2955_c7_ab66_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2955_c7_ab66_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l2955_c40_8300]
signal eor_uxn_opcodes_h_l2955_c40_8300_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l2955_c40_8300_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2955_c40_8300_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2955_c40_8300_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2955_c40_8300_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2956_c11_fb6d]
signal BIN_OP_EQ_uxn_opcodes_h_l2956_c11_fb6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2956_c11_fb6d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2956_c11_fb6d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2956_c1_faad]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_faad_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_faad_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_faad_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_faad_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2957_c7_386e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_386e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_386e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_386e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_386e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2956_c7_904a]
signal opc_result_MUX_uxn_opcodes_h_l2956_c7_904a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2956_c7_904a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2956_c7_904a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2956_c7_904a_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l2956_c40_2888]
signal eor2_uxn_opcodes_h_l2956_c40_2888_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l2956_c40_2888_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2956_c40_2888_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2956_c40_2888_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2956_c40_2888_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2957_c11_e071]
signal BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e071_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e071_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e071_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2957_c1_bcb1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_bcb1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_bcb1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_bcb1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_bcb1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2958_c7_b055]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_b055_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_b055_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_b055_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_b055_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2957_c7_386e]
signal opc_result_MUX_uxn_opcodes_h_l2957_c7_386e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2957_c7_386e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2957_c7_386e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2957_c7_386e_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l2957_c40_2dbb]
signal sft_uxn_opcodes_h_l2957_c40_2dbb_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l2957_c40_2dbb_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2957_c40_2dbb_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2957_c40_2dbb_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2957_c40_2dbb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2958_c11_4d83]
signal BIN_OP_EQ_uxn_opcodes_h_l2958_c11_4d83_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2958_c11_4d83_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2958_c11_4d83_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2958_c1_7a91]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_7a91_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_7a91_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_7a91_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_7a91_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2958_c7_b055]
signal opc_result_MUX_uxn_opcodes_h_l2958_c7_b055_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2958_c7_b055_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2958_c7_b055_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2958_c7_b055_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l2958_c40_d4b6]
signal sft2_uxn_opcodes_h_l2958_c40_d4b6_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l2958_c40_d4b6_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2958_c40_d4b6_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2958_c40_d4b6_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2958_c40_d4b6_return_output : opcode_result_t;

-- CONST_SR_6[uxn_opcodes_h_l2960_c16_fa0d]
signal CONST_SR_6_uxn_opcodes_h_l2960_c16_fa0d_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_opcodes_h_l2960_c16_fa0d_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2961_c2_36f6]
signal BIN_OP_XOR_uxn_opcodes_h_l2961_c2_36f6_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2961_c2_36f6_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2961_c2_36f6_return_output : unsigned(0 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2963_c2_dc35]
signal sp0_MUX_uxn_opcodes_h_l2963_c2_dc35_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2963_c2_dc35_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2963_c2_dc35_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2963_c2_dc35_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2963_c2_dc35]
signal sp1_MUX_uxn_opcodes_h_l2963_c2_dc35_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2963_c2_dc35_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2963_c2_dc35_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2963_c2_dc35_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2964_c3_271b]
signal BIN_OP_PLUS_uxn_opcodes_h_l2964_c3_271b_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2964_c3_271b_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2964_c3_271b_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2966_c3_e525]
signal BIN_OP_PLUS_uxn_opcodes_h_l2966_c3_e525_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2966_c3_e525_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2966_c3_e525_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l2969_c29_6723]
signal MUX_uxn_opcodes_h_l2969_c29_6723_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2969_c29_6723_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2969_c29_6723_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2969_c29_6723_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2969_c19_4410]
signal BIN_OP_MINUS_uxn_opcodes_h_l2969_c19_4410_left : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2969_c19_4410_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2969_c19_4410_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l2970_c20_88cb]
signal MUX_uxn_opcodes_h_l2970_c20_88cb_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2970_c20_88cb_iftrue : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2970_c20_88cb_iffalse : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2970_c20_88cb_return_output : unsigned(8 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2970_c2_f2a4]
signal BIN_OP_PLUS_uxn_opcodes_h_l2970_c2_f2a4_left : unsigned(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2970_c2_f2a4_right : unsigned(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2970_c2_f2a4_return_output : unsigned(9 downto 0);

-- stack_ram_update[uxn_opcodes_h_l2972_c24_ab8e]
signal stack_ram_update_uxn_opcodes_h_l2972_c24_ab8e_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2972_c24_ab8e_stack_address : unsigned(8 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2972_c24_ab8e_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2972_c24_ab8e_write_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2972_c24_ab8e_return_output : unsigned(7 downto 0);

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
-- BIN_OP_AND_uxn_opcodes_h_l2881_c14_9fde
BIN_OP_AND_uxn_opcodes_h_l2881_c14_9fde : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2881_c14_9fde_left,
BIN_OP_AND_uxn_opcodes_h_l2881_c14_9fde_right,
BIN_OP_AND_uxn_opcodes_h_l2881_c14_9fde_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2882_c14_1402
BIN_OP_XOR_uxn_opcodes_h_l2882_c14_1402 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2882_c14_1402_left,
BIN_OP_XOR_uxn_opcodes_h_l2882_c14_1402_right,
BIN_OP_XOR_uxn_opcodes_h_l2882_c14_1402_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2882_c14_00ea
BIN_OP_OR_uxn_opcodes_h_l2882_c14_00ea : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2882_c14_00ea_left,
BIN_OP_OR_uxn_opcodes_h_l2882_c14_00ea_right,
BIN_OP_OR_uxn_opcodes_h_l2882_c14_00ea_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l2882_c14_ca9d
UNARY_OP_NOT_uxn_opcodes_h_l2882_c14_ca9d : entity work.UNARY_OP_NOT_uint8_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l2882_c14_ca9d_expr,
UNARY_OP_NOT_uxn_opcodes_h_l2882_c14_ca9d_return_output);

-- BIN_OP_NEQ_uxn_opcodes_h_l2882_c14_eb9a
BIN_OP_NEQ_uxn_opcodes_h_l2882_c14_eb9a : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_opcodes_h_l2882_c14_eb9a_left,
BIN_OP_NEQ_uxn_opcodes_h_l2882_c14_eb9a_right,
BIN_OP_NEQ_uxn_opcodes_h_l2882_c14_eb9a_return_output);

-- MUX_uxn_opcodes_h_l2882_c14_c701
MUX_uxn_opcodes_h_l2882_c14_c701 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2882_c14_c701_cond,
MUX_uxn_opcodes_h_l2882_c14_c701_iftrue,
MUX_uxn_opcodes_h_l2882_c14_c701_iffalse,
MUX_uxn_opcodes_h_l2882_c14_c701_return_output);

-- MUX_uxn_opcodes_h_l2883_c8_0758
MUX_uxn_opcodes_h_l2883_c8_0758 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2883_c8_0758_cond,
MUX_uxn_opcodes_h_l2883_c8_0758_iftrue,
MUX_uxn_opcodes_h_l2883_c8_0758_iffalse,
MUX_uxn_opcodes_h_l2883_c8_0758_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2889_c6_90ad
BIN_OP_EQ_uxn_opcodes_h_l2889_c6_90ad : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2889_c6_90ad_left,
BIN_OP_EQ_uxn_opcodes_h_l2889_c6_90ad_right,
BIN_OP_EQ_uxn_opcodes_h_l2889_c6_90ad_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d402
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d402 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d402_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d402_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d402_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d402_return_output);

-- is_wait_MUX_uxn_opcodes_h_l2889_c2_ac95
is_wait_MUX_uxn_opcodes_h_l2889_c2_ac95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_wait_MUX_uxn_opcodes_h_l2889_c2_ac95_cond,
is_wait_MUX_uxn_opcodes_h_l2889_c2_ac95_iftrue,
is_wait_MUX_uxn_opcodes_h_l2889_c2_ac95_iffalse,
is_wait_MUX_uxn_opcodes_h_l2889_c2_ac95_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95
opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_cond,
opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_iftrue,
opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_iffalse,
opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_return_output);

-- brk_uxn_opcodes_h_l2889_c48_5e4f
brk_uxn_opcodes_h_l2889_c48_5e4f : entity work.brk_0CLK_b45f1687 port map (
brk_uxn_opcodes_h_l2889_c48_5e4f_phase,
brk_uxn_opcodes_h_l2889_c48_5e4f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1f15
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1f15 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1f15_left,
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1f15_right,
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1f15_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_8c3f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_8c3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_8c3f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_8c3f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_8c3f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_8c3f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_27a4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_27a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_27a4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_27a4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_27a4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_27a4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2890_c7_d402
opc_result_MUX_uxn_opcodes_h_l2890_c7_d402 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2890_c7_d402_cond,
opc_result_MUX_uxn_opcodes_h_l2890_c7_d402_iftrue,
opc_result_MUX_uxn_opcodes_h_l2890_c7_d402_iffalse,
opc_result_MUX_uxn_opcodes_h_l2890_c7_d402_return_output);

-- jci_uxn_opcodes_h_l2890_c40_ebae
jci_uxn_opcodes_h_l2890_c40_ebae : entity work.jci_0CLK_4351dde2 port map (
clk,
jci_uxn_opcodes_h_l2890_c40_ebae_CLOCK_ENABLE,
jci_uxn_opcodes_h_l2890_c40_ebae_phase,
jci_uxn_opcodes_h_l2890_c40_ebae_pc,
jci_uxn_opcodes_h_l2890_c40_ebae_previous_stack_read,
jci_uxn_opcodes_h_l2890_c40_ebae_previous_ram_read,
jci_uxn_opcodes_h_l2890_c40_ebae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2891_c11_daa3
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_daa3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_daa3_left,
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_daa3_right,
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_daa3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ad00
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ad00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ad00_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ad00_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ad00_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ad00_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_07db
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_07db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_07db_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_07db_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_07db_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_07db_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2891_c7_27a4
opc_result_MUX_uxn_opcodes_h_l2891_c7_27a4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2891_c7_27a4_cond,
opc_result_MUX_uxn_opcodes_h_l2891_c7_27a4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2891_c7_27a4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2891_c7_27a4_return_output);

-- jmi_uxn_opcodes_h_l2891_c40_12f6
jmi_uxn_opcodes_h_l2891_c40_12f6 : entity work.jmi_0CLK_937caaea port map (
clk,
jmi_uxn_opcodes_h_l2891_c40_12f6_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l2891_c40_12f6_phase,
jmi_uxn_opcodes_h_l2891_c40_12f6_pc,
jmi_uxn_opcodes_h_l2891_c40_12f6_previous_ram_read,
jmi_uxn_opcodes_h_l2891_c40_12f6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2892_c11_1305
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_1305 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_1305_left,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_1305_right,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_1305_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_46a9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_46a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_46a9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_46a9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_46a9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_46a9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_4a49
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_4a49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_4a49_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_4a49_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_4a49_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_4a49_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2892_c7_07db
opc_result_MUX_uxn_opcodes_h_l2892_c7_07db : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2892_c7_07db_cond,
opc_result_MUX_uxn_opcodes_h_l2892_c7_07db_iftrue,
opc_result_MUX_uxn_opcodes_h_l2892_c7_07db_iffalse,
opc_result_MUX_uxn_opcodes_h_l2892_c7_07db_return_output);

-- jsi_uxn_opcodes_h_l2892_c40_7ef2
jsi_uxn_opcodes_h_l2892_c40_7ef2 : entity work.jsi_0CLK_4c8178ef port map (
clk,
jsi_uxn_opcodes_h_l2892_c40_7ef2_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l2892_c40_7ef2_phase,
jsi_uxn_opcodes_h_l2892_c40_7ef2_pc,
jsi_uxn_opcodes_h_l2892_c40_7ef2_previous_ram_read,
jsi_uxn_opcodes_h_l2892_c40_7ef2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4677
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4677 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4677_left,
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4677_right,
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4677_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_6ea9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_6ea9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_6ea9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_6ea9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_6ea9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_6ea9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_5457
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_5457 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_5457_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_5457_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_5457_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_5457_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2893_c7_4a49
opc_result_MUX_uxn_opcodes_h_l2893_c7_4a49 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2893_c7_4a49_cond,
opc_result_MUX_uxn_opcodes_h_l2893_c7_4a49_iftrue,
opc_result_MUX_uxn_opcodes_h_l2893_c7_4a49_iffalse,
opc_result_MUX_uxn_opcodes_h_l2893_c7_4a49_return_output);

-- lit_uxn_opcodes_h_l2893_c40_ecac
lit_uxn_opcodes_h_l2893_c40_ecac : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2893_c40_ecac_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2893_c40_ecac_phase,
lit_uxn_opcodes_h_l2893_c40_ecac_pc,
lit_uxn_opcodes_h_l2893_c40_ecac_previous_ram_read,
lit_uxn_opcodes_h_l2893_c40_ecac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2894_c11_fc3b
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_fc3b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_fc3b_left,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_fc3b_right,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_fc3b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_9afe
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_9afe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_9afe_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_9afe_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_9afe_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_9afe_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_d0e8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_d0e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_d0e8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_d0e8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_d0e8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_d0e8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2894_c7_5457
opc_result_MUX_uxn_opcodes_h_l2894_c7_5457 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2894_c7_5457_cond,
opc_result_MUX_uxn_opcodes_h_l2894_c7_5457_iftrue,
opc_result_MUX_uxn_opcodes_h_l2894_c7_5457_iffalse,
opc_result_MUX_uxn_opcodes_h_l2894_c7_5457_return_output);

-- lit2_uxn_opcodes_h_l2894_c40_fc02
lit2_uxn_opcodes_h_l2894_c40_fc02 : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2894_c40_fc02_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2894_c40_fc02_phase,
lit2_uxn_opcodes_h_l2894_c40_fc02_pc,
lit2_uxn_opcodes_h_l2894_c40_fc02_previous_ram_read,
lit2_uxn_opcodes_h_l2894_c40_fc02_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3368
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3368 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3368_left,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3368_right,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3368_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3b1a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3b1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3b1a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3b1a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3b1a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3b1a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_c86f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_c86f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_c86f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_c86f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_c86f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_c86f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2895_c7_d0e8
opc_result_MUX_uxn_opcodes_h_l2895_c7_d0e8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2895_c7_d0e8_cond,
opc_result_MUX_uxn_opcodes_h_l2895_c7_d0e8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2895_c7_d0e8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2895_c7_d0e8_return_output);

-- lit_uxn_opcodes_h_l2895_c40_9062
lit_uxn_opcodes_h_l2895_c40_9062 : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2895_c40_9062_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2895_c40_9062_phase,
lit_uxn_opcodes_h_l2895_c40_9062_pc,
lit_uxn_opcodes_h_l2895_c40_9062_previous_ram_read,
lit_uxn_opcodes_h_l2895_c40_9062_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2896_c11_b543
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_b543 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_b543_left,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_b543_right,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_b543_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31b5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31b5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31b5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31b5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31b5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fee
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fee_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fee_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fee_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fee_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2896_c7_c86f
opc_result_MUX_uxn_opcodes_h_l2896_c7_c86f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2896_c7_c86f_cond,
opc_result_MUX_uxn_opcodes_h_l2896_c7_c86f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2896_c7_c86f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2896_c7_c86f_return_output);

-- lit2_uxn_opcodes_h_l2896_c40_3ad0
lit2_uxn_opcodes_h_l2896_c40_3ad0 : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2896_c40_3ad0_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2896_c40_3ad0_phase,
lit2_uxn_opcodes_h_l2896_c40_3ad0_pc,
lit2_uxn_opcodes_h_l2896_c40_3ad0_previous_ram_read,
lit2_uxn_opcodes_h_l2896_c40_3ad0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2897_c11_2162
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_2162 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_2162_left,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_2162_right,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_2162_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_bf9d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_bf9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_bf9d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_bf9d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_bf9d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_bf9d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f54c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f54c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f54c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f54c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f54c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f54c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2897_c7_6fee
opc_result_MUX_uxn_opcodes_h_l2897_c7_6fee : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2897_c7_6fee_cond,
opc_result_MUX_uxn_opcodes_h_l2897_c7_6fee_iftrue,
opc_result_MUX_uxn_opcodes_h_l2897_c7_6fee_iffalse,
opc_result_MUX_uxn_opcodes_h_l2897_c7_6fee_return_output);

-- inc_uxn_opcodes_h_l2897_c40_3f15
inc_uxn_opcodes_h_l2897_c40_3f15 : entity work.inc_0CLK_121b1df5 port map (
clk,
inc_uxn_opcodes_h_l2897_c40_3f15_CLOCK_ENABLE,
inc_uxn_opcodes_h_l2897_c40_3f15_phase,
inc_uxn_opcodes_h_l2897_c40_3f15_ins,
inc_uxn_opcodes_h_l2897_c40_3f15_previous_stack_read,
inc_uxn_opcodes_h_l2897_c40_3f15_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2898_c11_5698
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_5698 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_5698_left,
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_5698_right,
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_5698_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_30da
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_30da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_30da_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_30da_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_30da_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_30da_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2b32
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2b32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2b32_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2b32_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2b32_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2b32_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2898_c7_f54c
opc_result_MUX_uxn_opcodes_h_l2898_c7_f54c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2898_c7_f54c_cond,
opc_result_MUX_uxn_opcodes_h_l2898_c7_f54c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2898_c7_f54c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2898_c7_f54c_return_output);

-- inc2_uxn_opcodes_h_l2898_c40_e3a1
inc2_uxn_opcodes_h_l2898_c40_e3a1 : entity work.inc2_0CLK_180c5210 port map (
clk,
inc2_uxn_opcodes_h_l2898_c40_e3a1_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l2898_c40_e3a1_phase,
inc2_uxn_opcodes_h_l2898_c40_e3a1_ins,
inc2_uxn_opcodes_h_l2898_c40_e3a1_previous_stack_read,
inc2_uxn_opcodes_h_l2898_c40_e3a1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2899_c11_8062
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_8062 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_8062_left,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_8062_right,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_8062_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7a01
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7a01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7a01_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7a01_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7a01_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7a01_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_89d5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_89d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_89d5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_89d5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_89d5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_89d5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2899_c7_2b32
opc_result_MUX_uxn_opcodes_h_l2899_c7_2b32 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2899_c7_2b32_cond,
opc_result_MUX_uxn_opcodes_h_l2899_c7_2b32_iftrue,
opc_result_MUX_uxn_opcodes_h_l2899_c7_2b32_iffalse,
opc_result_MUX_uxn_opcodes_h_l2899_c7_2b32_return_output);

-- pop_uxn_opcodes_h_l2899_c40_ce4a
pop_uxn_opcodes_h_l2899_c40_ce4a : entity work.pop_0CLK_b0b628a3 port map (
clk,
pop_uxn_opcodes_h_l2899_c40_ce4a_CLOCK_ENABLE,
pop_uxn_opcodes_h_l2899_c40_ce4a_phase,
pop_uxn_opcodes_h_l2899_c40_ce4a_ins,
pop_uxn_opcodes_h_l2899_c40_ce4a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2900_c11_55f1
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_55f1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_55f1_left,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_55f1_right,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_55f1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_455f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_455f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_455f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_455f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_455f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_455f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4b8a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4b8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4b8a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4b8a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4b8a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4b8a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2900_c7_89d5
opc_result_MUX_uxn_opcodes_h_l2900_c7_89d5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2900_c7_89d5_cond,
opc_result_MUX_uxn_opcodes_h_l2900_c7_89d5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2900_c7_89d5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2900_c7_89d5_return_output);

-- pop2_uxn_opcodes_h_l2900_c40_61c0
pop2_uxn_opcodes_h_l2900_c40_61c0 : entity work.pop2_0CLK_b0b628a3 port map (
clk,
pop2_uxn_opcodes_h_l2900_c40_61c0_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l2900_c40_61c0_phase,
pop2_uxn_opcodes_h_l2900_c40_61c0_ins,
pop2_uxn_opcodes_h_l2900_c40_61c0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2901_c11_12b0
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_12b0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_12b0_left,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_12b0_right,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_12b0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_5a28
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_5a28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_5a28_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_5a28_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_5a28_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_5a28_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5ca8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5ca8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5ca8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5ca8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5ca8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5ca8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2901_c7_4b8a
opc_result_MUX_uxn_opcodes_h_l2901_c7_4b8a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2901_c7_4b8a_cond,
opc_result_MUX_uxn_opcodes_h_l2901_c7_4b8a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2901_c7_4b8a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2901_c7_4b8a_return_output);

-- nip_uxn_opcodes_h_l2901_c40_c96b
nip_uxn_opcodes_h_l2901_c40_c96b : entity work.nip_0CLK_d0ab213f port map (
clk,
nip_uxn_opcodes_h_l2901_c40_c96b_CLOCK_ENABLE,
nip_uxn_opcodes_h_l2901_c40_c96b_phase,
nip_uxn_opcodes_h_l2901_c40_c96b_ins,
nip_uxn_opcodes_h_l2901_c40_c96b_previous_stack_read,
nip_uxn_opcodes_h_l2901_c40_c96b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8b2b
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8b2b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8b2b_left,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8b2b_right,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8b2b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_0900
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_0900 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_0900_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_0900_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_0900_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_0900_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_24d6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_24d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_24d6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_24d6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_24d6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_24d6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2902_c7_5ca8
opc_result_MUX_uxn_opcodes_h_l2902_c7_5ca8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2902_c7_5ca8_cond,
opc_result_MUX_uxn_opcodes_h_l2902_c7_5ca8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2902_c7_5ca8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2902_c7_5ca8_return_output);

-- nip2_uxn_opcodes_h_l2902_c40_7979
nip2_uxn_opcodes_h_l2902_c40_7979 : entity work.nip2_0CLK_1a2ef46d port map (
clk,
nip2_uxn_opcodes_h_l2902_c40_7979_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l2902_c40_7979_phase,
nip2_uxn_opcodes_h_l2902_c40_7979_ins,
nip2_uxn_opcodes_h_l2902_c40_7979_previous_stack_read,
nip2_uxn_opcodes_h_l2902_c40_7979_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2c9a
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2c9a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2c9a_left,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2c9a_right,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2c9a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_aac9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_aac9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_aac9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_aac9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_aac9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_aac9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1bfc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1bfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1bfc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1bfc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1bfc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1bfc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2903_c7_24d6
opc_result_MUX_uxn_opcodes_h_l2903_c7_24d6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2903_c7_24d6_cond,
opc_result_MUX_uxn_opcodes_h_l2903_c7_24d6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2903_c7_24d6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2903_c7_24d6_return_output);

-- swp_uxn_opcodes_h_l2903_c40_183e
swp_uxn_opcodes_h_l2903_c40_183e : entity work.swp_0CLK_0d289325 port map (
clk,
swp_uxn_opcodes_h_l2903_c40_183e_CLOCK_ENABLE,
swp_uxn_opcodes_h_l2903_c40_183e_phase,
swp_uxn_opcodes_h_l2903_c40_183e_ins,
swp_uxn_opcodes_h_l2903_c40_183e_previous_stack_read,
swp_uxn_opcodes_h_l2903_c40_183e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4448
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4448 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4448_left,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4448_right,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4448_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_83cd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_83cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_83cd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_83cd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_83cd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_83cd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fdd3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fdd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fdd3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fdd3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fdd3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fdd3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2904_c7_1bfc
opc_result_MUX_uxn_opcodes_h_l2904_c7_1bfc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2904_c7_1bfc_cond,
opc_result_MUX_uxn_opcodes_h_l2904_c7_1bfc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2904_c7_1bfc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2904_c7_1bfc_return_output);

-- swp2_uxn_opcodes_h_l2904_c40_4776
swp2_uxn_opcodes_h_l2904_c40_4776 : entity work.swp2_0CLK_814c2afd port map (
clk,
swp2_uxn_opcodes_h_l2904_c40_4776_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l2904_c40_4776_phase,
swp2_uxn_opcodes_h_l2904_c40_4776_ins,
swp2_uxn_opcodes_h_l2904_c40_4776_previous_stack_read,
swp2_uxn_opcodes_h_l2904_c40_4776_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2905_c11_eb86
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_eb86 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_eb86_left,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_eb86_right,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_eb86_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_431a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_431a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_431a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_431a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_431a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_431a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_30fd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_30fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_30fd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_30fd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_30fd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_30fd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2905_c7_fdd3
opc_result_MUX_uxn_opcodes_h_l2905_c7_fdd3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2905_c7_fdd3_cond,
opc_result_MUX_uxn_opcodes_h_l2905_c7_fdd3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2905_c7_fdd3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2905_c7_fdd3_return_output);

-- rot_uxn_opcodes_h_l2905_c40_5d08
rot_uxn_opcodes_h_l2905_c40_5d08 : entity work.rot_0CLK_b288bfb7 port map (
clk,
rot_uxn_opcodes_h_l2905_c40_5d08_CLOCK_ENABLE,
rot_uxn_opcodes_h_l2905_c40_5d08_phase,
rot_uxn_opcodes_h_l2905_c40_5d08_ins,
rot_uxn_opcodes_h_l2905_c40_5d08_previous_stack_read,
rot_uxn_opcodes_h_l2905_c40_5d08_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2906_c11_c483
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_c483 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_c483_left,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_c483_right,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_c483_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_4ecb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_4ecb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_4ecb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_4ecb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_4ecb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_4ecb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d53c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d53c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d53c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d53c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d53c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d53c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2906_c7_30fd
opc_result_MUX_uxn_opcodes_h_l2906_c7_30fd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2906_c7_30fd_cond,
opc_result_MUX_uxn_opcodes_h_l2906_c7_30fd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2906_c7_30fd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2906_c7_30fd_return_output);

-- rot2_uxn_opcodes_h_l2906_c40_1572
rot2_uxn_opcodes_h_l2906_c40_1572 : entity work.rot2_0CLK_8e773831 port map (
clk,
rot2_uxn_opcodes_h_l2906_c40_1572_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l2906_c40_1572_phase,
rot2_uxn_opcodes_h_l2906_c40_1572_ins,
rot2_uxn_opcodes_h_l2906_c40_1572_previous_stack_read,
rot2_uxn_opcodes_h_l2906_c40_1572_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c602
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c602 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c602_left,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c602_right,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c602_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cf71
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cf71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cf71_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cf71_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cf71_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cf71_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_cd44
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_cd44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_cd44_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_cd44_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_cd44_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_cd44_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2907_c7_d53c
opc_result_MUX_uxn_opcodes_h_l2907_c7_d53c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2907_c7_d53c_cond,
opc_result_MUX_uxn_opcodes_h_l2907_c7_d53c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2907_c7_d53c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2907_c7_d53c_return_output);

-- dup_uxn_opcodes_h_l2907_c40_ffc6
dup_uxn_opcodes_h_l2907_c40_ffc6 : entity work.dup_0CLK_d4b33a56 port map (
clk,
dup_uxn_opcodes_h_l2907_c40_ffc6_CLOCK_ENABLE,
dup_uxn_opcodes_h_l2907_c40_ffc6_phase,
dup_uxn_opcodes_h_l2907_c40_ffc6_ins,
dup_uxn_opcodes_h_l2907_c40_ffc6_previous_stack_read,
dup_uxn_opcodes_h_l2907_c40_ffc6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2908_c11_55ee
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_55ee : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_55ee_left,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_55ee_right,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_55ee_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ca3e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ca3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ca3e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ca3e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ca3e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ca3e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e639
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e639 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e639_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e639_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e639_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e639_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2908_c7_cd44
opc_result_MUX_uxn_opcodes_h_l2908_c7_cd44 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2908_c7_cd44_cond,
opc_result_MUX_uxn_opcodes_h_l2908_c7_cd44_iftrue,
opc_result_MUX_uxn_opcodes_h_l2908_c7_cd44_iffalse,
opc_result_MUX_uxn_opcodes_h_l2908_c7_cd44_return_output);

-- dup2_uxn_opcodes_h_l2908_c40_c8fc
dup2_uxn_opcodes_h_l2908_c40_c8fc : entity work.dup2_0CLK_e4095020 port map (
clk,
dup2_uxn_opcodes_h_l2908_c40_c8fc_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l2908_c40_c8fc_phase,
dup2_uxn_opcodes_h_l2908_c40_c8fc_ins,
dup2_uxn_opcodes_h_l2908_c40_c8fc_previous_stack_read,
dup2_uxn_opcodes_h_l2908_c40_c8fc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7b58
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7b58 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7b58_left,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7b58_right,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7b58_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0d5a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0d5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0d5a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0d5a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0d5a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0d5a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_94ca
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_94ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_94ca_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_94ca_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_94ca_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_94ca_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2909_c7_e639
opc_result_MUX_uxn_opcodes_h_l2909_c7_e639 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2909_c7_e639_cond,
opc_result_MUX_uxn_opcodes_h_l2909_c7_e639_iftrue,
opc_result_MUX_uxn_opcodes_h_l2909_c7_e639_iffalse,
opc_result_MUX_uxn_opcodes_h_l2909_c7_e639_return_output);

-- ovr_uxn_opcodes_h_l2909_c40_28a1
ovr_uxn_opcodes_h_l2909_c40_28a1 : entity work.ovr_0CLK_61914e8d port map (
clk,
ovr_uxn_opcodes_h_l2909_c40_28a1_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l2909_c40_28a1_phase,
ovr_uxn_opcodes_h_l2909_c40_28a1_ins,
ovr_uxn_opcodes_h_l2909_c40_28a1_previous_stack_read,
ovr_uxn_opcodes_h_l2909_c40_28a1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2910_c11_89cd
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_89cd : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_89cd_left,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_89cd_right,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_89cd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_895b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_895b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_895b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_895b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_895b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_895b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_cacc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_cacc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_cacc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_cacc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_cacc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_cacc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2910_c7_94ca
opc_result_MUX_uxn_opcodes_h_l2910_c7_94ca : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2910_c7_94ca_cond,
opc_result_MUX_uxn_opcodes_h_l2910_c7_94ca_iftrue,
opc_result_MUX_uxn_opcodes_h_l2910_c7_94ca_iffalse,
opc_result_MUX_uxn_opcodes_h_l2910_c7_94ca_return_output);

-- ovr2_uxn_opcodes_h_l2910_c40_dde0
ovr2_uxn_opcodes_h_l2910_c40_dde0 : entity work.ovr2_0CLK_bb09c2cb port map (
clk,
ovr2_uxn_opcodes_h_l2910_c40_dde0_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l2910_c40_dde0_phase,
ovr2_uxn_opcodes_h_l2910_c40_dde0_ins,
ovr2_uxn_opcodes_h_l2910_c40_dde0_previous_stack_read,
ovr2_uxn_opcodes_h_l2910_c40_dde0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2911_c11_f85c
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_f85c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_f85c_left,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_f85c_right,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_f85c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1ce9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1ce9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1ce9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1ce9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1ce9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1ce9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_8f7e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_8f7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_8f7e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_8f7e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_8f7e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_8f7e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2911_c7_cacc
opc_result_MUX_uxn_opcodes_h_l2911_c7_cacc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2911_c7_cacc_cond,
opc_result_MUX_uxn_opcodes_h_l2911_c7_cacc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2911_c7_cacc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2911_c7_cacc_return_output);

-- equ_uxn_opcodes_h_l2911_c40_edb9
equ_uxn_opcodes_h_l2911_c40_edb9 : entity work.equ_0CLK_226c8821 port map (
clk,
equ_uxn_opcodes_h_l2911_c40_edb9_CLOCK_ENABLE,
equ_uxn_opcodes_h_l2911_c40_edb9_phase,
equ_uxn_opcodes_h_l2911_c40_edb9_ins,
equ_uxn_opcodes_h_l2911_c40_edb9_previous_stack_read,
equ_uxn_opcodes_h_l2911_c40_edb9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2912_c11_52a6
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_52a6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_52a6_left,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_52a6_right,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_52a6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_bdb8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_bdb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_bdb8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_bdb8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_bdb8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_bdb8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0f12
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0f12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0f12_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0f12_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0f12_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0f12_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2912_c7_8f7e
opc_result_MUX_uxn_opcodes_h_l2912_c7_8f7e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2912_c7_8f7e_cond,
opc_result_MUX_uxn_opcodes_h_l2912_c7_8f7e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2912_c7_8f7e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2912_c7_8f7e_return_output);

-- equ2_uxn_opcodes_h_l2912_c40_6614
equ2_uxn_opcodes_h_l2912_c40_6614 : entity work.equ2_0CLK_609876da port map (
clk,
equ2_uxn_opcodes_h_l2912_c40_6614_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l2912_c40_6614_phase,
equ2_uxn_opcodes_h_l2912_c40_6614_ins,
equ2_uxn_opcodes_h_l2912_c40_6614_previous_stack_read,
equ2_uxn_opcodes_h_l2912_c40_6614_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8326
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8326 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8326_left,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8326_right,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8326_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_fea9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_fea9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_fea9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_fea9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_fea9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_fea9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8458
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8458 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8458_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8458_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8458_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8458_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2913_c7_0f12
opc_result_MUX_uxn_opcodes_h_l2913_c7_0f12 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2913_c7_0f12_cond,
opc_result_MUX_uxn_opcodes_h_l2913_c7_0f12_iftrue,
opc_result_MUX_uxn_opcodes_h_l2913_c7_0f12_iffalse,
opc_result_MUX_uxn_opcodes_h_l2913_c7_0f12_return_output);

-- neq_uxn_opcodes_h_l2913_c40_7553
neq_uxn_opcodes_h_l2913_c40_7553 : entity work.neq_0CLK_226c8821 port map (
clk,
neq_uxn_opcodes_h_l2913_c40_7553_CLOCK_ENABLE,
neq_uxn_opcodes_h_l2913_c40_7553_phase,
neq_uxn_opcodes_h_l2913_c40_7553_ins,
neq_uxn_opcodes_h_l2913_c40_7553_previous_stack_read,
neq_uxn_opcodes_h_l2913_c40_7553_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d754
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d754 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d754_left,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d754_right,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d754_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_2121
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_2121 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_2121_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_2121_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_2121_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_2121_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_60a2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_60a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_60a2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_60a2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_60a2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_60a2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2914_c7_8458
opc_result_MUX_uxn_opcodes_h_l2914_c7_8458 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2914_c7_8458_cond,
opc_result_MUX_uxn_opcodes_h_l2914_c7_8458_iftrue,
opc_result_MUX_uxn_opcodes_h_l2914_c7_8458_iffalse,
opc_result_MUX_uxn_opcodes_h_l2914_c7_8458_return_output);

-- neq2_uxn_opcodes_h_l2914_c40_aef0
neq2_uxn_opcodes_h_l2914_c40_aef0 : entity work.neq2_0CLK_609876da port map (
clk,
neq2_uxn_opcodes_h_l2914_c40_aef0_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l2914_c40_aef0_phase,
neq2_uxn_opcodes_h_l2914_c40_aef0_ins,
neq2_uxn_opcodes_h_l2914_c40_aef0_previous_stack_read,
neq2_uxn_opcodes_h_l2914_c40_aef0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b457
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b457 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b457_left,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b457_right,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b457_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_2748
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_2748 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_2748_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_2748_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_2748_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_2748_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ec5e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ec5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ec5e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ec5e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ec5e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ec5e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2915_c7_60a2
opc_result_MUX_uxn_opcodes_h_l2915_c7_60a2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2915_c7_60a2_cond,
opc_result_MUX_uxn_opcodes_h_l2915_c7_60a2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2915_c7_60a2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2915_c7_60a2_return_output);

-- gth_uxn_opcodes_h_l2915_c40_7d0a
gth_uxn_opcodes_h_l2915_c40_7d0a : entity work.gth_0CLK_226c8821 port map (
clk,
gth_uxn_opcodes_h_l2915_c40_7d0a_CLOCK_ENABLE,
gth_uxn_opcodes_h_l2915_c40_7d0a_phase,
gth_uxn_opcodes_h_l2915_c40_7d0a_ins,
gth_uxn_opcodes_h_l2915_c40_7d0a_previous_stack_read,
gth_uxn_opcodes_h_l2915_c40_7d0a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2916_c11_68ad
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_68ad : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_68ad_left,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_68ad_right,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_68ad_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0df6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0df6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0df6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0df6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0df6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0df6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8d46
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8d46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8d46_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8d46_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8d46_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8d46_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2916_c7_ec5e
opc_result_MUX_uxn_opcodes_h_l2916_c7_ec5e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2916_c7_ec5e_cond,
opc_result_MUX_uxn_opcodes_h_l2916_c7_ec5e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2916_c7_ec5e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2916_c7_ec5e_return_output);

-- gth2_uxn_opcodes_h_l2916_c40_6fd0
gth2_uxn_opcodes_h_l2916_c40_6fd0 : entity work.gth2_0CLK_609876da port map (
clk,
gth2_uxn_opcodes_h_l2916_c40_6fd0_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l2916_c40_6fd0_phase,
gth2_uxn_opcodes_h_l2916_c40_6fd0_ins,
gth2_uxn_opcodes_h_l2916_c40_6fd0_previous_stack_read,
gth2_uxn_opcodes_h_l2916_c40_6fd0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3b17
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3b17 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3b17_left,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3b17_right,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3b17_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fa16
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fa16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fa16_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fa16_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fa16_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fa16_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8f8d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8f8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8f8d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8f8d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8f8d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8f8d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2917_c7_8d46
opc_result_MUX_uxn_opcodes_h_l2917_c7_8d46 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2917_c7_8d46_cond,
opc_result_MUX_uxn_opcodes_h_l2917_c7_8d46_iftrue,
opc_result_MUX_uxn_opcodes_h_l2917_c7_8d46_iffalse,
opc_result_MUX_uxn_opcodes_h_l2917_c7_8d46_return_output);

-- lth_uxn_opcodes_h_l2917_c40_4a65
lth_uxn_opcodes_h_l2917_c40_4a65 : entity work.lth_0CLK_226c8821 port map (
clk,
lth_uxn_opcodes_h_l2917_c40_4a65_CLOCK_ENABLE,
lth_uxn_opcodes_h_l2917_c40_4a65_phase,
lth_uxn_opcodes_h_l2917_c40_4a65_ins,
lth_uxn_opcodes_h_l2917_c40_4a65_previous_stack_read,
lth_uxn_opcodes_h_l2917_c40_4a65_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2918_c11_3a36
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_3a36 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_3a36_left,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_3a36_right,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_3a36_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_c6bf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_c6bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_c6bf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_c6bf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_c6bf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_c6bf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4bcd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4bcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4bcd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4bcd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4bcd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4bcd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2918_c7_8f8d
opc_result_MUX_uxn_opcodes_h_l2918_c7_8f8d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2918_c7_8f8d_cond,
opc_result_MUX_uxn_opcodes_h_l2918_c7_8f8d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2918_c7_8f8d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2918_c7_8f8d_return_output);

-- lth2_uxn_opcodes_h_l2918_c40_7c6d
lth2_uxn_opcodes_h_l2918_c40_7c6d : entity work.lth2_0CLK_609876da port map (
clk,
lth2_uxn_opcodes_h_l2918_c40_7c6d_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l2918_c40_7c6d_phase,
lth2_uxn_opcodes_h_l2918_c40_7c6d_ins,
lth2_uxn_opcodes_h_l2918_c40_7c6d_previous_stack_read,
lth2_uxn_opcodes_h_l2918_c40_7c6d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f9ef
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f9ef : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f9ef_left,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f9ef_right,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f9ef_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4ee5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4ee5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4ee5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4ee5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4ee5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4ee5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_b546
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_b546 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_b546_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_b546_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_b546_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_b546_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2919_c7_4bcd
opc_result_MUX_uxn_opcodes_h_l2919_c7_4bcd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2919_c7_4bcd_cond,
opc_result_MUX_uxn_opcodes_h_l2919_c7_4bcd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2919_c7_4bcd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2919_c7_4bcd_return_output);

-- jmp_uxn_opcodes_h_l2919_c40_7a28
jmp_uxn_opcodes_h_l2919_c40_7a28 : entity work.jmp_0CLK_121b1df5 port map (
clk,
jmp_uxn_opcodes_h_l2919_c40_7a28_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l2919_c40_7a28_phase,
jmp_uxn_opcodes_h_l2919_c40_7a28_ins,
jmp_uxn_opcodes_h_l2919_c40_7a28_pc,
jmp_uxn_opcodes_h_l2919_c40_7a28_previous_stack_read,
jmp_uxn_opcodes_h_l2919_c40_7a28_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2920_c11_64a3
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_64a3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_64a3_left,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_64a3_right,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_64a3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d66d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d66d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d66d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d66d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d66d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d66d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_b35c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_b35c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_b35c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_b35c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_b35c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_b35c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2920_c7_b546
opc_result_MUX_uxn_opcodes_h_l2920_c7_b546 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2920_c7_b546_cond,
opc_result_MUX_uxn_opcodes_h_l2920_c7_b546_iftrue,
opc_result_MUX_uxn_opcodes_h_l2920_c7_b546_iffalse,
opc_result_MUX_uxn_opcodes_h_l2920_c7_b546_return_output);

-- jmp2_uxn_opcodes_h_l2920_c40_b488
jmp2_uxn_opcodes_h_l2920_c40_b488 : entity work.jmp2_0CLK_d6642053 port map (
clk,
jmp2_uxn_opcodes_h_l2920_c40_b488_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l2920_c40_b488_phase,
jmp2_uxn_opcodes_h_l2920_c40_b488_ins,
jmp2_uxn_opcodes_h_l2920_c40_b488_previous_stack_read,
jmp2_uxn_opcodes_h_l2920_c40_b488_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2921_c11_63a2
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_63a2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_63a2_left,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_63a2_right,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_63a2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_ac21
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_ac21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_ac21_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_ac21_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_ac21_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_ac21_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0723
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0723 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0723_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0723_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0723_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0723_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2921_c7_b35c
opc_result_MUX_uxn_opcodes_h_l2921_c7_b35c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2921_c7_b35c_cond,
opc_result_MUX_uxn_opcodes_h_l2921_c7_b35c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2921_c7_b35c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2921_c7_b35c_return_output);

-- jcn_uxn_opcodes_h_l2921_c40_37fc
jcn_uxn_opcodes_h_l2921_c40_37fc : entity work.jcn_0CLK_226c8821 port map (
clk,
jcn_uxn_opcodes_h_l2921_c40_37fc_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l2921_c40_37fc_phase,
jcn_uxn_opcodes_h_l2921_c40_37fc_ins,
jcn_uxn_opcodes_h_l2921_c40_37fc_pc,
jcn_uxn_opcodes_h_l2921_c40_37fc_previous_stack_read,
jcn_uxn_opcodes_h_l2921_c40_37fc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2922_c11_db69
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_db69 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_db69_left,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_db69_right,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_db69_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_fd5c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_fd5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_fd5c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_fd5c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_fd5c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_fd5c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f85d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f85d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f85d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f85d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f85d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f85d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2922_c7_0723
opc_result_MUX_uxn_opcodes_h_l2922_c7_0723 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2922_c7_0723_cond,
opc_result_MUX_uxn_opcodes_h_l2922_c7_0723_iftrue,
opc_result_MUX_uxn_opcodes_h_l2922_c7_0723_iffalse,
opc_result_MUX_uxn_opcodes_h_l2922_c7_0723_return_output);

-- jcn2_uxn_opcodes_h_l2922_c40_a994
jcn2_uxn_opcodes_h_l2922_c40_a994 : entity work.jcn2_0CLK_12273847 port map (
clk,
jcn2_uxn_opcodes_h_l2922_c40_a994_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l2922_c40_a994_phase,
jcn2_uxn_opcodes_h_l2922_c40_a994_ins,
jcn2_uxn_opcodes_h_l2922_c40_a994_previous_stack_read,
jcn2_uxn_opcodes_h_l2922_c40_a994_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7fe2
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7fe2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7fe2_left,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7fe2_right,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7fe2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_8ce0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_8ce0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_8ce0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_8ce0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_8ce0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_8ce0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_c25a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_c25a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_c25a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_c25a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_c25a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_c25a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2923_c7_f85d
opc_result_MUX_uxn_opcodes_h_l2923_c7_f85d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2923_c7_f85d_cond,
opc_result_MUX_uxn_opcodes_h_l2923_c7_f85d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2923_c7_f85d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2923_c7_f85d_return_output);

-- jsr_uxn_opcodes_h_l2923_c40_514c
jsr_uxn_opcodes_h_l2923_c40_514c : entity work.jsr_0CLK_fedec265 port map (
clk,
jsr_uxn_opcodes_h_l2923_c40_514c_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l2923_c40_514c_phase,
jsr_uxn_opcodes_h_l2923_c40_514c_ins,
jsr_uxn_opcodes_h_l2923_c40_514c_pc,
jsr_uxn_opcodes_h_l2923_c40_514c_previous_stack_read,
jsr_uxn_opcodes_h_l2923_c40_514c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2924_c11_bcf8
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_bcf8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_bcf8_left,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_bcf8_right,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_bcf8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_1d99
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_1d99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_1d99_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_1d99_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_1d99_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_1d99_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5cec
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5cec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5cec_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5cec_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5cec_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5cec_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2924_c7_c25a
opc_result_MUX_uxn_opcodes_h_l2924_c7_c25a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2924_c7_c25a_cond,
opc_result_MUX_uxn_opcodes_h_l2924_c7_c25a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2924_c7_c25a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2924_c7_c25a_return_output);

-- jsr2_uxn_opcodes_h_l2924_c40_9b2a
jsr2_uxn_opcodes_h_l2924_c40_9b2a : entity work.jsr2_0CLK_609876da port map (
clk,
jsr2_uxn_opcodes_h_l2924_c40_9b2a_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l2924_c40_9b2a_phase,
jsr2_uxn_opcodes_h_l2924_c40_9b2a_ins,
jsr2_uxn_opcodes_h_l2924_c40_9b2a_pc,
jsr2_uxn_opcodes_h_l2924_c40_9b2a_previous_stack_read,
jsr2_uxn_opcodes_h_l2924_c40_9b2a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2925_c11_5c03
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_5c03 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_5c03_left,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_5c03_right,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_5c03_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bd5d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bd5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bd5d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bd5d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bd5d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bd5d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e7bf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e7bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e7bf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e7bf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e7bf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e7bf_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2925_c7_5cec
opc_result_MUX_uxn_opcodes_h_l2925_c7_5cec : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2925_c7_5cec_cond,
opc_result_MUX_uxn_opcodes_h_l2925_c7_5cec_iftrue,
opc_result_MUX_uxn_opcodes_h_l2925_c7_5cec_iffalse,
opc_result_MUX_uxn_opcodes_h_l2925_c7_5cec_return_output);

-- sth_uxn_opcodes_h_l2925_c40_d655
sth_uxn_opcodes_h_l2925_c40_d655 : entity work.sth_0CLK_a9f1e08f port map (
clk,
sth_uxn_opcodes_h_l2925_c40_d655_CLOCK_ENABLE,
sth_uxn_opcodes_h_l2925_c40_d655_phase,
sth_uxn_opcodes_h_l2925_c40_d655_ins,
sth_uxn_opcodes_h_l2925_c40_d655_previous_stack_read,
sth_uxn_opcodes_h_l2925_c40_d655_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2926_c11_becd
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_becd : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_becd_left,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_becd_right,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_becd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_68d3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_68d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_68d3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_68d3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_68d3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_68d3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3c0d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3c0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3c0d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3c0d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3c0d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3c0d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2926_c7_e7bf
opc_result_MUX_uxn_opcodes_h_l2926_c7_e7bf : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2926_c7_e7bf_cond,
opc_result_MUX_uxn_opcodes_h_l2926_c7_e7bf_iftrue,
opc_result_MUX_uxn_opcodes_h_l2926_c7_e7bf_iffalse,
opc_result_MUX_uxn_opcodes_h_l2926_c7_e7bf_return_output);

-- sth2_uxn_opcodes_h_l2926_c40_b6c9
sth2_uxn_opcodes_h_l2926_c40_b6c9 : entity work.sth2_0CLK_55b6500a port map (
clk,
sth2_uxn_opcodes_h_l2926_c40_b6c9_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l2926_c40_b6c9_phase,
sth2_uxn_opcodes_h_l2926_c40_b6c9_ins,
sth2_uxn_opcodes_h_l2926_c40_b6c9_previous_stack_read,
sth2_uxn_opcodes_h_l2926_c40_b6c9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2927_c11_d52f
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_d52f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_d52f_left,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_d52f_right,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_d52f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_00b3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_00b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_00b3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_00b3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_00b3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_00b3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_71d1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_71d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_71d1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_71d1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_71d1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_71d1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2927_c7_3c0d
opc_result_MUX_uxn_opcodes_h_l2927_c7_3c0d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2927_c7_3c0d_cond,
opc_result_MUX_uxn_opcodes_h_l2927_c7_3c0d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2927_c7_3c0d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2927_c7_3c0d_return_output);

-- ldz_uxn_opcodes_h_l2927_c40_77b4
ldz_uxn_opcodes_h_l2927_c40_77b4 : entity work.ldz_0CLK_b128164d port map (
clk,
ldz_uxn_opcodes_h_l2927_c40_77b4_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l2927_c40_77b4_phase,
ldz_uxn_opcodes_h_l2927_c40_77b4_ins,
ldz_uxn_opcodes_h_l2927_c40_77b4_previous_stack_read,
ldz_uxn_opcodes_h_l2927_c40_77b4_previous_ram_read,
ldz_uxn_opcodes_h_l2927_c40_77b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e69a
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e69a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e69a_left,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e69a_right,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e69a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1556
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1556 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1556_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1556_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1556_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1556_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_60b1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_60b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_60b1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_60b1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_60b1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_60b1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2928_c7_71d1
opc_result_MUX_uxn_opcodes_h_l2928_c7_71d1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2928_c7_71d1_cond,
opc_result_MUX_uxn_opcodes_h_l2928_c7_71d1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2928_c7_71d1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2928_c7_71d1_return_output);

-- ldz2_uxn_opcodes_h_l2928_c40_fbce
ldz2_uxn_opcodes_h_l2928_c40_fbce : entity work.ldz2_0CLK_2ab048cc port map (
clk,
ldz2_uxn_opcodes_h_l2928_c40_fbce_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l2928_c40_fbce_phase,
ldz2_uxn_opcodes_h_l2928_c40_fbce_ins,
ldz2_uxn_opcodes_h_l2928_c40_fbce_previous_stack_read,
ldz2_uxn_opcodes_h_l2928_c40_fbce_previous_ram_read,
ldz2_uxn_opcodes_h_l2928_c40_fbce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e2
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e2_left,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e2_right,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4489
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4489 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4489_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4489_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4489_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4489_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b88d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b88d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b88d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b88d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b88d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b88d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2929_c7_60b1
opc_result_MUX_uxn_opcodes_h_l2929_c7_60b1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2929_c7_60b1_cond,
opc_result_MUX_uxn_opcodes_h_l2929_c7_60b1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2929_c7_60b1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2929_c7_60b1_return_output);

-- stz_uxn_opcodes_h_l2929_c40_a37c
stz_uxn_opcodes_h_l2929_c40_a37c : entity work.stz_0CLK_bacf6a1d port map (
clk,
stz_uxn_opcodes_h_l2929_c40_a37c_CLOCK_ENABLE,
stz_uxn_opcodes_h_l2929_c40_a37c_phase,
stz_uxn_opcodes_h_l2929_c40_a37c_ins,
stz_uxn_opcodes_h_l2929_c40_a37c_previous_stack_read,
stz_uxn_opcodes_h_l2929_c40_a37c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2930_c11_de9c
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_de9c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_de9c_left,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_de9c_right,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_de9c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_428f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_428f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_428f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_428f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_428f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_428f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_729b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_729b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_729b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_729b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_729b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_729b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2930_c7_b88d
opc_result_MUX_uxn_opcodes_h_l2930_c7_b88d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2930_c7_b88d_cond,
opc_result_MUX_uxn_opcodes_h_l2930_c7_b88d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2930_c7_b88d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2930_c7_b88d_return_output);

-- stz2_uxn_opcodes_h_l2930_c40_2f77
stz2_uxn_opcodes_h_l2930_c40_2f77 : entity work.stz2_0CLK_75b4bee3 port map (
clk,
stz2_uxn_opcodes_h_l2930_c40_2f77_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l2930_c40_2f77_phase,
stz2_uxn_opcodes_h_l2930_c40_2f77_ins,
stz2_uxn_opcodes_h_l2930_c40_2f77_previous_stack_read,
stz2_uxn_opcodes_h_l2930_c40_2f77_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2931_c11_ca75
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_ca75 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_ca75_left,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_ca75_right,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_ca75_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_0e50
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_0e50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_0e50_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_0e50_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_0e50_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_0e50_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_307d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_307d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_307d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_307d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_307d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_307d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2931_c7_729b
opc_result_MUX_uxn_opcodes_h_l2931_c7_729b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2931_c7_729b_cond,
opc_result_MUX_uxn_opcodes_h_l2931_c7_729b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2931_c7_729b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2931_c7_729b_return_output);

-- ldr_uxn_opcodes_h_l2931_c40_c27d
ldr_uxn_opcodes_h_l2931_c40_c27d : entity work.ldr_0CLK_f74745d5 port map (
clk,
ldr_uxn_opcodes_h_l2931_c40_c27d_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l2931_c40_c27d_phase,
ldr_uxn_opcodes_h_l2931_c40_c27d_ins,
ldr_uxn_opcodes_h_l2931_c40_c27d_pc,
ldr_uxn_opcodes_h_l2931_c40_c27d_previous_stack_read,
ldr_uxn_opcodes_h_l2931_c40_c27d_previous_ram_read,
ldr_uxn_opcodes_h_l2931_c40_c27d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3006
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3006 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3006_left,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3006_right,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3006_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_6c24
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_6c24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_6c24_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_6c24_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_6c24_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_6c24_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_0745
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_0745 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_0745_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_0745_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_0745_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_0745_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2932_c7_307d
opc_result_MUX_uxn_opcodes_h_l2932_c7_307d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2932_c7_307d_cond,
opc_result_MUX_uxn_opcodes_h_l2932_c7_307d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2932_c7_307d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2932_c7_307d_return_output);

-- ldr2_uxn_opcodes_h_l2932_c40_8e0e
ldr2_uxn_opcodes_h_l2932_c40_8e0e : entity work.ldr2_0CLK_b7cf2331 port map (
clk,
ldr2_uxn_opcodes_h_l2932_c40_8e0e_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l2932_c40_8e0e_phase,
ldr2_uxn_opcodes_h_l2932_c40_8e0e_ins,
ldr2_uxn_opcodes_h_l2932_c40_8e0e_pc,
ldr2_uxn_opcodes_h_l2932_c40_8e0e_previous_stack_read,
ldr2_uxn_opcodes_h_l2932_c40_8e0e_previous_ram_read,
ldr2_uxn_opcodes_h_l2932_c40_8e0e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2933_c11_7980
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_7980 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_7980_left,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_7980_right,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_7980_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_eabd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_eabd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_eabd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_eabd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_eabd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_eabd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_0585
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_0585 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_0585_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_0585_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_0585_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_0585_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2933_c7_0745
opc_result_MUX_uxn_opcodes_h_l2933_c7_0745 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2933_c7_0745_cond,
opc_result_MUX_uxn_opcodes_h_l2933_c7_0745_iftrue,
opc_result_MUX_uxn_opcodes_h_l2933_c7_0745_iffalse,
opc_result_MUX_uxn_opcodes_h_l2933_c7_0745_return_output);

-- str1_uxn_opcodes_h_l2933_c40_ac2f
str1_uxn_opcodes_h_l2933_c40_ac2f : entity work.str1_0CLK_85d5529e port map (
clk,
str1_uxn_opcodes_h_l2933_c40_ac2f_CLOCK_ENABLE,
str1_uxn_opcodes_h_l2933_c40_ac2f_phase,
str1_uxn_opcodes_h_l2933_c40_ac2f_ins,
str1_uxn_opcodes_h_l2933_c40_ac2f_pc,
str1_uxn_opcodes_h_l2933_c40_ac2f_previous_stack_read,
str1_uxn_opcodes_h_l2933_c40_ac2f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c3b4
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c3b4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c3b4_left,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c3b4_right,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c3b4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_04d4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_04d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_04d4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_04d4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_04d4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_04d4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8064
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8064 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8064_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8064_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8064_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8064_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2934_c7_0585
opc_result_MUX_uxn_opcodes_h_l2934_c7_0585 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2934_c7_0585_cond,
opc_result_MUX_uxn_opcodes_h_l2934_c7_0585_iftrue,
opc_result_MUX_uxn_opcodes_h_l2934_c7_0585_iffalse,
opc_result_MUX_uxn_opcodes_h_l2934_c7_0585_return_output);

-- str2_uxn_opcodes_h_l2934_c40_521d
str2_uxn_opcodes_h_l2934_c40_521d : entity work.str2_0CLK_75b4bee3 port map (
clk,
str2_uxn_opcodes_h_l2934_c40_521d_CLOCK_ENABLE,
str2_uxn_opcodes_h_l2934_c40_521d_phase,
str2_uxn_opcodes_h_l2934_c40_521d_ins,
str2_uxn_opcodes_h_l2934_c40_521d_pc,
str2_uxn_opcodes_h_l2934_c40_521d_previous_stack_read,
str2_uxn_opcodes_h_l2934_c40_521d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2935_c11_651b
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_651b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_651b_left,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_651b_right,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_651b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3c43
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3c43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3c43_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3c43_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3c43_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3c43_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0b25
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0b25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0b25_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0b25_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0b25_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0b25_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2935_c7_8064
opc_result_MUX_uxn_opcodes_h_l2935_c7_8064 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2935_c7_8064_cond,
opc_result_MUX_uxn_opcodes_h_l2935_c7_8064_iftrue,
opc_result_MUX_uxn_opcodes_h_l2935_c7_8064_iffalse,
opc_result_MUX_uxn_opcodes_h_l2935_c7_8064_return_output);

-- lda_uxn_opcodes_h_l2935_c40_b1b2
lda_uxn_opcodes_h_l2935_c40_b1b2 : entity work.lda_0CLK_c634cda8 port map (
clk,
lda_uxn_opcodes_h_l2935_c40_b1b2_CLOCK_ENABLE,
lda_uxn_opcodes_h_l2935_c40_b1b2_phase,
lda_uxn_opcodes_h_l2935_c40_b1b2_ins,
lda_uxn_opcodes_h_l2935_c40_b1b2_previous_stack_read,
lda_uxn_opcodes_h_l2935_c40_b1b2_previous_ram_read,
lda_uxn_opcodes_h_l2935_c40_b1b2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2936_c11_445d
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_445d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_445d_left,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_445d_right,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_445d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_f81c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_f81c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_f81c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_f81c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_f81c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_f81c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3786
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3786 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3786_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3786_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3786_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3786_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2936_c7_0b25
opc_result_MUX_uxn_opcodes_h_l2936_c7_0b25 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2936_c7_0b25_cond,
opc_result_MUX_uxn_opcodes_h_l2936_c7_0b25_iftrue,
opc_result_MUX_uxn_opcodes_h_l2936_c7_0b25_iffalse,
opc_result_MUX_uxn_opcodes_h_l2936_c7_0b25_return_output);

-- lda2_uxn_opcodes_h_l2936_c40_3a81
lda2_uxn_opcodes_h_l2936_c40_3a81 : entity work.lda2_0CLK_19339e1d port map (
clk,
lda2_uxn_opcodes_h_l2936_c40_3a81_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l2936_c40_3a81_phase,
lda2_uxn_opcodes_h_l2936_c40_3a81_ins,
lda2_uxn_opcodes_h_l2936_c40_3a81_previous_stack_read,
lda2_uxn_opcodes_h_l2936_c40_3a81_previous_ram_read,
lda2_uxn_opcodes_h_l2936_c40_3a81_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2937_c11_d7a2
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_d7a2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_d7a2_left,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_d7a2_right,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_d7a2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_ab1c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_ab1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_ab1c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_ab1c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_ab1c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_ab1c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4cb0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4cb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4cb0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4cb0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4cb0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4cb0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2937_c7_3786
opc_result_MUX_uxn_opcodes_h_l2937_c7_3786 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2937_c7_3786_cond,
opc_result_MUX_uxn_opcodes_h_l2937_c7_3786_iftrue,
opc_result_MUX_uxn_opcodes_h_l2937_c7_3786_iffalse,
opc_result_MUX_uxn_opcodes_h_l2937_c7_3786_return_output);

-- sta_uxn_opcodes_h_l2937_c40_e0fa
sta_uxn_opcodes_h_l2937_c40_e0fa : entity work.sta_0CLK_bce25fe8 port map (
clk,
sta_uxn_opcodes_h_l2937_c40_e0fa_CLOCK_ENABLE,
sta_uxn_opcodes_h_l2937_c40_e0fa_phase,
sta_uxn_opcodes_h_l2937_c40_e0fa_ins,
sta_uxn_opcodes_h_l2937_c40_e0fa_previous_stack_read,
sta_uxn_opcodes_h_l2937_c40_e0fa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7f56
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7f56 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7f56_left,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7f56_right,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7f56_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_82f2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_82f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_82f2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_82f2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_82f2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_82f2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4841
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4841 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4841_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4841_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4841_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4841_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2938_c7_4cb0
opc_result_MUX_uxn_opcodes_h_l2938_c7_4cb0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2938_c7_4cb0_cond,
opc_result_MUX_uxn_opcodes_h_l2938_c7_4cb0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2938_c7_4cb0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2938_c7_4cb0_return_output);

-- sta2_uxn_opcodes_h_l2938_c40_7ae4
sta2_uxn_opcodes_h_l2938_c40_7ae4 : entity work.sta2_0CLK_4674db74 port map (
clk,
sta2_uxn_opcodes_h_l2938_c40_7ae4_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l2938_c40_7ae4_phase,
sta2_uxn_opcodes_h_l2938_c40_7ae4_ins,
sta2_uxn_opcodes_h_l2938_c40_7ae4_previous_stack_read,
sta2_uxn_opcodes_h_l2938_c40_7ae4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3a3a
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3a3a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3a3a_left,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3a3a_right,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3a3a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2a1d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2a1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2a1d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2a1d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2a1d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2a1d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_7c8b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_7c8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_7c8b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_7c8b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_7c8b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_7c8b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2939_c7_4841
opc_result_MUX_uxn_opcodes_h_l2939_c7_4841 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2939_c7_4841_cond,
opc_result_MUX_uxn_opcodes_h_l2939_c7_4841_iftrue,
opc_result_MUX_uxn_opcodes_h_l2939_c7_4841_iffalse,
opc_result_MUX_uxn_opcodes_h_l2939_c7_4841_return_output);

-- dei_uxn_opcodes_h_l2939_c40_610a
dei_uxn_opcodes_h_l2939_c40_610a : entity work.dei_0CLK_9bcaee2f port map (
clk,
dei_uxn_opcodes_h_l2939_c40_610a_CLOCK_ENABLE,
dei_uxn_opcodes_h_l2939_c40_610a_phase,
dei_uxn_opcodes_h_l2939_c40_610a_ins,
dei_uxn_opcodes_h_l2939_c40_610a_previous_stack_read,
dei_uxn_opcodes_h_l2939_c40_610a_previous_device_ram_read,
dei_uxn_opcodes_h_l2939_c40_610a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2940_c11_9834
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_9834 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_9834_left,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_9834_right,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_9834_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_5e1b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_5e1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_5e1b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_5e1b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_5e1b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_5e1b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_636d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_636d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_636d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_636d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_636d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_636d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2940_c7_7c8b
opc_result_MUX_uxn_opcodes_h_l2940_c7_7c8b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2940_c7_7c8b_cond,
opc_result_MUX_uxn_opcodes_h_l2940_c7_7c8b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2940_c7_7c8b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2940_c7_7c8b_return_output);

-- dei2_uxn_opcodes_h_l2940_c40_47ff
dei2_uxn_opcodes_h_l2940_c40_47ff : entity work.dei2_0CLK_f0f27b91 port map (
clk,
dei2_uxn_opcodes_h_l2940_c40_47ff_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l2940_c40_47ff_phase,
dei2_uxn_opcodes_h_l2940_c40_47ff_ins,
dei2_uxn_opcodes_h_l2940_c40_47ff_previous_stack_read,
dei2_uxn_opcodes_h_l2940_c40_47ff_previous_device_ram_read,
dei2_uxn_opcodes_h_l2940_c40_47ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2941_c11_68c3
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_68c3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_68c3_left,
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_68c3_right,
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_68c3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_518d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_518d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_518d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_518d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_518d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_518d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4f24
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4f24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4f24_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4f24_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4f24_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4f24_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2941_c7_636d
opc_result_MUX_uxn_opcodes_h_l2941_c7_636d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2941_c7_636d_cond,
opc_result_MUX_uxn_opcodes_h_l2941_c7_636d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2941_c7_636d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2941_c7_636d_return_output);

-- deo_uxn_opcodes_h_l2941_c40_40b4
deo_uxn_opcodes_h_l2941_c40_40b4 : entity work.deo_0CLK_198030a2 port map (
clk,
deo_uxn_opcodes_h_l2941_c40_40b4_CLOCK_ENABLE,
deo_uxn_opcodes_h_l2941_c40_40b4_phase,
deo_uxn_opcodes_h_l2941_c40_40b4_ins,
deo_uxn_opcodes_h_l2941_c40_40b4_previous_stack_read,
deo_uxn_opcodes_h_l2941_c40_40b4_previous_device_ram_read,
deo_uxn_opcodes_h_l2941_c40_40b4_previous_ram_read,
deo_uxn_opcodes_h_l2941_c40_40b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1ed2
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1ed2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1ed2_left,
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1ed2_right,
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1ed2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_8823
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_8823 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_8823_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_8823_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_8823_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_8823_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_10e6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_10e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_10e6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_10e6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_10e6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_10e6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2942_c7_4f24
opc_result_MUX_uxn_opcodes_h_l2942_c7_4f24 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2942_c7_4f24_cond,
opc_result_MUX_uxn_opcodes_h_l2942_c7_4f24_iftrue,
opc_result_MUX_uxn_opcodes_h_l2942_c7_4f24_iffalse,
opc_result_MUX_uxn_opcodes_h_l2942_c7_4f24_return_output);

-- deo2_uxn_opcodes_h_l2942_c40_b92c
deo2_uxn_opcodes_h_l2942_c40_b92c : entity work.deo2_0CLK_563c42d4 port map (
clk,
deo2_uxn_opcodes_h_l2942_c40_b92c_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l2942_c40_b92c_phase,
deo2_uxn_opcodes_h_l2942_c40_b92c_ins,
deo2_uxn_opcodes_h_l2942_c40_b92c_previous_stack_read,
deo2_uxn_opcodes_h_l2942_c40_b92c_previous_device_ram_read,
deo2_uxn_opcodes_h_l2942_c40_b92c_previous_ram_read,
deo2_uxn_opcodes_h_l2942_c40_b92c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2357
BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2357 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2357_left,
BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2357_right,
BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2357_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_98d5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_98d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_98d5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_98d5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_98d5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_98d5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_9702
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_9702 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_9702_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_9702_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_9702_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_9702_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2943_c7_10e6
opc_result_MUX_uxn_opcodes_h_l2943_c7_10e6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2943_c7_10e6_cond,
opc_result_MUX_uxn_opcodes_h_l2943_c7_10e6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2943_c7_10e6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2943_c7_10e6_return_output);

-- add_uxn_opcodes_h_l2943_c40_f784
add_uxn_opcodes_h_l2943_c40_f784 : entity work.add_0CLK_64d180f1 port map (
clk,
add_uxn_opcodes_h_l2943_c40_f784_CLOCK_ENABLE,
add_uxn_opcodes_h_l2943_c40_f784_phase,
add_uxn_opcodes_h_l2943_c40_f784_ins,
add_uxn_opcodes_h_l2943_c40_f784_previous_stack_read,
add_uxn_opcodes_h_l2943_c40_f784_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2944_c11_149b
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_149b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_149b_left,
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_149b_right,
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_149b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_6b48
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_6b48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_6b48_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_6b48_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_6b48_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_6b48_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_875e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_875e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_875e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_875e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_875e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_875e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2944_c7_9702
opc_result_MUX_uxn_opcodes_h_l2944_c7_9702 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2944_c7_9702_cond,
opc_result_MUX_uxn_opcodes_h_l2944_c7_9702_iftrue,
opc_result_MUX_uxn_opcodes_h_l2944_c7_9702_iffalse,
opc_result_MUX_uxn_opcodes_h_l2944_c7_9702_return_output);

-- add2_uxn_opcodes_h_l2944_c40_01ed
add2_uxn_opcodes_h_l2944_c40_01ed : entity work.add2_0CLK_50b92fe2 port map (
clk,
add2_uxn_opcodes_h_l2944_c40_01ed_CLOCK_ENABLE,
add2_uxn_opcodes_h_l2944_c40_01ed_phase,
add2_uxn_opcodes_h_l2944_c40_01ed_ins,
add2_uxn_opcodes_h_l2944_c40_01ed_previous_stack_read,
add2_uxn_opcodes_h_l2944_c40_01ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2945_c11_14bf
BIN_OP_EQ_uxn_opcodes_h_l2945_c11_14bf : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2945_c11_14bf_left,
BIN_OP_EQ_uxn_opcodes_h_l2945_c11_14bf_right,
BIN_OP_EQ_uxn_opcodes_h_l2945_c11_14bf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_2ac1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_2ac1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_2ac1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_2ac1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_2ac1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_2ac1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_7106
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_7106 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_7106_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_7106_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_7106_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_7106_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2945_c7_875e
opc_result_MUX_uxn_opcodes_h_l2945_c7_875e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2945_c7_875e_cond,
opc_result_MUX_uxn_opcodes_h_l2945_c7_875e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2945_c7_875e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2945_c7_875e_return_output);

-- sub_uxn_opcodes_h_l2945_c40_26e9
sub_uxn_opcodes_h_l2945_c40_26e9 : entity work.sub_0CLK_64d180f1 port map (
clk,
sub_uxn_opcodes_h_l2945_c40_26e9_CLOCK_ENABLE,
sub_uxn_opcodes_h_l2945_c40_26e9_phase,
sub_uxn_opcodes_h_l2945_c40_26e9_ins,
sub_uxn_opcodes_h_l2945_c40_26e9_previous_stack_read,
sub_uxn_opcodes_h_l2945_c40_26e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2946_c11_3f68
BIN_OP_EQ_uxn_opcodes_h_l2946_c11_3f68 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2946_c11_3f68_left,
BIN_OP_EQ_uxn_opcodes_h_l2946_c11_3f68_right,
BIN_OP_EQ_uxn_opcodes_h_l2946_c11_3f68_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_e34d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_e34d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_e34d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_e34d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_e34d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_e34d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_8f5d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_8f5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_8f5d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_8f5d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_8f5d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_8f5d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2946_c7_7106
opc_result_MUX_uxn_opcodes_h_l2946_c7_7106 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2946_c7_7106_cond,
opc_result_MUX_uxn_opcodes_h_l2946_c7_7106_iftrue,
opc_result_MUX_uxn_opcodes_h_l2946_c7_7106_iffalse,
opc_result_MUX_uxn_opcodes_h_l2946_c7_7106_return_output);

-- sub2_uxn_opcodes_h_l2946_c40_0ad8
sub2_uxn_opcodes_h_l2946_c40_0ad8 : entity work.sub2_0CLK_50b92fe2 port map (
clk,
sub2_uxn_opcodes_h_l2946_c40_0ad8_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l2946_c40_0ad8_phase,
sub2_uxn_opcodes_h_l2946_c40_0ad8_ins,
sub2_uxn_opcodes_h_l2946_c40_0ad8_previous_stack_read,
sub2_uxn_opcodes_h_l2946_c40_0ad8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2947_c11_6672
BIN_OP_EQ_uxn_opcodes_h_l2947_c11_6672 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2947_c11_6672_left,
BIN_OP_EQ_uxn_opcodes_h_l2947_c11_6672_right,
BIN_OP_EQ_uxn_opcodes_h_l2947_c11_6672_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_9eee
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_9eee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_9eee_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_9eee_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_9eee_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_9eee_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_e52a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_e52a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_e52a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_e52a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_e52a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_e52a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2947_c7_8f5d
opc_result_MUX_uxn_opcodes_h_l2947_c7_8f5d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2947_c7_8f5d_cond,
opc_result_MUX_uxn_opcodes_h_l2947_c7_8f5d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2947_c7_8f5d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2947_c7_8f5d_return_output);

-- mul_uxn_opcodes_h_l2947_c40_459f
mul_uxn_opcodes_h_l2947_c40_459f : entity work.mul_0CLK_64d180f1 port map (
clk,
mul_uxn_opcodes_h_l2947_c40_459f_CLOCK_ENABLE,
mul_uxn_opcodes_h_l2947_c40_459f_phase,
mul_uxn_opcodes_h_l2947_c40_459f_ins,
mul_uxn_opcodes_h_l2947_c40_459f_previous_stack_read,
mul_uxn_opcodes_h_l2947_c40_459f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2948_c11_f3db
BIN_OP_EQ_uxn_opcodes_h_l2948_c11_f3db : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2948_c11_f3db_left,
BIN_OP_EQ_uxn_opcodes_h_l2948_c11_f3db_right,
BIN_OP_EQ_uxn_opcodes_h_l2948_c11_f3db_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_cbbb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_cbbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_cbbb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_cbbb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_cbbb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_cbbb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_1fe8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_1fe8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_1fe8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_1fe8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_1fe8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_1fe8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2948_c7_e52a
opc_result_MUX_uxn_opcodes_h_l2948_c7_e52a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2948_c7_e52a_cond,
opc_result_MUX_uxn_opcodes_h_l2948_c7_e52a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2948_c7_e52a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2948_c7_e52a_return_output);

-- mul2_uxn_opcodes_h_l2948_c40_7792
mul2_uxn_opcodes_h_l2948_c40_7792 : entity work.mul2_0CLK_50b92fe2 port map (
clk,
mul2_uxn_opcodes_h_l2948_c40_7792_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l2948_c40_7792_phase,
mul2_uxn_opcodes_h_l2948_c40_7792_ins,
mul2_uxn_opcodes_h_l2948_c40_7792_previous_stack_read,
mul2_uxn_opcodes_h_l2948_c40_7792_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2949_c11_ca08
BIN_OP_EQ_uxn_opcodes_h_l2949_c11_ca08 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2949_c11_ca08_left,
BIN_OP_EQ_uxn_opcodes_h_l2949_c11_ca08_right,
BIN_OP_EQ_uxn_opcodes_h_l2949_c11_ca08_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2b07
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2b07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2b07_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2b07_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2b07_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2b07_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_dd18
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_dd18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_dd18_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_dd18_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_dd18_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_dd18_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2949_c7_1fe8
opc_result_MUX_uxn_opcodes_h_l2949_c7_1fe8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2949_c7_1fe8_cond,
opc_result_MUX_uxn_opcodes_h_l2949_c7_1fe8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2949_c7_1fe8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2949_c7_1fe8_return_output);

-- div_uxn_opcodes_h_l2949_c40_6d2e
div_uxn_opcodes_h_l2949_c40_6d2e : entity work.div_0CLK_09f6f009 port map (
clk,
div_uxn_opcodes_h_l2949_c40_6d2e_CLOCK_ENABLE,
div_uxn_opcodes_h_l2949_c40_6d2e_phase,
div_uxn_opcodes_h_l2949_c40_6d2e_ins,
div_uxn_opcodes_h_l2949_c40_6d2e_previous_stack_read,
div_uxn_opcodes_h_l2949_c40_6d2e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4ad2
BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4ad2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4ad2_left,
BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4ad2_right,
BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4ad2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_5f61
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_5f61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_5f61_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_5f61_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_5f61_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_5f61_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_56b7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_56b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_56b7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_56b7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_56b7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_56b7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2950_c7_dd18
opc_result_MUX_uxn_opcodes_h_l2950_c7_dd18 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2950_c7_dd18_cond,
opc_result_MUX_uxn_opcodes_h_l2950_c7_dd18_iftrue,
opc_result_MUX_uxn_opcodes_h_l2950_c7_dd18_iffalse,
opc_result_MUX_uxn_opcodes_h_l2950_c7_dd18_return_output);

-- div2_uxn_opcodes_h_l2950_c40_e5d7
div2_uxn_opcodes_h_l2950_c40_e5d7 : entity work.div2_0CLK_7cf9dac2 port map (
clk,
div2_uxn_opcodes_h_l2950_c40_e5d7_CLOCK_ENABLE,
div2_uxn_opcodes_h_l2950_c40_e5d7_phase,
div2_uxn_opcodes_h_l2950_c40_e5d7_ins,
div2_uxn_opcodes_h_l2950_c40_e5d7_previous_stack_read,
div2_uxn_opcodes_h_l2950_c40_e5d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2951_c11_a168
BIN_OP_EQ_uxn_opcodes_h_l2951_c11_a168 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2951_c11_a168_left,
BIN_OP_EQ_uxn_opcodes_h_l2951_c11_a168_right,
BIN_OP_EQ_uxn_opcodes_h_l2951_c11_a168_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_acd2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_acd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_acd2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_acd2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_acd2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_acd2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_946b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_946b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_946b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_946b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_946b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_946b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2951_c7_56b7
opc_result_MUX_uxn_opcodes_h_l2951_c7_56b7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2951_c7_56b7_cond,
opc_result_MUX_uxn_opcodes_h_l2951_c7_56b7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2951_c7_56b7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2951_c7_56b7_return_output);

-- and_uxn_opcodes_h_l2951_c40_0680
and_uxn_opcodes_h_l2951_c40_0680 : entity work.and_0CLK_64d180f1 port map (
clk,
and_uxn_opcodes_h_l2951_c40_0680_CLOCK_ENABLE,
and_uxn_opcodes_h_l2951_c40_0680_phase,
and_uxn_opcodes_h_l2951_c40_0680_ins,
and_uxn_opcodes_h_l2951_c40_0680_previous_stack_read,
and_uxn_opcodes_h_l2951_c40_0680_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e60b
BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e60b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e60b_left,
BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e60b_right,
BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e60b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_a391
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_a391 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_a391_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_a391_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_a391_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_a391_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_04ec
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_04ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_04ec_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_04ec_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_04ec_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_04ec_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2952_c7_946b
opc_result_MUX_uxn_opcodes_h_l2952_c7_946b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2952_c7_946b_cond,
opc_result_MUX_uxn_opcodes_h_l2952_c7_946b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2952_c7_946b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2952_c7_946b_return_output);

-- and2_uxn_opcodes_h_l2952_c40_9546
and2_uxn_opcodes_h_l2952_c40_9546 : entity work.and2_0CLK_50b92fe2 port map (
clk,
and2_uxn_opcodes_h_l2952_c40_9546_CLOCK_ENABLE,
and2_uxn_opcodes_h_l2952_c40_9546_phase,
and2_uxn_opcodes_h_l2952_c40_9546_ins,
and2_uxn_opcodes_h_l2952_c40_9546_previous_stack_read,
and2_uxn_opcodes_h_l2952_c40_9546_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2953_c11_6499
BIN_OP_EQ_uxn_opcodes_h_l2953_c11_6499 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2953_c11_6499_left,
BIN_OP_EQ_uxn_opcodes_h_l2953_c11_6499_right,
BIN_OP_EQ_uxn_opcodes_h_l2953_c11_6499_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_7ec8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_7ec8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_7ec8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_7ec8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_7ec8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_7ec8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_8594
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_8594 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_8594_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_8594_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_8594_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_8594_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2953_c7_04ec
opc_result_MUX_uxn_opcodes_h_l2953_c7_04ec : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2953_c7_04ec_cond,
opc_result_MUX_uxn_opcodes_h_l2953_c7_04ec_iftrue,
opc_result_MUX_uxn_opcodes_h_l2953_c7_04ec_iffalse,
opc_result_MUX_uxn_opcodes_h_l2953_c7_04ec_return_output);

-- ora_uxn_opcodes_h_l2953_c40_d394
ora_uxn_opcodes_h_l2953_c40_d394 : entity work.ora_0CLK_64d180f1 port map (
clk,
ora_uxn_opcodes_h_l2953_c40_d394_CLOCK_ENABLE,
ora_uxn_opcodes_h_l2953_c40_d394_phase,
ora_uxn_opcodes_h_l2953_c40_d394_ins,
ora_uxn_opcodes_h_l2953_c40_d394_previous_stack_read,
ora_uxn_opcodes_h_l2953_c40_d394_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2954_c11_9e75
BIN_OP_EQ_uxn_opcodes_h_l2954_c11_9e75 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2954_c11_9e75_left,
BIN_OP_EQ_uxn_opcodes_h_l2954_c11_9e75_right,
BIN_OP_EQ_uxn_opcodes_h_l2954_c11_9e75_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_95b1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_95b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_95b1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_95b1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_95b1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_95b1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ab66
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ab66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ab66_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ab66_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ab66_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ab66_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2954_c7_8594
opc_result_MUX_uxn_opcodes_h_l2954_c7_8594 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2954_c7_8594_cond,
opc_result_MUX_uxn_opcodes_h_l2954_c7_8594_iftrue,
opc_result_MUX_uxn_opcodes_h_l2954_c7_8594_iffalse,
opc_result_MUX_uxn_opcodes_h_l2954_c7_8594_return_output);

-- ora2_uxn_opcodes_h_l2954_c40_3c0e
ora2_uxn_opcodes_h_l2954_c40_3c0e : entity work.ora2_0CLK_50b92fe2 port map (
clk,
ora2_uxn_opcodes_h_l2954_c40_3c0e_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l2954_c40_3c0e_phase,
ora2_uxn_opcodes_h_l2954_c40_3c0e_ins,
ora2_uxn_opcodes_h_l2954_c40_3c0e_previous_stack_read,
ora2_uxn_opcodes_h_l2954_c40_3c0e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2955_c11_e2e9
BIN_OP_EQ_uxn_opcodes_h_l2955_c11_e2e9 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2955_c11_e2e9_left,
BIN_OP_EQ_uxn_opcodes_h_l2955_c11_e2e9_right,
BIN_OP_EQ_uxn_opcodes_h_l2955_c11_e2e9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_14ae
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_14ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_14ae_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_14ae_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_14ae_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_14ae_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_904a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_904a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_904a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_904a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_904a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_904a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2955_c7_ab66
opc_result_MUX_uxn_opcodes_h_l2955_c7_ab66 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2955_c7_ab66_cond,
opc_result_MUX_uxn_opcodes_h_l2955_c7_ab66_iftrue,
opc_result_MUX_uxn_opcodes_h_l2955_c7_ab66_iffalse,
opc_result_MUX_uxn_opcodes_h_l2955_c7_ab66_return_output);

-- eor_uxn_opcodes_h_l2955_c40_8300
eor_uxn_opcodes_h_l2955_c40_8300 : entity work.eor_0CLK_64d180f1 port map (
clk,
eor_uxn_opcodes_h_l2955_c40_8300_CLOCK_ENABLE,
eor_uxn_opcodes_h_l2955_c40_8300_phase,
eor_uxn_opcodes_h_l2955_c40_8300_ins,
eor_uxn_opcodes_h_l2955_c40_8300_previous_stack_read,
eor_uxn_opcodes_h_l2955_c40_8300_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2956_c11_fb6d
BIN_OP_EQ_uxn_opcodes_h_l2956_c11_fb6d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2956_c11_fb6d_left,
BIN_OP_EQ_uxn_opcodes_h_l2956_c11_fb6d_right,
BIN_OP_EQ_uxn_opcodes_h_l2956_c11_fb6d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_faad
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_faad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_faad_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_faad_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_faad_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_faad_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_386e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_386e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_386e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_386e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_386e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_386e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2956_c7_904a
opc_result_MUX_uxn_opcodes_h_l2956_c7_904a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2956_c7_904a_cond,
opc_result_MUX_uxn_opcodes_h_l2956_c7_904a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2956_c7_904a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2956_c7_904a_return_output);

-- eor2_uxn_opcodes_h_l2956_c40_2888
eor2_uxn_opcodes_h_l2956_c40_2888 : entity work.eor2_0CLK_50b92fe2 port map (
clk,
eor2_uxn_opcodes_h_l2956_c40_2888_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l2956_c40_2888_phase,
eor2_uxn_opcodes_h_l2956_c40_2888_ins,
eor2_uxn_opcodes_h_l2956_c40_2888_previous_stack_read,
eor2_uxn_opcodes_h_l2956_c40_2888_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e071
BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e071 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e071_left,
BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e071_right,
BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e071_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_bcb1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_bcb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_bcb1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_bcb1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_bcb1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_bcb1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_b055
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_b055 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_b055_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_b055_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_b055_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_b055_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2957_c7_386e
opc_result_MUX_uxn_opcodes_h_l2957_c7_386e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2957_c7_386e_cond,
opc_result_MUX_uxn_opcodes_h_l2957_c7_386e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2957_c7_386e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2957_c7_386e_return_output);

-- sft_uxn_opcodes_h_l2957_c40_2dbb
sft_uxn_opcodes_h_l2957_c40_2dbb : entity work.sft_0CLK_46cced44 port map (
clk,
sft_uxn_opcodes_h_l2957_c40_2dbb_CLOCK_ENABLE,
sft_uxn_opcodes_h_l2957_c40_2dbb_phase,
sft_uxn_opcodes_h_l2957_c40_2dbb_ins,
sft_uxn_opcodes_h_l2957_c40_2dbb_previous_stack_read,
sft_uxn_opcodes_h_l2957_c40_2dbb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2958_c11_4d83
BIN_OP_EQ_uxn_opcodes_h_l2958_c11_4d83 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2958_c11_4d83_left,
BIN_OP_EQ_uxn_opcodes_h_l2958_c11_4d83_right,
BIN_OP_EQ_uxn_opcodes_h_l2958_c11_4d83_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_7a91
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_7a91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_7a91_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_7a91_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_7a91_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_7a91_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2958_c7_b055
opc_result_MUX_uxn_opcodes_h_l2958_c7_b055 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2958_c7_b055_cond,
opc_result_MUX_uxn_opcodes_h_l2958_c7_b055_iftrue,
opc_result_MUX_uxn_opcodes_h_l2958_c7_b055_iffalse,
opc_result_MUX_uxn_opcodes_h_l2958_c7_b055_return_output);

-- sft2_uxn_opcodes_h_l2958_c40_d4b6
sft2_uxn_opcodes_h_l2958_c40_d4b6 : entity work.sft2_0CLK_e8b37bfc port map (
clk,
sft2_uxn_opcodes_h_l2958_c40_d4b6_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l2958_c40_d4b6_phase,
sft2_uxn_opcodes_h_l2958_c40_d4b6_ins,
sft2_uxn_opcodes_h_l2958_c40_d4b6_previous_stack_read,
sft2_uxn_opcodes_h_l2958_c40_d4b6_return_output);

-- CONST_SR_6_uxn_opcodes_h_l2960_c16_fa0d
CONST_SR_6_uxn_opcodes_h_l2960_c16_fa0d : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_opcodes_h_l2960_c16_fa0d_x,
CONST_SR_6_uxn_opcodes_h_l2960_c16_fa0d_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2961_c2_36f6
BIN_OP_XOR_uxn_opcodes_h_l2961_c2_36f6 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2961_c2_36f6_left,
BIN_OP_XOR_uxn_opcodes_h_l2961_c2_36f6_right,
BIN_OP_XOR_uxn_opcodes_h_l2961_c2_36f6_return_output);

-- sp0_MUX_uxn_opcodes_h_l2963_c2_dc35
sp0_MUX_uxn_opcodes_h_l2963_c2_dc35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2963_c2_dc35_cond,
sp0_MUX_uxn_opcodes_h_l2963_c2_dc35_iftrue,
sp0_MUX_uxn_opcodes_h_l2963_c2_dc35_iffalse,
sp0_MUX_uxn_opcodes_h_l2963_c2_dc35_return_output);

-- sp1_MUX_uxn_opcodes_h_l2963_c2_dc35
sp1_MUX_uxn_opcodes_h_l2963_c2_dc35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2963_c2_dc35_cond,
sp1_MUX_uxn_opcodes_h_l2963_c2_dc35_iftrue,
sp1_MUX_uxn_opcodes_h_l2963_c2_dc35_iffalse,
sp1_MUX_uxn_opcodes_h_l2963_c2_dc35_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2964_c3_271b
BIN_OP_PLUS_uxn_opcodes_h_l2964_c3_271b : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2964_c3_271b_left,
BIN_OP_PLUS_uxn_opcodes_h_l2964_c3_271b_right,
BIN_OP_PLUS_uxn_opcodes_h_l2964_c3_271b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2966_c3_e525
BIN_OP_PLUS_uxn_opcodes_h_l2966_c3_e525 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2966_c3_e525_left,
BIN_OP_PLUS_uxn_opcodes_h_l2966_c3_e525_right,
BIN_OP_PLUS_uxn_opcodes_h_l2966_c3_e525_return_output);

-- MUX_uxn_opcodes_h_l2969_c29_6723
MUX_uxn_opcodes_h_l2969_c29_6723 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2969_c29_6723_cond,
MUX_uxn_opcodes_h_l2969_c29_6723_iftrue,
MUX_uxn_opcodes_h_l2969_c29_6723_iffalse,
MUX_uxn_opcodes_h_l2969_c29_6723_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2969_c19_4410
BIN_OP_MINUS_uxn_opcodes_h_l2969_c19_4410 : entity work.BIN_OP_MINUS_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2969_c19_4410_left,
BIN_OP_MINUS_uxn_opcodes_h_l2969_c19_4410_right,
BIN_OP_MINUS_uxn_opcodes_h_l2969_c19_4410_return_output);

-- MUX_uxn_opcodes_h_l2970_c20_88cb
MUX_uxn_opcodes_h_l2970_c20_88cb : entity work.MUX_uint1_t_uint9_t_uint9_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2970_c20_88cb_cond,
MUX_uxn_opcodes_h_l2970_c20_88cb_iftrue,
MUX_uxn_opcodes_h_l2970_c20_88cb_iffalse,
MUX_uxn_opcodes_h_l2970_c20_88cb_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2970_c2_f2a4
BIN_OP_PLUS_uxn_opcodes_h_l2970_c2_f2a4 : entity work.BIN_OP_PLUS_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2970_c2_f2a4_left,
BIN_OP_PLUS_uxn_opcodes_h_l2970_c2_f2a4_right,
BIN_OP_PLUS_uxn_opcodes_h_l2970_c2_f2a4_return_output);

-- stack_ram_update_uxn_opcodes_h_l2972_c24_ab8e
stack_ram_update_uxn_opcodes_h_l2972_c24_ab8e : entity work.stack_ram_update_0CLK_23f04728 port map (
clk,
stack_ram_update_uxn_opcodes_h_l2972_c24_ab8e_CLOCK_ENABLE,
stack_ram_update_uxn_opcodes_h_l2972_c24_ab8e_stack_address,
stack_ram_update_uxn_opcodes_h_l2972_c24_ab8e_value,
stack_ram_update_uxn_opcodes_h_l2972_c24_ab8e_write_enable,
stack_ram_update_uxn_opcodes_h_l2972_c24_ab8e_return_output);



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
 BIN_OP_AND_uxn_opcodes_h_l2881_c14_9fde_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2882_c14_1402_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2882_c14_00ea_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l2882_c14_ca9d_return_output,
 BIN_OP_NEQ_uxn_opcodes_h_l2882_c14_eb9a_return_output,
 MUX_uxn_opcodes_h_l2882_c14_c701_return_output,
 MUX_uxn_opcodes_h_l2883_c8_0758_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2889_c6_90ad_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d402_return_output,
 is_wait_MUX_uxn_opcodes_h_l2889_c2_ac95_return_output,
 opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_return_output,
 brk_uxn_opcodes_h_l2889_c48_5e4f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1f15_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_8c3f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_27a4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2890_c7_d402_return_output,
 jci_uxn_opcodes_h_l2890_c40_ebae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2891_c11_daa3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ad00_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_07db_return_output,
 opc_result_MUX_uxn_opcodes_h_l2891_c7_27a4_return_output,
 jmi_uxn_opcodes_h_l2891_c40_12f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2892_c11_1305_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_46a9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_4a49_return_output,
 opc_result_MUX_uxn_opcodes_h_l2892_c7_07db_return_output,
 jsi_uxn_opcodes_h_l2892_c40_7ef2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4677_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_6ea9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_5457_return_output,
 opc_result_MUX_uxn_opcodes_h_l2893_c7_4a49_return_output,
 lit_uxn_opcodes_h_l2893_c40_ecac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2894_c11_fc3b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_9afe_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_d0e8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2894_c7_5457_return_output,
 lit2_uxn_opcodes_h_l2894_c40_fc02_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3368_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3b1a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_c86f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2895_c7_d0e8_return_output,
 lit_uxn_opcodes_h_l2895_c40_9062_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2896_c11_b543_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31b5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fee_return_output,
 opc_result_MUX_uxn_opcodes_h_l2896_c7_c86f_return_output,
 lit2_uxn_opcodes_h_l2896_c40_3ad0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2897_c11_2162_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_bf9d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f54c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2897_c7_6fee_return_output,
 inc_uxn_opcodes_h_l2897_c40_3f15_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2898_c11_5698_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_30da_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2b32_return_output,
 opc_result_MUX_uxn_opcodes_h_l2898_c7_f54c_return_output,
 inc2_uxn_opcodes_h_l2898_c40_e3a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2899_c11_8062_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7a01_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_89d5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2899_c7_2b32_return_output,
 pop_uxn_opcodes_h_l2899_c40_ce4a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2900_c11_55f1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_455f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4b8a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2900_c7_89d5_return_output,
 pop2_uxn_opcodes_h_l2900_c40_61c0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2901_c11_12b0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_5a28_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5ca8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2901_c7_4b8a_return_output,
 nip_uxn_opcodes_h_l2901_c40_c96b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8b2b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_0900_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_24d6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2902_c7_5ca8_return_output,
 nip2_uxn_opcodes_h_l2902_c40_7979_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2c9a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_aac9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1bfc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2903_c7_24d6_return_output,
 swp_uxn_opcodes_h_l2903_c40_183e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4448_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_83cd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fdd3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2904_c7_1bfc_return_output,
 swp2_uxn_opcodes_h_l2904_c40_4776_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2905_c11_eb86_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_431a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_30fd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2905_c7_fdd3_return_output,
 rot_uxn_opcodes_h_l2905_c40_5d08_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2906_c11_c483_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_4ecb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d53c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2906_c7_30fd_return_output,
 rot2_uxn_opcodes_h_l2906_c40_1572_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c602_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cf71_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_cd44_return_output,
 opc_result_MUX_uxn_opcodes_h_l2907_c7_d53c_return_output,
 dup_uxn_opcodes_h_l2907_c40_ffc6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2908_c11_55ee_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ca3e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e639_return_output,
 opc_result_MUX_uxn_opcodes_h_l2908_c7_cd44_return_output,
 dup2_uxn_opcodes_h_l2908_c40_c8fc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7b58_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0d5a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_94ca_return_output,
 opc_result_MUX_uxn_opcodes_h_l2909_c7_e639_return_output,
 ovr_uxn_opcodes_h_l2909_c40_28a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2910_c11_89cd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_895b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_cacc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2910_c7_94ca_return_output,
 ovr2_uxn_opcodes_h_l2910_c40_dde0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2911_c11_f85c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1ce9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_8f7e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2911_c7_cacc_return_output,
 equ_uxn_opcodes_h_l2911_c40_edb9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2912_c11_52a6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_bdb8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0f12_return_output,
 opc_result_MUX_uxn_opcodes_h_l2912_c7_8f7e_return_output,
 equ2_uxn_opcodes_h_l2912_c40_6614_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8326_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_fea9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8458_return_output,
 opc_result_MUX_uxn_opcodes_h_l2913_c7_0f12_return_output,
 neq_uxn_opcodes_h_l2913_c40_7553_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d754_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_2121_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_60a2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2914_c7_8458_return_output,
 neq2_uxn_opcodes_h_l2914_c40_aef0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b457_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_2748_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ec5e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2915_c7_60a2_return_output,
 gth_uxn_opcodes_h_l2915_c40_7d0a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2916_c11_68ad_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0df6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8d46_return_output,
 opc_result_MUX_uxn_opcodes_h_l2916_c7_ec5e_return_output,
 gth2_uxn_opcodes_h_l2916_c40_6fd0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3b17_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fa16_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8f8d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2917_c7_8d46_return_output,
 lth_uxn_opcodes_h_l2917_c40_4a65_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2918_c11_3a36_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_c6bf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4bcd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2918_c7_8f8d_return_output,
 lth2_uxn_opcodes_h_l2918_c40_7c6d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f9ef_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4ee5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_b546_return_output,
 opc_result_MUX_uxn_opcodes_h_l2919_c7_4bcd_return_output,
 jmp_uxn_opcodes_h_l2919_c40_7a28_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2920_c11_64a3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d66d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_b35c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2920_c7_b546_return_output,
 jmp2_uxn_opcodes_h_l2920_c40_b488_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2921_c11_63a2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_ac21_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0723_return_output,
 opc_result_MUX_uxn_opcodes_h_l2921_c7_b35c_return_output,
 jcn_uxn_opcodes_h_l2921_c40_37fc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2922_c11_db69_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_fd5c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f85d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2922_c7_0723_return_output,
 jcn2_uxn_opcodes_h_l2922_c40_a994_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7fe2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_8ce0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_c25a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2923_c7_f85d_return_output,
 jsr_uxn_opcodes_h_l2923_c40_514c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2924_c11_bcf8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_1d99_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5cec_return_output,
 opc_result_MUX_uxn_opcodes_h_l2924_c7_c25a_return_output,
 jsr2_uxn_opcodes_h_l2924_c40_9b2a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2925_c11_5c03_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bd5d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e7bf_return_output,
 opc_result_MUX_uxn_opcodes_h_l2925_c7_5cec_return_output,
 sth_uxn_opcodes_h_l2925_c40_d655_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2926_c11_becd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_68d3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3c0d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2926_c7_e7bf_return_output,
 sth2_uxn_opcodes_h_l2926_c40_b6c9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2927_c11_d52f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_00b3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_71d1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2927_c7_3c0d_return_output,
 ldz_uxn_opcodes_h_l2927_c40_77b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e69a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1556_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_60b1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2928_c7_71d1_return_output,
 ldz2_uxn_opcodes_h_l2928_c40_fbce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4489_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b88d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2929_c7_60b1_return_output,
 stz_uxn_opcodes_h_l2929_c40_a37c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2930_c11_de9c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_428f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_729b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2930_c7_b88d_return_output,
 stz2_uxn_opcodes_h_l2930_c40_2f77_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2931_c11_ca75_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_0e50_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_307d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2931_c7_729b_return_output,
 ldr_uxn_opcodes_h_l2931_c40_c27d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3006_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_6c24_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_0745_return_output,
 opc_result_MUX_uxn_opcodes_h_l2932_c7_307d_return_output,
 ldr2_uxn_opcodes_h_l2932_c40_8e0e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2933_c11_7980_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_eabd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_0585_return_output,
 opc_result_MUX_uxn_opcodes_h_l2933_c7_0745_return_output,
 str1_uxn_opcodes_h_l2933_c40_ac2f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c3b4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_04d4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8064_return_output,
 opc_result_MUX_uxn_opcodes_h_l2934_c7_0585_return_output,
 str2_uxn_opcodes_h_l2934_c40_521d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2935_c11_651b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3c43_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0b25_return_output,
 opc_result_MUX_uxn_opcodes_h_l2935_c7_8064_return_output,
 lda_uxn_opcodes_h_l2935_c40_b1b2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2936_c11_445d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_f81c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3786_return_output,
 opc_result_MUX_uxn_opcodes_h_l2936_c7_0b25_return_output,
 lda2_uxn_opcodes_h_l2936_c40_3a81_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2937_c11_d7a2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_ab1c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4cb0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2937_c7_3786_return_output,
 sta_uxn_opcodes_h_l2937_c40_e0fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7f56_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_82f2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4841_return_output,
 opc_result_MUX_uxn_opcodes_h_l2938_c7_4cb0_return_output,
 sta2_uxn_opcodes_h_l2938_c40_7ae4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3a3a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2a1d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_7c8b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2939_c7_4841_return_output,
 dei_uxn_opcodes_h_l2939_c40_610a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2940_c11_9834_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_5e1b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_636d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2940_c7_7c8b_return_output,
 dei2_uxn_opcodes_h_l2940_c40_47ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2941_c11_68c3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_518d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4f24_return_output,
 opc_result_MUX_uxn_opcodes_h_l2941_c7_636d_return_output,
 deo_uxn_opcodes_h_l2941_c40_40b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1ed2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_8823_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_10e6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2942_c7_4f24_return_output,
 deo2_uxn_opcodes_h_l2942_c40_b92c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2357_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_98d5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_9702_return_output,
 opc_result_MUX_uxn_opcodes_h_l2943_c7_10e6_return_output,
 add_uxn_opcodes_h_l2943_c40_f784_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2944_c11_149b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_6b48_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_875e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2944_c7_9702_return_output,
 add2_uxn_opcodes_h_l2944_c40_01ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2945_c11_14bf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_2ac1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_7106_return_output,
 opc_result_MUX_uxn_opcodes_h_l2945_c7_875e_return_output,
 sub_uxn_opcodes_h_l2945_c40_26e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2946_c11_3f68_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_e34d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_8f5d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2946_c7_7106_return_output,
 sub2_uxn_opcodes_h_l2946_c40_0ad8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2947_c11_6672_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_9eee_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_e52a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2947_c7_8f5d_return_output,
 mul_uxn_opcodes_h_l2947_c40_459f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2948_c11_f3db_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_cbbb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_1fe8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2948_c7_e52a_return_output,
 mul2_uxn_opcodes_h_l2948_c40_7792_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2949_c11_ca08_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2b07_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_dd18_return_output,
 opc_result_MUX_uxn_opcodes_h_l2949_c7_1fe8_return_output,
 div_uxn_opcodes_h_l2949_c40_6d2e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4ad2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_5f61_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_56b7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2950_c7_dd18_return_output,
 div2_uxn_opcodes_h_l2950_c40_e5d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2951_c11_a168_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_acd2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_946b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2951_c7_56b7_return_output,
 and_uxn_opcodes_h_l2951_c40_0680_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e60b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_a391_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_04ec_return_output,
 opc_result_MUX_uxn_opcodes_h_l2952_c7_946b_return_output,
 and2_uxn_opcodes_h_l2952_c40_9546_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2953_c11_6499_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_7ec8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_8594_return_output,
 opc_result_MUX_uxn_opcodes_h_l2953_c7_04ec_return_output,
 ora_uxn_opcodes_h_l2953_c40_d394_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2954_c11_9e75_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_95b1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ab66_return_output,
 opc_result_MUX_uxn_opcodes_h_l2954_c7_8594_return_output,
 ora2_uxn_opcodes_h_l2954_c40_3c0e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2955_c11_e2e9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_14ae_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_904a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2955_c7_ab66_return_output,
 eor_uxn_opcodes_h_l2955_c40_8300_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2956_c11_fb6d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_faad_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_386e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2956_c7_904a_return_output,
 eor2_uxn_opcodes_h_l2956_c40_2888_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e071_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_bcb1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_b055_return_output,
 opc_result_MUX_uxn_opcodes_h_l2957_c7_386e_return_output,
 sft_uxn_opcodes_h_l2957_c40_2dbb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2958_c11_4d83_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_7a91_return_output,
 opc_result_MUX_uxn_opcodes_h_l2958_c7_b055_return_output,
 sft2_uxn_opcodes_h_l2958_c40_d4b6_return_output,
 CONST_SR_6_uxn_opcodes_h_l2960_c16_fa0d_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2961_c2_36f6_return_output,
 sp0_MUX_uxn_opcodes_h_l2963_c2_dc35_return_output,
 sp1_MUX_uxn_opcodes_h_l2963_c2_dc35_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2964_c3_271b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2966_c3_e525_return_output,
 MUX_uxn_opcodes_h_l2969_c29_6723_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2969_c19_4410_return_output,
 MUX_uxn_opcodes_h_l2970_c20_88cb_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2970_c2_f2a4_return_output,
 stack_ram_update_uxn_opcodes_h_l2972_c24_ab8e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2881_c14_9fde_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2881_c14_9fde_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2881_c14_9fde_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2882_c14_c701_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2882_c14_1402_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2882_c14_1402_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2882_c14_1402_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2882_c14_00ea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2882_c14_00ea_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2882_c14_00ea_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2882_c14_ca9d_expr : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2882_c14_ca9d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2882_c14_eb9a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2882_c14_eb9a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2882_c14_eb9a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2882_c14_c701_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2882_c14_c701_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2882_c14_c701_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2883_c8_0758_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2883_c8_0758_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2883_c8_0758_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c6_90ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c6_90ad_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c6_90ad_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d402_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d402_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d402_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d402_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2889_c2_ac95_iftrue : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2889_c2_ac95_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2889_c2_ac95_return_output : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2889_c2_ac95_cond : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_d402_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_cond : unsigned(0 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2889_c48_5e4f_phase : unsigned(7 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2889_c48_5e4f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1f15_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1f15_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1f15_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_8c3f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_8c3f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_8c3f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_8c3f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_27a4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_27a4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_27a4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_27a4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_d402_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_d402_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_27a4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_d402_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2890_c40_ebae_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2890_c40_ebae_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2890_c40_ebae_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2890_c40_ebae_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2890_c40_ebae_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2890_c40_ebae_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_daa3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_daa3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_daa3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ad00_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ad00_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ad00_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ad00_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_07db_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_07db_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_07db_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_07db_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_27a4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_27a4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_07db_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_27a4_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2891_c40_12f6_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2891_c40_12f6_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2891_c40_12f6_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2891_c40_12f6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2891_c40_12f6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_1305_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_1305_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_1305_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_46a9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_46a9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_46a9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_46a9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_4a49_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_4a49_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_4a49_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_4a49_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_07db_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_07db_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_4a49_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_07db_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2892_c40_7ef2_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2892_c40_7ef2_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2892_c40_7ef2_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2892_c40_7ef2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2892_c40_7ef2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4677_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4677_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4677_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_6ea9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_6ea9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_6ea9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_6ea9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_5457_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_5457_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_5457_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_5457_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_4a49_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_4a49_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_5457_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_4a49_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2893_c40_ecac_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2893_c40_ecac_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2893_c40_ecac_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2893_c40_ecac_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2893_c40_ecac_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_fc3b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_fc3b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_fc3b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_9afe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_9afe_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_9afe_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_9afe_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_d0e8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_d0e8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_d0e8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_d0e8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_5457_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_5457_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_d0e8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_5457_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2894_c40_fc02_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2894_c40_fc02_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2894_c40_fc02_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2894_c40_fc02_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2894_c40_fc02_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3368_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3368_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3368_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3b1a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3b1a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3b1a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3b1a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_c86f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_c86f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_c86f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_c86f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_d0e8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_d0e8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_c86f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_d0e8_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2895_c40_9062_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2895_c40_9062_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2895_c40_9062_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2895_c40_9062_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2895_c40_9062_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_b543_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_b543_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_b543_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31b5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31b5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31b5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31b5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fee_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fee_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fee_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fee_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_c86f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_c86f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_6fee_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_c86f_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2896_c40_3ad0_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2896_c40_3ad0_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2896_c40_3ad0_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2896_c40_3ad0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2896_c40_3ad0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_2162_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_2162_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_2162_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_bf9d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_bf9d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_bf9d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_bf9d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f54c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f54c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f54c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f54c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_6fee_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_6fee_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_f54c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_6fee_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2897_c40_3f15_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2897_c40_3f15_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2897_c40_3f15_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2897_c40_3f15_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2897_c40_3f15_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_5698_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_5698_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_5698_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_30da_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_30da_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_30da_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_30da_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2b32_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2b32_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2b32_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2b32_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_f54c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_f54c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_2b32_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_f54c_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2898_c40_e3a1_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2898_c40_e3a1_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2898_c40_e3a1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2898_c40_e3a1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2898_c40_e3a1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_8062_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_8062_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_8062_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7a01_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7a01_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7a01_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7a01_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_89d5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_89d5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_89d5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_89d5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_2b32_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_2b32_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_89d5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_2b32_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2899_c40_ce4a_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2899_c40_ce4a_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2899_c40_ce4a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2899_c40_ce4a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_55f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_55f1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_55f1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_455f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_455f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_455f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_455f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4b8a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4b8a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4b8a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4b8a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_89d5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_89d5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_4b8a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_89d5_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2900_c40_61c0_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2900_c40_61c0_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2900_c40_61c0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2900_c40_61c0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_12b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_12b0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_12b0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_5a28_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_5a28_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_5a28_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_5a28_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5ca8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5ca8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5ca8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5ca8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_4b8a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_4b8a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_5ca8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_4b8a_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2901_c40_c96b_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2901_c40_c96b_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2901_c40_c96b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2901_c40_c96b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2901_c40_c96b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8b2b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8b2b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8b2b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_0900_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_0900_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_0900_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_0900_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_24d6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_24d6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_24d6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_24d6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_5ca8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_5ca8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_24d6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_5ca8_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2902_c40_7979_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2902_c40_7979_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2902_c40_7979_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2902_c40_7979_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2902_c40_7979_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2c9a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2c9a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2c9a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_aac9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_aac9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_aac9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_aac9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1bfc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1bfc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1bfc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1bfc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_24d6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_24d6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_1bfc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_24d6_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2903_c40_183e_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2903_c40_183e_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2903_c40_183e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2903_c40_183e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2903_c40_183e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4448_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4448_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4448_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_83cd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_83cd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_83cd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_83cd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fdd3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fdd3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fdd3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fdd3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_1bfc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_1bfc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_fdd3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_1bfc_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2904_c40_4776_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2904_c40_4776_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2904_c40_4776_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2904_c40_4776_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2904_c40_4776_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_eb86_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_eb86_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_eb86_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_431a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_431a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_431a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_431a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_30fd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_30fd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_30fd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_30fd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_fdd3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_fdd3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_30fd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_fdd3_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2905_c40_5d08_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2905_c40_5d08_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2905_c40_5d08_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2905_c40_5d08_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2905_c40_5d08_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_c483_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_c483_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_c483_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_4ecb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_4ecb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_4ecb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_4ecb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d53c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d53c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d53c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d53c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_30fd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_30fd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d53c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_30fd_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2906_c40_1572_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2906_c40_1572_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2906_c40_1572_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2906_c40_1572_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2906_c40_1572_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c602_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c602_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c602_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cf71_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cf71_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cf71_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cf71_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_cd44_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_cd44_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_cd44_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_cd44_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d53c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d53c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_cd44_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d53c_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2907_c40_ffc6_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2907_c40_ffc6_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2907_c40_ffc6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2907_c40_ffc6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2907_c40_ffc6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_55ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_55ee_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_55ee_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ca3e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ca3e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ca3e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ca3e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e639_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e639_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e639_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e639_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_cd44_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_cd44_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_e639_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_cd44_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2908_c40_c8fc_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2908_c40_c8fc_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2908_c40_c8fc_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2908_c40_c8fc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2908_c40_c8fc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7b58_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7b58_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7b58_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0d5a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0d5a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0d5a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0d5a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_94ca_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_94ca_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_94ca_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_94ca_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_e639_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_e639_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_94ca_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_e639_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2909_c40_28a1_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2909_c40_28a1_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2909_c40_28a1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2909_c40_28a1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2909_c40_28a1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_89cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_89cd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_89cd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_895b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_895b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_895b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_895b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_cacc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_cacc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_cacc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_cacc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_94ca_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_94ca_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_cacc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_94ca_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2910_c40_dde0_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2910_c40_dde0_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2910_c40_dde0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2910_c40_dde0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2910_c40_dde0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_f85c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_f85c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_f85c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1ce9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1ce9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1ce9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1ce9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_8f7e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_8f7e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_8f7e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_8f7e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_cacc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_cacc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_8f7e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_cacc_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2911_c40_edb9_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2911_c40_edb9_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2911_c40_edb9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2911_c40_edb9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2911_c40_edb9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_52a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_52a6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_52a6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_bdb8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_bdb8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_bdb8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_bdb8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0f12_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0f12_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0f12_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0f12_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_8f7e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_8f7e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_0f12_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_8f7e_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2912_c40_6614_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2912_c40_6614_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2912_c40_6614_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2912_c40_6614_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2912_c40_6614_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8326_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8326_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8326_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_fea9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_fea9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_fea9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_fea9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8458_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8458_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8458_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8458_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_0f12_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_0f12_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_8458_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_0f12_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2913_c40_7553_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2913_c40_7553_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2913_c40_7553_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2913_c40_7553_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2913_c40_7553_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d754_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d754_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d754_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_2121_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_2121_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_2121_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_2121_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_60a2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_60a2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_60a2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_60a2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_8458_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_8458_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_60a2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_8458_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2914_c40_aef0_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2914_c40_aef0_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2914_c40_aef0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2914_c40_aef0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2914_c40_aef0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b457_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b457_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b457_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_2748_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_2748_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_2748_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_2748_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ec5e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ec5e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ec5e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ec5e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_60a2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_60a2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_ec5e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_60a2_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2915_c40_7d0a_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2915_c40_7d0a_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2915_c40_7d0a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2915_c40_7d0a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2915_c40_7d0a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_68ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_68ad_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_68ad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0df6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0df6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0df6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0df6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8d46_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8d46_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8d46_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8d46_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_ec5e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_ec5e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8d46_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_ec5e_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2916_c40_6fd0_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2916_c40_6fd0_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2916_c40_6fd0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2916_c40_6fd0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2916_c40_6fd0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3b17_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3b17_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3b17_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fa16_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fa16_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fa16_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fa16_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8f8d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8f8d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8f8d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8f8d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8d46_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8d46_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8f8d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8d46_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2917_c40_4a65_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2917_c40_4a65_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2917_c40_4a65_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2917_c40_4a65_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2917_c40_4a65_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_3a36_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_3a36_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_3a36_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_c6bf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_c6bf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_c6bf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_c6bf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4bcd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4bcd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4bcd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4bcd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8f8d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8f8d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4bcd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8f8d_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2918_c40_7c6d_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2918_c40_7c6d_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2918_c40_7c6d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2918_c40_7c6d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2918_c40_7c6d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f9ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f9ef_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f9ef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4ee5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4ee5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4ee5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4ee5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_b546_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_b546_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_b546_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_b546_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4bcd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4bcd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_b546_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4bcd_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2919_c40_7a28_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2919_c40_7a28_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2919_c40_7a28_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2919_c40_7a28_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2919_c40_7a28_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2919_c40_7a28_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_64a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_64a3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_64a3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d66d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d66d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d66d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d66d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_b35c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_b35c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_b35c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_b35c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_b546_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_b546_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_b35c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_b546_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2920_c40_b488_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2920_c40_b488_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2920_c40_b488_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2920_c40_b488_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2920_c40_b488_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_63a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_63a2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_63a2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_ac21_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_ac21_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_ac21_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_ac21_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0723_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0723_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0723_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0723_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_b35c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_b35c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_0723_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_b35c_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2921_c40_37fc_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2921_c40_37fc_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2921_c40_37fc_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2921_c40_37fc_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2921_c40_37fc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2921_c40_37fc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_db69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_db69_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_db69_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_fd5c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_fd5c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_fd5c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_fd5c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f85d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f85d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f85d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f85d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_0723_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_0723_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f85d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_0723_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2922_c40_a994_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2922_c40_a994_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2922_c40_a994_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2922_c40_a994_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2922_c40_a994_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7fe2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7fe2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7fe2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_8ce0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_8ce0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_8ce0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_8ce0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_c25a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_c25a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_c25a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_c25a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f85d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f85d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_c25a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f85d_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2923_c40_514c_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2923_c40_514c_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2923_c40_514c_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2923_c40_514c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2923_c40_514c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2923_c40_514c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_bcf8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_bcf8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_bcf8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_1d99_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_1d99_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_1d99_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_1d99_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5cec_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5cec_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5cec_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5cec_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_c25a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_c25a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_5cec_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_c25a_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2924_c40_9b2a_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2924_c40_9b2a_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2924_c40_9b2a_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2924_c40_9b2a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2924_c40_9b2a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2924_c40_9b2a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_5c03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_5c03_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_5c03_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bd5d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bd5d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bd5d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bd5d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e7bf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e7bf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e7bf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e7bf_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_5cec_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_5cec_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_e7bf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_5cec_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2925_c40_d655_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2925_c40_d655_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2925_c40_d655_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2925_c40_d655_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2925_c40_d655_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_becd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_becd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_becd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_68d3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_68d3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_68d3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_68d3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3c0d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3c0d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3c0d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3c0d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_e7bf_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_e7bf_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_3c0d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_e7bf_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2926_c40_b6c9_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2926_c40_b6c9_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2926_c40_b6c9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2926_c40_b6c9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2926_c40_b6c9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_d52f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_d52f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_d52f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_00b3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_00b3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_00b3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_00b3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_71d1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_71d1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_71d1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_71d1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_3c0d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_3c0d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_71d1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_3c0d_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2927_c40_77b4_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2927_c40_77b4_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2927_c40_77b4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2927_c40_77b4_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2927_c40_77b4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2927_c40_77b4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e69a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e69a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e69a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1556_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1556_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1556_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1556_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_60b1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_60b1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_60b1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_60b1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_71d1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_71d1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_60b1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_71d1_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2928_c40_fbce_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2928_c40_fbce_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2928_c40_fbce_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2928_c40_fbce_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2928_c40_fbce_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2928_c40_fbce_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4489_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4489_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4489_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4489_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b88d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b88d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b88d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b88d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_60b1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_60b1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b88d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_60b1_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2929_c40_a37c_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2929_c40_a37c_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2929_c40_a37c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2929_c40_a37c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2929_c40_a37c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_de9c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_de9c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_de9c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_428f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_428f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_428f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_428f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_729b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_729b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_729b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_729b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b88d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b88d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_729b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b88d_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2930_c40_2f77_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2930_c40_2f77_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2930_c40_2f77_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2930_c40_2f77_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2930_c40_2f77_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_ca75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_ca75_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_ca75_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_0e50_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_0e50_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_0e50_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_0e50_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_307d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_307d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_307d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_307d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_729b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_729b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_307d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_729b_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2931_c40_c27d_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2931_c40_c27d_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2931_c40_c27d_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2931_c40_c27d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2931_c40_c27d_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2931_c40_c27d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2931_c40_c27d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3006_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3006_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3006_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_6c24_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_6c24_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_6c24_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_6c24_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_0745_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_0745_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_0745_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_0745_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_307d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_307d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_0745_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_307d_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2932_c40_8e0e_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2932_c40_8e0e_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2932_c40_8e0e_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2932_c40_8e0e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2932_c40_8e0e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2932_c40_8e0e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2932_c40_8e0e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_7980_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_7980_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_7980_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_eabd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_eabd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_eabd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_eabd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_0585_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_0585_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_0585_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_0585_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_0745_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_0745_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_0585_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_0745_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2933_c40_ac2f_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2933_c40_ac2f_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2933_c40_ac2f_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2933_c40_ac2f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2933_c40_ac2f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2933_c40_ac2f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c3b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c3b4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c3b4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_04d4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_04d4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_04d4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_04d4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8064_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8064_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8064_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8064_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_0585_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_0585_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_8064_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_0585_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2934_c40_521d_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2934_c40_521d_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2934_c40_521d_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2934_c40_521d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2934_c40_521d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2934_c40_521d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_651b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_651b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_651b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3c43_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3c43_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3c43_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3c43_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0b25_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0b25_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0b25_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0b25_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_8064_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_8064_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_0b25_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_8064_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2935_c40_b1b2_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2935_c40_b1b2_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2935_c40_b1b2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2935_c40_b1b2_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2935_c40_b1b2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2935_c40_b1b2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_445d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_445d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_445d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_f81c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_f81c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_f81c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_f81c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3786_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3786_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3786_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3786_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_0b25_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_0b25_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_3786_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_0b25_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2936_c40_3a81_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2936_c40_3a81_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2936_c40_3a81_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2936_c40_3a81_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2936_c40_3a81_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2936_c40_3a81_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_d7a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_d7a2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_d7a2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_ab1c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_ab1c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_ab1c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_ab1c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4cb0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4cb0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4cb0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4cb0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_3786_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_3786_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_4cb0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_3786_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2937_c40_e0fa_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2937_c40_e0fa_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2937_c40_e0fa_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2937_c40_e0fa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2937_c40_e0fa_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7f56_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7f56_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7f56_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_82f2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_82f2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_82f2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_82f2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4841_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4841_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4841_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4841_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_4cb0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_4cb0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_4841_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_4cb0_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2938_c40_7ae4_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2938_c40_7ae4_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2938_c40_7ae4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2938_c40_7ae4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2938_c40_7ae4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3a3a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3a3a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3a3a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2a1d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2a1d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2a1d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2a1d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_7c8b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_7c8b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_7c8b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_7c8b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_4841_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_4841_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_7c8b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_4841_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2939_c40_610a_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2939_c40_610a_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2939_c40_610a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2939_c40_610a_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2939_c40_610a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2939_c40_610a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_9834_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_9834_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_9834_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_5e1b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_5e1b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_5e1b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_5e1b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_636d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_636d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_636d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_636d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_7c8b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_7c8b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_636d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_7c8b_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2940_c40_47ff_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2940_c40_47ff_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2940_c40_47ff_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2940_c40_47ff_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2940_c40_47ff_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2940_c40_47ff_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_68c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_68c3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_68c3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_518d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_518d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_518d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_518d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4f24_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4f24_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4f24_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4f24_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_636d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_636d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_4f24_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_636d_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2941_c40_40b4_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2941_c40_40b4_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2941_c40_40b4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2941_c40_40b4_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2941_c40_40b4_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2941_c40_40b4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2941_c40_40b4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1ed2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1ed2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1ed2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_8823_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_8823_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_8823_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_8823_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_10e6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_10e6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_10e6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_10e6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_4f24_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_4f24_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_10e6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_4f24_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2942_c40_b92c_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2942_c40_b92c_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2942_c40_b92c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2942_c40_b92c_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2942_c40_b92c_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2942_c40_b92c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2942_c40_b92c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2357_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2357_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2357_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_98d5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_98d5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_98d5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_98d5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_9702_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_9702_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_9702_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_9702_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_10e6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_10e6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_9702_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_10e6_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2943_c40_f784_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2943_c40_f784_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2943_c40_f784_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2943_c40_f784_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2943_c40_f784_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_149b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_149b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_149b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_6b48_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_6b48_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_6b48_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_6b48_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_875e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_875e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_875e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_875e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_9702_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_9702_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_875e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_9702_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2944_c40_01ed_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2944_c40_01ed_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2944_c40_01ed_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2944_c40_01ed_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2944_c40_01ed_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_14bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_14bf_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_14bf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_2ac1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_2ac1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_2ac1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_2ac1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_7106_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_7106_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_7106_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_7106_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_875e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_875e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_7106_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_875e_cond : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2945_c40_26e9_phase : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2945_c40_26e9_ins : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2945_c40_26e9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2945_c40_26e9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2945_c40_26e9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_3f68_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_3f68_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_3f68_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_e34d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_e34d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_e34d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_e34d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_8f5d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_8f5d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_8f5d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_8f5d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_7106_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_7106_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_8f5d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_7106_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2946_c40_0ad8_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2946_c40_0ad8_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2946_c40_0ad8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2946_c40_0ad8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2946_c40_0ad8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_6672_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_6672_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_6672_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_9eee_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_9eee_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_9eee_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_9eee_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_e52a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_e52a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_e52a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_e52a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_8f5d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_8f5d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_e52a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_8f5d_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2947_c40_459f_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2947_c40_459f_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2947_c40_459f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2947_c40_459f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2947_c40_459f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_f3db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_f3db_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_f3db_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_cbbb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_cbbb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_cbbb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_cbbb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_1fe8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_1fe8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_1fe8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_1fe8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_e52a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_e52a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_1fe8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_e52a_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2948_c40_7792_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2948_c40_7792_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2948_c40_7792_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2948_c40_7792_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2948_c40_7792_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_ca08_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_ca08_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_ca08_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2b07_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2b07_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2b07_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2b07_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_dd18_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_dd18_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_dd18_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_dd18_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_1fe8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_1fe8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_dd18_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_1fe8_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2949_c40_6d2e_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2949_c40_6d2e_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2949_c40_6d2e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2949_c40_6d2e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2949_c40_6d2e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4ad2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4ad2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4ad2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_5f61_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_5f61_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_5f61_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_5f61_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_56b7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_56b7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_56b7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_56b7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_dd18_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_dd18_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_56b7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_dd18_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2950_c40_e5d7_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2950_c40_e5d7_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2950_c40_e5d7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2950_c40_e5d7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2950_c40_e5d7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_a168_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_a168_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_a168_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_acd2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_acd2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_acd2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_acd2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_946b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_946b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_946b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_946b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_56b7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_56b7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_946b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_56b7_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2951_c40_0680_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2951_c40_0680_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2951_c40_0680_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2951_c40_0680_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2951_c40_0680_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e60b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e60b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e60b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_a391_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_a391_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_a391_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_a391_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_04ec_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_04ec_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_04ec_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_04ec_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_946b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_946b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_04ec_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_946b_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2952_c40_9546_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2952_c40_9546_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2952_c40_9546_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2952_c40_9546_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2952_c40_9546_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_6499_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_6499_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_6499_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_7ec8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_7ec8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_7ec8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_7ec8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_8594_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_8594_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_8594_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_8594_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_04ec_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_04ec_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_8594_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_04ec_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2953_c40_d394_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2953_c40_d394_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2953_c40_d394_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2953_c40_d394_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2953_c40_d394_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_9e75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_9e75_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_9e75_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_95b1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_95b1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_95b1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_95b1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ab66_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ab66_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ab66_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ab66_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_8594_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_8594_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_ab66_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_8594_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2954_c40_3c0e_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2954_c40_3c0e_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2954_c40_3c0e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2954_c40_3c0e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2954_c40_3c0e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_e2e9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_e2e9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_e2e9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_14ae_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_14ae_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_14ae_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_14ae_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_904a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_904a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_904a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_904a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_ab66_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_ab66_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_904a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_ab66_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2955_c40_8300_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2955_c40_8300_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2955_c40_8300_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2955_c40_8300_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2955_c40_8300_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_fb6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_fb6d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_fb6d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_faad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_faad_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_faad_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_faad_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_386e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_386e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_386e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_386e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_904a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_904a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_386e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_904a_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2956_c40_2888_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2956_c40_2888_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2956_c40_2888_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2956_c40_2888_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2956_c40_2888_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e071_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e071_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e071_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_bcb1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_bcb1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_bcb1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_bcb1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_b055_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_b055_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_b055_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_b055_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_386e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_386e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_b055_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_386e_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2957_c40_2dbb_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2957_c40_2dbb_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2957_c40_2dbb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2957_c40_2dbb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2957_c40_2dbb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2958_c11_4d83_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2958_c11_4d83_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2958_c11_4d83_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_7a91_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_7a91_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_7a91_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_7a91_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_b055_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_b055_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_b055_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2958_c40_d4b6_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2958_c40_d4b6_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2958_c40_d4b6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2958_c40_d4b6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2958_c40_d4b6_return_output : opcode_result_t;
 variable VAR_stack_index_uxn_opcodes_h_l2960_c2_9c85 : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2960_c16_fa0d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2960_c16_fa0d_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2961_c2_36f6_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2961_c17_17dd_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2961_c2_36f6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2961_c2_36f6_return_output : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2963_c2_dc35_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2963_c2_dc35_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l2966_c3_2baa : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2963_c2_dc35_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2963_c2_dc35_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2963_c2_dc35_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l2964_c3_c209 : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2963_c2_dc35_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2963_c2_dc35_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2963_c2_dc35_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2964_c3_271b_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2964_c3_271b_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2964_c3_271b_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2966_c3_e525_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2966_c3_e525_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2966_c3_e525_return_output : signed(9 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2969_c29_6723_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2969_c29_6723_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2969_c29_6723_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2969_c29_6723_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2969_c19_ff01_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2969_c19_4410_left : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2969_c68_8f6c_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2969_c58_c7c5_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2969_c19_4410_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2969_c19_4410_return_output : unsigned(8 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l2970_c2_31d5 : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2970_c2_f2a4_left : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2970_c20_88cb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2970_c20_88cb_iftrue : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2970_c20_88cb_iffalse : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2970_c20_88cb_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2970_c2_f2a4_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2970_c2_f2a4_return_output : unsigned(9 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2972_c24_ab8e_stack_address : unsigned(8 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2972_c24_ab8e_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2972_c24_ab8e_write_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2975_c3_55ad_return_output : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2972_c24_ab8e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2972_c24_ab8e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2979_c39_6c25_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2980_c40_9d83_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2981_c34_bde9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2982_c30_14ad_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2983_c33_2005_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2984_c34_a48b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2985_c37_9a4e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2987_c32_81ed_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2964_l2966_DUPLICATE_f507_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2966_l2964_DUPLICATE_e6a3_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2974_l2986_DUPLICATE_1644_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2989_l2866_DUPLICATE_3357_return_output : eval_opcode_result_t;
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_f81c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3786_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_daa3_right := to_unsigned(64, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_68ad_right := to_unsigned(42, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_9e75_right := to_unsigned(61, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_cbbb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_1fe8_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4b8a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_455f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2881_c14_9fde_right := to_unsigned(63, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_acd2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_946b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8b2b_right := to_unsigned(35, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_fb6d_right := to_unsigned(62, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_6b48_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_875e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1f15_right := to_unsigned(32, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d53c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_4ecb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_10e6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_8823_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_83cd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fdd3_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_386e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_faad_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_6c24_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_0745_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_a168_right := to_unsigned(28, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_de9c_right := to_unsigned(49, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_55ee_right := to_unsigned(38, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c602_right := to_unsigned(6, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3b17_right := to_unsigned(11, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_c483_right := to_unsigned(37, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_729b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_428f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_3a36_right := to_unsigned(43, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_431a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_30fd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_3f68_right := to_unsigned(57, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_b546_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4ee5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_0585_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_eabd_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7f56_right := to_unsigned(53, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_b055_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_bcb1_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_2121_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_60a2_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_24d6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_0900_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8d46_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0df6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_e52a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_9eee_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4489_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b88d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_bf9d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f54c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2958_c11_4d83_right := to_unsigned(63, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_6672_right := to_unsigned(26, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e7bf_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bd5d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_b35c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d66d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_89cd_right := to_unsigned(39, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_9834_right := to_unsigned(54, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_27a4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_8c3f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_12b0_right := to_unsigned(3, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d754_right := to_unsigned(41, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2c9a_right := to_unsigned(4, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ab66_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_95b1_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7fe2_right := to_unsigned(14, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1bfc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_aac9_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1556_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_60b1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8326_right := to_unsigned(9, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_db69_right := to_unsigned(45, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_ac21_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0723_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_518d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4f24_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_e34d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_8f5d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_e2e9_right := to_unsigned(30, 8);
     VAR_MUX_uxn_opcodes_h_l2970_c20_88cb_iftrue := to_unsigned(256, 9);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_ab1c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4cb0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_b543_right := to_unsigned(224, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_8062_right := to_unsigned(2, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_9702_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_98d5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_63a2_right := to_unsigned(13, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0f12_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_bdb8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e2_right := to_unsigned(17, 8);
     VAR_is_wait_MUX_uxn_opcodes_h_l2889_c2_ac95_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c6_90ad_right := to_unsigned(0, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_1d99_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5cec_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c3b4_right := to_unsigned(51, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_71d1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_00b3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_f3db_right := to_unsigned(58, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_8594_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_7ec8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_7c8b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2a1d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3368_right := to_unsigned(192, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_7a91_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_bcf8_right := to_unsigned(46, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e69a_right := to_unsigned(48, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_ca08_right := to_unsigned(27, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_68c3_right := to_unsigned(23, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31b5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fee_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_0e50_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_307d_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_c86f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3b1a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_4a49_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_46a9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_8f7e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1ce9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_eb86_right := to_unsigned(5, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0b25_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3c43_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_7980_right := to_unsigned(19, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_2162_right := to_unsigned(1, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_d52f_right := to_unsigned(16, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_04ec_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_a391_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f9ef_right := to_unsigned(12, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ec5e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_2748_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2882_c14_eb9a_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4bcd_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_c6bf_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_f85c_right := to_unsigned(8, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_1305_right := to_unsigned(96, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_6499_right := to_unsigned(29, 8);
     VAR_MUX_uxn_opcodes_h_l2882_c14_c701_iffalse := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_6ea9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_5457_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4677_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3a3a_right := to_unsigned(22, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_cacc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_895b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8064_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_04d4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_56b7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_5f61_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_52a6_right := to_unsigned(40, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_651b_right := to_unsigned(20, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_55f1_right := to_unsigned(34, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4448_right := to_unsigned(36, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_fc3b_right := to_unsigned(160, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_64a3_right := to_unsigned(44, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2b07_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_dd18_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_5e1b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_636d_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_c25a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_8ce0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3006_right := to_unsigned(50, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_becd_right := to_unsigned(47, 8);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2882_c14_00ea_right := to_unsigned(32, 8);
     VAR_MUX_uxn_opcodes_h_l2882_c14_c701_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2882_c14_1402_right := to_unsigned(223, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4841_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_82f2_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_68d3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3c0d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_445d_right := to_unsigned(52, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_fea9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8458_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2357_right := to_unsigned(24, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b457_right := to_unsigned(10, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_cd44_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cf71_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_5c03_right := to_unsigned(15, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_ca75_right := to_unsigned(18, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f85d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_fd5c_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_30da_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2b32_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_2ac1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_7106_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2970_c20_88cb_iffalse := resize(to_unsigned(0, 1), 9);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_5698_right := to_unsigned(33, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e60b_right := to_unsigned(60, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8f8d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fa16_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_14bf_right := to_unsigned(25, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_07db_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ad00_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_89d5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7a01_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1ed2_right := to_unsigned(55, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_d7a2_right := to_unsigned(21, 8);
     VAR_is_wait_MUX_uxn_opcodes_h_l2889_c2_ac95_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d402_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_9afe_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_d0e8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_149b_right := to_unsigned(56, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_5a28_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5ca8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4ad2_right := to_unsigned(59, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ca3e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e639_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e071_right := to_unsigned(31, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7b58_right := to_unsigned(7, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_904a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_14ae_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_94ca_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0d5a_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d402_iffalse := VAR_CLOCK_ENABLE;
     VAR_stack_ram_update_uxn_opcodes_h_l2972_c24_ab8e_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2881_c14_9fde_left := VAR_ins;
     VAR_CONST_SR_6_uxn_opcodes_h_l2960_c16_fa0d_x := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l2883_c8_0758_iftrue := VAR_ins;
     VAR_add2_uxn_opcodes_h_l2944_c40_01ed_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l2943_c40_f784_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l2952_c40_9546_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l2951_c40_0680_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l2940_c40_47ff_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l2939_c40_610a_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l2942_c40_b92c_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l2941_c40_40b4_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l2950_c40_e5d7_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l2949_c40_6d2e_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l2908_c40_c8fc_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l2907_c40_ffc6_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l2956_c40_2888_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l2955_c40_8300_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l2912_c40_6614_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l2911_c40_edb9_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l2916_c40_6fd0_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l2915_c40_7d0a_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l2898_c40_e3a1_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l2897_c40_3f15_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l2922_c40_a994_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l2921_c40_37fc_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l2920_c40_b488_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l2919_c40_7a28_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l2924_c40_9b2a_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l2923_c40_514c_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l2936_c40_3a81_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l2935_c40_b1b2_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l2932_c40_8e0e_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l2931_c40_c27d_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l2928_c40_fbce_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l2927_c40_77b4_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l2918_c40_7c6d_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l2917_c40_4a65_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l2948_c40_7792_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l2947_c40_459f_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l2914_c40_aef0_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l2913_c40_7553_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l2902_c40_7979_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l2901_c40_c96b_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l2954_c40_3c0e_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l2953_c40_d394_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l2910_c40_dde0_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l2909_c40_28a1_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l2900_c40_61c0_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l2899_c40_ce4a_ins := VAR_ins;
     VAR_rot2_uxn_opcodes_h_l2906_c40_1572_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l2905_c40_5d08_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l2958_c40_d4b6_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l2957_c40_2dbb_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l2938_c40_7ae4_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l2937_c40_e0fa_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l2926_c40_b6c9_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l2925_c40_d655_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l2933_c40_ac2f_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l2934_c40_521d_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l2930_c40_2f77_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l2929_c40_a37c_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l2946_c40_0ad8_ins := VAR_ins;
     VAR_sub_uxn_opcodes_h_l2945_c40_26e9_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l2904_c40_4776_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l2903_c40_183e_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_b055_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l2890_c40_ebae_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l2921_c40_37fc_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l2891_c40_12f6_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l2919_c40_7a28_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l2892_c40_7ef2_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l2924_c40_9b2a_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l2923_c40_514c_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l2932_c40_8e0e_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l2931_c40_c27d_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2894_c40_fc02_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2896_c40_3ad0_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2893_c40_ecac_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2895_c40_9062_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l2933_c40_ac2f_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l2934_c40_521d_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l2944_c40_01ed_phase := VAR_phase;
     VAR_add_uxn_opcodes_h_l2943_c40_f784_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l2952_c40_9546_phase := VAR_phase;
     VAR_and_uxn_opcodes_h_l2951_c40_0680_phase := VAR_phase;
     VAR_brk_uxn_opcodes_h_l2889_c48_5e4f_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2940_c40_47ff_phase := VAR_phase;
     VAR_dei_uxn_opcodes_h_l2939_c40_610a_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l2942_c40_b92c_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l2941_c40_40b4_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l2950_c40_e5d7_phase := VAR_phase;
     VAR_div_uxn_opcodes_h_l2949_c40_6d2e_phase := VAR_phase;
     VAR_dup2_uxn_opcodes_h_l2908_c40_c8fc_phase := VAR_phase;
     VAR_dup_uxn_opcodes_h_l2907_c40_ffc6_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l2956_c40_2888_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l2955_c40_8300_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l2912_c40_6614_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l2911_c40_edb9_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l2916_c40_6fd0_phase := VAR_phase;
     VAR_gth_uxn_opcodes_h_l2915_c40_7d0a_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l2898_c40_e3a1_phase := VAR_phase;
     VAR_inc_uxn_opcodes_h_l2897_c40_3f15_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l2890_c40_ebae_phase := VAR_phase;
     VAR_jcn2_uxn_opcodes_h_l2922_c40_a994_phase := VAR_phase;
     VAR_jcn_uxn_opcodes_h_l2921_c40_37fc_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l2891_c40_12f6_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l2920_c40_b488_phase := VAR_phase;
     VAR_jmp_uxn_opcodes_h_l2919_c40_7a28_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l2892_c40_7ef2_phase := VAR_phase;
     VAR_jsr2_uxn_opcodes_h_l2924_c40_9b2a_phase := VAR_phase;
     VAR_jsr_uxn_opcodes_h_l2923_c40_514c_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l2936_c40_3a81_phase := VAR_phase;
     VAR_lda_uxn_opcodes_h_l2935_c40_b1b2_phase := VAR_phase;
     VAR_ldr2_uxn_opcodes_h_l2932_c40_8e0e_phase := VAR_phase;
     VAR_ldr_uxn_opcodes_h_l2931_c40_c27d_phase := VAR_phase;
     VAR_ldz2_uxn_opcodes_h_l2928_c40_fbce_phase := VAR_phase;
     VAR_ldz_uxn_opcodes_h_l2927_c40_77b4_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2894_c40_fc02_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2896_c40_3ad0_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2893_c40_ecac_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2895_c40_9062_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l2918_c40_7c6d_phase := VAR_phase;
     VAR_lth_uxn_opcodes_h_l2917_c40_4a65_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l2948_c40_7792_phase := VAR_phase;
     VAR_mul_uxn_opcodes_h_l2947_c40_459f_phase := VAR_phase;
     VAR_neq2_uxn_opcodes_h_l2914_c40_aef0_phase := VAR_phase;
     VAR_neq_uxn_opcodes_h_l2913_c40_7553_phase := VAR_phase;
     VAR_nip2_uxn_opcodes_h_l2902_c40_7979_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l2901_c40_c96b_phase := VAR_phase;
     VAR_ora2_uxn_opcodes_h_l2954_c40_3c0e_phase := VAR_phase;
     VAR_ora_uxn_opcodes_h_l2953_c40_d394_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l2910_c40_dde0_phase := VAR_phase;
     VAR_ovr_uxn_opcodes_h_l2909_c40_28a1_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l2900_c40_61c0_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l2899_c40_ce4a_phase := VAR_phase;
     VAR_rot2_uxn_opcodes_h_l2906_c40_1572_phase := VAR_phase;
     VAR_rot_uxn_opcodes_h_l2905_c40_5d08_phase := VAR_phase;
     VAR_sft2_uxn_opcodes_h_l2958_c40_d4b6_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l2957_c40_2dbb_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l2938_c40_7ae4_phase := VAR_phase;
     VAR_sta_uxn_opcodes_h_l2937_c40_e0fa_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l2926_c40_b6c9_phase := VAR_phase;
     VAR_sth_uxn_opcodes_h_l2925_c40_d655_phase := VAR_phase;
     VAR_str1_uxn_opcodes_h_l2933_c40_ac2f_phase := VAR_phase;
     VAR_str2_uxn_opcodes_h_l2934_c40_521d_phase := VAR_phase;
     VAR_stz2_uxn_opcodes_h_l2930_c40_2f77_phase := VAR_phase;
     VAR_stz_uxn_opcodes_h_l2929_c40_a37c_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l2946_c40_0ad8_phase := VAR_phase;
     VAR_sub_uxn_opcodes_h_l2945_c40_26e9_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l2904_c40_4776_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l2903_c40_183e_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2940_c40_47ff_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_dei_uxn_opcodes_h_l2939_c40_610a_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2942_c40_b92c_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo_uxn_opcodes_h_l2941_c40_40b4_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2942_c40_b92c_previous_ram_read := VAR_previous_ram_read;
     VAR_deo_uxn_opcodes_h_l2941_c40_40b4_previous_ram_read := VAR_previous_ram_read;
     VAR_jci_uxn_opcodes_h_l2890_c40_ebae_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l2891_c40_12f6_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l2892_c40_7ef2_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l2936_c40_3a81_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l2935_c40_b1b2_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l2932_c40_8e0e_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l2931_c40_c27d_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l2928_c40_fbce_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l2927_c40_77b4_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2894_c40_fc02_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2896_c40_3ad0_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2893_c40_ecac_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2895_c40_9062_previous_ram_read := VAR_previous_ram_read;
     VAR_add2_uxn_opcodes_h_l2944_c40_01ed_previous_stack_read := previous_stack_read;
     VAR_add_uxn_opcodes_h_l2943_c40_f784_previous_stack_read := previous_stack_read;
     VAR_and2_uxn_opcodes_h_l2952_c40_9546_previous_stack_read := previous_stack_read;
     VAR_and_uxn_opcodes_h_l2951_c40_0680_previous_stack_read := previous_stack_read;
     VAR_dei2_uxn_opcodes_h_l2940_c40_47ff_previous_stack_read := previous_stack_read;
     VAR_dei_uxn_opcodes_h_l2939_c40_610a_previous_stack_read := previous_stack_read;
     VAR_deo2_uxn_opcodes_h_l2942_c40_b92c_previous_stack_read := previous_stack_read;
     VAR_deo_uxn_opcodes_h_l2941_c40_40b4_previous_stack_read := previous_stack_read;
     VAR_div2_uxn_opcodes_h_l2950_c40_e5d7_previous_stack_read := previous_stack_read;
     VAR_div_uxn_opcodes_h_l2949_c40_6d2e_previous_stack_read := previous_stack_read;
     VAR_dup2_uxn_opcodes_h_l2908_c40_c8fc_previous_stack_read := previous_stack_read;
     VAR_dup_uxn_opcodes_h_l2907_c40_ffc6_previous_stack_read := previous_stack_read;
     VAR_eor2_uxn_opcodes_h_l2956_c40_2888_previous_stack_read := previous_stack_read;
     VAR_eor_uxn_opcodes_h_l2955_c40_8300_previous_stack_read := previous_stack_read;
     VAR_equ2_uxn_opcodes_h_l2912_c40_6614_previous_stack_read := previous_stack_read;
     VAR_equ_uxn_opcodes_h_l2911_c40_edb9_previous_stack_read := previous_stack_read;
     VAR_gth2_uxn_opcodes_h_l2916_c40_6fd0_previous_stack_read := previous_stack_read;
     VAR_gth_uxn_opcodes_h_l2915_c40_7d0a_previous_stack_read := previous_stack_read;
     VAR_inc2_uxn_opcodes_h_l2898_c40_e3a1_previous_stack_read := previous_stack_read;
     VAR_inc_uxn_opcodes_h_l2897_c40_3f15_previous_stack_read := previous_stack_read;
     VAR_jci_uxn_opcodes_h_l2890_c40_ebae_previous_stack_read := previous_stack_read;
     VAR_jcn2_uxn_opcodes_h_l2922_c40_a994_previous_stack_read := previous_stack_read;
     VAR_jcn_uxn_opcodes_h_l2921_c40_37fc_previous_stack_read := previous_stack_read;
     VAR_jmp2_uxn_opcodes_h_l2920_c40_b488_previous_stack_read := previous_stack_read;
     VAR_jmp_uxn_opcodes_h_l2919_c40_7a28_previous_stack_read := previous_stack_read;
     VAR_jsr2_uxn_opcodes_h_l2924_c40_9b2a_previous_stack_read := previous_stack_read;
     VAR_jsr_uxn_opcodes_h_l2923_c40_514c_previous_stack_read := previous_stack_read;
     VAR_lda2_uxn_opcodes_h_l2936_c40_3a81_previous_stack_read := previous_stack_read;
     VAR_lda_uxn_opcodes_h_l2935_c40_b1b2_previous_stack_read := previous_stack_read;
     VAR_ldr2_uxn_opcodes_h_l2932_c40_8e0e_previous_stack_read := previous_stack_read;
     VAR_ldr_uxn_opcodes_h_l2931_c40_c27d_previous_stack_read := previous_stack_read;
     VAR_ldz2_uxn_opcodes_h_l2928_c40_fbce_previous_stack_read := previous_stack_read;
     VAR_ldz_uxn_opcodes_h_l2927_c40_77b4_previous_stack_read := previous_stack_read;
     VAR_lth2_uxn_opcodes_h_l2918_c40_7c6d_previous_stack_read := previous_stack_read;
     VAR_lth_uxn_opcodes_h_l2917_c40_4a65_previous_stack_read := previous_stack_read;
     VAR_mul2_uxn_opcodes_h_l2948_c40_7792_previous_stack_read := previous_stack_read;
     VAR_mul_uxn_opcodes_h_l2947_c40_459f_previous_stack_read := previous_stack_read;
     VAR_neq2_uxn_opcodes_h_l2914_c40_aef0_previous_stack_read := previous_stack_read;
     VAR_neq_uxn_opcodes_h_l2913_c40_7553_previous_stack_read := previous_stack_read;
     VAR_nip2_uxn_opcodes_h_l2902_c40_7979_previous_stack_read := previous_stack_read;
     VAR_nip_uxn_opcodes_h_l2901_c40_c96b_previous_stack_read := previous_stack_read;
     VAR_ora2_uxn_opcodes_h_l2954_c40_3c0e_previous_stack_read := previous_stack_read;
     VAR_ora_uxn_opcodes_h_l2953_c40_d394_previous_stack_read := previous_stack_read;
     VAR_ovr2_uxn_opcodes_h_l2910_c40_dde0_previous_stack_read := previous_stack_read;
     VAR_ovr_uxn_opcodes_h_l2909_c40_28a1_previous_stack_read := previous_stack_read;
     VAR_rot2_uxn_opcodes_h_l2906_c40_1572_previous_stack_read := previous_stack_read;
     VAR_rot_uxn_opcodes_h_l2905_c40_5d08_previous_stack_read := previous_stack_read;
     VAR_sft2_uxn_opcodes_h_l2958_c40_d4b6_previous_stack_read := previous_stack_read;
     VAR_sft_uxn_opcodes_h_l2957_c40_2dbb_previous_stack_read := previous_stack_read;
     VAR_sta2_uxn_opcodes_h_l2938_c40_7ae4_previous_stack_read := previous_stack_read;
     VAR_sta_uxn_opcodes_h_l2937_c40_e0fa_previous_stack_read := previous_stack_read;
     VAR_sth2_uxn_opcodes_h_l2926_c40_b6c9_previous_stack_read := previous_stack_read;
     VAR_sth_uxn_opcodes_h_l2925_c40_d655_previous_stack_read := previous_stack_read;
     VAR_str1_uxn_opcodes_h_l2933_c40_ac2f_previous_stack_read := previous_stack_read;
     VAR_str2_uxn_opcodes_h_l2934_c40_521d_previous_stack_read := previous_stack_read;
     VAR_stz2_uxn_opcodes_h_l2930_c40_2f77_previous_stack_read := previous_stack_read;
     VAR_stz_uxn_opcodes_h_l2929_c40_a37c_previous_stack_read := previous_stack_read;
     VAR_sub2_uxn_opcodes_h_l2946_c40_0ad8_previous_stack_read := previous_stack_read;
     VAR_sub_uxn_opcodes_h_l2945_c40_26e9_previous_stack_read := previous_stack_read;
     VAR_swp2_uxn_opcodes_h_l2904_c40_4776_previous_stack_read := previous_stack_read;
     VAR_swp_uxn_opcodes_h_l2903_c40_183e_previous_stack_read := previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2966_c3_e525_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l2963_c2_dc35_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2964_c3_271b_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l2963_c2_dc35_iffalse := sp1;
     -- CONST_SR_6[uxn_opcodes_h_l2960_c16_fa0d] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_opcodes_h_l2960_c16_fa0d_x <= VAR_CONST_SR_6_uxn_opcodes_h_l2960_c16_fa0d_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_opcodes_h_l2960_c16_fa0d_return_output := CONST_SR_6_uxn_opcodes_h_l2960_c16_fa0d_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2881_c14_9fde] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2881_c14_9fde_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2881_c14_9fde_left;
     BIN_OP_AND_uxn_opcodes_h_l2881_c14_9fde_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2881_c14_9fde_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2881_c14_9fde_return_output := BIN_OP_AND_uxn_opcodes_h_l2881_c14_9fde_return_output;

     -- brk[uxn_opcodes_h_l2889_c48_5e4f] LATENCY=0
     -- Inputs
     brk_uxn_opcodes_h_l2889_c48_5e4f_phase <= VAR_brk_uxn_opcodes_h_l2889_c48_5e4f_phase;
     -- Outputs
     VAR_brk_uxn_opcodes_h_l2889_c48_5e4f_return_output := brk_uxn_opcodes_h_l2889_c48_5e4f_return_output;

     -- Submodule level 1
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2882_c14_1402_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2881_c14_9fde_return_output;
     VAR_MUX_uxn_opcodes_h_l2883_c8_0758_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l2881_c14_9fde_return_output;
     REG_VAR_ins_a_3f := VAR_BIN_OP_AND_uxn_opcodes_h_l2881_c14_9fde_return_output;
     VAR_stack_index_uxn_opcodes_h_l2960_c2_9c85 := resize(VAR_CONST_SR_6_uxn_opcodes_h_l2960_c16_fa0d_return_output, 1);
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_iftrue := VAR_brk_uxn_opcodes_h_l2889_c48_5e4f_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2961_c2_36f6_left := VAR_stack_index_uxn_opcodes_h_l2960_c2_9c85;
     -- BIN_OP_XOR[uxn_opcodes_h_l2882_c14_1402] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2882_c14_1402_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2882_c14_1402_left;
     BIN_OP_XOR_uxn_opcodes_h_l2882_c14_1402_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2882_c14_1402_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2882_c14_1402_return_output := BIN_OP_XOR_uxn_opcodes_h_l2882_c14_1402_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l2882_c14_00ea_left := VAR_BIN_OP_XOR_uxn_opcodes_h_l2882_c14_1402_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2882_c14_00ea] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2882_c14_00ea_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2882_c14_00ea_left;
     BIN_OP_OR_uxn_opcodes_h_l2882_c14_00ea_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2882_c14_00ea_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2882_c14_00ea_return_output := BIN_OP_OR_uxn_opcodes_h_l2882_c14_00ea_return_output;

     -- Submodule level 3
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2882_c14_ca9d_expr := VAR_BIN_OP_OR_uxn_opcodes_h_l2882_c14_00ea_return_output;
     -- UNARY_OP_NOT[uxn_opcodes_h_l2882_c14_ca9d] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l2882_c14_ca9d_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l2882_c14_ca9d_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2882_c14_ca9d_return_output := UNARY_OP_NOT_uxn_opcodes_h_l2882_c14_ca9d_return_output;

     -- Submodule level 4
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2882_c14_eb9a_left := VAR_UNARY_OP_NOT_uxn_opcodes_h_l2882_c14_ca9d_return_output;
     -- BIN_OP_NEQ[uxn_opcodes_h_l2882_c14_eb9a] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_opcodes_h_l2882_c14_eb9a_left <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2882_c14_eb9a_left;
     BIN_OP_NEQ_uxn_opcodes_h_l2882_c14_eb9a_right <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2882_c14_eb9a_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2882_c14_eb9a_return_output := BIN_OP_NEQ_uxn_opcodes_h_l2882_c14_eb9a_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_opcodes_h_l2882_c14_c701_cond := VAR_BIN_OP_NEQ_uxn_opcodes_h_l2882_c14_eb9a_return_output;
     -- MUX[uxn_opcodes_h_l2882_c14_c701] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2882_c14_c701_cond <= VAR_MUX_uxn_opcodes_h_l2882_c14_c701_cond;
     MUX_uxn_opcodes_h_l2882_c14_c701_iftrue <= VAR_MUX_uxn_opcodes_h_l2882_c14_c701_iftrue;
     MUX_uxn_opcodes_h_l2882_c14_c701_iffalse <= VAR_MUX_uxn_opcodes_h_l2882_c14_c701_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2882_c14_c701_return_output := MUX_uxn_opcodes_h_l2882_c14_c701_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_opcodes_h_l2883_c8_0758_cond := VAR_MUX_uxn_opcodes_h_l2882_c14_c701_return_output;
     REG_VAR_is_imm := VAR_MUX_uxn_opcodes_h_l2882_c14_c701_return_output;
     -- MUX[uxn_opcodes_h_l2883_c8_0758] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2883_c8_0758_cond <= VAR_MUX_uxn_opcodes_h_l2883_c8_0758_cond;
     MUX_uxn_opcodes_h_l2883_c8_0758_iftrue <= VAR_MUX_uxn_opcodes_h_l2883_c8_0758_iftrue;
     MUX_uxn_opcodes_h_l2883_c8_0758_iffalse <= VAR_MUX_uxn_opcodes_h_l2883_c8_0758_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output := MUX_uxn_opcodes_h_l2883_c8_0758_return_output;

     -- Submodule level 7
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c6_90ad_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1f15_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_daa3_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_1305_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4677_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_fc3b_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3368_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_b543_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_2162_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_5698_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_8062_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_55f1_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_12b0_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8b2b_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2c9a_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4448_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_eb86_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_c483_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c602_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_55ee_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7b58_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_89cd_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_f85c_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_52a6_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8326_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d754_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b457_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_68ad_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3b17_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_3a36_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f9ef_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_64a3_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_63a2_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_db69_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7fe2_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_bcf8_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_5c03_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_becd_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_d52f_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e69a_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e2_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_de9c_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_ca75_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3006_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_7980_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c3b4_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_651b_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_445d_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_d7a2_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7f56_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3a3a_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_9834_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_68c3_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1ed2_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2357_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_149b_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_14bf_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_3f68_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_6672_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_f3db_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_ca08_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4ad2_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_a168_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e60b_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_6499_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_9e75_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_e2e9_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_fb6d_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e071_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2958_c11_4d83_left := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     REG_VAR_opc := VAR_MUX_uxn_opcodes_h_l2883_c8_0758_return_output;
     -- BIN_OP_EQ[uxn_opcodes_h_l2948_c11_f3db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2948_c11_f3db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_f3db_left;
     BIN_OP_EQ_uxn_opcodes_h_l2948_c11_f3db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_f3db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_f3db_return_output := BIN_OP_EQ_uxn_opcodes_h_l2948_c11_f3db_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_eb86] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_eb86_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_eb86_left;
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_eb86_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_eb86_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_eb86_return_output := BIN_OP_EQ_uxn_opcodes_h_l2905_c11_eb86_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_61e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_8b2b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8b2b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8b2b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8b2b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8b2b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8b2b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8b2b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_8062] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_8062_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_8062_left;
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_8062_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_8062_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_8062_return_output := BIN_OP_EQ_uxn_opcodes_h_l2899_c11_8062_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_7980] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_7980_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_7980_left;
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_7980_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_7980_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_7980_return_output := BIN_OP_EQ_uxn_opcodes_h_l2933_c11_7980_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_2162] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_2162_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_2162_left;
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_2162_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_2162_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_2162_return_output := BIN_OP_EQ_uxn_opcodes_h_l2897_c11_2162_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_e69a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e69a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e69a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e69a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e69a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e69a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e69a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_5c03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_5c03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_5c03_left;
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_5c03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_5c03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_5c03_return_output := BIN_OP_EQ_uxn_opcodes_h_l2925_c11_5c03_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2941_c11_68c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2941_c11_68c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_68c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2941_c11_68c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_68c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_68c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2941_c11_68c3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_4448] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4448_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4448_left;
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4448_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4448_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4448_return_output := BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4448_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_445d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_445d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_445d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_445d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_445d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_445d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2936_c11_445d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_becd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_becd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_becd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_becd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_becd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_becd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2926_c11_becd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_3006] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3006_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3006_left;
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3006_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3006_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3006_return_output := BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3006_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_9834] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_9834_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_9834_left;
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_9834_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_9834_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_9834_return_output := BIN_OP_EQ_uxn_opcodes_h_l2940_c11_9834_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_8326] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8326_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8326_left;
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8326_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8326_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8326_return_output := BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8326_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2956_c11_fb6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2956_c11_fb6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_fb6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2956_c11_fb6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_fb6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_fb6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2956_c11_fb6d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_89cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_89cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_89cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_89cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_89cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_89cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2910_c11_89cd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2954_c11_9e75] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2954_c11_9e75_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_9e75_left;
     BIN_OP_EQ_uxn_opcodes_h_l2954_c11_9e75_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_9e75_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_9e75_return_output := BIN_OP_EQ_uxn_opcodes_h_l2954_c11_9e75_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_651b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_651b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_651b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_651b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_651b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_651b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2935_c11_651b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_db69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_db69_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_db69_left;
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_db69_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_db69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_db69_return_output := BIN_OP_EQ_uxn_opcodes_h_l2922_c11_db69_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_3a3a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3a3a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3a3a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3a3a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3a3a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3a3a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3a3a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_f9ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f9ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f9ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f9ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f9ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f9ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f9ef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_2c9a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2c9a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2c9a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2c9a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2c9a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2c9a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2c9a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2942_c11_1ed2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1ed2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1ed2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1ed2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1ed2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1ed2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1ed2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2891_c11_daa3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2891_c11_daa3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_daa3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2891_c11_daa3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_daa3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_daa3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2891_c11_daa3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2944_c11_149b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2944_c11_149b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_149b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2944_c11_149b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_149b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_149b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2944_c11_149b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_f85c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_f85c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_f85c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_f85c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_f85c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_f85c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2911_c11_f85c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_3368] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3368_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3368_left;
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3368_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3368_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3368_return_output := BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3368_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2950_c11_4ad2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4ad2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4ad2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4ad2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4ad2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4ad2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4ad2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2949_c11_ca08] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2949_c11_ca08_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_ca08_left;
     BIN_OP_EQ_uxn_opcodes_h_l2949_c11_ca08_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_ca08_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_ca08_return_output := BIN_OP_EQ_uxn_opcodes_h_l2949_c11_ca08_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2955_c11_e2e9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2955_c11_e2e9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_e2e9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2955_c11_e2e9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_e2e9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_e2e9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2955_c11_e2e9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_ca75] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_ca75_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_ca75_left;
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_ca75_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_ca75_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_ca75_return_output := BIN_OP_EQ_uxn_opcodes_h_l2931_c11_ca75_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2893_c11_4677] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4677_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4677_left;
     BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4677_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4677_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4677_return_output := BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4677_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2952_c11_e60b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e60b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e60b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e60b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e60b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e60b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e60b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_7fe2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7fe2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7fe2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7fe2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7fe2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7fe2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7fe2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_bcf8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_bcf8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_bcf8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_bcf8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_bcf8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_bcf8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2924_c11_bcf8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_7b58] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7b58_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7b58_left;
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7b58_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7b58_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7b58_return_output := BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7b58_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2957_c11_e071] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e071_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e071_left;
     BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e071_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e071_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e071_return_output := BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e071_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_de9c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_de9c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_de9c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_de9c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_de9c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_de9c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2930_c11_de9c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_fc3b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_fc3b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_fc3b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_fc3b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_fc3b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_fc3b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2894_c11_fc3b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_b457] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b457_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b457_left;
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b457_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b457_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b457_return_output := BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b457_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_52a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_52a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_52a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_52a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_52a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_52a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2912_c11_52a6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2945_c11_14bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2945_c11_14bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_14bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2945_c11_14bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_14bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_14bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2945_c11_14bf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_3b17] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3b17_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3b17_left;
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3b17_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3b17_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3b17_return_output := BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3b17_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_55ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_55ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_55ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_55ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_55ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_55ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l2908_c11_55ee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2890_c11_1f15] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1f15_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1f15_left;
     BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1f15_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1f15_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1f15_return_output := BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1f15_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_c3b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c3b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c3b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c3b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c3b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c3b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c3b4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_3a36] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_3a36_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_3a36_left;
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_3a36_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_3a36_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_3a36_return_output := BIN_OP_EQ_uxn_opcodes_h_l2918_c11_3a36_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2953_c11_6499] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2953_c11_6499_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_6499_left;
     BIN_OP_EQ_uxn_opcodes_h_l2953_c11_6499_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_6499_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_6499_return_output := BIN_OP_EQ_uxn_opcodes_h_l2953_c11_6499_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2958_c11_4d83] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2958_c11_4d83_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2958_c11_4d83_left;
     BIN_OP_EQ_uxn_opcodes_h_l2958_c11_4d83_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2958_c11_4d83_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2958_c11_4d83_return_output := BIN_OP_EQ_uxn_opcodes_h_l2958_c11_4d83_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_d52f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_d52f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_d52f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_d52f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_d52f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_d52f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2927_c11_d52f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2951_c11_a168] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2951_c11_a168_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_a168_left;
     BIN_OP_EQ_uxn_opcodes_h_l2951_c11_a168_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_a168_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_a168_return_output := BIN_OP_EQ_uxn_opcodes_h_l2951_c11_a168_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2947_c11_6672] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2947_c11_6672_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_6672_left;
     BIN_OP_EQ_uxn_opcodes_h_l2947_c11_6672_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_6672_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_6672_return_output := BIN_OP_EQ_uxn_opcodes_h_l2947_c11_6672_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_55f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_55f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_55f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_55f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_55f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_55f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2900_c11_55f1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_63a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_63a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_63a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_63a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_63a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_63a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2921_c11_63a2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_c602] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c602_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c602_left;
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c602_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c602_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c602_return_output := BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c602_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2889_c6_90ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2889_c6_90ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c6_90ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l2889_c6_90ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c6_90ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c6_90ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l2889_c6_90ad_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_7f56] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7f56_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7f56_left;
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7f56_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7f56_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7f56_return_output := BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7f56_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_c483] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_c483_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_c483_left;
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_c483_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_c483_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_c483_return_output := BIN_OP_EQ_uxn_opcodes_h_l2906_c11_c483_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_1305] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_1305_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_1305_left;
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_1305_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_1305_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_1305_return_output := BIN_OP_EQ_uxn_opcodes_h_l2892_c11_1305_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_d754] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d754_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d754_left;
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d754_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d754_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d754_return_output := BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d754_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2898_c11_5698] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2898_c11_5698_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_5698_left;
     BIN_OP_EQ_uxn_opcodes_h_l2898_c11_5698_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_5698_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_5698_return_output := BIN_OP_EQ_uxn_opcodes_h_l2898_c11_5698_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_64a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_64a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_64a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_64a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_64a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_64a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2920_c11_64a3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2946_c11_3f68] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2946_c11_3f68_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_3f68_left;
     BIN_OP_EQ_uxn_opcodes_h_l2946_c11_3f68_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_3f68_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_3f68_return_output := BIN_OP_EQ_uxn_opcodes_h_l2946_c11_3f68_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_12b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_12b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_12b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_12b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_12b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_12b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2901_c11_12b0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_b543] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_b543_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_b543_left;
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_b543_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_b543_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_b543_return_output := BIN_OP_EQ_uxn_opcodes_h_l2896_c11_b543_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2943_c11_2357] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2357_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2357_left;
     BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2357_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2357_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2357_return_output := BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2357_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_d7a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_d7a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_d7a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_d7a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_d7a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_d7a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2937_c11_d7a2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_68ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_68ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_68ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_68ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_68ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_68ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l2916_c11_68ad_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d402_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c6_90ad_return_output;
     VAR_is_wait_MUX_uxn_opcodes_h_l2889_c2_ac95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c6_90ad_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c6_90ad_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_27a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1f15_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_8c3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1f15_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_d402_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1f15_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_07db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_daa3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ad00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_daa3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_27a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_daa3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_4a49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_1305_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_46a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_1305_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_07db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_1305_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_5457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4677_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_6ea9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4677_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_4a49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_4677_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_d0e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_fc3b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_9afe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_fc3b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_5457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_fc3b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_c86f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3368_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3b1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3368_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_d0e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3368_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_b543_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_b543_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_c86f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_b543_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f54c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_2162_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_bf9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_2162_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_6fee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_2162_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2b32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_5698_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_30da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_5698_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_f54c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_5698_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_89d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_8062_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7a01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_8062_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_2b32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_8062_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4b8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_55f1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_455f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_55f1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_89d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_55f1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_12b0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_5a28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_12b0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_4b8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_12b0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_24d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8b2b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_0900_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8b2b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_5ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8b2b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1bfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2c9a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_aac9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2c9a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_24d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2c9a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fdd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4448_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_83cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4448_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_1bfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4448_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_30fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_eb86_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_431a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_eb86_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_fdd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_eb86_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d53c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_c483_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_4ecb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_c483_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_30fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_c483_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_cd44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c602_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cf71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c602_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d53c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c602_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_55ee_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ca3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_55ee_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_cd44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_55ee_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_94ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7b58_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0d5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7b58_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_e639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7b58_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_cacc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_89cd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_895b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_89cd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_94ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_89cd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_8f7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_f85c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1ce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_f85c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_cacc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_f85c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_52a6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_bdb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_52a6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_8f7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_52a6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8458_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8326_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_fea9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8326_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_0f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8326_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_60a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d754_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_2121_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d754_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_8458_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d754_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ec5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b457_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_2748_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b457_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_60a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_b457_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8d46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_68ad_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0df6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_68ad_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_ec5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_68ad_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8f8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3b17_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fa16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3b17_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8d46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3b17_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4bcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_3a36_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_c6bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_3a36_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8f8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_3a36_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_b546_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f9ef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4ee5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f9ef_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4bcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f9ef_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_b35c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_64a3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d66d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_64a3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_b546_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_64a3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0723_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_63a2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_ac21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_63a2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_b35c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_63a2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f85d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_db69_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_fd5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_db69_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_0723_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_db69_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_c25a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7fe2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_8ce0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7fe2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f85d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7fe2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5cec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_bcf8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_1d99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_bcf8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_c25a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_bcf8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e7bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_5c03_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bd5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_5c03_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_5cec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_5c03_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3c0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_becd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_68d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_becd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_e7bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_becd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_71d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_d52f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_00b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_d52f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_3c0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_d52f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_60b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e69a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1556_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e69a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_71d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e69a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b88d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4489_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_60b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_729b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_de9c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_428f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_de9c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b88d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_de9c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_307d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_ca75_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_0e50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_ca75_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_729b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_ca75_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_0745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3006_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_6c24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3006_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_307d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3006_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_0585_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_7980_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_eabd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_7980_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_0745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_7980_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8064_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c3b4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_04d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c3b4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_0585_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c3b4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0b25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_651b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3c43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_651b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_8064_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_651b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_445d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_f81c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_445d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_0b25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_445d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4cb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_d7a2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_ab1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_d7a2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_3786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_d7a2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4841_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7f56_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_82f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7f56_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_4cb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7f56_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_7c8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3a3a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2a1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3a3a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_4841_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3a3a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_636d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_9834_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_5e1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_9834_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_7c8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_9834_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4f24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_68c3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_518d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_68c3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_636d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_68c3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_10e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1ed2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_8823_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1ed2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_4f24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1ed2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_9702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2357_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_98d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2357_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_10e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2357_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_875e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_149b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_6b48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_149b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_9702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_149b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_7106_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_14bf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_2ac1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_14bf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_875e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_14bf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_8f5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_3f68_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_e34d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_3f68_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_7106_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_3f68_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_e52a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_6672_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_9eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_6672_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_8f5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_6672_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_1fe8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_f3db_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_cbbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_f3db_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_e52a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_f3db_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_dd18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_ca08_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2b07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_ca08_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_1fe8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_ca08_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_56b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4ad2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_5f61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4ad2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_dd18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4ad2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_946b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_a168_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_acd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_a168_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_56b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_a168_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_04ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e60b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_a391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e60b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_946b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e60b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_8594_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_6499_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_7ec8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_6499_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_04ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_6499_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ab66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_9e75_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_95b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_9e75_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_8594_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_9e75_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_904a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_e2e9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_14ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_e2e9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_ab66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_e2e9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_386e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_fb6d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_faad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_fb6d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_904a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_fb6d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_b055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e071_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_bcb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e071_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_386e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e071_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_7a91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2958_c11_4d83_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_b055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2958_c11_4d83_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c7_d402] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d402_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d402_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d402_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d402_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d402_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d402_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d402_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d402_return_output;

     -- is_wait_MUX[uxn_opcodes_h_l2889_c2_ac95] LATENCY=0
     -- Inputs
     is_wait_MUX_uxn_opcodes_h_l2889_c2_ac95_cond <= VAR_is_wait_MUX_uxn_opcodes_h_l2889_c2_ac95_cond;
     is_wait_MUX_uxn_opcodes_h_l2889_c2_ac95_iftrue <= VAR_is_wait_MUX_uxn_opcodes_h_l2889_c2_ac95_iftrue;
     is_wait_MUX_uxn_opcodes_h_l2889_c2_ac95_iffalse <= VAR_is_wait_MUX_uxn_opcodes_h_l2889_c2_ac95_iffalse;
     -- Outputs
     VAR_is_wait_MUX_uxn_opcodes_h_l2889_c2_ac95_return_output := is_wait_MUX_uxn_opcodes_h_l2889_c2_ac95_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_27a4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d402_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_8c3f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d402_return_output;
     REG_VAR_is_wait := VAR_is_wait_MUX_uxn_opcodes_h_l2889_c2_ac95_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c7_27a4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_27a4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_27a4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_27a4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_27a4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_27a4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_27a4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_27a4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_27a4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c1_8c3f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_8c3f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_8c3f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_8c3f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_8c3f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_8c3f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_8c3f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_8c3f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_8c3f_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_07db_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_27a4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ad00_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_27a4_return_output;
     VAR_jci_uxn_opcodes_h_l2890_c40_ebae_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_8c3f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c7_07db] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_07db_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_07db_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_07db_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_07db_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_07db_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_07db_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_07db_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_07db_return_output;

     -- jci[uxn_opcodes_h_l2890_c40_ebae] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l2890_c40_ebae_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l2890_c40_ebae_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l2890_c40_ebae_phase <= VAR_jci_uxn_opcodes_h_l2890_c40_ebae_phase;
     jci_uxn_opcodes_h_l2890_c40_ebae_pc <= VAR_jci_uxn_opcodes_h_l2890_c40_ebae_pc;
     jci_uxn_opcodes_h_l2890_c40_ebae_previous_stack_read <= VAR_jci_uxn_opcodes_h_l2890_c40_ebae_previous_stack_read;
     jci_uxn_opcodes_h_l2890_c40_ebae_previous_ram_read <= VAR_jci_uxn_opcodes_h_l2890_c40_ebae_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l2890_c40_ebae_return_output := jci_uxn_opcodes_h_l2890_c40_ebae_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c1_ad00] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ad00_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ad00_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ad00_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ad00_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ad00_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ad00_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ad00_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ad00_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_4a49_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_07db_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_46a9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_07db_return_output;
     VAR_jmi_uxn_opcodes_h_l2891_c40_12f6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ad00_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_d402_iftrue := VAR_jci_uxn_opcodes_h_l2890_c40_ebae_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c1_46a9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_46a9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_46a9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_46a9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_46a9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_46a9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_46a9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_46a9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_46a9_return_output;

     -- jmi[uxn_opcodes_h_l2891_c40_12f6] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l2891_c40_12f6_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l2891_c40_12f6_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l2891_c40_12f6_phase <= VAR_jmi_uxn_opcodes_h_l2891_c40_12f6_phase;
     jmi_uxn_opcodes_h_l2891_c40_12f6_pc <= VAR_jmi_uxn_opcodes_h_l2891_c40_12f6_pc;
     jmi_uxn_opcodes_h_l2891_c40_12f6_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l2891_c40_12f6_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l2891_c40_12f6_return_output := jmi_uxn_opcodes_h_l2891_c40_12f6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c7_4a49] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_4a49_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_4a49_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_4a49_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_4a49_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_4a49_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_4a49_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_4a49_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_4a49_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_5457_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_4a49_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_6ea9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_4a49_return_output;
     VAR_jsi_uxn_opcodes_h_l2892_c40_7ef2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_46a9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_27a4_iftrue := VAR_jmi_uxn_opcodes_h_l2891_c40_12f6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c7_5457] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_5457_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_5457_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_5457_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_5457_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_5457_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_5457_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_5457_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_5457_return_output;

     -- jsi[uxn_opcodes_h_l2892_c40_7ef2] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l2892_c40_7ef2_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l2892_c40_7ef2_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l2892_c40_7ef2_phase <= VAR_jsi_uxn_opcodes_h_l2892_c40_7ef2_phase;
     jsi_uxn_opcodes_h_l2892_c40_7ef2_pc <= VAR_jsi_uxn_opcodes_h_l2892_c40_7ef2_pc;
     jsi_uxn_opcodes_h_l2892_c40_7ef2_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l2892_c40_7ef2_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l2892_c40_7ef2_return_output := jsi_uxn_opcodes_h_l2892_c40_7ef2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c1_6ea9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_6ea9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_6ea9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_6ea9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_6ea9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_6ea9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_6ea9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_6ea9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_6ea9_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_d0e8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_5457_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_9afe_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_5457_return_output;
     VAR_lit_uxn_opcodes_h_l2893_c40_ecac_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_6ea9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_07db_iftrue := VAR_jsi_uxn_opcodes_h_l2892_c40_7ef2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c7_d0e8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_d0e8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_d0e8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_d0e8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_d0e8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_d0e8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_d0e8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_d0e8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_d0e8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c1_9afe] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_9afe_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_9afe_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_9afe_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_9afe_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_9afe_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_9afe_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_9afe_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_9afe_return_output;

     -- lit[uxn_opcodes_h_l2893_c40_ecac] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2893_c40_ecac_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2893_c40_ecac_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2893_c40_ecac_phase <= VAR_lit_uxn_opcodes_h_l2893_c40_ecac_phase;
     lit_uxn_opcodes_h_l2893_c40_ecac_pc <= VAR_lit_uxn_opcodes_h_l2893_c40_ecac_pc;
     lit_uxn_opcodes_h_l2893_c40_ecac_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2893_c40_ecac_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2893_c40_ecac_return_output := lit_uxn_opcodes_h_l2893_c40_ecac_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_c86f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_d0e8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3b1a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_d0e8_return_output;
     VAR_lit2_uxn_opcodes_h_l2894_c40_fc02_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_9afe_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_4a49_iftrue := VAR_lit_uxn_opcodes_h_l2893_c40_ecac_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c7_c86f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_c86f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_c86f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_c86f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_c86f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_c86f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_c86f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_c86f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_c86f_return_output;

     -- lit2[uxn_opcodes_h_l2894_c40_fc02] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2894_c40_fc02_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2894_c40_fc02_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2894_c40_fc02_phase <= VAR_lit2_uxn_opcodes_h_l2894_c40_fc02_phase;
     lit2_uxn_opcodes_h_l2894_c40_fc02_pc <= VAR_lit2_uxn_opcodes_h_l2894_c40_fc02_pc;
     lit2_uxn_opcodes_h_l2894_c40_fc02_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2894_c40_fc02_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2894_c40_fc02_return_output := lit2_uxn_opcodes_h_l2894_c40_fc02_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c1_3b1a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3b1a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3b1a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3b1a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3b1a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3b1a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3b1a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3b1a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3b1a_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fee_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_c86f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31b5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_c86f_return_output;
     VAR_lit_uxn_opcodes_h_l2895_c40_9062_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3b1a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_5457_iftrue := VAR_lit2_uxn_opcodes_h_l2894_c40_fc02_return_output;
     -- lit[uxn_opcodes_h_l2895_c40_9062] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2895_c40_9062_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2895_c40_9062_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2895_c40_9062_phase <= VAR_lit_uxn_opcodes_h_l2895_c40_9062_phase;
     lit_uxn_opcodes_h_l2895_c40_9062_pc <= VAR_lit_uxn_opcodes_h_l2895_c40_9062_pc;
     lit_uxn_opcodes_h_l2895_c40_9062_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2895_c40_9062_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2895_c40_9062_return_output := lit_uxn_opcodes_h_l2895_c40_9062_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c7_6fee] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fee_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fee_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fee_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fee_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fee_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fee_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fee_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fee_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c1_31b5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31b5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31b5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31b5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31b5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31b5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31b5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31b5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31b5_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f54c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fee_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_bf9d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fee_return_output;
     VAR_lit2_uxn_opcodes_h_l2896_c40_3ad0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31b5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_d0e8_iftrue := VAR_lit_uxn_opcodes_h_l2895_c40_9062_return_output;
     -- lit2[uxn_opcodes_h_l2896_c40_3ad0] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2896_c40_3ad0_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2896_c40_3ad0_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2896_c40_3ad0_phase <= VAR_lit2_uxn_opcodes_h_l2896_c40_3ad0_phase;
     lit2_uxn_opcodes_h_l2896_c40_3ad0_pc <= VAR_lit2_uxn_opcodes_h_l2896_c40_3ad0_pc;
     lit2_uxn_opcodes_h_l2896_c40_3ad0_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2896_c40_3ad0_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2896_c40_3ad0_return_output := lit2_uxn_opcodes_h_l2896_c40_3ad0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c7_f54c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f54c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f54c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f54c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f54c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f54c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f54c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f54c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f54c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c1_bf9d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_bf9d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_bf9d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_bf9d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_bf9d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_bf9d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_bf9d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_bf9d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_bf9d_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2b32_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f54c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_30da_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_f54c_return_output;
     VAR_inc_uxn_opcodes_h_l2897_c40_3f15_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_bf9d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_c86f_iftrue := VAR_lit2_uxn_opcodes_h_l2896_c40_3ad0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_30da] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_30da_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_30da_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_30da_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_30da_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_30da_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_30da_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_30da_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_30da_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_2b32] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2b32_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2b32_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2b32_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2b32_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2b32_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2b32_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2b32_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2b32_return_output;

     -- inc[uxn_opcodes_h_l2897_c40_3f15] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l2897_c40_3f15_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l2897_c40_3f15_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l2897_c40_3f15_phase <= VAR_inc_uxn_opcodes_h_l2897_c40_3f15_phase;
     inc_uxn_opcodes_h_l2897_c40_3f15_ins <= VAR_inc_uxn_opcodes_h_l2897_c40_3f15_ins;
     inc_uxn_opcodes_h_l2897_c40_3f15_previous_stack_read <= VAR_inc_uxn_opcodes_h_l2897_c40_3f15_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l2897_c40_3f15_return_output := inc_uxn_opcodes_h_l2897_c40_3f15_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_89d5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2b32_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7a01_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_2b32_return_output;
     VAR_inc2_uxn_opcodes_h_l2898_c40_e3a1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_30da_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_6fee_iftrue := VAR_inc_uxn_opcodes_h_l2897_c40_3f15_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_7a01] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7a01_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7a01_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7a01_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7a01_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7a01_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7a01_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7a01_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7a01_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_89d5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_89d5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_89d5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_89d5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_89d5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_89d5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_89d5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_89d5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_89d5_return_output;

     -- inc2[uxn_opcodes_h_l2898_c40_e3a1] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l2898_c40_e3a1_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l2898_c40_e3a1_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l2898_c40_e3a1_phase <= VAR_inc2_uxn_opcodes_h_l2898_c40_e3a1_phase;
     inc2_uxn_opcodes_h_l2898_c40_e3a1_ins <= VAR_inc2_uxn_opcodes_h_l2898_c40_e3a1_ins;
     inc2_uxn_opcodes_h_l2898_c40_e3a1_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l2898_c40_e3a1_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l2898_c40_e3a1_return_output := inc2_uxn_opcodes_h_l2898_c40_e3a1_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4b8a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_89d5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_455f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_89d5_return_output;
     VAR_pop_uxn_opcodes_h_l2899_c40_ce4a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7a01_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_f54c_iftrue := VAR_inc2_uxn_opcodes_h_l2898_c40_e3a1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_455f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_455f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_455f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_455f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_455f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_455f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_455f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_455f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_455f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_4b8a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4b8a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4b8a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4b8a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4b8a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4b8a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4b8a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4b8a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4b8a_return_output;

     -- pop[uxn_opcodes_h_l2899_c40_ce4a] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l2899_c40_ce4a_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l2899_c40_ce4a_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l2899_c40_ce4a_phase <= VAR_pop_uxn_opcodes_h_l2899_c40_ce4a_phase;
     pop_uxn_opcodes_h_l2899_c40_ce4a_ins <= VAR_pop_uxn_opcodes_h_l2899_c40_ce4a_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l2899_c40_ce4a_return_output := pop_uxn_opcodes_h_l2899_c40_ce4a_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5ca8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4b8a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_5a28_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4b8a_return_output;
     VAR_pop2_uxn_opcodes_h_l2900_c40_61c0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_455f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_2b32_iftrue := VAR_pop_uxn_opcodes_h_l2899_c40_ce4a_return_output;
     -- pop2[uxn_opcodes_h_l2900_c40_61c0] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l2900_c40_61c0_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l2900_c40_61c0_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l2900_c40_61c0_phase <= VAR_pop2_uxn_opcodes_h_l2900_c40_61c0_phase;
     pop2_uxn_opcodes_h_l2900_c40_61c0_ins <= VAR_pop2_uxn_opcodes_h_l2900_c40_61c0_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l2900_c40_61c0_return_output := pop2_uxn_opcodes_h_l2900_c40_61c0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_5ca8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5ca8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5ca8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5ca8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5ca8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5ca8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5ca8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5ca8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5ca8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_5a28] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_5a28_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_5a28_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_5a28_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_5a28_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_5a28_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_5a28_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_5a28_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_5a28_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_24d6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5ca8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_0900_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_5ca8_return_output;
     VAR_nip_uxn_opcodes_h_l2901_c40_c96b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_5a28_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_89d5_iftrue := VAR_pop2_uxn_opcodes_h_l2900_c40_61c0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_24d6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_24d6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_24d6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_24d6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_24d6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_24d6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_24d6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_24d6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_24d6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_0900] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_0900_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_0900_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_0900_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_0900_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_0900_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_0900_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_0900_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_0900_return_output;

     -- nip[uxn_opcodes_h_l2901_c40_c96b] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l2901_c40_c96b_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l2901_c40_c96b_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l2901_c40_c96b_phase <= VAR_nip_uxn_opcodes_h_l2901_c40_c96b_phase;
     nip_uxn_opcodes_h_l2901_c40_c96b_ins <= VAR_nip_uxn_opcodes_h_l2901_c40_c96b_ins;
     nip_uxn_opcodes_h_l2901_c40_c96b_previous_stack_read <= VAR_nip_uxn_opcodes_h_l2901_c40_c96b_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l2901_c40_c96b_return_output := nip_uxn_opcodes_h_l2901_c40_c96b_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1bfc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_24d6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_aac9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_24d6_return_output;
     VAR_nip2_uxn_opcodes_h_l2902_c40_7979_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_0900_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_4b8a_iftrue := VAR_nip_uxn_opcodes_h_l2901_c40_c96b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_aac9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_aac9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_aac9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_aac9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_aac9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_aac9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_aac9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_aac9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_aac9_return_output;

     -- nip2[uxn_opcodes_h_l2902_c40_7979] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l2902_c40_7979_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l2902_c40_7979_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l2902_c40_7979_phase <= VAR_nip2_uxn_opcodes_h_l2902_c40_7979_phase;
     nip2_uxn_opcodes_h_l2902_c40_7979_ins <= VAR_nip2_uxn_opcodes_h_l2902_c40_7979_ins;
     nip2_uxn_opcodes_h_l2902_c40_7979_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l2902_c40_7979_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l2902_c40_7979_return_output := nip2_uxn_opcodes_h_l2902_c40_7979_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_1bfc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1bfc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1bfc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1bfc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1bfc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1bfc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1bfc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1bfc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1bfc_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fdd3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1bfc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_83cd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1bfc_return_output;
     VAR_swp_uxn_opcodes_h_l2903_c40_183e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_aac9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_5ca8_iftrue := VAR_nip2_uxn_opcodes_h_l2902_c40_7979_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_83cd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_83cd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_83cd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_83cd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_83cd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_83cd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_83cd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_83cd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_83cd_return_output;

     -- swp[uxn_opcodes_h_l2903_c40_183e] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l2903_c40_183e_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l2903_c40_183e_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l2903_c40_183e_phase <= VAR_swp_uxn_opcodes_h_l2903_c40_183e_phase;
     swp_uxn_opcodes_h_l2903_c40_183e_ins <= VAR_swp_uxn_opcodes_h_l2903_c40_183e_ins;
     swp_uxn_opcodes_h_l2903_c40_183e_previous_stack_read <= VAR_swp_uxn_opcodes_h_l2903_c40_183e_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l2903_c40_183e_return_output := swp_uxn_opcodes_h_l2903_c40_183e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_fdd3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fdd3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fdd3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fdd3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fdd3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fdd3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fdd3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fdd3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fdd3_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_30fd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fdd3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_431a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fdd3_return_output;
     VAR_swp2_uxn_opcodes_h_l2904_c40_4776_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_83cd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_24d6_iftrue := VAR_swp_uxn_opcodes_h_l2903_c40_183e_return_output;
     -- swp2[uxn_opcodes_h_l2904_c40_4776] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l2904_c40_4776_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l2904_c40_4776_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l2904_c40_4776_phase <= VAR_swp2_uxn_opcodes_h_l2904_c40_4776_phase;
     swp2_uxn_opcodes_h_l2904_c40_4776_ins <= VAR_swp2_uxn_opcodes_h_l2904_c40_4776_ins;
     swp2_uxn_opcodes_h_l2904_c40_4776_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l2904_c40_4776_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l2904_c40_4776_return_output := swp2_uxn_opcodes_h_l2904_c40_4776_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_30fd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_30fd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_30fd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_30fd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_30fd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_30fd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_30fd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_30fd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_30fd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_431a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_431a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_431a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_431a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_431a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_431a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_431a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_431a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_431a_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d53c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_30fd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_4ecb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_30fd_return_output;
     VAR_rot_uxn_opcodes_h_l2905_c40_5d08_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_431a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_1bfc_iftrue := VAR_swp2_uxn_opcodes_h_l2904_c40_4776_return_output;
     -- rot[uxn_opcodes_h_l2905_c40_5d08] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l2905_c40_5d08_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l2905_c40_5d08_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l2905_c40_5d08_phase <= VAR_rot_uxn_opcodes_h_l2905_c40_5d08_phase;
     rot_uxn_opcodes_h_l2905_c40_5d08_ins <= VAR_rot_uxn_opcodes_h_l2905_c40_5d08_ins;
     rot_uxn_opcodes_h_l2905_c40_5d08_previous_stack_read <= VAR_rot_uxn_opcodes_h_l2905_c40_5d08_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l2905_c40_5d08_return_output := rot_uxn_opcodes_h_l2905_c40_5d08_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_4ecb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_4ecb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_4ecb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_4ecb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_4ecb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_4ecb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_4ecb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_4ecb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_4ecb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_d53c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d53c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d53c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d53c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d53c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d53c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d53c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d53c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d53c_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_cd44_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d53c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cf71_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d53c_return_output;
     VAR_rot2_uxn_opcodes_h_l2906_c40_1572_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_4ecb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_fdd3_iftrue := VAR_rot_uxn_opcodes_h_l2905_c40_5d08_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_cd44] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_cd44_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_cd44_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_cd44_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_cd44_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_cd44_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_cd44_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_cd44_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_cd44_return_output;

     -- rot2[uxn_opcodes_h_l2906_c40_1572] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l2906_c40_1572_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l2906_c40_1572_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l2906_c40_1572_phase <= VAR_rot2_uxn_opcodes_h_l2906_c40_1572_phase;
     rot2_uxn_opcodes_h_l2906_c40_1572_ins <= VAR_rot2_uxn_opcodes_h_l2906_c40_1572_ins;
     rot2_uxn_opcodes_h_l2906_c40_1572_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l2906_c40_1572_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l2906_c40_1572_return_output := rot2_uxn_opcodes_h_l2906_c40_1572_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_cf71] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cf71_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cf71_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cf71_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cf71_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cf71_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cf71_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cf71_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cf71_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e639_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_cd44_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ca3e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_cd44_return_output;
     VAR_dup_uxn_opcodes_h_l2907_c40_ffc6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cf71_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_30fd_iftrue := VAR_rot2_uxn_opcodes_h_l2906_c40_1572_return_output;
     -- dup[uxn_opcodes_h_l2907_c40_ffc6] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l2907_c40_ffc6_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l2907_c40_ffc6_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l2907_c40_ffc6_phase <= VAR_dup_uxn_opcodes_h_l2907_c40_ffc6_phase;
     dup_uxn_opcodes_h_l2907_c40_ffc6_ins <= VAR_dup_uxn_opcodes_h_l2907_c40_ffc6_ins;
     dup_uxn_opcodes_h_l2907_c40_ffc6_previous_stack_read <= VAR_dup_uxn_opcodes_h_l2907_c40_ffc6_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l2907_c40_ffc6_return_output := dup_uxn_opcodes_h_l2907_c40_ffc6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_ca3e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ca3e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ca3e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ca3e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ca3e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ca3e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ca3e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ca3e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ca3e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_e639] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e639_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e639_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e639_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e639_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e639_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e639_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e639_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e639_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_94ca_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e639_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0d5a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_e639_return_output;
     VAR_dup2_uxn_opcodes_h_l2908_c40_c8fc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ca3e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d53c_iftrue := VAR_dup_uxn_opcodes_h_l2907_c40_ffc6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_0d5a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0d5a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0d5a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0d5a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0d5a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0d5a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0d5a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0d5a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0d5a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_94ca] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_94ca_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_94ca_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_94ca_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_94ca_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_94ca_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_94ca_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_94ca_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_94ca_return_output;

     -- dup2[uxn_opcodes_h_l2908_c40_c8fc] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l2908_c40_c8fc_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l2908_c40_c8fc_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l2908_c40_c8fc_phase <= VAR_dup2_uxn_opcodes_h_l2908_c40_c8fc_phase;
     dup2_uxn_opcodes_h_l2908_c40_c8fc_ins <= VAR_dup2_uxn_opcodes_h_l2908_c40_c8fc_ins;
     dup2_uxn_opcodes_h_l2908_c40_c8fc_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l2908_c40_c8fc_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l2908_c40_c8fc_return_output := dup2_uxn_opcodes_h_l2908_c40_c8fc_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_cacc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_94ca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_895b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_94ca_return_output;
     VAR_ovr_uxn_opcodes_h_l2909_c40_28a1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0d5a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_cd44_iftrue := VAR_dup2_uxn_opcodes_h_l2908_c40_c8fc_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_cacc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_cacc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_cacc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_cacc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_cacc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_cacc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_cacc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_cacc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_cacc_return_output;

     -- ovr[uxn_opcodes_h_l2909_c40_28a1] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l2909_c40_28a1_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l2909_c40_28a1_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l2909_c40_28a1_phase <= VAR_ovr_uxn_opcodes_h_l2909_c40_28a1_phase;
     ovr_uxn_opcodes_h_l2909_c40_28a1_ins <= VAR_ovr_uxn_opcodes_h_l2909_c40_28a1_ins;
     ovr_uxn_opcodes_h_l2909_c40_28a1_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l2909_c40_28a1_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l2909_c40_28a1_return_output := ovr_uxn_opcodes_h_l2909_c40_28a1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_895b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_895b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_895b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_895b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_895b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_895b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_895b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_895b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_895b_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_8f7e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_cacc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1ce9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_cacc_return_output;
     VAR_ovr2_uxn_opcodes_h_l2910_c40_dde0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_895b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_e639_iftrue := VAR_ovr_uxn_opcodes_h_l2909_c40_28a1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_1ce9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1ce9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1ce9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1ce9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1ce9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1ce9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1ce9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1ce9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1ce9_return_output;

     -- ovr2[uxn_opcodes_h_l2910_c40_dde0] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l2910_c40_dde0_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l2910_c40_dde0_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l2910_c40_dde0_phase <= VAR_ovr2_uxn_opcodes_h_l2910_c40_dde0_phase;
     ovr2_uxn_opcodes_h_l2910_c40_dde0_ins <= VAR_ovr2_uxn_opcodes_h_l2910_c40_dde0_ins;
     ovr2_uxn_opcodes_h_l2910_c40_dde0_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l2910_c40_dde0_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l2910_c40_dde0_return_output := ovr2_uxn_opcodes_h_l2910_c40_dde0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_8f7e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_8f7e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_8f7e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_8f7e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_8f7e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_8f7e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_8f7e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_8f7e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_8f7e_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0f12_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_8f7e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_bdb8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_8f7e_return_output;
     VAR_equ_uxn_opcodes_h_l2911_c40_edb9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1ce9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_94ca_iftrue := VAR_ovr2_uxn_opcodes_h_l2910_c40_dde0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_bdb8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_bdb8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_bdb8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_bdb8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_bdb8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_bdb8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_bdb8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_bdb8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_bdb8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_0f12] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0f12_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0f12_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0f12_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0f12_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0f12_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0f12_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0f12_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0f12_return_output;

     -- equ[uxn_opcodes_h_l2911_c40_edb9] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l2911_c40_edb9_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l2911_c40_edb9_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l2911_c40_edb9_phase <= VAR_equ_uxn_opcodes_h_l2911_c40_edb9_phase;
     equ_uxn_opcodes_h_l2911_c40_edb9_ins <= VAR_equ_uxn_opcodes_h_l2911_c40_edb9_ins;
     equ_uxn_opcodes_h_l2911_c40_edb9_previous_stack_read <= VAR_equ_uxn_opcodes_h_l2911_c40_edb9_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l2911_c40_edb9_return_output := equ_uxn_opcodes_h_l2911_c40_edb9_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8458_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0f12_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_fea9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0f12_return_output;
     VAR_equ2_uxn_opcodes_h_l2912_c40_6614_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_bdb8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_cacc_iftrue := VAR_equ_uxn_opcodes_h_l2911_c40_edb9_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_8458] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8458_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8458_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8458_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8458_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8458_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8458_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8458_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8458_return_output;

     -- equ2[uxn_opcodes_h_l2912_c40_6614] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l2912_c40_6614_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l2912_c40_6614_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l2912_c40_6614_phase <= VAR_equ2_uxn_opcodes_h_l2912_c40_6614_phase;
     equ2_uxn_opcodes_h_l2912_c40_6614_ins <= VAR_equ2_uxn_opcodes_h_l2912_c40_6614_ins;
     equ2_uxn_opcodes_h_l2912_c40_6614_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l2912_c40_6614_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l2912_c40_6614_return_output := equ2_uxn_opcodes_h_l2912_c40_6614_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_fea9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_fea9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_fea9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_fea9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_fea9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_fea9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_fea9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_fea9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_fea9_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_60a2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8458_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_2121_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8458_return_output;
     VAR_neq_uxn_opcodes_h_l2913_c40_7553_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_fea9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_8f7e_iftrue := VAR_equ2_uxn_opcodes_h_l2912_c40_6614_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_2121] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_2121_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_2121_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_2121_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_2121_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_2121_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_2121_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_2121_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_2121_return_output;

     -- neq[uxn_opcodes_h_l2913_c40_7553] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l2913_c40_7553_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l2913_c40_7553_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l2913_c40_7553_phase <= VAR_neq_uxn_opcodes_h_l2913_c40_7553_phase;
     neq_uxn_opcodes_h_l2913_c40_7553_ins <= VAR_neq_uxn_opcodes_h_l2913_c40_7553_ins;
     neq_uxn_opcodes_h_l2913_c40_7553_previous_stack_read <= VAR_neq_uxn_opcodes_h_l2913_c40_7553_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l2913_c40_7553_return_output := neq_uxn_opcodes_h_l2913_c40_7553_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_60a2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_60a2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_60a2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_60a2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_60a2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_60a2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_60a2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_60a2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_60a2_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ec5e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_60a2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_2748_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_60a2_return_output;
     VAR_neq2_uxn_opcodes_h_l2914_c40_aef0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_2121_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_0f12_iftrue := VAR_neq_uxn_opcodes_h_l2913_c40_7553_return_output;
     -- neq2[uxn_opcodes_h_l2914_c40_aef0] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l2914_c40_aef0_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l2914_c40_aef0_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l2914_c40_aef0_phase <= VAR_neq2_uxn_opcodes_h_l2914_c40_aef0_phase;
     neq2_uxn_opcodes_h_l2914_c40_aef0_ins <= VAR_neq2_uxn_opcodes_h_l2914_c40_aef0_ins;
     neq2_uxn_opcodes_h_l2914_c40_aef0_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l2914_c40_aef0_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l2914_c40_aef0_return_output := neq2_uxn_opcodes_h_l2914_c40_aef0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_2748] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_2748_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_2748_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_2748_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_2748_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_2748_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_2748_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_2748_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_2748_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_ec5e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ec5e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ec5e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ec5e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ec5e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ec5e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ec5e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ec5e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ec5e_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8d46_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ec5e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0df6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ec5e_return_output;
     VAR_gth_uxn_opcodes_h_l2915_c40_7d0a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_2748_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_8458_iftrue := VAR_neq2_uxn_opcodes_h_l2914_c40_aef0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_0df6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0df6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0df6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0df6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0df6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0df6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0df6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0df6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0df6_return_output;

     -- gth[uxn_opcodes_h_l2915_c40_7d0a] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l2915_c40_7d0a_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l2915_c40_7d0a_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l2915_c40_7d0a_phase <= VAR_gth_uxn_opcodes_h_l2915_c40_7d0a_phase;
     gth_uxn_opcodes_h_l2915_c40_7d0a_ins <= VAR_gth_uxn_opcodes_h_l2915_c40_7d0a_ins;
     gth_uxn_opcodes_h_l2915_c40_7d0a_previous_stack_read <= VAR_gth_uxn_opcodes_h_l2915_c40_7d0a_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l2915_c40_7d0a_return_output := gth_uxn_opcodes_h_l2915_c40_7d0a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_8d46] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8d46_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8d46_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8d46_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8d46_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8d46_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8d46_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8d46_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8d46_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8f8d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8d46_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fa16_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8d46_return_output;
     VAR_gth2_uxn_opcodes_h_l2916_c40_6fd0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0df6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_60a2_iftrue := VAR_gth_uxn_opcodes_h_l2915_c40_7d0a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_fa16] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fa16_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fa16_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fa16_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fa16_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fa16_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fa16_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fa16_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fa16_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_8f8d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8f8d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8f8d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8f8d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8f8d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8f8d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8f8d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8f8d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8f8d_return_output;

     -- gth2[uxn_opcodes_h_l2916_c40_6fd0] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l2916_c40_6fd0_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l2916_c40_6fd0_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l2916_c40_6fd0_phase <= VAR_gth2_uxn_opcodes_h_l2916_c40_6fd0_phase;
     gth2_uxn_opcodes_h_l2916_c40_6fd0_ins <= VAR_gth2_uxn_opcodes_h_l2916_c40_6fd0_ins;
     gth2_uxn_opcodes_h_l2916_c40_6fd0_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l2916_c40_6fd0_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l2916_c40_6fd0_return_output := gth2_uxn_opcodes_h_l2916_c40_6fd0_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4bcd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8f8d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_c6bf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8f8d_return_output;
     VAR_lth_uxn_opcodes_h_l2917_c40_4a65_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fa16_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_ec5e_iftrue := VAR_gth2_uxn_opcodes_h_l2916_c40_6fd0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_c6bf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_c6bf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_c6bf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_c6bf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_c6bf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_c6bf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_c6bf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_c6bf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_c6bf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_4bcd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4bcd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4bcd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4bcd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4bcd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4bcd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4bcd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4bcd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4bcd_return_output;

     -- lth[uxn_opcodes_h_l2917_c40_4a65] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l2917_c40_4a65_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l2917_c40_4a65_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l2917_c40_4a65_phase <= VAR_lth_uxn_opcodes_h_l2917_c40_4a65_phase;
     lth_uxn_opcodes_h_l2917_c40_4a65_ins <= VAR_lth_uxn_opcodes_h_l2917_c40_4a65_ins;
     lth_uxn_opcodes_h_l2917_c40_4a65_previous_stack_read <= VAR_lth_uxn_opcodes_h_l2917_c40_4a65_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l2917_c40_4a65_return_output := lth_uxn_opcodes_h_l2917_c40_4a65_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_b546_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4bcd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4ee5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4bcd_return_output;
     VAR_lth2_uxn_opcodes_h_l2918_c40_7c6d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_c6bf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8d46_iftrue := VAR_lth_uxn_opcodes_h_l2917_c40_4a65_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_b546] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_b546_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_b546_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_b546_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_b546_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_b546_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_b546_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_b546_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_b546_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_4ee5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4ee5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4ee5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4ee5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4ee5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4ee5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4ee5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4ee5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4ee5_return_output;

     -- lth2[uxn_opcodes_h_l2918_c40_7c6d] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l2918_c40_7c6d_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l2918_c40_7c6d_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l2918_c40_7c6d_phase <= VAR_lth2_uxn_opcodes_h_l2918_c40_7c6d_phase;
     lth2_uxn_opcodes_h_l2918_c40_7c6d_ins <= VAR_lth2_uxn_opcodes_h_l2918_c40_7c6d_ins;
     lth2_uxn_opcodes_h_l2918_c40_7c6d_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l2918_c40_7c6d_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l2918_c40_7c6d_return_output := lth2_uxn_opcodes_h_l2918_c40_7c6d_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_b35c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_b546_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d66d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_b546_return_output;
     VAR_jmp_uxn_opcodes_h_l2919_c40_7a28_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4ee5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8f8d_iftrue := VAR_lth2_uxn_opcodes_h_l2918_c40_7c6d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_d66d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d66d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d66d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d66d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d66d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d66d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d66d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d66d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d66d_return_output;

     -- jmp[uxn_opcodes_h_l2919_c40_7a28] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l2919_c40_7a28_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l2919_c40_7a28_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l2919_c40_7a28_phase <= VAR_jmp_uxn_opcodes_h_l2919_c40_7a28_phase;
     jmp_uxn_opcodes_h_l2919_c40_7a28_ins <= VAR_jmp_uxn_opcodes_h_l2919_c40_7a28_ins;
     jmp_uxn_opcodes_h_l2919_c40_7a28_pc <= VAR_jmp_uxn_opcodes_h_l2919_c40_7a28_pc;
     jmp_uxn_opcodes_h_l2919_c40_7a28_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l2919_c40_7a28_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l2919_c40_7a28_return_output := jmp_uxn_opcodes_h_l2919_c40_7a28_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_b35c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_b35c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_b35c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_b35c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_b35c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_b35c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_b35c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_b35c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_b35c_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0723_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_b35c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_ac21_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_b35c_return_output;
     VAR_jmp2_uxn_opcodes_h_l2920_c40_b488_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d66d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4bcd_iftrue := VAR_jmp_uxn_opcodes_h_l2919_c40_7a28_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_0723] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0723_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0723_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0723_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0723_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0723_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0723_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0723_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0723_return_output;

     -- jmp2[uxn_opcodes_h_l2920_c40_b488] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l2920_c40_b488_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l2920_c40_b488_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l2920_c40_b488_phase <= VAR_jmp2_uxn_opcodes_h_l2920_c40_b488_phase;
     jmp2_uxn_opcodes_h_l2920_c40_b488_ins <= VAR_jmp2_uxn_opcodes_h_l2920_c40_b488_ins;
     jmp2_uxn_opcodes_h_l2920_c40_b488_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l2920_c40_b488_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l2920_c40_b488_return_output := jmp2_uxn_opcodes_h_l2920_c40_b488_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_ac21] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_ac21_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_ac21_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_ac21_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_ac21_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_ac21_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_ac21_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_ac21_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_ac21_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f85d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0723_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_fd5c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0723_return_output;
     VAR_jcn_uxn_opcodes_h_l2921_c40_37fc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_ac21_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_b546_iftrue := VAR_jmp2_uxn_opcodes_h_l2920_c40_b488_return_output;
     -- jcn[uxn_opcodes_h_l2921_c40_37fc] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l2921_c40_37fc_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l2921_c40_37fc_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l2921_c40_37fc_phase <= VAR_jcn_uxn_opcodes_h_l2921_c40_37fc_phase;
     jcn_uxn_opcodes_h_l2921_c40_37fc_ins <= VAR_jcn_uxn_opcodes_h_l2921_c40_37fc_ins;
     jcn_uxn_opcodes_h_l2921_c40_37fc_pc <= VAR_jcn_uxn_opcodes_h_l2921_c40_37fc_pc;
     jcn_uxn_opcodes_h_l2921_c40_37fc_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l2921_c40_37fc_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l2921_c40_37fc_return_output := jcn_uxn_opcodes_h_l2921_c40_37fc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_f85d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f85d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f85d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f85d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f85d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f85d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f85d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f85d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f85d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_fd5c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_fd5c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_fd5c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_fd5c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_fd5c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_fd5c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_fd5c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_fd5c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_fd5c_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_c25a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f85d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_8ce0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f85d_return_output;
     VAR_jcn2_uxn_opcodes_h_l2922_c40_a994_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_fd5c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_b35c_iftrue := VAR_jcn_uxn_opcodes_h_l2921_c40_37fc_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_8ce0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_8ce0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_8ce0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_8ce0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_8ce0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_8ce0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_8ce0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_8ce0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_8ce0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_c25a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_c25a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_c25a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_c25a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_c25a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_c25a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_c25a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_c25a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_c25a_return_output;

     -- jcn2[uxn_opcodes_h_l2922_c40_a994] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l2922_c40_a994_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l2922_c40_a994_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l2922_c40_a994_phase <= VAR_jcn2_uxn_opcodes_h_l2922_c40_a994_phase;
     jcn2_uxn_opcodes_h_l2922_c40_a994_ins <= VAR_jcn2_uxn_opcodes_h_l2922_c40_a994_ins;
     jcn2_uxn_opcodes_h_l2922_c40_a994_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l2922_c40_a994_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l2922_c40_a994_return_output := jcn2_uxn_opcodes_h_l2922_c40_a994_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5cec_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_c25a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_1d99_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_c25a_return_output;
     VAR_jsr_uxn_opcodes_h_l2923_c40_514c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_8ce0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_0723_iftrue := VAR_jcn2_uxn_opcodes_h_l2922_c40_a994_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_5cec] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5cec_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5cec_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5cec_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5cec_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5cec_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5cec_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5cec_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5cec_return_output;

     -- jsr[uxn_opcodes_h_l2923_c40_514c] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l2923_c40_514c_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l2923_c40_514c_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l2923_c40_514c_phase <= VAR_jsr_uxn_opcodes_h_l2923_c40_514c_phase;
     jsr_uxn_opcodes_h_l2923_c40_514c_ins <= VAR_jsr_uxn_opcodes_h_l2923_c40_514c_ins;
     jsr_uxn_opcodes_h_l2923_c40_514c_pc <= VAR_jsr_uxn_opcodes_h_l2923_c40_514c_pc;
     jsr_uxn_opcodes_h_l2923_c40_514c_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l2923_c40_514c_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l2923_c40_514c_return_output := jsr_uxn_opcodes_h_l2923_c40_514c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_1d99] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_1d99_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_1d99_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_1d99_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_1d99_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_1d99_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_1d99_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_1d99_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_1d99_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e7bf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5cec_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bd5d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5cec_return_output;
     VAR_jsr2_uxn_opcodes_h_l2924_c40_9b2a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_1d99_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f85d_iftrue := VAR_jsr_uxn_opcodes_h_l2923_c40_514c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_e7bf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e7bf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e7bf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e7bf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e7bf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e7bf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e7bf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e7bf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e7bf_return_output;

     -- jsr2[uxn_opcodes_h_l2924_c40_9b2a] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l2924_c40_9b2a_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l2924_c40_9b2a_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l2924_c40_9b2a_phase <= VAR_jsr2_uxn_opcodes_h_l2924_c40_9b2a_phase;
     jsr2_uxn_opcodes_h_l2924_c40_9b2a_ins <= VAR_jsr2_uxn_opcodes_h_l2924_c40_9b2a_ins;
     jsr2_uxn_opcodes_h_l2924_c40_9b2a_pc <= VAR_jsr2_uxn_opcodes_h_l2924_c40_9b2a_pc;
     jsr2_uxn_opcodes_h_l2924_c40_9b2a_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l2924_c40_9b2a_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l2924_c40_9b2a_return_output := jsr2_uxn_opcodes_h_l2924_c40_9b2a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_bd5d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bd5d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bd5d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bd5d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bd5d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bd5d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bd5d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bd5d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bd5d_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3c0d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e7bf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_68d3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_e7bf_return_output;
     VAR_sth_uxn_opcodes_h_l2925_c40_d655_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bd5d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_c25a_iftrue := VAR_jsr2_uxn_opcodes_h_l2924_c40_9b2a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_3c0d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3c0d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3c0d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3c0d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3c0d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3c0d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3c0d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3c0d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3c0d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_68d3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_68d3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_68d3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_68d3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_68d3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_68d3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_68d3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_68d3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_68d3_return_output;

     -- sth[uxn_opcodes_h_l2925_c40_d655] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l2925_c40_d655_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l2925_c40_d655_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l2925_c40_d655_phase <= VAR_sth_uxn_opcodes_h_l2925_c40_d655_phase;
     sth_uxn_opcodes_h_l2925_c40_d655_ins <= VAR_sth_uxn_opcodes_h_l2925_c40_d655_ins;
     sth_uxn_opcodes_h_l2925_c40_d655_previous_stack_read <= VAR_sth_uxn_opcodes_h_l2925_c40_d655_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l2925_c40_d655_return_output := sth_uxn_opcodes_h_l2925_c40_d655_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_71d1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3c0d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_00b3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3c0d_return_output;
     VAR_sth2_uxn_opcodes_h_l2926_c40_b6c9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_68d3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_5cec_iftrue := VAR_sth_uxn_opcodes_h_l2925_c40_d655_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_00b3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_00b3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_00b3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_00b3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_00b3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_00b3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_00b3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_00b3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_00b3_return_output;

     -- sth2[uxn_opcodes_h_l2926_c40_b6c9] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l2926_c40_b6c9_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l2926_c40_b6c9_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l2926_c40_b6c9_phase <= VAR_sth2_uxn_opcodes_h_l2926_c40_b6c9_phase;
     sth2_uxn_opcodes_h_l2926_c40_b6c9_ins <= VAR_sth2_uxn_opcodes_h_l2926_c40_b6c9_ins;
     sth2_uxn_opcodes_h_l2926_c40_b6c9_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l2926_c40_b6c9_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l2926_c40_b6c9_return_output := sth2_uxn_opcodes_h_l2926_c40_b6c9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_71d1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_71d1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_71d1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_71d1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_71d1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_71d1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_71d1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_71d1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_71d1_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_60b1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_71d1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1556_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_71d1_return_output;
     VAR_ldz_uxn_opcodes_h_l2927_c40_77b4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_00b3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_e7bf_iftrue := VAR_sth2_uxn_opcodes_h_l2926_c40_b6c9_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_60b1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_60b1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_60b1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_60b1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_60b1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_60b1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_60b1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_60b1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_60b1_return_output;

     -- ldz[uxn_opcodes_h_l2927_c40_77b4] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l2927_c40_77b4_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l2927_c40_77b4_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l2927_c40_77b4_phase <= VAR_ldz_uxn_opcodes_h_l2927_c40_77b4_phase;
     ldz_uxn_opcodes_h_l2927_c40_77b4_ins <= VAR_ldz_uxn_opcodes_h_l2927_c40_77b4_ins;
     ldz_uxn_opcodes_h_l2927_c40_77b4_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l2927_c40_77b4_previous_stack_read;
     ldz_uxn_opcodes_h_l2927_c40_77b4_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l2927_c40_77b4_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l2927_c40_77b4_return_output := ldz_uxn_opcodes_h_l2927_c40_77b4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_1556] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1556_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1556_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1556_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1556_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1556_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1556_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1556_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1556_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b88d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_60b1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4489_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_60b1_return_output;
     VAR_ldz2_uxn_opcodes_h_l2928_c40_fbce_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1556_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_3c0d_iftrue := VAR_ldz_uxn_opcodes_h_l2927_c40_77b4_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_4489] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4489_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4489_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4489_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4489_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4489_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4489_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4489_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4489_return_output;

     -- ldz2[uxn_opcodes_h_l2928_c40_fbce] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l2928_c40_fbce_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l2928_c40_fbce_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l2928_c40_fbce_phase <= VAR_ldz2_uxn_opcodes_h_l2928_c40_fbce_phase;
     ldz2_uxn_opcodes_h_l2928_c40_fbce_ins <= VAR_ldz2_uxn_opcodes_h_l2928_c40_fbce_ins;
     ldz2_uxn_opcodes_h_l2928_c40_fbce_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l2928_c40_fbce_previous_stack_read;
     ldz2_uxn_opcodes_h_l2928_c40_fbce_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l2928_c40_fbce_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l2928_c40_fbce_return_output := ldz2_uxn_opcodes_h_l2928_c40_fbce_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_b88d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b88d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b88d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b88d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b88d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b88d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b88d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b88d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b88d_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_729b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b88d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_428f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b88d_return_output;
     VAR_stz_uxn_opcodes_h_l2929_c40_a37c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4489_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_71d1_iftrue := VAR_ldz2_uxn_opcodes_h_l2928_c40_fbce_return_output;
     -- stz[uxn_opcodes_h_l2929_c40_a37c] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l2929_c40_a37c_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l2929_c40_a37c_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l2929_c40_a37c_phase <= VAR_stz_uxn_opcodes_h_l2929_c40_a37c_phase;
     stz_uxn_opcodes_h_l2929_c40_a37c_ins <= VAR_stz_uxn_opcodes_h_l2929_c40_a37c_ins;
     stz_uxn_opcodes_h_l2929_c40_a37c_previous_stack_read <= VAR_stz_uxn_opcodes_h_l2929_c40_a37c_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l2929_c40_a37c_return_output := stz_uxn_opcodes_h_l2929_c40_a37c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_428f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_428f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_428f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_428f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_428f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_428f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_428f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_428f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_428f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_729b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_729b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_729b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_729b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_729b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_729b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_729b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_729b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_729b_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_307d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_729b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_0e50_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_729b_return_output;
     VAR_stz2_uxn_opcodes_h_l2930_c40_2f77_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_428f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_60b1_iftrue := VAR_stz_uxn_opcodes_h_l2929_c40_a37c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_0e50] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_0e50_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_0e50_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_0e50_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_0e50_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_0e50_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_0e50_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_0e50_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_0e50_return_output;

     -- stz2[uxn_opcodes_h_l2930_c40_2f77] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l2930_c40_2f77_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l2930_c40_2f77_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l2930_c40_2f77_phase <= VAR_stz2_uxn_opcodes_h_l2930_c40_2f77_phase;
     stz2_uxn_opcodes_h_l2930_c40_2f77_ins <= VAR_stz2_uxn_opcodes_h_l2930_c40_2f77_ins;
     stz2_uxn_opcodes_h_l2930_c40_2f77_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l2930_c40_2f77_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l2930_c40_2f77_return_output := stz2_uxn_opcodes_h_l2930_c40_2f77_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_307d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_307d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_307d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_307d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_307d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_307d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_307d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_307d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_307d_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_0745_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_307d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_6c24_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_307d_return_output;
     VAR_ldr_uxn_opcodes_h_l2931_c40_c27d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_0e50_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b88d_iftrue := VAR_stz2_uxn_opcodes_h_l2930_c40_2f77_return_output;
     -- ldr[uxn_opcodes_h_l2931_c40_c27d] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l2931_c40_c27d_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l2931_c40_c27d_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l2931_c40_c27d_phase <= VAR_ldr_uxn_opcodes_h_l2931_c40_c27d_phase;
     ldr_uxn_opcodes_h_l2931_c40_c27d_ins <= VAR_ldr_uxn_opcodes_h_l2931_c40_c27d_ins;
     ldr_uxn_opcodes_h_l2931_c40_c27d_pc <= VAR_ldr_uxn_opcodes_h_l2931_c40_c27d_pc;
     ldr_uxn_opcodes_h_l2931_c40_c27d_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l2931_c40_c27d_previous_stack_read;
     ldr_uxn_opcodes_h_l2931_c40_c27d_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l2931_c40_c27d_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l2931_c40_c27d_return_output := ldr_uxn_opcodes_h_l2931_c40_c27d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_6c24] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_6c24_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_6c24_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_6c24_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_6c24_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_6c24_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_6c24_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_6c24_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_6c24_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_0745] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_0745_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_0745_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_0745_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_0745_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_0745_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_0745_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_0745_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_0745_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_0585_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_0745_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_eabd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_0745_return_output;
     VAR_ldr2_uxn_opcodes_h_l2932_c40_8e0e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_6c24_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_729b_iftrue := VAR_ldr_uxn_opcodes_h_l2931_c40_c27d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_eabd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_eabd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_eabd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_eabd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_eabd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_eabd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_eabd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_eabd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_eabd_return_output;

     -- ldr2[uxn_opcodes_h_l2932_c40_8e0e] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l2932_c40_8e0e_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l2932_c40_8e0e_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l2932_c40_8e0e_phase <= VAR_ldr2_uxn_opcodes_h_l2932_c40_8e0e_phase;
     ldr2_uxn_opcodes_h_l2932_c40_8e0e_ins <= VAR_ldr2_uxn_opcodes_h_l2932_c40_8e0e_ins;
     ldr2_uxn_opcodes_h_l2932_c40_8e0e_pc <= VAR_ldr2_uxn_opcodes_h_l2932_c40_8e0e_pc;
     ldr2_uxn_opcodes_h_l2932_c40_8e0e_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l2932_c40_8e0e_previous_stack_read;
     ldr2_uxn_opcodes_h_l2932_c40_8e0e_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l2932_c40_8e0e_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l2932_c40_8e0e_return_output := ldr2_uxn_opcodes_h_l2932_c40_8e0e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_0585] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_0585_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_0585_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_0585_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_0585_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_0585_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_0585_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_0585_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_0585_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8064_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_0585_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_04d4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_0585_return_output;
     VAR_str1_uxn_opcodes_h_l2933_c40_ac2f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_eabd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_307d_iftrue := VAR_ldr2_uxn_opcodes_h_l2932_c40_8e0e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_04d4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_04d4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_04d4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_04d4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_04d4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_04d4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_04d4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_04d4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_04d4_return_output;

     -- str1[uxn_opcodes_h_l2933_c40_ac2f] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l2933_c40_ac2f_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l2933_c40_ac2f_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l2933_c40_ac2f_phase <= VAR_str1_uxn_opcodes_h_l2933_c40_ac2f_phase;
     str1_uxn_opcodes_h_l2933_c40_ac2f_ins <= VAR_str1_uxn_opcodes_h_l2933_c40_ac2f_ins;
     str1_uxn_opcodes_h_l2933_c40_ac2f_pc <= VAR_str1_uxn_opcodes_h_l2933_c40_ac2f_pc;
     str1_uxn_opcodes_h_l2933_c40_ac2f_previous_stack_read <= VAR_str1_uxn_opcodes_h_l2933_c40_ac2f_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l2933_c40_ac2f_return_output := str1_uxn_opcodes_h_l2933_c40_ac2f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_8064] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8064_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8064_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8064_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8064_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8064_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8064_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8064_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8064_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0b25_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8064_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3c43_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8064_return_output;
     VAR_str2_uxn_opcodes_h_l2934_c40_521d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_04d4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_0745_iftrue := VAR_str1_uxn_opcodes_h_l2933_c40_ac2f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_3c43] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3c43_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3c43_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3c43_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3c43_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3c43_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3c43_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3c43_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3c43_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_0b25] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0b25_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0b25_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0b25_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0b25_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0b25_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0b25_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0b25_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0b25_return_output;

     -- str2[uxn_opcodes_h_l2934_c40_521d] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l2934_c40_521d_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l2934_c40_521d_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l2934_c40_521d_phase <= VAR_str2_uxn_opcodes_h_l2934_c40_521d_phase;
     str2_uxn_opcodes_h_l2934_c40_521d_ins <= VAR_str2_uxn_opcodes_h_l2934_c40_521d_ins;
     str2_uxn_opcodes_h_l2934_c40_521d_pc <= VAR_str2_uxn_opcodes_h_l2934_c40_521d_pc;
     str2_uxn_opcodes_h_l2934_c40_521d_previous_stack_read <= VAR_str2_uxn_opcodes_h_l2934_c40_521d_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l2934_c40_521d_return_output := str2_uxn_opcodes_h_l2934_c40_521d_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3786_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0b25_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_f81c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0b25_return_output;
     VAR_lda_uxn_opcodes_h_l2935_c40_b1b2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3c43_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_0585_iftrue := VAR_str2_uxn_opcodes_h_l2934_c40_521d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_f81c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_f81c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_f81c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_f81c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_f81c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_f81c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_f81c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_f81c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_f81c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_3786] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3786_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3786_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3786_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3786_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3786_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3786_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3786_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3786_return_output;

     -- lda[uxn_opcodes_h_l2935_c40_b1b2] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l2935_c40_b1b2_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l2935_c40_b1b2_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l2935_c40_b1b2_phase <= VAR_lda_uxn_opcodes_h_l2935_c40_b1b2_phase;
     lda_uxn_opcodes_h_l2935_c40_b1b2_ins <= VAR_lda_uxn_opcodes_h_l2935_c40_b1b2_ins;
     lda_uxn_opcodes_h_l2935_c40_b1b2_previous_stack_read <= VAR_lda_uxn_opcodes_h_l2935_c40_b1b2_previous_stack_read;
     lda_uxn_opcodes_h_l2935_c40_b1b2_previous_ram_read <= VAR_lda_uxn_opcodes_h_l2935_c40_b1b2_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l2935_c40_b1b2_return_output := lda_uxn_opcodes_h_l2935_c40_b1b2_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4cb0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3786_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_ab1c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3786_return_output;
     VAR_lda2_uxn_opcodes_h_l2936_c40_3a81_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_f81c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_8064_iftrue := VAR_lda_uxn_opcodes_h_l2935_c40_b1b2_return_output;
     -- lda2[uxn_opcodes_h_l2936_c40_3a81] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l2936_c40_3a81_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l2936_c40_3a81_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l2936_c40_3a81_phase <= VAR_lda2_uxn_opcodes_h_l2936_c40_3a81_phase;
     lda2_uxn_opcodes_h_l2936_c40_3a81_ins <= VAR_lda2_uxn_opcodes_h_l2936_c40_3a81_ins;
     lda2_uxn_opcodes_h_l2936_c40_3a81_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l2936_c40_3a81_previous_stack_read;
     lda2_uxn_opcodes_h_l2936_c40_3a81_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l2936_c40_3a81_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l2936_c40_3a81_return_output := lda2_uxn_opcodes_h_l2936_c40_3a81_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_ab1c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_ab1c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_ab1c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_ab1c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_ab1c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_ab1c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_ab1c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_ab1c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_ab1c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_4cb0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4cb0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4cb0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4cb0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4cb0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4cb0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4cb0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4cb0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4cb0_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4841_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4cb0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_82f2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4cb0_return_output;
     VAR_sta_uxn_opcodes_h_l2937_c40_e0fa_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_ab1c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_0b25_iftrue := VAR_lda2_uxn_opcodes_h_l2936_c40_3a81_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_4841] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4841_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4841_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4841_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4841_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4841_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4841_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4841_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4841_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_82f2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_82f2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_82f2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_82f2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_82f2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_82f2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_82f2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_82f2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_82f2_return_output;

     -- sta[uxn_opcodes_h_l2937_c40_e0fa] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l2937_c40_e0fa_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l2937_c40_e0fa_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l2937_c40_e0fa_phase <= VAR_sta_uxn_opcodes_h_l2937_c40_e0fa_phase;
     sta_uxn_opcodes_h_l2937_c40_e0fa_ins <= VAR_sta_uxn_opcodes_h_l2937_c40_e0fa_ins;
     sta_uxn_opcodes_h_l2937_c40_e0fa_previous_stack_read <= VAR_sta_uxn_opcodes_h_l2937_c40_e0fa_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l2937_c40_e0fa_return_output := sta_uxn_opcodes_h_l2937_c40_e0fa_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_7c8b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4841_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2a1d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_4841_return_output;
     VAR_sta2_uxn_opcodes_h_l2938_c40_7ae4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_82f2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_3786_iftrue := VAR_sta_uxn_opcodes_h_l2937_c40_e0fa_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_7c8b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_7c8b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_7c8b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_7c8b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_7c8b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_7c8b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_7c8b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_7c8b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_7c8b_return_output;

     -- sta2[uxn_opcodes_h_l2938_c40_7ae4] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l2938_c40_7ae4_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l2938_c40_7ae4_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l2938_c40_7ae4_phase <= VAR_sta2_uxn_opcodes_h_l2938_c40_7ae4_phase;
     sta2_uxn_opcodes_h_l2938_c40_7ae4_ins <= VAR_sta2_uxn_opcodes_h_l2938_c40_7ae4_ins;
     sta2_uxn_opcodes_h_l2938_c40_7ae4_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l2938_c40_7ae4_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l2938_c40_7ae4_return_output := sta2_uxn_opcodes_h_l2938_c40_7ae4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_2a1d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2a1d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2a1d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2a1d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2a1d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2a1d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2a1d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2a1d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2a1d_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_636d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_7c8b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_5e1b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_7c8b_return_output;
     VAR_dei_uxn_opcodes_h_l2939_c40_610a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2a1d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_4cb0_iftrue := VAR_sta2_uxn_opcodes_h_l2938_c40_7ae4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c7_636d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_636d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_636d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_636d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_636d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_636d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_636d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_636d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_636d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_5e1b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_5e1b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_5e1b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_5e1b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_5e1b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_5e1b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_5e1b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_5e1b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_5e1b_return_output;

     -- dei[uxn_opcodes_h_l2939_c40_610a] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l2939_c40_610a_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l2939_c40_610a_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l2939_c40_610a_phase <= VAR_dei_uxn_opcodes_h_l2939_c40_610a_phase;
     dei_uxn_opcodes_h_l2939_c40_610a_ins <= VAR_dei_uxn_opcodes_h_l2939_c40_610a_ins;
     dei_uxn_opcodes_h_l2939_c40_610a_previous_stack_read <= VAR_dei_uxn_opcodes_h_l2939_c40_610a_previous_stack_read;
     dei_uxn_opcodes_h_l2939_c40_610a_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l2939_c40_610a_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l2939_c40_610a_return_output := dei_uxn_opcodes_h_l2939_c40_610a_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4f24_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_636d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_518d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_636d_return_output;
     VAR_dei2_uxn_opcodes_h_l2940_c40_47ff_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_5e1b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_4841_iftrue := VAR_dei_uxn_opcodes_h_l2939_c40_610a_return_output;
     -- dei2[uxn_opcodes_h_l2940_c40_47ff] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l2940_c40_47ff_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l2940_c40_47ff_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l2940_c40_47ff_phase <= VAR_dei2_uxn_opcodes_h_l2940_c40_47ff_phase;
     dei2_uxn_opcodes_h_l2940_c40_47ff_ins <= VAR_dei2_uxn_opcodes_h_l2940_c40_47ff_ins;
     dei2_uxn_opcodes_h_l2940_c40_47ff_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l2940_c40_47ff_previous_stack_read;
     dei2_uxn_opcodes_h_l2940_c40_47ff_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l2940_c40_47ff_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l2940_c40_47ff_return_output := dei2_uxn_opcodes_h_l2940_c40_47ff_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c1_518d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_518d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_518d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_518d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_518d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_518d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_518d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_518d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_518d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2942_c7_4f24] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4f24_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4f24_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4f24_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4f24_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4f24_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4f24_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4f24_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4f24_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_10e6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4f24_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_8823_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4f24_return_output;
     VAR_deo_uxn_opcodes_h_l2941_c40_40b4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_518d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_7c8b_iftrue := VAR_dei2_uxn_opcodes_h_l2940_c40_47ff_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2943_c7_10e6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_10e6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_10e6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_10e6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_10e6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_10e6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_10e6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_10e6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_10e6_return_output;

     -- deo[uxn_opcodes_h_l2941_c40_40b4] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l2941_c40_40b4_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l2941_c40_40b4_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l2941_c40_40b4_phase <= VAR_deo_uxn_opcodes_h_l2941_c40_40b4_phase;
     deo_uxn_opcodes_h_l2941_c40_40b4_ins <= VAR_deo_uxn_opcodes_h_l2941_c40_40b4_ins;
     deo_uxn_opcodes_h_l2941_c40_40b4_previous_stack_read <= VAR_deo_uxn_opcodes_h_l2941_c40_40b4_previous_stack_read;
     deo_uxn_opcodes_h_l2941_c40_40b4_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l2941_c40_40b4_previous_device_ram_read;
     deo_uxn_opcodes_h_l2941_c40_40b4_previous_ram_read <= VAR_deo_uxn_opcodes_h_l2941_c40_40b4_previous_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l2941_c40_40b4_return_output := deo_uxn_opcodes_h_l2941_c40_40b4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2942_c1_8823] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_8823_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_8823_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_8823_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_8823_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_8823_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_8823_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_8823_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_8823_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_9702_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_10e6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_98d5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_10e6_return_output;
     VAR_deo2_uxn_opcodes_h_l2942_c40_b92c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_8823_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_636d_iftrue := VAR_deo_uxn_opcodes_h_l2941_c40_40b4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2944_c7_9702] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_9702_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_9702_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_9702_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_9702_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_9702_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_9702_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_9702_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_9702_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2943_c1_98d5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_98d5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_98d5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_98d5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_98d5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_98d5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_98d5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_98d5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_98d5_return_output;

     -- deo2[uxn_opcodes_h_l2942_c40_b92c] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l2942_c40_b92c_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l2942_c40_b92c_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l2942_c40_b92c_phase <= VAR_deo2_uxn_opcodes_h_l2942_c40_b92c_phase;
     deo2_uxn_opcodes_h_l2942_c40_b92c_ins <= VAR_deo2_uxn_opcodes_h_l2942_c40_b92c_ins;
     deo2_uxn_opcodes_h_l2942_c40_b92c_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l2942_c40_b92c_previous_stack_read;
     deo2_uxn_opcodes_h_l2942_c40_b92c_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l2942_c40_b92c_previous_device_ram_read;
     deo2_uxn_opcodes_h_l2942_c40_b92c_previous_ram_read <= VAR_deo2_uxn_opcodes_h_l2942_c40_b92c_previous_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l2942_c40_b92c_return_output := deo2_uxn_opcodes_h_l2942_c40_b92c_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_875e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_9702_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_6b48_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_9702_return_output;
     VAR_add_uxn_opcodes_h_l2943_c40_f784_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_98d5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_4f24_iftrue := VAR_deo2_uxn_opcodes_h_l2942_c40_b92c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2944_c1_6b48] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_6b48_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_6b48_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_6b48_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_6b48_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_6b48_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_6b48_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_6b48_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_6b48_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2945_c7_875e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_875e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_875e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_875e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_875e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_875e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_875e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_875e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_875e_return_output;

     -- add[uxn_opcodes_h_l2943_c40_f784] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l2943_c40_f784_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l2943_c40_f784_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l2943_c40_f784_phase <= VAR_add_uxn_opcodes_h_l2943_c40_f784_phase;
     add_uxn_opcodes_h_l2943_c40_f784_ins <= VAR_add_uxn_opcodes_h_l2943_c40_f784_ins;
     add_uxn_opcodes_h_l2943_c40_f784_previous_stack_read <= VAR_add_uxn_opcodes_h_l2943_c40_f784_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l2943_c40_f784_return_output := add_uxn_opcodes_h_l2943_c40_f784_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_7106_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_875e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_2ac1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_875e_return_output;
     VAR_add2_uxn_opcodes_h_l2944_c40_01ed_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_6b48_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_10e6_iftrue := VAR_add_uxn_opcodes_h_l2943_c40_f784_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2946_c7_7106] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_7106_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_7106_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_7106_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_7106_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_7106_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_7106_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_7106_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_7106_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2945_c1_2ac1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_2ac1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_2ac1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_2ac1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_2ac1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_2ac1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_2ac1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_2ac1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_2ac1_return_output;

     -- add2[uxn_opcodes_h_l2944_c40_01ed] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l2944_c40_01ed_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l2944_c40_01ed_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l2944_c40_01ed_phase <= VAR_add2_uxn_opcodes_h_l2944_c40_01ed_phase;
     add2_uxn_opcodes_h_l2944_c40_01ed_ins <= VAR_add2_uxn_opcodes_h_l2944_c40_01ed_ins;
     add2_uxn_opcodes_h_l2944_c40_01ed_previous_stack_read <= VAR_add2_uxn_opcodes_h_l2944_c40_01ed_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l2944_c40_01ed_return_output := add2_uxn_opcodes_h_l2944_c40_01ed_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_8f5d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_7106_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_e34d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_7106_return_output;
     VAR_sub_uxn_opcodes_h_l2945_c40_26e9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_2ac1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_9702_iftrue := VAR_add2_uxn_opcodes_h_l2944_c40_01ed_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2946_c1_e34d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_e34d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_e34d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_e34d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_e34d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_e34d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_e34d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_e34d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_e34d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2947_c7_8f5d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_8f5d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_8f5d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_8f5d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_8f5d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_8f5d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_8f5d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_8f5d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_8f5d_return_output;

     -- sub[uxn_opcodes_h_l2945_c40_26e9] LATENCY=0
     -- Clock enable
     sub_uxn_opcodes_h_l2945_c40_26e9_CLOCK_ENABLE <= VAR_sub_uxn_opcodes_h_l2945_c40_26e9_CLOCK_ENABLE;
     -- Inputs
     sub_uxn_opcodes_h_l2945_c40_26e9_phase <= VAR_sub_uxn_opcodes_h_l2945_c40_26e9_phase;
     sub_uxn_opcodes_h_l2945_c40_26e9_ins <= VAR_sub_uxn_opcodes_h_l2945_c40_26e9_ins;
     sub_uxn_opcodes_h_l2945_c40_26e9_previous_stack_read <= VAR_sub_uxn_opcodes_h_l2945_c40_26e9_previous_stack_read;
     -- Outputs
     VAR_sub_uxn_opcodes_h_l2945_c40_26e9_return_output := sub_uxn_opcodes_h_l2945_c40_26e9_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_e52a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_8f5d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_9eee_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_8f5d_return_output;
     VAR_sub2_uxn_opcodes_h_l2946_c40_0ad8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_e34d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_875e_iftrue := VAR_sub_uxn_opcodes_h_l2945_c40_26e9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2947_c1_9eee] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_9eee_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_9eee_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_9eee_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_9eee_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_9eee_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_9eee_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_9eee_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_9eee_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2948_c7_e52a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_e52a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_e52a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_e52a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_e52a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_e52a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_e52a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_e52a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_e52a_return_output;

     -- sub2[uxn_opcodes_h_l2946_c40_0ad8] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l2946_c40_0ad8_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l2946_c40_0ad8_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l2946_c40_0ad8_phase <= VAR_sub2_uxn_opcodes_h_l2946_c40_0ad8_phase;
     sub2_uxn_opcodes_h_l2946_c40_0ad8_ins <= VAR_sub2_uxn_opcodes_h_l2946_c40_0ad8_ins;
     sub2_uxn_opcodes_h_l2946_c40_0ad8_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l2946_c40_0ad8_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l2946_c40_0ad8_return_output := sub2_uxn_opcodes_h_l2946_c40_0ad8_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_1fe8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_e52a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_cbbb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_e52a_return_output;
     VAR_mul_uxn_opcodes_h_l2947_c40_459f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_9eee_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_7106_iftrue := VAR_sub2_uxn_opcodes_h_l2946_c40_0ad8_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2948_c1_cbbb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_cbbb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_cbbb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_cbbb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_cbbb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_cbbb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_cbbb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_cbbb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_cbbb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2949_c7_1fe8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_1fe8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_1fe8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_1fe8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_1fe8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_1fe8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_1fe8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_1fe8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_1fe8_return_output;

     -- mul[uxn_opcodes_h_l2947_c40_459f] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l2947_c40_459f_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l2947_c40_459f_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l2947_c40_459f_phase <= VAR_mul_uxn_opcodes_h_l2947_c40_459f_phase;
     mul_uxn_opcodes_h_l2947_c40_459f_ins <= VAR_mul_uxn_opcodes_h_l2947_c40_459f_ins;
     mul_uxn_opcodes_h_l2947_c40_459f_previous_stack_read <= VAR_mul_uxn_opcodes_h_l2947_c40_459f_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l2947_c40_459f_return_output := mul_uxn_opcodes_h_l2947_c40_459f_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_dd18_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_1fe8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2b07_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_1fe8_return_output;
     VAR_mul2_uxn_opcodes_h_l2948_c40_7792_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_cbbb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_8f5d_iftrue := VAR_mul_uxn_opcodes_h_l2947_c40_459f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2950_c7_dd18] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_dd18_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_dd18_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_dd18_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_dd18_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_dd18_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_dd18_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_dd18_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_dd18_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2949_c1_2b07] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2b07_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2b07_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2b07_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2b07_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2b07_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2b07_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2b07_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2b07_return_output;

     -- mul2[uxn_opcodes_h_l2948_c40_7792] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l2948_c40_7792_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l2948_c40_7792_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l2948_c40_7792_phase <= VAR_mul2_uxn_opcodes_h_l2948_c40_7792_phase;
     mul2_uxn_opcodes_h_l2948_c40_7792_ins <= VAR_mul2_uxn_opcodes_h_l2948_c40_7792_ins;
     mul2_uxn_opcodes_h_l2948_c40_7792_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l2948_c40_7792_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l2948_c40_7792_return_output := mul2_uxn_opcodes_h_l2948_c40_7792_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_56b7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_dd18_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_5f61_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_dd18_return_output;
     VAR_div_uxn_opcodes_h_l2949_c40_6d2e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2b07_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_e52a_iftrue := VAR_mul2_uxn_opcodes_h_l2948_c40_7792_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2951_c7_56b7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_56b7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_56b7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_56b7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_56b7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_56b7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_56b7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_56b7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_56b7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2950_c1_5f61] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_5f61_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_5f61_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_5f61_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_5f61_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_5f61_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_5f61_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_5f61_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_5f61_return_output;

     -- div[uxn_opcodes_h_l2949_c40_6d2e] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l2949_c40_6d2e_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l2949_c40_6d2e_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l2949_c40_6d2e_phase <= VAR_div_uxn_opcodes_h_l2949_c40_6d2e_phase;
     div_uxn_opcodes_h_l2949_c40_6d2e_ins <= VAR_div_uxn_opcodes_h_l2949_c40_6d2e_ins;
     div_uxn_opcodes_h_l2949_c40_6d2e_previous_stack_read <= VAR_div_uxn_opcodes_h_l2949_c40_6d2e_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l2949_c40_6d2e_return_output := div_uxn_opcodes_h_l2949_c40_6d2e_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_946b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_56b7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_acd2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_56b7_return_output;
     VAR_div2_uxn_opcodes_h_l2950_c40_e5d7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_5f61_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_1fe8_iftrue := VAR_div_uxn_opcodes_h_l2949_c40_6d2e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2951_c1_acd2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_acd2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_acd2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_acd2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_acd2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_acd2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_acd2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_acd2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_acd2_return_output;

     -- div2[uxn_opcodes_h_l2950_c40_e5d7] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l2950_c40_e5d7_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l2950_c40_e5d7_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l2950_c40_e5d7_phase <= VAR_div2_uxn_opcodes_h_l2950_c40_e5d7_phase;
     div2_uxn_opcodes_h_l2950_c40_e5d7_ins <= VAR_div2_uxn_opcodes_h_l2950_c40_e5d7_ins;
     div2_uxn_opcodes_h_l2950_c40_e5d7_previous_stack_read <= VAR_div2_uxn_opcodes_h_l2950_c40_e5d7_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l2950_c40_e5d7_return_output := div2_uxn_opcodes_h_l2950_c40_e5d7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2952_c7_946b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_946b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_946b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_946b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_946b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_946b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_946b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_946b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_946b_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_04ec_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_946b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_a391_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_946b_return_output;
     VAR_and_uxn_opcodes_h_l2951_c40_0680_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_acd2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_dd18_iftrue := VAR_div2_uxn_opcodes_h_l2950_c40_e5d7_return_output;
     -- and[uxn_opcodes_h_l2951_c40_0680] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l2951_c40_0680_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l2951_c40_0680_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l2951_c40_0680_phase <= VAR_and_uxn_opcodes_h_l2951_c40_0680_phase;
     and_uxn_opcodes_h_l2951_c40_0680_ins <= VAR_and_uxn_opcodes_h_l2951_c40_0680_ins;
     and_uxn_opcodes_h_l2951_c40_0680_previous_stack_read <= VAR_and_uxn_opcodes_h_l2951_c40_0680_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l2951_c40_0680_return_output := and_uxn_opcodes_h_l2951_c40_0680_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2953_c7_04ec] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_04ec_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_04ec_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_04ec_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_04ec_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_04ec_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_04ec_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_04ec_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_04ec_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2952_c1_a391] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_a391_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_a391_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_a391_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_a391_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_a391_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_a391_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_a391_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_a391_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_8594_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_04ec_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_7ec8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_04ec_return_output;
     VAR_and2_uxn_opcodes_h_l2952_c40_9546_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_a391_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_56b7_iftrue := VAR_and_uxn_opcodes_h_l2951_c40_0680_return_output;
     -- and2[uxn_opcodes_h_l2952_c40_9546] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l2952_c40_9546_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l2952_c40_9546_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l2952_c40_9546_phase <= VAR_and2_uxn_opcodes_h_l2952_c40_9546_phase;
     and2_uxn_opcodes_h_l2952_c40_9546_ins <= VAR_and2_uxn_opcodes_h_l2952_c40_9546_ins;
     and2_uxn_opcodes_h_l2952_c40_9546_previous_stack_read <= VAR_and2_uxn_opcodes_h_l2952_c40_9546_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l2952_c40_9546_return_output := and2_uxn_opcodes_h_l2952_c40_9546_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2954_c7_8594] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_8594_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_8594_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_8594_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_8594_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_8594_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_8594_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_8594_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_8594_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2953_c1_7ec8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_7ec8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_7ec8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_7ec8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_7ec8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_7ec8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_7ec8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_7ec8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_7ec8_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ab66_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_8594_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_95b1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_8594_return_output;
     VAR_ora_uxn_opcodes_h_l2953_c40_d394_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_7ec8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_946b_iftrue := VAR_and2_uxn_opcodes_h_l2952_c40_9546_return_output;
     -- ora[uxn_opcodes_h_l2953_c40_d394] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l2953_c40_d394_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l2953_c40_d394_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l2953_c40_d394_phase <= VAR_ora_uxn_opcodes_h_l2953_c40_d394_phase;
     ora_uxn_opcodes_h_l2953_c40_d394_ins <= VAR_ora_uxn_opcodes_h_l2953_c40_d394_ins;
     ora_uxn_opcodes_h_l2953_c40_d394_previous_stack_read <= VAR_ora_uxn_opcodes_h_l2953_c40_d394_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l2953_c40_d394_return_output := ora_uxn_opcodes_h_l2953_c40_d394_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2954_c1_95b1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_95b1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_95b1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_95b1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_95b1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_95b1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_95b1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_95b1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_95b1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2955_c7_ab66] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ab66_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ab66_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ab66_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ab66_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ab66_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ab66_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ab66_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ab66_return_output;

     -- Submodule level 74
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_904a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ab66_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_14ae_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ab66_return_output;
     VAR_ora2_uxn_opcodes_h_l2954_c40_3c0e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_95b1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_04ec_iftrue := VAR_ora_uxn_opcodes_h_l2953_c40_d394_return_output;
     -- ora2[uxn_opcodes_h_l2954_c40_3c0e] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l2954_c40_3c0e_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l2954_c40_3c0e_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l2954_c40_3c0e_phase <= VAR_ora2_uxn_opcodes_h_l2954_c40_3c0e_phase;
     ora2_uxn_opcodes_h_l2954_c40_3c0e_ins <= VAR_ora2_uxn_opcodes_h_l2954_c40_3c0e_ins;
     ora2_uxn_opcodes_h_l2954_c40_3c0e_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l2954_c40_3c0e_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l2954_c40_3c0e_return_output := ora2_uxn_opcodes_h_l2954_c40_3c0e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2956_c7_904a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_904a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_904a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_904a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_904a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_904a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_904a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_904a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_904a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2955_c1_14ae] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_14ae_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_14ae_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_14ae_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_14ae_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_14ae_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_14ae_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_14ae_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_14ae_return_output;

     -- Submodule level 75
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_386e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_904a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_faad_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_904a_return_output;
     VAR_eor_uxn_opcodes_h_l2955_c40_8300_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_14ae_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_8594_iftrue := VAR_ora2_uxn_opcodes_h_l2954_c40_3c0e_return_output;
     -- eor[uxn_opcodes_h_l2955_c40_8300] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l2955_c40_8300_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l2955_c40_8300_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l2955_c40_8300_phase <= VAR_eor_uxn_opcodes_h_l2955_c40_8300_phase;
     eor_uxn_opcodes_h_l2955_c40_8300_ins <= VAR_eor_uxn_opcodes_h_l2955_c40_8300_ins;
     eor_uxn_opcodes_h_l2955_c40_8300_previous_stack_read <= VAR_eor_uxn_opcodes_h_l2955_c40_8300_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l2955_c40_8300_return_output := eor_uxn_opcodes_h_l2955_c40_8300_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2956_c1_faad] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_faad_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_faad_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_faad_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_faad_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_faad_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_faad_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_faad_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_faad_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2957_c7_386e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_386e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_386e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_386e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_386e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_386e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_386e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_386e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_386e_return_output;

     -- Submodule level 76
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_b055_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_386e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_bcb1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_386e_return_output;
     VAR_eor2_uxn_opcodes_h_l2956_c40_2888_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_faad_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_ab66_iftrue := VAR_eor_uxn_opcodes_h_l2955_c40_8300_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2958_c7_b055] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_b055_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_b055_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_b055_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_b055_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_b055_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_b055_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_b055_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_b055_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2957_c1_bcb1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_bcb1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_bcb1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_bcb1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_bcb1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_bcb1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_bcb1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_bcb1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_bcb1_return_output;

     -- eor2[uxn_opcodes_h_l2956_c40_2888] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l2956_c40_2888_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l2956_c40_2888_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l2956_c40_2888_phase <= VAR_eor2_uxn_opcodes_h_l2956_c40_2888_phase;
     eor2_uxn_opcodes_h_l2956_c40_2888_ins <= VAR_eor2_uxn_opcodes_h_l2956_c40_2888_ins;
     eor2_uxn_opcodes_h_l2956_c40_2888_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l2956_c40_2888_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l2956_c40_2888_return_output := eor2_uxn_opcodes_h_l2956_c40_2888_return_output;

     -- Submodule level 77
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_7a91_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_b055_return_output;
     VAR_sft_uxn_opcodes_h_l2957_c40_2dbb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_bcb1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_904a_iftrue := VAR_eor2_uxn_opcodes_h_l2956_c40_2888_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2958_c1_7a91] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_7a91_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_7a91_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_7a91_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_7a91_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_7a91_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_7a91_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_7a91_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_7a91_return_output;

     -- sft[uxn_opcodes_h_l2957_c40_2dbb] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l2957_c40_2dbb_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l2957_c40_2dbb_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l2957_c40_2dbb_phase <= VAR_sft_uxn_opcodes_h_l2957_c40_2dbb_phase;
     sft_uxn_opcodes_h_l2957_c40_2dbb_ins <= VAR_sft_uxn_opcodes_h_l2957_c40_2dbb_ins;
     sft_uxn_opcodes_h_l2957_c40_2dbb_previous_stack_read <= VAR_sft_uxn_opcodes_h_l2957_c40_2dbb_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l2957_c40_2dbb_return_output := sft_uxn_opcodes_h_l2957_c40_2dbb_return_output;

     -- Submodule level 78
     VAR_sft2_uxn_opcodes_h_l2958_c40_d4b6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_7a91_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_386e_iftrue := VAR_sft_uxn_opcodes_h_l2957_c40_2dbb_return_output;
     -- sft2[uxn_opcodes_h_l2958_c40_d4b6] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l2958_c40_d4b6_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l2958_c40_d4b6_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l2958_c40_d4b6_phase <= VAR_sft2_uxn_opcodes_h_l2958_c40_d4b6_phase;
     sft2_uxn_opcodes_h_l2958_c40_d4b6_ins <= VAR_sft2_uxn_opcodes_h_l2958_c40_d4b6_ins;
     sft2_uxn_opcodes_h_l2958_c40_d4b6_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l2958_c40_d4b6_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l2958_c40_d4b6_return_output := sft2_uxn_opcodes_h_l2958_c40_d4b6_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_b055_iftrue := VAR_sft2_uxn_opcodes_h_l2958_c40_d4b6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2958_c7_b055] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2958_c7_b055_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_b055_cond;
     opc_result_MUX_uxn_opcodes_h_l2958_c7_b055_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_b055_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2958_c7_b055_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_b055_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_b055_return_output := opc_result_MUX_uxn_opcodes_h_l2958_c7_b055_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_386e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_b055_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2957_c7_386e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2957_c7_386e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_386e_cond;
     opc_result_MUX_uxn_opcodes_h_l2957_c7_386e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_386e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2957_c7_386e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_386e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_386e_return_output := opc_result_MUX_uxn_opcodes_h_l2957_c7_386e_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_904a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_386e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2956_c7_904a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2956_c7_904a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_904a_cond;
     opc_result_MUX_uxn_opcodes_h_l2956_c7_904a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_904a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2956_c7_904a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_904a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_904a_return_output := opc_result_MUX_uxn_opcodes_h_l2956_c7_904a_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_ab66_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_904a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2955_c7_ab66] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2955_c7_ab66_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_ab66_cond;
     opc_result_MUX_uxn_opcodes_h_l2955_c7_ab66_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_ab66_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2955_c7_ab66_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_ab66_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_ab66_return_output := opc_result_MUX_uxn_opcodes_h_l2955_c7_ab66_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_8594_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_ab66_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2954_c7_8594] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2954_c7_8594_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_8594_cond;
     opc_result_MUX_uxn_opcodes_h_l2954_c7_8594_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_8594_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2954_c7_8594_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_8594_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_8594_return_output := opc_result_MUX_uxn_opcodes_h_l2954_c7_8594_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_04ec_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_8594_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2953_c7_04ec] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2953_c7_04ec_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_04ec_cond;
     opc_result_MUX_uxn_opcodes_h_l2953_c7_04ec_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_04ec_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2953_c7_04ec_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_04ec_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_04ec_return_output := opc_result_MUX_uxn_opcodes_h_l2953_c7_04ec_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_946b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_04ec_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2952_c7_946b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2952_c7_946b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_946b_cond;
     opc_result_MUX_uxn_opcodes_h_l2952_c7_946b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_946b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2952_c7_946b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_946b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_946b_return_output := opc_result_MUX_uxn_opcodes_h_l2952_c7_946b_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_56b7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_946b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2951_c7_56b7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2951_c7_56b7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_56b7_cond;
     opc_result_MUX_uxn_opcodes_h_l2951_c7_56b7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_56b7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2951_c7_56b7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_56b7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_56b7_return_output := opc_result_MUX_uxn_opcodes_h_l2951_c7_56b7_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_dd18_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_56b7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2950_c7_dd18] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2950_c7_dd18_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_dd18_cond;
     opc_result_MUX_uxn_opcodes_h_l2950_c7_dd18_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_dd18_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2950_c7_dd18_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_dd18_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_dd18_return_output := opc_result_MUX_uxn_opcodes_h_l2950_c7_dd18_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_1fe8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_dd18_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2949_c7_1fe8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2949_c7_1fe8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_1fe8_cond;
     opc_result_MUX_uxn_opcodes_h_l2949_c7_1fe8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_1fe8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2949_c7_1fe8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_1fe8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_1fe8_return_output := opc_result_MUX_uxn_opcodes_h_l2949_c7_1fe8_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_e52a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_1fe8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2948_c7_e52a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2948_c7_e52a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_e52a_cond;
     opc_result_MUX_uxn_opcodes_h_l2948_c7_e52a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_e52a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2948_c7_e52a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_e52a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_e52a_return_output := opc_result_MUX_uxn_opcodes_h_l2948_c7_e52a_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_8f5d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_e52a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2947_c7_8f5d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2947_c7_8f5d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_8f5d_cond;
     opc_result_MUX_uxn_opcodes_h_l2947_c7_8f5d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_8f5d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2947_c7_8f5d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_8f5d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_8f5d_return_output := opc_result_MUX_uxn_opcodes_h_l2947_c7_8f5d_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_7106_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_8f5d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2946_c7_7106] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2946_c7_7106_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_7106_cond;
     opc_result_MUX_uxn_opcodes_h_l2946_c7_7106_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_7106_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2946_c7_7106_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_7106_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_7106_return_output := opc_result_MUX_uxn_opcodes_h_l2946_c7_7106_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_875e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_7106_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2945_c7_875e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2945_c7_875e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_875e_cond;
     opc_result_MUX_uxn_opcodes_h_l2945_c7_875e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_875e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2945_c7_875e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_875e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_875e_return_output := opc_result_MUX_uxn_opcodes_h_l2945_c7_875e_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_9702_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_875e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2944_c7_9702] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2944_c7_9702_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_9702_cond;
     opc_result_MUX_uxn_opcodes_h_l2944_c7_9702_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_9702_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2944_c7_9702_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_9702_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_9702_return_output := opc_result_MUX_uxn_opcodes_h_l2944_c7_9702_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_10e6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_9702_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2943_c7_10e6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2943_c7_10e6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_10e6_cond;
     opc_result_MUX_uxn_opcodes_h_l2943_c7_10e6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_10e6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2943_c7_10e6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_10e6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_10e6_return_output := opc_result_MUX_uxn_opcodes_h_l2943_c7_10e6_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_4f24_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_10e6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2942_c7_4f24] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2942_c7_4f24_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_4f24_cond;
     opc_result_MUX_uxn_opcodes_h_l2942_c7_4f24_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_4f24_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2942_c7_4f24_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_4f24_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_4f24_return_output := opc_result_MUX_uxn_opcodes_h_l2942_c7_4f24_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_636d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_4f24_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2941_c7_636d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2941_c7_636d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_636d_cond;
     opc_result_MUX_uxn_opcodes_h_l2941_c7_636d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_636d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2941_c7_636d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_636d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_636d_return_output := opc_result_MUX_uxn_opcodes_h_l2941_c7_636d_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_7c8b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_636d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2940_c7_7c8b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2940_c7_7c8b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_7c8b_cond;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_7c8b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_7c8b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_7c8b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_7c8b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_7c8b_return_output := opc_result_MUX_uxn_opcodes_h_l2940_c7_7c8b_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_4841_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_7c8b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2939_c7_4841] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2939_c7_4841_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_4841_cond;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_4841_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_4841_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_4841_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_4841_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_4841_return_output := opc_result_MUX_uxn_opcodes_h_l2939_c7_4841_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_4cb0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_4841_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2938_c7_4cb0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2938_c7_4cb0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_4cb0_cond;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_4cb0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_4cb0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_4cb0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_4cb0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_4cb0_return_output := opc_result_MUX_uxn_opcodes_h_l2938_c7_4cb0_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_3786_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_4cb0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2937_c7_3786] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2937_c7_3786_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_3786_cond;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_3786_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_3786_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_3786_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_3786_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_3786_return_output := opc_result_MUX_uxn_opcodes_h_l2937_c7_3786_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_0b25_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_3786_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2936_c7_0b25] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2936_c7_0b25_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_0b25_cond;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_0b25_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_0b25_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_0b25_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_0b25_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_0b25_return_output := opc_result_MUX_uxn_opcodes_h_l2936_c7_0b25_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_8064_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_0b25_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2935_c7_8064] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2935_c7_8064_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_8064_cond;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_8064_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_8064_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_8064_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_8064_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_8064_return_output := opc_result_MUX_uxn_opcodes_h_l2935_c7_8064_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_0585_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_8064_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2934_c7_0585] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2934_c7_0585_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_0585_cond;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_0585_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_0585_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_0585_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_0585_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_0585_return_output := opc_result_MUX_uxn_opcodes_h_l2934_c7_0585_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_0745_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_0585_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2933_c7_0745] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2933_c7_0745_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_0745_cond;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_0745_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_0745_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_0745_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_0745_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_0745_return_output := opc_result_MUX_uxn_opcodes_h_l2933_c7_0745_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_307d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_0745_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2932_c7_307d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2932_c7_307d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_307d_cond;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_307d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_307d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_307d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_307d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_307d_return_output := opc_result_MUX_uxn_opcodes_h_l2932_c7_307d_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_729b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_307d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2931_c7_729b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2931_c7_729b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_729b_cond;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_729b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_729b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_729b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_729b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_729b_return_output := opc_result_MUX_uxn_opcodes_h_l2931_c7_729b_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b88d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_729b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2930_c7_b88d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2930_c7_b88d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b88d_cond;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_b88d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b88d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_b88d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b88d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b88d_return_output := opc_result_MUX_uxn_opcodes_h_l2930_c7_b88d_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_60b1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b88d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2929_c7_60b1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2929_c7_60b1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_60b1_cond;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_60b1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_60b1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_60b1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_60b1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_60b1_return_output := opc_result_MUX_uxn_opcodes_h_l2929_c7_60b1_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_71d1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_60b1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2928_c7_71d1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2928_c7_71d1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_71d1_cond;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_71d1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_71d1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_71d1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_71d1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_71d1_return_output := opc_result_MUX_uxn_opcodes_h_l2928_c7_71d1_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_3c0d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_71d1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2927_c7_3c0d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2927_c7_3c0d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_3c0d_cond;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_3c0d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_3c0d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_3c0d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_3c0d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_3c0d_return_output := opc_result_MUX_uxn_opcodes_h_l2927_c7_3c0d_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_e7bf_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_3c0d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2926_c7_e7bf] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2926_c7_e7bf_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_e7bf_cond;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_e7bf_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_e7bf_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_e7bf_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_e7bf_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_e7bf_return_output := opc_result_MUX_uxn_opcodes_h_l2926_c7_e7bf_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_5cec_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_e7bf_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2925_c7_5cec] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2925_c7_5cec_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_5cec_cond;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_5cec_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_5cec_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_5cec_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_5cec_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_5cec_return_output := opc_result_MUX_uxn_opcodes_h_l2925_c7_5cec_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_c25a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_5cec_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2924_c7_c25a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2924_c7_c25a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_c25a_cond;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_c25a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_c25a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_c25a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_c25a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_c25a_return_output := opc_result_MUX_uxn_opcodes_h_l2924_c7_c25a_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f85d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_c25a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2923_c7_f85d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2923_c7_f85d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f85d_cond;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_f85d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f85d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_f85d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f85d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f85d_return_output := opc_result_MUX_uxn_opcodes_h_l2923_c7_f85d_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_0723_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f85d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2922_c7_0723] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2922_c7_0723_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_0723_cond;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_0723_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_0723_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_0723_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_0723_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_0723_return_output := opc_result_MUX_uxn_opcodes_h_l2922_c7_0723_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_b35c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_0723_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2921_c7_b35c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2921_c7_b35c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_b35c_cond;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_b35c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_b35c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_b35c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_b35c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_b35c_return_output := opc_result_MUX_uxn_opcodes_h_l2921_c7_b35c_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_b546_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_b35c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2920_c7_b546] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2920_c7_b546_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_b546_cond;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_b546_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_b546_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_b546_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_b546_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_b546_return_output := opc_result_MUX_uxn_opcodes_h_l2920_c7_b546_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4bcd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_b546_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2919_c7_4bcd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2919_c7_4bcd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4bcd_cond;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_4bcd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4bcd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_4bcd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4bcd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4bcd_return_output := opc_result_MUX_uxn_opcodes_h_l2919_c7_4bcd_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8f8d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4bcd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2918_c7_8f8d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2918_c7_8f8d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8f8d_cond;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_8f8d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8f8d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_8f8d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8f8d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8f8d_return_output := opc_result_MUX_uxn_opcodes_h_l2918_c7_8f8d_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8d46_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8f8d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2917_c7_8d46] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2917_c7_8d46_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8d46_cond;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_8d46_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8d46_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_8d46_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8d46_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8d46_return_output := opc_result_MUX_uxn_opcodes_h_l2917_c7_8d46_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_ec5e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8d46_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2916_c7_ec5e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2916_c7_ec5e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_ec5e_cond;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_ec5e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_ec5e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_ec5e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_ec5e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_ec5e_return_output := opc_result_MUX_uxn_opcodes_h_l2916_c7_ec5e_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_60a2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_ec5e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2915_c7_60a2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2915_c7_60a2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_60a2_cond;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_60a2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_60a2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_60a2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_60a2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_60a2_return_output := opc_result_MUX_uxn_opcodes_h_l2915_c7_60a2_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_8458_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_60a2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2914_c7_8458] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2914_c7_8458_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_8458_cond;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_8458_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_8458_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_8458_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_8458_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_8458_return_output := opc_result_MUX_uxn_opcodes_h_l2914_c7_8458_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_0f12_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_8458_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2913_c7_0f12] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2913_c7_0f12_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_0f12_cond;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_0f12_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_0f12_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_0f12_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_0f12_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_0f12_return_output := opc_result_MUX_uxn_opcodes_h_l2913_c7_0f12_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_8f7e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_0f12_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2912_c7_8f7e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2912_c7_8f7e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_8f7e_cond;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_8f7e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_8f7e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_8f7e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_8f7e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_8f7e_return_output := opc_result_MUX_uxn_opcodes_h_l2912_c7_8f7e_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_cacc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_8f7e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2911_c7_cacc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2911_c7_cacc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_cacc_cond;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_cacc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_cacc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_cacc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_cacc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_cacc_return_output := opc_result_MUX_uxn_opcodes_h_l2911_c7_cacc_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_94ca_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_cacc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2910_c7_94ca] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2910_c7_94ca_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_94ca_cond;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_94ca_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_94ca_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_94ca_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_94ca_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_94ca_return_output := opc_result_MUX_uxn_opcodes_h_l2910_c7_94ca_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_e639_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_94ca_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2909_c7_e639] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2909_c7_e639_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_e639_cond;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_e639_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_e639_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_e639_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_e639_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_e639_return_output := opc_result_MUX_uxn_opcodes_h_l2909_c7_e639_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_cd44_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_e639_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2908_c7_cd44] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2908_c7_cd44_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_cd44_cond;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_cd44_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_cd44_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_cd44_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_cd44_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_cd44_return_output := opc_result_MUX_uxn_opcodes_h_l2908_c7_cd44_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d53c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_cd44_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2907_c7_d53c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2907_c7_d53c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d53c_cond;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_d53c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d53c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_d53c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d53c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d53c_return_output := opc_result_MUX_uxn_opcodes_h_l2907_c7_d53c_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_30fd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d53c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2906_c7_30fd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2906_c7_30fd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_30fd_cond;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_30fd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_30fd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_30fd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_30fd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_30fd_return_output := opc_result_MUX_uxn_opcodes_h_l2906_c7_30fd_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_fdd3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_30fd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2905_c7_fdd3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2905_c7_fdd3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_fdd3_cond;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_fdd3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_fdd3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_fdd3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_fdd3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_fdd3_return_output := opc_result_MUX_uxn_opcodes_h_l2905_c7_fdd3_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_1bfc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_fdd3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2904_c7_1bfc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2904_c7_1bfc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_1bfc_cond;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_1bfc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_1bfc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_1bfc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_1bfc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_1bfc_return_output := opc_result_MUX_uxn_opcodes_h_l2904_c7_1bfc_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_24d6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_1bfc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2903_c7_24d6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2903_c7_24d6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_24d6_cond;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_24d6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_24d6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_24d6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_24d6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_24d6_return_output := opc_result_MUX_uxn_opcodes_h_l2903_c7_24d6_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_5ca8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_24d6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2902_c7_5ca8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2902_c7_5ca8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_5ca8_cond;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_5ca8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_5ca8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_5ca8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_5ca8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_5ca8_return_output := opc_result_MUX_uxn_opcodes_h_l2902_c7_5ca8_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_4b8a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_5ca8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2901_c7_4b8a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2901_c7_4b8a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_4b8a_cond;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_4b8a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_4b8a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_4b8a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_4b8a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_4b8a_return_output := opc_result_MUX_uxn_opcodes_h_l2901_c7_4b8a_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_89d5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_4b8a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2900_c7_89d5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2900_c7_89d5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_89d5_cond;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_89d5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_89d5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_89d5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_89d5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_89d5_return_output := opc_result_MUX_uxn_opcodes_h_l2900_c7_89d5_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_2b32_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_89d5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2899_c7_2b32] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2899_c7_2b32_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_2b32_cond;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_2b32_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_2b32_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_2b32_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_2b32_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_2b32_return_output := opc_result_MUX_uxn_opcodes_h_l2899_c7_2b32_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_f54c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_2b32_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2898_c7_f54c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2898_c7_f54c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_f54c_cond;
     opc_result_MUX_uxn_opcodes_h_l2898_c7_f54c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_f54c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2898_c7_f54c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_f54c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_f54c_return_output := opc_result_MUX_uxn_opcodes_h_l2898_c7_f54c_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_6fee_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_f54c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2897_c7_6fee] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2897_c7_6fee_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_6fee_cond;
     opc_result_MUX_uxn_opcodes_h_l2897_c7_6fee_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_6fee_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2897_c7_6fee_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_6fee_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_6fee_return_output := opc_result_MUX_uxn_opcodes_h_l2897_c7_6fee_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_c86f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_6fee_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2896_c7_c86f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2896_c7_c86f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_c86f_cond;
     opc_result_MUX_uxn_opcodes_h_l2896_c7_c86f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_c86f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2896_c7_c86f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_c86f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_c86f_return_output := opc_result_MUX_uxn_opcodes_h_l2896_c7_c86f_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_d0e8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_c86f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2895_c7_d0e8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2895_c7_d0e8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_d0e8_cond;
     opc_result_MUX_uxn_opcodes_h_l2895_c7_d0e8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_d0e8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2895_c7_d0e8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_d0e8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_d0e8_return_output := opc_result_MUX_uxn_opcodes_h_l2895_c7_d0e8_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_5457_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_d0e8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2894_c7_5457] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2894_c7_5457_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_5457_cond;
     opc_result_MUX_uxn_opcodes_h_l2894_c7_5457_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_5457_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2894_c7_5457_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_5457_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_5457_return_output := opc_result_MUX_uxn_opcodes_h_l2894_c7_5457_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_4a49_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_5457_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2893_c7_4a49] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2893_c7_4a49_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_4a49_cond;
     opc_result_MUX_uxn_opcodes_h_l2893_c7_4a49_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_4a49_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2893_c7_4a49_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_4a49_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_4a49_return_output := opc_result_MUX_uxn_opcodes_h_l2893_c7_4a49_return_output;

     -- Submodule level 145
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_07db_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_4a49_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2892_c7_07db] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2892_c7_07db_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_07db_cond;
     opc_result_MUX_uxn_opcodes_h_l2892_c7_07db_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_07db_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2892_c7_07db_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_07db_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_07db_return_output := opc_result_MUX_uxn_opcodes_h_l2892_c7_07db_return_output;

     -- Submodule level 146
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_27a4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_07db_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2891_c7_27a4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2891_c7_27a4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_27a4_cond;
     opc_result_MUX_uxn_opcodes_h_l2891_c7_27a4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_27a4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2891_c7_27a4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_27a4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_27a4_return_output := opc_result_MUX_uxn_opcodes_h_l2891_c7_27a4_return_output;

     -- Submodule level 147
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_d402_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_27a4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2890_c7_d402] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2890_c7_d402_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_d402_cond;
     opc_result_MUX_uxn_opcodes_h_l2890_c7_d402_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_d402_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2890_c7_d402_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_d402_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_d402_return_output := opc_result_MUX_uxn_opcodes_h_l2890_c7_d402_return_output;

     -- Submodule level 148
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_d402_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2889_c2_ac95] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_cond;
     opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_return_output := opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_return_output;

     -- Submodule level 149
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_return_output;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2983_c33_2005] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2983_c33_2005_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2961_c17_17dd] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2961_c17_17dd_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l2982_c30_14ad] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2982_c30_14ad_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d[uxn_opcodes_h_l2985_c37_9a4e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2985_c37_9a4e_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l2980_c40_9d83] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2980_c40_9d83_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_return_output.is_device_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2964_l2966_DUPLICATE_f507 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2964_l2966_DUPLICATE_f507_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2969_c68_8f6c] LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2969_c68_8f6c_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2984_c34_a48b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2984_c34_a48b_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2981_c34_bde9] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2981_c34_bde9_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_return_output.is_pc_updated;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d[uxn_opcodes_h_l2979_c39_6c25] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2979_c39_6c25_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l2987_c32_81ed] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2987_c32_81ed_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_return_output.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2974_l2986_DUPLICATE_1644 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2974_l2986_DUPLICATE_1644_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2975_c3_55ad] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2975_c3_55ad_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2889_c2_ac95_return_output.is_stack_write;

     -- Submodule level 150
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2961_c2_36f6_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2961_c17_17dd_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2972_c24_ab8e_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2975_c3_55ad_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2972_c24_ab8e_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2974_l2986_DUPLICATE_1644_return_output;
     -- BIN_OP_XOR[uxn_opcodes_h_l2961_c2_36f6] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2961_c2_36f6_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2961_c2_36f6_left;
     BIN_OP_XOR_uxn_opcodes_h_l2961_c2_36f6_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2961_c2_36f6_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2961_c2_36f6_return_output := BIN_OP_XOR_uxn_opcodes_h_l2961_c2_36f6_return_output;

     -- CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2966_l2964_DUPLICATE_e6a3 LATENCY=0
     VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2966_l2964_DUPLICATE_e6a3_return_output := CAST_TO_int8_t_int4_t(
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2964_l2966_DUPLICATE_f507_return_output);

     -- CAST_TO_uint9_t[uxn_opcodes_h_l2969_c58_c7c5] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2969_c58_c7c5_return_output := CAST_TO_uint9_t_uint4_t(
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2969_c68_8f6c_return_output);

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2989_l2866_DUPLICATE_3357 LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2989_l2866_DUPLICATE_3357_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0(
     VAR_is_wait_MUX_uxn_opcodes_h_l2889_c2_ac95_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2979_c39_6c25_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2980_c40_9d83_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2981_c34_bde9_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2982_c30_14ad_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2983_c33_2005_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2984_c34_a48b_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2985_c37_9a4e_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2974_l2986_DUPLICATE_1644_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2987_c32_81ed_return_output);

     -- Submodule level 151
     VAR_MUX_uxn_opcodes_h_l2969_c29_6723_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2961_c2_36f6_return_output;
     VAR_MUX_uxn_opcodes_h_l2970_c20_88cb_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2961_c2_36f6_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2963_c2_dc35_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2961_c2_36f6_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2963_c2_dc35_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2961_c2_36f6_return_output;
     REG_VAR_stack_index := VAR_BIN_OP_XOR_uxn_opcodes_h_l2961_c2_36f6_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2964_c3_271b_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2966_l2964_DUPLICATE_e6a3_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2966_c3_e525_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2966_l2964_DUPLICATE_e6a3_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2969_c19_4410_right := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2969_c58_c7c5_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2989_l2866_DUPLICATE_3357_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2989_l2866_DUPLICATE_3357_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2964_c3_271b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2964_c3_271b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2964_c3_271b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2964_c3_271b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2964_c3_271b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2964_c3_271b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2964_c3_271b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2966_c3_e525] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2966_c3_e525_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2966_c3_e525_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2966_c3_e525_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2966_c3_e525_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2966_c3_e525_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2966_c3_e525_return_output;

     -- MUX[uxn_opcodes_h_l2970_c20_88cb] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2970_c20_88cb_cond <= VAR_MUX_uxn_opcodes_h_l2970_c20_88cb_cond;
     MUX_uxn_opcodes_h_l2970_c20_88cb_iftrue <= VAR_MUX_uxn_opcodes_h_l2970_c20_88cb_iftrue;
     MUX_uxn_opcodes_h_l2970_c20_88cb_iffalse <= VAR_MUX_uxn_opcodes_h_l2970_c20_88cb_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2970_c20_88cb_return_output := MUX_uxn_opcodes_h_l2970_c20_88cb_return_output;

     -- Submodule level 152
     VAR_sp1_uxn_opcodes_h_l2964_c3_c209 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2964_c3_271b_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l2966_c3_2baa := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2966_c3_e525_return_output)),8);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2970_c2_f2a4_right := VAR_MUX_uxn_opcodes_h_l2970_c20_88cb_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2963_c2_dc35_iffalse := VAR_sp0_uxn_opcodes_h_l2966_c3_2baa;
     VAR_sp1_MUX_uxn_opcodes_h_l2963_c2_dc35_iftrue := VAR_sp1_uxn_opcodes_h_l2964_c3_c209;
     -- sp0_MUX[uxn_opcodes_h_l2963_c2_dc35] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2963_c2_dc35_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2963_c2_dc35_cond;
     sp0_MUX_uxn_opcodes_h_l2963_c2_dc35_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2963_c2_dc35_iftrue;
     sp0_MUX_uxn_opcodes_h_l2963_c2_dc35_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2963_c2_dc35_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2963_c2_dc35_return_output := sp0_MUX_uxn_opcodes_h_l2963_c2_dc35_return_output;

     -- sp1_MUX[uxn_opcodes_h_l2963_c2_dc35] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2963_c2_dc35_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2963_c2_dc35_cond;
     sp1_MUX_uxn_opcodes_h_l2963_c2_dc35_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2963_c2_dc35_iftrue;
     sp1_MUX_uxn_opcodes_h_l2963_c2_dc35_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2963_c2_dc35_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2963_c2_dc35_return_output := sp1_MUX_uxn_opcodes_h_l2963_c2_dc35_return_output;

     -- Submodule level 153
     VAR_MUX_uxn_opcodes_h_l2969_c29_6723_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l2963_c2_dc35_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l2963_c2_dc35_return_output;
     VAR_MUX_uxn_opcodes_h_l2969_c29_6723_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2963_c2_dc35_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l2963_c2_dc35_return_output;
     -- MUX[uxn_opcodes_h_l2969_c29_6723] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2969_c29_6723_cond <= VAR_MUX_uxn_opcodes_h_l2969_c29_6723_cond;
     MUX_uxn_opcodes_h_l2969_c29_6723_iftrue <= VAR_MUX_uxn_opcodes_h_l2969_c29_6723_iftrue;
     MUX_uxn_opcodes_h_l2969_c29_6723_iffalse <= VAR_MUX_uxn_opcodes_h_l2969_c29_6723_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2969_c29_6723_return_output := MUX_uxn_opcodes_h_l2969_c29_6723_return_output;

     -- Submodule level 154
     -- CAST_TO_uint9_t[uxn_opcodes_h_l2969_c19_ff01] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2969_c19_ff01_return_output := CAST_TO_uint9_t_uint8_t(
     VAR_MUX_uxn_opcodes_h_l2969_c29_6723_return_output);

     -- Submodule level 155
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2969_c19_4410_left := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2969_c19_ff01_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l2969_c19_4410] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2969_c19_4410_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2969_c19_4410_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2969_c19_4410_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2969_c19_4410_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2969_c19_4410_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2969_c19_4410_return_output;

     -- Submodule level 156
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2970_c2_f2a4_left := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2969_c19_4410_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2970_c2_f2a4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2970_c2_f2a4_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2970_c2_f2a4_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2970_c2_f2a4_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2970_c2_f2a4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2970_c2_f2a4_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2970_c2_f2a4_return_output;

     -- Submodule level 157
     VAR_stack_address_uxn_opcodes_h_l2970_c2_31d5 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2970_c2_f2a4_return_output, 9);
     REG_VAR_stack_address := VAR_stack_address_uxn_opcodes_h_l2970_c2_31d5;
     VAR_stack_ram_update_uxn_opcodes_h_l2972_c24_ab8e_stack_address := VAR_stack_address_uxn_opcodes_h_l2970_c2_31d5;
     -- stack_ram_update[uxn_opcodes_h_l2972_c24_ab8e] LATENCY=0
     -- Clock enable
     stack_ram_update_uxn_opcodes_h_l2972_c24_ab8e_CLOCK_ENABLE <= VAR_stack_ram_update_uxn_opcodes_h_l2972_c24_ab8e_CLOCK_ENABLE;
     -- Inputs
     stack_ram_update_uxn_opcodes_h_l2972_c24_ab8e_stack_address <= VAR_stack_ram_update_uxn_opcodes_h_l2972_c24_ab8e_stack_address;
     stack_ram_update_uxn_opcodes_h_l2972_c24_ab8e_value <= VAR_stack_ram_update_uxn_opcodes_h_l2972_c24_ab8e_value;
     stack_ram_update_uxn_opcodes_h_l2972_c24_ab8e_write_enable <= VAR_stack_ram_update_uxn_opcodes_h_l2972_c24_ab8e_write_enable;
     -- Outputs
     VAR_stack_ram_update_uxn_opcodes_h_l2972_c24_ab8e_return_output := stack_ram_update_uxn_opcodes_h_l2972_c24_ab8e_return_output;

     -- Submodule level 158
     REG_VAR_previous_stack_read := VAR_stack_ram_update_uxn_opcodes_h_l2972_c24_ab8e_return_output;
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
