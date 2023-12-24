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
entity eval_opcode_phased_0CLK_f065ddc4 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out eval_opcode_result_t);
end eval_opcode_phased_0CLK_f065ddc4;
architecture arch of eval_opcode_phased_0CLK_f065ddc4 is
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
-- BIN_OP_AND[uxn_opcodes_h_l2880_c14_7970]
signal BIN_OP_AND_uxn_opcodes_h_l2880_c14_7970_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2880_c14_7970_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2880_c14_7970_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2881_c14_fd64]
signal BIN_OP_XOR_uxn_opcodes_h_l2881_c14_fd64_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2881_c14_fd64_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2881_c14_fd64_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2881_c14_1fa3]
signal BIN_OP_OR_uxn_opcodes_h_l2881_c14_1fa3_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2881_c14_1fa3_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2881_c14_1fa3_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l2881_c14_b18b]
signal UNARY_OP_NOT_uxn_opcodes_h_l2881_c14_b18b_expr : unsigned(7 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l2881_c14_b18b_return_output : unsigned(7 downto 0);

-- BIN_OP_NEQ[uxn_opcodes_h_l2881_c14_8b4f]
signal BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8b4f_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8b4f_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8b4f_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2881_c14_334c]
signal MUX_uxn_opcodes_h_l2881_c14_334c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2881_c14_334c_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2881_c14_334c_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2881_c14_334c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2882_c8_a4a5]
signal MUX_uxn_opcodes_h_l2882_c8_a4a5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2882_c8_a4a5_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2882_c8_a4a5_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2888_c6_503c]
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c6_503c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c6_503c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c6_503c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c7_046d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_046d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_046d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_046d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_046d_return_output : unsigned(0 downto 0);

-- is_wait_MUX[uxn_opcodes_h_l2888_c2_aaa5]
signal is_wait_MUX_uxn_opcodes_h_l2888_c2_aaa5_cond : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2888_c2_aaa5_iftrue : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2888_c2_aaa5_iffalse : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2888_c2_aaa5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2888_c2_aaa5]
signal opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_return_output : opcode_result_t;

-- brk[uxn_opcodes_h_l2888_c48_402f]
signal brk_uxn_opcodes_h_l2888_c48_402f_phase : unsigned(7 downto 0);
signal brk_uxn_opcodes_h_l2888_c48_402f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_4979]
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_4979_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_4979_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_4979_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c1_c9f0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_c9f0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_c9f0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_c9f0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_c9f0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c7_d1e9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d1e9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d1e9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d1e9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d1e9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2889_c7_046d]
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_046d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_046d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_046d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_046d_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l2889_c40_2f61]
signal jci_uxn_opcodes_h_l2889_c40_2f61_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l2889_c40_2f61_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2889_c40_2f61_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l2889_c40_2f61_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2889_c40_2f61_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2889_c40_2f61_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2890_c11_2ce4]
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_2ce4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_2ce4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_2ce4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c1_f493]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_f493_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_f493_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_f493_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_f493_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c7_746b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_746b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_746b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_746b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_746b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2890_c7_d1e9]
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_d1e9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_d1e9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_d1e9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_d1e9_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l2890_c40_016e]
signal jmi_uxn_opcodes_h_l2890_c40_016e_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l2890_c40_016e_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2890_c40_016e_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l2890_c40_016e_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2890_c40_016e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2891_c11_92d4]
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_92d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_92d4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_92d4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c1_ac77]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ac77_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ac77_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ac77_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ac77_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c7_ec22]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_ec22_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_ec22_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_ec22_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_ec22_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2891_c7_746b]
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_746b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_746b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_746b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_746b_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l2891_c40_1108]
signal jsi_uxn_opcodes_h_l2891_c40_1108_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l2891_c40_1108_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2891_c40_1108_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l2891_c40_1108_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2891_c40_1108_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_7f57]
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7f57_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7f57_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7f57_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c1_f415]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_f415_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_f415_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_f415_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_f415_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c7_c50b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_c50b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_c50b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_c50b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_c50b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2892_c7_ec22]
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_ec22_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_ec22_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_ec22_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_ec22_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2892_c40_0c64]
signal lit_uxn_opcodes_h_l2892_c40_0c64_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2892_c40_0c64_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2892_c40_0c64_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2892_c40_0c64_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2892_c40_0c64_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2893_c11_89b1]
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_89b1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_89b1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_89b1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c1_0285]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0285_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0285_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0285_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0285_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c7_aaaa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_aaaa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_aaaa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_aaaa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_aaaa_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2893_c7_c50b]
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_c50b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_c50b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_c50b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_c50b_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2893_c40_5bdf]
signal lit2_uxn_opcodes_h_l2893_c40_5bdf_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2893_c40_5bdf_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2893_c40_5bdf_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2893_c40_5bdf_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2893_c40_5bdf_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_df19]
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_df19_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_df19_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_df19_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c1_7dc5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7dc5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7dc5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7dc5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7dc5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c7_29cf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_29cf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_29cf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_29cf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_29cf_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2894_c7_aaaa]
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_aaaa_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_aaaa_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_aaaa_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_aaaa_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2894_c40_adf9]
signal lit_uxn_opcodes_h_l2894_c40_adf9_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2894_c40_adf9_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2894_c40_adf9_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2894_c40_adf9_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2894_c40_adf9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_9b7a]
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_9b7a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_9b7a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_9b7a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c1_e95e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e95e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e95e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e95e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e95e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c7_9713]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_9713_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_9713_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_9713_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_9713_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2895_c7_29cf]
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_29cf_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_29cf_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_29cf_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_29cf_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2895_c40_0928]
signal lit2_uxn_opcodes_h_l2895_c40_0928_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2895_c40_0928_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2895_c40_0928_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2895_c40_0928_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2895_c40_0928_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_394c]
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_394c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_394c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_394c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c1_9842]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9842_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9842_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9842_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9842_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c7_87b5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_87b5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_87b5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_87b5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_87b5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2896_c7_9713]
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_9713_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_9713_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_9713_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_9713_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l2896_c40_6ea4]
signal inc_uxn_opcodes_h_l2896_c40_6ea4_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l2896_c40_6ea4_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2896_c40_6ea4_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2896_c40_6ea4_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2896_c40_6ea4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_1619]
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1619_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1619_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1619_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c1_16e8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_16e8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_16e8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_16e8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_16e8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c7_a23b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_a23b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_a23b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_a23b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_a23b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2897_c7_87b5]
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_87b5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_87b5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_87b5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_87b5_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l2897_c40_ad36]
signal inc2_uxn_opcodes_h_l2897_c40_ad36_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l2897_c40_ad36_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2897_c40_ad36_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2897_c40_ad36_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2897_c40_ad36_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2898_c11_1c18]
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1c18_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1c18_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1c18_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_3ae6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3ae6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3ae6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3ae6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3ae6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_3690]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_3690_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_3690_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_3690_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_3690_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2898_c7_a23b]
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_a23b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_a23b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_a23b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_a23b_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l2898_c40_b895]
signal pop_uxn_opcodes_h_l2898_c40_b895_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l2898_c40_b895_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2898_c40_b895_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2898_c40_b895_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_3b27]
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3b27_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3b27_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3b27_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_8843]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_8843_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_8843_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_8843_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_8843_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_6a50]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6a50_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6a50_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6a50_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6a50_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2899_c7_3690]
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_3690_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_3690_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_3690_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_3690_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l2899_c40_6f5f]
signal pop2_uxn_opcodes_h_l2899_c40_6f5f_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l2899_c40_6f5f_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2899_c40_6f5f_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2899_c40_6f5f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_c6f8]
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c6f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c6f8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c6f8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_a9cc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a9cc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a9cc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a9cc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a9cc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_9cc5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9cc5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9cc5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9cc5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9cc5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2900_c7_6a50]
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_6a50_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_6a50_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_6a50_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_6a50_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l2900_c40_753e]
signal nip_uxn_opcodes_h_l2900_c40_753e_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l2900_c40_753e_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2900_c40_753e_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2900_c40_753e_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2900_c40_753e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_18d8]
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_18d8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_18d8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_18d8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_f2fa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f2fa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f2fa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f2fa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f2fa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_32d4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_32d4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_32d4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_32d4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_32d4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2901_c7_9cc5]
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_9cc5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_9cc5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_9cc5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_9cc5_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l2901_c40_6ffd]
signal nip2_uxn_opcodes_h_l2901_c40_6ffd_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l2901_c40_6ffd_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2901_c40_6ffd_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2901_c40_6ffd_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2901_c40_6ffd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_25a5]
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_25a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_25a5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_25a5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_56f1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_56f1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_56f1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_56f1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_56f1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_b588]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_b588_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_b588_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_b588_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_b588_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2902_c7_32d4]
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_32d4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_32d4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_32d4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_32d4_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l2902_c40_9de3]
signal swp_uxn_opcodes_h_l2902_c40_9de3_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l2902_c40_9de3_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2902_c40_9de3_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2902_c40_9de3_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2902_c40_9de3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_0ac4]
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0ac4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0ac4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0ac4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_23fa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_23fa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_23fa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_23fa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_23fa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_e57e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_e57e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_e57e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_e57e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_e57e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2903_c7_b588]
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_b588_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_b588_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_b588_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_b588_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l2903_c40_6d9e]
signal swp2_uxn_opcodes_h_l2903_c40_6d9e_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l2903_c40_6d9e_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2903_c40_6d9e_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2903_c40_6d9e_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2903_c40_6d9e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_56b3]
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_56b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_56b3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_56b3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_41aa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_41aa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_41aa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_41aa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_41aa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_ebbd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_ebbd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_ebbd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_ebbd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_ebbd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2904_c7_e57e]
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_e57e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_e57e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_e57e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_e57e_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l2904_c40_54be]
signal rot_uxn_opcodes_h_l2904_c40_54be_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l2904_c40_54be_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2904_c40_54be_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2904_c40_54be_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2904_c40_54be_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_30d6]
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_30d6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_30d6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_30d6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_d97c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_d97c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_d97c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_d97c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_d97c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_a749]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a749_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a749_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a749_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a749_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2905_c7_ebbd]
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_ebbd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_ebbd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_ebbd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_ebbd_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l2905_c40_023c]
signal rot2_uxn_opcodes_h_l2905_c40_023c_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l2905_c40_023c_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2905_c40_023c_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2905_c40_023c_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2905_c40_023c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_388b]
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_388b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_388b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_388b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_ff2a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_ff2a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_ff2a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_ff2a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_ff2a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_cb2f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cb2f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cb2f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cb2f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cb2f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2906_c7_a749]
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_a749_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_a749_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_a749_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_a749_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l2906_c40_86e1]
signal dup_uxn_opcodes_h_l2906_c40_86e1_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l2906_c40_86e1_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2906_c40_86e1_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2906_c40_86e1_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2906_c40_86e1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_c273]
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c273_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c273_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c273_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_ea23]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_ea23_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_ea23_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_ea23_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_ea23_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_0a31]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_0a31_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_0a31_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_0a31_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_0a31_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2907_c7_cb2f]
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_cb2f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_cb2f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_cb2f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_cb2f_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l2907_c40_a606]
signal dup2_uxn_opcodes_h_l2907_c40_a606_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l2907_c40_a606_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2907_c40_a606_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2907_c40_a606_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2907_c40_a606_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_7db7]
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7db7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7db7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7db7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_ddb6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ddb6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ddb6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ddb6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ddb6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_a596]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a596_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a596_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a596_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a596_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2908_c7_0a31]
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_0a31_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_0a31_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_0a31_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_0a31_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l2908_c40_05b8]
signal ovr_uxn_opcodes_h_l2908_c40_05b8_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l2908_c40_05b8_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2908_c40_05b8_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2908_c40_05b8_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2908_c40_05b8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_139c]
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_139c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_139c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_139c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_cbb0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cbb0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cbb0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cbb0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cbb0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_e87b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e87b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e87b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e87b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e87b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2909_c7_a596]
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_a596_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_a596_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_a596_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_a596_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l2909_c40_f341]
signal ovr2_uxn_opcodes_h_l2909_c40_f341_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l2909_c40_f341_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2909_c40_f341_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2909_c40_f341_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2909_c40_f341_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_1ea4]
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1ea4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1ea4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1ea4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_b7a7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_b7a7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_b7a7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_b7a7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_b7a7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_dfda]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_dfda_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_dfda_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_dfda_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_dfda_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2910_c7_e87b]
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_e87b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_e87b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_e87b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_e87b_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l2910_c40_e3d3]
signal equ_uxn_opcodes_h_l2910_c40_e3d3_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l2910_c40_e3d3_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2910_c40_e3d3_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2910_c40_e3d3_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2910_c40_e3d3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_e480]
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_e480_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_e480_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_e480_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_1e87]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1e87_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1e87_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1e87_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1e87_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_68c9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_68c9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_68c9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_68c9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_68c9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2911_c7_dfda]
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_dfda_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_dfda_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_dfda_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_dfda_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l2911_c40_302d]
signal equ2_uxn_opcodes_h_l2911_c40_302d_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l2911_c40_302d_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2911_c40_302d_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2911_c40_302d_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2911_c40_302d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_5962]
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5962_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5962_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5962_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_2c9c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_2c9c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_2c9c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_2c9c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_2c9c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_9e8d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9e8d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9e8d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9e8d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9e8d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2912_c7_68c9]
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_68c9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_68c9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_68c9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_68c9_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l2912_c40_0457]
signal neq_uxn_opcodes_h_l2912_c40_0457_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l2912_c40_0457_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2912_c40_0457_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2912_c40_0457_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2912_c40_0457_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_0b93]
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0b93_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0b93_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0b93_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_b75d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_b75d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_b75d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_b75d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_b75d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_bde8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_bde8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_bde8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_bde8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_bde8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2913_c7_9e8d]
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_9e8d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_9e8d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_9e8d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_9e8d_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l2913_c40_c7bd]
signal neq2_uxn_opcodes_h_l2913_c40_c7bd_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l2913_c40_c7bd_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2913_c40_c7bd_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2913_c40_c7bd_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2913_c40_c7bd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_fd57]
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fd57_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fd57_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fd57_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_49b6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49b6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49b6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49b6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49b6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_5202]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5202_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5202_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5202_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5202_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2914_c7_bde8]
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_bde8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_bde8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_bde8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_bde8_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l2914_c40_8de9]
signal gth_uxn_opcodes_h_l2914_c40_8de9_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l2914_c40_8de9_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2914_c40_8de9_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2914_c40_8de9_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2914_c40_8de9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_595b]
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_8f3a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f3a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f3a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f3a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f3a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_a6f1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a6f1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a6f1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a6f1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a6f1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2915_c7_5202]
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_5202_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_5202_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_5202_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_5202_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l2915_c40_00e4]
signal gth2_uxn_opcodes_h_l2915_c40_00e4_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l2915_c40_00e4_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2915_c40_00e4_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2915_c40_00e4_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2915_c40_00e4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_18da]
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_18da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_18da_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_18da_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_dd74]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dd74_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dd74_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dd74_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dd74_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_0a1d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_0a1d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_0a1d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_0a1d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_0a1d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2916_c7_a6f1]
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_a6f1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_a6f1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_a6f1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_a6f1_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l2916_c40_7107]
signal lth_uxn_opcodes_h_l2916_c40_7107_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l2916_c40_7107_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2916_c40_7107_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2916_c40_7107_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2916_c40_7107_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_ffb7]
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ffb7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ffb7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ffb7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_005b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_005b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_005b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_005b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_005b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_3ae2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_3ae2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_3ae2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_3ae2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_3ae2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2917_c7_0a1d]
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_0a1d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_0a1d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_0a1d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_0a1d_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l2917_c40_42af]
signal lth2_uxn_opcodes_h_l2917_c40_42af_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l2917_c40_42af_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2917_c40_42af_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2917_c40_42af_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2917_c40_42af_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_8de8]
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8de8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8de8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8de8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_1eb0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_1eb0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_1eb0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_1eb0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_1eb0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_4fd5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4fd5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4fd5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4fd5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4fd5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2918_c7_3ae2]
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_3ae2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_3ae2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_3ae2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_3ae2_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l2918_c40_4281]
signal jmp_uxn_opcodes_h_l2918_c40_4281_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l2918_c40_4281_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2918_c40_4281_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2918_c40_4281_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l2918_c40_4281_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2918_c40_4281_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_2677]
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_4001]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4001_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4001_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4001_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4001_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_f5d0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_f5d0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_f5d0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_f5d0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_f5d0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2919_c7_4fd5]
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_4fd5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_4fd5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_4fd5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_4fd5_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l2919_c40_6d2a]
signal jmp2_uxn_opcodes_h_l2919_c40_6d2a_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l2919_c40_6d2a_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2919_c40_6d2a_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2919_c40_6d2a_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2919_c40_6d2a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_b03d]
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_b03d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_b03d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_b03d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_e7bc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e7bc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e7bc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e7bc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e7bc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_c7fd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c7fd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c7fd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c7fd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c7fd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2920_c7_f5d0]
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_f5d0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_f5d0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_f5d0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_f5d0_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l2920_c40_a6de]
signal jcn_uxn_opcodes_h_l2920_c40_a6de_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l2920_c40_a6de_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2920_c40_a6de_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2920_c40_a6de_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l2920_c40_a6de_previous_stack_read : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2920_c40_a6de_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_17b7]
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_17b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_17b7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_17b7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_0be6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0be6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0be6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0be6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0be6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_2c7b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2c7b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2c7b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2c7b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2c7b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2921_c7_c7fd]
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_c7fd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_c7fd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_c7fd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_c7fd_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l2921_c40_76ba]
signal jcn2_uxn_opcodes_h_l2921_c40_76ba_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l2921_c40_76ba_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2921_c40_76ba_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2921_c40_76ba_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2921_c40_76ba_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_3d6c]
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3d6c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3d6c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3d6c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_6611]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6611_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6611_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6611_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6611_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_3326]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_3326_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_3326_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_3326_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_3326_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2922_c7_2c7b]
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_2c7b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_2c7b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_2c7b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_2c7b_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l2922_c40_af3d]
signal jsr_uxn_opcodes_h_l2922_c40_af3d_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l2922_c40_af3d_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2922_c40_af3d_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2922_c40_af3d_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l2922_c40_af3d_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2922_c40_af3d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_ea77]
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_ea77_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_ea77_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_ea77_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_834c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_834c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_834c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_834c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_834c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_3b0c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_3b0c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_3b0c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_3b0c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_3b0c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2923_c7_3326]
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_3326_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_3326_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_3326_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_3326_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l2923_c40_260a]
signal jsr2_uxn_opcodes_h_l2923_c40_260a_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l2923_c40_260a_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2923_c40_260a_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2923_c40_260a_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l2923_c40_260a_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2923_c40_260a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_1633]
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1633_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1633_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1633_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_cfc1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cfc1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cfc1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cfc1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cfc1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_5f5a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5f5a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5f5a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5f5a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5f5a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2924_c7_3b0c]
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_3b0c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_3b0c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_3b0c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_3b0c_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l2924_c40_11c5]
signal sth_uxn_opcodes_h_l2924_c40_11c5_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l2924_c40_11c5_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2924_c40_11c5_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2924_c40_11c5_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2924_c40_11c5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_b19d]
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b19d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b19d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b19d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_0c9d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_0c9d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_0c9d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_0c9d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_0c9d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_37ec]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_37ec_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_37ec_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_37ec_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_37ec_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2925_c7_5f5a]
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_5f5a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_5f5a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_5f5a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_5f5a_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l2925_c40_a95d]
signal sth2_uxn_opcodes_h_l2925_c40_a95d_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l2925_c40_a95d_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2925_c40_a95d_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2925_c40_a95d_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2925_c40_a95d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_c694]
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c694_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c694_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c694_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_0fd3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0fd3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0fd3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0fd3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0fd3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_b5ec]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_b5ec_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_b5ec_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_b5ec_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_b5ec_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2926_c7_37ec]
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_37ec_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_37ec_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_37ec_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_37ec_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l2926_c40_329e]
signal ldz_uxn_opcodes_h_l2926_c40_329e_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l2926_c40_329e_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2926_c40_329e_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2926_c40_329e_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2926_c40_329e_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2926_c40_329e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_0ca2]
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_0ca2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_0ca2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_0ca2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_d41e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d41e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d41e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d41e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d41e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_1614]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_1614_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_1614_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_1614_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_1614_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2927_c7_b5ec]
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_b5ec_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_b5ec_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_b5ec_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_b5ec_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l2927_c40_db58]
signal ldz2_uxn_opcodes_h_l2927_c40_db58_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l2927_c40_db58_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2927_c40_db58_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2927_c40_db58_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2927_c40_db58_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2927_c40_db58_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_41a9]
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_41a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_41a9_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_41a9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_1f32]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1f32_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1f32_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1f32_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1f32_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_3315]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3315_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3315_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3315_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3315_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2928_c7_1614]
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_1614_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_1614_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_1614_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_1614_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l2928_c40_0ad0]
signal stz_uxn_opcodes_h_l2928_c40_0ad0_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l2928_c40_0ad0_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2928_c40_0ad0_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2928_c40_0ad0_previous_stack_read : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2928_c40_0ad0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_486d]
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_486d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_486d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_486d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_fe97]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_fe97_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_fe97_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_fe97_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_fe97_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_b62e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b62e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b62e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b62e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b62e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2929_c7_3315]
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_3315_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_3315_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_3315_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_3315_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l2929_c40_b1ae]
signal stz2_uxn_opcodes_h_l2929_c40_b1ae_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l2929_c40_b1ae_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2929_c40_b1ae_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2929_c40_b1ae_previous_stack_read : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2929_c40_b1ae_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_5195]
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5195_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5195_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5195_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_1c17]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_1c17_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_1c17_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_1c17_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_1c17_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_d4d2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d4d2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d4d2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d4d2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d4d2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2930_c7_b62e]
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_b62e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_b62e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_b62e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_b62e_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l2930_c40_6955]
signal ldr_uxn_opcodes_h_l2930_c40_6955_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l2930_c40_6955_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2930_c40_6955_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2930_c40_6955_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l2930_c40_6955_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2930_c40_6955_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2930_c40_6955_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_fb14]
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_fb14_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_fb14_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_fb14_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_b973]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b973_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b973_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b973_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b973_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_95e1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_95e1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_95e1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_95e1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_95e1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2931_c7_d4d2]
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_d4d2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_d4d2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_d4d2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_d4d2_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l2931_c40_8a7e]
signal ldr2_uxn_opcodes_h_l2931_c40_8a7e_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l2931_c40_8a7e_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2931_c40_8a7e_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2931_c40_8a7e_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l2931_c40_8a7e_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2931_c40_8a7e_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2931_c40_8a7e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_649f]
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_649f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_649f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_649f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_715d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_715d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_715d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_715d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_715d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_dc0f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_dc0f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_dc0f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_dc0f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_dc0f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2932_c7_95e1]
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_95e1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_95e1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_95e1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_95e1_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l2932_c40_f6ac]
signal str1_uxn_opcodes_h_l2932_c40_f6ac_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l2932_c40_f6ac_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2932_c40_f6ac_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2932_c40_f6ac_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l2932_c40_f6ac_previous_stack_read : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2932_c40_f6ac_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_dd61]
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_dd61_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_dd61_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_dd61_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_6d5f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_6d5f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_6d5f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_6d5f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_6d5f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_c7e8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c7e8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c7e8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c7e8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c7e8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2933_c7_dc0f]
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_dc0f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_dc0f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_dc0f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_dc0f_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l2933_c40_5b53]
signal str2_uxn_opcodes_h_l2933_c40_5b53_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l2933_c40_5b53_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2933_c40_5b53_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2933_c40_5b53_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l2933_c40_5b53_previous_stack_read : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2933_c40_5b53_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_c665]
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c665_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c665_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c665_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_6ea2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6ea2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6ea2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6ea2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6ea2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_6a6b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_6a6b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_6a6b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_6a6b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_6a6b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2934_c7_c7e8]
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_c7e8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_c7e8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_c7e8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_c7e8_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l2934_c40_1c91]
signal lda_uxn_opcodes_h_l2934_c40_1c91_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l2934_c40_1c91_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2934_c40_1c91_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2934_c40_1c91_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2934_c40_1c91_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2934_c40_1c91_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_beff]
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_beff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_beff_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_beff_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_43f3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_43f3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_43f3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_43f3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_43f3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_7dd8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7dd8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7dd8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7dd8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7dd8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2935_c7_6a6b]
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_6a6b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_6a6b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_6a6b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_6a6b_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l2935_c40_809d]
signal lda2_uxn_opcodes_h_l2935_c40_809d_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l2935_c40_809d_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2935_c40_809d_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2935_c40_809d_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2935_c40_809d_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2935_c40_809d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_77a9]
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_77a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_77a9_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_77a9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_408e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_408e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_408e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_408e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_408e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_5294]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5294_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5294_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5294_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5294_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2936_c7_7dd8]
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_7dd8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_7dd8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_7dd8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_7dd8_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l2936_c40_b61e]
signal sta_uxn_opcodes_h_l2936_c40_b61e_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l2936_c40_b61e_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2936_c40_b61e_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2936_c40_b61e_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2936_c40_b61e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_ffd8]
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_ffd8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_ffd8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_ffd8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_b02b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b02b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b02b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b02b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b02b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_221d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_221d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_221d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_221d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_221d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2937_c7_5294]
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_5294_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_5294_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_5294_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_5294_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l2937_c40_0c6c]
signal sta2_uxn_opcodes_h_l2937_c40_0c6c_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l2937_c40_0c6c_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2937_c40_0c6c_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2937_c40_0c6c_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2937_c40_0c6c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_ee93]
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ee93_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ee93_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ee93_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_bfd0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_bfd0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_bfd0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_bfd0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_bfd0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_0eb4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_0eb4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_0eb4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_0eb4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_0eb4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2938_c7_221d]
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_221d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_221d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_221d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_221d_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l2938_c40_d3c7]
signal dei_uxn_opcodes_h_l2938_c40_d3c7_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l2938_c40_d3c7_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2938_c40_d3c7_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2938_c40_d3c7_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2938_c40_d3c7_previous_device_ram_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2938_c40_d3c7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_6916]
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_6916_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_6916_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_6916_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_929e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_929e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_929e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_929e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_929e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_5596]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_5596_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_5596_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_5596_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_5596_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2939_c7_0eb4]
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_0eb4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_0eb4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_0eb4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_0eb4_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l2939_c40_b165]
signal dei2_uxn_opcodes_h_l2939_c40_b165_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l2939_c40_b165_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2939_c40_b165_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2939_c40_b165_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2939_c40_b165_previous_device_ram_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2939_c40_b165_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_2724]
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_2724_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_2724_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_2724_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_b781]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_b781_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_b781_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_b781_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_b781_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c7_a4f3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a4f3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a4f3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a4f3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a4f3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2940_c7_5596]
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_5596_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_5596_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_5596_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_5596_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l2940_c40_ae64]
signal deo_uxn_opcodes_h_l2940_c40_ae64_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l2940_c40_ae64_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2940_c40_ae64_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2940_c40_ae64_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2940_c40_ae64_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2940_c40_ae64_previous_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2940_c40_ae64_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2941_c11_a84c]
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a84c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a84c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a84c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c1_f60d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f60d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f60d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f60d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f60d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2942_c7_a81a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_a81a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_a81a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_a81a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_a81a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2941_c7_a4f3]
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_a4f3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_a4f3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_a4f3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_a4f3_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l2941_c40_e00f]
signal deo2_uxn_opcodes_h_l2941_c40_e00f_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l2941_c40_e00f_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2941_c40_e00f_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2941_c40_e00f_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2941_c40_e00f_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2941_c40_e00f_previous_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2941_c40_e00f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2942_c11_b581]
signal BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b581_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b581_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b581_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2942_c1_ddc0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_ddc0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_ddc0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_ddc0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_ddc0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2943_c7_7f44]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_7f44_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_7f44_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_7f44_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_7f44_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2942_c7_a81a]
signal opc_result_MUX_uxn_opcodes_h_l2942_c7_a81a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2942_c7_a81a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2942_c7_a81a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2942_c7_a81a_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l2942_c40_7ef6]
signal add_uxn_opcodes_h_l2942_c40_7ef6_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l2942_c40_7ef6_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2942_c40_7ef6_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2942_c40_7ef6_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2942_c40_7ef6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2943_c11_676a]
signal BIN_OP_EQ_uxn_opcodes_h_l2943_c11_676a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2943_c11_676a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2943_c11_676a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2943_c1_8e80]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_8e80_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_8e80_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_8e80_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_8e80_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2944_c7_8c17]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_8c17_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_8c17_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_8c17_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_8c17_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2943_c7_7f44]
signal opc_result_MUX_uxn_opcodes_h_l2943_c7_7f44_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2943_c7_7f44_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2943_c7_7f44_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2943_c7_7f44_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l2943_c40_e135]
signal add2_uxn_opcodes_h_l2943_c40_e135_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l2943_c40_e135_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2943_c40_e135_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2943_c40_e135_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2943_c40_e135_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2944_c11_491a]
signal BIN_OP_EQ_uxn_opcodes_h_l2944_c11_491a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2944_c11_491a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2944_c11_491a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2944_c1_53ed]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_53ed_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_53ed_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_53ed_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_53ed_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2945_c7_6090]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_6090_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_6090_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_6090_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_6090_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2944_c7_8c17]
signal opc_result_MUX_uxn_opcodes_h_l2944_c7_8c17_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2944_c7_8c17_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2944_c7_8c17_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2944_c7_8c17_return_output : opcode_result_t;

-- sub[uxn_opcodes_h_l2944_c40_ad8a]
signal sub_uxn_opcodes_h_l2944_c40_ad8a_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub_uxn_opcodes_h_l2944_c40_ad8a_phase : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2944_c40_ad8a_ins : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2944_c40_ad8a_previous_stack_read : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2944_c40_ad8a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2945_c11_85a6]
signal BIN_OP_EQ_uxn_opcodes_h_l2945_c11_85a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2945_c11_85a6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2945_c11_85a6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2945_c1_c6e6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_c6e6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_c6e6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_c6e6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_c6e6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2946_c7_c1c0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_c1c0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_c1c0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_c1c0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_c1c0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2945_c7_6090]
signal opc_result_MUX_uxn_opcodes_h_l2945_c7_6090_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2945_c7_6090_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2945_c7_6090_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2945_c7_6090_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l2945_c40_e1f8]
signal sub2_uxn_opcodes_h_l2945_c40_e1f8_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l2945_c40_e1f8_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2945_c40_e1f8_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2945_c40_e1f8_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2945_c40_e1f8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2946_c11_de88]
signal BIN_OP_EQ_uxn_opcodes_h_l2946_c11_de88_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2946_c11_de88_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2946_c11_de88_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2946_c1_fc24]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_fc24_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_fc24_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_fc24_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_fc24_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2947_c7_66b1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_66b1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_66b1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_66b1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_66b1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2946_c7_c1c0]
signal opc_result_MUX_uxn_opcodes_h_l2946_c7_c1c0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2946_c7_c1c0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2946_c7_c1c0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2946_c7_c1c0_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l2946_c40_d4cb]
signal mul_uxn_opcodes_h_l2946_c40_d4cb_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l2946_c40_d4cb_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2946_c40_d4cb_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2946_c40_d4cb_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2946_c40_d4cb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2947_c11_7717]
signal BIN_OP_EQ_uxn_opcodes_h_l2947_c11_7717_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2947_c11_7717_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2947_c11_7717_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2947_c1_d3a2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d3a2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d3a2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d3a2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d3a2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2948_c7_8c22]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_8c22_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_8c22_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_8c22_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_8c22_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2947_c7_66b1]
signal opc_result_MUX_uxn_opcodes_h_l2947_c7_66b1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2947_c7_66b1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2947_c7_66b1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2947_c7_66b1_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l2947_c40_0493]
signal mul2_uxn_opcodes_h_l2947_c40_0493_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l2947_c40_0493_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2947_c40_0493_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2947_c40_0493_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2947_c40_0493_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2948_c11_aef2]
signal BIN_OP_EQ_uxn_opcodes_h_l2948_c11_aef2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2948_c11_aef2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2948_c11_aef2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2948_c1_3f40]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_3f40_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_3f40_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_3f40_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_3f40_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2949_c7_2daf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_2daf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_2daf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_2daf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_2daf_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2948_c7_8c22]
signal opc_result_MUX_uxn_opcodes_h_l2948_c7_8c22_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2948_c7_8c22_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2948_c7_8c22_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2948_c7_8c22_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l2948_c40_56b6]
signal div_uxn_opcodes_h_l2948_c40_56b6_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l2948_c40_56b6_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2948_c40_56b6_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2948_c40_56b6_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2948_c40_56b6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2949_c11_0999]
signal BIN_OP_EQ_uxn_opcodes_h_l2949_c11_0999_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2949_c11_0999_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2949_c11_0999_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2949_c1_7e59]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_7e59_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_7e59_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_7e59_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_7e59_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2950_c7_5e63]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5e63_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5e63_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5e63_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5e63_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2949_c7_2daf]
signal opc_result_MUX_uxn_opcodes_h_l2949_c7_2daf_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2949_c7_2daf_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2949_c7_2daf_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2949_c7_2daf_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l2949_c40_b4b4]
signal div2_uxn_opcodes_h_l2949_c40_b4b4_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l2949_c40_b4b4_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2949_c40_b4b4_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2949_c40_b4b4_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2949_c40_b4b4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2950_c11_4489]
signal BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4489_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4489_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4489_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2950_c1_3491]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_3491_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_3491_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_3491_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_3491_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2951_c7_726b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_726b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_726b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_726b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_726b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2950_c7_5e63]
signal opc_result_MUX_uxn_opcodes_h_l2950_c7_5e63_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2950_c7_5e63_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2950_c7_5e63_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2950_c7_5e63_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l2950_c40_cbe1]
signal and_uxn_opcodes_h_l2950_c40_cbe1_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l2950_c40_cbe1_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2950_c40_cbe1_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2950_c40_cbe1_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2950_c40_cbe1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2951_c11_c1b2]
signal BIN_OP_EQ_uxn_opcodes_h_l2951_c11_c1b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2951_c11_c1b2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2951_c11_c1b2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2951_c1_c909]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c909_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c909_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c909_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c909_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2952_c7_d743]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_d743_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_d743_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_d743_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_d743_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2951_c7_726b]
signal opc_result_MUX_uxn_opcodes_h_l2951_c7_726b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2951_c7_726b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2951_c7_726b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2951_c7_726b_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l2951_c40_2ee8]
signal and2_uxn_opcodes_h_l2951_c40_2ee8_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l2951_c40_2ee8_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2951_c40_2ee8_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2951_c40_2ee8_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2951_c40_2ee8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2952_c11_7cc8]
signal BIN_OP_EQ_uxn_opcodes_h_l2952_c11_7cc8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2952_c11_7cc8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2952_c11_7cc8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2952_c1_48db]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_48db_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_48db_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_48db_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_48db_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2953_c7_cb7e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_cb7e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_cb7e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_cb7e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_cb7e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2952_c7_d743]
signal opc_result_MUX_uxn_opcodes_h_l2952_c7_d743_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2952_c7_d743_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2952_c7_d743_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2952_c7_d743_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l2952_c40_b245]
signal ora_uxn_opcodes_h_l2952_c40_b245_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l2952_c40_b245_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2952_c40_b245_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2952_c40_b245_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2952_c40_b245_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2953_c11_2162]
signal BIN_OP_EQ_uxn_opcodes_h_l2953_c11_2162_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2953_c11_2162_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2953_c11_2162_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2953_c1_6541]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_6541_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_6541_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_6541_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_6541_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2954_c7_9bc0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_9bc0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_9bc0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_9bc0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_9bc0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2953_c7_cb7e]
signal opc_result_MUX_uxn_opcodes_h_l2953_c7_cb7e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2953_c7_cb7e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2953_c7_cb7e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2953_c7_cb7e_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l2953_c40_0b7b]
signal ora2_uxn_opcodes_h_l2953_c40_0b7b_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l2953_c40_0b7b_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2953_c40_0b7b_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2953_c40_0b7b_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2953_c40_0b7b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2954_c11_d70b]
signal BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d70b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d70b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d70b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2954_c1_389b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_389b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_389b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_389b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_389b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2955_c7_fceb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_fceb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_fceb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_fceb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_fceb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2954_c7_9bc0]
signal opc_result_MUX_uxn_opcodes_h_l2954_c7_9bc0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2954_c7_9bc0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2954_c7_9bc0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2954_c7_9bc0_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l2954_c40_01bc]
signal eor_uxn_opcodes_h_l2954_c40_01bc_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l2954_c40_01bc_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2954_c40_01bc_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2954_c40_01bc_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2954_c40_01bc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2955_c11_10b0]
signal BIN_OP_EQ_uxn_opcodes_h_l2955_c11_10b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2955_c11_10b0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2955_c11_10b0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2955_c1_c3de]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_c3de_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_c3de_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_c3de_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_c3de_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2956_c7_f87f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_f87f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_f87f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_f87f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_f87f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2955_c7_fceb]
signal opc_result_MUX_uxn_opcodes_h_l2955_c7_fceb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2955_c7_fceb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2955_c7_fceb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2955_c7_fceb_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l2955_c40_e421]
signal eor2_uxn_opcodes_h_l2955_c40_e421_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l2955_c40_e421_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2955_c40_e421_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2955_c40_e421_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2955_c40_e421_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2956_c11_017a]
signal BIN_OP_EQ_uxn_opcodes_h_l2956_c11_017a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2956_c11_017a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2956_c11_017a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2956_c1_276d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_276d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_276d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_276d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_276d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2957_c7_a332]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_a332_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_a332_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_a332_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_a332_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2956_c7_f87f]
signal opc_result_MUX_uxn_opcodes_h_l2956_c7_f87f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2956_c7_f87f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2956_c7_f87f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2956_c7_f87f_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l2956_c40_fa0b]
signal sft_uxn_opcodes_h_l2956_c40_fa0b_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l2956_c40_fa0b_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2956_c40_fa0b_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2956_c40_fa0b_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2956_c40_fa0b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2957_c11_cc06]
signal BIN_OP_EQ_uxn_opcodes_h_l2957_c11_cc06_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2957_c11_cc06_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2957_c11_cc06_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2957_c1_571d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_571d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_571d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_571d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_571d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2957_c7_a332]
signal opc_result_MUX_uxn_opcodes_h_l2957_c7_a332_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2957_c7_a332_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2957_c7_a332_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2957_c7_a332_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l2957_c40_ba44]
signal sft2_uxn_opcodes_h_l2957_c40_ba44_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l2957_c40_ba44_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2957_c40_ba44_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2957_c40_ba44_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2957_c40_ba44_return_output : opcode_result_t;

-- CONST_SR_6[uxn_opcodes_h_l2959_c16_e620]
signal CONST_SR_6_uxn_opcodes_h_l2959_c16_e620_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_opcodes_h_l2959_c16_e620_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2960_c2_ba44]
signal BIN_OP_XOR_uxn_opcodes_h_l2960_c2_ba44_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2960_c2_ba44_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2960_c2_ba44_return_output : unsigned(0 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2962_c2_cd3a]
signal sp1_MUX_uxn_opcodes_h_l2962_c2_cd3a_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2962_c2_cd3a_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2962_c2_cd3a_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2962_c2_cd3a_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2962_c2_cd3a]
signal sp0_MUX_uxn_opcodes_h_l2962_c2_cd3a_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2962_c2_cd3a_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2962_c2_cd3a_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2962_c2_cd3a_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2963_c3_5d3a]
signal BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_5d3a_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_5d3a_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_5d3a_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2965_c3_2e14]
signal BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_2e14_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_2e14_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_2e14_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l2968_c29_6b08]
signal MUX_uxn_opcodes_h_l2968_c29_6b08_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2968_c29_6b08_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2968_c29_6b08_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2968_c29_6b08_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2968_c19_e637]
signal BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_e637_left : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_e637_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_e637_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l2969_c20_04ea]
signal MUX_uxn_opcodes_h_l2969_c20_04ea_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2969_c20_04ea_iftrue : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2969_c20_04ea_iffalse : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2969_c20_04ea_return_output : unsigned(8 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2969_c2_8df3]
signal BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_8df3_left : unsigned(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_8df3_right : unsigned(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_8df3_return_output : unsigned(9 downto 0);

-- stack_ram_update[uxn_opcodes_h_l2971_c24_4ca2]
signal stack_ram_update_uxn_opcodes_h_l2971_c24_4ca2_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2971_c24_4ca2_stack_address : unsigned(8 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2971_c24_4ca2_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2971_c24_4ca2_write_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2971_c24_4ca2_return_output : unsigned(7 downto 0);

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
-- BIN_OP_AND_uxn_opcodes_h_l2880_c14_7970
BIN_OP_AND_uxn_opcodes_h_l2880_c14_7970 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2880_c14_7970_left,
BIN_OP_AND_uxn_opcodes_h_l2880_c14_7970_right,
BIN_OP_AND_uxn_opcodes_h_l2880_c14_7970_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2881_c14_fd64
BIN_OP_XOR_uxn_opcodes_h_l2881_c14_fd64 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2881_c14_fd64_left,
BIN_OP_XOR_uxn_opcodes_h_l2881_c14_fd64_right,
BIN_OP_XOR_uxn_opcodes_h_l2881_c14_fd64_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2881_c14_1fa3
BIN_OP_OR_uxn_opcodes_h_l2881_c14_1fa3 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2881_c14_1fa3_left,
BIN_OP_OR_uxn_opcodes_h_l2881_c14_1fa3_right,
BIN_OP_OR_uxn_opcodes_h_l2881_c14_1fa3_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l2881_c14_b18b
UNARY_OP_NOT_uxn_opcodes_h_l2881_c14_b18b : entity work.UNARY_OP_NOT_uint8_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l2881_c14_b18b_expr,
UNARY_OP_NOT_uxn_opcodes_h_l2881_c14_b18b_return_output);

-- BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8b4f
BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8b4f : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8b4f_left,
BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8b4f_right,
BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8b4f_return_output);

-- MUX_uxn_opcodes_h_l2881_c14_334c
MUX_uxn_opcodes_h_l2881_c14_334c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2881_c14_334c_cond,
MUX_uxn_opcodes_h_l2881_c14_334c_iftrue,
MUX_uxn_opcodes_h_l2881_c14_334c_iffalse,
MUX_uxn_opcodes_h_l2881_c14_334c_return_output);

-- MUX_uxn_opcodes_h_l2882_c8_a4a5
MUX_uxn_opcodes_h_l2882_c8_a4a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2882_c8_a4a5_cond,
MUX_uxn_opcodes_h_l2882_c8_a4a5_iftrue,
MUX_uxn_opcodes_h_l2882_c8_a4a5_iffalse,
MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2888_c6_503c
BIN_OP_EQ_uxn_opcodes_h_l2888_c6_503c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2888_c6_503c_left,
BIN_OP_EQ_uxn_opcodes_h_l2888_c6_503c_right,
BIN_OP_EQ_uxn_opcodes_h_l2888_c6_503c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_046d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_046d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_046d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_046d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_046d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_046d_return_output);

-- is_wait_MUX_uxn_opcodes_h_l2888_c2_aaa5
is_wait_MUX_uxn_opcodes_h_l2888_c2_aaa5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_wait_MUX_uxn_opcodes_h_l2888_c2_aaa5_cond,
is_wait_MUX_uxn_opcodes_h_l2888_c2_aaa5_iftrue,
is_wait_MUX_uxn_opcodes_h_l2888_c2_aaa5_iffalse,
is_wait_MUX_uxn_opcodes_h_l2888_c2_aaa5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5
opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_cond,
opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_return_output);

-- brk_uxn_opcodes_h_l2888_c48_402f
brk_uxn_opcodes_h_l2888_c48_402f : entity work.brk_0CLK_b45f1687 port map (
brk_uxn_opcodes_h_l2888_c48_402f_phase,
brk_uxn_opcodes_h_l2888_c48_402f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2889_c11_4979
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_4979 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_4979_left,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_4979_right,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_4979_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_c9f0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_c9f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_c9f0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_c9f0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_c9f0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_c9f0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d1e9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d1e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d1e9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d1e9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d1e9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d1e9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2889_c7_046d
opc_result_MUX_uxn_opcodes_h_l2889_c7_046d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2889_c7_046d_cond,
opc_result_MUX_uxn_opcodes_h_l2889_c7_046d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2889_c7_046d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2889_c7_046d_return_output);

-- jci_uxn_opcodes_h_l2889_c40_2f61
jci_uxn_opcodes_h_l2889_c40_2f61 : entity work.jci_0CLK_4351dde2 port map (
clk,
jci_uxn_opcodes_h_l2889_c40_2f61_CLOCK_ENABLE,
jci_uxn_opcodes_h_l2889_c40_2f61_phase,
jci_uxn_opcodes_h_l2889_c40_2f61_pc,
jci_uxn_opcodes_h_l2889_c40_2f61_previous_stack_read,
jci_uxn_opcodes_h_l2889_c40_2f61_previous_ram_read,
jci_uxn_opcodes_h_l2889_c40_2f61_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2890_c11_2ce4
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_2ce4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_2ce4_left,
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_2ce4_right,
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_2ce4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_f493
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_f493 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_f493_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_f493_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_f493_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_f493_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_746b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_746b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_746b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_746b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_746b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_746b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2890_c7_d1e9
opc_result_MUX_uxn_opcodes_h_l2890_c7_d1e9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2890_c7_d1e9_cond,
opc_result_MUX_uxn_opcodes_h_l2890_c7_d1e9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2890_c7_d1e9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2890_c7_d1e9_return_output);

-- jmi_uxn_opcodes_h_l2890_c40_016e
jmi_uxn_opcodes_h_l2890_c40_016e : entity work.jmi_0CLK_937caaea port map (
clk,
jmi_uxn_opcodes_h_l2890_c40_016e_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l2890_c40_016e_phase,
jmi_uxn_opcodes_h_l2890_c40_016e_pc,
jmi_uxn_opcodes_h_l2890_c40_016e_previous_ram_read,
jmi_uxn_opcodes_h_l2890_c40_016e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2891_c11_92d4
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_92d4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_92d4_left,
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_92d4_right,
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_92d4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ac77
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ac77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ac77_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ac77_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ac77_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ac77_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_ec22
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_ec22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_ec22_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_ec22_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_ec22_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_ec22_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2891_c7_746b
opc_result_MUX_uxn_opcodes_h_l2891_c7_746b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2891_c7_746b_cond,
opc_result_MUX_uxn_opcodes_h_l2891_c7_746b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2891_c7_746b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2891_c7_746b_return_output);

-- jsi_uxn_opcodes_h_l2891_c40_1108
jsi_uxn_opcodes_h_l2891_c40_1108 : entity work.jsi_0CLK_4c8178ef port map (
clk,
jsi_uxn_opcodes_h_l2891_c40_1108_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l2891_c40_1108_phase,
jsi_uxn_opcodes_h_l2891_c40_1108_pc,
jsi_uxn_opcodes_h_l2891_c40_1108_previous_ram_read,
jsi_uxn_opcodes_h_l2891_c40_1108_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7f57
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7f57 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7f57_left,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7f57_right,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7f57_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_f415
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_f415 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_f415_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_f415_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_f415_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_f415_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_c50b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_c50b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_c50b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_c50b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_c50b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_c50b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2892_c7_ec22
opc_result_MUX_uxn_opcodes_h_l2892_c7_ec22 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2892_c7_ec22_cond,
opc_result_MUX_uxn_opcodes_h_l2892_c7_ec22_iftrue,
opc_result_MUX_uxn_opcodes_h_l2892_c7_ec22_iffalse,
opc_result_MUX_uxn_opcodes_h_l2892_c7_ec22_return_output);

-- lit_uxn_opcodes_h_l2892_c40_0c64
lit_uxn_opcodes_h_l2892_c40_0c64 : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2892_c40_0c64_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2892_c40_0c64_phase,
lit_uxn_opcodes_h_l2892_c40_0c64_pc,
lit_uxn_opcodes_h_l2892_c40_0c64_previous_ram_read,
lit_uxn_opcodes_h_l2892_c40_0c64_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2893_c11_89b1
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_89b1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_89b1_left,
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_89b1_right,
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_89b1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0285
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0285 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0285_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0285_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0285_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0285_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_aaaa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_aaaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_aaaa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_aaaa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_aaaa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_aaaa_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2893_c7_c50b
opc_result_MUX_uxn_opcodes_h_l2893_c7_c50b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2893_c7_c50b_cond,
opc_result_MUX_uxn_opcodes_h_l2893_c7_c50b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2893_c7_c50b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2893_c7_c50b_return_output);

-- lit2_uxn_opcodes_h_l2893_c40_5bdf
lit2_uxn_opcodes_h_l2893_c40_5bdf : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2893_c40_5bdf_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2893_c40_5bdf_phase,
lit2_uxn_opcodes_h_l2893_c40_5bdf_pc,
lit2_uxn_opcodes_h_l2893_c40_5bdf_previous_ram_read,
lit2_uxn_opcodes_h_l2893_c40_5bdf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2894_c11_df19
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_df19 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_df19_left,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_df19_right,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_df19_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7dc5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7dc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7dc5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7dc5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7dc5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7dc5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_29cf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_29cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_29cf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_29cf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_29cf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_29cf_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2894_c7_aaaa
opc_result_MUX_uxn_opcodes_h_l2894_c7_aaaa : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2894_c7_aaaa_cond,
opc_result_MUX_uxn_opcodes_h_l2894_c7_aaaa_iftrue,
opc_result_MUX_uxn_opcodes_h_l2894_c7_aaaa_iffalse,
opc_result_MUX_uxn_opcodes_h_l2894_c7_aaaa_return_output);

-- lit_uxn_opcodes_h_l2894_c40_adf9
lit_uxn_opcodes_h_l2894_c40_adf9 : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2894_c40_adf9_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2894_c40_adf9_phase,
lit_uxn_opcodes_h_l2894_c40_adf9_pc,
lit_uxn_opcodes_h_l2894_c40_adf9_previous_ram_read,
lit_uxn_opcodes_h_l2894_c40_adf9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2895_c11_9b7a
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_9b7a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_9b7a_left,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_9b7a_right,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_9b7a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e95e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e95e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e95e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e95e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e95e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e95e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_9713
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_9713 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_9713_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_9713_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_9713_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_9713_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2895_c7_29cf
opc_result_MUX_uxn_opcodes_h_l2895_c7_29cf : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2895_c7_29cf_cond,
opc_result_MUX_uxn_opcodes_h_l2895_c7_29cf_iftrue,
opc_result_MUX_uxn_opcodes_h_l2895_c7_29cf_iffalse,
opc_result_MUX_uxn_opcodes_h_l2895_c7_29cf_return_output);

-- lit2_uxn_opcodes_h_l2895_c40_0928
lit2_uxn_opcodes_h_l2895_c40_0928 : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2895_c40_0928_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2895_c40_0928_phase,
lit2_uxn_opcodes_h_l2895_c40_0928_pc,
lit2_uxn_opcodes_h_l2895_c40_0928_previous_ram_read,
lit2_uxn_opcodes_h_l2895_c40_0928_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2896_c11_394c
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_394c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_394c_left,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_394c_right,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_394c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9842
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9842 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9842_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9842_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9842_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9842_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_87b5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_87b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_87b5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_87b5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_87b5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_87b5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2896_c7_9713
opc_result_MUX_uxn_opcodes_h_l2896_c7_9713 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2896_c7_9713_cond,
opc_result_MUX_uxn_opcodes_h_l2896_c7_9713_iftrue,
opc_result_MUX_uxn_opcodes_h_l2896_c7_9713_iffalse,
opc_result_MUX_uxn_opcodes_h_l2896_c7_9713_return_output);

-- inc_uxn_opcodes_h_l2896_c40_6ea4
inc_uxn_opcodes_h_l2896_c40_6ea4 : entity work.inc_0CLK_121b1df5 port map (
clk,
inc_uxn_opcodes_h_l2896_c40_6ea4_CLOCK_ENABLE,
inc_uxn_opcodes_h_l2896_c40_6ea4_phase,
inc_uxn_opcodes_h_l2896_c40_6ea4_ins,
inc_uxn_opcodes_h_l2896_c40_6ea4_previous_stack_read,
inc_uxn_opcodes_h_l2896_c40_6ea4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1619
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1619 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1619_left,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1619_right,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1619_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_16e8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_16e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_16e8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_16e8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_16e8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_16e8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_a23b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_a23b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_a23b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_a23b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_a23b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_a23b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2897_c7_87b5
opc_result_MUX_uxn_opcodes_h_l2897_c7_87b5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2897_c7_87b5_cond,
opc_result_MUX_uxn_opcodes_h_l2897_c7_87b5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2897_c7_87b5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2897_c7_87b5_return_output);

-- inc2_uxn_opcodes_h_l2897_c40_ad36
inc2_uxn_opcodes_h_l2897_c40_ad36 : entity work.inc2_0CLK_180c5210 port map (
clk,
inc2_uxn_opcodes_h_l2897_c40_ad36_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l2897_c40_ad36_phase,
inc2_uxn_opcodes_h_l2897_c40_ad36_ins,
inc2_uxn_opcodes_h_l2897_c40_ad36_previous_stack_read,
inc2_uxn_opcodes_h_l2897_c40_ad36_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1c18
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1c18 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1c18_left,
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1c18_right,
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1c18_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3ae6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3ae6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3ae6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3ae6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3ae6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3ae6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_3690
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_3690 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_3690_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_3690_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_3690_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_3690_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2898_c7_a23b
opc_result_MUX_uxn_opcodes_h_l2898_c7_a23b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2898_c7_a23b_cond,
opc_result_MUX_uxn_opcodes_h_l2898_c7_a23b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2898_c7_a23b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2898_c7_a23b_return_output);

-- pop_uxn_opcodes_h_l2898_c40_b895
pop_uxn_opcodes_h_l2898_c40_b895 : entity work.pop_0CLK_b0b628a3 port map (
clk,
pop_uxn_opcodes_h_l2898_c40_b895_CLOCK_ENABLE,
pop_uxn_opcodes_h_l2898_c40_b895_phase,
pop_uxn_opcodes_h_l2898_c40_b895_ins,
pop_uxn_opcodes_h_l2898_c40_b895_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3b27
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3b27 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3b27_left,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3b27_right,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3b27_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_8843
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_8843 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_8843_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_8843_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_8843_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_8843_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6a50
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6a50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6a50_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6a50_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6a50_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6a50_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2899_c7_3690
opc_result_MUX_uxn_opcodes_h_l2899_c7_3690 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2899_c7_3690_cond,
opc_result_MUX_uxn_opcodes_h_l2899_c7_3690_iftrue,
opc_result_MUX_uxn_opcodes_h_l2899_c7_3690_iffalse,
opc_result_MUX_uxn_opcodes_h_l2899_c7_3690_return_output);

-- pop2_uxn_opcodes_h_l2899_c40_6f5f
pop2_uxn_opcodes_h_l2899_c40_6f5f : entity work.pop2_0CLK_b0b628a3 port map (
clk,
pop2_uxn_opcodes_h_l2899_c40_6f5f_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l2899_c40_6f5f_phase,
pop2_uxn_opcodes_h_l2899_c40_6f5f_ins,
pop2_uxn_opcodes_h_l2899_c40_6f5f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c6f8
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c6f8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c6f8_left,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c6f8_right,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c6f8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a9cc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a9cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a9cc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a9cc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a9cc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a9cc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9cc5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9cc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9cc5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9cc5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9cc5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9cc5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2900_c7_6a50
opc_result_MUX_uxn_opcodes_h_l2900_c7_6a50 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2900_c7_6a50_cond,
opc_result_MUX_uxn_opcodes_h_l2900_c7_6a50_iftrue,
opc_result_MUX_uxn_opcodes_h_l2900_c7_6a50_iffalse,
opc_result_MUX_uxn_opcodes_h_l2900_c7_6a50_return_output);

-- nip_uxn_opcodes_h_l2900_c40_753e
nip_uxn_opcodes_h_l2900_c40_753e : entity work.nip_0CLK_d0ab213f port map (
clk,
nip_uxn_opcodes_h_l2900_c40_753e_CLOCK_ENABLE,
nip_uxn_opcodes_h_l2900_c40_753e_phase,
nip_uxn_opcodes_h_l2900_c40_753e_ins,
nip_uxn_opcodes_h_l2900_c40_753e_previous_stack_read,
nip_uxn_opcodes_h_l2900_c40_753e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2901_c11_18d8
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_18d8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_18d8_left,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_18d8_right,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_18d8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f2fa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f2fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f2fa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f2fa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f2fa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f2fa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_32d4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_32d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_32d4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_32d4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_32d4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_32d4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2901_c7_9cc5
opc_result_MUX_uxn_opcodes_h_l2901_c7_9cc5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2901_c7_9cc5_cond,
opc_result_MUX_uxn_opcodes_h_l2901_c7_9cc5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2901_c7_9cc5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2901_c7_9cc5_return_output);

-- nip2_uxn_opcodes_h_l2901_c40_6ffd
nip2_uxn_opcodes_h_l2901_c40_6ffd : entity work.nip2_0CLK_1a2ef46d port map (
clk,
nip2_uxn_opcodes_h_l2901_c40_6ffd_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l2901_c40_6ffd_phase,
nip2_uxn_opcodes_h_l2901_c40_6ffd_ins,
nip2_uxn_opcodes_h_l2901_c40_6ffd_previous_stack_read,
nip2_uxn_opcodes_h_l2901_c40_6ffd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2902_c11_25a5
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_25a5 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_25a5_left,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_25a5_right,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_25a5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_56f1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_56f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_56f1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_56f1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_56f1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_56f1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_b588
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_b588 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_b588_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_b588_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_b588_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_b588_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2902_c7_32d4
opc_result_MUX_uxn_opcodes_h_l2902_c7_32d4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2902_c7_32d4_cond,
opc_result_MUX_uxn_opcodes_h_l2902_c7_32d4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2902_c7_32d4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2902_c7_32d4_return_output);

-- swp_uxn_opcodes_h_l2902_c40_9de3
swp_uxn_opcodes_h_l2902_c40_9de3 : entity work.swp_0CLK_0d289325 port map (
clk,
swp_uxn_opcodes_h_l2902_c40_9de3_CLOCK_ENABLE,
swp_uxn_opcodes_h_l2902_c40_9de3_phase,
swp_uxn_opcodes_h_l2902_c40_9de3_ins,
swp_uxn_opcodes_h_l2902_c40_9de3_previous_stack_read,
swp_uxn_opcodes_h_l2902_c40_9de3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0ac4
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0ac4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0ac4_left,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0ac4_right,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0ac4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_23fa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_23fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_23fa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_23fa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_23fa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_23fa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_e57e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_e57e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_e57e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_e57e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_e57e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_e57e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2903_c7_b588
opc_result_MUX_uxn_opcodes_h_l2903_c7_b588 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2903_c7_b588_cond,
opc_result_MUX_uxn_opcodes_h_l2903_c7_b588_iftrue,
opc_result_MUX_uxn_opcodes_h_l2903_c7_b588_iffalse,
opc_result_MUX_uxn_opcodes_h_l2903_c7_b588_return_output);

-- swp2_uxn_opcodes_h_l2903_c40_6d9e
swp2_uxn_opcodes_h_l2903_c40_6d9e : entity work.swp2_0CLK_814c2afd port map (
clk,
swp2_uxn_opcodes_h_l2903_c40_6d9e_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l2903_c40_6d9e_phase,
swp2_uxn_opcodes_h_l2903_c40_6d9e_ins,
swp2_uxn_opcodes_h_l2903_c40_6d9e_previous_stack_read,
swp2_uxn_opcodes_h_l2903_c40_6d9e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2904_c11_56b3
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_56b3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_56b3_left,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_56b3_right,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_56b3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_41aa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_41aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_41aa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_41aa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_41aa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_41aa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_ebbd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_ebbd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_ebbd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_ebbd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_ebbd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_ebbd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2904_c7_e57e
opc_result_MUX_uxn_opcodes_h_l2904_c7_e57e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2904_c7_e57e_cond,
opc_result_MUX_uxn_opcodes_h_l2904_c7_e57e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2904_c7_e57e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2904_c7_e57e_return_output);

-- rot_uxn_opcodes_h_l2904_c40_54be
rot_uxn_opcodes_h_l2904_c40_54be : entity work.rot_0CLK_b288bfb7 port map (
clk,
rot_uxn_opcodes_h_l2904_c40_54be_CLOCK_ENABLE,
rot_uxn_opcodes_h_l2904_c40_54be_phase,
rot_uxn_opcodes_h_l2904_c40_54be_ins,
rot_uxn_opcodes_h_l2904_c40_54be_previous_stack_read,
rot_uxn_opcodes_h_l2904_c40_54be_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2905_c11_30d6
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_30d6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_30d6_left,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_30d6_right,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_30d6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_d97c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_d97c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_d97c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_d97c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_d97c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_d97c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a749
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a749 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a749_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a749_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a749_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a749_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2905_c7_ebbd
opc_result_MUX_uxn_opcodes_h_l2905_c7_ebbd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2905_c7_ebbd_cond,
opc_result_MUX_uxn_opcodes_h_l2905_c7_ebbd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2905_c7_ebbd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2905_c7_ebbd_return_output);

-- rot2_uxn_opcodes_h_l2905_c40_023c
rot2_uxn_opcodes_h_l2905_c40_023c : entity work.rot2_0CLK_8e773831 port map (
clk,
rot2_uxn_opcodes_h_l2905_c40_023c_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l2905_c40_023c_phase,
rot2_uxn_opcodes_h_l2905_c40_023c_ins,
rot2_uxn_opcodes_h_l2905_c40_023c_previous_stack_read,
rot2_uxn_opcodes_h_l2905_c40_023c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2906_c11_388b
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_388b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_388b_left,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_388b_right,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_388b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_ff2a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_ff2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_ff2a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_ff2a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_ff2a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_ff2a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cb2f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cb2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cb2f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cb2f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cb2f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cb2f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2906_c7_a749
opc_result_MUX_uxn_opcodes_h_l2906_c7_a749 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2906_c7_a749_cond,
opc_result_MUX_uxn_opcodes_h_l2906_c7_a749_iftrue,
opc_result_MUX_uxn_opcodes_h_l2906_c7_a749_iffalse,
opc_result_MUX_uxn_opcodes_h_l2906_c7_a749_return_output);

-- dup_uxn_opcodes_h_l2906_c40_86e1
dup_uxn_opcodes_h_l2906_c40_86e1 : entity work.dup_0CLK_d4b33a56 port map (
clk,
dup_uxn_opcodes_h_l2906_c40_86e1_CLOCK_ENABLE,
dup_uxn_opcodes_h_l2906_c40_86e1_phase,
dup_uxn_opcodes_h_l2906_c40_86e1_ins,
dup_uxn_opcodes_h_l2906_c40_86e1_previous_stack_read,
dup_uxn_opcodes_h_l2906_c40_86e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c273
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c273 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c273_left,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c273_right,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c273_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_ea23
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_ea23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_ea23_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_ea23_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_ea23_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_ea23_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_0a31
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_0a31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_0a31_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_0a31_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_0a31_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_0a31_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2907_c7_cb2f
opc_result_MUX_uxn_opcodes_h_l2907_c7_cb2f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2907_c7_cb2f_cond,
opc_result_MUX_uxn_opcodes_h_l2907_c7_cb2f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2907_c7_cb2f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2907_c7_cb2f_return_output);

-- dup2_uxn_opcodes_h_l2907_c40_a606
dup2_uxn_opcodes_h_l2907_c40_a606 : entity work.dup2_0CLK_e4095020 port map (
clk,
dup2_uxn_opcodes_h_l2907_c40_a606_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l2907_c40_a606_phase,
dup2_uxn_opcodes_h_l2907_c40_a606_ins,
dup2_uxn_opcodes_h_l2907_c40_a606_previous_stack_read,
dup2_uxn_opcodes_h_l2907_c40_a606_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7db7
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7db7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7db7_left,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7db7_right,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7db7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ddb6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ddb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ddb6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ddb6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ddb6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ddb6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a596
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a596 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a596_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a596_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a596_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a596_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2908_c7_0a31
opc_result_MUX_uxn_opcodes_h_l2908_c7_0a31 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2908_c7_0a31_cond,
opc_result_MUX_uxn_opcodes_h_l2908_c7_0a31_iftrue,
opc_result_MUX_uxn_opcodes_h_l2908_c7_0a31_iffalse,
opc_result_MUX_uxn_opcodes_h_l2908_c7_0a31_return_output);

-- ovr_uxn_opcodes_h_l2908_c40_05b8
ovr_uxn_opcodes_h_l2908_c40_05b8 : entity work.ovr_0CLK_61914e8d port map (
clk,
ovr_uxn_opcodes_h_l2908_c40_05b8_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l2908_c40_05b8_phase,
ovr_uxn_opcodes_h_l2908_c40_05b8_ins,
ovr_uxn_opcodes_h_l2908_c40_05b8_previous_stack_read,
ovr_uxn_opcodes_h_l2908_c40_05b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2909_c11_139c
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_139c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_139c_left,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_139c_right,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_139c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cbb0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cbb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cbb0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cbb0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cbb0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cbb0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e87b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e87b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e87b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e87b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e87b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e87b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2909_c7_a596
opc_result_MUX_uxn_opcodes_h_l2909_c7_a596 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2909_c7_a596_cond,
opc_result_MUX_uxn_opcodes_h_l2909_c7_a596_iftrue,
opc_result_MUX_uxn_opcodes_h_l2909_c7_a596_iffalse,
opc_result_MUX_uxn_opcodes_h_l2909_c7_a596_return_output);

-- ovr2_uxn_opcodes_h_l2909_c40_f341
ovr2_uxn_opcodes_h_l2909_c40_f341 : entity work.ovr2_0CLK_bb09c2cb port map (
clk,
ovr2_uxn_opcodes_h_l2909_c40_f341_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l2909_c40_f341_phase,
ovr2_uxn_opcodes_h_l2909_c40_f341_ins,
ovr2_uxn_opcodes_h_l2909_c40_f341_previous_stack_read,
ovr2_uxn_opcodes_h_l2909_c40_f341_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1ea4
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1ea4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1ea4_left,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1ea4_right,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1ea4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_b7a7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_b7a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_b7a7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_b7a7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_b7a7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_b7a7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_dfda
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_dfda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_dfda_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_dfda_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_dfda_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_dfda_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2910_c7_e87b
opc_result_MUX_uxn_opcodes_h_l2910_c7_e87b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2910_c7_e87b_cond,
opc_result_MUX_uxn_opcodes_h_l2910_c7_e87b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2910_c7_e87b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2910_c7_e87b_return_output);

-- equ_uxn_opcodes_h_l2910_c40_e3d3
equ_uxn_opcodes_h_l2910_c40_e3d3 : entity work.equ_0CLK_226c8821 port map (
clk,
equ_uxn_opcodes_h_l2910_c40_e3d3_CLOCK_ENABLE,
equ_uxn_opcodes_h_l2910_c40_e3d3_phase,
equ_uxn_opcodes_h_l2910_c40_e3d3_ins,
equ_uxn_opcodes_h_l2910_c40_e3d3_previous_stack_read,
equ_uxn_opcodes_h_l2910_c40_e3d3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2911_c11_e480
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_e480 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_e480_left,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_e480_right,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_e480_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1e87
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1e87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1e87_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1e87_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1e87_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1e87_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_68c9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_68c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_68c9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_68c9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_68c9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_68c9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2911_c7_dfda
opc_result_MUX_uxn_opcodes_h_l2911_c7_dfda : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2911_c7_dfda_cond,
opc_result_MUX_uxn_opcodes_h_l2911_c7_dfda_iftrue,
opc_result_MUX_uxn_opcodes_h_l2911_c7_dfda_iffalse,
opc_result_MUX_uxn_opcodes_h_l2911_c7_dfda_return_output);

-- equ2_uxn_opcodes_h_l2911_c40_302d
equ2_uxn_opcodes_h_l2911_c40_302d : entity work.equ2_0CLK_609876da port map (
clk,
equ2_uxn_opcodes_h_l2911_c40_302d_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l2911_c40_302d_phase,
equ2_uxn_opcodes_h_l2911_c40_302d_ins,
equ2_uxn_opcodes_h_l2911_c40_302d_previous_stack_read,
equ2_uxn_opcodes_h_l2911_c40_302d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5962
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5962 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5962_left,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5962_right,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5962_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_2c9c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_2c9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_2c9c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_2c9c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_2c9c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_2c9c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9e8d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9e8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9e8d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9e8d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9e8d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9e8d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2912_c7_68c9
opc_result_MUX_uxn_opcodes_h_l2912_c7_68c9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2912_c7_68c9_cond,
opc_result_MUX_uxn_opcodes_h_l2912_c7_68c9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2912_c7_68c9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2912_c7_68c9_return_output);

-- neq_uxn_opcodes_h_l2912_c40_0457
neq_uxn_opcodes_h_l2912_c40_0457 : entity work.neq_0CLK_226c8821 port map (
clk,
neq_uxn_opcodes_h_l2912_c40_0457_CLOCK_ENABLE,
neq_uxn_opcodes_h_l2912_c40_0457_phase,
neq_uxn_opcodes_h_l2912_c40_0457_ins,
neq_uxn_opcodes_h_l2912_c40_0457_previous_stack_read,
neq_uxn_opcodes_h_l2912_c40_0457_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0b93
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0b93 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0b93_left,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0b93_right,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0b93_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_b75d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_b75d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_b75d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_b75d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_b75d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_b75d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_bde8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_bde8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_bde8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_bde8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_bde8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_bde8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2913_c7_9e8d
opc_result_MUX_uxn_opcodes_h_l2913_c7_9e8d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2913_c7_9e8d_cond,
opc_result_MUX_uxn_opcodes_h_l2913_c7_9e8d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2913_c7_9e8d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2913_c7_9e8d_return_output);

-- neq2_uxn_opcodes_h_l2913_c40_c7bd
neq2_uxn_opcodes_h_l2913_c40_c7bd : entity work.neq2_0CLK_609876da port map (
clk,
neq2_uxn_opcodes_h_l2913_c40_c7bd_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l2913_c40_c7bd_phase,
neq2_uxn_opcodes_h_l2913_c40_c7bd_ins,
neq2_uxn_opcodes_h_l2913_c40_c7bd_previous_stack_read,
neq2_uxn_opcodes_h_l2913_c40_c7bd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fd57
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fd57 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fd57_left,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fd57_right,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fd57_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49b6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49b6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49b6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49b6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49b6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5202
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5202 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5202_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5202_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5202_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5202_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2914_c7_bde8
opc_result_MUX_uxn_opcodes_h_l2914_c7_bde8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2914_c7_bde8_cond,
opc_result_MUX_uxn_opcodes_h_l2914_c7_bde8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2914_c7_bde8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2914_c7_bde8_return_output);

-- gth_uxn_opcodes_h_l2914_c40_8de9
gth_uxn_opcodes_h_l2914_c40_8de9 : entity work.gth_0CLK_226c8821 port map (
clk,
gth_uxn_opcodes_h_l2914_c40_8de9_CLOCK_ENABLE,
gth_uxn_opcodes_h_l2914_c40_8de9_phase,
gth_uxn_opcodes_h_l2914_c40_8de9_ins,
gth_uxn_opcodes_h_l2914_c40_8de9_previous_stack_read,
gth_uxn_opcodes_h_l2914_c40_8de9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_left,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_right,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f3a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f3a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f3a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f3a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f3a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a6f1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a6f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a6f1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a6f1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a6f1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a6f1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2915_c7_5202
opc_result_MUX_uxn_opcodes_h_l2915_c7_5202 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2915_c7_5202_cond,
opc_result_MUX_uxn_opcodes_h_l2915_c7_5202_iftrue,
opc_result_MUX_uxn_opcodes_h_l2915_c7_5202_iffalse,
opc_result_MUX_uxn_opcodes_h_l2915_c7_5202_return_output);

-- gth2_uxn_opcodes_h_l2915_c40_00e4
gth2_uxn_opcodes_h_l2915_c40_00e4 : entity work.gth2_0CLK_609876da port map (
clk,
gth2_uxn_opcodes_h_l2915_c40_00e4_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l2915_c40_00e4_phase,
gth2_uxn_opcodes_h_l2915_c40_00e4_ins,
gth2_uxn_opcodes_h_l2915_c40_00e4_previous_stack_read,
gth2_uxn_opcodes_h_l2915_c40_00e4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2916_c11_18da
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_18da : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_18da_left,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_18da_right,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_18da_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dd74
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dd74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dd74_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dd74_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dd74_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dd74_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_0a1d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_0a1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_0a1d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_0a1d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_0a1d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_0a1d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2916_c7_a6f1
opc_result_MUX_uxn_opcodes_h_l2916_c7_a6f1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2916_c7_a6f1_cond,
opc_result_MUX_uxn_opcodes_h_l2916_c7_a6f1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2916_c7_a6f1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2916_c7_a6f1_return_output);

-- lth_uxn_opcodes_h_l2916_c40_7107
lth_uxn_opcodes_h_l2916_c40_7107 : entity work.lth_0CLK_226c8821 port map (
clk,
lth_uxn_opcodes_h_l2916_c40_7107_CLOCK_ENABLE,
lth_uxn_opcodes_h_l2916_c40_7107_phase,
lth_uxn_opcodes_h_l2916_c40_7107_ins,
lth_uxn_opcodes_h_l2916_c40_7107_previous_stack_read,
lth_uxn_opcodes_h_l2916_c40_7107_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ffb7
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ffb7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ffb7_left,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ffb7_right,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ffb7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_005b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_005b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_005b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_005b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_005b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_005b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_3ae2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_3ae2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_3ae2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_3ae2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_3ae2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_3ae2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2917_c7_0a1d
opc_result_MUX_uxn_opcodes_h_l2917_c7_0a1d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2917_c7_0a1d_cond,
opc_result_MUX_uxn_opcodes_h_l2917_c7_0a1d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2917_c7_0a1d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2917_c7_0a1d_return_output);

-- lth2_uxn_opcodes_h_l2917_c40_42af
lth2_uxn_opcodes_h_l2917_c40_42af : entity work.lth2_0CLK_609876da port map (
clk,
lth2_uxn_opcodes_h_l2917_c40_42af_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l2917_c40_42af_phase,
lth2_uxn_opcodes_h_l2917_c40_42af_ins,
lth2_uxn_opcodes_h_l2917_c40_42af_previous_stack_read,
lth2_uxn_opcodes_h_l2917_c40_42af_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8de8
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8de8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8de8_left,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8de8_right,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8de8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_1eb0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_1eb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_1eb0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_1eb0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_1eb0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_1eb0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4fd5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4fd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4fd5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4fd5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4fd5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4fd5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2918_c7_3ae2
opc_result_MUX_uxn_opcodes_h_l2918_c7_3ae2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2918_c7_3ae2_cond,
opc_result_MUX_uxn_opcodes_h_l2918_c7_3ae2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2918_c7_3ae2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2918_c7_3ae2_return_output);

-- jmp_uxn_opcodes_h_l2918_c40_4281
jmp_uxn_opcodes_h_l2918_c40_4281 : entity work.jmp_0CLK_121b1df5 port map (
clk,
jmp_uxn_opcodes_h_l2918_c40_4281_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l2918_c40_4281_phase,
jmp_uxn_opcodes_h_l2918_c40_4281_ins,
jmp_uxn_opcodes_h_l2918_c40_4281_pc,
jmp_uxn_opcodes_h_l2918_c40_4281_previous_stack_read,
jmp_uxn_opcodes_h_l2918_c40_4281_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_left,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_right,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4001
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4001 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4001_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4001_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4001_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4001_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_f5d0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_f5d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_f5d0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_f5d0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_f5d0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_f5d0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2919_c7_4fd5
opc_result_MUX_uxn_opcodes_h_l2919_c7_4fd5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2919_c7_4fd5_cond,
opc_result_MUX_uxn_opcodes_h_l2919_c7_4fd5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2919_c7_4fd5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2919_c7_4fd5_return_output);

-- jmp2_uxn_opcodes_h_l2919_c40_6d2a
jmp2_uxn_opcodes_h_l2919_c40_6d2a : entity work.jmp2_0CLK_d6642053 port map (
clk,
jmp2_uxn_opcodes_h_l2919_c40_6d2a_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l2919_c40_6d2a_phase,
jmp2_uxn_opcodes_h_l2919_c40_6d2a_ins,
jmp2_uxn_opcodes_h_l2919_c40_6d2a_previous_stack_read,
jmp2_uxn_opcodes_h_l2919_c40_6d2a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2920_c11_b03d
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_b03d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_b03d_left,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_b03d_right,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_b03d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e7bc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e7bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e7bc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e7bc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e7bc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e7bc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c7fd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c7fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c7fd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c7fd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c7fd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c7fd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2920_c7_f5d0
opc_result_MUX_uxn_opcodes_h_l2920_c7_f5d0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2920_c7_f5d0_cond,
opc_result_MUX_uxn_opcodes_h_l2920_c7_f5d0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2920_c7_f5d0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2920_c7_f5d0_return_output);

-- jcn_uxn_opcodes_h_l2920_c40_a6de
jcn_uxn_opcodes_h_l2920_c40_a6de : entity work.jcn_0CLK_226c8821 port map (
clk,
jcn_uxn_opcodes_h_l2920_c40_a6de_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l2920_c40_a6de_phase,
jcn_uxn_opcodes_h_l2920_c40_a6de_ins,
jcn_uxn_opcodes_h_l2920_c40_a6de_pc,
jcn_uxn_opcodes_h_l2920_c40_a6de_previous_stack_read,
jcn_uxn_opcodes_h_l2920_c40_a6de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2921_c11_17b7
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_17b7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_17b7_left,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_17b7_right,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_17b7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0be6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0be6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0be6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0be6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0be6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0be6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2c7b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2c7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2c7b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2c7b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2c7b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2c7b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2921_c7_c7fd
opc_result_MUX_uxn_opcodes_h_l2921_c7_c7fd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2921_c7_c7fd_cond,
opc_result_MUX_uxn_opcodes_h_l2921_c7_c7fd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2921_c7_c7fd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2921_c7_c7fd_return_output);

-- jcn2_uxn_opcodes_h_l2921_c40_76ba
jcn2_uxn_opcodes_h_l2921_c40_76ba : entity work.jcn2_0CLK_12273847 port map (
clk,
jcn2_uxn_opcodes_h_l2921_c40_76ba_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l2921_c40_76ba_phase,
jcn2_uxn_opcodes_h_l2921_c40_76ba_ins,
jcn2_uxn_opcodes_h_l2921_c40_76ba_previous_stack_read,
jcn2_uxn_opcodes_h_l2921_c40_76ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3d6c
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3d6c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3d6c_left,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3d6c_right,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3d6c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6611
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6611 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6611_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6611_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6611_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6611_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_3326
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_3326 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_3326_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_3326_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_3326_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_3326_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2922_c7_2c7b
opc_result_MUX_uxn_opcodes_h_l2922_c7_2c7b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2922_c7_2c7b_cond,
opc_result_MUX_uxn_opcodes_h_l2922_c7_2c7b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2922_c7_2c7b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2922_c7_2c7b_return_output);

-- jsr_uxn_opcodes_h_l2922_c40_af3d
jsr_uxn_opcodes_h_l2922_c40_af3d : entity work.jsr_0CLK_fedec265 port map (
clk,
jsr_uxn_opcodes_h_l2922_c40_af3d_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l2922_c40_af3d_phase,
jsr_uxn_opcodes_h_l2922_c40_af3d_ins,
jsr_uxn_opcodes_h_l2922_c40_af3d_pc,
jsr_uxn_opcodes_h_l2922_c40_af3d_previous_stack_read,
jsr_uxn_opcodes_h_l2922_c40_af3d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2923_c11_ea77
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_ea77 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_ea77_left,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_ea77_right,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_ea77_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_834c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_834c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_834c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_834c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_834c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_834c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_3b0c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_3b0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_3b0c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_3b0c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_3b0c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_3b0c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2923_c7_3326
opc_result_MUX_uxn_opcodes_h_l2923_c7_3326 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2923_c7_3326_cond,
opc_result_MUX_uxn_opcodes_h_l2923_c7_3326_iftrue,
opc_result_MUX_uxn_opcodes_h_l2923_c7_3326_iffalse,
opc_result_MUX_uxn_opcodes_h_l2923_c7_3326_return_output);

-- jsr2_uxn_opcodes_h_l2923_c40_260a
jsr2_uxn_opcodes_h_l2923_c40_260a : entity work.jsr2_0CLK_609876da port map (
clk,
jsr2_uxn_opcodes_h_l2923_c40_260a_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l2923_c40_260a_phase,
jsr2_uxn_opcodes_h_l2923_c40_260a_ins,
jsr2_uxn_opcodes_h_l2923_c40_260a_pc,
jsr2_uxn_opcodes_h_l2923_c40_260a_previous_stack_read,
jsr2_uxn_opcodes_h_l2923_c40_260a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1633
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1633 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1633_left,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1633_right,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1633_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cfc1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cfc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cfc1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cfc1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cfc1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cfc1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5f5a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5f5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5f5a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5f5a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5f5a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5f5a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2924_c7_3b0c
opc_result_MUX_uxn_opcodes_h_l2924_c7_3b0c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2924_c7_3b0c_cond,
opc_result_MUX_uxn_opcodes_h_l2924_c7_3b0c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2924_c7_3b0c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2924_c7_3b0c_return_output);

-- sth_uxn_opcodes_h_l2924_c40_11c5
sth_uxn_opcodes_h_l2924_c40_11c5 : entity work.sth_0CLK_a9f1e08f port map (
clk,
sth_uxn_opcodes_h_l2924_c40_11c5_CLOCK_ENABLE,
sth_uxn_opcodes_h_l2924_c40_11c5_phase,
sth_uxn_opcodes_h_l2924_c40_11c5_ins,
sth_uxn_opcodes_h_l2924_c40_11c5_previous_stack_read,
sth_uxn_opcodes_h_l2924_c40_11c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b19d
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b19d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b19d_left,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b19d_right,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b19d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_0c9d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_0c9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_0c9d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_0c9d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_0c9d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_0c9d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_37ec
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_37ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_37ec_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_37ec_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_37ec_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_37ec_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2925_c7_5f5a
opc_result_MUX_uxn_opcodes_h_l2925_c7_5f5a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2925_c7_5f5a_cond,
opc_result_MUX_uxn_opcodes_h_l2925_c7_5f5a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2925_c7_5f5a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2925_c7_5f5a_return_output);

-- sth2_uxn_opcodes_h_l2925_c40_a95d
sth2_uxn_opcodes_h_l2925_c40_a95d : entity work.sth2_0CLK_55b6500a port map (
clk,
sth2_uxn_opcodes_h_l2925_c40_a95d_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l2925_c40_a95d_phase,
sth2_uxn_opcodes_h_l2925_c40_a95d_ins,
sth2_uxn_opcodes_h_l2925_c40_a95d_previous_stack_read,
sth2_uxn_opcodes_h_l2925_c40_a95d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c694
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c694 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c694_left,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c694_right,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c694_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0fd3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0fd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0fd3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0fd3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0fd3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0fd3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_b5ec
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_b5ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_b5ec_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_b5ec_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_b5ec_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_b5ec_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2926_c7_37ec
opc_result_MUX_uxn_opcodes_h_l2926_c7_37ec : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2926_c7_37ec_cond,
opc_result_MUX_uxn_opcodes_h_l2926_c7_37ec_iftrue,
opc_result_MUX_uxn_opcodes_h_l2926_c7_37ec_iffalse,
opc_result_MUX_uxn_opcodes_h_l2926_c7_37ec_return_output);

-- ldz_uxn_opcodes_h_l2926_c40_329e
ldz_uxn_opcodes_h_l2926_c40_329e : entity work.ldz_0CLK_b128164d port map (
clk,
ldz_uxn_opcodes_h_l2926_c40_329e_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l2926_c40_329e_phase,
ldz_uxn_opcodes_h_l2926_c40_329e_ins,
ldz_uxn_opcodes_h_l2926_c40_329e_previous_stack_read,
ldz_uxn_opcodes_h_l2926_c40_329e_previous_ram_read,
ldz_uxn_opcodes_h_l2926_c40_329e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2927_c11_0ca2
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_0ca2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_0ca2_left,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_0ca2_right,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_0ca2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d41e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d41e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d41e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d41e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d41e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d41e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_1614
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_1614 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_1614_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_1614_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_1614_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_1614_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2927_c7_b5ec
opc_result_MUX_uxn_opcodes_h_l2927_c7_b5ec : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2927_c7_b5ec_cond,
opc_result_MUX_uxn_opcodes_h_l2927_c7_b5ec_iftrue,
opc_result_MUX_uxn_opcodes_h_l2927_c7_b5ec_iffalse,
opc_result_MUX_uxn_opcodes_h_l2927_c7_b5ec_return_output);

-- ldz2_uxn_opcodes_h_l2927_c40_db58
ldz2_uxn_opcodes_h_l2927_c40_db58 : entity work.ldz2_0CLK_2ab048cc port map (
clk,
ldz2_uxn_opcodes_h_l2927_c40_db58_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l2927_c40_db58_phase,
ldz2_uxn_opcodes_h_l2927_c40_db58_ins,
ldz2_uxn_opcodes_h_l2927_c40_db58_previous_stack_read,
ldz2_uxn_opcodes_h_l2927_c40_db58_previous_ram_read,
ldz2_uxn_opcodes_h_l2927_c40_db58_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2928_c11_41a9
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_41a9 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_41a9_left,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_41a9_right,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_41a9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1f32
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1f32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1f32_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1f32_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1f32_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1f32_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3315
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3315 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3315_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3315_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3315_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3315_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2928_c7_1614
opc_result_MUX_uxn_opcodes_h_l2928_c7_1614 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2928_c7_1614_cond,
opc_result_MUX_uxn_opcodes_h_l2928_c7_1614_iftrue,
opc_result_MUX_uxn_opcodes_h_l2928_c7_1614_iffalse,
opc_result_MUX_uxn_opcodes_h_l2928_c7_1614_return_output);

-- stz_uxn_opcodes_h_l2928_c40_0ad0
stz_uxn_opcodes_h_l2928_c40_0ad0 : entity work.stz_0CLK_bacf6a1d port map (
clk,
stz_uxn_opcodes_h_l2928_c40_0ad0_CLOCK_ENABLE,
stz_uxn_opcodes_h_l2928_c40_0ad0_phase,
stz_uxn_opcodes_h_l2928_c40_0ad0_ins,
stz_uxn_opcodes_h_l2928_c40_0ad0_previous_stack_read,
stz_uxn_opcodes_h_l2928_c40_0ad0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2929_c11_486d
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_486d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_486d_left,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_486d_right,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_486d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_fe97
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_fe97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_fe97_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_fe97_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_fe97_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_fe97_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b62e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b62e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b62e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b62e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b62e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b62e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2929_c7_3315
opc_result_MUX_uxn_opcodes_h_l2929_c7_3315 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2929_c7_3315_cond,
opc_result_MUX_uxn_opcodes_h_l2929_c7_3315_iftrue,
opc_result_MUX_uxn_opcodes_h_l2929_c7_3315_iffalse,
opc_result_MUX_uxn_opcodes_h_l2929_c7_3315_return_output);

-- stz2_uxn_opcodes_h_l2929_c40_b1ae
stz2_uxn_opcodes_h_l2929_c40_b1ae : entity work.stz2_0CLK_75b4bee3 port map (
clk,
stz2_uxn_opcodes_h_l2929_c40_b1ae_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l2929_c40_b1ae_phase,
stz2_uxn_opcodes_h_l2929_c40_b1ae_ins,
stz2_uxn_opcodes_h_l2929_c40_b1ae_previous_stack_read,
stz2_uxn_opcodes_h_l2929_c40_b1ae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5195
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5195 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5195_left,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5195_right,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5195_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_1c17
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_1c17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_1c17_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_1c17_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_1c17_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_1c17_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d4d2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d4d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d4d2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d4d2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d4d2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d4d2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2930_c7_b62e
opc_result_MUX_uxn_opcodes_h_l2930_c7_b62e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2930_c7_b62e_cond,
opc_result_MUX_uxn_opcodes_h_l2930_c7_b62e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2930_c7_b62e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2930_c7_b62e_return_output);

-- ldr_uxn_opcodes_h_l2930_c40_6955
ldr_uxn_opcodes_h_l2930_c40_6955 : entity work.ldr_0CLK_f74745d5 port map (
clk,
ldr_uxn_opcodes_h_l2930_c40_6955_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l2930_c40_6955_phase,
ldr_uxn_opcodes_h_l2930_c40_6955_ins,
ldr_uxn_opcodes_h_l2930_c40_6955_pc,
ldr_uxn_opcodes_h_l2930_c40_6955_previous_stack_read,
ldr_uxn_opcodes_h_l2930_c40_6955_previous_ram_read,
ldr_uxn_opcodes_h_l2930_c40_6955_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2931_c11_fb14
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_fb14 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_fb14_left,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_fb14_right,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_fb14_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b973
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b973 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b973_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b973_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b973_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b973_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_95e1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_95e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_95e1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_95e1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_95e1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_95e1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2931_c7_d4d2
opc_result_MUX_uxn_opcodes_h_l2931_c7_d4d2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2931_c7_d4d2_cond,
opc_result_MUX_uxn_opcodes_h_l2931_c7_d4d2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2931_c7_d4d2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2931_c7_d4d2_return_output);

-- ldr2_uxn_opcodes_h_l2931_c40_8a7e
ldr2_uxn_opcodes_h_l2931_c40_8a7e : entity work.ldr2_0CLK_b7cf2331 port map (
clk,
ldr2_uxn_opcodes_h_l2931_c40_8a7e_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l2931_c40_8a7e_phase,
ldr2_uxn_opcodes_h_l2931_c40_8a7e_ins,
ldr2_uxn_opcodes_h_l2931_c40_8a7e_pc,
ldr2_uxn_opcodes_h_l2931_c40_8a7e_previous_stack_read,
ldr2_uxn_opcodes_h_l2931_c40_8a7e_previous_ram_read,
ldr2_uxn_opcodes_h_l2931_c40_8a7e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2932_c11_649f
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_649f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_649f_left,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_649f_right,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_649f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_715d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_715d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_715d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_715d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_715d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_715d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_dc0f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_dc0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_dc0f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_dc0f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_dc0f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_dc0f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2932_c7_95e1
opc_result_MUX_uxn_opcodes_h_l2932_c7_95e1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2932_c7_95e1_cond,
opc_result_MUX_uxn_opcodes_h_l2932_c7_95e1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2932_c7_95e1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2932_c7_95e1_return_output);

-- str1_uxn_opcodes_h_l2932_c40_f6ac
str1_uxn_opcodes_h_l2932_c40_f6ac : entity work.str1_0CLK_85d5529e port map (
clk,
str1_uxn_opcodes_h_l2932_c40_f6ac_CLOCK_ENABLE,
str1_uxn_opcodes_h_l2932_c40_f6ac_phase,
str1_uxn_opcodes_h_l2932_c40_f6ac_ins,
str1_uxn_opcodes_h_l2932_c40_f6ac_pc,
str1_uxn_opcodes_h_l2932_c40_f6ac_previous_stack_read,
str1_uxn_opcodes_h_l2932_c40_f6ac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2933_c11_dd61
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_dd61 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_dd61_left,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_dd61_right,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_dd61_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_6d5f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_6d5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_6d5f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_6d5f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_6d5f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_6d5f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c7e8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c7e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c7e8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c7e8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c7e8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c7e8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2933_c7_dc0f
opc_result_MUX_uxn_opcodes_h_l2933_c7_dc0f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2933_c7_dc0f_cond,
opc_result_MUX_uxn_opcodes_h_l2933_c7_dc0f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2933_c7_dc0f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2933_c7_dc0f_return_output);

-- str2_uxn_opcodes_h_l2933_c40_5b53
str2_uxn_opcodes_h_l2933_c40_5b53 : entity work.str2_0CLK_75b4bee3 port map (
clk,
str2_uxn_opcodes_h_l2933_c40_5b53_CLOCK_ENABLE,
str2_uxn_opcodes_h_l2933_c40_5b53_phase,
str2_uxn_opcodes_h_l2933_c40_5b53_ins,
str2_uxn_opcodes_h_l2933_c40_5b53_pc,
str2_uxn_opcodes_h_l2933_c40_5b53_previous_stack_read,
str2_uxn_opcodes_h_l2933_c40_5b53_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c665
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c665 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c665_left,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c665_right,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c665_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6ea2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6ea2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6ea2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6ea2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6ea2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6ea2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_6a6b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_6a6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_6a6b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_6a6b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_6a6b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_6a6b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2934_c7_c7e8
opc_result_MUX_uxn_opcodes_h_l2934_c7_c7e8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2934_c7_c7e8_cond,
opc_result_MUX_uxn_opcodes_h_l2934_c7_c7e8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2934_c7_c7e8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2934_c7_c7e8_return_output);

-- lda_uxn_opcodes_h_l2934_c40_1c91
lda_uxn_opcodes_h_l2934_c40_1c91 : entity work.lda_0CLK_c634cda8 port map (
clk,
lda_uxn_opcodes_h_l2934_c40_1c91_CLOCK_ENABLE,
lda_uxn_opcodes_h_l2934_c40_1c91_phase,
lda_uxn_opcodes_h_l2934_c40_1c91_ins,
lda_uxn_opcodes_h_l2934_c40_1c91_previous_stack_read,
lda_uxn_opcodes_h_l2934_c40_1c91_previous_ram_read,
lda_uxn_opcodes_h_l2934_c40_1c91_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2935_c11_beff
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_beff : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_beff_left,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_beff_right,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_beff_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_43f3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_43f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_43f3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_43f3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_43f3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_43f3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7dd8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7dd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7dd8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7dd8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7dd8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7dd8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2935_c7_6a6b
opc_result_MUX_uxn_opcodes_h_l2935_c7_6a6b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2935_c7_6a6b_cond,
opc_result_MUX_uxn_opcodes_h_l2935_c7_6a6b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2935_c7_6a6b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2935_c7_6a6b_return_output);

-- lda2_uxn_opcodes_h_l2935_c40_809d
lda2_uxn_opcodes_h_l2935_c40_809d : entity work.lda2_0CLK_19339e1d port map (
clk,
lda2_uxn_opcodes_h_l2935_c40_809d_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l2935_c40_809d_phase,
lda2_uxn_opcodes_h_l2935_c40_809d_ins,
lda2_uxn_opcodes_h_l2935_c40_809d_previous_stack_read,
lda2_uxn_opcodes_h_l2935_c40_809d_previous_ram_read,
lda2_uxn_opcodes_h_l2935_c40_809d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2936_c11_77a9
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_77a9 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_77a9_left,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_77a9_right,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_77a9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_408e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_408e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_408e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_408e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_408e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_408e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5294
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5294 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5294_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5294_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5294_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5294_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2936_c7_7dd8
opc_result_MUX_uxn_opcodes_h_l2936_c7_7dd8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2936_c7_7dd8_cond,
opc_result_MUX_uxn_opcodes_h_l2936_c7_7dd8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2936_c7_7dd8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2936_c7_7dd8_return_output);

-- sta_uxn_opcodes_h_l2936_c40_b61e
sta_uxn_opcodes_h_l2936_c40_b61e : entity work.sta_0CLK_bce25fe8 port map (
clk,
sta_uxn_opcodes_h_l2936_c40_b61e_CLOCK_ENABLE,
sta_uxn_opcodes_h_l2936_c40_b61e_phase,
sta_uxn_opcodes_h_l2936_c40_b61e_ins,
sta_uxn_opcodes_h_l2936_c40_b61e_previous_stack_read,
sta_uxn_opcodes_h_l2936_c40_b61e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2937_c11_ffd8
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_ffd8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_ffd8_left,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_ffd8_right,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_ffd8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b02b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b02b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b02b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b02b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b02b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b02b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_221d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_221d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_221d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_221d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_221d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_221d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2937_c7_5294
opc_result_MUX_uxn_opcodes_h_l2937_c7_5294 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2937_c7_5294_cond,
opc_result_MUX_uxn_opcodes_h_l2937_c7_5294_iftrue,
opc_result_MUX_uxn_opcodes_h_l2937_c7_5294_iffalse,
opc_result_MUX_uxn_opcodes_h_l2937_c7_5294_return_output);

-- sta2_uxn_opcodes_h_l2937_c40_0c6c
sta2_uxn_opcodes_h_l2937_c40_0c6c : entity work.sta2_0CLK_4674db74 port map (
clk,
sta2_uxn_opcodes_h_l2937_c40_0c6c_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l2937_c40_0c6c_phase,
sta2_uxn_opcodes_h_l2937_c40_0c6c_ins,
sta2_uxn_opcodes_h_l2937_c40_0c6c_previous_stack_read,
sta2_uxn_opcodes_h_l2937_c40_0c6c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ee93
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ee93 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ee93_left,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ee93_right,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ee93_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_bfd0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_bfd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_bfd0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_bfd0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_bfd0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_bfd0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_0eb4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_0eb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_0eb4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_0eb4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_0eb4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_0eb4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2938_c7_221d
opc_result_MUX_uxn_opcodes_h_l2938_c7_221d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2938_c7_221d_cond,
opc_result_MUX_uxn_opcodes_h_l2938_c7_221d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2938_c7_221d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2938_c7_221d_return_output);

-- dei_uxn_opcodes_h_l2938_c40_d3c7
dei_uxn_opcodes_h_l2938_c40_d3c7 : entity work.dei_0CLK_9bcaee2f port map (
clk,
dei_uxn_opcodes_h_l2938_c40_d3c7_CLOCK_ENABLE,
dei_uxn_opcodes_h_l2938_c40_d3c7_phase,
dei_uxn_opcodes_h_l2938_c40_d3c7_ins,
dei_uxn_opcodes_h_l2938_c40_d3c7_previous_stack_read,
dei_uxn_opcodes_h_l2938_c40_d3c7_previous_device_ram_read,
dei_uxn_opcodes_h_l2938_c40_d3c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2939_c11_6916
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_6916 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_6916_left,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_6916_right,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_6916_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_929e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_929e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_929e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_929e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_929e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_929e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_5596
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_5596 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_5596_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_5596_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_5596_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_5596_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2939_c7_0eb4
opc_result_MUX_uxn_opcodes_h_l2939_c7_0eb4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2939_c7_0eb4_cond,
opc_result_MUX_uxn_opcodes_h_l2939_c7_0eb4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2939_c7_0eb4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2939_c7_0eb4_return_output);

-- dei2_uxn_opcodes_h_l2939_c40_b165
dei2_uxn_opcodes_h_l2939_c40_b165 : entity work.dei2_0CLK_f0f27b91 port map (
clk,
dei2_uxn_opcodes_h_l2939_c40_b165_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l2939_c40_b165_phase,
dei2_uxn_opcodes_h_l2939_c40_b165_ins,
dei2_uxn_opcodes_h_l2939_c40_b165_previous_stack_read,
dei2_uxn_opcodes_h_l2939_c40_b165_previous_device_ram_read,
dei2_uxn_opcodes_h_l2939_c40_b165_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2940_c11_2724
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_2724 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_2724_left,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_2724_right,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_2724_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_b781
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_b781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_b781_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_b781_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_b781_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_b781_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a4f3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a4f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a4f3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a4f3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a4f3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a4f3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2940_c7_5596
opc_result_MUX_uxn_opcodes_h_l2940_c7_5596 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2940_c7_5596_cond,
opc_result_MUX_uxn_opcodes_h_l2940_c7_5596_iftrue,
opc_result_MUX_uxn_opcodes_h_l2940_c7_5596_iffalse,
opc_result_MUX_uxn_opcodes_h_l2940_c7_5596_return_output);

-- deo_uxn_opcodes_h_l2940_c40_ae64
deo_uxn_opcodes_h_l2940_c40_ae64 : entity work.deo_0CLK_ebde644c port map (
clk,
deo_uxn_opcodes_h_l2940_c40_ae64_CLOCK_ENABLE,
deo_uxn_opcodes_h_l2940_c40_ae64_phase,
deo_uxn_opcodes_h_l2940_c40_ae64_ins,
deo_uxn_opcodes_h_l2940_c40_ae64_previous_stack_read,
deo_uxn_opcodes_h_l2940_c40_ae64_previous_device_ram_read,
deo_uxn_opcodes_h_l2940_c40_ae64_previous_ram_read,
deo_uxn_opcodes_h_l2940_c40_ae64_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a84c
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a84c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a84c_left,
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a84c_right,
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a84c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f60d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f60d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f60d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f60d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f60d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f60d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_a81a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_a81a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_a81a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_a81a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_a81a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_a81a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2941_c7_a4f3
opc_result_MUX_uxn_opcodes_h_l2941_c7_a4f3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2941_c7_a4f3_cond,
opc_result_MUX_uxn_opcodes_h_l2941_c7_a4f3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2941_c7_a4f3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2941_c7_a4f3_return_output);

-- deo2_uxn_opcodes_h_l2941_c40_e00f
deo2_uxn_opcodes_h_l2941_c40_e00f : entity work.deo2_0CLK_5952a5d7 port map (
clk,
deo2_uxn_opcodes_h_l2941_c40_e00f_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l2941_c40_e00f_phase,
deo2_uxn_opcodes_h_l2941_c40_e00f_ins,
deo2_uxn_opcodes_h_l2941_c40_e00f_previous_stack_read,
deo2_uxn_opcodes_h_l2941_c40_e00f_previous_device_ram_read,
deo2_uxn_opcodes_h_l2941_c40_e00f_previous_ram_read,
deo2_uxn_opcodes_h_l2941_c40_e00f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b581
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b581 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b581_left,
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b581_right,
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b581_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_ddc0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_ddc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_ddc0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_ddc0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_ddc0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_ddc0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_7f44
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_7f44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_7f44_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_7f44_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_7f44_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_7f44_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2942_c7_a81a
opc_result_MUX_uxn_opcodes_h_l2942_c7_a81a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2942_c7_a81a_cond,
opc_result_MUX_uxn_opcodes_h_l2942_c7_a81a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2942_c7_a81a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2942_c7_a81a_return_output);

-- add_uxn_opcodes_h_l2942_c40_7ef6
add_uxn_opcodes_h_l2942_c40_7ef6 : entity work.add_0CLK_64d180f1 port map (
clk,
add_uxn_opcodes_h_l2942_c40_7ef6_CLOCK_ENABLE,
add_uxn_opcodes_h_l2942_c40_7ef6_phase,
add_uxn_opcodes_h_l2942_c40_7ef6_ins,
add_uxn_opcodes_h_l2942_c40_7ef6_previous_stack_read,
add_uxn_opcodes_h_l2942_c40_7ef6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2943_c11_676a
BIN_OP_EQ_uxn_opcodes_h_l2943_c11_676a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2943_c11_676a_left,
BIN_OP_EQ_uxn_opcodes_h_l2943_c11_676a_right,
BIN_OP_EQ_uxn_opcodes_h_l2943_c11_676a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_8e80
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_8e80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_8e80_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_8e80_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_8e80_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_8e80_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_8c17
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_8c17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_8c17_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_8c17_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_8c17_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_8c17_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2943_c7_7f44
opc_result_MUX_uxn_opcodes_h_l2943_c7_7f44 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2943_c7_7f44_cond,
opc_result_MUX_uxn_opcodes_h_l2943_c7_7f44_iftrue,
opc_result_MUX_uxn_opcodes_h_l2943_c7_7f44_iffalse,
opc_result_MUX_uxn_opcodes_h_l2943_c7_7f44_return_output);

-- add2_uxn_opcodes_h_l2943_c40_e135
add2_uxn_opcodes_h_l2943_c40_e135 : entity work.add2_0CLK_50b92fe2 port map (
clk,
add2_uxn_opcodes_h_l2943_c40_e135_CLOCK_ENABLE,
add2_uxn_opcodes_h_l2943_c40_e135_phase,
add2_uxn_opcodes_h_l2943_c40_e135_ins,
add2_uxn_opcodes_h_l2943_c40_e135_previous_stack_read,
add2_uxn_opcodes_h_l2943_c40_e135_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2944_c11_491a
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_491a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_491a_left,
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_491a_right,
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_491a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_53ed
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_53ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_53ed_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_53ed_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_53ed_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_53ed_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_6090
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_6090 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_6090_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_6090_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_6090_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_6090_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2944_c7_8c17
opc_result_MUX_uxn_opcodes_h_l2944_c7_8c17 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2944_c7_8c17_cond,
opc_result_MUX_uxn_opcodes_h_l2944_c7_8c17_iftrue,
opc_result_MUX_uxn_opcodes_h_l2944_c7_8c17_iffalse,
opc_result_MUX_uxn_opcodes_h_l2944_c7_8c17_return_output);

-- sub_uxn_opcodes_h_l2944_c40_ad8a
sub_uxn_opcodes_h_l2944_c40_ad8a : entity work.sub_0CLK_64d180f1 port map (
clk,
sub_uxn_opcodes_h_l2944_c40_ad8a_CLOCK_ENABLE,
sub_uxn_opcodes_h_l2944_c40_ad8a_phase,
sub_uxn_opcodes_h_l2944_c40_ad8a_ins,
sub_uxn_opcodes_h_l2944_c40_ad8a_previous_stack_read,
sub_uxn_opcodes_h_l2944_c40_ad8a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2945_c11_85a6
BIN_OP_EQ_uxn_opcodes_h_l2945_c11_85a6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2945_c11_85a6_left,
BIN_OP_EQ_uxn_opcodes_h_l2945_c11_85a6_right,
BIN_OP_EQ_uxn_opcodes_h_l2945_c11_85a6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_c6e6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_c6e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_c6e6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_c6e6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_c6e6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_c6e6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_c1c0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_c1c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_c1c0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_c1c0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_c1c0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_c1c0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2945_c7_6090
opc_result_MUX_uxn_opcodes_h_l2945_c7_6090 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2945_c7_6090_cond,
opc_result_MUX_uxn_opcodes_h_l2945_c7_6090_iftrue,
opc_result_MUX_uxn_opcodes_h_l2945_c7_6090_iffalse,
opc_result_MUX_uxn_opcodes_h_l2945_c7_6090_return_output);

-- sub2_uxn_opcodes_h_l2945_c40_e1f8
sub2_uxn_opcodes_h_l2945_c40_e1f8 : entity work.sub2_0CLK_50b92fe2 port map (
clk,
sub2_uxn_opcodes_h_l2945_c40_e1f8_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l2945_c40_e1f8_phase,
sub2_uxn_opcodes_h_l2945_c40_e1f8_ins,
sub2_uxn_opcodes_h_l2945_c40_e1f8_previous_stack_read,
sub2_uxn_opcodes_h_l2945_c40_e1f8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2946_c11_de88
BIN_OP_EQ_uxn_opcodes_h_l2946_c11_de88 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2946_c11_de88_left,
BIN_OP_EQ_uxn_opcodes_h_l2946_c11_de88_right,
BIN_OP_EQ_uxn_opcodes_h_l2946_c11_de88_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_fc24
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_fc24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_fc24_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_fc24_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_fc24_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_fc24_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_66b1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_66b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_66b1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_66b1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_66b1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_66b1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2946_c7_c1c0
opc_result_MUX_uxn_opcodes_h_l2946_c7_c1c0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2946_c7_c1c0_cond,
opc_result_MUX_uxn_opcodes_h_l2946_c7_c1c0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2946_c7_c1c0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2946_c7_c1c0_return_output);

-- mul_uxn_opcodes_h_l2946_c40_d4cb
mul_uxn_opcodes_h_l2946_c40_d4cb : entity work.mul_0CLK_64d180f1 port map (
clk,
mul_uxn_opcodes_h_l2946_c40_d4cb_CLOCK_ENABLE,
mul_uxn_opcodes_h_l2946_c40_d4cb_phase,
mul_uxn_opcodes_h_l2946_c40_d4cb_ins,
mul_uxn_opcodes_h_l2946_c40_d4cb_previous_stack_read,
mul_uxn_opcodes_h_l2946_c40_d4cb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2947_c11_7717
BIN_OP_EQ_uxn_opcodes_h_l2947_c11_7717 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2947_c11_7717_left,
BIN_OP_EQ_uxn_opcodes_h_l2947_c11_7717_right,
BIN_OP_EQ_uxn_opcodes_h_l2947_c11_7717_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d3a2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d3a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d3a2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d3a2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d3a2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d3a2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_8c22
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_8c22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_8c22_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_8c22_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_8c22_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_8c22_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2947_c7_66b1
opc_result_MUX_uxn_opcodes_h_l2947_c7_66b1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2947_c7_66b1_cond,
opc_result_MUX_uxn_opcodes_h_l2947_c7_66b1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2947_c7_66b1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2947_c7_66b1_return_output);

-- mul2_uxn_opcodes_h_l2947_c40_0493
mul2_uxn_opcodes_h_l2947_c40_0493 : entity work.mul2_0CLK_50b92fe2 port map (
clk,
mul2_uxn_opcodes_h_l2947_c40_0493_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l2947_c40_0493_phase,
mul2_uxn_opcodes_h_l2947_c40_0493_ins,
mul2_uxn_opcodes_h_l2947_c40_0493_previous_stack_read,
mul2_uxn_opcodes_h_l2947_c40_0493_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2948_c11_aef2
BIN_OP_EQ_uxn_opcodes_h_l2948_c11_aef2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2948_c11_aef2_left,
BIN_OP_EQ_uxn_opcodes_h_l2948_c11_aef2_right,
BIN_OP_EQ_uxn_opcodes_h_l2948_c11_aef2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_3f40
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_3f40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_3f40_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_3f40_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_3f40_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_3f40_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_2daf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_2daf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_2daf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_2daf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_2daf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_2daf_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2948_c7_8c22
opc_result_MUX_uxn_opcodes_h_l2948_c7_8c22 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2948_c7_8c22_cond,
opc_result_MUX_uxn_opcodes_h_l2948_c7_8c22_iftrue,
opc_result_MUX_uxn_opcodes_h_l2948_c7_8c22_iffalse,
opc_result_MUX_uxn_opcodes_h_l2948_c7_8c22_return_output);

-- div_uxn_opcodes_h_l2948_c40_56b6
div_uxn_opcodes_h_l2948_c40_56b6 : entity work.div_0CLK_09f6f009 port map (
clk,
div_uxn_opcodes_h_l2948_c40_56b6_CLOCK_ENABLE,
div_uxn_opcodes_h_l2948_c40_56b6_phase,
div_uxn_opcodes_h_l2948_c40_56b6_ins,
div_uxn_opcodes_h_l2948_c40_56b6_previous_stack_read,
div_uxn_opcodes_h_l2948_c40_56b6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2949_c11_0999
BIN_OP_EQ_uxn_opcodes_h_l2949_c11_0999 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2949_c11_0999_left,
BIN_OP_EQ_uxn_opcodes_h_l2949_c11_0999_right,
BIN_OP_EQ_uxn_opcodes_h_l2949_c11_0999_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_7e59
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_7e59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_7e59_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_7e59_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_7e59_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_7e59_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5e63
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5e63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5e63_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5e63_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5e63_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5e63_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2949_c7_2daf
opc_result_MUX_uxn_opcodes_h_l2949_c7_2daf : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2949_c7_2daf_cond,
opc_result_MUX_uxn_opcodes_h_l2949_c7_2daf_iftrue,
opc_result_MUX_uxn_opcodes_h_l2949_c7_2daf_iffalse,
opc_result_MUX_uxn_opcodes_h_l2949_c7_2daf_return_output);

-- div2_uxn_opcodes_h_l2949_c40_b4b4
div2_uxn_opcodes_h_l2949_c40_b4b4 : entity work.div2_0CLK_7cf9dac2 port map (
clk,
div2_uxn_opcodes_h_l2949_c40_b4b4_CLOCK_ENABLE,
div2_uxn_opcodes_h_l2949_c40_b4b4_phase,
div2_uxn_opcodes_h_l2949_c40_b4b4_ins,
div2_uxn_opcodes_h_l2949_c40_b4b4_previous_stack_read,
div2_uxn_opcodes_h_l2949_c40_b4b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4489
BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4489 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4489_left,
BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4489_right,
BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4489_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_3491
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_3491 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_3491_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_3491_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_3491_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_3491_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_726b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_726b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_726b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_726b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_726b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_726b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2950_c7_5e63
opc_result_MUX_uxn_opcodes_h_l2950_c7_5e63 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2950_c7_5e63_cond,
opc_result_MUX_uxn_opcodes_h_l2950_c7_5e63_iftrue,
opc_result_MUX_uxn_opcodes_h_l2950_c7_5e63_iffalse,
opc_result_MUX_uxn_opcodes_h_l2950_c7_5e63_return_output);

-- and_uxn_opcodes_h_l2950_c40_cbe1
and_uxn_opcodes_h_l2950_c40_cbe1 : entity work.and_0CLK_64d180f1 port map (
clk,
and_uxn_opcodes_h_l2950_c40_cbe1_CLOCK_ENABLE,
and_uxn_opcodes_h_l2950_c40_cbe1_phase,
and_uxn_opcodes_h_l2950_c40_cbe1_ins,
and_uxn_opcodes_h_l2950_c40_cbe1_previous_stack_read,
and_uxn_opcodes_h_l2950_c40_cbe1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2951_c11_c1b2
BIN_OP_EQ_uxn_opcodes_h_l2951_c11_c1b2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2951_c11_c1b2_left,
BIN_OP_EQ_uxn_opcodes_h_l2951_c11_c1b2_right,
BIN_OP_EQ_uxn_opcodes_h_l2951_c11_c1b2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c909
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c909 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c909_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c909_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c909_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c909_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_d743
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_d743 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_d743_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_d743_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_d743_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_d743_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2951_c7_726b
opc_result_MUX_uxn_opcodes_h_l2951_c7_726b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2951_c7_726b_cond,
opc_result_MUX_uxn_opcodes_h_l2951_c7_726b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2951_c7_726b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2951_c7_726b_return_output);

-- and2_uxn_opcodes_h_l2951_c40_2ee8
and2_uxn_opcodes_h_l2951_c40_2ee8 : entity work.and2_0CLK_50b92fe2 port map (
clk,
and2_uxn_opcodes_h_l2951_c40_2ee8_CLOCK_ENABLE,
and2_uxn_opcodes_h_l2951_c40_2ee8_phase,
and2_uxn_opcodes_h_l2951_c40_2ee8_ins,
and2_uxn_opcodes_h_l2951_c40_2ee8_previous_stack_read,
and2_uxn_opcodes_h_l2951_c40_2ee8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2952_c11_7cc8
BIN_OP_EQ_uxn_opcodes_h_l2952_c11_7cc8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2952_c11_7cc8_left,
BIN_OP_EQ_uxn_opcodes_h_l2952_c11_7cc8_right,
BIN_OP_EQ_uxn_opcodes_h_l2952_c11_7cc8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_48db
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_48db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_48db_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_48db_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_48db_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_48db_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_cb7e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_cb7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_cb7e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_cb7e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_cb7e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_cb7e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2952_c7_d743
opc_result_MUX_uxn_opcodes_h_l2952_c7_d743 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2952_c7_d743_cond,
opc_result_MUX_uxn_opcodes_h_l2952_c7_d743_iftrue,
opc_result_MUX_uxn_opcodes_h_l2952_c7_d743_iffalse,
opc_result_MUX_uxn_opcodes_h_l2952_c7_d743_return_output);

-- ora_uxn_opcodes_h_l2952_c40_b245
ora_uxn_opcodes_h_l2952_c40_b245 : entity work.ora_0CLK_64d180f1 port map (
clk,
ora_uxn_opcodes_h_l2952_c40_b245_CLOCK_ENABLE,
ora_uxn_opcodes_h_l2952_c40_b245_phase,
ora_uxn_opcodes_h_l2952_c40_b245_ins,
ora_uxn_opcodes_h_l2952_c40_b245_previous_stack_read,
ora_uxn_opcodes_h_l2952_c40_b245_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2953_c11_2162
BIN_OP_EQ_uxn_opcodes_h_l2953_c11_2162 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2953_c11_2162_left,
BIN_OP_EQ_uxn_opcodes_h_l2953_c11_2162_right,
BIN_OP_EQ_uxn_opcodes_h_l2953_c11_2162_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_6541
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_6541 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_6541_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_6541_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_6541_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_6541_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_9bc0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_9bc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_9bc0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_9bc0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_9bc0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_9bc0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2953_c7_cb7e
opc_result_MUX_uxn_opcodes_h_l2953_c7_cb7e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2953_c7_cb7e_cond,
opc_result_MUX_uxn_opcodes_h_l2953_c7_cb7e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2953_c7_cb7e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2953_c7_cb7e_return_output);

-- ora2_uxn_opcodes_h_l2953_c40_0b7b
ora2_uxn_opcodes_h_l2953_c40_0b7b : entity work.ora2_0CLK_50b92fe2 port map (
clk,
ora2_uxn_opcodes_h_l2953_c40_0b7b_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l2953_c40_0b7b_phase,
ora2_uxn_opcodes_h_l2953_c40_0b7b_ins,
ora2_uxn_opcodes_h_l2953_c40_0b7b_previous_stack_read,
ora2_uxn_opcodes_h_l2953_c40_0b7b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d70b
BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d70b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d70b_left,
BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d70b_right,
BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d70b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_389b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_389b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_389b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_389b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_389b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_389b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_fceb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_fceb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_fceb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_fceb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_fceb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_fceb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2954_c7_9bc0
opc_result_MUX_uxn_opcodes_h_l2954_c7_9bc0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2954_c7_9bc0_cond,
opc_result_MUX_uxn_opcodes_h_l2954_c7_9bc0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2954_c7_9bc0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2954_c7_9bc0_return_output);

-- eor_uxn_opcodes_h_l2954_c40_01bc
eor_uxn_opcodes_h_l2954_c40_01bc : entity work.eor_0CLK_64d180f1 port map (
clk,
eor_uxn_opcodes_h_l2954_c40_01bc_CLOCK_ENABLE,
eor_uxn_opcodes_h_l2954_c40_01bc_phase,
eor_uxn_opcodes_h_l2954_c40_01bc_ins,
eor_uxn_opcodes_h_l2954_c40_01bc_previous_stack_read,
eor_uxn_opcodes_h_l2954_c40_01bc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2955_c11_10b0
BIN_OP_EQ_uxn_opcodes_h_l2955_c11_10b0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2955_c11_10b0_left,
BIN_OP_EQ_uxn_opcodes_h_l2955_c11_10b0_right,
BIN_OP_EQ_uxn_opcodes_h_l2955_c11_10b0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_c3de
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_c3de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_c3de_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_c3de_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_c3de_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_c3de_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_f87f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_f87f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_f87f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_f87f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_f87f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_f87f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2955_c7_fceb
opc_result_MUX_uxn_opcodes_h_l2955_c7_fceb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2955_c7_fceb_cond,
opc_result_MUX_uxn_opcodes_h_l2955_c7_fceb_iftrue,
opc_result_MUX_uxn_opcodes_h_l2955_c7_fceb_iffalse,
opc_result_MUX_uxn_opcodes_h_l2955_c7_fceb_return_output);

-- eor2_uxn_opcodes_h_l2955_c40_e421
eor2_uxn_opcodes_h_l2955_c40_e421 : entity work.eor2_0CLK_50b92fe2 port map (
clk,
eor2_uxn_opcodes_h_l2955_c40_e421_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l2955_c40_e421_phase,
eor2_uxn_opcodes_h_l2955_c40_e421_ins,
eor2_uxn_opcodes_h_l2955_c40_e421_previous_stack_read,
eor2_uxn_opcodes_h_l2955_c40_e421_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2956_c11_017a
BIN_OP_EQ_uxn_opcodes_h_l2956_c11_017a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2956_c11_017a_left,
BIN_OP_EQ_uxn_opcodes_h_l2956_c11_017a_right,
BIN_OP_EQ_uxn_opcodes_h_l2956_c11_017a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_276d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_276d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_276d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_276d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_276d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_276d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_a332
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_a332 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_a332_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_a332_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_a332_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_a332_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2956_c7_f87f
opc_result_MUX_uxn_opcodes_h_l2956_c7_f87f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2956_c7_f87f_cond,
opc_result_MUX_uxn_opcodes_h_l2956_c7_f87f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2956_c7_f87f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2956_c7_f87f_return_output);

-- sft_uxn_opcodes_h_l2956_c40_fa0b
sft_uxn_opcodes_h_l2956_c40_fa0b : entity work.sft_0CLK_46cced44 port map (
clk,
sft_uxn_opcodes_h_l2956_c40_fa0b_CLOCK_ENABLE,
sft_uxn_opcodes_h_l2956_c40_fa0b_phase,
sft_uxn_opcodes_h_l2956_c40_fa0b_ins,
sft_uxn_opcodes_h_l2956_c40_fa0b_previous_stack_read,
sft_uxn_opcodes_h_l2956_c40_fa0b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2957_c11_cc06
BIN_OP_EQ_uxn_opcodes_h_l2957_c11_cc06 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2957_c11_cc06_left,
BIN_OP_EQ_uxn_opcodes_h_l2957_c11_cc06_right,
BIN_OP_EQ_uxn_opcodes_h_l2957_c11_cc06_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_571d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_571d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_571d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_571d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_571d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_571d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2957_c7_a332
opc_result_MUX_uxn_opcodes_h_l2957_c7_a332 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2957_c7_a332_cond,
opc_result_MUX_uxn_opcodes_h_l2957_c7_a332_iftrue,
opc_result_MUX_uxn_opcodes_h_l2957_c7_a332_iffalse,
opc_result_MUX_uxn_opcodes_h_l2957_c7_a332_return_output);

-- sft2_uxn_opcodes_h_l2957_c40_ba44
sft2_uxn_opcodes_h_l2957_c40_ba44 : entity work.sft2_0CLK_e8b37bfc port map (
clk,
sft2_uxn_opcodes_h_l2957_c40_ba44_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l2957_c40_ba44_phase,
sft2_uxn_opcodes_h_l2957_c40_ba44_ins,
sft2_uxn_opcodes_h_l2957_c40_ba44_previous_stack_read,
sft2_uxn_opcodes_h_l2957_c40_ba44_return_output);

-- CONST_SR_6_uxn_opcodes_h_l2959_c16_e620
CONST_SR_6_uxn_opcodes_h_l2959_c16_e620 : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_opcodes_h_l2959_c16_e620_x,
CONST_SR_6_uxn_opcodes_h_l2959_c16_e620_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2960_c2_ba44
BIN_OP_XOR_uxn_opcodes_h_l2960_c2_ba44 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2960_c2_ba44_left,
BIN_OP_XOR_uxn_opcodes_h_l2960_c2_ba44_right,
BIN_OP_XOR_uxn_opcodes_h_l2960_c2_ba44_return_output);

-- sp1_MUX_uxn_opcodes_h_l2962_c2_cd3a
sp1_MUX_uxn_opcodes_h_l2962_c2_cd3a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2962_c2_cd3a_cond,
sp1_MUX_uxn_opcodes_h_l2962_c2_cd3a_iftrue,
sp1_MUX_uxn_opcodes_h_l2962_c2_cd3a_iffalse,
sp1_MUX_uxn_opcodes_h_l2962_c2_cd3a_return_output);

-- sp0_MUX_uxn_opcodes_h_l2962_c2_cd3a
sp0_MUX_uxn_opcodes_h_l2962_c2_cd3a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2962_c2_cd3a_cond,
sp0_MUX_uxn_opcodes_h_l2962_c2_cd3a_iftrue,
sp0_MUX_uxn_opcodes_h_l2962_c2_cd3a_iffalse,
sp0_MUX_uxn_opcodes_h_l2962_c2_cd3a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_5d3a
BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_5d3a : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_5d3a_left,
BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_5d3a_right,
BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_5d3a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_2e14
BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_2e14 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_2e14_left,
BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_2e14_right,
BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_2e14_return_output);

-- MUX_uxn_opcodes_h_l2968_c29_6b08
MUX_uxn_opcodes_h_l2968_c29_6b08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2968_c29_6b08_cond,
MUX_uxn_opcodes_h_l2968_c29_6b08_iftrue,
MUX_uxn_opcodes_h_l2968_c29_6b08_iffalse,
MUX_uxn_opcodes_h_l2968_c29_6b08_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_e637
BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_e637 : entity work.BIN_OP_MINUS_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_e637_left,
BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_e637_right,
BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_e637_return_output);

-- MUX_uxn_opcodes_h_l2969_c20_04ea
MUX_uxn_opcodes_h_l2969_c20_04ea : entity work.MUX_uint1_t_uint9_t_uint9_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2969_c20_04ea_cond,
MUX_uxn_opcodes_h_l2969_c20_04ea_iftrue,
MUX_uxn_opcodes_h_l2969_c20_04ea_iffalse,
MUX_uxn_opcodes_h_l2969_c20_04ea_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_8df3
BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_8df3 : entity work.BIN_OP_PLUS_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_8df3_left,
BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_8df3_right,
BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_8df3_return_output);

-- stack_ram_update_uxn_opcodes_h_l2971_c24_4ca2
stack_ram_update_uxn_opcodes_h_l2971_c24_4ca2 : entity work.stack_ram_update_0CLK_23f04728 port map (
clk,
stack_ram_update_uxn_opcodes_h_l2971_c24_4ca2_CLOCK_ENABLE,
stack_ram_update_uxn_opcodes_h_l2971_c24_4ca2_stack_address,
stack_ram_update_uxn_opcodes_h_l2971_c24_4ca2_value,
stack_ram_update_uxn_opcodes_h_l2971_c24_4ca2_write_enable,
stack_ram_update_uxn_opcodes_h_l2971_c24_4ca2_return_output);



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
 BIN_OP_AND_uxn_opcodes_h_l2880_c14_7970_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2881_c14_fd64_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2881_c14_1fa3_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l2881_c14_b18b_return_output,
 BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8b4f_return_output,
 MUX_uxn_opcodes_h_l2881_c14_334c_return_output,
 MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2888_c6_503c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_046d_return_output,
 is_wait_MUX_uxn_opcodes_h_l2888_c2_aaa5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_return_output,
 brk_uxn_opcodes_h_l2888_c48_402f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2889_c11_4979_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_c9f0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d1e9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2889_c7_046d_return_output,
 jci_uxn_opcodes_h_l2889_c40_2f61_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2890_c11_2ce4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_f493_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_746b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2890_c7_d1e9_return_output,
 jmi_uxn_opcodes_h_l2890_c40_016e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2891_c11_92d4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ac77_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_ec22_return_output,
 opc_result_MUX_uxn_opcodes_h_l2891_c7_746b_return_output,
 jsi_uxn_opcodes_h_l2891_c40_1108_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7f57_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_f415_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_c50b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2892_c7_ec22_return_output,
 lit_uxn_opcodes_h_l2892_c40_0c64_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2893_c11_89b1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0285_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_aaaa_return_output,
 opc_result_MUX_uxn_opcodes_h_l2893_c7_c50b_return_output,
 lit2_uxn_opcodes_h_l2893_c40_5bdf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2894_c11_df19_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7dc5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_29cf_return_output,
 opc_result_MUX_uxn_opcodes_h_l2894_c7_aaaa_return_output,
 lit_uxn_opcodes_h_l2894_c40_adf9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2895_c11_9b7a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e95e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_9713_return_output,
 opc_result_MUX_uxn_opcodes_h_l2895_c7_29cf_return_output,
 lit2_uxn_opcodes_h_l2895_c40_0928_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2896_c11_394c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9842_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_87b5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2896_c7_9713_return_output,
 inc_uxn_opcodes_h_l2896_c40_6ea4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1619_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_16e8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_a23b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2897_c7_87b5_return_output,
 inc2_uxn_opcodes_h_l2897_c40_ad36_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1c18_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3ae6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_3690_return_output,
 opc_result_MUX_uxn_opcodes_h_l2898_c7_a23b_return_output,
 pop_uxn_opcodes_h_l2898_c40_b895_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3b27_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_8843_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6a50_return_output,
 opc_result_MUX_uxn_opcodes_h_l2899_c7_3690_return_output,
 pop2_uxn_opcodes_h_l2899_c40_6f5f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c6f8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a9cc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9cc5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2900_c7_6a50_return_output,
 nip_uxn_opcodes_h_l2900_c40_753e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2901_c11_18d8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f2fa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_32d4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2901_c7_9cc5_return_output,
 nip2_uxn_opcodes_h_l2901_c40_6ffd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2902_c11_25a5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_56f1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_b588_return_output,
 opc_result_MUX_uxn_opcodes_h_l2902_c7_32d4_return_output,
 swp_uxn_opcodes_h_l2902_c40_9de3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0ac4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_23fa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_e57e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2903_c7_b588_return_output,
 swp2_uxn_opcodes_h_l2903_c40_6d9e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2904_c11_56b3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_41aa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_ebbd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2904_c7_e57e_return_output,
 rot_uxn_opcodes_h_l2904_c40_54be_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2905_c11_30d6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_d97c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a749_return_output,
 opc_result_MUX_uxn_opcodes_h_l2905_c7_ebbd_return_output,
 rot2_uxn_opcodes_h_l2905_c40_023c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2906_c11_388b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_ff2a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cb2f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2906_c7_a749_return_output,
 dup_uxn_opcodes_h_l2906_c40_86e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c273_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_ea23_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_0a31_return_output,
 opc_result_MUX_uxn_opcodes_h_l2907_c7_cb2f_return_output,
 dup2_uxn_opcodes_h_l2907_c40_a606_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7db7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ddb6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a596_return_output,
 opc_result_MUX_uxn_opcodes_h_l2908_c7_0a31_return_output,
 ovr_uxn_opcodes_h_l2908_c40_05b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2909_c11_139c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cbb0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e87b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2909_c7_a596_return_output,
 ovr2_uxn_opcodes_h_l2909_c40_f341_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1ea4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_b7a7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_dfda_return_output,
 opc_result_MUX_uxn_opcodes_h_l2910_c7_e87b_return_output,
 equ_uxn_opcodes_h_l2910_c40_e3d3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2911_c11_e480_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1e87_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_68c9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2911_c7_dfda_return_output,
 equ2_uxn_opcodes_h_l2911_c40_302d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5962_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_2c9c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9e8d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2912_c7_68c9_return_output,
 neq_uxn_opcodes_h_l2912_c40_0457_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0b93_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_b75d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_bde8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2913_c7_9e8d_return_output,
 neq2_uxn_opcodes_h_l2913_c40_c7bd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fd57_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49b6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5202_return_output,
 opc_result_MUX_uxn_opcodes_h_l2914_c7_bde8_return_output,
 gth_uxn_opcodes_h_l2914_c40_8de9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f3a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a6f1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2915_c7_5202_return_output,
 gth2_uxn_opcodes_h_l2915_c40_00e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2916_c11_18da_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dd74_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_0a1d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2916_c7_a6f1_return_output,
 lth_uxn_opcodes_h_l2916_c40_7107_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ffb7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_005b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_3ae2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2917_c7_0a1d_return_output,
 lth2_uxn_opcodes_h_l2917_c40_42af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8de8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_1eb0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4fd5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2918_c7_3ae2_return_output,
 jmp_uxn_opcodes_h_l2918_c40_4281_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4001_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_f5d0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2919_c7_4fd5_return_output,
 jmp2_uxn_opcodes_h_l2919_c40_6d2a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2920_c11_b03d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e7bc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c7fd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2920_c7_f5d0_return_output,
 jcn_uxn_opcodes_h_l2920_c40_a6de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2921_c11_17b7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0be6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2c7b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2921_c7_c7fd_return_output,
 jcn2_uxn_opcodes_h_l2921_c40_76ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3d6c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6611_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_3326_return_output,
 opc_result_MUX_uxn_opcodes_h_l2922_c7_2c7b_return_output,
 jsr_uxn_opcodes_h_l2922_c40_af3d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2923_c11_ea77_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_834c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_3b0c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2923_c7_3326_return_output,
 jsr2_uxn_opcodes_h_l2923_c40_260a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1633_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cfc1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5f5a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2924_c7_3b0c_return_output,
 sth_uxn_opcodes_h_l2924_c40_11c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b19d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_0c9d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_37ec_return_output,
 opc_result_MUX_uxn_opcodes_h_l2925_c7_5f5a_return_output,
 sth2_uxn_opcodes_h_l2925_c40_a95d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c694_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0fd3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_b5ec_return_output,
 opc_result_MUX_uxn_opcodes_h_l2926_c7_37ec_return_output,
 ldz_uxn_opcodes_h_l2926_c40_329e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2927_c11_0ca2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d41e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_1614_return_output,
 opc_result_MUX_uxn_opcodes_h_l2927_c7_b5ec_return_output,
 ldz2_uxn_opcodes_h_l2927_c40_db58_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2928_c11_41a9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1f32_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3315_return_output,
 opc_result_MUX_uxn_opcodes_h_l2928_c7_1614_return_output,
 stz_uxn_opcodes_h_l2928_c40_0ad0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2929_c11_486d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_fe97_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b62e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2929_c7_3315_return_output,
 stz2_uxn_opcodes_h_l2929_c40_b1ae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5195_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_1c17_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d4d2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2930_c7_b62e_return_output,
 ldr_uxn_opcodes_h_l2930_c40_6955_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2931_c11_fb14_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b973_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_95e1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2931_c7_d4d2_return_output,
 ldr2_uxn_opcodes_h_l2931_c40_8a7e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2932_c11_649f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_715d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_dc0f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2932_c7_95e1_return_output,
 str1_uxn_opcodes_h_l2932_c40_f6ac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2933_c11_dd61_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_6d5f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c7e8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2933_c7_dc0f_return_output,
 str2_uxn_opcodes_h_l2933_c40_5b53_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c665_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6ea2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_6a6b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2934_c7_c7e8_return_output,
 lda_uxn_opcodes_h_l2934_c40_1c91_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2935_c11_beff_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_43f3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7dd8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2935_c7_6a6b_return_output,
 lda2_uxn_opcodes_h_l2935_c40_809d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2936_c11_77a9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_408e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5294_return_output,
 opc_result_MUX_uxn_opcodes_h_l2936_c7_7dd8_return_output,
 sta_uxn_opcodes_h_l2936_c40_b61e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2937_c11_ffd8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b02b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_221d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2937_c7_5294_return_output,
 sta2_uxn_opcodes_h_l2937_c40_0c6c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ee93_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_bfd0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_0eb4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2938_c7_221d_return_output,
 dei_uxn_opcodes_h_l2938_c40_d3c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2939_c11_6916_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_929e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_5596_return_output,
 opc_result_MUX_uxn_opcodes_h_l2939_c7_0eb4_return_output,
 dei2_uxn_opcodes_h_l2939_c40_b165_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2940_c11_2724_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_b781_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a4f3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2940_c7_5596_return_output,
 deo_uxn_opcodes_h_l2940_c40_ae64_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a84c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f60d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_a81a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2941_c7_a4f3_return_output,
 deo2_uxn_opcodes_h_l2941_c40_e00f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b581_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_ddc0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_7f44_return_output,
 opc_result_MUX_uxn_opcodes_h_l2942_c7_a81a_return_output,
 add_uxn_opcodes_h_l2942_c40_7ef6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2943_c11_676a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_8e80_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_8c17_return_output,
 opc_result_MUX_uxn_opcodes_h_l2943_c7_7f44_return_output,
 add2_uxn_opcodes_h_l2943_c40_e135_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2944_c11_491a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_53ed_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_6090_return_output,
 opc_result_MUX_uxn_opcodes_h_l2944_c7_8c17_return_output,
 sub_uxn_opcodes_h_l2944_c40_ad8a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2945_c11_85a6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_c6e6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_c1c0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2945_c7_6090_return_output,
 sub2_uxn_opcodes_h_l2945_c40_e1f8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2946_c11_de88_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_fc24_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_66b1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2946_c7_c1c0_return_output,
 mul_uxn_opcodes_h_l2946_c40_d4cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2947_c11_7717_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d3a2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_8c22_return_output,
 opc_result_MUX_uxn_opcodes_h_l2947_c7_66b1_return_output,
 mul2_uxn_opcodes_h_l2947_c40_0493_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2948_c11_aef2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_3f40_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_2daf_return_output,
 opc_result_MUX_uxn_opcodes_h_l2948_c7_8c22_return_output,
 div_uxn_opcodes_h_l2948_c40_56b6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2949_c11_0999_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_7e59_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5e63_return_output,
 opc_result_MUX_uxn_opcodes_h_l2949_c7_2daf_return_output,
 div2_uxn_opcodes_h_l2949_c40_b4b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4489_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_3491_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_726b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2950_c7_5e63_return_output,
 and_uxn_opcodes_h_l2950_c40_cbe1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2951_c11_c1b2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c909_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_d743_return_output,
 opc_result_MUX_uxn_opcodes_h_l2951_c7_726b_return_output,
 and2_uxn_opcodes_h_l2951_c40_2ee8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2952_c11_7cc8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_48db_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_cb7e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2952_c7_d743_return_output,
 ora_uxn_opcodes_h_l2952_c40_b245_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2953_c11_2162_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_6541_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_9bc0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2953_c7_cb7e_return_output,
 ora2_uxn_opcodes_h_l2953_c40_0b7b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d70b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_389b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_fceb_return_output,
 opc_result_MUX_uxn_opcodes_h_l2954_c7_9bc0_return_output,
 eor_uxn_opcodes_h_l2954_c40_01bc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2955_c11_10b0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_c3de_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_f87f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2955_c7_fceb_return_output,
 eor2_uxn_opcodes_h_l2955_c40_e421_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2956_c11_017a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_276d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_a332_return_output,
 opc_result_MUX_uxn_opcodes_h_l2956_c7_f87f_return_output,
 sft_uxn_opcodes_h_l2956_c40_fa0b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2957_c11_cc06_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_571d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2957_c7_a332_return_output,
 sft2_uxn_opcodes_h_l2957_c40_ba44_return_output,
 CONST_SR_6_uxn_opcodes_h_l2959_c16_e620_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2960_c2_ba44_return_output,
 sp1_MUX_uxn_opcodes_h_l2962_c2_cd3a_return_output,
 sp0_MUX_uxn_opcodes_h_l2962_c2_cd3a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_5d3a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_2e14_return_output,
 MUX_uxn_opcodes_h_l2968_c29_6b08_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_e637_return_output,
 MUX_uxn_opcodes_h_l2969_c20_04ea_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_8df3_return_output,
 stack_ram_update_uxn_opcodes_h_l2971_c24_4ca2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2880_c14_7970_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2880_c14_7970_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2880_c14_7970_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2881_c14_334c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2881_c14_fd64_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2881_c14_fd64_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2881_c14_fd64_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2881_c14_1fa3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2881_c14_1fa3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2881_c14_1fa3_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2881_c14_b18b_expr : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2881_c14_b18b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8b4f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8b4f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8b4f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2881_c14_334c_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2881_c14_334c_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2881_c14_334c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c6_503c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c6_503c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c6_503c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_046d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_046d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_046d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_046d_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2888_c2_aaa5_iftrue : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2888_c2_aaa5_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2888_c2_aaa5_return_output : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2888_c2_aaa5_cond : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_046d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_cond : unsigned(0 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2888_c48_402f_phase : unsigned(7 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2888_c48_402f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_4979_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_4979_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_4979_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_c9f0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_c9f0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_c9f0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_c9f0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d1e9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d1e9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d1e9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d1e9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_046d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_046d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_d1e9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_046d_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2889_c40_2f61_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2889_c40_2f61_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2889_c40_2f61_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2889_c40_2f61_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2889_c40_2f61_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2889_c40_2f61_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_2ce4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_2ce4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_2ce4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_f493_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_f493_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_f493_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_f493_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_746b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_746b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_746b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_746b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_d1e9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_d1e9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_746b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_d1e9_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2890_c40_016e_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2890_c40_016e_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2890_c40_016e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2890_c40_016e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2890_c40_016e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_92d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_92d4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_92d4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ac77_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ac77_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ac77_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ac77_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_ec22_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_ec22_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_ec22_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_ec22_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_746b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_746b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_ec22_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_746b_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2891_c40_1108_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2891_c40_1108_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2891_c40_1108_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2891_c40_1108_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2891_c40_1108_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7f57_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7f57_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7f57_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_f415_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_f415_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_f415_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_f415_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_c50b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_c50b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_c50b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_c50b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_ec22_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_ec22_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_c50b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_ec22_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2892_c40_0c64_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2892_c40_0c64_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2892_c40_0c64_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2892_c40_0c64_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2892_c40_0c64_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_89b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_89b1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_89b1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0285_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0285_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0285_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0285_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_aaaa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_aaaa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_aaaa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_aaaa_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_c50b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_c50b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_aaaa_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_c50b_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2893_c40_5bdf_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2893_c40_5bdf_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2893_c40_5bdf_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2893_c40_5bdf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2893_c40_5bdf_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_df19_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_df19_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_df19_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7dc5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7dc5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7dc5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7dc5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_29cf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_29cf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_29cf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_29cf_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_aaaa_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_aaaa_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_29cf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_aaaa_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2894_c40_adf9_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2894_c40_adf9_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2894_c40_adf9_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2894_c40_adf9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2894_c40_adf9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_9b7a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_9b7a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_9b7a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e95e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e95e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e95e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e95e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_9713_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_9713_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_9713_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_9713_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_29cf_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_29cf_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_9713_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_29cf_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2895_c40_0928_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2895_c40_0928_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2895_c40_0928_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2895_c40_0928_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2895_c40_0928_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_394c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_394c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_394c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9842_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9842_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9842_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9842_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_87b5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_87b5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_87b5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_87b5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_9713_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_9713_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_87b5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_9713_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2896_c40_6ea4_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2896_c40_6ea4_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2896_c40_6ea4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2896_c40_6ea4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2896_c40_6ea4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1619_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1619_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1619_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_16e8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_16e8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_16e8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_16e8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_a23b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_a23b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_a23b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_a23b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_87b5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_87b5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_a23b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_87b5_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2897_c40_ad36_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2897_c40_ad36_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2897_c40_ad36_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2897_c40_ad36_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2897_c40_ad36_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1c18_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1c18_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1c18_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3ae6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3ae6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3ae6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3ae6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_3690_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_3690_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_3690_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_3690_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_a23b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_a23b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_3690_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_a23b_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2898_c40_b895_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2898_c40_b895_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2898_c40_b895_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2898_c40_b895_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3b27_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3b27_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3b27_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_8843_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_8843_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_8843_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_8843_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6a50_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6a50_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6a50_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6a50_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_3690_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_3690_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6a50_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_3690_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2899_c40_6f5f_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2899_c40_6f5f_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2899_c40_6f5f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2899_c40_6f5f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c6f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c6f8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c6f8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a9cc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a9cc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a9cc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a9cc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9cc5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9cc5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9cc5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9cc5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6a50_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6a50_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_9cc5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6a50_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2900_c40_753e_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2900_c40_753e_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2900_c40_753e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2900_c40_753e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2900_c40_753e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_18d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_18d8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_18d8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f2fa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f2fa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f2fa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f2fa_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_32d4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_32d4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_32d4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_32d4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_9cc5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_9cc5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_32d4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_9cc5_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2901_c40_6ffd_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2901_c40_6ffd_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2901_c40_6ffd_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2901_c40_6ffd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2901_c40_6ffd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_25a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_25a5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_25a5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_56f1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_56f1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_56f1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_56f1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_b588_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_b588_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_b588_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_b588_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_32d4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_32d4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_b588_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_32d4_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2902_c40_9de3_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2902_c40_9de3_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2902_c40_9de3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2902_c40_9de3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2902_c40_9de3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0ac4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0ac4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0ac4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_23fa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_23fa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_23fa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_23fa_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_e57e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_e57e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_e57e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_e57e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_b588_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_b588_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_e57e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_b588_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2903_c40_6d9e_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2903_c40_6d9e_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2903_c40_6d9e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2903_c40_6d9e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2903_c40_6d9e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_56b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_56b3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_56b3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_41aa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_41aa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_41aa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_41aa_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_ebbd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_ebbd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_ebbd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_ebbd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_e57e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_e57e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_ebbd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_e57e_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2904_c40_54be_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2904_c40_54be_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2904_c40_54be_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2904_c40_54be_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2904_c40_54be_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_30d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_30d6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_30d6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_d97c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_d97c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_d97c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_d97c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a749_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a749_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a749_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a749_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_ebbd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_ebbd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a749_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_ebbd_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2905_c40_023c_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2905_c40_023c_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2905_c40_023c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2905_c40_023c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2905_c40_023c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_388b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_388b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_388b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_ff2a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_ff2a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_ff2a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_ff2a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cb2f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cb2f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cb2f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cb2f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a749_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a749_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_cb2f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a749_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2906_c40_86e1_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2906_c40_86e1_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2906_c40_86e1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2906_c40_86e1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2906_c40_86e1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c273_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c273_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c273_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_ea23_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_ea23_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_ea23_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_ea23_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_0a31_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_0a31_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_0a31_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_0a31_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_cb2f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_cb2f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_0a31_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_cb2f_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2907_c40_a606_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2907_c40_a606_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2907_c40_a606_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2907_c40_a606_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2907_c40_a606_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7db7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7db7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7db7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ddb6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ddb6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ddb6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ddb6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a596_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a596_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a596_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a596_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_0a31_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_0a31_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_a596_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_0a31_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2908_c40_05b8_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2908_c40_05b8_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2908_c40_05b8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2908_c40_05b8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2908_c40_05b8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_139c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_139c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_139c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cbb0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cbb0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cbb0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cbb0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e87b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e87b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e87b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e87b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_a596_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_a596_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_e87b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_a596_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2909_c40_f341_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2909_c40_f341_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2909_c40_f341_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2909_c40_f341_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2909_c40_f341_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1ea4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1ea4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1ea4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_b7a7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_b7a7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_b7a7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_b7a7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_dfda_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_dfda_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_dfda_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_dfda_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_e87b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_e87b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_dfda_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_e87b_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2910_c40_e3d3_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2910_c40_e3d3_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2910_c40_e3d3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2910_c40_e3d3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2910_c40_e3d3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_e480_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_e480_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_e480_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1e87_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1e87_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1e87_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1e87_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_68c9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_68c9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_68c9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_68c9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_dfda_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_dfda_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_68c9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_dfda_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2911_c40_302d_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2911_c40_302d_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2911_c40_302d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2911_c40_302d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2911_c40_302d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5962_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5962_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5962_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_2c9c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_2c9c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_2c9c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_2c9c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9e8d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9e8d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9e8d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9e8d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_68c9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_68c9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_9e8d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_68c9_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2912_c40_0457_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2912_c40_0457_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2912_c40_0457_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2912_c40_0457_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2912_c40_0457_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0b93_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0b93_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0b93_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_b75d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_b75d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_b75d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_b75d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_bde8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_bde8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_bde8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_bde8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_9e8d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_9e8d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_bde8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_9e8d_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2913_c40_c7bd_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2913_c40_c7bd_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2913_c40_c7bd_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2913_c40_c7bd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2913_c40_c7bd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fd57_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fd57_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fd57_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49b6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49b6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49b6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49b6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5202_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5202_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5202_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5202_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_bde8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_bde8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_5202_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_bde8_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2914_c40_8de9_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2914_c40_8de9_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2914_c40_8de9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2914_c40_8de9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2914_c40_8de9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f3a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f3a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f3a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f3a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a6f1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a6f1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a6f1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a6f1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_5202_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_5202_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_a6f1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_5202_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2915_c40_00e4_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2915_c40_00e4_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2915_c40_00e4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2915_c40_00e4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2915_c40_00e4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_18da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_18da_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_18da_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dd74_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dd74_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dd74_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dd74_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_0a1d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_0a1d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_0a1d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_0a1d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_a6f1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_a6f1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_0a1d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_a6f1_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2916_c40_7107_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2916_c40_7107_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2916_c40_7107_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2916_c40_7107_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2916_c40_7107_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ffb7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ffb7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ffb7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_005b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_005b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_005b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_005b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_3ae2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_3ae2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_3ae2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_3ae2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_0a1d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_0a1d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_3ae2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_0a1d_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2917_c40_42af_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2917_c40_42af_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2917_c40_42af_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2917_c40_42af_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2917_c40_42af_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8de8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8de8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8de8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_1eb0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_1eb0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_1eb0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_1eb0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4fd5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4fd5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4fd5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4fd5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_3ae2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_3ae2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4fd5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_3ae2_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2918_c40_4281_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2918_c40_4281_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2918_c40_4281_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2918_c40_4281_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2918_c40_4281_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2918_c40_4281_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4001_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4001_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4001_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4001_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_f5d0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_f5d0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_f5d0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_f5d0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4fd5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4fd5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_f5d0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4fd5_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2919_c40_6d2a_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2919_c40_6d2a_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2919_c40_6d2a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2919_c40_6d2a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2919_c40_6d2a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_b03d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_b03d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_b03d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e7bc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e7bc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e7bc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e7bc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c7fd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c7fd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c7fd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c7fd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_f5d0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_f5d0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_c7fd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_f5d0_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2920_c40_a6de_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2920_c40_a6de_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2920_c40_a6de_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2920_c40_a6de_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2920_c40_a6de_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2920_c40_a6de_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_17b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_17b7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_17b7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0be6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0be6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0be6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0be6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2c7b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2c7b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2c7b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2c7b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_c7fd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_c7fd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_2c7b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_c7fd_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2921_c40_76ba_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2921_c40_76ba_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2921_c40_76ba_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2921_c40_76ba_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2921_c40_76ba_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3d6c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3d6c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3d6c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6611_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6611_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6611_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6611_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_3326_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_3326_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_3326_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_3326_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_2c7b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_2c7b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_3326_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_2c7b_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2922_c40_af3d_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2922_c40_af3d_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2922_c40_af3d_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2922_c40_af3d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2922_c40_af3d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2922_c40_af3d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_ea77_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_ea77_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_ea77_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_834c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_834c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_834c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_834c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_3b0c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_3b0c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_3b0c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_3b0c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_3326_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_3326_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_3b0c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_3326_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2923_c40_260a_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2923_c40_260a_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2923_c40_260a_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2923_c40_260a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2923_c40_260a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2923_c40_260a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1633_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1633_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1633_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cfc1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cfc1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cfc1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cfc1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5f5a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5f5a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5f5a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5f5a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_3b0c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_3b0c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_5f5a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_3b0c_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2924_c40_11c5_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2924_c40_11c5_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2924_c40_11c5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2924_c40_11c5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2924_c40_11c5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b19d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b19d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b19d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_0c9d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_0c9d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_0c9d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_0c9d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_37ec_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_37ec_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_37ec_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_37ec_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_5f5a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_5f5a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_37ec_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_5f5a_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2925_c40_a95d_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2925_c40_a95d_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2925_c40_a95d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2925_c40_a95d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2925_c40_a95d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c694_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c694_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c694_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0fd3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0fd3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0fd3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0fd3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_b5ec_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_b5ec_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_b5ec_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_b5ec_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_37ec_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_37ec_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_b5ec_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_37ec_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2926_c40_329e_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2926_c40_329e_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2926_c40_329e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2926_c40_329e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2926_c40_329e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2926_c40_329e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_0ca2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_0ca2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_0ca2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d41e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d41e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d41e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d41e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_1614_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_1614_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_1614_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_1614_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_b5ec_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_b5ec_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_1614_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_b5ec_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2927_c40_db58_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2927_c40_db58_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2927_c40_db58_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2927_c40_db58_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2927_c40_db58_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2927_c40_db58_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_41a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_41a9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_41a9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1f32_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1f32_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1f32_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1f32_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3315_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3315_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3315_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3315_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_1614_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_1614_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_3315_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_1614_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2928_c40_0ad0_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2928_c40_0ad0_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2928_c40_0ad0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2928_c40_0ad0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2928_c40_0ad0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_486d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_486d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_486d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_fe97_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_fe97_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_fe97_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_fe97_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b62e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b62e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b62e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b62e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_3315_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_3315_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b62e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_3315_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2929_c40_b1ae_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2929_c40_b1ae_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2929_c40_b1ae_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2929_c40_b1ae_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2929_c40_b1ae_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5195_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5195_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5195_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_1c17_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_1c17_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_1c17_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_1c17_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d4d2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d4d2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d4d2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d4d2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b62e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b62e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_d4d2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b62e_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2930_c40_6955_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2930_c40_6955_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2930_c40_6955_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2930_c40_6955_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2930_c40_6955_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2930_c40_6955_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2930_c40_6955_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_fb14_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_fb14_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_fb14_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b973_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b973_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b973_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b973_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_95e1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_95e1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_95e1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_95e1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_d4d2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_d4d2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_95e1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_d4d2_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2931_c40_8a7e_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2931_c40_8a7e_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2931_c40_8a7e_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2931_c40_8a7e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2931_c40_8a7e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2931_c40_8a7e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2931_c40_8a7e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_649f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_649f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_649f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_715d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_715d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_715d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_715d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_dc0f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_dc0f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_dc0f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_dc0f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_95e1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_95e1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_dc0f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_95e1_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2932_c40_f6ac_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2932_c40_f6ac_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2932_c40_f6ac_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2932_c40_f6ac_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2932_c40_f6ac_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2932_c40_f6ac_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_dd61_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_dd61_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_dd61_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_6d5f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_6d5f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_6d5f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_6d5f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c7e8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c7e8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c7e8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c7e8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_dc0f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_dc0f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_c7e8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_dc0f_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2933_c40_5b53_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2933_c40_5b53_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2933_c40_5b53_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2933_c40_5b53_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2933_c40_5b53_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2933_c40_5b53_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c665_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c665_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c665_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6ea2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6ea2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6ea2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6ea2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_6a6b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_6a6b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_6a6b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_6a6b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_c7e8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_c7e8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_6a6b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_c7e8_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2934_c40_1c91_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2934_c40_1c91_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2934_c40_1c91_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2934_c40_1c91_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2934_c40_1c91_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2934_c40_1c91_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_beff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_beff_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_beff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_43f3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_43f3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_43f3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_43f3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7dd8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7dd8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7dd8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7dd8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_6a6b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_6a6b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_7dd8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_6a6b_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2935_c40_809d_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2935_c40_809d_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2935_c40_809d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2935_c40_809d_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2935_c40_809d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2935_c40_809d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_77a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_77a9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_77a9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_408e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_408e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_408e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_408e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5294_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5294_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5294_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5294_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_7dd8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_7dd8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_5294_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_7dd8_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2936_c40_b61e_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2936_c40_b61e_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2936_c40_b61e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2936_c40_b61e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2936_c40_b61e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_ffd8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_ffd8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_ffd8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b02b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b02b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b02b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b02b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_221d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_221d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_221d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_221d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_5294_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_5294_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_221d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_5294_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2937_c40_0c6c_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2937_c40_0c6c_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2937_c40_0c6c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2937_c40_0c6c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2937_c40_0c6c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ee93_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ee93_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ee93_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_bfd0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_bfd0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_bfd0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_bfd0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_0eb4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_0eb4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_0eb4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_0eb4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_221d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_221d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_0eb4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_221d_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2938_c40_d3c7_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2938_c40_d3c7_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2938_c40_d3c7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2938_c40_d3c7_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2938_c40_d3c7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2938_c40_d3c7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_6916_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_6916_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_6916_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_929e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_929e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_929e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_929e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_5596_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_5596_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_5596_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_5596_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_0eb4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_0eb4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_5596_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_0eb4_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2939_c40_b165_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2939_c40_b165_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2939_c40_b165_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2939_c40_b165_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2939_c40_b165_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2939_c40_b165_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_2724_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_2724_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_2724_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_b781_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_b781_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_b781_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_b781_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a4f3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a4f3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a4f3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a4f3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_5596_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_5596_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_a4f3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_5596_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2940_c40_ae64_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2940_c40_ae64_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2940_c40_ae64_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2940_c40_ae64_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2940_c40_ae64_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2940_c40_ae64_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2940_c40_ae64_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a84c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a84c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a84c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f60d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f60d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f60d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f60d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_a81a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_a81a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_a81a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_a81a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_a4f3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_a4f3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_a81a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_a4f3_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2941_c40_e00f_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2941_c40_e00f_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2941_c40_e00f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2941_c40_e00f_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2941_c40_e00f_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2941_c40_e00f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2941_c40_e00f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b581_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b581_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b581_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_ddc0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_ddc0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_ddc0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_ddc0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_7f44_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_7f44_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_7f44_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_7f44_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_a81a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_a81a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_7f44_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_a81a_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2942_c40_7ef6_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2942_c40_7ef6_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2942_c40_7ef6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2942_c40_7ef6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2942_c40_7ef6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_676a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_676a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_676a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_8e80_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_8e80_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_8e80_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_8e80_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_8c17_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_8c17_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_8c17_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_8c17_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_7f44_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_7f44_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_8c17_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_7f44_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2943_c40_e135_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2943_c40_e135_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2943_c40_e135_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2943_c40_e135_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2943_c40_e135_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_491a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_491a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_491a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_53ed_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_53ed_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_53ed_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_53ed_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_6090_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_6090_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_6090_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_6090_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_8c17_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_8c17_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_6090_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_8c17_cond : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2944_c40_ad8a_phase : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2944_c40_ad8a_ins : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2944_c40_ad8a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2944_c40_ad8a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2944_c40_ad8a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_85a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_85a6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_85a6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_c6e6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_c6e6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_c6e6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_c6e6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_c1c0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_c1c0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_c1c0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_c1c0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_6090_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_6090_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_c1c0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_6090_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2945_c40_e1f8_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2945_c40_e1f8_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2945_c40_e1f8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2945_c40_e1f8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2945_c40_e1f8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_de88_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_de88_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_de88_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_fc24_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_fc24_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_fc24_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_fc24_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_66b1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_66b1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_66b1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_66b1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_c1c0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_c1c0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_66b1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_c1c0_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2946_c40_d4cb_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2946_c40_d4cb_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2946_c40_d4cb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2946_c40_d4cb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2946_c40_d4cb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_7717_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_7717_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_7717_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d3a2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d3a2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d3a2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d3a2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_8c22_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_8c22_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_8c22_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_8c22_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_66b1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_66b1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_8c22_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_66b1_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2947_c40_0493_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2947_c40_0493_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2947_c40_0493_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2947_c40_0493_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2947_c40_0493_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_aef2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_aef2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_aef2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_3f40_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_3f40_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_3f40_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_3f40_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_2daf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_2daf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_2daf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_2daf_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_8c22_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_8c22_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_2daf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_8c22_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2948_c40_56b6_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2948_c40_56b6_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2948_c40_56b6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2948_c40_56b6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2948_c40_56b6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_0999_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_0999_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_0999_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_7e59_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_7e59_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_7e59_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_7e59_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5e63_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5e63_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5e63_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5e63_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_2daf_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_2daf_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_5e63_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_2daf_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2949_c40_b4b4_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2949_c40_b4b4_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2949_c40_b4b4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2949_c40_b4b4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2949_c40_b4b4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4489_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4489_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4489_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_3491_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_3491_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_3491_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_3491_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_726b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_726b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_726b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_726b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_5e63_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_5e63_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_726b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_5e63_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2950_c40_cbe1_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2950_c40_cbe1_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2950_c40_cbe1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2950_c40_cbe1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2950_c40_cbe1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_c1b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_c1b2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_c1b2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c909_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c909_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c909_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c909_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_d743_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_d743_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_d743_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_d743_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_726b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_726b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_d743_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_726b_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2951_c40_2ee8_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2951_c40_2ee8_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2951_c40_2ee8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2951_c40_2ee8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2951_c40_2ee8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_7cc8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_7cc8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_7cc8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_48db_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_48db_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_48db_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_48db_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_cb7e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_cb7e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_cb7e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_cb7e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_d743_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_d743_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_cb7e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_d743_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2952_c40_b245_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2952_c40_b245_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2952_c40_b245_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2952_c40_b245_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2952_c40_b245_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_2162_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_2162_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_2162_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_6541_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_6541_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_6541_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_6541_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_9bc0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_9bc0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_9bc0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_9bc0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_cb7e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_cb7e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_9bc0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_cb7e_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2953_c40_0b7b_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2953_c40_0b7b_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2953_c40_0b7b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2953_c40_0b7b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2953_c40_0b7b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d70b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d70b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d70b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_389b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_389b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_389b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_389b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_fceb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_fceb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_fceb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_fceb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_9bc0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_9bc0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_fceb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_9bc0_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2954_c40_01bc_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2954_c40_01bc_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2954_c40_01bc_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2954_c40_01bc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2954_c40_01bc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_10b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_10b0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_10b0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_c3de_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_c3de_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_c3de_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_c3de_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_f87f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_f87f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_f87f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_f87f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_fceb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_fceb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_f87f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_fceb_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2955_c40_e421_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2955_c40_e421_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2955_c40_e421_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2955_c40_e421_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2955_c40_e421_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_017a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_017a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_017a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_276d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_276d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_276d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_276d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_a332_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_a332_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_a332_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_a332_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_f87f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_f87f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_a332_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_f87f_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2956_c40_fa0b_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2956_c40_fa0b_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2956_c40_fa0b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2956_c40_fa0b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2956_c40_fa0b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_cc06_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_cc06_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_cc06_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_571d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_571d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_571d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_571d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_a332_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_a332_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_a332_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2957_c40_ba44_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2957_c40_ba44_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2957_c40_ba44_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2957_c40_ba44_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2957_c40_ba44_return_output : opcode_result_t;
 variable VAR_stack_index_uxn_opcodes_h_l2959_c2_b534 : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2959_c16_e620_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2959_c16_e620_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2960_c2_ba44_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2960_c17_fab8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2960_c2_ba44_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2960_c2_ba44_return_output : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2962_c2_cd3a_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l2963_c3_f974 : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2962_c2_cd3a_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2962_c2_cd3a_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2962_c2_cd3a_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2962_c2_cd3a_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2962_c2_cd3a_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l2965_c3_d87d : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2962_c2_cd3a_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2962_c2_cd3a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_5d3a_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_5d3a_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_5d3a_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_2e14_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_2e14_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_2e14_return_output : signed(9 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2968_c29_6b08_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2968_c29_6b08_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2968_c29_6b08_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2968_c29_6b08_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2968_c19_6811_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_e637_left : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2968_c68_a46e_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2968_c58_a92f_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_e637_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_e637_return_output : unsigned(8 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l2969_c2_3c38 : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_8df3_left : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2969_c20_04ea_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2969_c20_04ea_iftrue : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2969_c20_04ea_iffalse : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2969_c20_04ea_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_8df3_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_8df3_return_output : unsigned(9 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2971_c24_4ca2_stack_address : unsigned(8 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2971_c24_4ca2_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2971_c24_4ca2_write_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2974_c3_1653_return_output : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2971_c24_4ca2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2971_c24_4ca2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2978_c39_8a26_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2979_c40_b630_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2980_c34_d6c3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2981_c30_32c5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2982_c33_0c91_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2983_c34_87cf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2984_c37_3065_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2986_c32_c5da_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2963_l2965_DUPLICATE_3506_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2963_l2965_DUPLICATE_e144_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2985_l2973_DUPLICATE_9782_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2988_l2865_DUPLICATE_95e3_return_output : eval_opcode_result_t;
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4fd5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_1eb0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_right := to_unsigned(42, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fd57_right := to_unsigned(10, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c6f8_right := to_unsigned(3, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f3a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a6f1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_2724_right := to_unsigned(23, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_30d6_right := to_unsigned(37, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_7717_right := to_unsigned(58, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_6090_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_53ed_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e7bc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c7fd_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7dd8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_43f3_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2881_c14_334c_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_ffd8_right := to_unsigned(53, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1e87_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_68c9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a84c_right := to_unsigned(55, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_77a9_right := to_unsigned(21, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_18d8_right := to_unsigned(35, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_cb7e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_48db_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0be6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2c7b_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5202_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49b6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_bde8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_b75d_iffalse := to_unsigned(0, 1);
     VAR_is_wait_MUX_uxn_opcodes_h_l2888_c2_aaa5_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_0c9d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_37ec_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b02b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_221d_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_2daf_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_3f40_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_2ce4_right := to_unsigned(64, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b19d_right := to_unsigned(47, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_41a9_right := to_unsigned(17, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d4d2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_1c17_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_0a31_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_ea23_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2881_c14_fd64_right := to_unsigned(223, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c694_right := to_unsigned(16, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1633_right := to_unsigned(15, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_dc0f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_715d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d70b_right := to_unsigned(30, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_87b5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9842_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cb2f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_ff2a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_8c17_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_8e80_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1ea4_right := to_unsigned(8, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0b93_right := to_unsigned(41, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_10b0_right := to_unsigned(62, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_e480_right := to_unsigned(40, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e95e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_9713_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_139c_right := to_unsigned(39, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5195_right := to_unsigned(18, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_c1b2_right := to_unsigned(60, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_388b_right := to_unsigned(6, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_cc06_right := to_unsigned(63, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c6_503c_right := to_unsigned(0, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a4f3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_b781_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cbb0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e87b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2880_c14_7970_right := to_unsigned(63, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a749_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_d97c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_17b7_right := to_unsigned(45, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_f5d0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4001_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7f57_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_7cc8_right := to_unsigned(29, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_2162_right := to_unsigned(61, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0ac4_right := to_unsigned(36, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_d743_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c909_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_a23b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_16e8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_b03d_right := to_unsigned(13, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1c18_right := to_unsigned(2, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_389b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_fceb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ddb6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a596_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_ebbd_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_41aa_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_8843_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6a50_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_95e1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b973_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_beff_right := to_unsigned(52, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_676a_right := to_unsigned(56, 8);
     VAR_MUX_uxn_opcodes_h_l2969_c20_04ea_iftrue := to_unsigned(256, 9);
     VAR_is_wait_MUX_uxn_opcodes_h_l2888_c2_aaa5_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_6d5f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c7e8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_491a_right := to_unsigned(25, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_df19_right := to_unsigned(192, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_017a_right := to_unsigned(31, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5f5a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cfc1_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4489_right := to_unsigned(28, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c273_right := to_unsigned(38, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_fb14_right := to_unsigned(50, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b581_right := to_unsigned(24, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_4979_right := to_unsigned(32, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1f32_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3315_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_89b1_right := to_unsigned(160, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_e57e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_23fa_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7db7_right := to_unsigned(7, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ee93_right := to_unsigned(22, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_486d_right := to_unsigned(49, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_a81a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f60d_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_ddc0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_7f44_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_66b1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_fc24_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3b27_right := to_unsigned(34, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c665_right := to_unsigned(20, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_3ae2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_005b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_649f_right := to_unsigned(19, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_b5ec_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0fd3_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_f493_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_746b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8b4f_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ffb7_right := to_unsigned(43, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5e63_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_7e59_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_b588_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_56f1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_0a1d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dd74_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_5596_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_929e_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2969_c20_04ea_iffalse := resize(to_unsigned(0, 1), 9);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_834c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_3b0c_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2881_c14_334c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_92d4_right := to_unsigned(96, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ac77_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_ec22_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_3326_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6611_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_dd61_right := to_unsigned(51, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_c50b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_f415_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_0eb4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_bfd0_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_276d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_a332_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_9b7a_right := to_unsigned(224, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_2c9c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9e8d_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d1e9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_c9f0_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3ae6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_3690_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_046d_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_32d4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f2fa_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_0ca2_right := to_unsigned(48, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_85a6_right := to_unsigned(57, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_aef2_right := to_unsigned(27, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d41e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_1614_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_6916_right := to_unsigned(54, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_394c_right := to_unsigned(1, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_6541_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_9bc0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5962_right := to_unsigned(9, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d3a2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_8c22_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_fe97_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b62e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_de88_right := to_unsigned(26, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8de8_right := to_unsigned(12, 8);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2881_c14_1fa3_right := to_unsigned(32, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1619_right := to_unsigned(33, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_0999_right := to_unsigned(59, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_571d_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a9cc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9cc5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_ea77_right := to_unsigned(46, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_aaaa_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0285_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_56b3_right := to_unsigned(5, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3d6c_right := to_unsigned(14, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5294_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_408e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_29cf_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7dc5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_726b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_3491_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_18da_right := to_unsigned(11, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_dfda_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_b7a7_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_c6e6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_c1c0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_25a5_right := to_unsigned(4, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_6a6b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6ea2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_right := to_unsigned(44, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_f87f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_c3de_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_046d_iffalse := VAR_CLOCK_ENABLE;
     VAR_stack_ram_update_uxn_opcodes_h_l2971_c24_4ca2_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2880_c14_7970_left := VAR_ins;
     VAR_CONST_SR_6_uxn_opcodes_h_l2959_c16_e620_x := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_iftrue := VAR_ins;
     VAR_add2_uxn_opcodes_h_l2943_c40_e135_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l2942_c40_7ef6_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l2951_c40_2ee8_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l2950_c40_cbe1_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l2939_c40_b165_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l2938_c40_d3c7_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l2941_c40_e00f_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l2940_c40_ae64_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l2949_c40_b4b4_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l2948_c40_56b6_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l2907_c40_a606_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l2906_c40_86e1_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l2955_c40_e421_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l2954_c40_01bc_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l2911_c40_302d_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l2910_c40_e3d3_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l2915_c40_00e4_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l2914_c40_8de9_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l2897_c40_ad36_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l2896_c40_6ea4_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l2921_c40_76ba_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l2920_c40_a6de_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l2919_c40_6d2a_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l2918_c40_4281_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l2923_c40_260a_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l2922_c40_af3d_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l2935_c40_809d_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l2934_c40_1c91_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l2931_c40_8a7e_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l2930_c40_6955_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l2927_c40_db58_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l2926_c40_329e_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l2917_c40_42af_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l2916_c40_7107_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l2947_c40_0493_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l2946_c40_d4cb_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l2913_c40_c7bd_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l2912_c40_0457_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l2901_c40_6ffd_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l2900_c40_753e_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l2953_c40_0b7b_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l2952_c40_b245_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l2909_c40_f341_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l2908_c40_05b8_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l2899_c40_6f5f_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l2898_c40_b895_ins := VAR_ins;
     VAR_rot2_uxn_opcodes_h_l2905_c40_023c_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l2904_c40_54be_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l2957_c40_ba44_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l2956_c40_fa0b_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l2937_c40_0c6c_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l2936_c40_b61e_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l2925_c40_a95d_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l2924_c40_11c5_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l2932_c40_f6ac_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l2933_c40_5b53_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l2929_c40_b1ae_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l2928_c40_0ad0_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l2945_c40_e1f8_ins := VAR_ins;
     VAR_sub_uxn_opcodes_h_l2944_c40_ad8a_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l2903_c40_6d9e_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l2902_c40_9de3_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_a332_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l2889_c40_2f61_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l2920_c40_a6de_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l2890_c40_016e_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l2918_c40_4281_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l2891_c40_1108_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l2923_c40_260a_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l2922_c40_af3d_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l2931_c40_8a7e_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l2930_c40_6955_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2893_c40_5bdf_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2895_c40_0928_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2892_c40_0c64_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2894_c40_adf9_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l2932_c40_f6ac_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l2933_c40_5b53_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l2943_c40_e135_phase := VAR_phase;
     VAR_add_uxn_opcodes_h_l2942_c40_7ef6_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l2951_c40_2ee8_phase := VAR_phase;
     VAR_and_uxn_opcodes_h_l2950_c40_cbe1_phase := VAR_phase;
     VAR_brk_uxn_opcodes_h_l2888_c48_402f_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2939_c40_b165_phase := VAR_phase;
     VAR_dei_uxn_opcodes_h_l2938_c40_d3c7_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l2941_c40_e00f_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l2940_c40_ae64_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l2949_c40_b4b4_phase := VAR_phase;
     VAR_div_uxn_opcodes_h_l2948_c40_56b6_phase := VAR_phase;
     VAR_dup2_uxn_opcodes_h_l2907_c40_a606_phase := VAR_phase;
     VAR_dup_uxn_opcodes_h_l2906_c40_86e1_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l2955_c40_e421_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l2954_c40_01bc_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l2911_c40_302d_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l2910_c40_e3d3_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l2915_c40_00e4_phase := VAR_phase;
     VAR_gth_uxn_opcodes_h_l2914_c40_8de9_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l2897_c40_ad36_phase := VAR_phase;
     VAR_inc_uxn_opcodes_h_l2896_c40_6ea4_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l2889_c40_2f61_phase := VAR_phase;
     VAR_jcn2_uxn_opcodes_h_l2921_c40_76ba_phase := VAR_phase;
     VAR_jcn_uxn_opcodes_h_l2920_c40_a6de_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l2890_c40_016e_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l2919_c40_6d2a_phase := VAR_phase;
     VAR_jmp_uxn_opcodes_h_l2918_c40_4281_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l2891_c40_1108_phase := VAR_phase;
     VAR_jsr2_uxn_opcodes_h_l2923_c40_260a_phase := VAR_phase;
     VAR_jsr_uxn_opcodes_h_l2922_c40_af3d_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l2935_c40_809d_phase := VAR_phase;
     VAR_lda_uxn_opcodes_h_l2934_c40_1c91_phase := VAR_phase;
     VAR_ldr2_uxn_opcodes_h_l2931_c40_8a7e_phase := VAR_phase;
     VAR_ldr_uxn_opcodes_h_l2930_c40_6955_phase := VAR_phase;
     VAR_ldz2_uxn_opcodes_h_l2927_c40_db58_phase := VAR_phase;
     VAR_ldz_uxn_opcodes_h_l2926_c40_329e_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2893_c40_5bdf_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2895_c40_0928_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2892_c40_0c64_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2894_c40_adf9_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l2917_c40_42af_phase := VAR_phase;
     VAR_lth_uxn_opcodes_h_l2916_c40_7107_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l2947_c40_0493_phase := VAR_phase;
     VAR_mul_uxn_opcodes_h_l2946_c40_d4cb_phase := VAR_phase;
     VAR_neq2_uxn_opcodes_h_l2913_c40_c7bd_phase := VAR_phase;
     VAR_neq_uxn_opcodes_h_l2912_c40_0457_phase := VAR_phase;
     VAR_nip2_uxn_opcodes_h_l2901_c40_6ffd_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l2900_c40_753e_phase := VAR_phase;
     VAR_ora2_uxn_opcodes_h_l2953_c40_0b7b_phase := VAR_phase;
     VAR_ora_uxn_opcodes_h_l2952_c40_b245_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l2909_c40_f341_phase := VAR_phase;
     VAR_ovr_uxn_opcodes_h_l2908_c40_05b8_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l2899_c40_6f5f_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l2898_c40_b895_phase := VAR_phase;
     VAR_rot2_uxn_opcodes_h_l2905_c40_023c_phase := VAR_phase;
     VAR_rot_uxn_opcodes_h_l2904_c40_54be_phase := VAR_phase;
     VAR_sft2_uxn_opcodes_h_l2957_c40_ba44_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l2956_c40_fa0b_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l2937_c40_0c6c_phase := VAR_phase;
     VAR_sta_uxn_opcodes_h_l2936_c40_b61e_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l2925_c40_a95d_phase := VAR_phase;
     VAR_sth_uxn_opcodes_h_l2924_c40_11c5_phase := VAR_phase;
     VAR_str1_uxn_opcodes_h_l2932_c40_f6ac_phase := VAR_phase;
     VAR_str2_uxn_opcodes_h_l2933_c40_5b53_phase := VAR_phase;
     VAR_stz2_uxn_opcodes_h_l2929_c40_b1ae_phase := VAR_phase;
     VAR_stz_uxn_opcodes_h_l2928_c40_0ad0_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l2945_c40_e1f8_phase := VAR_phase;
     VAR_sub_uxn_opcodes_h_l2944_c40_ad8a_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l2903_c40_6d9e_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l2902_c40_9de3_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2939_c40_b165_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_dei_uxn_opcodes_h_l2938_c40_d3c7_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2941_c40_e00f_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo_uxn_opcodes_h_l2940_c40_ae64_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2941_c40_e00f_previous_ram_read := VAR_previous_ram_read;
     VAR_deo_uxn_opcodes_h_l2940_c40_ae64_previous_ram_read := VAR_previous_ram_read;
     VAR_jci_uxn_opcodes_h_l2889_c40_2f61_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l2890_c40_016e_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l2891_c40_1108_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l2935_c40_809d_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l2934_c40_1c91_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l2931_c40_8a7e_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l2930_c40_6955_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l2927_c40_db58_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l2926_c40_329e_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2893_c40_5bdf_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2895_c40_0928_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2892_c40_0c64_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2894_c40_adf9_previous_ram_read := VAR_previous_ram_read;
     VAR_add2_uxn_opcodes_h_l2943_c40_e135_previous_stack_read := previous_stack_read;
     VAR_add_uxn_opcodes_h_l2942_c40_7ef6_previous_stack_read := previous_stack_read;
     VAR_and2_uxn_opcodes_h_l2951_c40_2ee8_previous_stack_read := previous_stack_read;
     VAR_and_uxn_opcodes_h_l2950_c40_cbe1_previous_stack_read := previous_stack_read;
     VAR_dei2_uxn_opcodes_h_l2939_c40_b165_previous_stack_read := previous_stack_read;
     VAR_dei_uxn_opcodes_h_l2938_c40_d3c7_previous_stack_read := previous_stack_read;
     VAR_deo2_uxn_opcodes_h_l2941_c40_e00f_previous_stack_read := previous_stack_read;
     VAR_deo_uxn_opcodes_h_l2940_c40_ae64_previous_stack_read := previous_stack_read;
     VAR_div2_uxn_opcodes_h_l2949_c40_b4b4_previous_stack_read := previous_stack_read;
     VAR_div_uxn_opcodes_h_l2948_c40_56b6_previous_stack_read := previous_stack_read;
     VAR_dup2_uxn_opcodes_h_l2907_c40_a606_previous_stack_read := previous_stack_read;
     VAR_dup_uxn_opcodes_h_l2906_c40_86e1_previous_stack_read := previous_stack_read;
     VAR_eor2_uxn_opcodes_h_l2955_c40_e421_previous_stack_read := previous_stack_read;
     VAR_eor_uxn_opcodes_h_l2954_c40_01bc_previous_stack_read := previous_stack_read;
     VAR_equ2_uxn_opcodes_h_l2911_c40_302d_previous_stack_read := previous_stack_read;
     VAR_equ_uxn_opcodes_h_l2910_c40_e3d3_previous_stack_read := previous_stack_read;
     VAR_gth2_uxn_opcodes_h_l2915_c40_00e4_previous_stack_read := previous_stack_read;
     VAR_gth_uxn_opcodes_h_l2914_c40_8de9_previous_stack_read := previous_stack_read;
     VAR_inc2_uxn_opcodes_h_l2897_c40_ad36_previous_stack_read := previous_stack_read;
     VAR_inc_uxn_opcodes_h_l2896_c40_6ea4_previous_stack_read := previous_stack_read;
     VAR_jci_uxn_opcodes_h_l2889_c40_2f61_previous_stack_read := previous_stack_read;
     VAR_jcn2_uxn_opcodes_h_l2921_c40_76ba_previous_stack_read := previous_stack_read;
     VAR_jcn_uxn_opcodes_h_l2920_c40_a6de_previous_stack_read := previous_stack_read;
     VAR_jmp2_uxn_opcodes_h_l2919_c40_6d2a_previous_stack_read := previous_stack_read;
     VAR_jmp_uxn_opcodes_h_l2918_c40_4281_previous_stack_read := previous_stack_read;
     VAR_jsr2_uxn_opcodes_h_l2923_c40_260a_previous_stack_read := previous_stack_read;
     VAR_jsr_uxn_opcodes_h_l2922_c40_af3d_previous_stack_read := previous_stack_read;
     VAR_lda2_uxn_opcodes_h_l2935_c40_809d_previous_stack_read := previous_stack_read;
     VAR_lda_uxn_opcodes_h_l2934_c40_1c91_previous_stack_read := previous_stack_read;
     VAR_ldr2_uxn_opcodes_h_l2931_c40_8a7e_previous_stack_read := previous_stack_read;
     VAR_ldr_uxn_opcodes_h_l2930_c40_6955_previous_stack_read := previous_stack_read;
     VAR_ldz2_uxn_opcodes_h_l2927_c40_db58_previous_stack_read := previous_stack_read;
     VAR_ldz_uxn_opcodes_h_l2926_c40_329e_previous_stack_read := previous_stack_read;
     VAR_lth2_uxn_opcodes_h_l2917_c40_42af_previous_stack_read := previous_stack_read;
     VAR_lth_uxn_opcodes_h_l2916_c40_7107_previous_stack_read := previous_stack_read;
     VAR_mul2_uxn_opcodes_h_l2947_c40_0493_previous_stack_read := previous_stack_read;
     VAR_mul_uxn_opcodes_h_l2946_c40_d4cb_previous_stack_read := previous_stack_read;
     VAR_neq2_uxn_opcodes_h_l2913_c40_c7bd_previous_stack_read := previous_stack_read;
     VAR_neq_uxn_opcodes_h_l2912_c40_0457_previous_stack_read := previous_stack_read;
     VAR_nip2_uxn_opcodes_h_l2901_c40_6ffd_previous_stack_read := previous_stack_read;
     VAR_nip_uxn_opcodes_h_l2900_c40_753e_previous_stack_read := previous_stack_read;
     VAR_ora2_uxn_opcodes_h_l2953_c40_0b7b_previous_stack_read := previous_stack_read;
     VAR_ora_uxn_opcodes_h_l2952_c40_b245_previous_stack_read := previous_stack_read;
     VAR_ovr2_uxn_opcodes_h_l2909_c40_f341_previous_stack_read := previous_stack_read;
     VAR_ovr_uxn_opcodes_h_l2908_c40_05b8_previous_stack_read := previous_stack_read;
     VAR_rot2_uxn_opcodes_h_l2905_c40_023c_previous_stack_read := previous_stack_read;
     VAR_rot_uxn_opcodes_h_l2904_c40_54be_previous_stack_read := previous_stack_read;
     VAR_sft2_uxn_opcodes_h_l2957_c40_ba44_previous_stack_read := previous_stack_read;
     VAR_sft_uxn_opcodes_h_l2956_c40_fa0b_previous_stack_read := previous_stack_read;
     VAR_sta2_uxn_opcodes_h_l2937_c40_0c6c_previous_stack_read := previous_stack_read;
     VAR_sta_uxn_opcodes_h_l2936_c40_b61e_previous_stack_read := previous_stack_read;
     VAR_sth2_uxn_opcodes_h_l2925_c40_a95d_previous_stack_read := previous_stack_read;
     VAR_sth_uxn_opcodes_h_l2924_c40_11c5_previous_stack_read := previous_stack_read;
     VAR_str1_uxn_opcodes_h_l2932_c40_f6ac_previous_stack_read := previous_stack_read;
     VAR_str2_uxn_opcodes_h_l2933_c40_5b53_previous_stack_read := previous_stack_read;
     VAR_stz2_uxn_opcodes_h_l2929_c40_b1ae_previous_stack_read := previous_stack_read;
     VAR_stz_uxn_opcodes_h_l2928_c40_0ad0_previous_stack_read := previous_stack_read;
     VAR_sub2_uxn_opcodes_h_l2945_c40_e1f8_previous_stack_read := previous_stack_read;
     VAR_sub_uxn_opcodes_h_l2944_c40_ad8a_previous_stack_read := previous_stack_read;
     VAR_swp2_uxn_opcodes_h_l2903_c40_6d9e_previous_stack_read := previous_stack_read;
     VAR_swp_uxn_opcodes_h_l2902_c40_9de3_previous_stack_read := previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_2e14_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l2962_c2_cd3a_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_5d3a_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l2962_c2_cd3a_iffalse := sp1;
     -- BIN_OP_AND[uxn_opcodes_h_l2880_c14_7970] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2880_c14_7970_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2880_c14_7970_left;
     BIN_OP_AND_uxn_opcodes_h_l2880_c14_7970_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2880_c14_7970_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2880_c14_7970_return_output := BIN_OP_AND_uxn_opcodes_h_l2880_c14_7970_return_output;

     -- CONST_SR_6[uxn_opcodes_h_l2959_c16_e620] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_opcodes_h_l2959_c16_e620_x <= VAR_CONST_SR_6_uxn_opcodes_h_l2959_c16_e620_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_opcodes_h_l2959_c16_e620_return_output := CONST_SR_6_uxn_opcodes_h_l2959_c16_e620_return_output;

     -- brk[uxn_opcodes_h_l2888_c48_402f] LATENCY=0
     -- Inputs
     brk_uxn_opcodes_h_l2888_c48_402f_phase <= VAR_brk_uxn_opcodes_h_l2888_c48_402f_phase;
     -- Outputs
     VAR_brk_uxn_opcodes_h_l2888_c48_402f_return_output := brk_uxn_opcodes_h_l2888_c48_402f_return_output;

     -- Submodule level 1
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2881_c14_fd64_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2880_c14_7970_return_output;
     VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l2880_c14_7970_return_output;
     REG_VAR_ins_a_3f := VAR_BIN_OP_AND_uxn_opcodes_h_l2880_c14_7970_return_output;
     VAR_stack_index_uxn_opcodes_h_l2959_c2_b534 := resize(VAR_CONST_SR_6_uxn_opcodes_h_l2959_c16_e620_return_output, 1);
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_iftrue := VAR_brk_uxn_opcodes_h_l2888_c48_402f_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2960_c2_ba44_left := VAR_stack_index_uxn_opcodes_h_l2959_c2_b534;
     -- BIN_OP_XOR[uxn_opcodes_h_l2881_c14_fd64] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2881_c14_fd64_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2881_c14_fd64_left;
     BIN_OP_XOR_uxn_opcodes_h_l2881_c14_fd64_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2881_c14_fd64_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2881_c14_fd64_return_output := BIN_OP_XOR_uxn_opcodes_h_l2881_c14_fd64_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l2881_c14_1fa3_left := VAR_BIN_OP_XOR_uxn_opcodes_h_l2881_c14_fd64_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2881_c14_1fa3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2881_c14_1fa3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2881_c14_1fa3_left;
     BIN_OP_OR_uxn_opcodes_h_l2881_c14_1fa3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2881_c14_1fa3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2881_c14_1fa3_return_output := BIN_OP_OR_uxn_opcodes_h_l2881_c14_1fa3_return_output;

     -- Submodule level 3
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2881_c14_b18b_expr := VAR_BIN_OP_OR_uxn_opcodes_h_l2881_c14_1fa3_return_output;
     -- UNARY_OP_NOT[uxn_opcodes_h_l2881_c14_b18b] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l2881_c14_b18b_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l2881_c14_b18b_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2881_c14_b18b_return_output := UNARY_OP_NOT_uxn_opcodes_h_l2881_c14_b18b_return_output;

     -- Submodule level 4
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8b4f_left := VAR_UNARY_OP_NOT_uxn_opcodes_h_l2881_c14_b18b_return_output;
     -- BIN_OP_NEQ[uxn_opcodes_h_l2881_c14_8b4f] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8b4f_left <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8b4f_left;
     BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8b4f_right <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8b4f_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8b4f_return_output := BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8b4f_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_opcodes_h_l2881_c14_334c_cond := VAR_BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8b4f_return_output;
     -- MUX[uxn_opcodes_h_l2881_c14_334c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2881_c14_334c_cond <= VAR_MUX_uxn_opcodes_h_l2881_c14_334c_cond;
     MUX_uxn_opcodes_h_l2881_c14_334c_iftrue <= VAR_MUX_uxn_opcodes_h_l2881_c14_334c_iftrue;
     MUX_uxn_opcodes_h_l2881_c14_334c_iffalse <= VAR_MUX_uxn_opcodes_h_l2881_c14_334c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2881_c14_334c_return_output := MUX_uxn_opcodes_h_l2881_c14_334c_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_cond := VAR_MUX_uxn_opcodes_h_l2881_c14_334c_return_output;
     REG_VAR_is_imm := VAR_MUX_uxn_opcodes_h_l2881_c14_334c_return_output;
     -- MUX[uxn_opcodes_h_l2882_c8_a4a5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2882_c8_a4a5_cond <= VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_cond;
     MUX_uxn_opcodes_h_l2882_c8_a4a5_iftrue <= VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_iftrue;
     MUX_uxn_opcodes_h_l2882_c8_a4a5_iffalse <= VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output := MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;

     -- Submodule level 7
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c6_503c_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_4979_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_2ce4_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_92d4_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7f57_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_89b1_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_df19_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_9b7a_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_394c_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1619_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1c18_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3b27_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c6f8_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_18d8_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_25a5_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0ac4_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_56b3_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_30d6_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_388b_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c273_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7db7_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_139c_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1ea4_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_e480_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5962_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0b93_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fd57_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_18da_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ffb7_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8de8_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_b03d_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_17b7_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3d6c_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_ea77_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1633_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b19d_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c694_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_0ca2_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_41a9_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_486d_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5195_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_fb14_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_649f_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_dd61_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c665_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_beff_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_77a9_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_ffd8_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ee93_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_6916_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_2724_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a84c_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b581_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_676a_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_491a_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_85a6_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_de88_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_7717_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_aef2_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_0999_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4489_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_c1b2_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_7cc8_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_2162_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d70b_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_10b0_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_017a_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_cc06_left := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     REG_VAR_opc := VAR_MUX_uxn_opcodes_h_l2882_c8_a4a5_return_output;
     -- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_e480] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_e480_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_e480_left;
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_e480_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_e480_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_e480_return_output := BIN_OP_EQ_uxn_opcodes_h_l2911_c11_e480_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_3b27] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3b27_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3b27_left;
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3b27_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3b27_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3b27_return_output := BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3b27_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_b19d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b19d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b19d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b19d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b19d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b19d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b19d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_486d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_486d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_486d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_486d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_486d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_486d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2929_c11_486d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_595b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_17b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_17b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_17b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_17b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_17b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_17b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2921_c11_17b7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_c273] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c273_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c273_left;
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c273_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c273_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c273_return_output := BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c273_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_dd61] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_dd61_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_dd61_left;
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_dd61_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_dd61_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_dd61_return_output := BIN_OP_EQ_uxn_opcodes_h_l2933_c11_dd61_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2955_c11_10b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2955_c11_10b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_10b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2955_c11_10b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_10b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_10b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2955_c11_10b0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_5195] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5195_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5195_left;
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5195_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5195_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5195_return_output := BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5195_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_beff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_beff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_beff_left;
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_beff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_beff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_beff_return_output := BIN_OP_EQ_uxn_opcodes_h_l2935_c11_beff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_3d6c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3d6c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3d6c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3d6c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3d6c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3d6c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3d6c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_8de8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8de8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8de8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8de8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8de8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8de8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8de8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2952_c11_7cc8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2952_c11_7cc8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_7cc8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2952_c11_7cc8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_7cc8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_7cc8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2952_c11_7cc8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_0ca2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_0ca2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_0ca2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_0ca2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_0ca2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_0ca2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2927_c11_0ca2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_1619] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1619_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1619_left;
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1619_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1619_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1619_return_output := BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1619_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_6916] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_6916_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_6916_left;
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_6916_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_6916_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_6916_return_output := BIN_OP_EQ_uxn_opcodes_h_l2939_c11_6916_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_56b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_56b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_56b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_56b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_56b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_56b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2904_c11_56b3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_4979] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_4979_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_4979_left;
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_4979_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_4979_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_4979_return_output := BIN_OP_EQ_uxn_opcodes_h_l2889_c11_4979_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_ffd8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_ffd8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_ffd8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_ffd8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_ffd8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_ffd8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2937_c11_ffd8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_139c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_139c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_139c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_139c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_139c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_139c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2909_c11_139c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_c694] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c694_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c694_left;
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c694_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c694_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c694_return_output := BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c694_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_30d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_30d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_30d6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_30d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_30d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_30d6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2905_c11_30d6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_1ea4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1ea4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1ea4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1ea4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1ea4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1ea4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1ea4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2949_c11_0999] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2949_c11_0999_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_0999_left;
     BIN_OP_EQ_uxn_opcodes_h_l2949_c11_0999_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_0999_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_0999_return_output := BIN_OP_EQ_uxn_opcodes_h_l2949_c11_0999_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_41a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_41a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_41a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_41a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_41a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_41a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2928_c11_41a9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_394c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_394c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_394c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_394c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_394c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_394c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2896_c11_394c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_ea77] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_ea77_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_ea77_left;
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_ea77_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_ea77_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_ea77_return_output := BIN_OP_EQ_uxn_opcodes_h_l2923_c11_ea77_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2953_c11_2162] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2953_c11_2162_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_2162_left;
     BIN_OP_EQ_uxn_opcodes_h_l2953_c11_2162_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_2162_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_2162_return_output := BIN_OP_EQ_uxn_opcodes_h_l2953_c11_2162_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2947_c11_7717] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2947_c11_7717_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_7717_left;
     BIN_OP_EQ_uxn_opcodes_h_l2947_c11_7717_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_7717_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_7717_return_output := BIN_OP_EQ_uxn_opcodes_h_l2947_c11_7717_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_ffb7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ffb7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ffb7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ffb7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ffb7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ffb7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ffb7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2891_c11_92d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2891_c11_92d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_92d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2891_c11_92d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_92d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_92d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2891_c11_92d4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_18da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_18da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_18da_left;
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_18da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_18da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_18da_return_output := BIN_OP_EQ_uxn_opcodes_h_l2916_c11_18da_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_5962] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5962_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5962_left;
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5962_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5962_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5962_return_output := BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5962_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2943_c11_676a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2943_c11_676a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_676a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2943_c11_676a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_676a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_676a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2943_c11_676a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_ee93] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ee93_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ee93_left;
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ee93_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ee93_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ee93_return_output := BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ee93_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2946_c11_de88] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2946_c11_de88_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_de88_left;
     BIN_OP_EQ_uxn_opcodes_h_l2946_c11_de88_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_de88_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_de88_return_output := BIN_OP_EQ_uxn_opcodes_h_l2946_c11_de88_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_2724] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_2724_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_2724_left;
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_2724_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_2724_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_2724_return_output := BIN_OP_EQ_uxn_opcodes_h_l2940_c11_2724_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_9b7a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_9b7a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_9b7a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_9b7a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_9b7a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_9b7a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2895_c11_9b7a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_0b93] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0b93_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0b93_left;
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0b93_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0b93_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0b93_return_output := BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0b93_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_649f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_649f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_649f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_649f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_649f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_649f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2932_c11_649f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_1633] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1633_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1633_left;
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1633_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1633_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1633_return_output := BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1633_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2944_c11_491a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2944_c11_491a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_491a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2944_c11_491a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_491a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_491a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2944_c11_491a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_b03d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_b03d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_b03d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_b03d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_b03d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_b03d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2920_c11_b03d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_77a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_77a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_77a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_77a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_77a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_77a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2936_c11_77a9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_fd57] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fd57_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fd57_left;
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fd57_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fd57_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fd57_return_output := BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fd57_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_7f57] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7f57_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7f57_left;
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7f57_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7f57_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7f57_return_output := BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7f57_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2956_c11_017a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2956_c11_017a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_017a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2956_c11_017a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_017a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_017a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2956_c11_017a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_25a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_25a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_25a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_25a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_25a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_25a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2902_c11_25a5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_388b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_388b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_388b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_388b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_388b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_388b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2906_c11_388b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_c6f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c6f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c6f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c6f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c6f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c6f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c6f8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2941_c11_a84c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a84c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a84c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a84c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a84c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a84c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a84c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2942_c11_b581] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b581_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b581_left;
     BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b581_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b581_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b581_return_output := BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b581_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2954_c11_d70b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d70b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d70b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d70b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d70b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d70b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d70b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_0ac4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0ac4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0ac4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0ac4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0ac4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0ac4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0ac4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2893_c11_89b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2893_c11_89b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_89b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2893_c11_89b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_89b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_89b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2893_c11_89b1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2950_c11_4489] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4489_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4489_left;
     BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4489_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4489_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4489_return_output := BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4489_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2890_c11_2ce4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2890_c11_2ce4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_2ce4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2890_c11_2ce4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_2ce4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_2ce4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2890_c11_2ce4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_fb14] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_fb14_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_fb14_left;
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_fb14_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_fb14_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_fb14_return_output := BIN_OP_EQ_uxn_opcodes_h_l2931_c11_fb14_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2957_c11_cc06] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2957_c11_cc06_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_cc06_left;
     BIN_OP_EQ_uxn_opcodes_h_l2957_c11_cc06_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_cc06_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_cc06_return_output := BIN_OP_EQ_uxn_opcodes_h_l2957_c11_cc06_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2898_c11_1c18] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1c18_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1c18_left;
     BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1c18_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1c18_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1c18_return_output := BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1c18_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2945_c11_85a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2945_c11_85a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_85a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2945_c11_85a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_85a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_85a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2945_c11_85a6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2951_c11_c1b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2951_c11_c1b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_c1b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2951_c11_c1b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_c1b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_c1b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2951_c11_c1b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_df19] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_df19_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_df19_left;
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_df19_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_df19_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_df19_return_output := BIN_OP_EQ_uxn_opcodes_h_l2894_c11_df19_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_7db7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7db7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7db7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7db7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7db7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7db7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7db7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_18d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_18d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_18d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_18d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_18d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_18d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2901_c11_18d8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2948_c11_aef2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2948_c11_aef2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_aef2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2948_c11_aef2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_aef2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_aef2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2948_c11_aef2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_2677] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_left;
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_return_output := BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_c665] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c665_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c665_left;
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c665_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c665_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c665_return_output := BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c665_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2888_c6_503c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2888_c6_503c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c6_503c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2888_c6_503c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c6_503c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c6_503c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2888_c6_503c_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_046d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c6_503c_return_output;
     VAR_is_wait_MUX_uxn_opcodes_h_l2888_c2_aaa5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c6_503c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c6_503c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d1e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_4979_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_c9f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_4979_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_046d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_4979_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_746b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_2ce4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_f493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_2ce4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_d1e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_2ce4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_ec22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_92d4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ac77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_92d4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_746b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_92d4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_c50b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7f57_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_f415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7f57_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_ec22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7f57_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_aaaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_89b1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0285_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_89b1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_c50b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_89b1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_29cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_df19_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7dc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_df19_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_aaaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_df19_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_9713_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_9b7a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e95e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_9b7a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_29cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_9b7a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_87b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_394c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9842_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_394c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_9713_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_394c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_a23b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1619_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_16e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1619_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_87b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1619_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_3690_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1c18_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3ae6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1c18_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_a23b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1c18_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6a50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3b27_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_8843_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3b27_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_3690_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3b27_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9cc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c6f8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a9cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c6f8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6a50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c6f8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_32d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_18d8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f2fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_18d8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_9cc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_18d8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_b588_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_25a5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_56f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_25a5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_32d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_25a5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_e57e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0ac4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_23fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0ac4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_b588_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0ac4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_ebbd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_56b3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_41aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_56b3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_e57e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_56b3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a749_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_30d6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_d97c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_30d6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_ebbd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_30d6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cb2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_388b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_ff2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_388b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a749_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_388b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_0a31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c273_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_ea23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c273_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_cb2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_c273_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7db7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ddb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7db7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_0a31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7db7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e87b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_139c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cbb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_139c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_a596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_139c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_dfda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1ea4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_b7a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1ea4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_e87b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1ea4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_68c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_e480_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1e87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_e480_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_dfda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_e480_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9e8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5962_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_2c9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5962_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_68c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5962_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_bde8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0b93_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_b75d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0b93_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_9e8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0b93_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5202_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fd57_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fd57_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_bde8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fd57_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a6f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_5202_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_0a1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_18da_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dd74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_18da_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_a6f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_18da_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_3ae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ffb7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_005b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ffb7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_0a1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ffb7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4fd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8de8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_1eb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8de8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_3ae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8de8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_f5d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4001_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4fd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c7fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_b03d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e7bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_b03d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_f5d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_b03d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2c7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_17b7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0be6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_17b7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_c7fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_17b7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_3326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3d6c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3d6c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_2c7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3d6c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_3b0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_ea77_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_834c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_ea77_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_3326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_ea77_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5f5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1633_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cfc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1633_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_3b0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1633_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_37ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b19d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_0c9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b19d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_5f5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_b19d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_b5ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c694_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0fd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c694_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_37ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_c694_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_1614_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_0ca2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d41e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_0ca2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_b5ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_0ca2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3315_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_41a9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1f32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_41a9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_1614_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_41a9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b62e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_486d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_fe97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_486d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_3315_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_486d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d4d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5195_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_1c17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5195_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b62e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5195_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_95e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_fb14_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b973_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_fb14_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_d4d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_fb14_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_dc0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_649f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_715d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_649f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_95e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_649f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c7e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_dd61_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_6d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_dd61_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_dc0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_dd61_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_6a6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c665_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6ea2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c665_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_c7e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_c665_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7dd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_beff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_43f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_beff_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_6a6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_beff_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5294_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_77a9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_408e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_77a9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_7dd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_77a9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_221d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_ffd8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b02b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_ffd8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_5294_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_ffd8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_0eb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ee93_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_bfd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ee93_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_221d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ee93_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_5596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_6916_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_929e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_6916_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_0eb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_6916_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a4f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_2724_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_b781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_2724_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_5596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_2724_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_a81a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a84c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f60d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a84c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_a4f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a84c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_7f44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b581_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_ddc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b581_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_a81a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b581_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_8c17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_676a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_8e80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_676a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_7f44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_676a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_6090_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_491a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_53ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_491a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_8c17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_491a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_c1c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_85a6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_c6e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_85a6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_6090_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_85a6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_66b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_de88_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_fc24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_de88_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_c1c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_de88_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_8c22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_7717_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d3a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_7717_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_66b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_7717_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_2daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_aef2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_3f40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_aef2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_8c22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_aef2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5e63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_0999_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_7e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_0999_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_2daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_0999_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_726b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4489_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_3491_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4489_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_5e63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4489_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_d743_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_c1b2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c909_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_c1b2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_726b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_c1b2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_cb7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_7cc8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_48db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_7cc8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_d743_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_7cc8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_9bc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_2162_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_6541_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_2162_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_cb7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_2162_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_fceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d70b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_389b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d70b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_9bc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d70b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_f87f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_10b0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_c3de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_10b0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_fceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_10b0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_a332_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_017a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_276d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_017a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_f87f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_017a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_571d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_cc06_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_a332_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_cc06_return_output;
     -- is_wait_MUX[uxn_opcodes_h_l2888_c2_aaa5] LATENCY=0
     -- Inputs
     is_wait_MUX_uxn_opcodes_h_l2888_c2_aaa5_cond <= VAR_is_wait_MUX_uxn_opcodes_h_l2888_c2_aaa5_cond;
     is_wait_MUX_uxn_opcodes_h_l2888_c2_aaa5_iftrue <= VAR_is_wait_MUX_uxn_opcodes_h_l2888_c2_aaa5_iftrue;
     is_wait_MUX_uxn_opcodes_h_l2888_c2_aaa5_iffalse <= VAR_is_wait_MUX_uxn_opcodes_h_l2888_c2_aaa5_iffalse;
     -- Outputs
     VAR_is_wait_MUX_uxn_opcodes_h_l2888_c2_aaa5_return_output := is_wait_MUX_uxn_opcodes_h_l2888_c2_aaa5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c7_046d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_046d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_046d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_046d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_046d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_046d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_046d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_046d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_046d_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d1e9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_046d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_c9f0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_046d_return_output;
     REG_VAR_is_wait := VAR_is_wait_MUX_uxn_opcodes_h_l2888_c2_aaa5_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c1_c9f0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_c9f0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_c9f0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_c9f0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_c9f0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_c9f0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_c9f0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_c9f0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_c9f0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c7_d1e9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d1e9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d1e9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d1e9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d1e9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d1e9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d1e9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d1e9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d1e9_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_746b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d1e9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_f493_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_d1e9_return_output;
     VAR_jci_uxn_opcodes_h_l2889_c40_2f61_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_c9f0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c7_746b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_746b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_746b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_746b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_746b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_746b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_746b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_746b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_746b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c1_f493] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_f493_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_f493_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_f493_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_f493_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_f493_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_f493_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_f493_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_f493_return_output;

     -- jci[uxn_opcodes_h_l2889_c40_2f61] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l2889_c40_2f61_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l2889_c40_2f61_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l2889_c40_2f61_phase <= VAR_jci_uxn_opcodes_h_l2889_c40_2f61_phase;
     jci_uxn_opcodes_h_l2889_c40_2f61_pc <= VAR_jci_uxn_opcodes_h_l2889_c40_2f61_pc;
     jci_uxn_opcodes_h_l2889_c40_2f61_previous_stack_read <= VAR_jci_uxn_opcodes_h_l2889_c40_2f61_previous_stack_read;
     jci_uxn_opcodes_h_l2889_c40_2f61_previous_ram_read <= VAR_jci_uxn_opcodes_h_l2889_c40_2f61_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l2889_c40_2f61_return_output := jci_uxn_opcodes_h_l2889_c40_2f61_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_ec22_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_746b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ac77_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_746b_return_output;
     VAR_jmi_uxn_opcodes_h_l2890_c40_016e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_f493_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_046d_iftrue := VAR_jci_uxn_opcodes_h_l2889_c40_2f61_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c1_ac77] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ac77_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ac77_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ac77_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ac77_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ac77_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ac77_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ac77_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ac77_return_output;

     -- jmi[uxn_opcodes_h_l2890_c40_016e] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l2890_c40_016e_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l2890_c40_016e_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l2890_c40_016e_phase <= VAR_jmi_uxn_opcodes_h_l2890_c40_016e_phase;
     jmi_uxn_opcodes_h_l2890_c40_016e_pc <= VAR_jmi_uxn_opcodes_h_l2890_c40_016e_pc;
     jmi_uxn_opcodes_h_l2890_c40_016e_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l2890_c40_016e_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l2890_c40_016e_return_output := jmi_uxn_opcodes_h_l2890_c40_016e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c7_ec22] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_ec22_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_ec22_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_ec22_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_ec22_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_ec22_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_ec22_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_ec22_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_ec22_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_c50b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_ec22_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_f415_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_ec22_return_output;
     VAR_jsi_uxn_opcodes_h_l2891_c40_1108_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ac77_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_d1e9_iftrue := VAR_jmi_uxn_opcodes_h_l2890_c40_016e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c7_c50b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_c50b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_c50b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_c50b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_c50b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_c50b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_c50b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_c50b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_c50b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c1_f415] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_f415_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_f415_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_f415_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_f415_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_f415_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_f415_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_f415_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_f415_return_output;

     -- jsi[uxn_opcodes_h_l2891_c40_1108] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l2891_c40_1108_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l2891_c40_1108_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l2891_c40_1108_phase <= VAR_jsi_uxn_opcodes_h_l2891_c40_1108_phase;
     jsi_uxn_opcodes_h_l2891_c40_1108_pc <= VAR_jsi_uxn_opcodes_h_l2891_c40_1108_pc;
     jsi_uxn_opcodes_h_l2891_c40_1108_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l2891_c40_1108_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l2891_c40_1108_return_output := jsi_uxn_opcodes_h_l2891_c40_1108_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_aaaa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_c50b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0285_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_c50b_return_output;
     VAR_lit_uxn_opcodes_h_l2892_c40_0c64_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_f415_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_746b_iftrue := VAR_jsi_uxn_opcodes_h_l2891_c40_1108_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c7_aaaa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_aaaa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_aaaa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_aaaa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_aaaa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_aaaa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_aaaa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_aaaa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_aaaa_return_output;

     -- lit[uxn_opcodes_h_l2892_c40_0c64] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2892_c40_0c64_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2892_c40_0c64_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2892_c40_0c64_phase <= VAR_lit_uxn_opcodes_h_l2892_c40_0c64_phase;
     lit_uxn_opcodes_h_l2892_c40_0c64_pc <= VAR_lit_uxn_opcodes_h_l2892_c40_0c64_pc;
     lit_uxn_opcodes_h_l2892_c40_0c64_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2892_c40_0c64_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2892_c40_0c64_return_output := lit_uxn_opcodes_h_l2892_c40_0c64_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c1_0285] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0285_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0285_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0285_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0285_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0285_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0285_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0285_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0285_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_29cf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_aaaa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7dc5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_aaaa_return_output;
     VAR_lit2_uxn_opcodes_h_l2893_c40_5bdf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0285_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_ec22_iftrue := VAR_lit_uxn_opcodes_h_l2892_c40_0c64_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c1_7dc5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7dc5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7dc5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7dc5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7dc5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7dc5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7dc5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7dc5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7dc5_return_output;

     -- lit2[uxn_opcodes_h_l2893_c40_5bdf] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2893_c40_5bdf_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2893_c40_5bdf_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2893_c40_5bdf_phase <= VAR_lit2_uxn_opcodes_h_l2893_c40_5bdf_phase;
     lit2_uxn_opcodes_h_l2893_c40_5bdf_pc <= VAR_lit2_uxn_opcodes_h_l2893_c40_5bdf_pc;
     lit2_uxn_opcodes_h_l2893_c40_5bdf_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2893_c40_5bdf_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2893_c40_5bdf_return_output := lit2_uxn_opcodes_h_l2893_c40_5bdf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c7_29cf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_29cf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_29cf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_29cf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_29cf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_29cf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_29cf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_29cf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_29cf_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_9713_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_29cf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e95e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_29cf_return_output;
     VAR_lit_uxn_opcodes_h_l2894_c40_adf9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7dc5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_c50b_iftrue := VAR_lit2_uxn_opcodes_h_l2893_c40_5bdf_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c7_9713] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_9713_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_9713_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_9713_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_9713_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_9713_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_9713_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_9713_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_9713_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c1_e95e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e95e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e95e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e95e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e95e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e95e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e95e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e95e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e95e_return_output;

     -- lit[uxn_opcodes_h_l2894_c40_adf9] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2894_c40_adf9_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2894_c40_adf9_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2894_c40_adf9_phase <= VAR_lit_uxn_opcodes_h_l2894_c40_adf9_phase;
     lit_uxn_opcodes_h_l2894_c40_adf9_pc <= VAR_lit_uxn_opcodes_h_l2894_c40_adf9_pc;
     lit_uxn_opcodes_h_l2894_c40_adf9_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2894_c40_adf9_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2894_c40_adf9_return_output := lit_uxn_opcodes_h_l2894_c40_adf9_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_87b5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_9713_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9842_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_9713_return_output;
     VAR_lit2_uxn_opcodes_h_l2895_c40_0928_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e95e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_aaaa_iftrue := VAR_lit_uxn_opcodes_h_l2894_c40_adf9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c1_9842] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9842_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9842_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9842_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9842_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9842_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9842_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9842_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9842_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c7_87b5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_87b5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_87b5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_87b5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_87b5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_87b5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_87b5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_87b5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_87b5_return_output;

     -- lit2[uxn_opcodes_h_l2895_c40_0928] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2895_c40_0928_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2895_c40_0928_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2895_c40_0928_phase <= VAR_lit2_uxn_opcodes_h_l2895_c40_0928_phase;
     lit2_uxn_opcodes_h_l2895_c40_0928_pc <= VAR_lit2_uxn_opcodes_h_l2895_c40_0928_pc;
     lit2_uxn_opcodes_h_l2895_c40_0928_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2895_c40_0928_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2895_c40_0928_return_output := lit2_uxn_opcodes_h_l2895_c40_0928_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_a23b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_87b5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_16e8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_87b5_return_output;
     VAR_inc_uxn_opcodes_h_l2896_c40_6ea4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9842_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_29cf_iftrue := VAR_lit2_uxn_opcodes_h_l2895_c40_0928_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c1_16e8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_16e8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_16e8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_16e8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_16e8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_16e8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_16e8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_16e8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_16e8_return_output;

     -- inc[uxn_opcodes_h_l2896_c40_6ea4] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l2896_c40_6ea4_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l2896_c40_6ea4_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l2896_c40_6ea4_phase <= VAR_inc_uxn_opcodes_h_l2896_c40_6ea4_phase;
     inc_uxn_opcodes_h_l2896_c40_6ea4_ins <= VAR_inc_uxn_opcodes_h_l2896_c40_6ea4_ins;
     inc_uxn_opcodes_h_l2896_c40_6ea4_previous_stack_read <= VAR_inc_uxn_opcodes_h_l2896_c40_6ea4_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l2896_c40_6ea4_return_output := inc_uxn_opcodes_h_l2896_c40_6ea4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c7_a23b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_a23b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_a23b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_a23b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_a23b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_a23b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_a23b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_a23b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_a23b_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_3690_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_a23b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3ae6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_a23b_return_output;
     VAR_inc2_uxn_opcodes_h_l2897_c40_ad36_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_16e8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_9713_iftrue := VAR_inc_uxn_opcodes_h_l2896_c40_6ea4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_3690] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_3690_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_3690_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_3690_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_3690_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_3690_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_3690_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_3690_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_3690_return_output;

     -- inc2[uxn_opcodes_h_l2897_c40_ad36] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l2897_c40_ad36_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l2897_c40_ad36_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l2897_c40_ad36_phase <= VAR_inc2_uxn_opcodes_h_l2897_c40_ad36_phase;
     inc2_uxn_opcodes_h_l2897_c40_ad36_ins <= VAR_inc2_uxn_opcodes_h_l2897_c40_ad36_ins;
     inc2_uxn_opcodes_h_l2897_c40_ad36_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l2897_c40_ad36_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l2897_c40_ad36_return_output := inc2_uxn_opcodes_h_l2897_c40_ad36_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_3ae6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3ae6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3ae6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3ae6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3ae6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3ae6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3ae6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3ae6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3ae6_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6a50_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_3690_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_8843_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_3690_return_output;
     VAR_pop_uxn_opcodes_h_l2898_c40_b895_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3ae6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_87b5_iftrue := VAR_inc2_uxn_opcodes_h_l2897_c40_ad36_return_output;
     -- pop[uxn_opcodes_h_l2898_c40_b895] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l2898_c40_b895_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l2898_c40_b895_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l2898_c40_b895_phase <= VAR_pop_uxn_opcodes_h_l2898_c40_b895_phase;
     pop_uxn_opcodes_h_l2898_c40_b895_ins <= VAR_pop_uxn_opcodes_h_l2898_c40_b895_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l2898_c40_b895_return_output := pop_uxn_opcodes_h_l2898_c40_b895_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_8843] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_8843_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_8843_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_8843_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_8843_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_8843_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_8843_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_8843_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_8843_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_6a50] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6a50_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6a50_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6a50_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6a50_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6a50_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6a50_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6a50_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6a50_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9cc5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6a50_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a9cc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6a50_return_output;
     VAR_pop2_uxn_opcodes_h_l2899_c40_6f5f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_8843_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_a23b_iftrue := VAR_pop_uxn_opcodes_h_l2898_c40_b895_return_output;
     -- pop2[uxn_opcodes_h_l2899_c40_6f5f] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l2899_c40_6f5f_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l2899_c40_6f5f_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l2899_c40_6f5f_phase <= VAR_pop2_uxn_opcodes_h_l2899_c40_6f5f_phase;
     pop2_uxn_opcodes_h_l2899_c40_6f5f_ins <= VAR_pop2_uxn_opcodes_h_l2899_c40_6f5f_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l2899_c40_6f5f_return_output := pop2_uxn_opcodes_h_l2899_c40_6f5f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_9cc5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9cc5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9cc5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9cc5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9cc5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9cc5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9cc5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9cc5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9cc5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_a9cc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a9cc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a9cc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a9cc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a9cc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a9cc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a9cc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a9cc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a9cc_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_32d4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9cc5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f2fa_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9cc5_return_output;
     VAR_nip_uxn_opcodes_h_l2900_c40_753e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a9cc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_3690_iftrue := VAR_pop2_uxn_opcodes_h_l2899_c40_6f5f_return_output;
     -- nip[uxn_opcodes_h_l2900_c40_753e] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l2900_c40_753e_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l2900_c40_753e_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l2900_c40_753e_phase <= VAR_nip_uxn_opcodes_h_l2900_c40_753e_phase;
     nip_uxn_opcodes_h_l2900_c40_753e_ins <= VAR_nip_uxn_opcodes_h_l2900_c40_753e_ins;
     nip_uxn_opcodes_h_l2900_c40_753e_previous_stack_read <= VAR_nip_uxn_opcodes_h_l2900_c40_753e_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l2900_c40_753e_return_output := nip_uxn_opcodes_h_l2900_c40_753e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_f2fa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f2fa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f2fa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f2fa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f2fa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f2fa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f2fa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f2fa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f2fa_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_32d4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_32d4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_32d4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_32d4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_32d4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_32d4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_32d4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_32d4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_32d4_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_b588_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_32d4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_56f1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_32d4_return_output;
     VAR_nip2_uxn_opcodes_h_l2901_c40_6ffd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f2fa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6a50_iftrue := VAR_nip_uxn_opcodes_h_l2900_c40_753e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_56f1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_56f1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_56f1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_56f1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_56f1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_56f1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_56f1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_56f1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_56f1_return_output;

     -- nip2[uxn_opcodes_h_l2901_c40_6ffd] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l2901_c40_6ffd_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l2901_c40_6ffd_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l2901_c40_6ffd_phase <= VAR_nip2_uxn_opcodes_h_l2901_c40_6ffd_phase;
     nip2_uxn_opcodes_h_l2901_c40_6ffd_ins <= VAR_nip2_uxn_opcodes_h_l2901_c40_6ffd_ins;
     nip2_uxn_opcodes_h_l2901_c40_6ffd_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l2901_c40_6ffd_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l2901_c40_6ffd_return_output := nip2_uxn_opcodes_h_l2901_c40_6ffd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_b588] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_b588_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_b588_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_b588_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_b588_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_b588_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_b588_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_b588_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_b588_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_e57e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_b588_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_23fa_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_b588_return_output;
     VAR_swp_uxn_opcodes_h_l2902_c40_9de3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_56f1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_9cc5_iftrue := VAR_nip2_uxn_opcodes_h_l2901_c40_6ffd_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_e57e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_e57e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_e57e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_e57e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_e57e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_e57e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_e57e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_e57e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_e57e_return_output;

     -- swp[uxn_opcodes_h_l2902_c40_9de3] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l2902_c40_9de3_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l2902_c40_9de3_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l2902_c40_9de3_phase <= VAR_swp_uxn_opcodes_h_l2902_c40_9de3_phase;
     swp_uxn_opcodes_h_l2902_c40_9de3_ins <= VAR_swp_uxn_opcodes_h_l2902_c40_9de3_ins;
     swp_uxn_opcodes_h_l2902_c40_9de3_previous_stack_read <= VAR_swp_uxn_opcodes_h_l2902_c40_9de3_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l2902_c40_9de3_return_output := swp_uxn_opcodes_h_l2902_c40_9de3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_23fa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_23fa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_23fa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_23fa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_23fa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_23fa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_23fa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_23fa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_23fa_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_ebbd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_e57e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_41aa_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_e57e_return_output;
     VAR_swp2_uxn_opcodes_h_l2903_c40_6d9e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_23fa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_32d4_iftrue := VAR_swp_uxn_opcodes_h_l2902_c40_9de3_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_ebbd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_ebbd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_ebbd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_ebbd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_ebbd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_ebbd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_ebbd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_ebbd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_ebbd_return_output;

     -- swp2[uxn_opcodes_h_l2903_c40_6d9e] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l2903_c40_6d9e_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l2903_c40_6d9e_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l2903_c40_6d9e_phase <= VAR_swp2_uxn_opcodes_h_l2903_c40_6d9e_phase;
     swp2_uxn_opcodes_h_l2903_c40_6d9e_ins <= VAR_swp2_uxn_opcodes_h_l2903_c40_6d9e_ins;
     swp2_uxn_opcodes_h_l2903_c40_6d9e_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l2903_c40_6d9e_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l2903_c40_6d9e_return_output := swp2_uxn_opcodes_h_l2903_c40_6d9e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_41aa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_41aa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_41aa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_41aa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_41aa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_41aa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_41aa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_41aa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_41aa_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a749_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_ebbd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_d97c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_ebbd_return_output;
     VAR_rot_uxn_opcodes_h_l2904_c40_54be_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_41aa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_b588_iftrue := VAR_swp2_uxn_opcodes_h_l2903_c40_6d9e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_d97c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_d97c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_d97c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_d97c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_d97c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_d97c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_d97c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_d97c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_d97c_return_output;

     -- rot[uxn_opcodes_h_l2904_c40_54be] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l2904_c40_54be_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l2904_c40_54be_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l2904_c40_54be_phase <= VAR_rot_uxn_opcodes_h_l2904_c40_54be_phase;
     rot_uxn_opcodes_h_l2904_c40_54be_ins <= VAR_rot_uxn_opcodes_h_l2904_c40_54be_ins;
     rot_uxn_opcodes_h_l2904_c40_54be_previous_stack_read <= VAR_rot_uxn_opcodes_h_l2904_c40_54be_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l2904_c40_54be_return_output := rot_uxn_opcodes_h_l2904_c40_54be_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_a749] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a749_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a749_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a749_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a749_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a749_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a749_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a749_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a749_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cb2f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a749_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_ff2a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a749_return_output;
     VAR_rot2_uxn_opcodes_h_l2905_c40_023c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_d97c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_e57e_iftrue := VAR_rot_uxn_opcodes_h_l2904_c40_54be_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_ff2a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_ff2a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_ff2a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_ff2a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_ff2a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_ff2a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_ff2a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_ff2a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_ff2a_return_output;

     -- rot2[uxn_opcodes_h_l2905_c40_023c] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l2905_c40_023c_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l2905_c40_023c_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l2905_c40_023c_phase <= VAR_rot2_uxn_opcodes_h_l2905_c40_023c_phase;
     rot2_uxn_opcodes_h_l2905_c40_023c_ins <= VAR_rot2_uxn_opcodes_h_l2905_c40_023c_ins;
     rot2_uxn_opcodes_h_l2905_c40_023c_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l2905_c40_023c_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l2905_c40_023c_return_output := rot2_uxn_opcodes_h_l2905_c40_023c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_cb2f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cb2f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cb2f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cb2f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cb2f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cb2f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cb2f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cb2f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cb2f_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_0a31_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cb2f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_ea23_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cb2f_return_output;
     VAR_dup_uxn_opcodes_h_l2906_c40_86e1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_ff2a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_ebbd_iftrue := VAR_rot2_uxn_opcodes_h_l2905_c40_023c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_ea23] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_ea23_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_ea23_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_ea23_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_ea23_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_ea23_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_ea23_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_ea23_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_ea23_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_0a31] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_0a31_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_0a31_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_0a31_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_0a31_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_0a31_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_0a31_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_0a31_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_0a31_return_output;

     -- dup[uxn_opcodes_h_l2906_c40_86e1] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l2906_c40_86e1_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l2906_c40_86e1_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l2906_c40_86e1_phase <= VAR_dup_uxn_opcodes_h_l2906_c40_86e1_phase;
     dup_uxn_opcodes_h_l2906_c40_86e1_ins <= VAR_dup_uxn_opcodes_h_l2906_c40_86e1_ins;
     dup_uxn_opcodes_h_l2906_c40_86e1_previous_stack_read <= VAR_dup_uxn_opcodes_h_l2906_c40_86e1_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l2906_c40_86e1_return_output := dup_uxn_opcodes_h_l2906_c40_86e1_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a596_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_0a31_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ddb6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_0a31_return_output;
     VAR_dup2_uxn_opcodes_h_l2907_c40_a606_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_ea23_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a749_iftrue := VAR_dup_uxn_opcodes_h_l2906_c40_86e1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_ddb6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ddb6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ddb6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ddb6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ddb6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ddb6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ddb6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ddb6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ddb6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_a596] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a596_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a596_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a596_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a596_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a596_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a596_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a596_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a596_return_output;

     -- dup2[uxn_opcodes_h_l2907_c40_a606] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l2907_c40_a606_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l2907_c40_a606_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l2907_c40_a606_phase <= VAR_dup2_uxn_opcodes_h_l2907_c40_a606_phase;
     dup2_uxn_opcodes_h_l2907_c40_a606_ins <= VAR_dup2_uxn_opcodes_h_l2907_c40_a606_ins;
     dup2_uxn_opcodes_h_l2907_c40_a606_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l2907_c40_a606_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l2907_c40_a606_return_output := dup2_uxn_opcodes_h_l2907_c40_a606_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e87b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a596_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cbb0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_a596_return_output;
     VAR_ovr_uxn_opcodes_h_l2908_c40_05b8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_ddb6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_cb2f_iftrue := VAR_dup2_uxn_opcodes_h_l2907_c40_a606_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_cbb0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cbb0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cbb0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cbb0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cbb0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cbb0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cbb0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cbb0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cbb0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_e87b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e87b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e87b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e87b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e87b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e87b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e87b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e87b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e87b_return_output;

     -- ovr[uxn_opcodes_h_l2908_c40_05b8] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l2908_c40_05b8_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l2908_c40_05b8_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l2908_c40_05b8_phase <= VAR_ovr_uxn_opcodes_h_l2908_c40_05b8_phase;
     ovr_uxn_opcodes_h_l2908_c40_05b8_ins <= VAR_ovr_uxn_opcodes_h_l2908_c40_05b8_ins;
     ovr_uxn_opcodes_h_l2908_c40_05b8_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l2908_c40_05b8_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l2908_c40_05b8_return_output := ovr_uxn_opcodes_h_l2908_c40_05b8_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_dfda_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e87b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_b7a7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e87b_return_output;
     VAR_ovr2_uxn_opcodes_h_l2909_c40_f341_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cbb0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_0a31_iftrue := VAR_ovr_uxn_opcodes_h_l2908_c40_05b8_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_b7a7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_b7a7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_b7a7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_b7a7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_b7a7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_b7a7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_b7a7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_b7a7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_b7a7_return_output;

     -- ovr2[uxn_opcodes_h_l2909_c40_f341] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l2909_c40_f341_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l2909_c40_f341_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l2909_c40_f341_phase <= VAR_ovr2_uxn_opcodes_h_l2909_c40_f341_phase;
     ovr2_uxn_opcodes_h_l2909_c40_f341_ins <= VAR_ovr2_uxn_opcodes_h_l2909_c40_f341_ins;
     ovr2_uxn_opcodes_h_l2909_c40_f341_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l2909_c40_f341_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l2909_c40_f341_return_output := ovr2_uxn_opcodes_h_l2909_c40_f341_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_dfda] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_dfda_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_dfda_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_dfda_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_dfda_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_dfda_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_dfda_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_dfda_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_dfda_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_68c9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_dfda_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1e87_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_dfda_return_output;
     VAR_equ_uxn_opcodes_h_l2910_c40_e3d3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_b7a7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_a596_iftrue := VAR_ovr2_uxn_opcodes_h_l2909_c40_f341_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_68c9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_68c9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_68c9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_68c9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_68c9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_68c9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_68c9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_68c9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_68c9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_1e87] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1e87_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1e87_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1e87_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1e87_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1e87_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1e87_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1e87_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1e87_return_output;

     -- equ[uxn_opcodes_h_l2910_c40_e3d3] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l2910_c40_e3d3_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l2910_c40_e3d3_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l2910_c40_e3d3_phase <= VAR_equ_uxn_opcodes_h_l2910_c40_e3d3_phase;
     equ_uxn_opcodes_h_l2910_c40_e3d3_ins <= VAR_equ_uxn_opcodes_h_l2910_c40_e3d3_ins;
     equ_uxn_opcodes_h_l2910_c40_e3d3_previous_stack_read <= VAR_equ_uxn_opcodes_h_l2910_c40_e3d3_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l2910_c40_e3d3_return_output := equ_uxn_opcodes_h_l2910_c40_e3d3_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9e8d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_68c9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_2c9c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_68c9_return_output;
     VAR_equ2_uxn_opcodes_h_l2911_c40_302d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_1e87_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_e87b_iftrue := VAR_equ_uxn_opcodes_h_l2910_c40_e3d3_return_output;
     -- equ2[uxn_opcodes_h_l2911_c40_302d] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l2911_c40_302d_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l2911_c40_302d_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l2911_c40_302d_phase <= VAR_equ2_uxn_opcodes_h_l2911_c40_302d_phase;
     equ2_uxn_opcodes_h_l2911_c40_302d_ins <= VAR_equ2_uxn_opcodes_h_l2911_c40_302d_ins;
     equ2_uxn_opcodes_h_l2911_c40_302d_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l2911_c40_302d_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l2911_c40_302d_return_output := equ2_uxn_opcodes_h_l2911_c40_302d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_2c9c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_2c9c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_2c9c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_2c9c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_2c9c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_2c9c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_2c9c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_2c9c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_2c9c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_9e8d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9e8d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9e8d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9e8d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9e8d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9e8d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9e8d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9e8d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9e8d_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_bde8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9e8d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_b75d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9e8d_return_output;
     VAR_neq_uxn_opcodes_h_l2912_c40_0457_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_2c9c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_dfda_iftrue := VAR_equ2_uxn_opcodes_h_l2911_c40_302d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_bde8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_bde8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_bde8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_bde8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_bde8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_bde8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_bde8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_bde8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_bde8_return_output;

     -- neq[uxn_opcodes_h_l2912_c40_0457] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l2912_c40_0457_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l2912_c40_0457_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l2912_c40_0457_phase <= VAR_neq_uxn_opcodes_h_l2912_c40_0457_phase;
     neq_uxn_opcodes_h_l2912_c40_0457_ins <= VAR_neq_uxn_opcodes_h_l2912_c40_0457_ins;
     neq_uxn_opcodes_h_l2912_c40_0457_previous_stack_read <= VAR_neq_uxn_opcodes_h_l2912_c40_0457_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l2912_c40_0457_return_output := neq_uxn_opcodes_h_l2912_c40_0457_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_b75d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_b75d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_b75d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_b75d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_b75d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_b75d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_b75d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_b75d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_b75d_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5202_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_bde8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49b6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_bde8_return_output;
     VAR_neq2_uxn_opcodes_h_l2913_c40_c7bd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_b75d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_68c9_iftrue := VAR_neq_uxn_opcodes_h_l2912_c40_0457_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_5202] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5202_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5202_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5202_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5202_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5202_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5202_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5202_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5202_return_output;

     -- neq2[uxn_opcodes_h_l2913_c40_c7bd] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l2913_c40_c7bd_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l2913_c40_c7bd_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l2913_c40_c7bd_phase <= VAR_neq2_uxn_opcodes_h_l2913_c40_c7bd_phase;
     neq2_uxn_opcodes_h_l2913_c40_c7bd_ins <= VAR_neq2_uxn_opcodes_h_l2913_c40_c7bd_ins;
     neq2_uxn_opcodes_h_l2913_c40_c7bd_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l2913_c40_c7bd_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l2913_c40_c7bd_return_output := neq2_uxn_opcodes_h_l2913_c40_c7bd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_49b6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49b6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49b6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49b6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49b6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49b6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49b6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49b6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49b6_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a6f1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5202_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f3a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5202_return_output;
     VAR_gth_uxn_opcodes_h_l2914_c40_8de9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_49b6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_9e8d_iftrue := VAR_neq2_uxn_opcodes_h_l2913_c40_c7bd_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_a6f1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a6f1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a6f1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a6f1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a6f1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a6f1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a6f1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a6f1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a6f1_return_output;

     -- gth[uxn_opcodes_h_l2914_c40_8de9] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l2914_c40_8de9_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l2914_c40_8de9_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l2914_c40_8de9_phase <= VAR_gth_uxn_opcodes_h_l2914_c40_8de9_phase;
     gth_uxn_opcodes_h_l2914_c40_8de9_ins <= VAR_gth_uxn_opcodes_h_l2914_c40_8de9_ins;
     gth_uxn_opcodes_h_l2914_c40_8de9_previous_stack_read <= VAR_gth_uxn_opcodes_h_l2914_c40_8de9_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l2914_c40_8de9_return_output := gth_uxn_opcodes_h_l2914_c40_8de9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_8f3a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f3a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f3a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f3a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f3a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f3a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f3a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f3a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f3a_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_0a1d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a6f1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dd74_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a6f1_return_output;
     VAR_gth2_uxn_opcodes_h_l2915_c40_00e4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f3a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_bde8_iftrue := VAR_gth_uxn_opcodes_h_l2914_c40_8de9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_dd74] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dd74_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dd74_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dd74_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dd74_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dd74_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dd74_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dd74_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dd74_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_0a1d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_0a1d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_0a1d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_0a1d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_0a1d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_0a1d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_0a1d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_0a1d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_0a1d_return_output;

     -- gth2[uxn_opcodes_h_l2915_c40_00e4] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l2915_c40_00e4_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l2915_c40_00e4_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l2915_c40_00e4_phase <= VAR_gth2_uxn_opcodes_h_l2915_c40_00e4_phase;
     gth2_uxn_opcodes_h_l2915_c40_00e4_ins <= VAR_gth2_uxn_opcodes_h_l2915_c40_00e4_ins;
     gth2_uxn_opcodes_h_l2915_c40_00e4_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l2915_c40_00e4_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l2915_c40_00e4_return_output := gth2_uxn_opcodes_h_l2915_c40_00e4_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_3ae2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_0a1d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_005b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_0a1d_return_output;
     VAR_lth_uxn_opcodes_h_l2916_c40_7107_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dd74_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_5202_iftrue := VAR_gth2_uxn_opcodes_h_l2915_c40_00e4_return_output;
     -- lth[uxn_opcodes_h_l2916_c40_7107] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l2916_c40_7107_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l2916_c40_7107_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l2916_c40_7107_phase <= VAR_lth_uxn_opcodes_h_l2916_c40_7107_phase;
     lth_uxn_opcodes_h_l2916_c40_7107_ins <= VAR_lth_uxn_opcodes_h_l2916_c40_7107_ins;
     lth_uxn_opcodes_h_l2916_c40_7107_previous_stack_read <= VAR_lth_uxn_opcodes_h_l2916_c40_7107_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l2916_c40_7107_return_output := lth_uxn_opcodes_h_l2916_c40_7107_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_005b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_005b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_005b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_005b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_005b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_005b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_005b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_005b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_005b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_3ae2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_3ae2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_3ae2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_3ae2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_3ae2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_3ae2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_3ae2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_3ae2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_3ae2_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4fd5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_3ae2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_1eb0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_3ae2_return_output;
     VAR_lth2_uxn_opcodes_h_l2917_c40_42af_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_005b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_a6f1_iftrue := VAR_lth_uxn_opcodes_h_l2916_c40_7107_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_1eb0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_1eb0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_1eb0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_1eb0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_1eb0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_1eb0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_1eb0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_1eb0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_1eb0_return_output;

     -- lth2[uxn_opcodes_h_l2917_c40_42af] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l2917_c40_42af_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l2917_c40_42af_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l2917_c40_42af_phase <= VAR_lth2_uxn_opcodes_h_l2917_c40_42af_phase;
     lth2_uxn_opcodes_h_l2917_c40_42af_ins <= VAR_lth2_uxn_opcodes_h_l2917_c40_42af_ins;
     lth2_uxn_opcodes_h_l2917_c40_42af_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l2917_c40_42af_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l2917_c40_42af_return_output := lth2_uxn_opcodes_h_l2917_c40_42af_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_4fd5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4fd5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4fd5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4fd5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4fd5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4fd5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4fd5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4fd5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4fd5_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_f5d0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4fd5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4001_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4fd5_return_output;
     VAR_jmp_uxn_opcodes_h_l2918_c40_4281_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_1eb0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_0a1d_iftrue := VAR_lth2_uxn_opcodes_h_l2917_c40_42af_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_f5d0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_f5d0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_f5d0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_f5d0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_f5d0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_f5d0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_f5d0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_f5d0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_f5d0_return_output;

     -- jmp[uxn_opcodes_h_l2918_c40_4281] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l2918_c40_4281_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l2918_c40_4281_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l2918_c40_4281_phase <= VAR_jmp_uxn_opcodes_h_l2918_c40_4281_phase;
     jmp_uxn_opcodes_h_l2918_c40_4281_ins <= VAR_jmp_uxn_opcodes_h_l2918_c40_4281_ins;
     jmp_uxn_opcodes_h_l2918_c40_4281_pc <= VAR_jmp_uxn_opcodes_h_l2918_c40_4281_pc;
     jmp_uxn_opcodes_h_l2918_c40_4281_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l2918_c40_4281_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l2918_c40_4281_return_output := jmp_uxn_opcodes_h_l2918_c40_4281_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_4001] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4001_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4001_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4001_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4001_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4001_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4001_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4001_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4001_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c7fd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_f5d0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e7bc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_f5d0_return_output;
     VAR_jmp2_uxn_opcodes_h_l2919_c40_6d2a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4001_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_3ae2_iftrue := VAR_jmp_uxn_opcodes_h_l2918_c40_4281_return_output;
     -- jmp2[uxn_opcodes_h_l2919_c40_6d2a] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l2919_c40_6d2a_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l2919_c40_6d2a_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l2919_c40_6d2a_phase <= VAR_jmp2_uxn_opcodes_h_l2919_c40_6d2a_phase;
     jmp2_uxn_opcodes_h_l2919_c40_6d2a_ins <= VAR_jmp2_uxn_opcodes_h_l2919_c40_6d2a_ins;
     jmp2_uxn_opcodes_h_l2919_c40_6d2a_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l2919_c40_6d2a_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l2919_c40_6d2a_return_output := jmp2_uxn_opcodes_h_l2919_c40_6d2a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_e7bc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e7bc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e7bc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e7bc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e7bc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e7bc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e7bc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e7bc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e7bc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_c7fd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c7fd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c7fd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c7fd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c7fd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c7fd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c7fd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c7fd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c7fd_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2c7b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c7fd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0be6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c7fd_return_output;
     VAR_jcn_uxn_opcodes_h_l2920_c40_a6de_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e7bc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4fd5_iftrue := VAR_jmp2_uxn_opcodes_h_l2919_c40_6d2a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_2c7b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2c7b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2c7b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2c7b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2c7b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2c7b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2c7b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2c7b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2c7b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_0be6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0be6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0be6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0be6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0be6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0be6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0be6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0be6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0be6_return_output;

     -- jcn[uxn_opcodes_h_l2920_c40_a6de] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l2920_c40_a6de_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l2920_c40_a6de_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l2920_c40_a6de_phase <= VAR_jcn_uxn_opcodes_h_l2920_c40_a6de_phase;
     jcn_uxn_opcodes_h_l2920_c40_a6de_ins <= VAR_jcn_uxn_opcodes_h_l2920_c40_a6de_ins;
     jcn_uxn_opcodes_h_l2920_c40_a6de_pc <= VAR_jcn_uxn_opcodes_h_l2920_c40_a6de_pc;
     jcn_uxn_opcodes_h_l2920_c40_a6de_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l2920_c40_a6de_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l2920_c40_a6de_return_output := jcn_uxn_opcodes_h_l2920_c40_a6de_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_3326_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2c7b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6611_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2c7b_return_output;
     VAR_jcn2_uxn_opcodes_h_l2921_c40_76ba_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_0be6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_f5d0_iftrue := VAR_jcn_uxn_opcodes_h_l2920_c40_a6de_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_6611] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6611_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6611_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6611_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6611_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6611_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6611_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6611_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6611_return_output;

     -- jcn2[uxn_opcodes_h_l2921_c40_76ba] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l2921_c40_76ba_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l2921_c40_76ba_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l2921_c40_76ba_phase <= VAR_jcn2_uxn_opcodes_h_l2921_c40_76ba_phase;
     jcn2_uxn_opcodes_h_l2921_c40_76ba_ins <= VAR_jcn2_uxn_opcodes_h_l2921_c40_76ba_ins;
     jcn2_uxn_opcodes_h_l2921_c40_76ba_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l2921_c40_76ba_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l2921_c40_76ba_return_output := jcn2_uxn_opcodes_h_l2921_c40_76ba_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_3326] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_3326_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_3326_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_3326_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_3326_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_3326_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_3326_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_3326_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_3326_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_3b0c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_3326_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_834c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_3326_return_output;
     VAR_jsr_uxn_opcodes_h_l2922_c40_af3d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6611_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_c7fd_iftrue := VAR_jcn2_uxn_opcodes_h_l2921_c40_76ba_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_834c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_834c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_834c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_834c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_834c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_834c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_834c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_834c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_834c_return_output;

     -- jsr[uxn_opcodes_h_l2922_c40_af3d] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l2922_c40_af3d_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l2922_c40_af3d_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l2922_c40_af3d_phase <= VAR_jsr_uxn_opcodes_h_l2922_c40_af3d_phase;
     jsr_uxn_opcodes_h_l2922_c40_af3d_ins <= VAR_jsr_uxn_opcodes_h_l2922_c40_af3d_ins;
     jsr_uxn_opcodes_h_l2922_c40_af3d_pc <= VAR_jsr_uxn_opcodes_h_l2922_c40_af3d_pc;
     jsr_uxn_opcodes_h_l2922_c40_af3d_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l2922_c40_af3d_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l2922_c40_af3d_return_output := jsr_uxn_opcodes_h_l2922_c40_af3d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_3b0c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_3b0c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_3b0c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_3b0c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_3b0c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_3b0c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_3b0c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_3b0c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_3b0c_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5f5a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_3b0c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cfc1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_3b0c_return_output;
     VAR_jsr2_uxn_opcodes_h_l2923_c40_260a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_834c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_2c7b_iftrue := VAR_jsr_uxn_opcodes_h_l2922_c40_af3d_return_output;
     -- jsr2[uxn_opcodes_h_l2923_c40_260a] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l2923_c40_260a_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l2923_c40_260a_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l2923_c40_260a_phase <= VAR_jsr2_uxn_opcodes_h_l2923_c40_260a_phase;
     jsr2_uxn_opcodes_h_l2923_c40_260a_ins <= VAR_jsr2_uxn_opcodes_h_l2923_c40_260a_ins;
     jsr2_uxn_opcodes_h_l2923_c40_260a_pc <= VAR_jsr2_uxn_opcodes_h_l2923_c40_260a_pc;
     jsr2_uxn_opcodes_h_l2923_c40_260a_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l2923_c40_260a_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l2923_c40_260a_return_output := jsr2_uxn_opcodes_h_l2923_c40_260a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_cfc1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cfc1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cfc1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cfc1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cfc1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cfc1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cfc1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cfc1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cfc1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_5f5a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5f5a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5f5a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5f5a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5f5a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5f5a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5f5a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5f5a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5f5a_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_37ec_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5f5a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_0c9d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_5f5a_return_output;
     VAR_sth_uxn_opcodes_h_l2924_c40_11c5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cfc1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_3326_iftrue := VAR_jsr2_uxn_opcodes_h_l2923_c40_260a_return_output;
     -- sth[uxn_opcodes_h_l2924_c40_11c5] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l2924_c40_11c5_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l2924_c40_11c5_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l2924_c40_11c5_phase <= VAR_sth_uxn_opcodes_h_l2924_c40_11c5_phase;
     sth_uxn_opcodes_h_l2924_c40_11c5_ins <= VAR_sth_uxn_opcodes_h_l2924_c40_11c5_ins;
     sth_uxn_opcodes_h_l2924_c40_11c5_previous_stack_read <= VAR_sth_uxn_opcodes_h_l2924_c40_11c5_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l2924_c40_11c5_return_output := sth_uxn_opcodes_h_l2924_c40_11c5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_37ec] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_37ec_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_37ec_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_37ec_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_37ec_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_37ec_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_37ec_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_37ec_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_37ec_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_0c9d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_0c9d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_0c9d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_0c9d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_0c9d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_0c9d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_0c9d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_0c9d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_0c9d_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_b5ec_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_37ec_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0fd3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_37ec_return_output;
     VAR_sth2_uxn_opcodes_h_l2925_c40_a95d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_0c9d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_3b0c_iftrue := VAR_sth_uxn_opcodes_h_l2924_c40_11c5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_b5ec] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_b5ec_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_b5ec_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_b5ec_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_b5ec_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_b5ec_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_b5ec_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_b5ec_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_b5ec_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_0fd3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0fd3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0fd3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0fd3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0fd3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0fd3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0fd3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0fd3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0fd3_return_output;

     -- sth2[uxn_opcodes_h_l2925_c40_a95d] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l2925_c40_a95d_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l2925_c40_a95d_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l2925_c40_a95d_phase <= VAR_sth2_uxn_opcodes_h_l2925_c40_a95d_phase;
     sth2_uxn_opcodes_h_l2925_c40_a95d_ins <= VAR_sth2_uxn_opcodes_h_l2925_c40_a95d_ins;
     sth2_uxn_opcodes_h_l2925_c40_a95d_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l2925_c40_a95d_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l2925_c40_a95d_return_output := sth2_uxn_opcodes_h_l2925_c40_a95d_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_1614_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_b5ec_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d41e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_b5ec_return_output;
     VAR_ldz_uxn_opcodes_h_l2926_c40_329e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0fd3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_5f5a_iftrue := VAR_sth2_uxn_opcodes_h_l2925_c40_a95d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_1614] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_1614_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_1614_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_1614_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_1614_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_1614_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_1614_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_1614_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_1614_return_output;

     -- ldz[uxn_opcodes_h_l2926_c40_329e] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l2926_c40_329e_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l2926_c40_329e_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l2926_c40_329e_phase <= VAR_ldz_uxn_opcodes_h_l2926_c40_329e_phase;
     ldz_uxn_opcodes_h_l2926_c40_329e_ins <= VAR_ldz_uxn_opcodes_h_l2926_c40_329e_ins;
     ldz_uxn_opcodes_h_l2926_c40_329e_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l2926_c40_329e_previous_stack_read;
     ldz_uxn_opcodes_h_l2926_c40_329e_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l2926_c40_329e_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l2926_c40_329e_return_output := ldz_uxn_opcodes_h_l2926_c40_329e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_d41e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d41e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d41e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d41e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d41e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d41e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d41e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d41e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d41e_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3315_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_1614_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1f32_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_1614_return_output;
     VAR_ldz2_uxn_opcodes_h_l2927_c40_db58_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d41e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_37ec_iftrue := VAR_ldz_uxn_opcodes_h_l2926_c40_329e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_3315] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3315_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3315_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3315_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3315_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3315_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3315_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3315_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3315_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_1f32] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1f32_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1f32_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1f32_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1f32_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1f32_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1f32_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1f32_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1f32_return_output;

     -- ldz2[uxn_opcodes_h_l2927_c40_db58] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l2927_c40_db58_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l2927_c40_db58_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l2927_c40_db58_phase <= VAR_ldz2_uxn_opcodes_h_l2927_c40_db58_phase;
     ldz2_uxn_opcodes_h_l2927_c40_db58_ins <= VAR_ldz2_uxn_opcodes_h_l2927_c40_db58_ins;
     ldz2_uxn_opcodes_h_l2927_c40_db58_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l2927_c40_db58_previous_stack_read;
     ldz2_uxn_opcodes_h_l2927_c40_db58_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l2927_c40_db58_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l2927_c40_db58_return_output := ldz2_uxn_opcodes_h_l2927_c40_db58_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b62e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3315_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_fe97_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3315_return_output;
     VAR_stz_uxn_opcodes_h_l2928_c40_0ad0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_1f32_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_b5ec_iftrue := VAR_ldz2_uxn_opcodes_h_l2927_c40_db58_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_fe97] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_fe97_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_fe97_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_fe97_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_fe97_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_fe97_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_fe97_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_fe97_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_fe97_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_b62e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b62e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b62e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b62e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b62e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b62e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b62e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b62e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b62e_return_output;

     -- stz[uxn_opcodes_h_l2928_c40_0ad0] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l2928_c40_0ad0_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l2928_c40_0ad0_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l2928_c40_0ad0_phase <= VAR_stz_uxn_opcodes_h_l2928_c40_0ad0_phase;
     stz_uxn_opcodes_h_l2928_c40_0ad0_ins <= VAR_stz_uxn_opcodes_h_l2928_c40_0ad0_ins;
     stz_uxn_opcodes_h_l2928_c40_0ad0_previous_stack_read <= VAR_stz_uxn_opcodes_h_l2928_c40_0ad0_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l2928_c40_0ad0_return_output := stz_uxn_opcodes_h_l2928_c40_0ad0_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d4d2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b62e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_1c17_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b62e_return_output;
     VAR_stz2_uxn_opcodes_h_l2929_c40_b1ae_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_fe97_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_1614_iftrue := VAR_stz_uxn_opcodes_h_l2928_c40_0ad0_return_output;
     -- stz2[uxn_opcodes_h_l2929_c40_b1ae] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l2929_c40_b1ae_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l2929_c40_b1ae_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l2929_c40_b1ae_phase <= VAR_stz2_uxn_opcodes_h_l2929_c40_b1ae_phase;
     stz2_uxn_opcodes_h_l2929_c40_b1ae_ins <= VAR_stz2_uxn_opcodes_h_l2929_c40_b1ae_ins;
     stz2_uxn_opcodes_h_l2929_c40_b1ae_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l2929_c40_b1ae_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l2929_c40_b1ae_return_output := stz2_uxn_opcodes_h_l2929_c40_b1ae_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_d4d2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d4d2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d4d2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d4d2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d4d2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d4d2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d4d2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d4d2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d4d2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_1c17] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_1c17_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_1c17_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_1c17_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_1c17_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_1c17_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_1c17_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_1c17_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_1c17_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_95e1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d4d2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b973_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d4d2_return_output;
     VAR_ldr_uxn_opcodes_h_l2930_c40_6955_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_1c17_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_3315_iftrue := VAR_stz2_uxn_opcodes_h_l2929_c40_b1ae_return_output;
     -- ldr[uxn_opcodes_h_l2930_c40_6955] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l2930_c40_6955_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l2930_c40_6955_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l2930_c40_6955_phase <= VAR_ldr_uxn_opcodes_h_l2930_c40_6955_phase;
     ldr_uxn_opcodes_h_l2930_c40_6955_ins <= VAR_ldr_uxn_opcodes_h_l2930_c40_6955_ins;
     ldr_uxn_opcodes_h_l2930_c40_6955_pc <= VAR_ldr_uxn_opcodes_h_l2930_c40_6955_pc;
     ldr_uxn_opcodes_h_l2930_c40_6955_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l2930_c40_6955_previous_stack_read;
     ldr_uxn_opcodes_h_l2930_c40_6955_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l2930_c40_6955_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l2930_c40_6955_return_output := ldr_uxn_opcodes_h_l2930_c40_6955_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_b973] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b973_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b973_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b973_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b973_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b973_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b973_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b973_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b973_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_95e1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_95e1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_95e1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_95e1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_95e1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_95e1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_95e1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_95e1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_95e1_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_dc0f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_95e1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_715d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_95e1_return_output;
     VAR_ldr2_uxn_opcodes_h_l2931_c40_8a7e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b973_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b62e_iftrue := VAR_ldr_uxn_opcodes_h_l2930_c40_6955_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_715d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_715d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_715d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_715d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_715d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_715d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_715d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_715d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_715d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_dc0f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_dc0f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_dc0f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_dc0f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_dc0f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_dc0f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_dc0f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_dc0f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_dc0f_return_output;

     -- ldr2[uxn_opcodes_h_l2931_c40_8a7e] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l2931_c40_8a7e_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l2931_c40_8a7e_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l2931_c40_8a7e_phase <= VAR_ldr2_uxn_opcodes_h_l2931_c40_8a7e_phase;
     ldr2_uxn_opcodes_h_l2931_c40_8a7e_ins <= VAR_ldr2_uxn_opcodes_h_l2931_c40_8a7e_ins;
     ldr2_uxn_opcodes_h_l2931_c40_8a7e_pc <= VAR_ldr2_uxn_opcodes_h_l2931_c40_8a7e_pc;
     ldr2_uxn_opcodes_h_l2931_c40_8a7e_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l2931_c40_8a7e_previous_stack_read;
     ldr2_uxn_opcodes_h_l2931_c40_8a7e_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l2931_c40_8a7e_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l2931_c40_8a7e_return_output := ldr2_uxn_opcodes_h_l2931_c40_8a7e_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c7e8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_dc0f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_6d5f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_dc0f_return_output;
     VAR_str1_uxn_opcodes_h_l2932_c40_f6ac_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_715d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_d4d2_iftrue := VAR_ldr2_uxn_opcodes_h_l2931_c40_8a7e_return_output;
     -- str1[uxn_opcodes_h_l2932_c40_f6ac] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l2932_c40_f6ac_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l2932_c40_f6ac_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l2932_c40_f6ac_phase <= VAR_str1_uxn_opcodes_h_l2932_c40_f6ac_phase;
     str1_uxn_opcodes_h_l2932_c40_f6ac_ins <= VAR_str1_uxn_opcodes_h_l2932_c40_f6ac_ins;
     str1_uxn_opcodes_h_l2932_c40_f6ac_pc <= VAR_str1_uxn_opcodes_h_l2932_c40_f6ac_pc;
     str1_uxn_opcodes_h_l2932_c40_f6ac_previous_stack_read <= VAR_str1_uxn_opcodes_h_l2932_c40_f6ac_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l2932_c40_f6ac_return_output := str1_uxn_opcodes_h_l2932_c40_f6ac_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_6d5f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_6d5f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_6d5f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_6d5f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_6d5f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_6d5f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_6d5f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_6d5f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_6d5f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_c7e8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c7e8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c7e8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c7e8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c7e8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c7e8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c7e8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c7e8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c7e8_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_6a6b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c7e8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6ea2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c7e8_return_output;
     VAR_str2_uxn_opcodes_h_l2933_c40_5b53_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_6d5f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_95e1_iftrue := VAR_str1_uxn_opcodes_h_l2932_c40_f6ac_return_output;
     -- str2[uxn_opcodes_h_l2933_c40_5b53] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l2933_c40_5b53_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l2933_c40_5b53_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l2933_c40_5b53_phase <= VAR_str2_uxn_opcodes_h_l2933_c40_5b53_phase;
     str2_uxn_opcodes_h_l2933_c40_5b53_ins <= VAR_str2_uxn_opcodes_h_l2933_c40_5b53_ins;
     str2_uxn_opcodes_h_l2933_c40_5b53_pc <= VAR_str2_uxn_opcodes_h_l2933_c40_5b53_pc;
     str2_uxn_opcodes_h_l2933_c40_5b53_previous_stack_read <= VAR_str2_uxn_opcodes_h_l2933_c40_5b53_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l2933_c40_5b53_return_output := str2_uxn_opcodes_h_l2933_c40_5b53_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_6ea2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6ea2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6ea2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6ea2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6ea2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6ea2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6ea2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6ea2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6ea2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_6a6b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_6a6b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_6a6b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_6a6b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_6a6b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_6a6b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_6a6b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_6a6b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_6a6b_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7dd8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_6a6b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_43f3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_6a6b_return_output;
     VAR_lda_uxn_opcodes_h_l2934_c40_1c91_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6ea2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_dc0f_iftrue := VAR_str2_uxn_opcodes_h_l2933_c40_5b53_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_7dd8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7dd8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7dd8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7dd8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7dd8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7dd8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7dd8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7dd8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7dd8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_43f3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_43f3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_43f3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_43f3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_43f3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_43f3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_43f3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_43f3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_43f3_return_output;

     -- lda[uxn_opcodes_h_l2934_c40_1c91] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l2934_c40_1c91_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l2934_c40_1c91_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l2934_c40_1c91_phase <= VAR_lda_uxn_opcodes_h_l2934_c40_1c91_phase;
     lda_uxn_opcodes_h_l2934_c40_1c91_ins <= VAR_lda_uxn_opcodes_h_l2934_c40_1c91_ins;
     lda_uxn_opcodes_h_l2934_c40_1c91_previous_stack_read <= VAR_lda_uxn_opcodes_h_l2934_c40_1c91_previous_stack_read;
     lda_uxn_opcodes_h_l2934_c40_1c91_previous_ram_read <= VAR_lda_uxn_opcodes_h_l2934_c40_1c91_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l2934_c40_1c91_return_output := lda_uxn_opcodes_h_l2934_c40_1c91_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5294_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7dd8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_408e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7dd8_return_output;
     VAR_lda2_uxn_opcodes_h_l2935_c40_809d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_43f3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_c7e8_iftrue := VAR_lda_uxn_opcodes_h_l2934_c40_1c91_return_output;
     -- lda2[uxn_opcodes_h_l2935_c40_809d] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l2935_c40_809d_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l2935_c40_809d_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l2935_c40_809d_phase <= VAR_lda2_uxn_opcodes_h_l2935_c40_809d_phase;
     lda2_uxn_opcodes_h_l2935_c40_809d_ins <= VAR_lda2_uxn_opcodes_h_l2935_c40_809d_ins;
     lda2_uxn_opcodes_h_l2935_c40_809d_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l2935_c40_809d_previous_stack_read;
     lda2_uxn_opcodes_h_l2935_c40_809d_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l2935_c40_809d_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l2935_c40_809d_return_output := lda2_uxn_opcodes_h_l2935_c40_809d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_408e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_408e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_408e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_408e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_408e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_408e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_408e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_408e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_408e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_5294] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5294_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5294_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5294_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5294_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5294_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5294_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5294_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5294_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_221d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5294_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b02b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5294_return_output;
     VAR_sta_uxn_opcodes_h_l2936_c40_b61e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_408e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_6a6b_iftrue := VAR_lda2_uxn_opcodes_h_l2935_c40_809d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_b02b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b02b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b02b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b02b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b02b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b02b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b02b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b02b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b02b_return_output;

     -- sta[uxn_opcodes_h_l2936_c40_b61e] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l2936_c40_b61e_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l2936_c40_b61e_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l2936_c40_b61e_phase <= VAR_sta_uxn_opcodes_h_l2936_c40_b61e_phase;
     sta_uxn_opcodes_h_l2936_c40_b61e_ins <= VAR_sta_uxn_opcodes_h_l2936_c40_b61e_ins;
     sta_uxn_opcodes_h_l2936_c40_b61e_previous_stack_read <= VAR_sta_uxn_opcodes_h_l2936_c40_b61e_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l2936_c40_b61e_return_output := sta_uxn_opcodes_h_l2936_c40_b61e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_221d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_221d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_221d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_221d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_221d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_221d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_221d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_221d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_221d_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_0eb4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_221d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_bfd0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_221d_return_output;
     VAR_sta2_uxn_opcodes_h_l2937_c40_0c6c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b02b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_7dd8_iftrue := VAR_sta_uxn_opcodes_h_l2936_c40_b61e_return_output;
     -- sta2[uxn_opcodes_h_l2937_c40_0c6c] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l2937_c40_0c6c_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l2937_c40_0c6c_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l2937_c40_0c6c_phase <= VAR_sta2_uxn_opcodes_h_l2937_c40_0c6c_phase;
     sta2_uxn_opcodes_h_l2937_c40_0c6c_ins <= VAR_sta2_uxn_opcodes_h_l2937_c40_0c6c_ins;
     sta2_uxn_opcodes_h_l2937_c40_0c6c_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l2937_c40_0c6c_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l2937_c40_0c6c_return_output := sta2_uxn_opcodes_h_l2937_c40_0c6c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_0eb4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_0eb4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_0eb4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_0eb4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_0eb4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_0eb4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_0eb4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_0eb4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_0eb4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_bfd0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_bfd0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_bfd0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_bfd0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_bfd0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_bfd0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_bfd0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_bfd0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_bfd0_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_5596_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_0eb4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_929e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_0eb4_return_output;
     VAR_dei_uxn_opcodes_h_l2938_c40_d3c7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_bfd0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_5294_iftrue := VAR_sta2_uxn_opcodes_h_l2937_c40_0c6c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_5596] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_5596_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_5596_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_5596_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_5596_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_5596_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_5596_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_5596_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_5596_return_output;

     -- dei[uxn_opcodes_h_l2938_c40_d3c7] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l2938_c40_d3c7_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l2938_c40_d3c7_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l2938_c40_d3c7_phase <= VAR_dei_uxn_opcodes_h_l2938_c40_d3c7_phase;
     dei_uxn_opcodes_h_l2938_c40_d3c7_ins <= VAR_dei_uxn_opcodes_h_l2938_c40_d3c7_ins;
     dei_uxn_opcodes_h_l2938_c40_d3c7_previous_stack_read <= VAR_dei_uxn_opcodes_h_l2938_c40_d3c7_previous_stack_read;
     dei_uxn_opcodes_h_l2938_c40_d3c7_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l2938_c40_d3c7_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l2938_c40_d3c7_return_output := dei_uxn_opcodes_h_l2938_c40_d3c7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_929e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_929e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_929e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_929e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_929e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_929e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_929e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_929e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_929e_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a4f3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_5596_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_b781_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_5596_return_output;
     VAR_dei2_uxn_opcodes_h_l2939_c40_b165_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_929e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_221d_iftrue := VAR_dei_uxn_opcodes_h_l2938_c40_d3c7_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_b781] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_b781_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_b781_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_b781_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_b781_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_b781_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_b781_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_b781_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_b781_return_output;

     -- dei2[uxn_opcodes_h_l2939_c40_b165] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l2939_c40_b165_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l2939_c40_b165_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l2939_c40_b165_phase <= VAR_dei2_uxn_opcodes_h_l2939_c40_b165_phase;
     dei2_uxn_opcodes_h_l2939_c40_b165_ins <= VAR_dei2_uxn_opcodes_h_l2939_c40_b165_ins;
     dei2_uxn_opcodes_h_l2939_c40_b165_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l2939_c40_b165_previous_stack_read;
     dei2_uxn_opcodes_h_l2939_c40_b165_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l2939_c40_b165_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l2939_c40_b165_return_output := dei2_uxn_opcodes_h_l2939_c40_b165_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c7_a4f3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a4f3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a4f3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a4f3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a4f3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a4f3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a4f3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a4f3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a4f3_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_a81a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a4f3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f60d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a4f3_return_output;
     VAR_deo_uxn_opcodes_h_l2940_c40_ae64_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_b781_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_0eb4_iftrue := VAR_dei2_uxn_opcodes_h_l2939_c40_b165_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2942_c7_a81a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_a81a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_a81a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_a81a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_a81a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_a81a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_a81a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_a81a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_a81a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c1_f60d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f60d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f60d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f60d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f60d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f60d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f60d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f60d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f60d_return_output;

     -- deo[uxn_opcodes_h_l2940_c40_ae64] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l2940_c40_ae64_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l2940_c40_ae64_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l2940_c40_ae64_phase <= VAR_deo_uxn_opcodes_h_l2940_c40_ae64_phase;
     deo_uxn_opcodes_h_l2940_c40_ae64_ins <= VAR_deo_uxn_opcodes_h_l2940_c40_ae64_ins;
     deo_uxn_opcodes_h_l2940_c40_ae64_previous_stack_read <= VAR_deo_uxn_opcodes_h_l2940_c40_ae64_previous_stack_read;
     deo_uxn_opcodes_h_l2940_c40_ae64_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l2940_c40_ae64_previous_device_ram_read;
     deo_uxn_opcodes_h_l2940_c40_ae64_previous_ram_read <= VAR_deo_uxn_opcodes_h_l2940_c40_ae64_previous_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l2940_c40_ae64_return_output := deo_uxn_opcodes_h_l2940_c40_ae64_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_7f44_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_a81a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_ddc0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_a81a_return_output;
     VAR_deo2_uxn_opcodes_h_l2941_c40_e00f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f60d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_5596_iftrue := VAR_deo_uxn_opcodes_h_l2940_c40_ae64_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2942_c1_ddc0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_ddc0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_ddc0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_ddc0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_ddc0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_ddc0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_ddc0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_ddc0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_ddc0_return_output;

     -- deo2[uxn_opcodes_h_l2941_c40_e00f] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l2941_c40_e00f_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l2941_c40_e00f_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l2941_c40_e00f_phase <= VAR_deo2_uxn_opcodes_h_l2941_c40_e00f_phase;
     deo2_uxn_opcodes_h_l2941_c40_e00f_ins <= VAR_deo2_uxn_opcodes_h_l2941_c40_e00f_ins;
     deo2_uxn_opcodes_h_l2941_c40_e00f_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l2941_c40_e00f_previous_stack_read;
     deo2_uxn_opcodes_h_l2941_c40_e00f_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l2941_c40_e00f_previous_device_ram_read;
     deo2_uxn_opcodes_h_l2941_c40_e00f_previous_ram_read <= VAR_deo2_uxn_opcodes_h_l2941_c40_e00f_previous_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l2941_c40_e00f_return_output := deo2_uxn_opcodes_h_l2941_c40_e00f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2943_c7_7f44] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_7f44_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_7f44_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_7f44_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_7f44_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_7f44_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_7f44_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_7f44_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_7f44_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_8c17_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_7f44_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_8e80_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_7f44_return_output;
     VAR_add_uxn_opcodes_h_l2942_c40_7ef6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_ddc0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_a4f3_iftrue := VAR_deo2_uxn_opcodes_h_l2941_c40_e00f_return_output;
     -- add[uxn_opcodes_h_l2942_c40_7ef6] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l2942_c40_7ef6_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l2942_c40_7ef6_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l2942_c40_7ef6_phase <= VAR_add_uxn_opcodes_h_l2942_c40_7ef6_phase;
     add_uxn_opcodes_h_l2942_c40_7ef6_ins <= VAR_add_uxn_opcodes_h_l2942_c40_7ef6_ins;
     add_uxn_opcodes_h_l2942_c40_7ef6_previous_stack_read <= VAR_add_uxn_opcodes_h_l2942_c40_7ef6_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l2942_c40_7ef6_return_output := add_uxn_opcodes_h_l2942_c40_7ef6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2943_c1_8e80] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_8e80_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_8e80_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_8e80_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_8e80_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_8e80_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_8e80_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_8e80_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_8e80_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2944_c7_8c17] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_8c17_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_8c17_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_8c17_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_8c17_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_8c17_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_8c17_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_8c17_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_8c17_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_6090_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_8c17_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_53ed_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_8c17_return_output;
     VAR_add2_uxn_opcodes_h_l2943_c40_e135_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_8e80_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_a81a_iftrue := VAR_add_uxn_opcodes_h_l2942_c40_7ef6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2945_c7_6090] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_6090_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_6090_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_6090_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_6090_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_6090_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_6090_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_6090_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_6090_return_output;

     -- add2[uxn_opcodes_h_l2943_c40_e135] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l2943_c40_e135_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l2943_c40_e135_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l2943_c40_e135_phase <= VAR_add2_uxn_opcodes_h_l2943_c40_e135_phase;
     add2_uxn_opcodes_h_l2943_c40_e135_ins <= VAR_add2_uxn_opcodes_h_l2943_c40_e135_ins;
     add2_uxn_opcodes_h_l2943_c40_e135_previous_stack_read <= VAR_add2_uxn_opcodes_h_l2943_c40_e135_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l2943_c40_e135_return_output := add2_uxn_opcodes_h_l2943_c40_e135_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2944_c1_53ed] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_53ed_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_53ed_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_53ed_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_53ed_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_53ed_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_53ed_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_53ed_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_53ed_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_c1c0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_6090_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_c6e6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_6090_return_output;
     VAR_sub_uxn_opcodes_h_l2944_c40_ad8a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_53ed_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_7f44_iftrue := VAR_add2_uxn_opcodes_h_l2943_c40_e135_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2945_c1_c6e6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_c6e6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_c6e6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_c6e6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_c6e6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_c6e6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_c6e6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_c6e6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_c6e6_return_output;

     -- sub[uxn_opcodes_h_l2944_c40_ad8a] LATENCY=0
     -- Clock enable
     sub_uxn_opcodes_h_l2944_c40_ad8a_CLOCK_ENABLE <= VAR_sub_uxn_opcodes_h_l2944_c40_ad8a_CLOCK_ENABLE;
     -- Inputs
     sub_uxn_opcodes_h_l2944_c40_ad8a_phase <= VAR_sub_uxn_opcodes_h_l2944_c40_ad8a_phase;
     sub_uxn_opcodes_h_l2944_c40_ad8a_ins <= VAR_sub_uxn_opcodes_h_l2944_c40_ad8a_ins;
     sub_uxn_opcodes_h_l2944_c40_ad8a_previous_stack_read <= VAR_sub_uxn_opcodes_h_l2944_c40_ad8a_previous_stack_read;
     -- Outputs
     VAR_sub_uxn_opcodes_h_l2944_c40_ad8a_return_output := sub_uxn_opcodes_h_l2944_c40_ad8a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2946_c7_c1c0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_c1c0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_c1c0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_c1c0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_c1c0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_c1c0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_c1c0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_c1c0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_c1c0_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_66b1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_c1c0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_fc24_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_c1c0_return_output;
     VAR_sub2_uxn_opcodes_h_l2945_c40_e1f8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_c6e6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_8c17_iftrue := VAR_sub_uxn_opcodes_h_l2944_c40_ad8a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2947_c7_66b1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_66b1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_66b1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_66b1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_66b1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_66b1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_66b1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_66b1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_66b1_return_output;

     -- sub2[uxn_opcodes_h_l2945_c40_e1f8] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l2945_c40_e1f8_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l2945_c40_e1f8_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l2945_c40_e1f8_phase <= VAR_sub2_uxn_opcodes_h_l2945_c40_e1f8_phase;
     sub2_uxn_opcodes_h_l2945_c40_e1f8_ins <= VAR_sub2_uxn_opcodes_h_l2945_c40_e1f8_ins;
     sub2_uxn_opcodes_h_l2945_c40_e1f8_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l2945_c40_e1f8_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l2945_c40_e1f8_return_output := sub2_uxn_opcodes_h_l2945_c40_e1f8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2946_c1_fc24] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_fc24_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_fc24_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_fc24_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_fc24_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_fc24_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_fc24_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_fc24_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_fc24_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_8c22_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_66b1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d3a2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_66b1_return_output;
     VAR_mul_uxn_opcodes_h_l2946_c40_d4cb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_fc24_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_6090_iftrue := VAR_sub2_uxn_opcodes_h_l2945_c40_e1f8_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2947_c1_d3a2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d3a2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d3a2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d3a2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d3a2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d3a2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d3a2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d3a2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d3a2_return_output;

     -- mul[uxn_opcodes_h_l2946_c40_d4cb] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l2946_c40_d4cb_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l2946_c40_d4cb_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l2946_c40_d4cb_phase <= VAR_mul_uxn_opcodes_h_l2946_c40_d4cb_phase;
     mul_uxn_opcodes_h_l2946_c40_d4cb_ins <= VAR_mul_uxn_opcodes_h_l2946_c40_d4cb_ins;
     mul_uxn_opcodes_h_l2946_c40_d4cb_previous_stack_read <= VAR_mul_uxn_opcodes_h_l2946_c40_d4cb_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l2946_c40_d4cb_return_output := mul_uxn_opcodes_h_l2946_c40_d4cb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2948_c7_8c22] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_8c22_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_8c22_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_8c22_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_8c22_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_8c22_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_8c22_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_8c22_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_8c22_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_2daf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_8c22_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_3f40_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_8c22_return_output;
     VAR_mul2_uxn_opcodes_h_l2947_c40_0493_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d3a2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_c1c0_iftrue := VAR_mul_uxn_opcodes_h_l2946_c40_d4cb_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2949_c7_2daf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_2daf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_2daf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_2daf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_2daf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_2daf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_2daf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_2daf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_2daf_return_output;

     -- mul2[uxn_opcodes_h_l2947_c40_0493] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l2947_c40_0493_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l2947_c40_0493_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l2947_c40_0493_phase <= VAR_mul2_uxn_opcodes_h_l2947_c40_0493_phase;
     mul2_uxn_opcodes_h_l2947_c40_0493_ins <= VAR_mul2_uxn_opcodes_h_l2947_c40_0493_ins;
     mul2_uxn_opcodes_h_l2947_c40_0493_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l2947_c40_0493_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l2947_c40_0493_return_output := mul2_uxn_opcodes_h_l2947_c40_0493_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2948_c1_3f40] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_3f40_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_3f40_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_3f40_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_3f40_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_3f40_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_3f40_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_3f40_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_3f40_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5e63_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_2daf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_7e59_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_2daf_return_output;
     VAR_div_uxn_opcodes_h_l2948_c40_56b6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_3f40_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_66b1_iftrue := VAR_mul2_uxn_opcodes_h_l2947_c40_0493_return_output;
     -- div[uxn_opcodes_h_l2948_c40_56b6] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l2948_c40_56b6_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l2948_c40_56b6_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l2948_c40_56b6_phase <= VAR_div_uxn_opcodes_h_l2948_c40_56b6_phase;
     div_uxn_opcodes_h_l2948_c40_56b6_ins <= VAR_div_uxn_opcodes_h_l2948_c40_56b6_ins;
     div_uxn_opcodes_h_l2948_c40_56b6_previous_stack_read <= VAR_div_uxn_opcodes_h_l2948_c40_56b6_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l2948_c40_56b6_return_output := div_uxn_opcodes_h_l2948_c40_56b6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2949_c1_7e59] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_7e59_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_7e59_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_7e59_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_7e59_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_7e59_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_7e59_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_7e59_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_7e59_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2950_c7_5e63] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5e63_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5e63_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5e63_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5e63_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5e63_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5e63_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5e63_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5e63_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_726b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5e63_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_3491_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5e63_return_output;
     VAR_div2_uxn_opcodes_h_l2949_c40_b4b4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_7e59_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_8c22_iftrue := VAR_div_uxn_opcodes_h_l2948_c40_56b6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2951_c7_726b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_726b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_726b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_726b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_726b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_726b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_726b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_726b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_726b_return_output;

     -- div2[uxn_opcodes_h_l2949_c40_b4b4] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l2949_c40_b4b4_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l2949_c40_b4b4_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l2949_c40_b4b4_phase <= VAR_div2_uxn_opcodes_h_l2949_c40_b4b4_phase;
     div2_uxn_opcodes_h_l2949_c40_b4b4_ins <= VAR_div2_uxn_opcodes_h_l2949_c40_b4b4_ins;
     div2_uxn_opcodes_h_l2949_c40_b4b4_previous_stack_read <= VAR_div2_uxn_opcodes_h_l2949_c40_b4b4_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l2949_c40_b4b4_return_output := div2_uxn_opcodes_h_l2949_c40_b4b4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2950_c1_3491] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_3491_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_3491_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_3491_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_3491_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_3491_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_3491_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_3491_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_3491_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_d743_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_726b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c909_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_726b_return_output;
     VAR_and_uxn_opcodes_h_l2950_c40_cbe1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_3491_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_2daf_iftrue := VAR_div2_uxn_opcodes_h_l2949_c40_b4b4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2952_c7_d743] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_d743_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_d743_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_d743_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_d743_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_d743_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_d743_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_d743_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_d743_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2951_c1_c909] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c909_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c909_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c909_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c909_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c909_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c909_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c909_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c909_return_output;

     -- and[uxn_opcodes_h_l2950_c40_cbe1] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l2950_c40_cbe1_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l2950_c40_cbe1_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l2950_c40_cbe1_phase <= VAR_and_uxn_opcodes_h_l2950_c40_cbe1_phase;
     and_uxn_opcodes_h_l2950_c40_cbe1_ins <= VAR_and_uxn_opcodes_h_l2950_c40_cbe1_ins;
     and_uxn_opcodes_h_l2950_c40_cbe1_previous_stack_read <= VAR_and_uxn_opcodes_h_l2950_c40_cbe1_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l2950_c40_cbe1_return_output := and_uxn_opcodes_h_l2950_c40_cbe1_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_cb7e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_d743_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_48db_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_d743_return_output;
     VAR_and2_uxn_opcodes_h_l2951_c40_2ee8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c909_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_5e63_iftrue := VAR_and_uxn_opcodes_h_l2950_c40_cbe1_return_output;
     -- and2[uxn_opcodes_h_l2951_c40_2ee8] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l2951_c40_2ee8_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l2951_c40_2ee8_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l2951_c40_2ee8_phase <= VAR_and2_uxn_opcodes_h_l2951_c40_2ee8_phase;
     and2_uxn_opcodes_h_l2951_c40_2ee8_ins <= VAR_and2_uxn_opcodes_h_l2951_c40_2ee8_ins;
     and2_uxn_opcodes_h_l2951_c40_2ee8_previous_stack_read <= VAR_and2_uxn_opcodes_h_l2951_c40_2ee8_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l2951_c40_2ee8_return_output := and2_uxn_opcodes_h_l2951_c40_2ee8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2952_c1_48db] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_48db_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_48db_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_48db_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_48db_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_48db_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_48db_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_48db_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_48db_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2953_c7_cb7e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_cb7e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_cb7e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_cb7e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_cb7e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_cb7e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_cb7e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_cb7e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_cb7e_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_9bc0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_cb7e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_6541_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_cb7e_return_output;
     VAR_ora_uxn_opcodes_h_l2952_c40_b245_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_48db_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_726b_iftrue := VAR_and2_uxn_opcodes_h_l2951_c40_2ee8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2954_c7_9bc0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_9bc0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_9bc0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_9bc0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_9bc0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_9bc0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_9bc0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_9bc0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_9bc0_return_output;

     -- ora[uxn_opcodes_h_l2952_c40_b245] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l2952_c40_b245_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l2952_c40_b245_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l2952_c40_b245_phase <= VAR_ora_uxn_opcodes_h_l2952_c40_b245_phase;
     ora_uxn_opcodes_h_l2952_c40_b245_ins <= VAR_ora_uxn_opcodes_h_l2952_c40_b245_ins;
     ora_uxn_opcodes_h_l2952_c40_b245_previous_stack_read <= VAR_ora_uxn_opcodes_h_l2952_c40_b245_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l2952_c40_b245_return_output := ora_uxn_opcodes_h_l2952_c40_b245_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2953_c1_6541] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_6541_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_6541_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_6541_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_6541_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_6541_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_6541_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_6541_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_6541_return_output;

     -- Submodule level 74
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_fceb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_9bc0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_389b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_9bc0_return_output;
     VAR_ora2_uxn_opcodes_h_l2953_c40_0b7b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_6541_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_d743_iftrue := VAR_ora_uxn_opcodes_h_l2952_c40_b245_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2955_c7_fceb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_fceb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_fceb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_fceb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_fceb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_fceb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_fceb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_fceb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_fceb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2954_c1_389b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_389b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_389b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_389b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_389b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_389b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_389b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_389b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_389b_return_output;

     -- ora2[uxn_opcodes_h_l2953_c40_0b7b] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l2953_c40_0b7b_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l2953_c40_0b7b_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l2953_c40_0b7b_phase <= VAR_ora2_uxn_opcodes_h_l2953_c40_0b7b_phase;
     ora2_uxn_opcodes_h_l2953_c40_0b7b_ins <= VAR_ora2_uxn_opcodes_h_l2953_c40_0b7b_ins;
     ora2_uxn_opcodes_h_l2953_c40_0b7b_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l2953_c40_0b7b_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l2953_c40_0b7b_return_output := ora2_uxn_opcodes_h_l2953_c40_0b7b_return_output;

     -- Submodule level 75
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_f87f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_fceb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_c3de_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_fceb_return_output;
     VAR_eor_uxn_opcodes_h_l2954_c40_01bc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_389b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_cb7e_iftrue := VAR_ora2_uxn_opcodes_h_l2953_c40_0b7b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2956_c7_f87f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_f87f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_f87f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_f87f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_f87f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_f87f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_f87f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_f87f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_f87f_return_output;

     -- eor[uxn_opcodes_h_l2954_c40_01bc] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l2954_c40_01bc_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l2954_c40_01bc_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l2954_c40_01bc_phase <= VAR_eor_uxn_opcodes_h_l2954_c40_01bc_phase;
     eor_uxn_opcodes_h_l2954_c40_01bc_ins <= VAR_eor_uxn_opcodes_h_l2954_c40_01bc_ins;
     eor_uxn_opcodes_h_l2954_c40_01bc_previous_stack_read <= VAR_eor_uxn_opcodes_h_l2954_c40_01bc_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l2954_c40_01bc_return_output := eor_uxn_opcodes_h_l2954_c40_01bc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2955_c1_c3de] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_c3de_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_c3de_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_c3de_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_c3de_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_c3de_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_c3de_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_c3de_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_c3de_return_output;

     -- Submodule level 76
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_a332_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_f87f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_276d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_f87f_return_output;
     VAR_eor2_uxn_opcodes_h_l2955_c40_e421_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_c3de_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_9bc0_iftrue := VAR_eor_uxn_opcodes_h_l2954_c40_01bc_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2957_c7_a332] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_a332_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_a332_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_a332_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_a332_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_a332_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_a332_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_a332_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_a332_return_output;

     -- eor2[uxn_opcodes_h_l2955_c40_e421] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l2955_c40_e421_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l2955_c40_e421_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l2955_c40_e421_phase <= VAR_eor2_uxn_opcodes_h_l2955_c40_e421_phase;
     eor2_uxn_opcodes_h_l2955_c40_e421_ins <= VAR_eor2_uxn_opcodes_h_l2955_c40_e421_ins;
     eor2_uxn_opcodes_h_l2955_c40_e421_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l2955_c40_e421_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l2955_c40_e421_return_output := eor2_uxn_opcodes_h_l2955_c40_e421_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2956_c1_276d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_276d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_276d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_276d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_276d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_276d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_276d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_276d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_276d_return_output;

     -- Submodule level 77
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_571d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_a332_return_output;
     VAR_sft_uxn_opcodes_h_l2956_c40_fa0b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_276d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_fceb_iftrue := VAR_eor2_uxn_opcodes_h_l2955_c40_e421_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2957_c1_571d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_571d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_571d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_571d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_571d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_571d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_571d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_571d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_571d_return_output;

     -- sft[uxn_opcodes_h_l2956_c40_fa0b] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l2956_c40_fa0b_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l2956_c40_fa0b_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l2956_c40_fa0b_phase <= VAR_sft_uxn_opcodes_h_l2956_c40_fa0b_phase;
     sft_uxn_opcodes_h_l2956_c40_fa0b_ins <= VAR_sft_uxn_opcodes_h_l2956_c40_fa0b_ins;
     sft_uxn_opcodes_h_l2956_c40_fa0b_previous_stack_read <= VAR_sft_uxn_opcodes_h_l2956_c40_fa0b_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l2956_c40_fa0b_return_output := sft_uxn_opcodes_h_l2956_c40_fa0b_return_output;

     -- Submodule level 78
     VAR_sft2_uxn_opcodes_h_l2957_c40_ba44_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_571d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_f87f_iftrue := VAR_sft_uxn_opcodes_h_l2956_c40_fa0b_return_output;
     -- sft2[uxn_opcodes_h_l2957_c40_ba44] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l2957_c40_ba44_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l2957_c40_ba44_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l2957_c40_ba44_phase <= VAR_sft2_uxn_opcodes_h_l2957_c40_ba44_phase;
     sft2_uxn_opcodes_h_l2957_c40_ba44_ins <= VAR_sft2_uxn_opcodes_h_l2957_c40_ba44_ins;
     sft2_uxn_opcodes_h_l2957_c40_ba44_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l2957_c40_ba44_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l2957_c40_ba44_return_output := sft2_uxn_opcodes_h_l2957_c40_ba44_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_a332_iftrue := VAR_sft2_uxn_opcodes_h_l2957_c40_ba44_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2957_c7_a332] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2957_c7_a332_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_a332_cond;
     opc_result_MUX_uxn_opcodes_h_l2957_c7_a332_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_a332_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2957_c7_a332_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_a332_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_a332_return_output := opc_result_MUX_uxn_opcodes_h_l2957_c7_a332_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_f87f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_a332_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2956_c7_f87f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2956_c7_f87f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_f87f_cond;
     opc_result_MUX_uxn_opcodes_h_l2956_c7_f87f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_f87f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2956_c7_f87f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_f87f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_f87f_return_output := opc_result_MUX_uxn_opcodes_h_l2956_c7_f87f_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_fceb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_f87f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2955_c7_fceb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2955_c7_fceb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_fceb_cond;
     opc_result_MUX_uxn_opcodes_h_l2955_c7_fceb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_fceb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2955_c7_fceb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_fceb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_fceb_return_output := opc_result_MUX_uxn_opcodes_h_l2955_c7_fceb_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_9bc0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_fceb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2954_c7_9bc0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2954_c7_9bc0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_9bc0_cond;
     opc_result_MUX_uxn_opcodes_h_l2954_c7_9bc0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_9bc0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2954_c7_9bc0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_9bc0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_9bc0_return_output := opc_result_MUX_uxn_opcodes_h_l2954_c7_9bc0_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_cb7e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_9bc0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2953_c7_cb7e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2953_c7_cb7e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_cb7e_cond;
     opc_result_MUX_uxn_opcodes_h_l2953_c7_cb7e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_cb7e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2953_c7_cb7e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_cb7e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_cb7e_return_output := opc_result_MUX_uxn_opcodes_h_l2953_c7_cb7e_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_d743_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_cb7e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2952_c7_d743] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2952_c7_d743_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_d743_cond;
     opc_result_MUX_uxn_opcodes_h_l2952_c7_d743_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_d743_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2952_c7_d743_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_d743_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_d743_return_output := opc_result_MUX_uxn_opcodes_h_l2952_c7_d743_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_726b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_d743_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2951_c7_726b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2951_c7_726b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_726b_cond;
     opc_result_MUX_uxn_opcodes_h_l2951_c7_726b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_726b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2951_c7_726b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_726b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_726b_return_output := opc_result_MUX_uxn_opcodes_h_l2951_c7_726b_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_5e63_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_726b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2950_c7_5e63] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2950_c7_5e63_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_5e63_cond;
     opc_result_MUX_uxn_opcodes_h_l2950_c7_5e63_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_5e63_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2950_c7_5e63_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_5e63_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_5e63_return_output := opc_result_MUX_uxn_opcodes_h_l2950_c7_5e63_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_2daf_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_5e63_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2949_c7_2daf] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2949_c7_2daf_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_2daf_cond;
     opc_result_MUX_uxn_opcodes_h_l2949_c7_2daf_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_2daf_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2949_c7_2daf_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_2daf_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_2daf_return_output := opc_result_MUX_uxn_opcodes_h_l2949_c7_2daf_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_8c22_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_2daf_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2948_c7_8c22] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2948_c7_8c22_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_8c22_cond;
     opc_result_MUX_uxn_opcodes_h_l2948_c7_8c22_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_8c22_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2948_c7_8c22_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_8c22_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_8c22_return_output := opc_result_MUX_uxn_opcodes_h_l2948_c7_8c22_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_66b1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_8c22_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2947_c7_66b1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2947_c7_66b1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_66b1_cond;
     opc_result_MUX_uxn_opcodes_h_l2947_c7_66b1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_66b1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2947_c7_66b1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_66b1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_66b1_return_output := opc_result_MUX_uxn_opcodes_h_l2947_c7_66b1_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_c1c0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_66b1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2946_c7_c1c0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2946_c7_c1c0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_c1c0_cond;
     opc_result_MUX_uxn_opcodes_h_l2946_c7_c1c0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_c1c0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2946_c7_c1c0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_c1c0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_c1c0_return_output := opc_result_MUX_uxn_opcodes_h_l2946_c7_c1c0_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_6090_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_c1c0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2945_c7_6090] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2945_c7_6090_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_6090_cond;
     opc_result_MUX_uxn_opcodes_h_l2945_c7_6090_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_6090_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2945_c7_6090_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_6090_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_6090_return_output := opc_result_MUX_uxn_opcodes_h_l2945_c7_6090_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_8c17_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_6090_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2944_c7_8c17] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2944_c7_8c17_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_8c17_cond;
     opc_result_MUX_uxn_opcodes_h_l2944_c7_8c17_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_8c17_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2944_c7_8c17_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_8c17_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_8c17_return_output := opc_result_MUX_uxn_opcodes_h_l2944_c7_8c17_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_7f44_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_8c17_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2943_c7_7f44] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2943_c7_7f44_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_7f44_cond;
     opc_result_MUX_uxn_opcodes_h_l2943_c7_7f44_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_7f44_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2943_c7_7f44_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_7f44_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_7f44_return_output := opc_result_MUX_uxn_opcodes_h_l2943_c7_7f44_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_a81a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_7f44_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2942_c7_a81a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2942_c7_a81a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_a81a_cond;
     opc_result_MUX_uxn_opcodes_h_l2942_c7_a81a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_a81a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2942_c7_a81a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_a81a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_a81a_return_output := opc_result_MUX_uxn_opcodes_h_l2942_c7_a81a_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_a4f3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_a81a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2941_c7_a4f3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2941_c7_a4f3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_a4f3_cond;
     opc_result_MUX_uxn_opcodes_h_l2941_c7_a4f3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_a4f3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2941_c7_a4f3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_a4f3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_a4f3_return_output := opc_result_MUX_uxn_opcodes_h_l2941_c7_a4f3_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_5596_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_a4f3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2940_c7_5596] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2940_c7_5596_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_5596_cond;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_5596_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_5596_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_5596_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_5596_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_5596_return_output := opc_result_MUX_uxn_opcodes_h_l2940_c7_5596_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_0eb4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_5596_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2939_c7_0eb4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2939_c7_0eb4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_0eb4_cond;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_0eb4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_0eb4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_0eb4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_0eb4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_0eb4_return_output := opc_result_MUX_uxn_opcodes_h_l2939_c7_0eb4_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_221d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_0eb4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2938_c7_221d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2938_c7_221d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_221d_cond;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_221d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_221d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_221d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_221d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_221d_return_output := opc_result_MUX_uxn_opcodes_h_l2938_c7_221d_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_5294_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_221d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2937_c7_5294] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2937_c7_5294_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_5294_cond;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_5294_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_5294_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_5294_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_5294_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_5294_return_output := opc_result_MUX_uxn_opcodes_h_l2937_c7_5294_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_7dd8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_5294_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2936_c7_7dd8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2936_c7_7dd8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_7dd8_cond;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_7dd8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_7dd8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_7dd8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_7dd8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_7dd8_return_output := opc_result_MUX_uxn_opcodes_h_l2936_c7_7dd8_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_6a6b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_7dd8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2935_c7_6a6b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2935_c7_6a6b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_6a6b_cond;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_6a6b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_6a6b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_6a6b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_6a6b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_6a6b_return_output := opc_result_MUX_uxn_opcodes_h_l2935_c7_6a6b_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_c7e8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_6a6b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2934_c7_c7e8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2934_c7_c7e8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_c7e8_cond;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_c7e8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_c7e8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_c7e8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_c7e8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_c7e8_return_output := opc_result_MUX_uxn_opcodes_h_l2934_c7_c7e8_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_dc0f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_c7e8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2933_c7_dc0f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2933_c7_dc0f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_dc0f_cond;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_dc0f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_dc0f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_dc0f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_dc0f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_dc0f_return_output := opc_result_MUX_uxn_opcodes_h_l2933_c7_dc0f_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_95e1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_dc0f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2932_c7_95e1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2932_c7_95e1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_95e1_cond;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_95e1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_95e1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_95e1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_95e1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_95e1_return_output := opc_result_MUX_uxn_opcodes_h_l2932_c7_95e1_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_d4d2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_95e1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2931_c7_d4d2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2931_c7_d4d2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_d4d2_cond;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_d4d2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_d4d2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_d4d2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_d4d2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_d4d2_return_output := opc_result_MUX_uxn_opcodes_h_l2931_c7_d4d2_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b62e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_d4d2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2930_c7_b62e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2930_c7_b62e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b62e_cond;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_b62e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b62e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_b62e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b62e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b62e_return_output := opc_result_MUX_uxn_opcodes_h_l2930_c7_b62e_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_3315_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b62e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2929_c7_3315] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2929_c7_3315_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_3315_cond;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_3315_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_3315_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_3315_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_3315_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_3315_return_output := opc_result_MUX_uxn_opcodes_h_l2929_c7_3315_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_1614_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_3315_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2928_c7_1614] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2928_c7_1614_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_1614_cond;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_1614_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_1614_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_1614_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_1614_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_1614_return_output := opc_result_MUX_uxn_opcodes_h_l2928_c7_1614_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_b5ec_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_1614_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2927_c7_b5ec] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2927_c7_b5ec_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_b5ec_cond;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_b5ec_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_b5ec_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_b5ec_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_b5ec_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_b5ec_return_output := opc_result_MUX_uxn_opcodes_h_l2927_c7_b5ec_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_37ec_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_b5ec_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2926_c7_37ec] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2926_c7_37ec_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_37ec_cond;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_37ec_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_37ec_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_37ec_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_37ec_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_37ec_return_output := opc_result_MUX_uxn_opcodes_h_l2926_c7_37ec_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_5f5a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_37ec_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2925_c7_5f5a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2925_c7_5f5a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_5f5a_cond;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_5f5a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_5f5a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_5f5a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_5f5a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_5f5a_return_output := opc_result_MUX_uxn_opcodes_h_l2925_c7_5f5a_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_3b0c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_5f5a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2924_c7_3b0c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2924_c7_3b0c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_3b0c_cond;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_3b0c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_3b0c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_3b0c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_3b0c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_3b0c_return_output := opc_result_MUX_uxn_opcodes_h_l2924_c7_3b0c_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_3326_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_3b0c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2923_c7_3326] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2923_c7_3326_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_3326_cond;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_3326_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_3326_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_3326_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_3326_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_3326_return_output := opc_result_MUX_uxn_opcodes_h_l2923_c7_3326_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_2c7b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_3326_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2922_c7_2c7b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2922_c7_2c7b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_2c7b_cond;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_2c7b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_2c7b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_2c7b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_2c7b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_2c7b_return_output := opc_result_MUX_uxn_opcodes_h_l2922_c7_2c7b_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_c7fd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_2c7b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2921_c7_c7fd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2921_c7_c7fd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_c7fd_cond;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_c7fd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_c7fd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_c7fd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_c7fd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_c7fd_return_output := opc_result_MUX_uxn_opcodes_h_l2921_c7_c7fd_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_f5d0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_c7fd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2920_c7_f5d0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2920_c7_f5d0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_f5d0_cond;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_f5d0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_f5d0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_f5d0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_f5d0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_f5d0_return_output := opc_result_MUX_uxn_opcodes_h_l2920_c7_f5d0_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4fd5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_f5d0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2919_c7_4fd5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2919_c7_4fd5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4fd5_cond;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_4fd5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4fd5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_4fd5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4fd5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4fd5_return_output := opc_result_MUX_uxn_opcodes_h_l2919_c7_4fd5_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_3ae2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4fd5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2918_c7_3ae2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2918_c7_3ae2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_3ae2_cond;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_3ae2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_3ae2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_3ae2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_3ae2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_3ae2_return_output := opc_result_MUX_uxn_opcodes_h_l2918_c7_3ae2_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_0a1d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_3ae2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2917_c7_0a1d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2917_c7_0a1d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_0a1d_cond;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_0a1d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_0a1d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_0a1d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_0a1d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_0a1d_return_output := opc_result_MUX_uxn_opcodes_h_l2917_c7_0a1d_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_a6f1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_0a1d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2916_c7_a6f1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2916_c7_a6f1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_a6f1_cond;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_a6f1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_a6f1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_a6f1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_a6f1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_a6f1_return_output := opc_result_MUX_uxn_opcodes_h_l2916_c7_a6f1_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_5202_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_a6f1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2915_c7_5202] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2915_c7_5202_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_5202_cond;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_5202_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_5202_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_5202_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_5202_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_5202_return_output := opc_result_MUX_uxn_opcodes_h_l2915_c7_5202_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_bde8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_5202_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2914_c7_bde8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2914_c7_bde8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_bde8_cond;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_bde8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_bde8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_bde8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_bde8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_bde8_return_output := opc_result_MUX_uxn_opcodes_h_l2914_c7_bde8_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_9e8d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_bde8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2913_c7_9e8d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2913_c7_9e8d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_9e8d_cond;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_9e8d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_9e8d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_9e8d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_9e8d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_9e8d_return_output := opc_result_MUX_uxn_opcodes_h_l2913_c7_9e8d_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_68c9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_9e8d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2912_c7_68c9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2912_c7_68c9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_68c9_cond;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_68c9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_68c9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_68c9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_68c9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_68c9_return_output := opc_result_MUX_uxn_opcodes_h_l2912_c7_68c9_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_dfda_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_68c9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2911_c7_dfda] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2911_c7_dfda_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_dfda_cond;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_dfda_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_dfda_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_dfda_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_dfda_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_dfda_return_output := opc_result_MUX_uxn_opcodes_h_l2911_c7_dfda_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_e87b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_dfda_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2910_c7_e87b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2910_c7_e87b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_e87b_cond;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_e87b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_e87b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_e87b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_e87b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_e87b_return_output := opc_result_MUX_uxn_opcodes_h_l2910_c7_e87b_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_a596_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_e87b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2909_c7_a596] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2909_c7_a596_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_a596_cond;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_a596_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_a596_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_a596_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_a596_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_a596_return_output := opc_result_MUX_uxn_opcodes_h_l2909_c7_a596_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_0a31_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_a596_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2908_c7_0a31] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2908_c7_0a31_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_0a31_cond;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_0a31_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_0a31_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_0a31_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_0a31_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_0a31_return_output := opc_result_MUX_uxn_opcodes_h_l2908_c7_0a31_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_cb2f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_0a31_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2907_c7_cb2f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2907_c7_cb2f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_cb2f_cond;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_cb2f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_cb2f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_cb2f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_cb2f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_cb2f_return_output := opc_result_MUX_uxn_opcodes_h_l2907_c7_cb2f_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a749_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_cb2f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2906_c7_a749] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2906_c7_a749_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a749_cond;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_a749_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a749_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_a749_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a749_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a749_return_output := opc_result_MUX_uxn_opcodes_h_l2906_c7_a749_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_ebbd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a749_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2905_c7_ebbd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2905_c7_ebbd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_ebbd_cond;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_ebbd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_ebbd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_ebbd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_ebbd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_ebbd_return_output := opc_result_MUX_uxn_opcodes_h_l2905_c7_ebbd_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_e57e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_ebbd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2904_c7_e57e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2904_c7_e57e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_e57e_cond;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_e57e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_e57e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_e57e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_e57e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_e57e_return_output := opc_result_MUX_uxn_opcodes_h_l2904_c7_e57e_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_b588_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_e57e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2903_c7_b588] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2903_c7_b588_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_b588_cond;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_b588_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_b588_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_b588_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_b588_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_b588_return_output := opc_result_MUX_uxn_opcodes_h_l2903_c7_b588_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_32d4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_b588_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2902_c7_32d4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2902_c7_32d4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_32d4_cond;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_32d4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_32d4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_32d4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_32d4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_32d4_return_output := opc_result_MUX_uxn_opcodes_h_l2902_c7_32d4_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_9cc5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_32d4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2901_c7_9cc5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2901_c7_9cc5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_9cc5_cond;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_9cc5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_9cc5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_9cc5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_9cc5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_9cc5_return_output := opc_result_MUX_uxn_opcodes_h_l2901_c7_9cc5_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6a50_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_9cc5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2900_c7_6a50] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2900_c7_6a50_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6a50_cond;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_6a50_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6a50_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_6a50_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6a50_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6a50_return_output := opc_result_MUX_uxn_opcodes_h_l2900_c7_6a50_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_3690_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6a50_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2899_c7_3690] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2899_c7_3690_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_3690_cond;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_3690_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_3690_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_3690_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_3690_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_3690_return_output := opc_result_MUX_uxn_opcodes_h_l2899_c7_3690_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_a23b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_3690_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2898_c7_a23b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2898_c7_a23b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_a23b_cond;
     opc_result_MUX_uxn_opcodes_h_l2898_c7_a23b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_a23b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2898_c7_a23b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_a23b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_a23b_return_output := opc_result_MUX_uxn_opcodes_h_l2898_c7_a23b_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_87b5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_a23b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2897_c7_87b5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2897_c7_87b5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_87b5_cond;
     opc_result_MUX_uxn_opcodes_h_l2897_c7_87b5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_87b5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2897_c7_87b5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_87b5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_87b5_return_output := opc_result_MUX_uxn_opcodes_h_l2897_c7_87b5_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_9713_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_87b5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2896_c7_9713] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2896_c7_9713_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_9713_cond;
     opc_result_MUX_uxn_opcodes_h_l2896_c7_9713_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_9713_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2896_c7_9713_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_9713_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_9713_return_output := opc_result_MUX_uxn_opcodes_h_l2896_c7_9713_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_29cf_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_9713_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2895_c7_29cf] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2895_c7_29cf_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_29cf_cond;
     opc_result_MUX_uxn_opcodes_h_l2895_c7_29cf_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_29cf_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2895_c7_29cf_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_29cf_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_29cf_return_output := opc_result_MUX_uxn_opcodes_h_l2895_c7_29cf_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_aaaa_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_29cf_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2894_c7_aaaa] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2894_c7_aaaa_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_aaaa_cond;
     opc_result_MUX_uxn_opcodes_h_l2894_c7_aaaa_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_aaaa_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2894_c7_aaaa_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_aaaa_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_aaaa_return_output := opc_result_MUX_uxn_opcodes_h_l2894_c7_aaaa_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_c50b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_aaaa_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2893_c7_c50b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2893_c7_c50b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_c50b_cond;
     opc_result_MUX_uxn_opcodes_h_l2893_c7_c50b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_c50b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2893_c7_c50b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_c50b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_c50b_return_output := opc_result_MUX_uxn_opcodes_h_l2893_c7_c50b_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_ec22_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_c50b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2892_c7_ec22] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2892_c7_ec22_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_ec22_cond;
     opc_result_MUX_uxn_opcodes_h_l2892_c7_ec22_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_ec22_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2892_c7_ec22_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_ec22_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_ec22_return_output := opc_result_MUX_uxn_opcodes_h_l2892_c7_ec22_return_output;

     -- Submodule level 145
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_746b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_ec22_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2891_c7_746b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2891_c7_746b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_746b_cond;
     opc_result_MUX_uxn_opcodes_h_l2891_c7_746b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_746b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2891_c7_746b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_746b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_746b_return_output := opc_result_MUX_uxn_opcodes_h_l2891_c7_746b_return_output;

     -- Submodule level 146
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_d1e9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_746b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2890_c7_d1e9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2890_c7_d1e9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_d1e9_cond;
     opc_result_MUX_uxn_opcodes_h_l2890_c7_d1e9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_d1e9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2890_c7_d1e9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_d1e9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_d1e9_return_output := opc_result_MUX_uxn_opcodes_h_l2890_c7_d1e9_return_output;

     -- Submodule level 147
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_046d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_d1e9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2889_c7_046d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2889_c7_046d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_046d_cond;
     opc_result_MUX_uxn_opcodes_h_l2889_c7_046d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_046d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2889_c7_046d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_046d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_046d_return_output := opc_result_MUX_uxn_opcodes_h_l2889_c7_046d_return_output;

     -- Submodule level 148
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_046d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2888_c2_aaa5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_cond;
     opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_return_output := opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_return_output;

     -- Submodule level 149
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_return_output;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2974_c3_1653] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2974_c3_1653_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_return_output.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2985_l2973_DUPLICATE_9782 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2985_l2973_DUPLICATE_9782_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_return_output.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2963_l2965_DUPLICATE_3506 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2963_l2965_DUPLICATE_3506_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d[uxn_opcodes_h_l2978_c39_8a26] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2978_c39_8a26_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l2986_c32_c5da] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2986_c32_c5da_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_return_output.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l2979_c40_b630] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2979_c40_b630_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2983_c34_87cf] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2983_c34_87cf_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2980_c34_d6c3] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2980_c34_d6c3_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d[uxn_opcodes_h_l2984_c37_3065] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2984_c37_3065_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2982_c33_0c91] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2982_c33_0c91_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_return_output.is_ram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2968_c68_a46e] LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2968_c68_a46e_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2960_c17_fab8] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2960_c17_fab8_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l2981_c30_32c5] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2981_c30_32c5_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_aaa5_return_output.u16_value;

     -- Submodule level 150
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2960_c2_ba44_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2960_c17_fab8_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2971_c24_4ca2_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2974_c3_1653_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2971_c24_4ca2_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2985_l2973_DUPLICATE_9782_return_output;
     -- CAST_TO_uint9_t[uxn_opcodes_h_l2968_c58_a92f] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2968_c58_a92f_return_output := CAST_TO_uint9_t_uint4_t(
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2968_c68_a46e_return_output);

     -- BIN_OP_XOR[uxn_opcodes_h_l2960_c2_ba44] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2960_c2_ba44_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2960_c2_ba44_left;
     BIN_OP_XOR_uxn_opcodes_h_l2960_c2_ba44_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2960_c2_ba44_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2960_c2_ba44_return_output := BIN_OP_XOR_uxn_opcodes_h_l2960_c2_ba44_return_output;

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2988_l2865_DUPLICATE_95e3 LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2988_l2865_DUPLICATE_95e3_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0(
     VAR_is_wait_MUX_uxn_opcodes_h_l2888_c2_aaa5_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2978_c39_8a26_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2979_c40_b630_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2980_c34_d6c3_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2981_c30_32c5_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2982_c33_0c91_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2983_c34_87cf_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2984_c37_3065_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2985_l2973_DUPLICATE_9782_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2986_c32_c5da_return_output);

     -- CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2963_l2965_DUPLICATE_e144 LATENCY=0
     VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2963_l2965_DUPLICATE_e144_return_output := CAST_TO_int8_t_int4_t(
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2963_l2965_DUPLICATE_3506_return_output);

     -- Submodule level 151
     VAR_MUX_uxn_opcodes_h_l2968_c29_6b08_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2960_c2_ba44_return_output;
     VAR_MUX_uxn_opcodes_h_l2969_c20_04ea_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2960_c2_ba44_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2962_c2_cd3a_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2960_c2_ba44_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2962_c2_cd3a_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2960_c2_ba44_return_output;
     REG_VAR_stack_index := VAR_BIN_OP_XOR_uxn_opcodes_h_l2960_c2_ba44_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_5d3a_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2963_l2965_DUPLICATE_e144_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_2e14_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2963_l2965_DUPLICATE_e144_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_e637_right := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2968_c58_a92f_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2988_l2865_DUPLICATE_95e3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2988_l2865_DUPLICATE_95e3_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2963_c3_5d3a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_5d3a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_5d3a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_5d3a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_5d3a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_5d3a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_5d3a_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2965_c3_2e14] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_2e14_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_2e14_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_2e14_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_2e14_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_2e14_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_2e14_return_output;

     -- MUX[uxn_opcodes_h_l2969_c20_04ea] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2969_c20_04ea_cond <= VAR_MUX_uxn_opcodes_h_l2969_c20_04ea_cond;
     MUX_uxn_opcodes_h_l2969_c20_04ea_iftrue <= VAR_MUX_uxn_opcodes_h_l2969_c20_04ea_iftrue;
     MUX_uxn_opcodes_h_l2969_c20_04ea_iffalse <= VAR_MUX_uxn_opcodes_h_l2969_c20_04ea_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2969_c20_04ea_return_output := MUX_uxn_opcodes_h_l2969_c20_04ea_return_output;

     -- Submodule level 152
     VAR_sp1_uxn_opcodes_h_l2963_c3_f974 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_5d3a_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l2965_c3_d87d := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_2e14_return_output)),8);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_8df3_right := VAR_MUX_uxn_opcodes_h_l2969_c20_04ea_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2962_c2_cd3a_iffalse := VAR_sp0_uxn_opcodes_h_l2965_c3_d87d;
     VAR_sp1_MUX_uxn_opcodes_h_l2962_c2_cd3a_iftrue := VAR_sp1_uxn_opcodes_h_l2963_c3_f974;
     -- sp1_MUX[uxn_opcodes_h_l2962_c2_cd3a] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2962_c2_cd3a_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2962_c2_cd3a_cond;
     sp1_MUX_uxn_opcodes_h_l2962_c2_cd3a_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2962_c2_cd3a_iftrue;
     sp1_MUX_uxn_opcodes_h_l2962_c2_cd3a_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2962_c2_cd3a_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2962_c2_cd3a_return_output := sp1_MUX_uxn_opcodes_h_l2962_c2_cd3a_return_output;

     -- sp0_MUX[uxn_opcodes_h_l2962_c2_cd3a] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2962_c2_cd3a_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2962_c2_cd3a_cond;
     sp0_MUX_uxn_opcodes_h_l2962_c2_cd3a_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2962_c2_cd3a_iftrue;
     sp0_MUX_uxn_opcodes_h_l2962_c2_cd3a_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2962_c2_cd3a_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2962_c2_cd3a_return_output := sp0_MUX_uxn_opcodes_h_l2962_c2_cd3a_return_output;

     -- Submodule level 153
     VAR_MUX_uxn_opcodes_h_l2968_c29_6b08_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l2962_c2_cd3a_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l2962_c2_cd3a_return_output;
     VAR_MUX_uxn_opcodes_h_l2968_c29_6b08_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2962_c2_cd3a_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l2962_c2_cd3a_return_output;
     -- MUX[uxn_opcodes_h_l2968_c29_6b08] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2968_c29_6b08_cond <= VAR_MUX_uxn_opcodes_h_l2968_c29_6b08_cond;
     MUX_uxn_opcodes_h_l2968_c29_6b08_iftrue <= VAR_MUX_uxn_opcodes_h_l2968_c29_6b08_iftrue;
     MUX_uxn_opcodes_h_l2968_c29_6b08_iffalse <= VAR_MUX_uxn_opcodes_h_l2968_c29_6b08_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2968_c29_6b08_return_output := MUX_uxn_opcodes_h_l2968_c29_6b08_return_output;

     -- Submodule level 154
     -- CAST_TO_uint9_t[uxn_opcodes_h_l2968_c19_6811] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2968_c19_6811_return_output := CAST_TO_uint9_t_uint8_t(
     VAR_MUX_uxn_opcodes_h_l2968_c29_6b08_return_output);

     -- Submodule level 155
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_e637_left := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2968_c19_6811_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l2968_c19_e637] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_e637_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_e637_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_e637_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_e637_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_e637_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_e637_return_output;

     -- Submodule level 156
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_8df3_left := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_e637_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2969_c2_8df3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_8df3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_8df3_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_8df3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_8df3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_8df3_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_8df3_return_output;

     -- Submodule level 157
     VAR_stack_address_uxn_opcodes_h_l2969_c2_3c38 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_8df3_return_output, 9);
     REG_VAR_stack_address := VAR_stack_address_uxn_opcodes_h_l2969_c2_3c38;
     VAR_stack_ram_update_uxn_opcodes_h_l2971_c24_4ca2_stack_address := VAR_stack_address_uxn_opcodes_h_l2969_c2_3c38;
     -- stack_ram_update[uxn_opcodes_h_l2971_c24_4ca2] LATENCY=0
     -- Clock enable
     stack_ram_update_uxn_opcodes_h_l2971_c24_4ca2_CLOCK_ENABLE <= VAR_stack_ram_update_uxn_opcodes_h_l2971_c24_4ca2_CLOCK_ENABLE;
     -- Inputs
     stack_ram_update_uxn_opcodes_h_l2971_c24_4ca2_stack_address <= VAR_stack_ram_update_uxn_opcodes_h_l2971_c24_4ca2_stack_address;
     stack_ram_update_uxn_opcodes_h_l2971_c24_4ca2_value <= VAR_stack_ram_update_uxn_opcodes_h_l2971_c24_4ca2_value;
     stack_ram_update_uxn_opcodes_h_l2971_c24_4ca2_write_enable <= VAR_stack_ram_update_uxn_opcodes_h_l2971_c24_4ca2_write_enable;
     -- Outputs
     VAR_stack_ram_update_uxn_opcodes_h_l2971_c24_4ca2_return_output := stack_ram_update_uxn_opcodes_h_l2971_c24_4ca2_return_output;

     -- Submodule level 158
     REG_VAR_previous_stack_read := VAR_stack_ram_update_uxn_opcodes_h_l2971_c24_4ca2_return_output;
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
