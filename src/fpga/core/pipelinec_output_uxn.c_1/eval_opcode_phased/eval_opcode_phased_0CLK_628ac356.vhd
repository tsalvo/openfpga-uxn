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
-- Submodules: 372
entity eval_opcode_phased_0CLK_628ac356 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out eval_opcode_result_t);
end eval_opcode_phased_0CLK_628ac356;
architecture arch of eval_opcode_phased_0CLK_628ac356 is
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
-- BIN_OP_AND[uxn_opcodes_h_l2886_c14_fbdf]
signal BIN_OP_AND_uxn_opcodes_h_l2886_c14_fbdf_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2886_c14_fbdf_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2886_c14_fbdf_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2887_c14_ab01]
signal BIN_OP_XOR_uxn_opcodes_h_l2887_c14_ab01_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2887_c14_ab01_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2887_c14_ab01_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2887_c14_243d]
signal BIN_OP_OR_uxn_opcodes_h_l2887_c14_243d_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2887_c14_243d_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2887_c14_243d_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l2887_c14_86a8]
signal UNARY_OP_NOT_uxn_opcodes_h_l2887_c14_86a8_expr : unsigned(7 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l2887_c14_86a8_return_output : unsigned(7 downto 0);

-- BIN_OP_NEQ[uxn_opcodes_h_l2887_c14_f0ba]
signal BIN_OP_NEQ_uxn_opcodes_h_l2887_c14_f0ba_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2887_c14_f0ba_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2887_c14_f0ba_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2887_c14_92de]
signal MUX_uxn_opcodes_h_l2887_c14_92de_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2887_c14_92de_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2887_c14_92de_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2887_c14_92de_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2888_c8_3cba]
signal MUX_uxn_opcodes_h_l2888_c8_3cba_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2888_c8_3cba_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2888_c8_3cba_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2888_c8_3cba_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2894_c6_9135]
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c6_9135_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c6_9135_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c6_9135_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c7_9bf1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9bf1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9bf1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9bf1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9bf1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2894_c2_fcbf]
signal opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_return_output : opcode_result_t;

-- is_wait_MUX[uxn_opcodes_h_l2894_c2_fcbf]
signal is_wait_MUX_uxn_opcodes_h_l2894_c2_fcbf_cond : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2894_c2_fcbf_iftrue : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2894_c2_fcbf_iffalse : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2894_c2_fcbf_return_output : unsigned(0 downto 0);

-- brk[uxn_opcodes_h_l2894_c48_80b6]
signal brk_uxn_opcodes_h_l2894_c48_80b6_phase : unsigned(7 downto 0);
signal brk_uxn_opcodes_h_l2894_c48_80b6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_3307]
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3307_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3307_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3307_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c1_84c1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_84c1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_84c1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_84c1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_84c1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c7_8c27]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_8c27_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_8c27_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_8c27_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_8c27_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2895_c7_9bf1]
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_9bf1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_9bf1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_9bf1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_9bf1_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l2895_c40_387e]
signal jci_uxn_opcodes_h_l2895_c40_387e_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l2895_c40_387e_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2895_c40_387e_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l2895_c40_387e_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2895_c40_387e_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2895_c40_387e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_d934]
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_d934_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_d934_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_d934_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c1_b2f8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_b2f8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_b2f8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_b2f8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_b2f8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c7_f181]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_f181_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_f181_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_f181_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_f181_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2896_c7_8c27]
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_8c27_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_8c27_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_8c27_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_8c27_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l2896_c40_df61]
signal jmi_uxn_opcodes_h_l2896_c40_df61_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l2896_c40_df61_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2896_c40_df61_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l2896_c40_df61_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2896_c40_df61_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_728f]
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_728f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_728f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_728f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c1_b586]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b586_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b586_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b586_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b586_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c7_c2ab]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c2ab_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c2ab_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c2ab_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c2ab_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2897_c7_f181]
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_f181_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_f181_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_f181_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_f181_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l2897_c40_c6e2]
signal jsi_uxn_opcodes_h_l2897_c40_c6e2_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l2897_c40_c6e2_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2897_c40_c6e2_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l2897_c40_c6e2_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2897_c40_c6e2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2898_c11_42f5]
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_42f5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_42f5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_42f5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_bc05]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_bc05_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_bc05_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_bc05_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_bc05_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_9048]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9048_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9048_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9048_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9048_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2898_c7_c2ab]
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_c2ab_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_c2ab_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_c2ab_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_c2ab_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2898_c40_1897]
signal lit_uxn_opcodes_h_l2898_c40_1897_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2898_c40_1897_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2898_c40_1897_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2898_c40_1897_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2898_c40_1897_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_6ef1]
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6ef1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6ef1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6ef1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_942a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_942a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_942a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_942a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_942a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_a9ef]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a9ef_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a9ef_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a9ef_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a9ef_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2899_c7_9048]
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_9048_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_9048_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_9048_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_9048_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2899_c40_f5bd]
signal lit2_uxn_opcodes_h_l2899_c40_f5bd_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2899_c40_f5bd_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2899_c40_f5bd_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2899_c40_f5bd_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2899_c40_f5bd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_2277]
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_2277_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_2277_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_2277_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_a842]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a842_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a842_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a842_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a842_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_15dc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_15dc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_15dc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_15dc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_15dc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2900_c7_a9ef]
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_a9ef_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_a9ef_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_a9ef_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_a9ef_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2900_c40_37bb]
signal lit_uxn_opcodes_h_l2900_c40_37bb_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2900_c40_37bb_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2900_c40_37bb_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2900_c40_37bb_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2900_c40_37bb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_9184]
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_9184_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_9184_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_9184_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_8dba]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_8dba_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_8dba_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_8dba_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_8dba_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_84ad]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_84ad_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_84ad_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_84ad_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_84ad_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2901_c7_15dc]
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_15dc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_15dc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_15dc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_15dc_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2901_c40_9bbc]
signal lit2_uxn_opcodes_h_l2901_c40_9bbc_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2901_c40_9bbc_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2901_c40_9bbc_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2901_c40_9bbc_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2901_c40_9bbc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_34a9]
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_34a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_34a9_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_34a9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_b4f2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_b4f2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_b4f2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_b4f2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_b4f2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_ae00]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_ae00_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_ae00_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_ae00_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_ae00_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2902_c7_84ad]
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_84ad_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_84ad_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_84ad_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_84ad_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l2902_c40_39f6]
signal inc_uxn_opcodes_h_l2902_c40_39f6_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l2902_c40_39f6_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2902_c40_39f6_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2902_c40_39f6_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2902_c40_39f6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_2d46]
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2d46_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2d46_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2d46_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_113e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_113e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_113e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_113e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_113e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_dbf4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dbf4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dbf4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dbf4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dbf4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2903_c7_ae00]
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_ae00_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_ae00_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_ae00_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_ae00_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l2903_c40_37be]
signal inc2_uxn_opcodes_h_l2903_c40_37be_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l2903_c40_37be_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2903_c40_37be_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2903_c40_37be_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2903_c40_37be_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_bc4d]
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_bc4d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_bc4d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_bc4d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_369b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_369b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_369b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_369b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_369b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_c240]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c240_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c240_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c240_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c240_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2904_c7_dbf4]
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_dbf4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_dbf4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_dbf4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_dbf4_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l2904_c40_f75b]
signal pop_uxn_opcodes_h_l2904_c40_f75b_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l2904_c40_f75b_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2904_c40_f75b_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2904_c40_f75b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_d3f6]
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d3f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d3f6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d3f6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_f3e4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_f3e4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_f3e4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_f3e4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_f3e4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_e572]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e572_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e572_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e572_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e572_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2905_c7_c240]
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_c240_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_c240_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_c240_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_c240_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l2905_c40_d926]
signal pop2_uxn_opcodes_h_l2905_c40_d926_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l2905_c40_d926_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2905_c40_d926_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2905_c40_d926_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_ac3b]
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ac3b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ac3b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ac3b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_e895]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_e895_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_e895_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_e895_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_e895_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_90ba]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_90ba_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_90ba_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_90ba_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_90ba_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2906_c7_e572]
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_e572_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_e572_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_e572_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_e572_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l2906_c40_5cae]
signal nip_uxn_opcodes_h_l2906_c40_5cae_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l2906_c40_5cae_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2906_c40_5cae_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2906_c40_5cae_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2906_c40_5cae_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_d7c5]
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_d7c5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_d7c5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_d7c5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_d39f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_d39f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_d39f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_d39f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_d39f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_f462]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f462_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f462_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f462_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f462_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2907_c7_90ba]
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_90ba_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_90ba_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_90ba_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_90ba_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l2907_c40_5b74]
signal nip2_uxn_opcodes_h_l2907_c40_5b74_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l2907_c40_5b74_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2907_c40_5b74_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2907_c40_5b74_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2907_c40_5b74_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_625a]
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_625a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_625a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_625a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_e20f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e20f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e20f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e20f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e20f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_71b2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_71b2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_71b2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_71b2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_71b2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2908_c7_f462]
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_f462_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_f462_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_f462_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_f462_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l2908_c40_65fd]
signal swp_uxn_opcodes_h_l2908_c40_65fd_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l2908_c40_65fd_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2908_c40_65fd_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2908_c40_65fd_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2908_c40_65fd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_1ad1]
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_1ad1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_1ad1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_1ad1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_0af4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0af4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0af4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0af4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0af4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_78e8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_78e8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_78e8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_78e8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_78e8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2909_c7_71b2]
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_71b2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_71b2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_71b2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_71b2_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l2909_c40_cd1b]
signal swp2_uxn_opcodes_h_l2909_c40_cd1b_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l2909_c40_cd1b_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2909_c40_cd1b_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2909_c40_cd1b_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2909_c40_cd1b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_b359]
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b359_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b359_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b359_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_8667]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_8667_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_8667_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_8667_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_8667_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_809c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_809c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_809c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_809c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_809c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2910_c7_78e8]
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_78e8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_78e8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_78e8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_78e8_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l2910_c40_0769]
signal rot_uxn_opcodes_h_l2910_c40_0769_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l2910_c40_0769_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2910_c40_0769_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2910_c40_0769_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2910_c40_0769_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_5b26]
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_5b26_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_5b26_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_5b26_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_df92]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_df92_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_df92_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_df92_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_df92_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_0bda]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0bda_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0bda_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0bda_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0bda_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2911_c7_809c]
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_809c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_809c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_809c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_809c_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l2911_c40_0152]
signal rot2_uxn_opcodes_h_l2911_c40_0152_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l2911_c40_0152_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2911_c40_0152_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2911_c40_0152_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2911_c40_0152_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_3d0d]
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3d0d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3d0d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3d0d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_a78f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_a78f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_a78f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_a78f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_a78f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_3c3c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3c3c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3c3c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3c3c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3c3c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2912_c7_0bda]
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_0bda_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_0bda_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_0bda_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_0bda_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l2912_c40_f0d1]
signal dup_uxn_opcodes_h_l2912_c40_f0d1_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l2912_c40_f0d1_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2912_c40_f0d1_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2912_c40_f0d1_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2912_c40_f0d1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_e050]
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e050_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e050_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e050_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_5027]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_5027_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_5027_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_5027_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_5027_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_b249]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_b249_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_b249_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_b249_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_b249_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2913_c7_3c3c]
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_3c3c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_3c3c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_3c3c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_3c3c_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l2913_c40_907f]
signal dup2_uxn_opcodes_h_l2913_c40_907f_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l2913_c40_907f_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2913_c40_907f_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2913_c40_907f_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2913_c40_907f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_c146]
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_c146_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_c146_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_c146_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_cfdb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_cfdb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_cfdb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_cfdb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_cfdb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_5684]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5684_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5684_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5684_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5684_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2914_c7_b249]
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_b249_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_b249_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_b249_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_b249_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l2914_c40_15b0]
signal ovr_uxn_opcodes_h_l2914_c40_15b0_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l2914_c40_15b0_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2914_c40_15b0_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2914_c40_15b0_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2914_c40_15b0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_9f05]
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9f05_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9f05_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9f05_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_4cf0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_4cf0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_4cf0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_4cf0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_4cf0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_c7b4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c7b4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c7b4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c7b4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c7b4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2915_c7_5684]
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_5684_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_5684_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_5684_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_5684_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l2915_c40_e347]
signal ovr2_uxn_opcodes_h_l2915_c40_e347_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l2915_c40_e347_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2915_c40_e347_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2915_c40_e347_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2915_c40_e347_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_5f3c]
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_5f3c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_5f3c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_5f3c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_eeb9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_eeb9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_eeb9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_eeb9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_eeb9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_9fc1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_9fc1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_9fc1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_9fc1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_9fc1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2916_c7_c7b4]
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_c7b4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_c7b4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_c7b4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_c7b4_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l2916_c40_2ca8]
signal equ_uxn_opcodes_h_l2916_c40_2ca8_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l2916_c40_2ca8_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2916_c40_2ca8_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2916_c40_2ca8_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2916_c40_2ca8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_d97f]
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d97f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d97f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d97f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_f445]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f445_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f445_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f445_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f445_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_079c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_079c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_079c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_079c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_079c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2917_c7_9fc1]
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_9fc1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_9fc1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_9fc1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_9fc1_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l2917_c40_7b86]
signal equ2_uxn_opcodes_h_l2917_c40_7b86_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l2917_c40_7b86_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2917_c40_7b86_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2917_c40_7b86_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2917_c40_7b86_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_707f]
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_707f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_707f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_707f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_ba3a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ba3a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ba3a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ba3a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ba3a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_725b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_725b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_725b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_725b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_725b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2918_c7_079c]
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_079c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_079c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_079c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_079c_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l2918_c40_ab73]
signal neq_uxn_opcodes_h_l2918_c40_ab73_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l2918_c40_ab73_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2918_c40_ab73_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2918_c40_ab73_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2918_c40_ab73_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_071c]
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_071c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_071c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_071c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_4d9d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4d9d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4d9d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4d9d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4d9d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_3041]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3041_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3041_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3041_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3041_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2919_c7_725b]
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_725b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_725b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_725b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_725b_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l2919_c40_d31b]
signal neq2_uxn_opcodes_h_l2919_c40_d31b_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l2919_c40_d31b_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2919_c40_d31b_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2919_c40_d31b_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2919_c40_d31b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_93b4]
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_93b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_93b4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_93b4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_e5df]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e5df_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e5df_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e5df_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e5df_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_9d27]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_9d27_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_9d27_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_9d27_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_9d27_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2920_c7_3041]
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_3041_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_3041_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_3041_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_3041_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l2920_c40_29df]
signal gth_uxn_opcodes_h_l2920_c40_29df_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l2920_c40_29df_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2920_c40_29df_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2920_c40_29df_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2920_c40_29df_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_5811]
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_5811_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_5811_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_5811_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_f1ec]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f1ec_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f1ec_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f1ec_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f1ec_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_569e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_569e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_569e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_569e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_569e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2921_c7_9d27]
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_9d27_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_9d27_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_9d27_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_9d27_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l2921_c40_1b5f]
signal gth2_uxn_opcodes_h_l2921_c40_1b5f_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l2921_c40_1b5f_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2921_c40_1b5f_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2921_c40_1b5f_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2921_c40_1b5f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_3054]
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3054_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3054_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3054_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_5bef]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_5bef_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_5bef_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_5bef_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_5bef_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_063c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_063c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_063c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_063c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_063c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2922_c7_569e]
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_569e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_569e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_569e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_569e_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l2922_c40_6c45]
signal lth_uxn_opcodes_h_l2922_c40_6c45_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l2922_c40_6c45_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2922_c40_6c45_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2922_c40_6c45_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2922_c40_6c45_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_2dfe]
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2dfe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2dfe_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2dfe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_c400]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_c400_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_c400_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_c400_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_c400_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_60be]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_60be_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_60be_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_60be_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_60be_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2923_c7_063c]
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_063c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_063c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_063c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_063c_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l2923_c40_a691]
signal lth2_uxn_opcodes_h_l2923_c40_a691_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l2923_c40_a691_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2923_c40_a691_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2923_c40_a691_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2923_c40_a691_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_1871]
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1871_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1871_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1871_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_2cff]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2cff_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2cff_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2cff_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2cff_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_f293]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_f293_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_f293_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_f293_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_f293_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2924_c7_60be]
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_60be_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_60be_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_60be_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_60be_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l2924_c40_7981]
signal jmp_uxn_opcodes_h_l2924_c40_7981_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l2924_c40_7981_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2924_c40_7981_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2924_c40_7981_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l2924_c40_7981_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2924_c40_7981_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_ca16]
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_ca16_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_ca16_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_ca16_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_a50b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_a50b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_a50b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_a50b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_a50b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_4fc7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_4fc7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_4fc7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_4fc7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_4fc7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2925_c7_f293]
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_f293_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_f293_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_f293_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_f293_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l2925_c40_8785]
signal jmp2_uxn_opcodes_h_l2925_c40_8785_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l2925_c40_8785_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2925_c40_8785_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2925_c40_8785_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2925_c40_8785_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_8cff]
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_8cff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_8cff_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_8cff_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_87ff]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_87ff_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_87ff_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_87ff_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_87ff_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_c235]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c235_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c235_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c235_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c235_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2926_c7_4fc7]
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_4fc7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_4fc7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_4fc7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_4fc7_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l2926_c40_bf95]
signal jcn_uxn_opcodes_h_l2926_c40_bf95_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l2926_c40_bf95_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2926_c40_bf95_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2926_c40_bf95_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l2926_c40_bf95_previous_stack_read : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2926_c40_bf95_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_2a0f]
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_2a0f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_2a0f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_2a0f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_736f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_736f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_736f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_736f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_736f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_9354]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9354_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9354_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9354_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9354_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2927_c7_c235]
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_c235_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_c235_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_c235_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_c235_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l2927_c40_1ece]
signal jcn2_uxn_opcodes_h_l2927_c40_1ece_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l2927_c40_1ece_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2927_c40_1ece_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2927_c40_1ece_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2927_c40_1ece_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_ae7d]
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_ae7d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_ae7d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_ae7d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_8900]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_8900_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_8900_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_8900_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_8900_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_b078]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_b078_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_b078_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_b078_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_b078_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2928_c7_9354]
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_9354_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_9354_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_9354_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_9354_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l2928_c40_2309]
signal jsr_uxn_opcodes_h_l2928_c40_2309_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l2928_c40_2309_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2928_c40_2309_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2928_c40_2309_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l2928_c40_2309_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2928_c40_2309_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_2fcc]
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2fcc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2fcc_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2fcc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_e997]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_e997_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_e997_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_e997_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_e997_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_25ff]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_25ff_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_25ff_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_25ff_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_25ff_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2929_c7_b078]
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_b078_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_b078_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_b078_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_b078_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l2929_c40_3cec]
signal jsr2_uxn_opcodes_h_l2929_c40_3cec_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l2929_c40_3cec_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2929_c40_3cec_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2929_c40_3cec_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l2929_c40_3cec_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2929_c40_3cec_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_53c8]
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_53c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_53c8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_53c8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_5d01]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5d01_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5d01_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5d01_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5d01_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_ff89]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ff89_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ff89_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ff89_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ff89_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2930_c7_25ff]
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_25ff_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_25ff_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_25ff_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_25ff_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l2930_c40_5228]
signal sth_uxn_opcodes_h_l2930_c40_5228_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l2930_c40_5228_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2930_c40_5228_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2930_c40_5228_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2930_c40_5228_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_2f04]
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_2f04_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_2f04_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_2f04_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_8432]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8432_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8432_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8432_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8432_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_110a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_110a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_110a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_110a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_110a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2931_c7_ff89]
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_ff89_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_ff89_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_ff89_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_ff89_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l2931_c40_60f7]
signal sth2_uxn_opcodes_h_l2931_c40_60f7_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l2931_c40_60f7_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2931_c40_60f7_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2931_c40_60f7_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2931_c40_60f7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_2cbf]
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2cbf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2cbf_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2cbf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_5bce]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_5bce_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_5bce_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_5bce_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_5bce_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_e3af]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_e3af_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_e3af_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_e3af_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_e3af_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2932_c7_110a]
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_110a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_110a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_110a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_110a_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l2932_c40_beec]
signal ldz_uxn_opcodes_h_l2932_c40_beec_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l2932_c40_beec_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2932_c40_beec_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2932_c40_beec_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2932_c40_beec_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2932_c40_beec_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_b567]
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_b567_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_b567_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_b567_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_61fc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_61fc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_61fc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_61fc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_61fc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_ed89]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_ed89_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_ed89_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_ed89_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_ed89_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2933_c7_e3af]
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_e3af_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_e3af_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_e3af_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_e3af_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l2933_c40_ec39]
signal ldz2_uxn_opcodes_h_l2933_c40_ec39_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l2933_c40_ec39_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2933_c40_ec39_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2933_c40_ec39_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2933_c40_ec39_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2933_c40_ec39_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_d1e8]
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_d1e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_d1e8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_d1e8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_9b2f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_9b2f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_9b2f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_9b2f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_9b2f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_14a9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_14a9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_14a9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_14a9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_14a9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2934_c7_ed89]
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_ed89_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_ed89_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_ed89_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_ed89_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l2934_c40_08b5]
signal stz_uxn_opcodes_h_l2934_c40_08b5_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l2934_c40_08b5_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2934_c40_08b5_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2934_c40_08b5_previous_stack_read : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2934_c40_08b5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_e3d9]
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_e3d9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_e3d9_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_e3d9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_8799]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_8799_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_8799_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_8799_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_8799_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_9da5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_9da5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_9da5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_9da5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_9da5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2935_c7_14a9]
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_14a9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_14a9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_14a9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_14a9_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l2935_c40_1781]
signal stz2_uxn_opcodes_h_l2935_c40_1781_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l2935_c40_1781_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2935_c40_1781_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2935_c40_1781_previous_stack_read : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2935_c40_1781_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_a20b]
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_a20b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_a20b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_a20b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_3ba7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ba7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ba7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ba7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ba7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_14fe]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_14fe_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_14fe_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_14fe_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_14fe_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2936_c7_9da5]
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_9da5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_9da5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_9da5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_9da5_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l2936_c40_2b0f]
signal ldr_uxn_opcodes_h_l2936_c40_2b0f_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l2936_c40_2b0f_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2936_c40_2b0f_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2936_c40_2b0f_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l2936_c40_2b0f_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2936_c40_2b0f_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2936_c40_2b0f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_1e6f]
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1e6f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1e6f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1e6f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_770f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_770f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_770f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_770f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_770f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_3f46]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_3f46_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_3f46_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_3f46_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_3f46_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2937_c7_14fe]
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_14fe_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_14fe_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_14fe_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_14fe_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l2937_c40_0c30]
signal ldr2_uxn_opcodes_h_l2937_c40_0c30_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l2937_c40_0c30_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2937_c40_0c30_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2937_c40_0c30_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l2937_c40_0c30_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2937_c40_0c30_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2937_c40_0c30_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_30c6]
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_30c6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_30c6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_30c6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_3aff]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_3aff_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_3aff_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_3aff_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_3aff_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_1cd0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_1cd0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_1cd0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_1cd0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_1cd0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2938_c7_3f46]
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_3f46_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_3f46_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_3f46_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_3f46_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l2938_c40_6062]
signal str1_uxn_opcodes_h_l2938_c40_6062_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l2938_c40_6062_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2938_c40_6062_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2938_c40_6062_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l2938_c40_6062_previous_stack_read : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2938_c40_6062_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_4c39]
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_4c39_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_4c39_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_4c39_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_5ea3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5ea3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5ea3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5ea3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5ea3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_1276]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_1276_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_1276_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_1276_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_1276_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2939_c7_1cd0]
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_1cd0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_1cd0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_1cd0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_1cd0_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l2939_c40_e81d]
signal str2_uxn_opcodes_h_l2939_c40_e81d_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l2939_c40_e81d_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2939_c40_e81d_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2939_c40_e81d_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l2939_c40_e81d_previous_stack_read : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2939_c40_e81d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_626d]
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_626d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_626d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_626d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_e729]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_e729_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_e729_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_e729_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_e729_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c7_cba6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_cba6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_cba6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_cba6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_cba6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2940_c7_1276]
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_1276_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_1276_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_1276_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_1276_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l2940_c40_31f9]
signal lda_uxn_opcodes_h_l2940_c40_31f9_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l2940_c40_31f9_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2940_c40_31f9_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2940_c40_31f9_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2940_c40_31f9_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2940_c40_31f9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2941_c11_19fc]
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_19fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_19fc_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_19fc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c1_630d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_630d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_630d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_630d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_630d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2942_c7_713f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_713f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_713f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_713f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_713f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2941_c7_cba6]
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_cba6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_cba6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_cba6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_cba6_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l2941_c40_f02f]
signal lda2_uxn_opcodes_h_l2941_c40_f02f_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l2941_c40_f02f_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2941_c40_f02f_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2941_c40_f02f_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2941_c40_f02f_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2941_c40_f02f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2942_c11_d3c6]
signal BIN_OP_EQ_uxn_opcodes_h_l2942_c11_d3c6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2942_c11_d3c6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2942_c11_d3c6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2942_c1_b8d2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b8d2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b8d2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b8d2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b8d2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2943_c7_bb37]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_bb37_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_bb37_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_bb37_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_bb37_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2942_c7_713f]
signal opc_result_MUX_uxn_opcodes_h_l2942_c7_713f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2942_c7_713f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2942_c7_713f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2942_c7_713f_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l2942_c40_b0d7]
signal sta_uxn_opcodes_h_l2942_c40_b0d7_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l2942_c40_b0d7_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2942_c40_b0d7_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2942_c40_b0d7_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2942_c40_b0d7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2943_c11_e47d]
signal BIN_OP_EQ_uxn_opcodes_h_l2943_c11_e47d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2943_c11_e47d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2943_c11_e47d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2943_c1_91d3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_91d3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_91d3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_91d3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_91d3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2944_c7_bdf4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_bdf4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_bdf4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_bdf4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_bdf4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2943_c7_bb37]
signal opc_result_MUX_uxn_opcodes_h_l2943_c7_bb37_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2943_c7_bb37_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2943_c7_bb37_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2943_c7_bb37_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l2943_c40_d176]
signal sta2_uxn_opcodes_h_l2943_c40_d176_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l2943_c40_d176_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2943_c40_d176_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2943_c40_d176_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2943_c40_d176_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2944_c11_d52d]
signal BIN_OP_EQ_uxn_opcodes_h_l2944_c11_d52d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2944_c11_d52d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2944_c11_d52d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2944_c1_adea]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_adea_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_adea_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_adea_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_adea_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2945_c7_553d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_553d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_553d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_553d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_553d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2944_c7_bdf4]
signal opc_result_MUX_uxn_opcodes_h_l2944_c7_bdf4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2944_c7_bdf4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2944_c7_bdf4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2944_c7_bdf4_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l2944_c40_ceb7]
signal dei_uxn_opcodes_h_l2944_c40_ceb7_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l2944_c40_ceb7_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2944_c40_ceb7_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2944_c40_ceb7_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2944_c40_ceb7_previous_device_ram_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2944_c40_ceb7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2945_c11_0be9]
signal BIN_OP_EQ_uxn_opcodes_h_l2945_c11_0be9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2945_c11_0be9_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2945_c11_0be9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2945_c1_996d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_996d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_996d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_996d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_996d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2946_c7_756f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_756f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_756f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_756f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_756f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2945_c7_553d]
signal opc_result_MUX_uxn_opcodes_h_l2945_c7_553d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2945_c7_553d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2945_c7_553d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2945_c7_553d_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l2945_c40_67db]
signal dei2_uxn_opcodes_h_l2945_c40_67db_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l2945_c40_67db_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2945_c40_67db_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2945_c40_67db_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2945_c40_67db_previous_device_ram_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2945_c40_67db_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2946_c11_941b]
signal BIN_OP_EQ_uxn_opcodes_h_l2946_c11_941b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2946_c11_941b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2946_c11_941b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2946_c1_780d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_780d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_780d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_780d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_780d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2947_c7_040a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_040a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_040a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_040a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_040a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2946_c7_756f]
signal opc_result_MUX_uxn_opcodes_h_l2946_c7_756f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2946_c7_756f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2946_c7_756f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2946_c7_756f_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l2946_c40_5f8f]
signal deo_uxn_opcodes_h_l2946_c40_5f8f_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l2946_c40_5f8f_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2946_c40_5f8f_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2946_c40_5f8f_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2946_c40_5f8f_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2946_c40_5f8f_previous_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2946_c40_5f8f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2947_c11_cd1f]
signal BIN_OP_EQ_uxn_opcodes_h_l2947_c11_cd1f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2947_c11_cd1f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2947_c11_cd1f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2947_c1_0a9e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_0a9e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_0a9e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_0a9e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_0a9e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2948_c7_d000]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_d000_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_d000_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_d000_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_d000_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2947_c7_040a]
signal opc_result_MUX_uxn_opcodes_h_l2947_c7_040a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2947_c7_040a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2947_c7_040a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2947_c7_040a_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l2947_c40_c304]
signal deo2_uxn_opcodes_h_l2947_c40_c304_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l2947_c40_c304_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2947_c40_c304_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2947_c40_c304_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2947_c40_c304_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2947_c40_c304_previous_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2947_c40_c304_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2948_c11_e832]
signal BIN_OP_EQ_uxn_opcodes_h_l2948_c11_e832_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2948_c11_e832_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2948_c11_e832_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2948_c1_e5bc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_e5bc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_e5bc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_e5bc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_e5bc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2949_c7_a058]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a058_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a058_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a058_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a058_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2948_c7_d000]
signal opc_result_MUX_uxn_opcodes_h_l2948_c7_d000_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2948_c7_d000_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2948_c7_d000_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2948_c7_d000_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l2948_c40_92a0]
signal add_uxn_opcodes_h_l2948_c40_92a0_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l2948_c40_92a0_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2948_c40_92a0_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2948_c40_92a0_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2948_c40_92a0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2949_c11_67ec]
signal BIN_OP_EQ_uxn_opcodes_h_l2949_c11_67ec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2949_c11_67ec_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2949_c11_67ec_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2949_c1_4553]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_4553_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_4553_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_4553_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_4553_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2950_c7_5574]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5574_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5574_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5574_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5574_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2949_c7_a058]
signal opc_result_MUX_uxn_opcodes_h_l2949_c7_a058_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2949_c7_a058_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2949_c7_a058_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2949_c7_a058_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l2949_c40_75dc]
signal add2_uxn_opcodes_h_l2949_c40_75dc_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l2949_c40_75dc_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2949_c40_75dc_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2949_c40_75dc_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2949_c40_75dc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2950_c11_2aa2]
signal BIN_OP_EQ_uxn_opcodes_h_l2950_c11_2aa2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2950_c11_2aa2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2950_c11_2aa2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2950_c1_4f89]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_4f89_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_4f89_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_4f89_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_4f89_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2951_c7_72bf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_72bf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_72bf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_72bf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_72bf_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2950_c7_5574]
signal opc_result_MUX_uxn_opcodes_h_l2950_c7_5574_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2950_c7_5574_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2950_c7_5574_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2950_c7_5574_return_output : opcode_result_t;

-- sub[uxn_opcodes_h_l2950_c40_110d]
signal sub_uxn_opcodes_h_l2950_c40_110d_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub_uxn_opcodes_h_l2950_c40_110d_phase : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2950_c40_110d_ins : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2950_c40_110d_previous_stack_read : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2950_c40_110d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2951_c11_671c]
signal BIN_OP_EQ_uxn_opcodes_h_l2951_c11_671c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2951_c11_671c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2951_c11_671c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2951_c1_1855]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_1855_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_1855_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_1855_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_1855_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2952_c7_5789]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_5789_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_5789_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_5789_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_5789_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2951_c7_72bf]
signal opc_result_MUX_uxn_opcodes_h_l2951_c7_72bf_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2951_c7_72bf_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2951_c7_72bf_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2951_c7_72bf_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l2951_c40_3c50]
signal sub2_uxn_opcodes_h_l2951_c40_3c50_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l2951_c40_3c50_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2951_c40_3c50_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2951_c40_3c50_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2951_c40_3c50_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2952_c11_108f]
signal BIN_OP_EQ_uxn_opcodes_h_l2952_c11_108f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2952_c11_108f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2952_c11_108f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2952_c1_4300]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4300_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4300_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4300_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4300_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2953_c7_87ca]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_87ca_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_87ca_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_87ca_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_87ca_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2952_c7_5789]
signal opc_result_MUX_uxn_opcodes_h_l2952_c7_5789_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2952_c7_5789_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2952_c7_5789_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2952_c7_5789_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l2952_c40_6bd6]
signal mul_uxn_opcodes_h_l2952_c40_6bd6_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l2952_c40_6bd6_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2952_c40_6bd6_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2952_c40_6bd6_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2952_c40_6bd6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2953_c11_f31b]
signal BIN_OP_EQ_uxn_opcodes_h_l2953_c11_f31b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2953_c11_f31b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2953_c11_f31b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2953_c1_3d98]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_3d98_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_3d98_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_3d98_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_3d98_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2954_c7_e7a5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e7a5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e7a5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e7a5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e7a5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2953_c7_87ca]
signal opc_result_MUX_uxn_opcodes_h_l2953_c7_87ca_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2953_c7_87ca_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2953_c7_87ca_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2953_c7_87ca_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l2953_c40_7687]
signal mul2_uxn_opcodes_h_l2953_c40_7687_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l2953_c40_7687_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2953_c40_7687_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2953_c40_7687_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2953_c40_7687_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2954_c11_0077]
signal BIN_OP_EQ_uxn_opcodes_h_l2954_c11_0077_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2954_c11_0077_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2954_c11_0077_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2954_c1_0df9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_0df9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_0df9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_0df9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_0df9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2955_c7_ad12]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ad12_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ad12_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ad12_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ad12_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2954_c7_e7a5]
signal opc_result_MUX_uxn_opcodes_h_l2954_c7_e7a5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2954_c7_e7a5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2954_c7_e7a5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2954_c7_e7a5_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l2954_c40_4707]
signal div_uxn_opcodes_h_l2954_c40_4707_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l2954_c40_4707_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2954_c40_4707_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2954_c40_4707_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2954_c40_4707_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2955_c11_1253]
signal BIN_OP_EQ_uxn_opcodes_h_l2955_c11_1253_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2955_c11_1253_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2955_c11_1253_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2955_c1_8426]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_8426_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_8426_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_8426_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_8426_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2956_c7_1de8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_1de8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_1de8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_1de8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_1de8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2955_c7_ad12]
signal opc_result_MUX_uxn_opcodes_h_l2955_c7_ad12_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2955_c7_ad12_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2955_c7_ad12_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2955_c7_ad12_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l2955_c40_1cb2]
signal div2_uxn_opcodes_h_l2955_c40_1cb2_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l2955_c40_1cb2_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2955_c40_1cb2_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2955_c40_1cb2_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2955_c40_1cb2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2956_c11_0997]
signal BIN_OP_EQ_uxn_opcodes_h_l2956_c11_0997_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2956_c11_0997_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2956_c11_0997_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2956_c1_6f14]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_6f14_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_6f14_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_6f14_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_6f14_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2957_c7_f15f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_f15f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_f15f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_f15f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_f15f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2956_c7_1de8]
signal opc_result_MUX_uxn_opcodes_h_l2956_c7_1de8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2956_c7_1de8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2956_c7_1de8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2956_c7_1de8_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l2956_c40_b846]
signal and_uxn_opcodes_h_l2956_c40_b846_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l2956_c40_b846_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2956_c40_b846_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2956_c40_b846_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2956_c40_b846_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2957_c11_87d0]
signal BIN_OP_EQ_uxn_opcodes_h_l2957_c11_87d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2957_c11_87d0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2957_c11_87d0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2957_c1_5d8f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_5d8f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_5d8f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_5d8f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_5d8f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2958_c7_60b8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_60b8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_60b8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_60b8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_60b8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2957_c7_f15f]
signal opc_result_MUX_uxn_opcodes_h_l2957_c7_f15f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2957_c7_f15f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2957_c7_f15f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2957_c7_f15f_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l2957_c40_a05a]
signal and2_uxn_opcodes_h_l2957_c40_a05a_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l2957_c40_a05a_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2957_c40_a05a_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2957_c40_a05a_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2957_c40_a05a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2958_c11_e66f]
signal BIN_OP_EQ_uxn_opcodes_h_l2958_c11_e66f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2958_c11_e66f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2958_c11_e66f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2958_c1_6dde]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_6dde_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_6dde_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_6dde_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_6dde_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2959_c7_8868]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_8868_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_8868_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_8868_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_8868_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2958_c7_60b8]
signal opc_result_MUX_uxn_opcodes_h_l2958_c7_60b8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2958_c7_60b8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2958_c7_60b8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2958_c7_60b8_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l2958_c40_1e2f]
signal ora_uxn_opcodes_h_l2958_c40_1e2f_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l2958_c40_1e2f_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2958_c40_1e2f_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2958_c40_1e2f_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2958_c40_1e2f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2959_c11_5f9d]
signal BIN_OP_EQ_uxn_opcodes_h_l2959_c11_5f9d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2959_c11_5f9d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2959_c11_5f9d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2959_c1_cdf7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_cdf7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_cdf7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_cdf7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_cdf7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2960_c7_f9db]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_f9db_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_f9db_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_f9db_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_f9db_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2959_c7_8868]
signal opc_result_MUX_uxn_opcodes_h_l2959_c7_8868_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2959_c7_8868_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2959_c7_8868_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2959_c7_8868_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l2959_c40_4dc9]
signal ora2_uxn_opcodes_h_l2959_c40_4dc9_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l2959_c40_4dc9_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2959_c40_4dc9_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2959_c40_4dc9_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2959_c40_4dc9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2960_c11_af73]
signal BIN_OP_EQ_uxn_opcodes_h_l2960_c11_af73_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2960_c11_af73_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2960_c11_af73_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2960_c1_eb8d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_eb8d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_eb8d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_eb8d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_eb8d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2961_c7_23fd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_23fd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_23fd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_23fd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_23fd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2960_c7_f9db]
signal opc_result_MUX_uxn_opcodes_h_l2960_c7_f9db_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2960_c7_f9db_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2960_c7_f9db_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2960_c7_f9db_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l2960_c40_0638]
signal eor_uxn_opcodes_h_l2960_c40_0638_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l2960_c40_0638_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2960_c40_0638_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2960_c40_0638_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2960_c40_0638_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2961_c11_8a0c]
signal BIN_OP_EQ_uxn_opcodes_h_l2961_c11_8a0c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2961_c11_8a0c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2961_c11_8a0c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2961_c1_c132]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_c132_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_c132_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_c132_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_c132_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2962_c7_8da2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_8da2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_8da2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_8da2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_8da2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2961_c7_23fd]
signal opc_result_MUX_uxn_opcodes_h_l2961_c7_23fd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2961_c7_23fd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2961_c7_23fd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2961_c7_23fd_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l2961_c40_8326]
signal eor2_uxn_opcodes_h_l2961_c40_8326_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l2961_c40_8326_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2961_c40_8326_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2961_c40_8326_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2961_c40_8326_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2962_c11_4b7a]
signal BIN_OP_EQ_uxn_opcodes_h_l2962_c11_4b7a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2962_c11_4b7a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2962_c11_4b7a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2962_c1_ab8e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_ab8e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_ab8e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_ab8e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_ab8e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2963_c7_f0c9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_f0c9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_f0c9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_f0c9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_f0c9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2962_c7_8da2]
signal opc_result_MUX_uxn_opcodes_h_l2962_c7_8da2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2962_c7_8da2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2962_c7_8da2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2962_c7_8da2_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l2962_c40_433f]
signal sft_uxn_opcodes_h_l2962_c40_433f_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l2962_c40_433f_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2962_c40_433f_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2962_c40_433f_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2962_c40_433f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2963_c11_1fc0]
signal BIN_OP_EQ_uxn_opcodes_h_l2963_c11_1fc0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2963_c11_1fc0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2963_c11_1fc0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2963_c1_81f3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_81f3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_81f3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_81f3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_81f3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2963_c7_f0c9]
signal opc_result_MUX_uxn_opcodes_h_l2963_c7_f0c9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2963_c7_f0c9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2963_c7_f0c9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2963_c7_f0c9_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l2963_c40_e322]
signal sft2_uxn_opcodes_h_l2963_c40_e322_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l2963_c40_e322_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2963_c40_e322_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2963_c40_e322_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2963_c40_e322_return_output : opcode_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l2966_c17_557e]
signal BIN_OP_AND_uxn_opcodes_h_l2966_c17_557e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2966_c17_557e_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2966_c17_557e_return_output : unsigned(7 downto 0);

-- CONST_SR_6[uxn_opcodes_h_l2966_c17_6eba]
signal CONST_SR_6_uxn_opcodes_h_l2966_c17_6eba_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_opcodes_h_l2966_c17_6eba_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2967_c2_f89b]
signal BIN_OP_XOR_uxn_opcodes_h_l2967_c2_f89b_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2967_c2_f89b_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2967_c2_f89b_return_output : unsigned(0 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2969_c2_16f7]
signal sp0_MUX_uxn_opcodes_h_l2969_c2_16f7_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2969_c2_16f7_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2969_c2_16f7_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2969_c2_16f7_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2969_c2_16f7]
signal sp1_MUX_uxn_opcodes_h_l2969_c2_16f7_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2969_c2_16f7_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2969_c2_16f7_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2969_c2_16f7_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2970_c3_bef6]
signal BIN_OP_PLUS_uxn_opcodes_h_l2970_c3_bef6_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2970_c3_bef6_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2970_c3_bef6_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2972_c3_94ea]
signal BIN_OP_PLUS_uxn_opcodes_h_l2972_c3_94ea_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2972_c3_94ea_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2972_c3_94ea_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l2975_c29_eb6a]
signal MUX_uxn_opcodes_h_l2975_c29_eb6a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2975_c29_eb6a_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2975_c29_eb6a_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2975_c29_eb6a_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2975_c19_f9f9]
signal BIN_OP_MINUS_uxn_opcodes_h_l2975_c19_f9f9_left : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2975_c19_f9f9_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2975_c19_f9f9_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l2976_c20_1046]
signal MUX_uxn_opcodes_h_l2976_c20_1046_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2976_c20_1046_iftrue : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2976_c20_1046_iffalse : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2976_c20_1046_return_output : unsigned(8 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2976_c2_1210]
signal BIN_OP_PLUS_uxn_opcodes_h_l2976_c2_1210_left : unsigned(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2976_c2_1210_right : unsigned(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2976_c2_1210_return_output : unsigned(9 downto 0);

-- stack_ram_update[uxn_opcodes_h_l2978_c24_9680]
signal stack_ram_update_uxn_opcodes_h_l2978_c24_9680_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2978_c24_9680_stack_address : unsigned(8 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2978_c24_9680_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2978_c24_9680_write_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2978_c24_9680_return_output : unsigned(7 downto 0);

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
-- BIN_OP_AND_uxn_opcodes_h_l2886_c14_fbdf
BIN_OP_AND_uxn_opcodes_h_l2886_c14_fbdf : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2886_c14_fbdf_left,
BIN_OP_AND_uxn_opcodes_h_l2886_c14_fbdf_right,
BIN_OP_AND_uxn_opcodes_h_l2886_c14_fbdf_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2887_c14_ab01
BIN_OP_XOR_uxn_opcodes_h_l2887_c14_ab01 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2887_c14_ab01_left,
BIN_OP_XOR_uxn_opcodes_h_l2887_c14_ab01_right,
BIN_OP_XOR_uxn_opcodes_h_l2887_c14_ab01_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2887_c14_243d
BIN_OP_OR_uxn_opcodes_h_l2887_c14_243d : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2887_c14_243d_left,
BIN_OP_OR_uxn_opcodes_h_l2887_c14_243d_right,
BIN_OP_OR_uxn_opcodes_h_l2887_c14_243d_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l2887_c14_86a8
UNARY_OP_NOT_uxn_opcodes_h_l2887_c14_86a8 : entity work.UNARY_OP_NOT_uint8_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l2887_c14_86a8_expr,
UNARY_OP_NOT_uxn_opcodes_h_l2887_c14_86a8_return_output);

-- BIN_OP_NEQ_uxn_opcodes_h_l2887_c14_f0ba
BIN_OP_NEQ_uxn_opcodes_h_l2887_c14_f0ba : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_opcodes_h_l2887_c14_f0ba_left,
BIN_OP_NEQ_uxn_opcodes_h_l2887_c14_f0ba_right,
BIN_OP_NEQ_uxn_opcodes_h_l2887_c14_f0ba_return_output);

-- MUX_uxn_opcodes_h_l2887_c14_92de
MUX_uxn_opcodes_h_l2887_c14_92de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2887_c14_92de_cond,
MUX_uxn_opcodes_h_l2887_c14_92de_iftrue,
MUX_uxn_opcodes_h_l2887_c14_92de_iffalse,
MUX_uxn_opcodes_h_l2887_c14_92de_return_output);

-- MUX_uxn_opcodes_h_l2888_c8_3cba
MUX_uxn_opcodes_h_l2888_c8_3cba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2888_c8_3cba_cond,
MUX_uxn_opcodes_h_l2888_c8_3cba_iftrue,
MUX_uxn_opcodes_h_l2888_c8_3cba_iffalse,
MUX_uxn_opcodes_h_l2888_c8_3cba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2894_c6_9135
BIN_OP_EQ_uxn_opcodes_h_l2894_c6_9135 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2894_c6_9135_left,
BIN_OP_EQ_uxn_opcodes_h_l2894_c6_9135_right,
BIN_OP_EQ_uxn_opcodes_h_l2894_c6_9135_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9bf1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9bf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9bf1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9bf1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9bf1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9bf1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf
opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_cond,
opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_iftrue,
opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_iffalse,
opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_return_output);

-- is_wait_MUX_uxn_opcodes_h_l2894_c2_fcbf
is_wait_MUX_uxn_opcodes_h_l2894_c2_fcbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_wait_MUX_uxn_opcodes_h_l2894_c2_fcbf_cond,
is_wait_MUX_uxn_opcodes_h_l2894_c2_fcbf_iftrue,
is_wait_MUX_uxn_opcodes_h_l2894_c2_fcbf_iffalse,
is_wait_MUX_uxn_opcodes_h_l2894_c2_fcbf_return_output);

-- brk_uxn_opcodes_h_l2894_c48_80b6
brk_uxn_opcodes_h_l2894_c48_80b6 : entity work.brk_0CLK_b45f1687 port map (
brk_uxn_opcodes_h_l2894_c48_80b6_phase,
brk_uxn_opcodes_h_l2894_c48_80b6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3307
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3307 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3307_left,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3307_right,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3307_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_84c1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_84c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_84c1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_84c1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_84c1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_84c1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_8c27
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_8c27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_8c27_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_8c27_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_8c27_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_8c27_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2895_c7_9bf1
opc_result_MUX_uxn_opcodes_h_l2895_c7_9bf1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2895_c7_9bf1_cond,
opc_result_MUX_uxn_opcodes_h_l2895_c7_9bf1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2895_c7_9bf1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2895_c7_9bf1_return_output);

-- jci_uxn_opcodes_h_l2895_c40_387e
jci_uxn_opcodes_h_l2895_c40_387e : entity work.jci_0CLK_4351dde2 port map (
clk,
jci_uxn_opcodes_h_l2895_c40_387e_CLOCK_ENABLE,
jci_uxn_opcodes_h_l2895_c40_387e_phase,
jci_uxn_opcodes_h_l2895_c40_387e_pc,
jci_uxn_opcodes_h_l2895_c40_387e_previous_stack_read,
jci_uxn_opcodes_h_l2895_c40_387e_previous_ram_read,
jci_uxn_opcodes_h_l2895_c40_387e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2896_c11_d934
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_d934 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_d934_left,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_d934_right,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_d934_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_b2f8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_b2f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_b2f8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_b2f8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_b2f8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_b2f8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_f181
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_f181 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_f181_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_f181_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_f181_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_f181_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2896_c7_8c27
opc_result_MUX_uxn_opcodes_h_l2896_c7_8c27 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2896_c7_8c27_cond,
opc_result_MUX_uxn_opcodes_h_l2896_c7_8c27_iftrue,
opc_result_MUX_uxn_opcodes_h_l2896_c7_8c27_iffalse,
opc_result_MUX_uxn_opcodes_h_l2896_c7_8c27_return_output);

-- jmi_uxn_opcodes_h_l2896_c40_df61
jmi_uxn_opcodes_h_l2896_c40_df61 : entity work.jmi_0CLK_937caaea port map (
clk,
jmi_uxn_opcodes_h_l2896_c40_df61_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l2896_c40_df61_phase,
jmi_uxn_opcodes_h_l2896_c40_df61_pc,
jmi_uxn_opcodes_h_l2896_c40_df61_previous_ram_read,
jmi_uxn_opcodes_h_l2896_c40_df61_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2897_c11_728f
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_728f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_728f_left,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_728f_right,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_728f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b586
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b586 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b586_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b586_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b586_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b586_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c2ab
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c2ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c2ab_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c2ab_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c2ab_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c2ab_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2897_c7_f181
opc_result_MUX_uxn_opcodes_h_l2897_c7_f181 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2897_c7_f181_cond,
opc_result_MUX_uxn_opcodes_h_l2897_c7_f181_iftrue,
opc_result_MUX_uxn_opcodes_h_l2897_c7_f181_iffalse,
opc_result_MUX_uxn_opcodes_h_l2897_c7_f181_return_output);

-- jsi_uxn_opcodes_h_l2897_c40_c6e2
jsi_uxn_opcodes_h_l2897_c40_c6e2 : entity work.jsi_0CLK_1c7b7172 port map (
clk,
jsi_uxn_opcodes_h_l2897_c40_c6e2_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l2897_c40_c6e2_phase,
jsi_uxn_opcodes_h_l2897_c40_c6e2_pc,
jsi_uxn_opcodes_h_l2897_c40_c6e2_previous_ram_read,
jsi_uxn_opcodes_h_l2897_c40_c6e2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2898_c11_42f5
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_42f5 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_42f5_left,
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_42f5_right,
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_42f5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_bc05
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_bc05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_bc05_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_bc05_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_bc05_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_bc05_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9048
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9048 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9048_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9048_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9048_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9048_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2898_c7_c2ab
opc_result_MUX_uxn_opcodes_h_l2898_c7_c2ab : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2898_c7_c2ab_cond,
opc_result_MUX_uxn_opcodes_h_l2898_c7_c2ab_iftrue,
opc_result_MUX_uxn_opcodes_h_l2898_c7_c2ab_iffalse,
opc_result_MUX_uxn_opcodes_h_l2898_c7_c2ab_return_output);

-- lit_uxn_opcodes_h_l2898_c40_1897
lit_uxn_opcodes_h_l2898_c40_1897 : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2898_c40_1897_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2898_c40_1897_phase,
lit_uxn_opcodes_h_l2898_c40_1897_pc,
lit_uxn_opcodes_h_l2898_c40_1897_previous_ram_read,
lit_uxn_opcodes_h_l2898_c40_1897_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6ef1
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6ef1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6ef1_left,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6ef1_right,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6ef1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_942a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_942a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_942a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_942a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_942a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_942a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a9ef
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a9ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a9ef_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a9ef_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a9ef_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a9ef_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2899_c7_9048
opc_result_MUX_uxn_opcodes_h_l2899_c7_9048 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2899_c7_9048_cond,
opc_result_MUX_uxn_opcodes_h_l2899_c7_9048_iftrue,
opc_result_MUX_uxn_opcodes_h_l2899_c7_9048_iffalse,
opc_result_MUX_uxn_opcodes_h_l2899_c7_9048_return_output);

-- lit2_uxn_opcodes_h_l2899_c40_f5bd
lit2_uxn_opcodes_h_l2899_c40_f5bd : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2899_c40_f5bd_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2899_c40_f5bd_phase,
lit2_uxn_opcodes_h_l2899_c40_f5bd_pc,
lit2_uxn_opcodes_h_l2899_c40_f5bd_previous_ram_read,
lit2_uxn_opcodes_h_l2899_c40_f5bd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2900_c11_2277
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_2277 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_2277_left,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_2277_right,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_2277_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a842
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a842 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a842_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a842_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a842_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a842_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_15dc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_15dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_15dc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_15dc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_15dc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_15dc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2900_c7_a9ef
opc_result_MUX_uxn_opcodes_h_l2900_c7_a9ef : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2900_c7_a9ef_cond,
opc_result_MUX_uxn_opcodes_h_l2900_c7_a9ef_iftrue,
opc_result_MUX_uxn_opcodes_h_l2900_c7_a9ef_iffalse,
opc_result_MUX_uxn_opcodes_h_l2900_c7_a9ef_return_output);

-- lit_uxn_opcodes_h_l2900_c40_37bb
lit_uxn_opcodes_h_l2900_c40_37bb : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2900_c40_37bb_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2900_c40_37bb_phase,
lit_uxn_opcodes_h_l2900_c40_37bb_pc,
lit_uxn_opcodes_h_l2900_c40_37bb_previous_ram_read,
lit_uxn_opcodes_h_l2900_c40_37bb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2901_c11_9184
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_9184 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_9184_left,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_9184_right,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_9184_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_8dba
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_8dba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_8dba_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_8dba_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_8dba_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_8dba_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_84ad
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_84ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_84ad_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_84ad_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_84ad_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_84ad_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2901_c7_15dc
opc_result_MUX_uxn_opcodes_h_l2901_c7_15dc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2901_c7_15dc_cond,
opc_result_MUX_uxn_opcodes_h_l2901_c7_15dc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2901_c7_15dc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2901_c7_15dc_return_output);

-- lit2_uxn_opcodes_h_l2901_c40_9bbc
lit2_uxn_opcodes_h_l2901_c40_9bbc : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2901_c40_9bbc_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2901_c40_9bbc_phase,
lit2_uxn_opcodes_h_l2901_c40_9bbc_pc,
lit2_uxn_opcodes_h_l2901_c40_9bbc_previous_ram_read,
lit2_uxn_opcodes_h_l2901_c40_9bbc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2902_c11_34a9
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_34a9 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_34a9_left,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_34a9_right,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_34a9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_b4f2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_b4f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_b4f2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_b4f2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_b4f2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_b4f2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_ae00
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_ae00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_ae00_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_ae00_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_ae00_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_ae00_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2902_c7_84ad
opc_result_MUX_uxn_opcodes_h_l2902_c7_84ad : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2902_c7_84ad_cond,
opc_result_MUX_uxn_opcodes_h_l2902_c7_84ad_iftrue,
opc_result_MUX_uxn_opcodes_h_l2902_c7_84ad_iffalse,
opc_result_MUX_uxn_opcodes_h_l2902_c7_84ad_return_output);

-- inc_uxn_opcodes_h_l2902_c40_39f6
inc_uxn_opcodes_h_l2902_c40_39f6 : entity work.inc_0CLK_121b1df5 port map (
clk,
inc_uxn_opcodes_h_l2902_c40_39f6_CLOCK_ENABLE,
inc_uxn_opcodes_h_l2902_c40_39f6_phase,
inc_uxn_opcodes_h_l2902_c40_39f6_ins,
inc_uxn_opcodes_h_l2902_c40_39f6_previous_stack_read,
inc_uxn_opcodes_h_l2902_c40_39f6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2d46
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2d46 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2d46_left,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2d46_right,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2d46_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_113e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_113e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_113e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_113e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_113e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_113e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dbf4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dbf4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dbf4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dbf4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dbf4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dbf4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2903_c7_ae00
opc_result_MUX_uxn_opcodes_h_l2903_c7_ae00 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2903_c7_ae00_cond,
opc_result_MUX_uxn_opcodes_h_l2903_c7_ae00_iftrue,
opc_result_MUX_uxn_opcodes_h_l2903_c7_ae00_iffalse,
opc_result_MUX_uxn_opcodes_h_l2903_c7_ae00_return_output);

-- inc2_uxn_opcodes_h_l2903_c40_37be
inc2_uxn_opcodes_h_l2903_c40_37be : entity work.inc2_0CLK_180c5210 port map (
clk,
inc2_uxn_opcodes_h_l2903_c40_37be_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l2903_c40_37be_phase,
inc2_uxn_opcodes_h_l2903_c40_37be_ins,
inc2_uxn_opcodes_h_l2903_c40_37be_previous_stack_read,
inc2_uxn_opcodes_h_l2903_c40_37be_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2904_c11_bc4d
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_bc4d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_bc4d_left,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_bc4d_right,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_bc4d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_369b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_369b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_369b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_369b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_369b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_369b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c240
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c240 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c240_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c240_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c240_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c240_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2904_c7_dbf4
opc_result_MUX_uxn_opcodes_h_l2904_c7_dbf4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2904_c7_dbf4_cond,
opc_result_MUX_uxn_opcodes_h_l2904_c7_dbf4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2904_c7_dbf4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2904_c7_dbf4_return_output);

-- pop_uxn_opcodes_h_l2904_c40_f75b
pop_uxn_opcodes_h_l2904_c40_f75b : entity work.pop_0CLK_b0b628a3 port map (
clk,
pop_uxn_opcodes_h_l2904_c40_f75b_CLOCK_ENABLE,
pop_uxn_opcodes_h_l2904_c40_f75b_phase,
pop_uxn_opcodes_h_l2904_c40_f75b_ins,
pop_uxn_opcodes_h_l2904_c40_f75b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d3f6
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d3f6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d3f6_left,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d3f6_right,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d3f6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_f3e4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_f3e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_f3e4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_f3e4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_f3e4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_f3e4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e572
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e572 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e572_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e572_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e572_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e572_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2905_c7_c240
opc_result_MUX_uxn_opcodes_h_l2905_c7_c240 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2905_c7_c240_cond,
opc_result_MUX_uxn_opcodes_h_l2905_c7_c240_iftrue,
opc_result_MUX_uxn_opcodes_h_l2905_c7_c240_iffalse,
opc_result_MUX_uxn_opcodes_h_l2905_c7_c240_return_output);

-- pop2_uxn_opcodes_h_l2905_c40_d926
pop2_uxn_opcodes_h_l2905_c40_d926 : entity work.pop2_0CLK_b0b628a3 port map (
clk,
pop2_uxn_opcodes_h_l2905_c40_d926_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l2905_c40_d926_phase,
pop2_uxn_opcodes_h_l2905_c40_d926_ins,
pop2_uxn_opcodes_h_l2905_c40_d926_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ac3b
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ac3b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ac3b_left,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ac3b_right,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ac3b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_e895
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_e895 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_e895_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_e895_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_e895_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_e895_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_90ba
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_90ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_90ba_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_90ba_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_90ba_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_90ba_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2906_c7_e572
opc_result_MUX_uxn_opcodes_h_l2906_c7_e572 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2906_c7_e572_cond,
opc_result_MUX_uxn_opcodes_h_l2906_c7_e572_iftrue,
opc_result_MUX_uxn_opcodes_h_l2906_c7_e572_iffalse,
opc_result_MUX_uxn_opcodes_h_l2906_c7_e572_return_output);

-- nip_uxn_opcodes_h_l2906_c40_5cae
nip_uxn_opcodes_h_l2906_c40_5cae : entity work.nip_0CLK_d0ab213f port map (
clk,
nip_uxn_opcodes_h_l2906_c40_5cae_CLOCK_ENABLE,
nip_uxn_opcodes_h_l2906_c40_5cae_phase,
nip_uxn_opcodes_h_l2906_c40_5cae_ins,
nip_uxn_opcodes_h_l2906_c40_5cae_previous_stack_read,
nip_uxn_opcodes_h_l2906_c40_5cae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2907_c11_d7c5
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_d7c5 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_d7c5_left,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_d7c5_right,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_d7c5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_d39f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_d39f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_d39f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_d39f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_d39f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_d39f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f462
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f462 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f462_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f462_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f462_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f462_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2907_c7_90ba
opc_result_MUX_uxn_opcodes_h_l2907_c7_90ba : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2907_c7_90ba_cond,
opc_result_MUX_uxn_opcodes_h_l2907_c7_90ba_iftrue,
opc_result_MUX_uxn_opcodes_h_l2907_c7_90ba_iffalse,
opc_result_MUX_uxn_opcodes_h_l2907_c7_90ba_return_output);

-- nip2_uxn_opcodes_h_l2907_c40_5b74
nip2_uxn_opcodes_h_l2907_c40_5b74 : entity work.nip2_0CLK_1a2ef46d port map (
clk,
nip2_uxn_opcodes_h_l2907_c40_5b74_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l2907_c40_5b74_phase,
nip2_uxn_opcodes_h_l2907_c40_5b74_ins,
nip2_uxn_opcodes_h_l2907_c40_5b74_previous_stack_read,
nip2_uxn_opcodes_h_l2907_c40_5b74_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2908_c11_625a
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_625a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_625a_left,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_625a_right,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_625a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e20f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e20f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e20f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e20f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e20f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e20f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_71b2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_71b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_71b2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_71b2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_71b2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_71b2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2908_c7_f462
opc_result_MUX_uxn_opcodes_h_l2908_c7_f462 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2908_c7_f462_cond,
opc_result_MUX_uxn_opcodes_h_l2908_c7_f462_iftrue,
opc_result_MUX_uxn_opcodes_h_l2908_c7_f462_iffalse,
opc_result_MUX_uxn_opcodes_h_l2908_c7_f462_return_output);

-- swp_uxn_opcodes_h_l2908_c40_65fd
swp_uxn_opcodes_h_l2908_c40_65fd : entity work.swp_0CLK_0d289325 port map (
clk,
swp_uxn_opcodes_h_l2908_c40_65fd_CLOCK_ENABLE,
swp_uxn_opcodes_h_l2908_c40_65fd_phase,
swp_uxn_opcodes_h_l2908_c40_65fd_ins,
swp_uxn_opcodes_h_l2908_c40_65fd_previous_stack_read,
swp_uxn_opcodes_h_l2908_c40_65fd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2909_c11_1ad1
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_1ad1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_1ad1_left,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_1ad1_right,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_1ad1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0af4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0af4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0af4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0af4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0af4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0af4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_78e8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_78e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_78e8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_78e8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_78e8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_78e8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2909_c7_71b2
opc_result_MUX_uxn_opcodes_h_l2909_c7_71b2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2909_c7_71b2_cond,
opc_result_MUX_uxn_opcodes_h_l2909_c7_71b2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2909_c7_71b2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2909_c7_71b2_return_output);

-- swp2_uxn_opcodes_h_l2909_c40_cd1b
swp2_uxn_opcodes_h_l2909_c40_cd1b : entity work.swp2_0CLK_814c2afd port map (
clk,
swp2_uxn_opcodes_h_l2909_c40_cd1b_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l2909_c40_cd1b_phase,
swp2_uxn_opcodes_h_l2909_c40_cd1b_ins,
swp2_uxn_opcodes_h_l2909_c40_cd1b_previous_stack_read,
swp2_uxn_opcodes_h_l2909_c40_cd1b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b359
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b359 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b359_left,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b359_right,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b359_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_8667
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_8667 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_8667_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_8667_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_8667_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_8667_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_809c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_809c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_809c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_809c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_809c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_809c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2910_c7_78e8
opc_result_MUX_uxn_opcodes_h_l2910_c7_78e8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2910_c7_78e8_cond,
opc_result_MUX_uxn_opcodes_h_l2910_c7_78e8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2910_c7_78e8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2910_c7_78e8_return_output);

-- rot_uxn_opcodes_h_l2910_c40_0769
rot_uxn_opcodes_h_l2910_c40_0769 : entity work.rot_0CLK_b288bfb7 port map (
clk,
rot_uxn_opcodes_h_l2910_c40_0769_CLOCK_ENABLE,
rot_uxn_opcodes_h_l2910_c40_0769_phase,
rot_uxn_opcodes_h_l2910_c40_0769_ins,
rot_uxn_opcodes_h_l2910_c40_0769_previous_stack_read,
rot_uxn_opcodes_h_l2910_c40_0769_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2911_c11_5b26
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_5b26 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_5b26_left,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_5b26_right,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_5b26_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_df92
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_df92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_df92_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_df92_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_df92_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_df92_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0bda
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0bda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0bda_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0bda_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0bda_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0bda_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2911_c7_809c
opc_result_MUX_uxn_opcodes_h_l2911_c7_809c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2911_c7_809c_cond,
opc_result_MUX_uxn_opcodes_h_l2911_c7_809c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2911_c7_809c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2911_c7_809c_return_output);

-- rot2_uxn_opcodes_h_l2911_c40_0152
rot2_uxn_opcodes_h_l2911_c40_0152 : entity work.rot2_0CLK_8e773831 port map (
clk,
rot2_uxn_opcodes_h_l2911_c40_0152_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l2911_c40_0152_phase,
rot2_uxn_opcodes_h_l2911_c40_0152_ins,
rot2_uxn_opcodes_h_l2911_c40_0152_previous_stack_read,
rot2_uxn_opcodes_h_l2911_c40_0152_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3d0d
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3d0d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3d0d_left,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3d0d_right,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3d0d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_a78f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_a78f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_a78f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_a78f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_a78f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_a78f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3c3c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3c3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3c3c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3c3c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3c3c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3c3c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2912_c7_0bda
opc_result_MUX_uxn_opcodes_h_l2912_c7_0bda : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2912_c7_0bda_cond,
opc_result_MUX_uxn_opcodes_h_l2912_c7_0bda_iftrue,
opc_result_MUX_uxn_opcodes_h_l2912_c7_0bda_iffalse,
opc_result_MUX_uxn_opcodes_h_l2912_c7_0bda_return_output);

-- dup_uxn_opcodes_h_l2912_c40_f0d1
dup_uxn_opcodes_h_l2912_c40_f0d1 : entity work.dup_0CLK_d4b33a56 port map (
clk,
dup_uxn_opcodes_h_l2912_c40_f0d1_CLOCK_ENABLE,
dup_uxn_opcodes_h_l2912_c40_f0d1_phase,
dup_uxn_opcodes_h_l2912_c40_f0d1_ins,
dup_uxn_opcodes_h_l2912_c40_f0d1_previous_stack_read,
dup_uxn_opcodes_h_l2912_c40_f0d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e050
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e050 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e050_left,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e050_right,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e050_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_5027
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_5027 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_5027_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_5027_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_5027_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_5027_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_b249
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_b249 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_b249_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_b249_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_b249_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_b249_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2913_c7_3c3c
opc_result_MUX_uxn_opcodes_h_l2913_c7_3c3c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2913_c7_3c3c_cond,
opc_result_MUX_uxn_opcodes_h_l2913_c7_3c3c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2913_c7_3c3c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2913_c7_3c3c_return_output);

-- dup2_uxn_opcodes_h_l2913_c40_907f
dup2_uxn_opcodes_h_l2913_c40_907f : entity work.dup2_0CLK_e4095020 port map (
clk,
dup2_uxn_opcodes_h_l2913_c40_907f_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l2913_c40_907f_phase,
dup2_uxn_opcodes_h_l2913_c40_907f_ins,
dup2_uxn_opcodes_h_l2913_c40_907f_previous_stack_read,
dup2_uxn_opcodes_h_l2913_c40_907f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2914_c11_c146
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_c146 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_c146_left,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_c146_right,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_c146_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_cfdb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_cfdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_cfdb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_cfdb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_cfdb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_cfdb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5684
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5684 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5684_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5684_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5684_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5684_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2914_c7_b249
opc_result_MUX_uxn_opcodes_h_l2914_c7_b249 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2914_c7_b249_cond,
opc_result_MUX_uxn_opcodes_h_l2914_c7_b249_iftrue,
opc_result_MUX_uxn_opcodes_h_l2914_c7_b249_iffalse,
opc_result_MUX_uxn_opcodes_h_l2914_c7_b249_return_output);

-- ovr_uxn_opcodes_h_l2914_c40_15b0
ovr_uxn_opcodes_h_l2914_c40_15b0 : entity work.ovr_0CLK_61914e8d port map (
clk,
ovr_uxn_opcodes_h_l2914_c40_15b0_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l2914_c40_15b0_phase,
ovr_uxn_opcodes_h_l2914_c40_15b0_ins,
ovr_uxn_opcodes_h_l2914_c40_15b0_previous_stack_read,
ovr_uxn_opcodes_h_l2914_c40_15b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9f05
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9f05 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9f05_left,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9f05_right,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9f05_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_4cf0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_4cf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_4cf0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_4cf0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_4cf0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_4cf0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c7b4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c7b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c7b4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c7b4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c7b4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c7b4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2915_c7_5684
opc_result_MUX_uxn_opcodes_h_l2915_c7_5684 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2915_c7_5684_cond,
opc_result_MUX_uxn_opcodes_h_l2915_c7_5684_iftrue,
opc_result_MUX_uxn_opcodes_h_l2915_c7_5684_iffalse,
opc_result_MUX_uxn_opcodes_h_l2915_c7_5684_return_output);

-- ovr2_uxn_opcodes_h_l2915_c40_e347
ovr2_uxn_opcodes_h_l2915_c40_e347 : entity work.ovr2_0CLK_bb09c2cb port map (
clk,
ovr2_uxn_opcodes_h_l2915_c40_e347_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l2915_c40_e347_phase,
ovr2_uxn_opcodes_h_l2915_c40_e347_ins,
ovr2_uxn_opcodes_h_l2915_c40_e347_previous_stack_read,
ovr2_uxn_opcodes_h_l2915_c40_e347_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2916_c11_5f3c
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_5f3c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_5f3c_left,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_5f3c_right,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_5f3c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_eeb9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_eeb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_eeb9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_eeb9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_eeb9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_eeb9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_9fc1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_9fc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_9fc1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_9fc1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_9fc1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_9fc1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2916_c7_c7b4
opc_result_MUX_uxn_opcodes_h_l2916_c7_c7b4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2916_c7_c7b4_cond,
opc_result_MUX_uxn_opcodes_h_l2916_c7_c7b4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2916_c7_c7b4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2916_c7_c7b4_return_output);

-- equ_uxn_opcodes_h_l2916_c40_2ca8
equ_uxn_opcodes_h_l2916_c40_2ca8 : entity work.equ_0CLK_226c8821 port map (
clk,
equ_uxn_opcodes_h_l2916_c40_2ca8_CLOCK_ENABLE,
equ_uxn_opcodes_h_l2916_c40_2ca8_phase,
equ_uxn_opcodes_h_l2916_c40_2ca8_ins,
equ_uxn_opcodes_h_l2916_c40_2ca8_previous_stack_read,
equ_uxn_opcodes_h_l2916_c40_2ca8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d97f
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d97f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d97f_left,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d97f_right,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d97f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f445
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f445 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f445_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f445_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f445_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f445_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_079c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_079c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_079c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_079c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_079c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_079c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2917_c7_9fc1
opc_result_MUX_uxn_opcodes_h_l2917_c7_9fc1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2917_c7_9fc1_cond,
opc_result_MUX_uxn_opcodes_h_l2917_c7_9fc1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2917_c7_9fc1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2917_c7_9fc1_return_output);

-- equ2_uxn_opcodes_h_l2917_c40_7b86
equ2_uxn_opcodes_h_l2917_c40_7b86 : entity work.equ2_0CLK_609876da port map (
clk,
equ2_uxn_opcodes_h_l2917_c40_7b86_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l2917_c40_7b86_phase,
equ2_uxn_opcodes_h_l2917_c40_7b86_ins,
equ2_uxn_opcodes_h_l2917_c40_7b86_previous_stack_read,
equ2_uxn_opcodes_h_l2917_c40_7b86_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2918_c11_707f
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_707f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_707f_left,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_707f_right,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_707f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ba3a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ba3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ba3a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ba3a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ba3a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ba3a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_725b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_725b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_725b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_725b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_725b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_725b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2918_c7_079c
opc_result_MUX_uxn_opcodes_h_l2918_c7_079c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2918_c7_079c_cond,
opc_result_MUX_uxn_opcodes_h_l2918_c7_079c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2918_c7_079c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2918_c7_079c_return_output);

-- neq_uxn_opcodes_h_l2918_c40_ab73
neq_uxn_opcodes_h_l2918_c40_ab73 : entity work.neq_0CLK_226c8821 port map (
clk,
neq_uxn_opcodes_h_l2918_c40_ab73_CLOCK_ENABLE,
neq_uxn_opcodes_h_l2918_c40_ab73_phase,
neq_uxn_opcodes_h_l2918_c40_ab73_ins,
neq_uxn_opcodes_h_l2918_c40_ab73_previous_stack_read,
neq_uxn_opcodes_h_l2918_c40_ab73_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2919_c11_071c
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_071c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_071c_left,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_071c_right,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_071c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4d9d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4d9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4d9d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4d9d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4d9d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4d9d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3041
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3041 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3041_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3041_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3041_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3041_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2919_c7_725b
opc_result_MUX_uxn_opcodes_h_l2919_c7_725b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2919_c7_725b_cond,
opc_result_MUX_uxn_opcodes_h_l2919_c7_725b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2919_c7_725b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2919_c7_725b_return_output);

-- neq2_uxn_opcodes_h_l2919_c40_d31b
neq2_uxn_opcodes_h_l2919_c40_d31b : entity work.neq2_0CLK_609876da port map (
clk,
neq2_uxn_opcodes_h_l2919_c40_d31b_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l2919_c40_d31b_phase,
neq2_uxn_opcodes_h_l2919_c40_d31b_ins,
neq2_uxn_opcodes_h_l2919_c40_d31b_previous_stack_read,
neq2_uxn_opcodes_h_l2919_c40_d31b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2920_c11_93b4
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_93b4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_93b4_left,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_93b4_right,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_93b4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e5df
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e5df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e5df_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e5df_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e5df_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e5df_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_9d27
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_9d27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_9d27_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_9d27_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_9d27_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_9d27_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2920_c7_3041
opc_result_MUX_uxn_opcodes_h_l2920_c7_3041 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2920_c7_3041_cond,
opc_result_MUX_uxn_opcodes_h_l2920_c7_3041_iftrue,
opc_result_MUX_uxn_opcodes_h_l2920_c7_3041_iffalse,
opc_result_MUX_uxn_opcodes_h_l2920_c7_3041_return_output);

-- gth_uxn_opcodes_h_l2920_c40_29df
gth_uxn_opcodes_h_l2920_c40_29df : entity work.gth_0CLK_226c8821 port map (
clk,
gth_uxn_opcodes_h_l2920_c40_29df_CLOCK_ENABLE,
gth_uxn_opcodes_h_l2920_c40_29df_phase,
gth_uxn_opcodes_h_l2920_c40_29df_ins,
gth_uxn_opcodes_h_l2920_c40_29df_previous_stack_read,
gth_uxn_opcodes_h_l2920_c40_29df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2921_c11_5811
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_5811 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_5811_left,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_5811_right,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_5811_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f1ec
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f1ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f1ec_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f1ec_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f1ec_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f1ec_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_569e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_569e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_569e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_569e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_569e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_569e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2921_c7_9d27
opc_result_MUX_uxn_opcodes_h_l2921_c7_9d27 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2921_c7_9d27_cond,
opc_result_MUX_uxn_opcodes_h_l2921_c7_9d27_iftrue,
opc_result_MUX_uxn_opcodes_h_l2921_c7_9d27_iffalse,
opc_result_MUX_uxn_opcodes_h_l2921_c7_9d27_return_output);

-- gth2_uxn_opcodes_h_l2921_c40_1b5f
gth2_uxn_opcodes_h_l2921_c40_1b5f : entity work.gth2_0CLK_609876da port map (
clk,
gth2_uxn_opcodes_h_l2921_c40_1b5f_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l2921_c40_1b5f_phase,
gth2_uxn_opcodes_h_l2921_c40_1b5f_ins,
gth2_uxn_opcodes_h_l2921_c40_1b5f_previous_stack_read,
gth2_uxn_opcodes_h_l2921_c40_1b5f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3054
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3054 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3054_left,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3054_right,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3054_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_5bef
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_5bef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_5bef_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_5bef_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_5bef_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_5bef_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_063c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_063c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_063c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_063c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_063c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_063c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2922_c7_569e
opc_result_MUX_uxn_opcodes_h_l2922_c7_569e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2922_c7_569e_cond,
opc_result_MUX_uxn_opcodes_h_l2922_c7_569e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2922_c7_569e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2922_c7_569e_return_output);

-- lth_uxn_opcodes_h_l2922_c40_6c45
lth_uxn_opcodes_h_l2922_c40_6c45 : entity work.lth_0CLK_226c8821 port map (
clk,
lth_uxn_opcodes_h_l2922_c40_6c45_CLOCK_ENABLE,
lth_uxn_opcodes_h_l2922_c40_6c45_phase,
lth_uxn_opcodes_h_l2922_c40_6c45_ins,
lth_uxn_opcodes_h_l2922_c40_6c45_previous_stack_read,
lth_uxn_opcodes_h_l2922_c40_6c45_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2dfe
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2dfe : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2dfe_left,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2dfe_right,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2dfe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_c400
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_c400 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_c400_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_c400_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_c400_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_c400_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_60be
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_60be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_60be_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_60be_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_60be_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_60be_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2923_c7_063c
opc_result_MUX_uxn_opcodes_h_l2923_c7_063c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2923_c7_063c_cond,
opc_result_MUX_uxn_opcodes_h_l2923_c7_063c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2923_c7_063c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2923_c7_063c_return_output);

-- lth2_uxn_opcodes_h_l2923_c40_a691
lth2_uxn_opcodes_h_l2923_c40_a691 : entity work.lth2_0CLK_609876da port map (
clk,
lth2_uxn_opcodes_h_l2923_c40_a691_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l2923_c40_a691_phase,
lth2_uxn_opcodes_h_l2923_c40_a691_ins,
lth2_uxn_opcodes_h_l2923_c40_a691_previous_stack_read,
lth2_uxn_opcodes_h_l2923_c40_a691_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1871
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1871 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1871_left,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1871_right,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1871_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2cff
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2cff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2cff_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2cff_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2cff_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2cff_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_f293
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_f293 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_f293_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_f293_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_f293_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_f293_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2924_c7_60be
opc_result_MUX_uxn_opcodes_h_l2924_c7_60be : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2924_c7_60be_cond,
opc_result_MUX_uxn_opcodes_h_l2924_c7_60be_iftrue,
opc_result_MUX_uxn_opcodes_h_l2924_c7_60be_iffalse,
opc_result_MUX_uxn_opcodes_h_l2924_c7_60be_return_output);

-- jmp_uxn_opcodes_h_l2924_c40_7981
jmp_uxn_opcodes_h_l2924_c40_7981 : entity work.jmp_0CLK_121b1df5 port map (
clk,
jmp_uxn_opcodes_h_l2924_c40_7981_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l2924_c40_7981_phase,
jmp_uxn_opcodes_h_l2924_c40_7981_ins,
jmp_uxn_opcodes_h_l2924_c40_7981_pc,
jmp_uxn_opcodes_h_l2924_c40_7981_previous_stack_read,
jmp_uxn_opcodes_h_l2924_c40_7981_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2925_c11_ca16
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_ca16 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_ca16_left,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_ca16_right,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_ca16_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_a50b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_a50b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_a50b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_a50b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_a50b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_a50b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_4fc7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_4fc7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_4fc7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_4fc7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_4fc7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_4fc7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2925_c7_f293
opc_result_MUX_uxn_opcodes_h_l2925_c7_f293 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2925_c7_f293_cond,
opc_result_MUX_uxn_opcodes_h_l2925_c7_f293_iftrue,
opc_result_MUX_uxn_opcodes_h_l2925_c7_f293_iffalse,
opc_result_MUX_uxn_opcodes_h_l2925_c7_f293_return_output);

-- jmp2_uxn_opcodes_h_l2925_c40_8785
jmp2_uxn_opcodes_h_l2925_c40_8785 : entity work.jmp2_0CLK_d6642053 port map (
clk,
jmp2_uxn_opcodes_h_l2925_c40_8785_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l2925_c40_8785_phase,
jmp2_uxn_opcodes_h_l2925_c40_8785_ins,
jmp2_uxn_opcodes_h_l2925_c40_8785_previous_stack_read,
jmp2_uxn_opcodes_h_l2925_c40_8785_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2926_c11_8cff
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_8cff : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_8cff_left,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_8cff_right,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_8cff_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_87ff
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_87ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_87ff_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_87ff_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_87ff_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_87ff_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c235
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c235 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c235_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c235_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c235_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c235_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2926_c7_4fc7
opc_result_MUX_uxn_opcodes_h_l2926_c7_4fc7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2926_c7_4fc7_cond,
opc_result_MUX_uxn_opcodes_h_l2926_c7_4fc7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2926_c7_4fc7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2926_c7_4fc7_return_output);

-- jcn_uxn_opcodes_h_l2926_c40_bf95
jcn_uxn_opcodes_h_l2926_c40_bf95 : entity work.jcn_0CLK_226c8821 port map (
clk,
jcn_uxn_opcodes_h_l2926_c40_bf95_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l2926_c40_bf95_phase,
jcn_uxn_opcodes_h_l2926_c40_bf95_ins,
jcn_uxn_opcodes_h_l2926_c40_bf95_pc,
jcn_uxn_opcodes_h_l2926_c40_bf95_previous_stack_read,
jcn_uxn_opcodes_h_l2926_c40_bf95_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2927_c11_2a0f
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_2a0f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_2a0f_left,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_2a0f_right,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_2a0f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_736f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_736f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_736f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_736f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_736f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_736f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9354
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9354 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9354_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9354_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9354_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9354_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2927_c7_c235
opc_result_MUX_uxn_opcodes_h_l2927_c7_c235 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2927_c7_c235_cond,
opc_result_MUX_uxn_opcodes_h_l2927_c7_c235_iftrue,
opc_result_MUX_uxn_opcodes_h_l2927_c7_c235_iffalse,
opc_result_MUX_uxn_opcodes_h_l2927_c7_c235_return_output);

-- jcn2_uxn_opcodes_h_l2927_c40_1ece
jcn2_uxn_opcodes_h_l2927_c40_1ece : entity work.jcn2_0CLK_12273847 port map (
clk,
jcn2_uxn_opcodes_h_l2927_c40_1ece_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l2927_c40_1ece_phase,
jcn2_uxn_opcodes_h_l2927_c40_1ece_ins,
jcn2_uxn_opcodes_h_l2927_c40_1ece_previous_stack_read,
jcn2_uxn_opcodes_h_l2927_c40_1ece_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2928_c11_ae7d
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_ae7d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_ae7d_left,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_ae7d_right,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_ae7d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_8900
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_8900 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_8900_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_8900_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_8900_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_8900_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_b078
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_b078 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_b078_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_b078_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_b078_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_b078_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2928_c7_9354
opc_result_MUX_uxn_opcodes_h_l2928_c7_9354 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2928_c7_9354_cond,
opc_result_MUX_uxn_opcodes_h_l2928_c7_9354_iftrue,
opc_result_MUX_uxn_opcodes_h_l2928_c7_9354_iffalse,
opc_result_MUX_uxn_opcodes_h_l2928_c7_9354_return_output);

-- jsr_uxn_opcodes_h_l2928_c40_2309
jsr_uxn_opcodes_h_l2928_c40_2309 : entity work.jsr_0CLK_fedec265 port map (
clk,
jsr_uxn_opcodes_h_l2928_c40_2309_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l2928_c40_2309_phase,
jsr_uxn_opcodes_h_l2928_c40_2309_ins,
jsr_uxn_opcodes_h_l2928_c40_2309_pc,
jsr_uxn_opcodes_h_l2928_c40_2309_previous_stack_read,
jsr_uxn_opcodes_h_l2928_c40_2309_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2fcc
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2fcc : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2fcc_left,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2fcc_right,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2fcc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_e997
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_e997 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_e997_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_e997_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_e997_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_e997_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_25ff
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_25ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_25ff_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_25ff_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_25ff_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_25ff_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2929_c7_b078
opc_result_MUX_uxn_opcodes_h_l2929_c7_b078 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2929_c7_b078_cond,
opc_result_MUX_uxn_opcodes_h_l2929_c7_b078_iftrue,
opc_result_MUX_uxn_opcodes_h_l2929_c7_b078_iffalse,
opc_result_MUX_uxn_opcodes_h_l2929_c7_b078_return_output);

-- jsr2_uxn_opcodes_h_l2929_c40_3cec
jsr2_uxn_opcodes_h_l2929_c40_3cec : entity work.jsr2_0CLK_609876da port map (
clk,
jsr2_uxn_opcodes_h_l2929_c40_3cec_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l2929_c40_3cec_phase,
jsr2_uxn_opcodes_h_l2929_c40_3cec_ins,
jsr2_uxn_opcodes_h_l2929_c40_3cec_pc,
jsr2_uxn_opcodes_h_l2929_c40_3cec_previous_stack_read,
jsr2_uxn_opcodes_h_l2929_c40_3cec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2930_c11_53c8
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_53c8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_53c8_left,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_53c8_right,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_53c8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5d01
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5d01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5d01_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5d01_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5d01_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5d01_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ff89
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ff89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ff89_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ff89_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ff89_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ff89_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2930_c7_25ff
opc_result_MUX_uxn_opcodes_h_l2930_c7_25ff : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2930_c7_25ff_cond,
opc_result_MUX_uxn_opcodes_h_l2930_c7_25ff_iftrue,
opc_result_MUX_uxn_opcodes_h_l2930_c7_25ff_iffalse,
opc_result_MUX_uxn_opcodes_h_l2930_c7_25ff_return_output);

-- sth_uxn_opcodes_h_l2930_c40_5228
sth_uxn_opcodes_h_l2930_c40_5228 : entity work.sth_0CLK_a9f1e08f port map (
clk,
sth_uxn_opcodes_h_l2930_c40_5228_CLOCK_ENABLE,
sth_uxn_opcodes_h_l2930_c40_5228_phase,
sth_uxn_opcodes_h_l2930_c40_5228_ins,
sth_uxn_opcodes_h_l2930_c40_5228_previous_stack_read,
sth_uxn_opcodes_h_l2930_c40_5228_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2931_c11_2f04
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_2f04 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_2f04_left,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_2f04_right,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_2f04_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8432
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8432 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8432_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8432_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8432_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8432_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_110a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_110a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_110a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_110a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_110a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_110a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2931_c7_ff89
opc_result_MUX_uxn_opcodes_h_l2931_c7_ff89 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2931_c7_ff89_cond,
opc_result_MUX_uxn_opcodes_h_l2931_c7_ff89_iftrue,
opc_result_MUX_uxn_opcodes_h_l2931_c7_ff89_iffalse,
opc_result_MUX_uxn_opcodes_h_l2931_c7_ff89_return_output);

-- sth2_uxn_opcodes_h_l2931_c40_60f7
sth2_uxn_opcodes_h_l2931_c40_60f7 : entity work.sth2_0CLK_55b6500a port map (
clk,
sth2_uxn_opcodes_h_l2931_c40_60f7_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l2931_c40_60f7_phase,
sth2_uxn_opcodes_h_l2931_c40_60f7_ins,
sth2_uxn_opcodes_h_l2931_c40_60f7_previous_stack_read,
sth2_uxn_opcodes_h_l2931_c40_60f7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2cbf
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2cbf : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2cbf_left,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2cbf_right,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2cbf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_5bce
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_5bce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_5bce_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_5bce_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_5bce_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_5bce_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_e3af
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_e3af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_e3af_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_e3af_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_e3af_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_e3af_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2932_c7_110a
opc_result_MUX_uxn_opcodes_h_l2932_c7_110a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2932_c7_110a_cond,
opc_result_MUX_uxn_opcodes_h_l2932_c7_110a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2932_c7_110a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2932_c7_110a_return_output);

-- ldz_uxn_opcodes_h_l2932_c40_beec
ldz_uxn_opcodes_h_l2932_c40_beec : entity work.ldz_0CLK_b128164d port map (
clk,
ldz_uxn_opcodes_h_l2932_c40_beec_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l2932_c40_beec_phase,
ldz_uxn_opcodes_h_l2932_c40_beec_ins,
ldz_uxn_opcodes_h_l2932_c40_beec_previous_stack_read,
ldz_uxn_opcodes_h_l2932_c40_beec_previous_ram_read,
ldz_uxn_opcodes_h_l2932_c40_beec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2933_c11_b567
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_b567 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_b567_left,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_b567_right,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_b567_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_61fc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_61fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_61fc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_61fc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_61fc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_61fc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_ed89
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_ed89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_ed89_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_ed89_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_ed89_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_ed89_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2933_c7_e3af
opc_result_MUX_uxn_opcodes_h_l2933_c7_e3af : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2933_c7_e3af_cond,
opc_result_MUX_uxn_opcodes_h_l2933_c7_e3af_iftrue,
opc_result_MUX_uxn_opcodes_h_l2933_c7_e3af_iffalse,
opc_result_MUX_uxn_opcodes_h_l2933_c7_e3af_return_output);

-- ldz2_uxn_opcodes_h_l2933_c40_ec39
ldz2_uxn_opcodes_h_l2933_c40_ec39 : entity work.ldz2_0CLK_2ab048cc port map (
clk,
ldz2_uxn_opcodes_h_l2933_c40_ec39_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l2933_c40_ec39_phase,
ldz2_uxn_opcodes_h_l2933_c40_ec39_ins,
ldz2_uxn_opcodes_h_l2933_c40_ec39_previous_stack_read,
ldz2_uxn_opcodes_h_l2933_c40_ec39_previous_ram_read,
ldz2_uxn_opcodes_h_l2933_c40_ec39_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2934_c11_d1e8
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_d1e8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_d1e8_left,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_d1e8_right,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_d1e8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_9b2f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_9b2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_9b2f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_9b2f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_9b2f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_9b2f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_14a9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_14a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_14a9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_14a9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_14a9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_14a9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2934_c7_ed89
opc_result_MUX_uxn_opcodes_h_l2934_c7_ed89 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2934_c7_ed89_cond,
opc_result_MUX_uxn_opcodes_h_l2934_c7_ed89_iftrue,
opc_result_MUX_uxn_opcodes_h_l2934_c7_ed89_iffalse,
opc_result_MUX_uxn_opcodes_h_l2934_c7_ed89_return_output);

-- stz_uxn_opcodes_h_l2934_c40_08b5
stz_uxn_opcodes_h_l2934_c40_08b5 : entity work.stz_0CLK_bacf6a1d port map (
clk,
stz_uxn_opcodes_h_l2934_c40_08b5_CLOCK_ENABLE,
stz_uxn_opcodes_h_l2934_c40_08b5_phase,
stz_uxn_opcodes_h_l2934_c40_08b5_ins,
stz_uxn_opcodes_h_l2934_c40_08b5_previous_stack_read,
stz_uxn_opcodes_h_l2934_c40_08b5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2935_c11_e3d9
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_e3d9 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_e3d9_left,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_e3d9_right,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_e3d9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_8799
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_8799 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_8799_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_8799_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_8799_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_8799_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_9da5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_9da5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_9da5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_9da5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_9da5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_9da5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2935_c7_14a9
opc_result_MUX_uxn_opcodes_h_l2935_c7_14a9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2935_c7_14a9_cond,
opc_result_MUX_uxn_opcodes_h_l2935_c7_14a9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2935_c7_14a9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2935_c7_14a9_return_output);

-- stz2_uxn_opcodes_h_l2935_c40_1781
stz2_uxn_opcodes_h_l2935_c40_1781 : entity work.stz2_0CLK_75b4bee3 port map (
clk,
stz2_uxn_opcodes_h_l2935_c40_1781_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l2935_c40_1781_phase,
stz2_uxn_opcodes_h_l2935_c40_1781_ins,
stz2_uxn_opcodes_h_l2935_c40_1781_previous_stack_read,
stz2_uxn_opcodes_h_l2935_c40_1781_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2936_c11_a20b
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_a20b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_a20b_left,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_a20b_right,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_a20b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ba7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ba7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ba7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ba7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ba7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ba7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_14fe
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_14fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_14fe_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_14fe_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_14fe_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_14fe_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2936_c7_9da5
opc_result_MUX_uxn_opcodes_h_l2936_c7_9da5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2936_c7_9da5_cond,
opc_result_MUX_uxn_opcodes_h_l2936_c7_9da5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2936_c7_9da5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2936_c7_9da5_return_output);

-- ldr_uxn_opcodes_h_l2936_c40_2b0f
ldr_uxn_opcodes_h_l2936_c40_2b0f : entity work.ldr_0CLK_f74745d5 port map (
clk,
ldr_uxn_opcodes_h_l2936_c40_2b0f_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l2936_c40_2b0f_phase,
ldr_uxn_opcodes_h_l2936_c40_2b0f_ins,
ldr_uxn_opcodes_h_l2936_c40_2b0f_pc,
ldr_uxn_opcodes_h_l2936_c40_2b0f_previous_stack_read,
ldr_uxn_opcodes_h_l2936_c40_2b0f_previous_ram_read,
ldr_uxn_opcodes_h_l2936_c40_2b0f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1e6f
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1e6f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1e6f_left,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1e6f_right,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1e6f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_770f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_770f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_770f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_770f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_770f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_770f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_3f46
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_3f46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_3f46_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_3f46_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_3f46_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_3f46_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2937_c7_14fe
opc_result_MUX_uxn_opcodes_h_l2937_c7_14fe : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2937_c7_14fe_cond,
opc_result_MUX_uxn_opcodes_h_l2937_c7_14fe_iftrue,
opc_result_MUX_uxn_opcodes_h_l2937_c7_14fe_iffalse,
opc_result_MUX_uxn_opcodes_h_l2937_c7_14fe_return_output);

-- ldr2_uxn_opcodes_h_l2937_c40_0c30
ldr2_uxn_opcodes_h_l2937_c40_0c30 : entity work.ldr2_0CLK_b7cf2331 port map (
clk,
ldr2_uxn_opcodes_h_l2937_c40_0c30_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l2937_c40_0c30_phase,
ldr2_uxn_opcodes_h_l2937_c40_0c30_ins,
ldr2_uxn_opcodes_h_l2937_c40_0c30_pc,
ldr2_uxn_opcodes_h_l2937_c40_0c30_previous_stack_read,
ldr2_uxn_opcodes_h_l2937_c40_0c30_previous_ram_read,
ldr2_uxn_opcodes_h_l2937_c40_0c30_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2938_c11_30c6
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_30c6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_30c6_left,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_30c6_right,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_30c6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_3aff
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_3aff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_3aff_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_3aff_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_3aff_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_3aff_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_1cd0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_1cd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_1cd0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_1cd0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_1cd0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_1cd0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2938_c7_3f46
opc_result_MUX_uxn_opcodes_h_l2938_c7_3f46 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2938_c7_3f46_cond,
opc_result_MUX_uxn_opcodes_h_l2938_c7_3f46_iftrue,
opc_result_MUX_uxn_opcodes_h_l2938_c7_3f46_iffalse,
opc_result_MUX_uxn_opcodes_h_l2938_c7_3f46_return_output);

-- str1_uxn_opcodes_h_l2938_c40_6062
str1_uxn_opcodes_h_l2938_c40_6062 : entity work.str1_0CLK_85d5529e port map (
clk,
str1_uxn_opcodes_h_l2938_c40_6062_CLOCK_ENABLE,
str1_uxn_opcodes_h_l2938_c40_6062_phase,
str1_uxn_opcodes_h_l2938_c40_6062_ins,
str1_uxn_opcodes_h_l2938_c40_6062_pc,
str1_uxn_opcodes_h_l2938_c40_6062_previous_stack_read,
str1_uxn_opcodes_h_l2938_c40_6062_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2939_c11_4c39
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_4c39 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_4c39_left,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_4c39_right,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_4c39_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5ea3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5ea3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5ea3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5ea3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5ea3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5ea3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_1276
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_1276 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_1276_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_1276_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_1276_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_1276_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2939_c7_1cd0
opc_result_MUX_uxn_opcodes_h_l2939_c7_1cd0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2939_c7_1cd0_cond,
opc_result_MUX_uxn_opcodes_h_l2939_c7_1cd0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2939_c7_1cd0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2939_c7_1cd0_return_output);

-- str2_uxn_opcodes_h_l2939_c40_e81d
str2_uxn_opcodes_h_l2939_c40_e81d : entity work.str2_0CLK_75b4bee3 port map (
clk,
str2_uxn_opcodes_h_l2939_c40_e81d_CLOCK_ENABLE,
str2_uxn_opcodes_h_l2939_c40_e81d_phase,
str2_uxn_opcodes_h_l2939_c40_e81d_ins,
str2_uxn_opcodes_h_l2939_c40_e81d_pc,
str2_uxn_opcodes_h_l2939_c40_e81d_previous_stack_read,
str2_uxn_opcodes_h_l2939_c40_e81d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2940_c11_626d
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_626d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_626d_left,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_626d_right,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_626d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_e729
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_e729 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_e729_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_e729_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_e729_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_e729_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_cba6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_cba6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_cba6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_cba6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_cba6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_cba6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2940_c7_1276
opc_result_MUX_uxn_opcodes_h_l2940_c7_1276 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2940_c7_1276_cond,
opc_result_MUX_uxn_opcodes_h_l2940_c7_1276_iftrue,
opc_result_MUX_uxn_opcodes_h_l2940_c7_1276_iffalse,
opc_result_MUX_uxn_opcodes_h_l2940_c7_1276_return_output);

-- lda_uxn_opcodes_h_l2940_c40_31f9
lda_uxn_opcodes_h_l2940_c40_31f9 : entity work.lda_0CLK_c634cda8 port map (
clk,
lda_uxn_opcodes_h_l2940_c40_31f9_CLOCK_ENABLE,
lda_uxn_opcodes_h_l2940_c40_31f9_phase,
lda_uxn_opcodes_h_l2940_c40_31f9_ins,
lda_uxn_opcodes_h_l2940_c40_31f9_previous_stack_read,
lda_uxn_opcodes_h_l2940_c40_31f9_previous_ram_read,
lda_uxn_opcodes_h_l2940_c40_31f9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2941_c11_19fc
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_19fc : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_19fc_left,
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_19fc_right,
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_19fc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_630d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_630d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_630d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_630d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_630d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_630d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_713f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_713f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_713f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_713f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_713f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_713f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2941_c7_cba6
opc_result_MUX_uxn_opcodes_h_l2941_c7_cba6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2941_c7_cba6_cond,
opc_result_MUX_uxn_opcodes_h_l2941_c7_cba6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2941_c7_cba6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2941_c7_cba6_return_output);

-- lda2_uxn_opcodes_h_l2941_c40_f02f
lda2_uxn_opcodes_h_l2941_c40_f02f : entity work.lda2_0CLK_19339e1d port map (
clk,
lda2_uxn_opcodes_h_l2941_c40_f02f_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l2941_c40_f02f_phase,
lda2_uxn_opcodes_h_l2941_c40_f02f_ins,
lda2_uxn_opcodes_h_l2941_c40_f02f_previous_stack_read,
lda2_uxn_opcodes_h_l2941_c40_f02f_previous_ram_read,
lda2_uxn_opcodes_h_l2941_c40_f02f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2942_c11_d3c6
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_d3c6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_d3c6_left,
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_d3c6_right,
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_d3c6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b8d2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b8d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b8d2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b8d2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b8d2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b8d2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_bb37
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_bb37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_bb37_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_bb37_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_bb37_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_bb37_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2942_c7_713f
opc_result_MUX_uxn_opcodes_h_l2942_c7_713f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2942_c7_713f_cond,
opc_result_MUX_uxn_opcodes_h_l2942_c7_713f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2942_c7_713f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2942_c7_713f_return_output);

-- sta_uxn_opcodes_h_l2942_c40_b0d7
sta_uxn_opcodes_h_l2942_c40_b0d7 : entity work.sta_0CLK_bce25fe8 port map (
clk,
sta_uxn_opcodes_h_l2942_c40_b0d7_CLOCK_ENABLE,
sta_uxn_opcodes_h_l2942_c40_b0d7_phase,
sta_uxn_opcodes_h_l2942_c40_b0d7_ins,
sta_uxn_opcodes_h_l2942_c40_b0d7_previous_stack_read,
sta_uxn_opcodes_h_l2942_c40_b0d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2943_c11_e47d
BIN_OP_EQ_uxn_opcodes_h_l2943_c11_e47d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2943_c11_e47d_left,
BIN_OP_EQ_uxn_opcodes_h_l2943_c11_e47d_right,
BIN_OP_EQ_uxn_opcodes_h_l2943_c11_e47d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_91d3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_91d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_91d3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_91d3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_91d3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_91d3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_bdf4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_bdf4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_bdf4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_bdf4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_bdf4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_bdf4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2943_c7_bb37
opc_result_MUX_uxn_opcodes_h_l2943_c7_bb37 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2943_c7_bb37_cond,
opc_result_MUX_uxn_opcodes_h_l2943_c7_bb37_iftrue,
opc_result_MUX_uxn_opcodes_h_l2943_c7_bb37_iffalse,
opc_result_MUX_uxn_opcodes_h_l2943_c7_bb37_return_output);

-- sta2_uxn_opcodes_h_l2943_c40_d176
sta2_uxn_opcodes_h_l2943_c40_d176 : entity work.sta2_0CLK_4674db74 port map (
clk,
sta2_uxn_opcodes_h_l2943_c40_d176_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l2943_c40_d176_phase,
sta2_uxn_opcodes_h_l2943_c40_d176_ins,
sta2_uxn_opcodes_h_l2943_c40_d176_previous_stack_read,
sta2_uxn_opcodes_h_l2943_c40_d176_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2944_c11_d52d
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_d52d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_d52d_left,
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_d52d_right,
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_d52d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_adea
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_adea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_adea_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_adea_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_adea_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_adea_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_553d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_553d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_553d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_553d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_553d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_553d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2944_c7_bdf4
opc_result_MUX_uxn_opcodes_h_l2944_c7_bdf4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2944_c7_bdf4_cond,
opc_result_MUX_uxn_opcodes_h_l2944_c7_bdf4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2944_c7_bdf4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2944_c7_bdf4_return_output);

-- dei_uxn_opcodes_h_l2944_c40_ceb7
dei_uxn_opcodes_h_l2944_c40_ceb7 : entity work.dei_0CLK_8bdbfeff port map (
clk,
dei_uxn_opcodes_h_l2944_c40_ceb7_CLOCK_ENABLE,
dei_uxn_opcodes_h_l2944_c40_ceb7_phase,
dei_uxn_opcodes_h_l2944_c40_ceb7_ins,
dei_uxn_opcodes_h_l2944_c40_ceb7_previous_stack_read,
dei_uxn_opcodes_h_l2944_c40_ceb7_previous_device_ram_read,
dei_uxn_opcodes_h_l2944_c40_ceb7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2945_c11_0be9
BIN_OP_EQ_uxn_opcodes_h_l2945_c11_0be9 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2945_c11_0be9_left,
BIN_OP_EQ_uxn_opcodes_h_l2945_c11_0be9_right,
BIN_OP_EQ_uxn_opcodes_h_l2945_c11_0be9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_996d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_996d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_996d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_996d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_996d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_996d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_756f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_756f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_756f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_756f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_756f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_756f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2945_c7_553d
opc_result_MUX_uxn_opcodes_h_l2945_c7_553d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2945_c7_553d_cond,
opc_result_MUX_uxn_opcodes_h_l2945_c7_553d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2945_c7_553d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2945_c7_553d_return_output);

-- dei2_uxn_opcodes_h_l2945_c40_67db
dei2_uxn_opcodes_h_l2945_c40_67db : entity work.dei2_0CLK_3923845b port map (
clk,
dei2_uxn_opcodes_h_l2945_c40_67db_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l2945_c40_67db_phase,
dei2_uxn_opcodes_h_l2945_c40_67db_ins,
dei2_uxn_opcodes_h_l2945_c40_67db_previous_stack_read,
dei2_uxn_opcodes_h_l2945_c40_67db_previous_device_ram_read,
dei2_uxn_opcodes_h_l2945_c40_67db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2946_c11_941b
BIN_OP_EQ_uxn_opcodes_h_l2946_c11_941b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2946_c11_941b_left,
BIN_OP_EQ_uxn_opcodes_h_l2946_c11_941b_right,
BIN_OP_EQ_uxn_opcodes_h_l2946_c11_941b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_780d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_780d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_780d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_780d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_780d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_780d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_040a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_040a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_040a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_040a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_040a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_040a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2946_c7_756f
opc_result_MUX_uxn_opcodes_h_l2946_c7_756f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2946_c7_756f_cond,
opc_result_MUX_uxn_opcodes_h_l2946_c7_756f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2946_c7_756f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2946_c7_756f_return_output);

-- deo_uxn_opcodes_h_l2946_c40_5f8f
deo_uxn_opcodes_h_l2946_c40_5f8f : entity work.deo_0CLK_2aa026fb port map (
clk,
deo_uxn_opcodes_h_l2946_c40_5f8f_CLOCK_ENABLE,
deo_uxn_opcodes_h_l2946_c40_5f8f_phase,
deo_uxn_opcodes_h_l2946_c40_5f8f_ins,
deo_uxn_opcodes_h_l2946_c40_5f8f_previous_stack_read,
deo_uxn_opcodes_h_l2946_c40_5f8f_previous_device_ram_read,
deo_uxn_opcodes_h_l2946_c40_5f8f_previous_ram_read,
deo_uxn_opcodes_h_l2946_c40_5f8f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2947_c11_cd1f
BIN_OP_EQ_uxn_opcodes_h_l2947_c11_cd1f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2947_c11_cd1f_left,
BIN_OP_EQ_uxn_opcodes_h_l2947_c11_cd1f_right,
BIN_OP_EQ_uxn_opcodes_h_l2947_c11_cd1f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_0a9e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_0a9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_0a9e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_0a9e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_0a9e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_0a9e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_d000
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_d000 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_d000_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_d000_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_d000_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_d000_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2947_c7_040a
opc_result_MUX_uxn_opcodes_h_l2947_c7_040a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2947_c7_040a_cond,
opc_result_MUX_uxn_opcodes_h_l2947_c7_040a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2947_c7_040a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2947_c7_040a_return_output);

-- deo2_uxn_opcodes_h_l2947_c40_c304
deo2_uxn_opcodes_h_l2947_c40_c304 : entity work.deo2_0CLK_4871c646 port map (
clk,
deo2_uxn_opcodes_h_l2947_c40_c304_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l2947_c40_c304_phase,
deo2_uxn_opcodes_h_l2947_c40_c304_ins,
deo2_uxn_opcodes_h_l2947_c40_c304_previous_stack_read,
deo2_uxn_opcodes_h_l2947_c40_c304_previous_device_ram_read,
deo2_uxn_opcodes_h_l2947_c40_c304_previous_ram_read,
deo2_uxn_opcodes_h_l2947_c40_c304_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2948_c11_e832
BIN_OP_EQ_uxn_opcodes_h_l2948_c11_e832 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2948_c11_e832_left,
BIN_OP_EQ_uxn_opcodes_h_l2948_c11_e832_right,
BIN_OP_EQ_uxn_opcodes_h_l2948_c11_e832_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_e5bc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_e5bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_e5bc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_e5bc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_e5bc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_e5bc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a058
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a058 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a058_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a058_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a058_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a058_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2948_c7_d000
opc_result_MUX_uxn_opcodes_h_l2948_c7_d000 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2948_c7_d000_cond,
opc_result_MUX_uxn_opcodes_h_l2948_c7_d000_iftrue,
opc_result_MUX_uxn_opcodes_h_l2948_c7_d000_iffalse,
opc_result_MUX_uxn_opcodes_h_l2948_c7_d000_return_output);

-- add_uxn_opcodes_h_l2948_c40_92a0
add_uxn_opcodes_h_l2948_c40_92a0 : entity work.add_0CLK_64d180f1 port map (
clk,
add_uxn_opcodes_h_l2948_c40_92a0_CLOCK_ENABLE,
add_uxn_opcodes_h_l2948_c40_92a0_phase,
add_uxn_opcodes_h_l2948_c40_92a0_ins,
add_uxn_opcodes_h_l2948_c40_92a0_previous_stack_read,
add_uxn_opcodes_h_l2948_c40_92a0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2949_c11_67ec
BIN_OP_EQ_uxn_opcodes_h_l2949_c11_67ec : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2949_c11_67ec_left,
BIN_OP_EQ_uxn_opcodes_h_l2949_c11_67ec_right,
BIN_OP_EQ_uxn_opcodes_h_l2949_c11_67ec_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_4553
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_4553 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_4553_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_4553_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_4553_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_4553_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5574
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5574 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5574_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5574_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5574_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5574_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2949_c7_a058
opc_result_MUX_uxn_opcodes_h_l2949_c7_a058 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2949_c7_a058_cond,
opc_result_MUX_uxn_opcodes_h_l2949_c7_a058_iftrue,
opc_result_MUX_uxn_opcodes_h_l2949_c7_a058_iffalse,
opc_result_MUX_uxn_opcodes_h_l2949_c7_a058_return_output);

-- add2_uxn_opcodes_h_l2949_c40_75dc
add2_uxn_opcodes_h_l2949_c40_75dc : entity work.add2_0CLK_50b92fe2 port map (
clk,
add2_uxn_opcodes_h_l2949_c40_75dc_CLOCK_ENABLE,
add2_uxn_opcodes_h_l2949_c40_75dc_phase,
add2_uxn_opcodes_h_l2949_c40_75dc_ins,
add2_uxn_opcodes_h_l2949_c40_75dc_previous_stack_read,
add2_uxn_opcodes_h_l2949_c40_75dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2950_c11_2aa2
BIN_OP_EQ_uxn_opcodes_h_l2950_c11_2aa2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2950_c11_2aa2_left,
BIN_OP_EQ_uxn_opcodes_h_l2950_c11_2aa2_right,
BIN_OP_EQ_uxn_opcodes_h_l2950_c11_2aa2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_4f89
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_4f89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_4f89_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_4f89_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_4f89_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_4f89_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_72bf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_72bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_72bf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_72bf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_72bf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_72bf_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2950_c7_5574
opc_result_MUX_uxn_opcodes_h_l2950_c7_5574 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2950_c7_5574_cond,
opc_result_MUX_uxn_opcodes_h_l2950_c7_5574_iftrue,
opc_result_MUX_uxn_opcodes_h_l2950_c7_5574_iffalse,
opc_result_MUX_uxn_opcodes_h_l2950_c7_5574_return_output);

-- sub_uxn_opcodes_h_l2950_c40_110d
sub_uxn_opcodes_h_l2950_c40_110d : entity work.sub_0CLK_64d180f1 port map (
clk,
sub_uxn_opcodes_h_l2950_c40_110d_CLOCK_ENABLE,
sub_uxn_opcodes_h_l2950_c40_110d_phase,
sub_uxn_opcodes_h_l2950_c40_110d_ins,
sub_uxn_opcodes_h_l2950_c40_110d_previous_stack_read,
sub_uxn_opcodes_h_l2950_c40_110d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2951_c11_671c
BIN_OP_EQ_uxn_opcodes_h_l2951_c11_671c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2951_c11_671c_left,
BIN_OP_EQ_uxn_opcodes_h_l2951_c11_671c_right,
BIN_OP_EQ_uxn_opcodes_h_l2951_c11_671c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_1855
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_1855 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_1855_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_1855_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_1855_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_1855_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_5789
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_5789 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_5789_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_5789_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_5789_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_5789_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2951_c7_72bf
opc_result_MUX_uxn_opcodes_h_l2951_c7_72bf : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2951_c7_72bf_cond,
opc_result_MUX_uxn_opcodes_h_l2951_c7_72bf_iftrue,
opc_result_MUX_uxn_opcodes_h_l2951_c7_72bf_iffalse,
opc_result_MUX_uxn_opcodes_h_l2951_c7_72bf_return_output);

-- sub2_uxn_opcodes_h_l2951_c40_3c50
sub2_uxn_opcodes_h_l2951_c40_3c50 : entity work.sub2_0CLK_50b92fe2 port map (
clk,
sub2_uxn_opcodes_h_l2951_c40_3c50_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l2951_c40_3c50_phase,
sub2_uxn_opcodes_h_l2951_c40_3c50_ins,
sub2_uxn_opcodes_h_l2951_c40_3c50_previous_stack_read,
sub2_uxn_opcodes_h_l2951_c40_3c50_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2952_c11_108f
BIN_OP_EQ_uxn_opcodes_h_l2952_c11_108f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2952_c11_108f_left,
BIN_OP_EQ_uxn_opcodes_h_l2952_c11_108f_right,
BIN_OP_EQ_uxn_opcodes_h_l2952_c11_108f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4300
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4300 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4300_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4300_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4300_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4300_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_87ca
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_87ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_87ca_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_87ca_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_87ca_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_87ca_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2952_c7_5789
opc_result_MUX_uxn_opcodes_h_l2952_c7_5789 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2952_c7_5789_cond,
opc_result_MUX_uxn_opcodes_h_l2952_c7_5789_iftrue,
opc_result_MUX_uxn_opcodes_h_l2952_c7_5789_iffalse,
opc_result_MUX_uxn_opcodes_h_l2952_c7_5789_return_output);

-- mul_uxn_opcodes_h_l2952_c40_6bd6
mul_uxn_opcodes_h_l2952_c40_6bd6 : entity work.mul_0CLK_64d180f1 port map (
clk,
mul_uxn_opcodes_h_l2952_c40_6bd6_CLOCK_ENABLE,
mul_uxn_opcodes_h_l2952_c40_6bd6_phase,
mul_uxn_opcodes_h_l2952_c40_6bd6_ins,
mul_uxn_opcodes_h_l2952_c40_6bd6_previous_stack_read,
mul_uxn_opcodes_h_l2952_c40_6bd6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2953_c11_f31b
BIN_OP_EQ_uxn_opcodes_h_l2953_c11_f31b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2953_c11_f31b_left,
BIN_OP_EQ_uxn_opcodes_h_l2953_c11_f31b_right,
BIN_OP_EQ_uxn_opcodes_h_l2953_c11_f31b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_3d98
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_3d98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_3d98_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_3d98_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_3d98_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_3d98_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e7a5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e7a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e7a5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e7a5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e7a5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e7a5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2953_c7_87ca
opc_result_MUX_uxn_opcodes_h_l2953_c7_87ca : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2953_c7_87ca_cond,
opc_result_MUX_uxn_opcodes_h_l2953_c7_87ca_iftrue,
opc_result_MUX_uxn_opcodes_h_l2953_c7_87ca_iffalse,
opc_result_MUX_uxn_opcodes_h_l2953_c7_87ca_return_output);

-- mul2_uxn_opcodes_h_l2953_c40_7687
mul2_uxn_opcodes_h_l2953_c40_7687 : entity work.mul2_0CLK_50b92fe2 port map (
clk,
mul2_uxn_opcodes_h_l2953_c40_7687_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l2953_c40_7687_phase,
mul2_uxn_opcodes_h_l2953_c40_7687_ins,
mul2_uxn_opcodes_h_l2953_c40_7687_previous_stack_read,
mul2_uxn_opcodes_h_l2953_c40_7687_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2954_c11_0077
BIN_OP_EQ_uxn_opcodes_h_l2954_c11_0077 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2954_c11_0077_left,
BIN_OP_EQ_uxn_opcodes_h_l2954_c11_0077_right,
BIN_OP_EQ_uxn_opcodes_h_l2954_c11_0077_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_0df9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_0df9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_0df9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_0df9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_0df9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_0df9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ad12
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ad12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ad12_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ad12_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ad12_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ad12_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2954_c7_e7a5
opc_result_MUX_uxn_opcodes_h_l2954_c7_e7a5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2954_c7_e7a5_cond,
opc_result_MUX_uxn_opcodes_h_l2954_c7_e7a5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2954_c7_e7a5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2954_c7_e7a5_return_output);

-- div_uxn_opcodes_h_l2954_c40_4707
div_uxn_opcodes_h_l2954_c40_4707 : entity work.div_0CLK_09f6f009 port map (
clk,
div_uxn_opcodes_h_l2954_c40_4707_CLOCK_ENABLE,
div_uxn_opcodes_h_l2954_c40_4707_phase,
div_uxn_opcodes_h_l2954_c40_4707_ins,
div_uxn_opcodes_h_l2954_c40_4707_previous_stack_read,
div_uxn_opcodes_h_l2954_c40_4707_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2955_c11_1253
BIN_OP_EQ_uxn_opcodes_h_l2955_c11_1253 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2955_c11_1253_left,
BIN_OP_EQ_uxn_opcodes_h_l2955_c11_1253_right,
BIN_OP_EQ_uxn_opcodes_h_l2955_c11_1253_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_8426
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_8426 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_8426_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_8426_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_8426_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_8426_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_1de8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_1de8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_1de8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_1de8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_1de8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_1de8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2955_c7_ad12
opc_result_MUX_uxn_opcodes_h_l2955_c7_ad12 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2955_c7_ad12_cond,
opc_result_MUX_uxn_opcodes_h_l2955_c7_ad12_iftrue,
opc_result_MUX_uxn_opcodes_h_l2955_c7_ad12_iffalse,
opc_result_MUX_uxn_opcodes_h_l2955_c7_ad12_return_output);

-- div2_uxn_opcodes_h_l2955_c40_1cb2
div2_uxn_opcodes_h_l2955_c40_1cb2 : entity work.div2_0CLK_7cf9dac2 port map (
clk,
div2_uxn_opcodes_h_l2955_c40_1cb2_CLOCK_ENABLE,
div2_uxn_opcodes_h_l2955_c40_1cb2_phase,
div2_uxn_opcodes_h_l2955_c40_1cb2_ins,
div2_uxn_opcodes_h_l2955_c40_1cb2_previous_stack_read,
div2_uxn_opcodes_h_l2955_c40_1cb2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2956_c11_0997
BIN_OP_EQ_uxn_opcodes_h_l2956_c11_0997 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2956_c11_0997_left,
BIN_OP_EQ_uxn_opcodes_h_l2956_c11_0997_right,
BIN_OP_EQ_uxn_opcodes_h_l2956_c11_0997_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_6f14
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_6f14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_6f14_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_6f14_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_6f14_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_6f14_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_f15f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_f15f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_f15f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_f15f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_f15f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_f15f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2956_c7_1de8
opc_result_MUX_uxn_opcodes_h_l2956_c7_1de8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2956_c7_1de8_cond,
opc_result_MUX_uxn_opcodes_h_l2956_c7_1de8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2956_c7_1de8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2956_c7_1de8_return_output);

-- and_uxn_opcodes_h_l2956_c40_b846
and_uxn_opcodes_h_l2956_c40_b846 : entity work.and_0CLK_64d180f1 port map (
clk,
and_uxn_opcodes_h_l2956_c40_b846_CLOCK_ENABLE,
and_uxn_opcodes_h_l2956_c40_b846_phase,
and_uxn_opcodes_h_l2956_c40_b846_ins,
and_uxn_opcodes_h_l2956_c40_b846_previous_stack_read,
and_uxn_opcodes_h_l2956_c40_b846_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2957_c11_87d0
BIN_OP_EQ_uxn_opcodes_h_l2957_c11_87d0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2957_c11_87d0_left,
BIN_OP_EQ_uxn_opcodes_h_l2957_c11_87d0_right,
BIN_OP_EQ_uxn_opcodes_h_l2957_c11_87d0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_5d8f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_5d8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_5d8f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_5d8f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_5d8f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_5d8f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_60b8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_60b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_60b8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_60b8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_60b8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_60b8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2957_c7_f15f
opc_result_MUX_uxn_opcodes_h_l2957_c7_f15f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2957_c7_f15f_cond,
opc_result_MUX_uxn_opcodes_h_l2957_c7_f15f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2957_c7_f15f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2957_c7_f15f_return_output);

-- and2_uxn_opcodes_h_l2957_c40_a05a
and2_uxn_opcodes_h_l2957_c40_a05a : entity work.and2_0CLK_50b92fe2 port map (
clk,
and2_uxn_opcodes_h_l2957_c40_a05a_CLOCK_ENABLE,
and2_uxn_opcodes_h_l2957_c40_a05a_phase,
and2_uxn_opcodes_h_l2957_c40_a05a_ins,
and2_uxn_opcodes_h_l2957_c40_a05a_previous_stack_read,
and2_uxn_opcodes_h_l2957_c40_a05a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2958_c11_e66f
BIN_OP_EQ_uxn_opcodes_h_l2958_c11_e66f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2958_c11_e66f_left,
BIN_OP_EQ_uxn_opcodes_h_l2958_c11_e66f_right,
BIN_OP_EQ_uxn_opcodes_h_l2958_c11_e66f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_6dde
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_6dde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_6dde_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_6dde_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_6dde_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_6dde_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_8868
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_8868 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_8868_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_8868_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_8868_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_8868_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2958_c7_60b8
opc_result_MUX_uxn_opcodes_h_l2958_c7_60b8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2958_c7_60b8_cond,
opc_result_MUX_uxn_opcodes_h_l2958_c7_60b8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2958_c7_60b8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2958_c7_60b8_return_output);

-- ora_uxn_opcodes_h_l2958_c40_1e2f
ora_uxn_opcodes_h_l2958_c40_1e2f : entity work.ora_0CLK_64d180f1 port map (
clk,
ora_uxn_opcodes_h_l2958_c40_1e2f_CLOCK_ENABLE,
ora_uxn_opcodes_h_l2958_c40_1e2f_phase,
ora_uxn_opcodes_h_l2958_c40_1e2f_ins,
ora_uxn_opcodes_h_l2958_c40_1e2f_previous_stack_read,
ora_uxn_opcodes_h_l2958_c40_1e2f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2959_c11_5f9d
BIN_OP_EQ_uxn_opcodes_h_l2959_c11_5f9d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2959_c11_5f9d_left,
BIN_OP_EQ_uxn_opcodes_h_l2959_c11_5f9d_right,
BIN_OP_EQ_uxn_opcodes_h_l2959_c11_5f9d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_cdf7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_cdf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_cdf7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_cdf7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_cdf7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_cdf7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_f9db
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_f9db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_f9db_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_f9db_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_f9db_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_f9db_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2959_c7_8868
opc_result_MUX_uxn_opcodes_h_l2959_c7_8868 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2959_c7_8868_cond,
opc_result_MUX_uxn_opcodes_h_l2959_c7_8868_iftrue,
opc_result_MUX_uxn_opcodes_h_l2959_c7_8868_iffalse,
opc_result_MUX_uxn_opcodes_h_l2959_c7_8868_return_output);

-- ora2_uxn_opcodes_h_l2959_c40_4dc9
ora2_uxn_opcodes_h_l2959_c40_4dc9 : entity work.ora2_0CLK_50b92fe2 port map (
clk,
ora2_uxn_opcodes_h_l2959_c40_4dc9_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l2959_c40_4dc9_phase,
ora2_uxn_opcodes_h_l2959_c40_4dc9_ins,
ora2_uxn_opcodes_h_l2959_c40_4dc9_previous_stack_read,
ora2_uxn_opcodes_h_l2959_c40_4dc9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2960_c11_af73
BIN_OP_EQ_uxn_opcodes_h_l2960_c11_af73 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2960_c11_af73_left,
BIN_OP_EQ_uxn_opcodes_h_l2960_c11_af73_right,
BIN_OP_EQ_uxn_opcodes_h_l2960_c11_af73_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_eb8d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_eb8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_eb8d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_eb8d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_eb8d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_eb8d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_23fd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_23fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_23fd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_23fd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_23fd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_23fd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2960_c7_f9db
opc_result_MUX_uxn_opcodes_h_l2960_c7_f9db : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2960_c7_f9db_cond,
opc_result_MUX_uxn_opcodes_h_l2960_c7_f9db_iftrue,
opc_result_MUX_uxn_opcodes_h_l2960_c7_f9db_iffalse,
opc_result_MUX_uxn_opcodes_h_l2960_c7_f9db_return_output);

-- eor_uxn_opcodes_h_l2960_c40_0638
eor_uxn_opcodes_h_l2960_c40_0638 : entity work.eor_0CLK_64d180f1 port map (
clk,
eor_uxn_opcodes_h_l2960_c40_0638_CLOCK_ENABLE,
eor_uxn_opcodes_h_l2960_c40_0638_phase,
eor_uxn_opcodes_h_l2960_c40_0638_ins,
eor_uxn_opcodes_h_l2960_c40_0638_previous_stack_read,
eor_uxn_opcodes_h_l2960_c40_0638_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2961_c11_8a0c
BIN_OP_EQ_uxn_opcodes_h_l2961_c11_8a0c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2961_c11_8a0c_left,
BIN_OP_EQ_uxn_opcodes_h_l2961_c11_8a0c_right,
BIN_OP_EQ_uxn_opcodes_h_l2961_c11_8a0c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_c132
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_c132 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_c132_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_c132_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_c132_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_c132_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_8da2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_8da2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_8da2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_8da2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_8da2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_8da2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2961_c7_23fd
opc_result_MUX_uxn_opcodes_h_l2961_c7_23fd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2961_c7_23fd_cond,
opc_result_MUX_uxn_opcodes_h_l2961_c7_23fd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2961_c7_23fd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2961_c7_23fd_return_output);

-- eor2_uxn_opcodes_h_l2961_c40_8326
eor2_uxn_opcodes_h_l2961_c40_8326 : entity work.eor2_0CLK_50b92fe2 port map (
clk,
eor2_uxn_opcodes_h_l2961_c40_8326_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l2961_c40_8326_phase,
eor2_uxn_opcodes_h_l2961_c40_8326_ins,
eor2_uxn_opcodes_h_l2961_c40_8326_previous_stack_read,
eor2_uxn_opcodes_h_l2961_c40_8326_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2962_c11_4b7a
BIN_OP_EQ_uxn_opcodes_h_l2962_c11_4b7a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2962_c11_4b7a_left,
BIN_OP_EQ_uxn_opcodes_h_l2962_c11_4b7a_right,
BIN_OP_EQ_uxn_opcodes_h_l2962_c11_4b7a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_ab8e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_ab8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_ab8e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_ab8e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_ab8e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_ab8e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_f0c9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_f0c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_f0c9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_f0c9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_f0c9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_f0c9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2962_c7_8da2
opc_result_MUX_uxn_opcodes_h_l2962_c7_8da2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2962_c7_8da2_cond,
opc_result_MUX_uxn_opcodes_h_l2962_c7_8da2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2962_c7_8da2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2962_c7_8da2_return_output);

-- sft_uxn_opcodes_h_l2962_c40_433f
sft_uxn_opcodes_h_l2962_c40_433f : entity work.sft_0CLK_46cced44 port map (
clk,
sft_uxn_opcodes_h_l2962_c40_433f_CLOCK_ENABLE,
sft_uxn_opcodes_h_l2962_c40_433f_phase,
sft_uxn_opcodes_h_l2962_c40_433f_ins,
sft_uxn_opcodes_h_l2962_c40_433f_previous_stack_read,
sft_uxn_opcodes_h_l2962_c40_433f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2963_c11_1fc0
BIN_OP_EQ_uxn_opcodes_h_l2963_c11_1fc0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2963_c11_1fc0_left,
BIN_OP_EQ_uxn_opcodes_h_l2963_c11_1fc0_right,
BIN_OP_EQ_uxn_opcodes_h_l2963_c11_1fc0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_81f3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_81f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_81f3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_81f3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_81f3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_81f3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2963_c7_f0c9
opc_result_MUX_uxn_opcodes_h_l2963_c7_f0c9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2963_c7_f0c9_cond,
opc_result_MUX_uxn_opcodes_h_l2963_c7_f0c9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2963_c7_f0c9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2963_c7_f0c9_return_output);

-- sft2_uxn_opcodes_h_l2963_c40_e322
sft2_uxn_opcodes_h_l2963_c40_e322 : entity work.sft2_0CLK_e8b37bfc port map (
clk,
sft2_uxn_opcodes_h_l2963_c40_e322_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l2963_c40_e322_phase,
sft2_uxn_opcodes_h_l2963_c40_e322_ins,
sft2_uxn_opcodes_h_l2963_c40_e322_previous_stack_read,
sft2_uxn_opcodes_h_l2963_c40_e322_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2966_c17_557e
BIN_OP_AND_uxn_opcodes_h_l2966_c17_557e : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2966_c17_557e_left,
BIN_OP_AND_uxn_opcodes_h_l2966_c17_557e_right,
BIN_OP_AND_uxn_opcodes_h_l2966_c17_557e_return_output);

-- CONST_SR_6_uxn_opcodes_h_l2966_c17_6eba
CONST_SR_6_uxn_opcodes_h_l2966_c17_6eba : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_opcodes_h_l2966_c17_6eba_x,
CONST_SR_6_uxn_opcodes_h_l2966_c17_6eba_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2967_c2_f89b
BIN_OP_XOR_uxn_opcodes_h_l2967_c2_f89b : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2967_c2_f89b_left,
BIN_OP_XOR_uxn_opcodes_h_l2967_c2_f89b_right,
BIN_OP_XOR_uxn_opcodes_h_l2967_c2_f89b_return_output);

-- sp0_MUX_uxn_opcodes_h_l2969_c2_16f7
sp0_MUX_uxn_opcodes_h_l2969_c2_16f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2969_c2_16f7_cond,
sp0_MUX_uxn_opcodes_h_l2969_c2_16f7_iftrue,
sp0_MUX_uxn_opcodes_h_l2969_c2_16f7_iffalse,
sp0_MUX_uxn_opcodes_h_l2969_c2_16f7_return_output);

-- sp1_MUX_uxn_opcodes_h_l2969_c2_16f7
sp1_MUX_uxn_opcodes_h_l2969_c2_16f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2969_c2_16f7_cond,
sp1_MUX_uxn_opcodes_h_l2969_c2_16f7_iftrue,
sp1_MUX_uxn_opcodes_h_l2969_c2_16f7_iffalse,
sp1_MUX_uxn_opcodes_h_l2969_c2_16f7_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2970_c3_bef6
BIN_OP_PLUS_uxn_opcodes_h_l2970_c3_bef6 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2970_c3_bef6_left,
BIN_OP_PLUS_uxn_opcodes_h_l2970_c3_bef6_right,
BIN_OP_PLUS_uxn_opcodes_h_l2970_c3_bef6_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2972_c3_94ea
BIN_OP_PLUS_uxn_opcodes_h_l2972_c3_94ea : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2972_c3_94ea_left,
BIN_OP_PLUS_uxn_opcodes_h_l2972_c3_94ea_right,
BIN_OP_PLUS_uxn_opcodes_h_l2972_c3_94ea_return_output);

-- MUX_uxn_opcodes_h_l2975_c29_eb6a
MUX_uxn_opcodes_h_l2975_c29_eb6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2975_c29_eb6a_cond,
MUX_uxn_opcodes_h_l2975_c29_eb6a_iftrue,
MUX_uxn_opcodes_h_l2975_c29_eb6a_iffalse,
MUX_uxn_opcodes_h_l2975_c29_eb6a_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2975_c19_f9f9
BIN_OP_MINUS_uxn_opcodes_h_l2975_c19_f9f9 : entity work.BIN_OP_MINUS_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2975_c19_f9f9_left,
BIN_OP_MINUS_uxn_opcodes_h_l2975_c19_f9f9_right,
BIN_OP_MINUS_uxn_opcodes_h_l2975_c19_f9f9_return_output);

-- MUX_uxn_opcodes_h_l2976_c20_1046
MUX_uxn_opcodes_h_l2976_c20_1046 : entity work.MUX_uint1_t_uint9_t_uint9_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2976_c20_1046_cond,
MUX_uxn_opcodes_h_l2976_c20_1046_iftrue,
MUX_uxn_opcodes_h_l2976_c20_1046_iffalse,
MUX_uxn_opcodes_h_l2976_c20_1046_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2976_c2_1210
BIN_OP_PLUS_uxn_opcodes_h_l2976_c2_1210 : entity work.BIN_OP_PLUS_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2976_c2_1210_left,
BIN_OP_PLUS_uxn_opcodes_h_l2976_c2_1210_right,
BIN_OP_PLUS_uxn_opcodes_h_l2976_c2_1210_return_output);

-- stack_ram_update_uxn_opcodes_h_l2978_c24_9680
stack_ram_update_uxn_opcodes_h_l2978_c24_9680 : entity work.stack_ram_update_0CLK_23f04728 port map (
clk,
stack_ram_update_uxn_opcodes_h_l2978_c24_9680_CLOCK_ENABLE,
stack_ram_update_uxn_opcodes_h_l2978_c24_9680_stack_address,
stack_ram_update_uxn_opcodes_h_l2978_c24_9680_value,
stack_ram_update_uxn_opcodes_h_l2978_c24_9680_write_enable,
stack_ram_update_uxn_opcodes_h_l2978_c24_9680_return_output);



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
 BIN_OP_AND_uxn_opcodes_h_l2886_c14_fbdf_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2887_c14_ab01_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2887_c14_243d_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l2887_c14_86a8_return_output,
 BIN_OP_NEQ_uxn_opcodes_h_l2887_c14_f0ba_return_output,
 MUX_uxn_opcodes_h_l2887_c14_92de_return_output,
 MUX_uxn_opcodes_h_l2888_c8_3cba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2894_c6_9135_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9bf1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_return_output,
 is_wait_MUX_uxn_opcodes_h_l2894_c2_fcbf_return_output,
 brk_uxn_opcodes_h_l2894_c48_80b6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3307_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_84c1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_8c27_return_output,
 opc_result_MUX_uxn_opcodes_h_l2895_c7_9bf1_return_output,
 jci_uxn_opcodes_h_l2895_c40_387e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2896_c11_d934_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_b2f8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_f181_return_output,
 opc_result_MUX_uxn_opcodes_h_l2896_c7_8c27_return_output,
 jmi_uxn_opcodes_h_l2896_c40_df61_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2897_c11_728f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b586_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c2ab_return_output,
 opc_result_MUX_uxn_opcodes_h_l2897_c7_f181_return_output,
 jsi_uxn_opcodes_h_l2897_c40_c6e2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2898_c11_42f5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_bc05_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9048_return_output,
 opc_result_MUX_uxn_opcodes_h_l2898_c7_c2ab_return_output,
 lit_uxn_opcodes_h_l2898_c40_1897_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6ef1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_942a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a9ef_return_output,
 opc_result_MUX_uxn_opcodes_h_l2899_c7_9048_return_output,
 lit2_uxn_opcodes_h_l2899_c40_f5bd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2900_c11_2277_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a842_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_15dc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2900_c7_a9ef_return_output,
 lit_uxn_opcodes_h_l2900_c40_37bb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2901_c11_9184_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_8dba_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_84ad_return_output,
 opc_result_MUX_uxn_opcodes_h_l2901_c7_15dc_return_output,
 lit2_uxn_opcodes_h_l2901_c40_9bbc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2902_c11_34a9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_b4f2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_ae00_return_output,
 opc_result_MUX_uxn_opcodes_h_l2902_c7_84ad_return_output,
 inc_uxn_opcodes_h_l2902_c40_39f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2d46_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_113e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dbf4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2903_c7_ae00_return_output,
 inc2_uxn_opcodes_h_l2903_c40_37be_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2904_c11_bc4d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_369b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c240_return_output,
 opc_result_MUX_uxn_opcodes_h_l2904_c7_dbf4_return_output,
 pop_uxn_opcodes_h_l2904_c40_f75b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d3f6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_f3e4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e572_return_output,
 opc_result_MUX_uxn_opcodes_h_l2905_c7_c240_return_output,
 pop2_uxn_opcodes_h_l2905_c40_d926_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ac3b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_e895_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_90ba_return_output,
 opc_result_MUX_uxn_opcodes_h_l2906_c7_e572_return_output,
 nip_uxn_opcodes_h_l2906_c40_5cae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2907_c11_d7c5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_d39f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f462_return_output,
 opc_result_MUX_uxn_opcodes_h_l2907_c7_90ba_return_output,
 nip2_uxn_opcodes_h_l2907_c40_5b74_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2908_c11_625a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e20f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_71b2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2908_c7_f462_return_output,
 swp_uxn_opcodes_h_l2908_c40_65fd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2909_c11_1ad1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0af4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_78e8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2909_c7_71b2_return_output,
 swp2_uxn_opcodes_h_l2909_c40_cd1b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b359_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_8667_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_809c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2910_c7_78e8_return_output,
 rot_uxn_opcodes_h_l2910_c40_0769_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2911_c11_5b26_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_df92_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0bda_return_output,
 opc_result_MUX_uxn_opcodes_h_l2911_c7_809c_return_output,
 rot2_uxn_opcodes_h_l2911_c40_0152_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3d0d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_a78f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3c3c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2912_c7_0bda_return_output,
 dup_uxn_opcodes_h_l2912_c40_f0d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e050_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_5027_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_b249_return_output,
 opc_result_MUX_uxn_opcodes_h_l2913_c7_3c3c_return_output,
 dup2_uxn_opcodes_h_l2913_c40_907f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2914_c11_c146_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_cfdb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5684_return_output,
 opc_result_MUX_uxn_opcodes_h_l2914_c7_b249_return_output,
 ovr_uxn_opcodes_h_l2914_c40_15b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9f05_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_4cf0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c7b4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2915_c7_5684_return_output,
 ovr2_uxn_opcodes_h_l2915_c40_e347_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2916_c11_5f3c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_eeb9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_9fc1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2916_c7_c7b4_return_output,
 equ_uxn_opcodes_h_l2916_c40_2ca8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d97f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f445_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_079c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2917_c7_9fc1_return_output,
 equ2_uxn_opcodes_h_l2917_c40_7b86_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2918_c11_707f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ba3a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_725b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2918_c7_079c_return_output,
 neq_uxn_opcodes_h_l2918_c40_ab73_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2919_c11_071c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4d9d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3041_return_output,
 opc_result_MUX_uxn_opcodes_h_l2919_c7_725b_return_output,
 neq2_uxn_opcodes_h_l2919_c40_d31b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2920_c11_93b4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e5df_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_9d27_return_output,
 opc_result_MUX_uxn_opcodes_h_l2920_c7_3041_return_output,
 gth_uxn_opcodes_h_l2920_c40_29df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2921_c11_5811_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f1ec_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_569e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2921_c7_9d27_return_output,
 gth2_uxn_opcodes_h_l2921_c40_1b5f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3054_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_5bef_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_063c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2922_c7_569e_return_output,
 lth_uxn_opcodes_h_l2922_c40_6c45_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2dfe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_c400_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_60be_return_output,
 opc_result_MUX_uxn_opcodes_h_l2923_c7_063c_return_output,
 lth2_uxn_opcodes_h_l2923_c40_a691_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1871_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2cff_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_f293_return_output,
 opc_result_MUX_uxn_opcodes_h_l2924_c7_60be_return_output,
 jmp_uxn_opcodes_h_l2924_c40_7981_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2925_c11_ca16_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_a50b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_4fc7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2925_c7_f293_return_output,
 jmp2_uxn_opcodes_h_l2925_c40_8785_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2926_c11_8cff_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_87ff_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c235_return_output,
 opc_result_MUX_uxn_opcodes_h_l2926_c7_4fc7_return_output,
 jcn_uxn_opcodes_h_l2926_c40_bf95_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2927_c11_2a0f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_736f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9354_return_output,
 opc_result_MUX_uxn_opcodes_h_l2927_c7_c235_return_output,
 jcn2_uxn_opcodes_h_l2927_c40_1ece_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2928_c11_ae7d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_8900_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_b078_return_output,
 opc_result_MUX_uxn_opcodes_h_l2928_c7_9354_return_output,
 jsr_uxn_opcodes_h_l2928_c40_2309_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2fcc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_e997_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_25ff_return_output,
 opc_result_MUX_uxn_opcodes_h_l2929_c7_b078_return_output,
 jsr2_uxn_opcodes_h_l2929_c40_3cec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2930_c11_53c8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5d01_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ff89_return_output,
 opc_result_MUX_uxn_opcodes_h_l2930_c7_25ff_return_output,
 sth_uxn_opcodes_h_l2930_c40_5228_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2931_c11_2f04_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8432_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_110a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2931_c7_ff89_return_output,
 sth2_uxn_opcodes_h_l2931_c40_60f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2cbf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_5bce_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_e3af_return_output,
 opc_result_MUX_uxn_opcodes_h_l2932_c7_110a_return_output,
 ldz_uxn_opcodes_h_l2932_c40_beec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2933_c11_b567_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_61fc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_ed89_return_output,
 opc_result_MUX_uxn_opcodes_h_l2933_c7_e3af_return_output,
 ldz2_uxn_opcodes_h_l2933_c40_ec39_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2934_c11_d1e8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_9b2f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_14a9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2934_c7_ed89_return_output,
 stz_uxn_opcodes_h_l2934_c40_08b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2935_c11_e3d9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_8799_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_9da5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2935_c7_14a9_return_output,
 stz2_uxn_opcodes_h_l2935_c40_1781_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2936_c11_a20b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ba7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_14fe_return_output,
 opc_result_MUX_uxn_opcodes_h_l2936_c7_9da5_return_output,
 ldr_uxn_opcodes_h_l2936_c40_2b0f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1e6f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_770f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_3f46_return_output,
 opc_result_MUX_uxn_opcodes_h_l2937_c7_14fe_return_output,
 ldr2_uxn_opcodes_h_l2937_c40_0c30_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2938_c11_30c6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_3aff_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_1cd0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2938_c7_3f46_return_output,
 str1_uxn_opcodes_h_l2938_c40_6062_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2939_c11_4c39_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5ea3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_1276_return_output,
 opc_result_MUX_uxn_opcodes_h_l2939_c7_1cd0_return_output,
 str2_uxn_opcodes_h_l2939_c40_e81d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2940_c11_626d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_e729_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_cba6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2940_c7_1276_return_output,
 lda_uxn_opcodes_h_l2940_c40_31f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2941_c11_19fc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_630d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_713f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2941_c7_cba6_return_output,
 lda2_uxn_opcodes_h_l2941_c40_f02f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2942_c11_d3c6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b8d2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_bb37_return_output,
 opc_result_MUX_uxn_opcodes_h_l2942_c7_713f_return_output,
 sta_uxn_opcodes_h_l2942_c40_b0d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2943_c11_e47d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_91d3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_bdf4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2943_c7_bb37_return_output,
 sta2_uxn_opcodes_h_l2943_c40_d176_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2944_c11_d52d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_adea_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_553d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2944_c7_bdf4_return_output,
 dei_uxn_opcodes_h_l2944_c40_ceb7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2945_c11_0be9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_996d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_756f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2945_c7_553d_return_output,
 dei2_uxn_opcodes_h_l2945_c40_67db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2946_c11_941b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_780d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_040a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2946_c7_756f_return_output,
 deo_uxn_opcodes_h_l2946_c40_5f8f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2947_c11_cd1f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_0a9e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_d000_return_output,
 opc_result_MUX_uxn_opcodes_h_l2947_c7_040a_return_output,
 deo2_uxn_opcodes_h_l2947_c40_c304_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2948_c11_e832_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_e5bc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a058_return_output,
 opc_result_MUX_uxn_opcodes_h_l2948_c7_d000_return_output,
 add_uxn_opcodes_h_l2948_c40_92a0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2949_c11_67ec_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_4553_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5574_return_output,
 opc_result_MUX_uxn_opcodes_h_l2949_c7_a058_return_output,
 add2_uxn_opcodes_h_l2949_c40_75dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2950_c11_2aa2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_4f89_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_72bf_return_output,
 opc_result_MUX_uxn_opcodes_h_l2950_c7_5574_return_output,
 sub_uxn_opcodes_h_l2950_c40_110d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2951_c11_671c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_1855_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_5789_return_output,
 opc_result_MUX_uxn_opcodes_h_l2951_c7_72bf_return_output,
 sub2_uxn_opcodes_h_l2951_c40_3c50_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2952_c11_108f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4300_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_87ca_return_output,
 opc_result_MUX_uxn_opcodes_h_l2952_c7_5789_return_output,
 mul_uxn_opcodes_h_l2952_c40_6bd6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2953_c11_f31b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_3d98_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e7a5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2953_c7_87ca_return_output,
 mul2_uxn_opcodes_h_l2953_c40_7687_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2954_c11_0077_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_0df9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ad12_return_output,
 opc_result_MUX_uxn_opcodes_h_l2954_c7_e7a5_return_output,
 div_uxn_opcodes_h_l2954_c40_4707_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2955_c11_1253_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_8426_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_1de8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2955_c7_ad12_return_output,
 div2_uxn_opcodes_h_l2955_c40_1cb2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2956_c11_0997_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_6f14_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_f15f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2956_c7_1de8_return_output,
 and_uxn_opcodes_h_l2956_c40_b846_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2957_c11_87d0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_5d8f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_60b8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2957_c7_f15f_return_output,
 and2_uxn_opcodes_h_l2957_c40_a05a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2958_c11_e66f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_6dde_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_8868_return_output,
 opc_result_MUX_uxn_opcodes_h_l2958_c7_60b8_return_output,
 ora_uxn_opcodes_h_l2958_c40_1e2f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2959_c11_5f9d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_cdf7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_f9db_return_output,
 opc_result_MUX_uxn_opcodes_h_l2959_c7_8868_return_output,
 ora2_uxn_opcodes_h_l2959_c40_4dc9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2960_c11_af73_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_eb8d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_23fd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2960_c7_f9db_return_output,
 eor_uxn_opcodes_h_l2960_c40_0638_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2961_c11_8a0c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_c132_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_8da2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2961_c7_23fd_return_output,
 eor2_uxn_opcodes_h_l2961_c40_8326_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2962_c11_4b7a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_ab8e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_f0c9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2962_c7_8da2_return_output,
 sft_uxn_opcodes_h_l2962_c40_433f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2963_c11_1fc0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_81f3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2963_c7_f0c9_return_output,
 sft2_uxn_opcodes_h_l2963_c40_e322_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2966_c17_557e_return_output,
 CONST_SR_6_uxn_opcodes_h_l2966_c17_6eba_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2967_c2_f89b_return_output,
 sp0_MUX_uxn_opcodes_h_l2969_c2_16f7_return_output,
 sp1_MUX_uxn_opcodes_h_l2969_c2_16f7_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2970_c3_bef6_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2972_c3_94ea_return_output,
 MUX_uxn_opcodes_h_l2975_c29_eb6a_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2975_c19_f9f9_return_output,
 MUX_uxn_opcodes_h_l2976_c20_1046_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2976_c2_1210_return_output,
 stack_ram_update_uxn_opcodes_h_l2978_c24_9680_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2886_c14_fbdf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2886_c14_fbdf_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2886_c14_fbdf_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2887_c14_92de_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2887_c14_ab01_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2887_c14_ab01_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2887_c14_ab01_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2887_c14_243d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2887_c14_243d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2887_c14_243d_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2887_c14_86a8_expr : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2887_c14_86a8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2887_c14_f0ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2887_c14_f0ba_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2887_c14_f0ba_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2887_c14_92de_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2887_c14_92de_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2887_c14_92de_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c6_9135_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c6_9135_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c6_9135_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9bf1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9bf1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9bf1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9bf1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_9bf1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_cond : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2894_c2_fcbf_iftrue : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2894_c2_fcbf_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2894_c2_fcbf_return_output : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2894_c2_fcbf_cond : unsigned(0 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2894_c48_80b6_phase : unsigned(7 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2894_c48_80b6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3307_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3307_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3307_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_84c1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_84c1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_84c1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_84c1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_8c27_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_8c27_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_8c27_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_8c27_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_9bf1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_9bf1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_8c27_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_9bf1_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2895_c40_387e_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2895_c40_387e_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2895_c40_387e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2895_c40_387e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2895_c40_387e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2895_c40_387e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_d934_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_d934_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_d934_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_b2f8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_b2f8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_b2f8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_b2f8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_f181_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_f181_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_f181_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_f181_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_8c27_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_8c27_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_f181_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_8c27_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2896_c40_df61_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2896_c40_df61_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2896_c40_df61_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2896_c40_df61_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2896_c40_df61_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_728f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_728f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_728f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b586_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b586_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b586_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b586_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c2ab_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c2ab_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c2ab_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c2ab_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_f181_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_f181_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_c2ab_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_f181_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2897_c40_c6e2_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2897_c40_c6e2_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2897_c40_c6e2_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2897_c40_c6e2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2897_c40_c6e2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_42f5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_42f5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_42f5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_bc05_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_bc05_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_bc05_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_bc05_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9048_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9048_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9048_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9048_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_c2ab_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_c2ab_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_9048_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_c2ab_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2898_c40_1897_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2898_c40_1897_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2898_c40_1897_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2898_c40_1897_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2898_c40_1897_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6ef1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6ef1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6ef1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_942a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_942a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_942a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_942a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a9ef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a9ef_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a9ef_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a9ef_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_9048_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_9048_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_a9ef_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_9048_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2899_c40_f5bd_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2899_c40_f5bd_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2899_c40_f5bd_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2899_c40_f5bd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2899_c40_f5bd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_2277_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_2277_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_2277_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a842_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a842_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a842_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a842_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_15dc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_15dc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_15dc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_15dc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_a9ef_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_a9ef_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_15dc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_a9ef_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2900_c40_37bb_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2900_c40_37bb_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2900_c40_37bb_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2900_c40_37bb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2900_c40_37bb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_9184_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_9184_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_9184_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_8dba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_8dba_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_8dba_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_8dba_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_84ad_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_84ad_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_84ad_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_84ad_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_15dc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_15dc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_84ad_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_15dc_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2901_c40_9bbc_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2901_c40_9bbc_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2901_c40_9bbc_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2901_c40_9bbc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2901_c40_9bbc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_34a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_34a9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_34a9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_b4f2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_b4f2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_b4f2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_b4f2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_ae00_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_ae00_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_ae00_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_ae00_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_84ad_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_84ad_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_ae00_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_84ad_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2902_c40_39f6_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2902_c40_39f6_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2902_c40_39f6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2902_c40_39f6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2902_c40_39f6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2d46_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2d46_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2d46_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_113e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_113e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_113e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_113e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dbf4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dbf4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dbf4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dbf4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_ae00_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_ae00_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_dbf4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_ae00_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2903_c40_37be_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2903_c40_37be_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2903_c40_37be_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2903_c40_37be_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2903_c40_37be_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_bc4d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_bc4d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_bc4d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_369b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_369b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_369b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_369b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c240_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c240_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c240_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c240_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_dbf4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_dbf4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_c240_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_dbf4_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2904_c40_f75b_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2904_c40_f75b_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2904_c40_f75b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2904_c40_f75b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d3f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d3f6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d3f6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_f3e4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_f3e4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_f3e4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_f3e4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e572_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e572_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e572_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e572_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_c240_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_c240_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_e572_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_c240_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2905_c40_d926_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2905_c40_d926_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2905_c40_d926_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2905_c40_d926_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ac3b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ac3b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ac3b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_e895_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_e895_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_e895_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_e895_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_90ba_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_90ba_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_90ba_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_90ba_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_e572_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_e572_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_90ba_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_e572_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2906_c40_5cae_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2906_c40_5cae_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2906_c40_5cae_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2906_c40_5cae_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2906_c40_5cae_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_d7c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_d7c5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_d7c5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_d39f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_d39f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_d39f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_d39f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f462_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f462_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f462_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f462_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_90ba_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_90ba_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_f462_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_90ba_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2907_c40_5b74_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2907_c40_5b74_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2907_c40_5b74_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2907_c40_5b74_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2907_c40_5b74_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_625a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_625a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_625a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e20f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e20f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e20f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e20f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_71b2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_71b2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_71b2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_71b2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_f462_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_f462_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_71b2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_f462_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2908_c40_65fd_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2908_c40_65fd_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2908_c40_65fd_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2908_c40_65fd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2908_c40_65fd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_1ad1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_1ad1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_1ad1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0af4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0af4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0af4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0af4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_78e8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_78e8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_78e8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_78e8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_71b2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_71b2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_78e8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_71b2_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2909_c40_cd1b_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2909_c40_cd1b_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2909_c40_cd1b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2909_c40_cd1b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2909_c40_cd1b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b359_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b359_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b359_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_8667_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_8667_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_8667_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_8667_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_809c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_809c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_809c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_809c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_78e8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_78e8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_809c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_78e8_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2910_c40_0769_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2910_c40_0769_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2910_c40_0769_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2910_c40_0769_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2910_c40_0769_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_5b26_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_5b26_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_5b26_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_df92_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_df92_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_df92_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_df92_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0bda_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0bda_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0bda_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0bda_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_809c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_809c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_0bda_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_809c_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2911_c40_0152_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2911_c40_0152_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2911_c40_0152_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2911_c40_0152_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2911_c40_0152_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3d0d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3d0d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3d0d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_a78f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_a78f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_a78f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_a78f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3c3c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3c3c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3c3c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3c3c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_0bda_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_0bda_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_3c3c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_0bda_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2912_c40_f0d1_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2912_c40_f0d1_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2912_c40_f0d1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2912_c40_f0d1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2912_c40_f0d1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e050_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e050_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e050_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_5027_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_5027_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_5027_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_5027_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_b249_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_b249_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_b249_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_b249_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_3c3c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_3c3c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_b249_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_3c3c_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2913_c40_907f_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2913_c40_907f_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2913_c40_907f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2913_c40_907f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2913_c40_907f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_c146_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_c146_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_c146_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_cfdb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_cfdb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_cfdb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_cfdb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5684_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5684_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5684_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5684_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_b249_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_b249_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_5684_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_b249_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2914_c40_15b0_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2914_c40_15b0_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2914_c40_15b0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2914_c40_15b0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2914_c40_15b0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9f05_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9f05_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9f05_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_4cf0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_4cf0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_4cf0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_4cf0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c7b4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c7b4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c7b4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c7b4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_5684_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_5684_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_c7b4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_5684_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2915_c40_e347_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2915_c40_e347_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2915_c40_e347_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2915_c40_e347_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2915_c40_e347_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_5f3c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_5f3c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_5f3c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_eeb9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_eeb9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_eeb9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_eeb9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_9fc1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_9fc1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_9fc1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_9fc1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_c7b4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_c7b4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_9fc1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_c7b4_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2916_c40_2ca8_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2916_c40_2ca8_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2916_c40_2ca8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2916_c40_2ca8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2916_c40_2ca8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d97f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d97f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d97f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f445_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f445_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f445_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f445_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_079c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_079c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_079c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_079c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_9fc1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_9fc1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_079c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_9fc1_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2917_c40_7b86_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2917_c40_7b86_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2917_c40_7b86_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2917_c40_7b86_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2917_c40_7b86_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_707f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_707f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_707f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ba3a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ba3a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ba3a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ba3a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_725b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_725b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_725b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_725b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_079c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_079c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_725b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_079c_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2918_c40_ab73_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2918_c40_ab73_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2918_c40_ab73_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2918_c40_ab73_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2918_c40_ab73_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_071c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_071c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_071c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4d9d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4d9d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4d9d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4d9d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3041_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3041_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3041_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3041_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_725b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_725b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_3041_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_725b_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2919_c40_d31b_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2919_c40_d31b_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2919_c40_d31b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2919_c40_d31b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2919_c40_d31b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_93b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_93b4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_93b4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e5df_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e5df_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e5df_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e5df_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_9d27_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_9d27_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_9d27_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_9d27_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_3041_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_3041_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_9d27_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_3041_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2920_c40_29df_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2920_c40_29df_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2920_c40_29df_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2920_c40_29df_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2920_c40_29df_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_5811_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_5811_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_5811_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f1ec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f1ec_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f1ec_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f1ec_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_569e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_569e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_569e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_569e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_9d27_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_9d27_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_569e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_9d27_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2921_c40_1b5f_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2921_c40_1b5f_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2921_c40_1b5f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2921_c40_1b5f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2921_c40_1b5f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3054_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3054_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3054_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_5bef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_5bef_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_5bef_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_5bef_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_063c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_063c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_063c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_063c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_569e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_569e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_063c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_569e_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2922_c40_6c45_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2922_c40_6c45_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2922_c40_6c45_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2922_c40_6c45_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2922_c40_6c45_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2dfe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2dfe_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2dfe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_c400_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_c400_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_c400_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_c400_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_60be_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_60be_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_60be_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_60be_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_063c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_063c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_60be_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_063c_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2923_c40_a691_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2923_c40_a691_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2923_c40_a691_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2923_c40_a691_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2923_c40_a691_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1871_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1871_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1871_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2cff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2cff_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2cff_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2cff_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_f293_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_f293_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_f293_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_f293_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_60be_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_60be_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_f293_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_60be_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2924_c40_7981_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2924_c40_7981_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2924_c40_7981_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2924_c40_7981_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2924_c40_7981_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2924_c40_7981_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_ca16_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_ca16_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_ca16_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_a50b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_a50b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_a50b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_a50b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_4fc7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_4fc7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_4fc7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_4fc7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_f293_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_f293_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_4fc7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_f293_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2925_c40_8785_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2925_c40_8785_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2925_c40_8785_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2925_c40_8785_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2925_c40_8785_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_8cff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_8cff_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_8cff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_87ff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_87ff_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_87ff_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_87ff_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c235_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c235_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c235_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c235_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_4fc7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_4fc7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_c235_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_4fc7_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2926_c40_bf95_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2926_c40_bf95_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2926_c40_bf95_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2926_c40_bf95_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2926_c40_bf95_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2926_c40_bf95_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_2a0f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_2a0f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_2a0f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_736f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_736f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_736f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_736f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9354_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9354_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9354_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9354_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_c235_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_c235_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_9354_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_c235_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2927_c40_1ece_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2927_c40_1ece_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2927_c40_1ece_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2927_c40_1ece_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2927_c40_1ece_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_ae7d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_ae7d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_ae7d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_8900_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_8900_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_8900_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_8900_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_b078_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_b078_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_b078_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_b078_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_9354_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_9354_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_b078_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_9354_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2928_c40_2309_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2928_c40_2309_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2928_c40_2309_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2928_c40_2309_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2928_c40_2309_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2928_c40_2309_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2fcc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2fcc_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2fcc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_e997_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_e997_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_e997_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_e997_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_25ff_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_25ff_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_25ff_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_25ff_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_b078_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_b078_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_25ff_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_b078_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2929_c40_3cec_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2929_c40_3cec_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2929_c40_3cec_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2929_c40_3cec_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2929_c40_3cec_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2929_c40_3cec_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_53c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_53c8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_53c8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5d01_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5d01_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5d01_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5d01_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ff89_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ff89_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ff89_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ff89_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_25ff_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_25ff_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_ff89_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_25ff_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2930_c40_5228_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2930_c40_5228_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2930_c40_5228_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2930_c40_5228_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2930_c40_5228_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_2f04_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_2f04_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_2f04_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8432_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8432_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8432_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8432_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_110a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_110a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_110a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_110a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_ff89_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_ff89_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_110a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_ff89_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2931_c40_60f7_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2931_c40_60f7_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2931_c40_60f7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2931_c40_60f7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2931_c40_60f7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2cbf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2cbf_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2cbf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_5bce_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_5bce_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_5bce_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_5bce_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_e3af_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_e3af_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_e3af_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_e3af_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_110a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_110a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_e3af_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_110a_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2932_c40_beec_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2932_c40_beec_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2932_c40_beec_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2932_c40_beec_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2932_c40_beec_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2932_c40_beec_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_b567_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_b567_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_b567_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_61fc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_61fc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_61fc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_61fc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_ed89_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_ed89_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_ed89_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_ed89_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_e3af_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_e3af_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_ed89_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_e3af_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2933_c40_ec39_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2933_c40_ec39_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2933_c40_ec39_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2933_c40_ec39_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2933_c40_ec39_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2933_c40_ec39_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_d1e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_d1e8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_d1e8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_9b2f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_9b2f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_9b2f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_9b2f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_14a9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_14a9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_14a9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_14a9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_ed89_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_ed89_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_14a9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_ed89_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2934_c40_08b5_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2934_c40_08b5_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2934_c40_08b5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2934_c40_08b5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2934_c40_08b5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_e3d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_e3d9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_e3d9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_8799_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_8799_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_8799_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_8799_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_9da5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_9da5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_9da5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_9da5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_14a9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_14a9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_9da5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_14a9_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2935_c40_1781_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2935_c40_1781_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2935_c40_1781_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2935_c40_1781_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2935_c40_1781_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_a20b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_a20b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_a20b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ba7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ba7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ba7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ba7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_14fe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_14fe_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_14fe_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_14fe_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_9da5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_9da5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_14fe_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_9da5_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2936_c40_2b0f_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2936_c40_2b0f_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2936_c40_2b0f_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2936_c40_2b0f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2936_c40_2b0f_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2936_c40_2b0f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2936_c40_2b0f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1e6f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1e6f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1e6f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_770f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_770f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_770f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_770f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_3f46_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_3f46_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_3f46_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_3f46_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_14fe_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_14fe_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_3f46_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_14fe_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2937_c40_0c30_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2937_c40_0c30_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2937_c40_0c30_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2937_c40_0c30_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2937_c40_0c30_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2937_c40_0c30_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2937_c40_0c30_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_30c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_30c6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_30c6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_3aff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_3aff_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_3aff_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_3aff_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_1cd0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_1cd0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_1cd0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_1cd0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_3f46_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_3f46_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_1cd0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_3f46_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2938_c40_6062_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2938_c40_6062_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2938_c40_6062_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2938_c40_6062_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2938_c40_6062_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2938_c40_6062_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_4c39_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_4c39_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_4c39_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5ea3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5ea3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5ea3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5ea3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_1276_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_1276_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_1276_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_1276_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_1cd0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_1cd0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_1276_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_1cd0_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2939_c40_e81d_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2939_c40_e81d_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2939_c40_e81d_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2939_c40_e81d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2939_c40_e81d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2939_c40_e81d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_626d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_626d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_626d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_e729_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_e729_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_e729_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_e729_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_cba6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_cba6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_cba6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_cba6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_1276_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_1276_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_cba6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_1276_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2940_c40_31f9_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2940_c40_31f9_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2940_c40_31f9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2940_c40_31f9_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2940_c40_31f9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2940_c40_31f9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_19fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_19fc_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_19fc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_630d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_630d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_630d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_630d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_713f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_713f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_713f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_713f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_cba6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_cba6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_713f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_cba6_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2941_c40_f02f_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2941_c40_f02f_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2941_c40_f02f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2941_c40_f02f_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2941_c40_f02f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2941_c40_f02f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_d3c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_d3c6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_d3c6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b8d2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b8d2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b8d2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b8d2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_bb37_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_bb37_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_bb37_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_bb37_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_713f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_713f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_bb37_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_713f_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2942_c40_b0d7_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2942_c40_b0d7_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2942_c40_b0d7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2942_c40_b0d7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2942_c40_b0d7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_e47d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_e47d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_e47d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_91d3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_91d3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_91d3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_91d3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_bdf4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_bdf4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_bdf4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_bdf4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_bb37_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_bb37_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_bdf4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_bb37_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2943_c40_d176_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2943_c40_d176_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2943_c40_d176_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2943_c40_d176_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2943_c40_d176_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_d52d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_d52d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_d52d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_adea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_adea_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_adea_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_adea_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_553d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_553d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_553d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_553d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_bdf4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_bdf4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_553d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_bdf4_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2944_c40_ceb7_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2944_c40_ceb7_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2944_c40_ceb7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2944_c40_ceb7_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2944_c40_ceb7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2944_c40_ceb7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_0be9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_0be9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_0be9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_996d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_996d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_996d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_996d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_756f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_756f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_756f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_756f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_553d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_553d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_756f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_553d_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2945_c40_67db_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2945_c40_67db_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2945_c40_67db_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2945_c40_67db_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2945_c40_67db_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2945_c40_67db_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_941b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_941b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_941b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_780d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_780d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_780d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_780d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_040a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_040a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_040a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_040a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_756f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_756f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_040a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_756f_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2946_c40_5f8f_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2946_c40_5f8f_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2946_c40_5f8f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2946_c40_5f8f_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2946_c40_5f8f_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2946_c40_5f8f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2946_c40_5f8f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_cd1f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_cd1f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_cd1f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_0a9e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_0a9e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_0a9e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_0a9e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_d000_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_d000_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_d000_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_d000_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_040a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_040a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_d000_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_040a_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2947_c40_c304_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2947_c40_c304_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2947_c40_c304_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2947_c40_c304_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2947_c40_c304_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2947_c40_c304_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2947_c40_c304_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_e832_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_e832_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_e832_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_e5bc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_e5bc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_e5bc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_e5bc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a058_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a058_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a058_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a058_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_d000_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_d000_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_a058_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_d000_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2948_c40_92a0_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2948_c40_92a0_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2948_c40_92a0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2948_c40_92a0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2948_c40_92a0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_67ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_67ec_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_67ec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_4553_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_4553_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_4553_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_4553_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5574_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5574_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5574_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5574_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_a058_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_a058_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_5574_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_a058_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2949_c40_75dc_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2949_c40_75dc_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2949_c40_75dc_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2949_c40_75dc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2949_c40_75dc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_2aa2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_2aa2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_2aa2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_4f89_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_4f89_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_4f89_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_4f89_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_72bf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_72bf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_72bf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_72bf_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_5574_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_5574_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_72bf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_5574_cond : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2950_c40_110d_phase : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2950_c40_110d_ins : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2950_c40_110d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2950_c40_110d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2950_c40_110d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_671c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_671c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_671c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_1855_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_1855_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_1855_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_1855_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_5789_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_5789_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_5789_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_5789_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_72bf_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_72bf_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_5789_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_72bf_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2951_c40_3c50_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2951_c40_3c50_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2951_c40_3c50_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2951_c40_3c50_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2951_c40_3c50_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_108f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_108f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_108f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4300_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4300_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4300_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4300_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_87ca_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_87ca_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_87ca_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_87ca_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_5789_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_5789_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_87ca_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_5789_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2952_c40_6bd6_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2952_c40_6bd6_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2952_c40_6bd6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2952_c40_6bd6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2952_c40_6bd6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_f31b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_f31b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_f31b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_3d98_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_3d98_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_3d98_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_3d98_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e7a5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e7a5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e7a5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e7a5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_87ca_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_87ca_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_e7a5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_87ca_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2953_c40_7687_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2953_c40_7687_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2953_c40_7687_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2953_c40_7687_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2953_c40_7687_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_0077_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_0077_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_0077_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_0df9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_0df9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_0df9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_0df9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ad12_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ad12_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ad12_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ad12_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_e7a5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_e7a5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_ad12_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_e7a5_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2954_c40_4707_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2954_c40_4707_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2954_c40_4707_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2954_c40_4707_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2954_c40_4707_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_1253_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_1253_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_1253_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_8426_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_8426_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_8426_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_8426_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_1de8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_1de8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_1de8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_1de8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_ad12_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_ad12_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_1de8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_ad12_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2955_c40_1cb2_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2955_c40_1cb2_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2955_c40_1cb2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2955_c40_1cb2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2955_c40_1cb2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_0997_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_0997_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_0997_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_6f14_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_6f14_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_6f14_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_6f14_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_f15f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_f15f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_f15f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_f15f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_1de8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_1de8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_f15f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_1de8_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2956_c40_b846_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2956_c40_b846_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2956_c40_b846_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2956_c40_b846_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2956_c40_b846_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_87d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_87d0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_87d0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_5d8f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_5d8f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_5d8f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_5d8f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_60b8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_60b8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_60b8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_60b8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_f15f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_f15f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_60b8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_f15f_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2957_c40_a05a_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2957_c40_a05a_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2957_c40_a05a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2957_c40_a05a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2957_c40_a05a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2958_c11_e66f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2958_c11_e66f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2958_c11_e66f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_6dde_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_6dde_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_6dde_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_6dde_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_8868_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_8868_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_8868_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_8868_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_60b8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_60b8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2959_c7_8868_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_60b8_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2958_c40_1e2f_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2958_c40_1e2f_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2958_c40_1e2f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2958_c40_1e2f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2958_c40_1e2f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_5f9d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_5f9d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_5f9d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_cdf7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_cdf7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_cdf7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_cdf7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_f9db_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_f9db_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_f9db_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_f9db_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2959_c7_8868_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2959_c7_8868_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2960_c7_f9db_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2959_c7_8868_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2959_c40_4dc9_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2959_c40_4dc9_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2959_c40_4dc9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2959_c40_4dc9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2959_c40_4dc9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_af73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_af73_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_af73_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_eb8d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_eb8d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_eb8d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_eb8d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_23fd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_23fd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_23fd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_23fd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2960_c7_f9db_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2960_c7_f9db_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2961_c7_23fd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2960_c7_f9db_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2960_c40_0638_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2960_c40_0638_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2960_c40_0638_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2960_c40_0638_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2960_c40_0638_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2961_c11_8a0c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2961_c11_8a0c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2961_c11_8a0c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_c132_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_c132_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_c132_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_c132_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_8da2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_8da2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_8da2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_8da2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2961_c7_23fd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2961_c7_23fd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2962_c7_8da2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2961_c7_23fd_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2961_c40_8326_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2961_c40_8326_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2961_c40_8326_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2961_c40_8326_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2961_c40_8326_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_4b7a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_4b7a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_4b7a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_ab8e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_ab8e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_ab8e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_ab8e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_f0c9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_f0c9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_f0c9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_f0c9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2962_c7_8da2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2962_c7_8da2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2963_c7_f0c9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2962_c7_8da2_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2962_c40_433f_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2962_c40_433f_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2962_c40_433f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2962_c40_433f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2962_c40_433f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_1fc0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_1fc0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_1fc0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_81f3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_81f3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_81f3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_81f3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2963_c7_f0c9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2963_c7_f0c9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2963_c7_f0c9_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2963_c40_e322_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2963_c40_e322_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2963_c40_e322_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2963_c40_e322_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2963_c40_e322_return_output : opcode_result_t;
 variable VAR_stack_index_uxn_opcodes_h_l2966_c2_8f51 : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2966_c17_557e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2966_c17_557e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2966_c17_557e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2966_c17_6eba_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2966_c17_6eba_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2967_c2_f89b_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2967_c17_4137_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2967_c2_f89b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2967_c2_f89b_return_output : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2969_c2_16f7_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2969_c2_16f7_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l2972_c3_8620 : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2969_c2_16f7_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2969_c2_16f7_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2969_c2_16f7_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l2970_c3_0a5c : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2969_c2_16f7_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2969_c2_16f7_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2969_c2_16f7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2970_c3_bef6_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2970_c3_bef6_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2970_c3_bef6_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2972_c3_94ea_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2972_c3_94ea_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2972_c3_94ea_return_output : signed(9 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2975_c29_eb6a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2975_c29_eb6a_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2975_c29_eb6a_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2975_c29_eb6a_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2975_c19_917b_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2975_c19_f9f9_left : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2975_c68_e572_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2975_c58_54f1_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2975_c19_f9f9_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2975_c19_f9f9_return_output : unsigned(8 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l2976_c2_f498 : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2976_c2_1210_left : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2976_c20_1046_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2976_c20_1046_iftrue : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2976_c20_1046_iffalse : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2976_c20_1046_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2976_c2_1210_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2976_c2_1210_return_output : unsigned(9 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2978_c24_9680_stack_address : unsigned(8 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2978_c24_9680_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2978_c24_9680_write_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2981_c3_7ddf_return_output : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2978_c24_9680_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2978_c24_9680_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2985_c39_25fe_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2986_c40_ca99_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2987_c34_7bff_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2988_c30_47ca_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2989_c33_14f7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2990_c34_cb20_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2991_c37_4a5b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2993_c32_8194_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2970_l2972_DUPLICATE_06aa_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2972_l2970_DUPLICATE_4f85_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2980_l2992_DUPLICATE_630a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2995_l2871_DUPLICATE_8637_return_output : eval_opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_67ec_right := to_unsigned(56, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_728f_right := to_unsigned(96, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_780d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_040a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c6_9135_right := to_unsigned(0, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_941b_right := to_unsigned(23, 8);
     VAR_MUX_uxn_opcodes_h_l2976_c20_1046_iftrue := to_unsigned(256, 9);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2966_c17_557e_right := to_unsigned(64, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_eeb9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_9fc1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_30c6_right := to_unsigned(19, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_4f89_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_72bf_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_34a9_right := to_unsigned(1, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_8cff_right := to_unsigned(13, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_93b4_right := to_unsigned(10, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_5f9d_right := to_unsigned(61, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_15dc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a842_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_756f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_996d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_b567_right := to_unsigned(48, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_ed89_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_61fc_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_3aff_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_1cd0_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_84ad_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_8dba_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_cdf7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_f9db_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4300_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_87ca_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_d3c6_right := to_unsigned(21, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_9184_right := to_unsigned(224, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0af4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_78e8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_671c_right := to_unsigned(57, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_6f14_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_f15f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_5027_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_b249_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ff89_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5d01_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2886_c14_fbdf_right := to_unsigned(63, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_e997_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_25ff_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_f3e4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e572_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_e729_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_cba6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_c146_right := to_unsigned(7, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_736f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9354_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d3f6_right := to_unsigned(34, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3d0d_right := to_unsigned(6, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_d7c5_right := to_unsigned(35, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_8c27_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_84c1_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_4553_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5574_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ba7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_14fe_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2887_c14_243d_right := to_unsigned(32, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_2a0f_right := to_unsigned(45, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_4c39_right := to_unsigned(51, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_071c_right := to_unsigned(41, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_079c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f445_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_81f3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_d000_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_0a9e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_f293_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2cff_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_713f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_630d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_707f_right := to_unsigned(9, 8);
     VAR_MUX_uxn_opcodes_h_l2887_c14_92de_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_e3d9_right := to_unsigned(49, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_626d_right := to_unsigned(20, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_cfdb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5684_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_063c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_5bef_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9f05_right := to_unsigned(39, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_60be_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_c400_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_1ad1_right := to_unsigned(36, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_ca16_right := to_unsigned(44, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_553d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_adea_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_bc4d_right := to_unsigned(2, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_14a9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_9b2f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_f181_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_b2f8_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_bc05_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9048_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_af73_right := to_unsigned(30, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_1253_right := to_unsigned(59, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2958_c11_e66f_right := to_unsigned(29, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_cd1f_right := to_unsigned(55, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_d934_right := to_unsigned(64, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3041_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4d9d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_4fc7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_a50b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c7b4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_4cf0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e7a5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_3d98_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_5811_right := to_unsigned(42, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2d46_right := to_unsigned(33, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6ef1_right := to_unsigned(160, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2cbf_right := to_unsigned(16, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_e832_right := to_unsigned(24, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_8799_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_9da5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_108f_right := to_unsigned(26, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_1fc0_right := to_unsigned(63, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_8868_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_6dde_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_725b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ba3a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c2ab_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b586_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_19fc_right := to_unsigned(52, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_df92_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0bda_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_f31b_right := to_unsigned(58, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_0997_right := to_unsigned(28, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_113e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dbf4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_e895_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_90ba_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_ae00_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_b4f2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_2f04_right := to_unsigned(47, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_2277_right := to_unsigned(192, 8);
     VAR_is_wait_MUX_uxn_opcodes_h_l2894_c2_fcbf_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_1276_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5ea3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c240_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_369b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_53c8_right := to_unsigned(15, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_ae7d_right := to_unsigned(14, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8432_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_110a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2fcc_right := to_unsigned(46, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_eb8d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_23fd_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_ab8e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_f0c9_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_3f46_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_770f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ac3b_right := to_unsigned(3, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_5d8f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_60b8_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_809c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_8667_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9bf1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_42f5_right := to_unsigned(128, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_e5bc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a058_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1871_right := to_unsigned(12, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_2aa2_right := to_unsigned(25, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_9d27_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e5df_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_569e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f1ec_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d97f_right := to_unsigned(40, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_a20b_right := to_unsigned(18, 8);
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2887_c14_f0ba_right := to_unsigned(0, 1);
     VAR_is_wait_MUX_uxn_opcodes_h_l2894_c2_fcbf_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_91d3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_bdf4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2961_c11_8a0c_right := to_unsigned(62, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3307_right := to_unsigned(32, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e050_right := to_unsigned(38, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f462_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_d39f_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_87ff_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c235_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_0be9_right := to_unsigned(54, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_e47d_right := to_unsigned(53, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3c3c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_a78f_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_0df9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ad12_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_e3af_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_5bce_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1e6f_right := to_unsigned(50, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_c132_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_8da2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_87d0_right := to_unsigned(60, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b359_right := to_unsigned(5, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_4b7a_right := to_unsigned(31, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_5f3c_right := to_unsigned(8, 8);
     VAR_MUX_uxn_opcodes_h_l2976_c20_1046_iffalse := resize(to_unsigned(0, 1), 9);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_8900_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_b078_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2887_c14_ab01_right := to_unsigned(223, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_71b2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e20f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_d52d_right := to_unsigned(22, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3054_right := to_unsigned(11, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2dfe_right := to_unsigned(43, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_625a_right := to_unsigned(4, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_0077_right := to_unsigned(27, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_8426_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_1de8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_1855_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_5789_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2887_c14_92de_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_5b26_right := to_unsigned(37, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b8d2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_bb37_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_942a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a9ef_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_d1e8_right := to_unsigned(17, 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9bf1_iffalse := VAR_CLOCK_ENABLE;
     VAR_stack_ram_update_uxn_opcodes_h_l2978_c24_9680_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2886_c14_fbdf_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2966_c17_557e_left := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_iftrue := VAR_ins;
     VAR_add2_uxn_opcodes_h_l2949_c40_75dc_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l2948_c40_92a0_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l2957_c40_a05a_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l2956_c40_b846_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l2945_c40_67db_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l2944_c40_ceb7_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l2947_c40_c304_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l2946_c40_5f8f_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l2955_c40_1cb2_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l2954_c40_4707_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l2913_c40_907f_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l2912_c40_f0d1_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l2961_c40_8326_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l2960_c40_0638_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l2917_c40_7b86_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l2916_c40_2ca8_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l2921_c40_1b5f_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l2920_c40_29df_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l2903_c40_37be_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l2902_c40_39f6_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l2927_c40_1ece_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l2926_c40_bf95_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l2925_c40_8785_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l2924_c40_7981_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l2929_c40_3cec_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l2928_c40_2309_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l2941_c40_f02f_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l2940_c40_31f9_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l2937_c40_0c30_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l2936_c40_2b0f_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l2933_c40_ec39_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l2932_c40_beec_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l2923_c40_a691_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l2922_c40_6c45_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l2953_c40_7687_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l2952_c40_6bd6_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l2919_c40_d31b_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l2918_c40_ab73_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l2907_c40_5b74_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l2906_c40_5cae_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l2959_c40_4dc9_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l2958_c40_1e2f_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l2915_c40_e347_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l2914_c40_15b0_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l2905_c40_d926_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l2904_c40_f75b_ins := VAR_ins;
     VAR_rot2_uxn_opcodes_h_l2911_c40_0152_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l2910_c40_0769_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l2963_c40_e322_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l2962_c40_433f_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l2943_c40_d176_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l2942_c40_b0d7_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l2931_c40_60f7_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l2930_c40_5228_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l2938_c40_6062_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l2939_c40_e81d_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l2935_c40_1781_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l2934_c40_08b5_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l2951_c40_3c50_ins := VAR_ins;
     VAR_sub_uxn_opcodes_h_l2950_c40_110d_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l2909_c40_cd1b_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l2908_c40_65fd_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l2963_c7_f0c9_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l2895_c40_387e_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l2926_c40_bf95_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l2896_c40_df61_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l2924_c40_7981_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l2897_c40_c6e2_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l2929_c40_3cec_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l2928_c40_2309_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l2937_c40_0c30_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l2936_c40_2b0f_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2899_c40_f5bd_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2901_c40_9bbc_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2898_c40_1897_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2900_c40_37bb_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l2938_c40_6062_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l2939_c40_e81d_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l2949_c40_75dc_phase := VAR_phase;
     VAR_add_uxn_opcodes_h_l2948_c40_92a0_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l2957_c40_a05a_phase := VAR_phase;
     VAR_and_uxn_opcodes_h_l2956_c40_b846_phase := VAR_phase;
     VAR_brk_uxn_opcodes_h_l2894_c48_80b6_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2945_c40_67db_phase := VAR_phase;
     VAR_dei_uxn_opcodes_h_l2944_c40_ceb7_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l2947_c40_c304_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l2946_c40_5f8f_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l2955_c40_1cb2_phase := VAR_phase;
     VAR_div_uxn_opcodes_h_l2954_c40_4707_phase := VAR_phase;
     VAR_dup2_uxn_opcodes_h_l2913_c40_907f_phase := VAR_phase;
     VAR_dup_uxn_opcodes_h_l2912_c40_f0d1_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l2961_c40_8326_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l2960_c40_0638_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l2917_c40_7b86_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l2916_c40_2ca8_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l2921_c40_1b5f_phase := VAR_phase;
     VAR_gth_uxn_opcodes_h_l2920_c40_29df_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l2903_c40_37be_phase := VAR_phase;
     VAR_inc_uxn_opcodes_h_l2902_c40_39f6_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l2895_c40_387e_phase := VAR_phase;
     VAR_jcn2_uxn_opcodes_h_l2927_c40_1ece_phase := VAR_phase;
     VAR_jcn_uxn_opcodes_h_l2926_c40_bf95_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l2896_c40_df61_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l2925_c40_8785_phase := VAR_phase;
     VAR_jmp_uxn_opcodes_h_l2924_c40_7981_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l2897_c40_c6e2_phase := VAR_phase;
     VAR_jsr2_uxn_opcodes_h_l2929_c40_3cec_phase := VAR_phase;
     VAR_jsr_uxn_opcodes_h_l2928_c40_2309_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l2941_c40_f02f_phase := VAR_phase;
     VAR_lda_uxn_opcodes_h_l2940_c40_31f9_phase := VAR_phase;
     VAR_ldr2_uxn_opcodes_h_l2937_c40_0c30_phase := VAR_phase;
     VAR_ldr_uxn_opcodes_h_l2936_c40_2b0f_phase := VAR_phase;
     VAR_ldz2_uxn_opcodes_h_l2933_c40_ec39_phase := VAR_phase;
     VAR_ldz_uxn_opcodes_h_l2932_c40_beec_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2899_c40_f5bd_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2901_c40_9bbc_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2898_c40_1897_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2900_c40_37bb_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l2923_c40_a691_phase := VAR_phase;
     VAR_lth_uxn_opcodes_h_l2922_c40_6c45_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l2953_c40_7687_phase := VAR_phase;
     VAR_mul_uxn_opcodes_h_l2952_c40_6bd6_phase := VAR_phase;
     VAR_neq2_uxn_opcodes_h_l2919_c40_d31b_phase := VAR_phase;
     VAR_neq_uxn_opcodes_h_l2918_c40_ab73_phase := VAR_phase;
     VAR_nip2_uxn_opcodes_h_l2907_c40_5b74_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l2906_c40_5cae_phase := VAR_phase;
     VAR_ora2_uxn_opcodes_h_l2959_c40_4dc9_phase := VAR_phase;
     VAR_ora_uxn_opcodes_h_l2958_c40_1e2f_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l2915_c40_e347_phase := VAR_phase;
     VAR_ovr_uxn_opcodes_h_l2914_c40_15b0_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l2905_c40_d926_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l2904_c40_f75b_phase := VAR_phase;
     VAR_rot2_uxn_opcodes_h_l2911_c40_0152_phase := VAR_phase;
     VAR_rot_uxn_opcodes_h_l2910_c40_0769_phase := VAR_phase;
     VAR_sft2_uxn_opcodes_h_l2963_c40_e322_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l2962_c40_433f_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l2943_c40_d176_phase := VAR_phase;
     VAR_sta_uxn_opcodes_h_l2942_c40_b0d7_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l2931_c40_60f7_phase := VAR_phase;
     VAR_sth_uxn_opcodes_h_l2930_c40_5228_phase := VAR_phase;
     VAR_str1_uxn_opcodes_h_l2938_c40_6062_phase := VAR_phase;
     VAR_str2_uxn_opcodes_h_l2939_c40_e81d_phase := VAR_phase;
     VAR_stz2_uxn_opcodes_h_l2935_c40_1781_phase := VAR_phase;
     VAR_stz_uxn_opcodes_h_l2934_c40_08b5_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l2951_c40_3c50_phase := VAR_phase;
     VAR_sub_uxn_opcodes_h_l2950_c40_110d_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l2909_c40_cd1b_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l2908_c40_65fd_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2945_c40_67db_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_dei_uxn_opcodes_h_l2944_c40_ceb7_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2947_c40_c304_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo_uxn_opcodes_h_l2946_c40_5f8f_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2947_c40_c304_previous_ram_read := VAR_previous_ram_read;
     VAR_deo_uxn_opcodes_h_l2946_c40_5f8f_previous_ram_read := VAR_previous_ram_read;
     VAR_jci_uxn_opcodes_h_l2895_c40_387e_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l2896_c40_df61_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l2897_c40_c6e2_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l2941_c40_f02f_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l2940_c40_31f9_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l2937_c40_0c30_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l2936_c40_2b0f_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l2933_c40_ec39_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l2932_c40_beec_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2899_c40_f5bd_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2901_c40_9bbc_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2898_c40_1897_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2900_c40_37bb_previous_ram_read := VAR_previous_ram_read;
     VAR_add2_uxn_opcodes_h_l2949_c40_75dc_previous_stack_read := previous_stack_read;
     VAR_add_uxn_opcodes_h_l2948_c40_92a0_previous_stack_read := previous_stack_read;
     VAR_and2_uxn_opcodes_h_l2957_c40_a05a_previous_stack_read := previous_stack_read;
     VAR_and_uxn_opcodes_h_l2956_c40_b846_previous_stack_read := previous_stack_read;
     VAR_dei2_uxn_opcodes_h_l2945_c40_67db_previous_stack_read := previous_stack_read;
     VAR_dei_uxn_opcodes_h_l2944_c40_ceb7_previous_stack_read := previous_stack_read;
     VAR_deo2_uxn_opcodes_h_l2947_c40_c304_previous_stack_read := previous_stack_read;
     VAR_deo_uxn_opcodes_h_l2946_c40_5f8f_previous_stack_read := previous_stack_read;
     VAR_div2_uxn_opcodes_h_l2955_c40_1cb2_previous_stack_read := previous_stack_read;
     VAR_div_uxn_opcodes_h_l2954_c40_4707_previous_stack_read := previous_stack_read;
     VAR_dup2_uxn_opcodes_h_l2913_c40_907f_previous_stack_read := previous_stack_read;
     VAR_dup_uxn_opcodes_h_l2912_c40_f0d1_previous_stack_read := previous_stack_read;
     VAR_eor2_uxn_opcodes_h_l2961_c40_8326_previous_stack_read := previous_stack_read;
     VAR_eor_uxn_opcodes_h_l2960_c40_0638_previous_stack_read := previous_stack_read;
     VAR_equ2_uxn_opcodes_h_l2917_c40_7b86_previous_stack_read := previous_stack_read;
     VAR_equ_uxn_opcodes_h_l2916_c40_2ca8_previous_stack_read := previous_stack_read;
     VAR_gth2_uxn_opcodes_h_l2921_c40_1b5f_previous_stack_read := previous_stack_read;
     VAR_gth_uxn_opcodes_h_l2920_c40_29df_previous_stack_read := previous_stack_read;
     VAR_inc2_uxn_opcodes_h_l2903_c40_37be_previous_stack_read := previous_stack_read;
     VAR_inc_uxn_opcodes_h_l2902_c40_39f6_previous_stack_read := previous_stack_read;
     VAR_jci_uxn_opcodes_h_l2895_c40_387e_previous_stack_read := previous_stack_read;
     VAR_jcn2_uxn_opcodes_h_l2927_c40_1ece_previous_stack_read := previous_stack_read;
     VAR_jcn_uxn_opcodes_h_l2926_c40_bf95_previous_stack_read := previous_stack_read;
     VAR_jmp2_uxn_opcodes_h_l2925_c40_8785_previous_stack_read := previous_stack_read;
     VAR_jmp_uxn_opcodes_h_l2924_c40_7981_previous_stack_read := previous_stack_read;
     VAR_jsr2_uxn_opcodes_h_l2929_c40_3cec_previous_stack_read := previous_stack_read;
     VAR_jsr_uxn_opcodes_h_l2928_c40_2309_previous_stack_read := previous_stack_read;
     VAR_lda2_uxn_opcodes_h_l2941_c40_f02f_previous_stack_read := previous_stack_read;
     VAR_lda_uxn_opcodes_h_l2940_c40_31f9_previous_stack_read := previous_stack_read;
     VAR_ldr2_uxn_opcodes_h_l2937_c40_0c30_previous_stack_read := previous_stack_read;
     VAR_ldr_uxn_opcodes_h_l2936_c40_2b0f_previous_stack_read := previous_stack_read;
     VAR_ldz2_uxn_opcodes_h_l2933_c40_ec39_previous_stack_read := previous_stack_read;
     VAR_ldz_uxn_opcodes_h_l2932_c40_beec_previous_stack_read := previous_stack_read;
     VAR_lth2_uxn_opcodes_h_l2923_c40_a691_previous_stack_read := previous_stack_read;
     VAR_lth_uxn_opcodes_h_l2922_c40_6c45_previous_stack_read := previous_stack_read;
     VAR_mul2_uxn_opcodes_h_l2953_c40_7687_previous_stack_read := previous_stack_read;
     VAR_mul_uxn_opcodes_h_l2952_c40_6bd6_previous_stack_read := previous_stack_read;
     VAR_neq2_uxn_opcodes_h_l2919_c40_d31b_previous_stack_read := previous_stack_read;
     VAR_neq_uxn_opcodes_h_l2918_c40_ab73_previous_stack_read := previous_stack_read;
     VAR_nip2_uxn_opcodes_h_l2907_c40_5b74_previous_stack_read := previous_stack_read;
     VAR_nip_uxn_opcodes_h_l2906_c40_5cae_previous_stack_read := previous_stack_read;
     VAR_ora2_uxn_opcodes_h_l2959_c40_4dc9_previous_stack_read := previous_stack_read;
     VAR_ora_uxn_opcodes_h_l2958_c40_1e2f_previous_stack_read := previous_stack_read;
     VAR_ovr2_uxn_opcodes_h_l2915_c40_e347_previous_stack_read := previous_stack_read;
     VAR_ovr_uxn_opcodes_h_l2914_c40_15b0_previous_stack_read := previous_stack_read;
     VAR_rot2_uxn_opcodes_h_l2911_c40_0152_previous_stack_read := previous_stack_read;
     VAR_rot_uxn_opcodes_h_l2910_c40_0769_previous_stack_read := previous_stack_read;
     VAR_sft2_uxn_opcodes_h_l2963_c40_e322_previous_stack_read := previous_stack_read;
     VAR_sft_uxn_opcodes_h_l2962_c40_433f_previous_stack_read := previous_stack_read;
     VAR_sta2_uxn_opcodes_h_l2943_c40_d176_previous_stack_read := previous_stack_read;
     VAR_sta_uxn_opcodes_h_l2942_c40_b0d7_previous_stack_read := previous_stack_read;
     VAR_sth2_uxn_opcodes_h_l2931_c40_60f7_previous_stack_read := previous_stack_read;
     VAR_sth_uxn_opcodes_h_l2930_c40_5228_previous_stack_read := previous_stack_read;
     VAR_str1_uxn_opcodes_h_l2938_c40_6062_previous_stack_read := previous_stack_read;
     VAR_str2_uxn_opcodes_h_l2939_c40_e81d_previous_stack_read := previous_stack_read;
     VAR_stz2_uxn_opcodes_h_l2935_c40_1781_previous_stack_read := previous_stack_read;
     VAR_stz_uxn_opcodes_h_l2934_c40_08b5_previous_stack_read := previous_stack_read;
     VAR_sub2_uxn_opcodes_h_l2951_c40_3c50_previous_stack_read := previous_stack_read;
     VAR_sub_uxn_opcodes_h_l2950_c40_110d_previous_stack_read := previous_stack_read;
     VAR_swp2_uxn_opcodes_h_l2909_c40_cd1b_previous_stack_read := previous_stack_read;
     VAR_swp_uxn_opcodes_h_l2908_c40_65fd_previous_stack_read := previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2972_c3_94ea_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l2969_c2_16f7_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2970_c3_bef6_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l2969_c2_16f7_iffalse := sp1;
     -- brk[uxn_opcodes_h_l2894_c48_80b6] LATENCY=0
     -- Inputs
     brk_uxn_opcodes_h_l2894_c48_80b6_phase <= VAR_brk_uxn_opcodes_h_l2894_c48_80b6_phase;
     -- Outputs
     VAR_brk_uxn_opcodes_h_l2894_c48_80b6_return_output := brk_uxn_opcodes_h_l2894_c48_80b6_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2966_c17_557e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2966_c17_557e_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2966_c17_557e_left;
     BIN_OP_AND_uxn_opcodes_h_l2966_c17_557e_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2966_c17_557e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2966_c17_557e_return_output := BIN_OP_AND_uxn_opcodes_h_l2966_c17_557e_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2886_c14_fbdf] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2886_c14_fbdf_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2886_c14_fbdf_left;
     BIN_OP_AND_uxn_opcodes_h_l2886_c14_fbdf_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2886_c14_fbdf_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2886_c14_fbdf_return_output := BIN_OP_AND_uxn_opcodes_h_l2886_c14_fbdf_return_output;

     -- Submodule level 1
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2887_c14_ab01_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2886_c14_fbdf_return_output;
     VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l2886_c14_fbdf_return_output;
     REG_VAR_ins_a_3f := VAR_BIN_OP_AND_uxn_opcodes_h_l2886_c14_fbdf_return_output;
     VAR_CONST_SR_6_uxn_opcodes_h_l2966_c17_6eba_x := VAR_BIN_OP_AND_uxn_opcodes_h_l2966_c17_557e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_iftrue := VAR_brk_uxn_opcodes_h_l2894_c48_80b6_return_output;
     -- CONST_SR_6[uxn_opcodes_h_l2966_c17_6eba] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_opcodes_h_l2966_c17_6eba_x <= VAR_CONST_SR_6_uxn_opcodes_h_l2966_c17_6eba_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_opcodes_h_l2966_c17_6eba_return_output := CONST_SR_6_uxn_opcodes_h_l2966_c17_6eba_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l2887_c14_ab01] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2887_c14_ab01_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2887_c14_ab01_left;
     BIN_OP_XOR_uxn_opcodes_h_l2887_c14_ab01_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2887_c14_ab01_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2887_c14_ab01_return_output := BIN_OP_XOR_uxn_opcodes_h_l2887_c14_ab01_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l2887_c14_243d_left := VAR_BIN_OP_XOR_uxn_opcodes_h_l2887_c14_ab01_return_output;
     VAR_stack_index_uxn_opcodes_h_l2966_c2_8f51 := resize(VAR_CONST_SR_6_uxn_opcodes_h_l2966_c17_6eba_return_output, 1);
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2967_c2_f89b_left := VAR_stack_index_uxn_opcodes_h_l2966_c2_8f51;
     -- BIN_OP_OR[uxn_opcodes_h_l2887_c14_243d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2887_c14_243d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2887_c14_243d_left;
     BIN_OP_OR_uxn_opcodes_h_l2887_c14_243d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2887_c14_243d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2887_c14_243d_return_output := BIN_OP_OR_uxn_opcodes_h_l2887_c14_243d_return_output;

     -- Submodule level 3
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2887_c14_86a8_expr := VAR_BIN_OP_OR_uxn_opcodes_h_l2887_c14_243d_return_output;
     -- UNARY_OP_NOT[uxn_opcodes_h_l2887_c14_86a8] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l2887_c14_86a8_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l2887_c14_86a8_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2887_c14_86a8_return_output := UNARY_OP_NOT_uxn_opcodes_h_l2887_c14_86a8_return_output;

     -- Submodule level 4
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2887_c14_f0ba_left := VAR_UNARY_OP_NOT_uxn_opcodes_h_l2887_c14_86a8_return_output;
     -- BIN_OP_NEQ[uxn_opcodes_h_l2887_c14_f0ba] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_opcodes_h_l2887_c14_f0ba_left <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2887_c14_f0ba_left;
     BIN_OP_NEQ_uxn_opcodes_h_l2887_c14_f0ba_right <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2887_c14_f0ba_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2887_c14_f0ba_return_output := BIN_OP_NEQ_uxn_opcodes_h_l2887_c14_f0ba_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_opcodes_h_l2887_c14_92de_cond := VAR_BIN_OP_NEQ_uxn_opcodes_h_l2887_c14_f0ba_return_output;
     -- MUX[uxn_opcodes_h_l2887_c14_92de] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2887_c14_92de_cond <= VAR_MUX_uxn_opcodes_h_l2887_c14_92de_cond;
     MUX_uxn_opcodes_h_l2887_c14_92de_iftrue <= VAR_MUX_uxn_opcodes_h_l2887_c14_92de_iftrue;
     MUX_uxn_opcodes_h_l2887_c14_92de_iffalse <= VAR_MUX_uxn_opcodes_h_l2887_c14_92de_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2887_c14_92de_return_output := MUX_uxn_opcodes_h_l2887_c14_92de_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_cond := VAR_MUX_uxn_opcodes_h_l2887_c14_92de_return_output;
     REG_VAR_is_imm := VAR_MUX_uxn_opcodes_h_l2887_c14_92de_return_output;
     -- MUX[uxn_opcodes_h_l2888_c8_3cba] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2888_c8_3cba_cond <= VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_cond;
     MUX_uxn_opcodes_h_l2888_c8_3cba_iftrue <= VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_iftrue;
     MUX_uxn_opcodes_h_l2888_c8_3cba_iffalse <= VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output := MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;

     -- Submodule level 7
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c6_9135_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3307_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_d934_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_728f_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_42f5_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6ef1_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_2277_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_9184_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_34a9_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2d46_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_bc4d_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d3f6_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ac3b_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_d7c5_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_625a_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_1ad1_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b359_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_5b26_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3d0d_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e050_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_c146_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9f05_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_5f3c_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d97f_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_707f_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_071c_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_93b4_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_5811_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3054_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2dfe_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1871_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_ca16_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_8cff_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_2a0f_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_ae7d_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2fcc_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_53c8_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_2f04_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2cbf_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_b567_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_d1e8_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_e3d9_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_a20b_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1e6f_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_30c6_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_4c39_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_626d_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_19fc_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_d3c6_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_e47d_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_d52d_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_0be9_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_941b_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_cd1f_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_e832_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_67ec_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_2aa2_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_671c_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_108f_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_f31b_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_0077_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_1253_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_0997_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_87d0_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2958_c11_e66f_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_5f9d_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_af73_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2961_c11_8a0c_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_4b7a_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_1fc0_left := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     REG_VAR_opc := VAR_MUX_uxn_opcodes_h_l2888_c8_3cba_return_output;
     -- BIN_OP_EQ[uxn_opcodes_h_l2949_c11_67ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2949_c11_67ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_67ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l2949_c11_67ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_67ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_67ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l2949_c11_67ec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_e050] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e050_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e050_left;
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e050_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e050_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e050_return_output := BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e050_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2945_c11_0be9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2945_c11_0be9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_0be9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2945_c11_0be9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_0be9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_0be9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2945_c11_0be9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2955_c11_1253] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2955_c11_1253_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_1253_left;
     BIN_OP_EQ_uxn_opcodes_h_l2955_c11_1253_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_1253_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_1253_return_output := BIN_OP_EQ_uxn_opcodes_h_l2955_c11_1253_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2952_c11_108f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2952_c11_108f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_108f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2952_c11_108f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_108f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_108f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2952_c11_108f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_6ef1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6ef1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6ef1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6ef1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6ef1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6ef1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6ef1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_53c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_53c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_53c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_53c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_53c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_53c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2930_c11_53c8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_d934] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_d934_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_d934_left;
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_d934_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_d934_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_d934_return_output := BIN_OP_EQ_uxn_opcodes_h_l2896_c11_d934_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_9f05] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9f05_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9f05_left;
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9f05_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9f05_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9f05_return_output := BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9f05_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2961_c11_8a0c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2961_c11_8a0c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2961_c11_8a0c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2961_c11_8a0c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2961_c11_8a0c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2961_c11_8a0c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2961_c11_8a0c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2953_c11_f31b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2953_c11_f31b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_f31b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2953_c11_f31b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_f31b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_f31b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2953_c11_f31b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2941_c11_19fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2941_c11_19fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_19fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2941_c11_19fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_19fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_19fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2941_c11_19fc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_1871] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1871_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1871_left;
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1871_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1871_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1871_return_output := BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1871_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2946_c11_941b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2946_c11_941b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_941b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2946_c11_941b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_941b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_941b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2946_c11_941b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_3307] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3307_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3307_left;
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3307_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3307_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3307_return_output := BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3307_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2957_c11_87d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2957_c11_87d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_87d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2957_c11_87d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_87d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_87d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2957_c11_87d0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_9184] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_9184_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_9184_left;
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_9184_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_9184_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_9184_return_output := BIN_OP_EQ_uxn_opcodes_h_l2901_c11_9184_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2898_c11_42f5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2898_c11_42f5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_42f5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2898_c11_42f5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_42f5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_42f5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2898_c11_42f5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_ac3b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ac3b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ac3b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ac3b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ac3b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ac3b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ac3b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_e3d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_e3d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_e3d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_e3d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_e3d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_e3d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2935_c11_e3d9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2960_c11_af73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2960_c11_af73_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_af73_left;
     BIN_OP_EQ_uxn_opcodes_h_l2960_c11_af73_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_af73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_af73_return_output := BIN_OP_EQ_uxn_opcodes_h_l2960_c11_af73_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2951_c11_671c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2951_c11_671c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_671c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2951_c11_671c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_671c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_671c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2951_c11_671c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_2dfe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2dfe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2dfe_left;
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2dfe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2dfe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2dfe_return_output := BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2dfe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_8cff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_8cff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_8cff_left;
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_8cff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_8cff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_8cff_return_output := BIN_OP_EQ_uxn_opcodes_h_l2926_c11_8cff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_30c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_30c6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_30c6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_30c6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_30c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_30c6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2938_c11_30c6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_5f3c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_5f3c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_5f3c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_5f3c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_5f3c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_5f3c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2916_c11_5f3c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_d7c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_d7c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_d7c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_d7c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_d7c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_d7c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2907_c11_d7c5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_34a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_34a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_34a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_34a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_34a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_34a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2902_c11_34a9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2959_c11_5f9d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2959_c11_5f9d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_5f9d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2959_c11_5f9d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_5f9d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_5f9d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2959_c11_5f9d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_1ad1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_1ad1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_1ad1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_1ad1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_1ad1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_1ad1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2909_c11_1ad1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2958_c11_e66f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2958_c11_e66f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2958_c11_e66f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2958_c11_e66f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2958_c11_e66f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2958_c11_e66f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2958_c11_e66f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_071c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_071c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_071c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_071c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_071c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_071c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2919_c11_071c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_5b26] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_5b26_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_5b26_left;
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_5b26_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_5b26_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_5b26_return_output := BIN_OP_EQ_uxn_opcodes_h_l2911_c11_5b26_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_2fcc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2fcc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2fcc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2fcc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2fcc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2fcc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2fcc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_ca16] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_ca16_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_ca16_left;
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_ca16_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_ca16_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_ca16_return_output := BIN_OP_EQ_uxn_opcodes_h_l2925_c11_ca16_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2950_c11_2aa2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2950_c11_2aa2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_2aa2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2950_c11_2aa2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_2aa2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_2aa2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2950_c11_2aa2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_5811] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_5811_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_5811_left;
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_5811_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_5811_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_5811_return_output := BIN_OP_EQ_uxn_opcodes_h_l2921_c11_5811_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_b567] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_b567_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_b567_left;
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_b567_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_b567_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_b567_return_output := BIN_OP_EQ_uxn_opcodes_h_l2933_c11_b567_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2947_c11_cd1f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2947_c11_cd1f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_cd1f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2947_c11_cd1f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_cd1f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_cd1f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2947_c11_cd1f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_d1e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_d1e8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_d1e8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_d1e8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_d1e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_d1e8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2934_c11_d1e8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_d3f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d3f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d3f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d3f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d3f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d3f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d3f6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_4c39] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_4c39_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_4c39_left;
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_4c39_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_4c39_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_4c39_return_output := BIN_OP_EQ_uxn_opcodes_h_l2939_c11_4c39_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2944_c11_d52d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2944_c11_d52d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_d52d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2944_c11_d52d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_d52d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_d52d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2944_c11_d52d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_93b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_93b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_93b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_93b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_93b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_93b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2920_c11_93b4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_625a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_625a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_625a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_625a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_625a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_625a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2908_c11_625a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2954_c11_0077] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2954_c11_0077_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_0077_left;
     BIN_OP_EQ_uxn_opcodes_h_l2954_c11_0077_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_0077_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_0077_return_output := BIN_OP_EQ_uxn_opcodes_h_l2954_c11_0077_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_1e6f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1e6f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1e6f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1e6f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1e6f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1e6f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1e6f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_2d46] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2d46_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2d46_left;
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2d46_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2d46_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2d46_return_output := BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2d46_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2963_c11_1fc0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2963_c11_1fc0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_1fc0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2963_c11_1fc0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_1fc0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_1fc0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2963_c11_1fc0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2942_c11_d3c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2942_c11_d3c6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_d3c6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2942_c11_d3c6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_d3c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_d3c6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2942_c11_d3c6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_a20b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_a20b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_a20b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_a20b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_a20b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_a20b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2936_c11_a20b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2943_c11_e47d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2943_c11_e47d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_e47d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2943_c11_e47d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_e47d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_e47d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2943_c11_e47d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2894_c6_9135] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2894_c6_9135_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c6_9135_left;
     BIN_OP_EQ_uxn_opcodes_h_l2894_c6_9135_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c6_9135_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c6_9135_return_output := BIN_OP_EQ_uxn_opcodes_h_l2894_c6_9135_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_3054] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3054_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3054_left;
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3054_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3054_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3054_return_output := BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3054_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_707f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_707f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_707f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_707f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_707f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_707f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2918_c11_707f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_626d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_626d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_626d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_626d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_626d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_626d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2940_c11_626d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_728f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_728f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_728f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_728f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_728f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_728f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2897_c11_728f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_ae7d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_ae7d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_ae7d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_ae7d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_ae7d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_ae7d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2928_c11_ae7d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_2a0f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_2a0f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_2a0f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_2a0f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_2a0f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_2a0f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2927_c11_2a0f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_bc4d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_bc4d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_bc4d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_bc4d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_bc4d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_bc4d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2904_c11_bc4d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_2cbf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2cbf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2cbf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2cbf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2cbf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2cbf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2cbf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_2277] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_2277_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_2277_left;
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_2277_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_2277_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_2277_return_output := BIN_OP_EQ_uxn_opcodes_h_l2900_c11_2277_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_2f04] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_2f04_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_2f04_left;
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_2f04_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_2f04_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_2f04_return_output := BIN_OP_EQ_uxn_opcodes_h_l2931_c11_2f04_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_c146] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_c146_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_c146_left;
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_c146_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_c146_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_c146_return_output := BIN_OP_EQ_uxn_opcodes_h_l2914_c11_c146_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2956_c11_0997] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2956_c11_0997_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_0997_left;
     BIN_OP_EQ_uxn_opcodes_h_l2956_c11_0997_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_0997_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_0997_return_output := BIN_OP_EQ_uxn_opcodes_h_l2956_c11_0997_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2962_c11_4b7a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2962_c11_4b7a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_4b7a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2962_c11_4b7a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_4b7a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_4b7a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2962_c11_4b7a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_b359] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b359_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b359_left;
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b359_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b359_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b359_return_output := BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b359_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_d97f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d97f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d97f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d97f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d97f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d97f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d97f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2948_c11_e832] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2948_c11_e832_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_e832_left;
     BIN_OP_EQ_uxn_opcodes_h_l2948_c11_e832_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_e832_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_e832_return_output := BIN_OP_EQ_uxn_opcodes_h_l2948_c11_e832_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_3d0d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3d0d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3d0d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3d0d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3d0d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3d0d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3d0d_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c6_9135_return_output;
     VAR_is_wait_MUX_uxn_opcodes_h_l2894_c2_fcbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c6_9135_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c6_9135_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_8c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3307_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_84c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3307_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_9bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_3307_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_f181_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_d934_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_b2f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_d934_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_8c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_d934_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c2ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_728f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b586_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_728f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_f181_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_728f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_42f5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_bc05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_42f5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_c2ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_42f5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a9ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6ef1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_942a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6ef1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_9048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6ef1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_15dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_2277_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a842_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_2277_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_a9ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_2277_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_84ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_9184_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_8dba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_9184_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_15dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_9184_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_ae00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_34a9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_b4f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_34a9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_84ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_34a9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dbf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2d46_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_113e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2d46_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_ae00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2d46_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_bc4d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_369b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_bc4d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_dbf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_bc4d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e572_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d3f6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_f3e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d3f6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_c240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d3f6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_90ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ac3b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_e895_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ac3b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_e572_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ac3b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f462_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_d7c5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_d39f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_d7c5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_90ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_d7c5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_71b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_625a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e20f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_625a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_f462_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_625a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_78e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_1ad1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0af4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_1ad1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_71b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_1ad1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_809c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b359_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_8667_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b359_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_78e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b359_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0bda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_5b26_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_df92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_5b26_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_809c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_5b26_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3c3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3d0d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_a78f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3d0d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_0bda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3d0d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_b249_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e050_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_5027_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e050_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_3c3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e050_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_c146_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_cfdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_c146_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_b249_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_c146_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c7b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9f05_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_4cf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9f05_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_5684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9f05_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_9fc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_5f3c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_eeb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_5f3c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_c7b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_5f3c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_079c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d97f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f445_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d97f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_9fc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d97f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_725b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_707f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ba3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_707f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_079c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_707f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_071c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4d9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_071c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_725b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_071c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_9d27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_93b4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e5df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_93b4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_3041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_93b4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_569e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_5811_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f1ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_5811_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_9d27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_5811_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_063c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3054_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_5bef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3054_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_569e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3054_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_60be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2dfe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_c400_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2dfe_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_063c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2dfe_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_f293_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1871_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2cff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1871_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_60be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1871_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_4fc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_ca16_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_a50b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_ca16_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_f293_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_ca16_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c235_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_8cff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_87ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_8cff_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_4fc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_8cff_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9354_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_2a0f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_736f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_2a0f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_c235_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_2a0f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_b078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_ae7d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_8900_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_ae7d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_9354_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_ae7d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_25ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2fcc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_e997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2fcc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_b078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2fcc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ff89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_53c8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5d01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_53c8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_25ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_53c8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_110a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_2f04_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8432_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_2f04_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_ff89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_2f04_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_e3af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2cbf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_5bce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2cbf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_110a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2cbf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_ed89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_b567_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_61fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_b567_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_e3af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_b567_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_14a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_d1e8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_9b2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_d1e8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_ed89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_d1e8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_9da5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_e3d9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_8799_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_e3d9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_14a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_e3d9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_14fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_a20b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ba7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_a20b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_9da5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_a20b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_3f46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1e6f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_770f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1e6f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_14fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1e6f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_1cd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_30c6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_3aff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_30c6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_3f46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_30c6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_1276_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_4c39_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5ea3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_4c39_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_1cd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_4c39_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_cba6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_626d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_e729_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_626d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_1276_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_626d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_713f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_19fc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_630d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_19fc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_cba6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_19fc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_bb37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_d3c6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b8d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_d3c6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_713f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_d3c6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_bdf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_e47d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_91d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_e47d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_bb37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_e47d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_553d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_d52d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_adea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_d52d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_bdf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_d52d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_756f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_0be9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_996d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_0be9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_553d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_0be9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_040a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_941b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_780d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_941b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_756f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_941b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_d000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_cd1f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_0a9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_cd1f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_040a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_cd1f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a058_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_e832_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_e5bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_e832_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_d000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_e832_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_67ec_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_4553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_67ec_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_a058_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_67ec_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_72bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_2aa2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_4f89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_2aa2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_5574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_2aa2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_5789_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_671c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_1855_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_671c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_72bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_671c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_87ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_108f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_108f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_5789_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_108f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e7a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_f31b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_3d98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_f31b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_87ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_f31b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ad12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_0077_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_0df9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_0077_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_e7a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_0077_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_1de8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_1253_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_8426_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_1253_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_ad12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_1253_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_f15f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_0997_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_6f14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_0997_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_1de8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_0997_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_60b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_87d0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_5d8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_87d0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_f15f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_87d0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_8868_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2958_c11_e66f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_6dde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2958_c11_e66f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_60b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2958_c11_e66f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_f9db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_5f9d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_cdf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_5f9d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2959_c7_8868_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_5f9d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_23fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_af73_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_eb8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_af73_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2960_c7_f9db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_af73_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_8da2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2961_c11_8a0c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_c132_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2961_c11_8a0c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2961_c7_23fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2961_c11_8a0c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_f0c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_4b7a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_ab8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_4b7a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2962_c7_8da2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_4b7a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_81f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_1fc0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2963_c7_f0c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_1fc0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c7_9bf1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9bf1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9bf1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9bf1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9bf1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9bf1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9bf1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9bf1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9bf1_return_output;

     -- is_wait_MUX[uxn_opcodes_h_l2894_c2_fcbf] LATENCY=0
     -- Inputs
     is_wait_MUX_uxn_opcodes_h_l2894_c2_fcbf_cond <= VAR_is_wait_MUX_uxn_opcodes_h_l2894_c2_fcbf_cond;
     is_wait_MUX_uxn_opcodes_h_l2894_c2_fcbf_iftrue <= VAR_is_wait_MUX_uxn_opcodes_h_l2894_c2_fcbf_iftrue;
     is_wait_MUX_uxn_opcodes_h_l2894_c2_fcbf_iffalse <= VAR_is_wait_MUX_uxn_opcodes_h_l2894_c2_fcbf_iffalse;
     -- Outputs
     VAR_is_wait_MUX_uxn_opcodes_h_l2894_c2_fcbf_return_output := is_wait_MUX_uxn_opcodes_h_l2894_c2_fcbf_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_8c27_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9bf1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_84c1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9bf1_return_output;
     REG_VAR_is_wait := VAR_is_wait_MUX_uxn_opcodes_h_l2894_c2_fcbf_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c7_8c27] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_8c27_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_8c27_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_8c27_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_8c27_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_8c27_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_8c27_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_8c27_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_8c27_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c1_84c1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_84c1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_84c1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_84c1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_84c1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_84c1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_84c1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_84c1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_84c1_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_f181_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_8c27_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_b2f8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_8c27_return_output;
     VAR_jci_uxn_opcodes_h_l2895_c40_387e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_84c1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c7_f181] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_f181_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_f181_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_f181_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_f181_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_f181_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_f181_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_f181_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_f181_return_output;

     -- jci[uxn_opcodes_h_l2895_c40_387e] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l2895_c40_387e_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l2895_c40_387e_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l2895_c40_387e_phase <= VAR_jci_uxn_opcodes_h_l2895_c40_387e_phase;
     jci_uxn_opcodes_h_l2895_c40_387e_pc <= VAR_jci_uxn_opcodes_h_l2895_c40_387e_pc;
     jci_uxn_opcodes_h_l2895_c40_387e_previous_stack_read <= VAR_jci_uxn_opcodes_h_l2895_c40_387e_previous_stack_read;
     jci_uxn_opcodes_h_l2895_c40_387e_previous_ram_read <= VAR_jci_uxn_opcodes_h_l2895_c40_387e_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l2895_c40_387e_return_output := jci_uxn_opcodes_h_l2895_c40_387e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c1_b2f8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_b2f8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_b2f8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_b2f8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_b2f8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_b2f8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_b2f8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_b2f8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_b2f8_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c2ab_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_f181_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b586_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_f181_return_output;
     VAR_jmi_uxn_opcodes_h_l2896_c40_df61_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_b2f8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_9bf1_iftrue := VAR_jci_uxn_opcodes_h_l2895_c40_387e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c7_c2ab] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c2ab_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c2ab_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c2ab_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c2ab_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c2ab_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c2ab_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c2ab_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c2ab_return_output;

     -- jmi[uxn_opcodes_h_l2896_c40_df61] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l2896_c40_df61_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l2896_c40_df61_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l2896_c40_df61_phase <= VAR_jmi_uxn_opcodes_h_l2896_c40_df61_phase;
     jmi_uxn_opcodes_h_l2896_c40_df61_pc <= VAR_jmi_uxn_opcodes_h_l2896_c40_df61_pc;
     jmi_uxn_opcodes_h_l2896_c40_df61_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l2896_c40_df61_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l2896_c40_df61_return_output := jmi_uxn_opcodes_h_l2896_c40_df61_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c1_b586] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b586_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b586_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b586_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b586_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b586_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b586_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b586_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b586_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9048_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c2ab_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_bc05_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c2ab_return_output;
     VAR_jsi_uxn_opcodes_h_l2897_c40_c6e2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b586_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_8c27_iftrue := VAR_jmi_uxn_opcodes_h_l2896_c40_df61_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_9048] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9048_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9048_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9048_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9048_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9048_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9048_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9048_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9048_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_bc05] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_bc05_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_bc05_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_bc05_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_bc05_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_bc05_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_bc05_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_bc05_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_bc05_return_output;

     -- jsi[uxn_opcodes_h_l2897_c40_c6e2] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l2897_c40_c6e2_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l2897_c40_c6e2_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l2897_c40_c6e2_phase <= VAR_jsi_uxn_opcodes_h_l2897_c40_c6e2_phase;
     jsi_uxn_opcodes_h_l2897_c40_c6e2_pc <= VAR_jsi_uxn_opcodes_h_l2897_c40_c6e2_pc;
     jsi_uxn_opcodes_h_l2897_c40_c6e2_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l2897_c40_c6e2_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l2897_c40_c6e2_return_output := jsi_uxn_opcodes_h_l2897_c40_c6e2_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a9ef_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9048_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_942a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9048_return_output;
     VAR_lit_uxn_opcodes_h_l2898_c40_1897_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_bc05_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_f181_iftrue := VAR_jsi_uxn_opcodes_h_l2897_c40_c6e2_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_942a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_942a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_942a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_942a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_942a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_942a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_942a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_942a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_942a_return_output;

     -- lit[uxn_opcodes_h_l2898_c40_1897] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2898_c40_1897_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2898_c40_1897_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2898_c40_1897_phase <= VAR_lit_uxn_opcodes_h_l2898_c40_1897_phase;
     lit_uxn_opcodes_h_l2898_c40_1897_pc <= VAR_lit_uxn_opcodes_h_l2898_c40_1897_pc;
     lit_uxn_opcodes_h_l2898_c40_1897_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2898_c40_1897_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2898_c40_1897_return_output := lit_uxn_opcodes_h_l2898_c40_1897_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_a9ef] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a9ef_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a9ef_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a9ef_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a9ef_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a9ef_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a9ef_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a9ef_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a9ef_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_15dc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a9ef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a842_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a9ef_return_output;
     VAR_lit2_uxn_opcodes_h_l2899_c40_f5bd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_942a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_c2ab_iftrue := VAR_lit_uxn_opcodes_h_l2898_c40_1897_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_a842] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a842_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a842_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a842_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a842_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a842_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a842_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a842_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a842_return_output;

     -- lit2[uxn_opcodes_h_l2899_c40_f5bd] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2899_c40_f5bd_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2899_c40_f5bd_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2899_c40_f5bd_phase <= VAR_lit2_uxn_opcodes_h_l2899_c40_f5bd_phase;
     lit2_uxn_opcodes_h_l2899_c40_f5bd_pc <= VAR_lit2_uxn_opcodes_h_l2899_c40_f5bd_pc;
     lit2_uxn_opcodes_h_l2899_c40_f5bd_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2899_c40_f5bd_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2899_c40_f5bd_return_output := lit2_uxn_opcodes_h_l2899_c40_f5bd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_15dc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_15dc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_15dc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_15dc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_15dc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_15dc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_15dc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_15dc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_15dc_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_84ad_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_15dc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_8dba_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_15dc_return_output;
     VAR_lit_uxn_opcodes_h_l2900_c40_37bb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a842_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_9048_iftrue := VAR_lit2_uxn_opcodes_h_l2899_c40_f5bd_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_8dba] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_8dba_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_8dba_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_8dba_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_8dba_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_8dba_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_8dba_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_8dba_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_8dba_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_84ad] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_84ad_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_84ad_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_84ad_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_84ad_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_84ad_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_84ad_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_84ad_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_84ad_return_output;

     -- lit[uxn_opcodes_h_l2900_c40_37bb] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2900_c40_37bb_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2900_c40_37bb_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2900_c40_37bb_phase <= VAR_lit_uxn_opcodes_h_l2900_c40_37bb_phase;
     lit_uxn_opcodes_h_l2900_c40_37bb_pc <= VAR_lit_uxn_opcodes_h_l2900_c40_37bb_pc;
     lit_uxn_opcodes_h_l2900_c40_37bb_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2900_c40_37bb_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2900_c40_37bb_return_output := lit_uxn_opcodes_h_l2900_c40_37bb_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_ae00_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_84ad_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_b4f2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_84ad_return_output;
     VAR_lit2_uxn_opcodes_h_l2901_c40_9bbc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_8dba_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_a9ef_iftrue := VAR_lit_uxn_opcodes_h_l2900_c40_37bb_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_ae00] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_ae00_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_ae00_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_ae00_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_ae00_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_ae00_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_ae00_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_ae00_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_ae00_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_b4f2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_b4f2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_b4f2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_b4f2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_b4f2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_b4f2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_b4f2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_b4f2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_b4f2_return_output;

     -- lit2[uxn_opcodes_h_l2901_c40_9bbc] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2901_c40_9bbc_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2901_c40_9bbc_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2901_c40_9bbc_phase <= VAR_lit2_uxn_opcodes_h_l2901_c40_9bbc_phase;
     lit2_uxn_opcodes_h_l2901_c40_9bbc_pc <= VAR_lit2_uxn_opcodes_h_l2901_c40_9bbc_pc;
     lit2_uxn_opcodes_h_l2901_c40_9bbc_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2901_c40_9bbc_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2901_c40_9bbc_return_output := lit2_uxn_opcodes_h_l2901_c40_9bbc_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dbf4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_ae00_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_113e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_ae00_return_output;
     VAR_inc_uxn_opcodes_h_l2902_c40_39f6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_b4f2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_15dc_iftrue := VAR_lit2_uxn_opcodes_h_l2901_c40_9bbc_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_dbf4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dbf4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dbf4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dbf4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dbf4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dbf4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dbf4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dbf4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dbf4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_113e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_113e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_113e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_113e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_113e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_113e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_113e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_113e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_113e_return_output;

     -- inc[uxn_opcodes_h_l2902_c40_39f6] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l2902_c40_39f6_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l2902_c40_39f6_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l2902_c40_39f6_phase <= VAR_inc_uxn_opcodes_h_l2902_c40_39f6_phase;
     inc_uxn_opcodes_h_l2902_c40_39f6_ins <= VAR_inc_uxn_opcodes_h_l2902_c40_39f6_ins;
     inc_uxn_opcodes_h_l2902_c40_39f6_previous_stack_read <= VAR_inc_uxn_opcodes_h_l2902_c40_39f6_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l2902_c40_39f6_return_output := inc_uxn_opcodes_h_l2902_c40_39f6_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c240_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dbf4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_369b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dbf4_return_output;
     VAR_inc2_uxn_opcodes_h_l2903_c40_37be_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_113e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_84ad_iftrue := VAR_inc_uxn_opcodes_h_l2902_c40_39f6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_c240] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c240_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c240_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c240_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c240_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c240_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c240_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c240_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c240_return_output;

     -- inc2[uxn_opcodes_h_l2903_c40_37be] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l2903_c40_37be_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l2903_c40_37be_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l2903_c40_37be_phase <= VAR_inc2_uxn_opcodes_h_l2903_c40_37be_phase;
     inc2_uxn_opcodes_h_l2903_c40_37be_ins <= VAR_inc2_uxn_opcodes_h_l2903_c40_37be_ins;
     inc2_uxn_opcodes_h_l2903_c40_37be_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l2903_c40_37be_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l2903_c40_37be_return_output := inc2_uxn_opcodes_h_l2903_c40_37be_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_369b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_369b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_369b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_369b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_369b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_369b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_369b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_369b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_369b_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e572_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c240_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_f3e4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c240_return_output;
     VAR_pop_uxn_opcodes_h_l2904_c40_f75b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_369b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_ae00_iftrue := VAR_inc2_uxn_opcodes_h_l2903_c40_37be_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_f3e4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_f3e4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_f3e4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_f3e4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_f3e4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_f3e4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_f3e4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_f3e4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_f3e4_return_output;

     -- pop[uxn_opcodes_h_l2904_c40_f75b] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l2904_c40_f75b_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l2904_c40_f75b_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l2904_c40_f75b_phase <= VAR_pop_uxn_opcodes_h_l2904_c40_f75b_phase;
     pop_uxn_opcodes_h_l2904_c40_f75b_ins <= VAR_pop_uxn_opcodes_h_l2904_c40_f75b_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l2904_c40_f75b_return_output := pop_uxn_opcodes_h_l2904_c40_f75b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_e572] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e572_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e572_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e572_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e572_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e572_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e572_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e572_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e572_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_90ba_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e572_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_e895_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e572_return_output;
     VAR_pop2_uxn_opcodes_h_l2905_c40_d926_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_f3e4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_dbf4_iftrue := VAR_pop_uxn_opcodes_h_l2904_c40_f75b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_e895] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_e895_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_e895_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_e895_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_e895_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_e895_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_e895_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_e895_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_e895_return_output;

     -- pop2[uxn_opcodes_h_l2905_c40_d926] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l2905_c40_d926_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l2905_c40_d926_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l2905_c40_d926_phase <= VAR_pop2_uxn_opcodes_h_l2905_c40_d926_phase;
     pop2_uxn_opcodes_h_l2905_c40_d926_ins <= VAR_pop2_uxn_opcodes_h_l2905_c40_d926_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l2905_c40_d926_return_output := pop2_uxn_opcodes_h_l2905_c40_d926_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_90ba] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_90ba_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_90ba_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_90ba_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_90ba_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_90ba_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_90ba_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_90ba_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_90ba_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f462_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_90ba_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_d39f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_90ba_return_output;
     VAR_nip_uxn_opcodes_h_l2906_c40_5cae_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_e895_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_c240_iftrue := VAR_pop2_uxn_opcodes_h_l2905_c40_d926_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_d39f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_d39f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_d39f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_d39f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_d39f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_d39f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_d39f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_d39f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_d39f_return_output;

     -- nip[uxn_opcodes_h_l2906_c40_5cae] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l2906_c40_5cae_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l2906_c40_5cae_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l2906_c40_5cae_phase <= VAR_nip_uxn_opcodes_h_l2906_c40_5cae_phase;
     nip_uxn_opcodes_h_l2906_c40_5cae_ins <= VAR_nip_uxn_opcodes_h_l2906_c40_5cae_ins;
     nip_uxn_opcodes_h_l2906_c40_5cae_previous_stack_read <= VAR_nip_uxn_opcodes_h_l2906_c40_5cae_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l2906_c40_5cae_return_output := nip_uxn_opcodes_h_l2906_c40_5cae_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_f462] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f462_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f462_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f462_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f462_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f462_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f462_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f462_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f462_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_71b2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f462_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e20f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f462_return_output;
     VAR_nip2_uxn_opcodes_h_l2907_c40_5b74_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_d39f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_e572_iftrue := VAR_nip_uxn_opcodes_h_l2906_c40_5cae_return_output;
     -- nip2[uxn_opcodes_h_l2907_c40_5b74] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l2907_c40_5b74_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l2907_c40_5b74_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l2907_c40_5b74_phase <= VAR_nip2_uxn_opcodes_h_l2907_c40_5b74_phase;
     nip2_uxn_opcodes_h_l2907_c40_5b74_ins <= VAR_nip2_uxn_opcodes_h_l2907_c40_5b74_ins;
     nip2_uxn_opcodes_h_l2907_c40_5b74_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l2907_c40_5b74_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l2907_c40_5b74_return_output := nip2_uxn_opcodes_h_l2907_c40_5b74_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_e20f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e20f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e20f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e20f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e20f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e20f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e20f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e20f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e20f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_71b2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_71b2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_71b2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_71b2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_71b2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_71b2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_71b2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_71b2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_71b2_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_78e8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_71b2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0af4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_71b2_return_output;
     VAR_swp_uxn_opcodes_h_l2908_c40_65fd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_e20f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_90ba_iftrue := VAR_nip2_uxn_opcodes_h_l2907_c40_5b74_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_0af4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0af4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0af4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0af4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0af4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0af4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0af4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0af4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0af4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_78e8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_78e8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_78e8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_78e8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_78e8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_78e8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_78e8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_78e8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_78e8_return_output;

     -- swp[uxn_opcodes_h_l2908_c40_65fd] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l2908_c40_65fd_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l2908_c40_65fd_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l2908_c40_65fd_phase <= VAR_swp_uxn_opcodes_h_l2908_c40_65fd_phase;
     swp_uxn_opcodes_h_l2908_c40_65fd_ins <= VAR_swp_uxn_opcodes_h_l2908_c40_65fd_ins;
     swp_uxn_opcodes_h_l2908_c40_65fd_previous_stack_read <= VAR_swp_uxn_opcodes_h_l2908_c40_65fd_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l2908_c40_65fd_return_output := swp_uxn_opcodes_h_l2908_c40_65fd_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_809c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_78e8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_8667_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_78e8_return_output;
     VAR_swp2_uxn_opcodes_h_l2909_c40_cd1b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_0af4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_f462_iftrue := VAR_swp_uxn_opcodes_h_l2908_c40_65fd_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_8667] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_8667_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_8667_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_8667_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_8667_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_8667_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_8667_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_8667_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_8667_return_output;

     -- swp2[uxn_opcodes_h_l2909_c40_cd1b] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l2909_c40_cd1b_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l2909_c40_cd1b_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l2909_c40_cd1b_phase <= VAR_swp2_uxn_opcodes_h_l2909_c40_cd1b_phase;
     swp2_uxn_opcodes_h_l2909_c40_cd1b_ins <= VAR_swp2_uxn_opcodes_h_l2909_c40_cd1b_ins;
     swp2_uxn_opcodes_h_l2909_c40_cd1b_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l2909_c40_cd1b_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l2909_c40_cd1b_return_output := swp2_uxn_opcodes_h_l2909_c40_cd1b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_809c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_809c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_809c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_809c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_809c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_809c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_809c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_809c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_809c_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0bda_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_809c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_df92_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_809c_return_output;
     VAR_rot_uxn_opcodes_h_l2910_c40_0769_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_8667_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_71b2_iftrue := VAR_swp2_uxn_opcodes_h_l2909_c40_cd1b_return_output;
     -- rot[uxn_opcodes_h_l2910_c40_0769] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l2910_c40_0769_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l2910_c40_0769_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l2910_c40_0769_phase <= VAR_rot_uxn_opcodes_h_l2910_c40_0769_phase;
     rot_uxn_opcodes_h_l2910_c40_0769_ins <= VAR_rot_uxn_opcodes_h_l2910_c40_0769_ins;
     rot_uxn_opcodes_h_l2910_c40_0769_previous_stack_read <= VAR_rot_uxn_opcodes_h_l2910_c40_0769_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l2910_c40_0769_return_output := rot_uxn_opcodes_h_l2910_c40_0769_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_df92] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_df92_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_df92_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_df92_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_df92_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_df92_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_df92_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_df92_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_df92_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_0bda] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0bda_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0bda_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0bda_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0bda_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0bda_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0bda_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0bda_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0bda_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3c3c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0bda_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_a78f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_0bda_return_output;
     VAR_rot2_uxn_opcodes_h_l2911_c40_0152_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_df92_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_78e8_iftrue := VAR_rot_uxn_opcodes_h_l2910_c40_0769_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_a78f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_a78f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_a78f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_a78f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_a78f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_a78f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_a78f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_a78f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_a78f_return_output;

     -- rot2[uxn_opcodes_h_l2911_c40_0152] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l2911_c40_0152_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l2911_c40_0152_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l2911_c40_0152_phase <= VAR_rot2_uxn_opcodes_h_l2911_c40_0152_phase;
     rot2_uxn_opcodes_h_l2911_c40_0152_ins <= VAR_rot2_uxn_opcodes_h_l2911_c40_0152_ins;
     rot2_uxn_opcodes_h_l2911_c40_0152_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l2911_c40_0152_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l2911_c40_0152_return_output := rot2_uxn_opcodes_h_l2911_c40_0152_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_3c3c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3c3c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3c3c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3c3c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3c3c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3c3c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3c3c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3c3c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3c3c_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_b249_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3c3c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_5027_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_3c3c_return_output;
     VAR_dup_uxn_opcodes_h_l2912_c40_f0d1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_a78f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_809c_iftrue := VAR_rot2_uxn_opcodes_h_l2911_c40_0152_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_b249] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_b249_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_b249_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_b249_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_b249_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_b249_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_b249_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_b249_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_b249_return_output;

     -- dup[uxn_opcodes_h_l2912_c40_f0d1] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l2912_c40_f0d1_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l2912_c40_f0d1_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l2912_c40_f0d1_phase <= VAR_dup_uxn_opcodes_h_l2912_c40_f0d1_phase;
     dup_uxn_opcodes_h_l2912_c40_f0d1_ins <= VAR_dup_uxn_opcodes_h_l2912_c40_f0d1_ins;
     dup_uxn_opcodes_h_l2912_c40_f0d1_previous_stack_read <= VAR_dup_uxn_opcodes_h_l2912_c40_f0d1_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l2912_c40_f0d1_return_output := dup_uxn_opcodes_h_l2912_c40_f0d1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_5027] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_5027_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_5027_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_5027_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_5027_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_5027_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_5027_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_5027_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_5027_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5684_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_b249_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_cfdb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_b249_return_output;
     VAR_dup2_uxn_opcodes_h_l2913_c40_907f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_5027_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_0bda_iftrue := VAR_dup_uxn_opcodes_h_l2912_c40_f0d1_return_output;
     -- dup2[uxn_opcodes_h_l2913_c40_907f] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l2913_c40_907f_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l2913_c40_907f_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l2913_c40_907f_phase <= VAR_dup2_uxn_opcodes_h_l2913_c40_907f_phase;
     dup2_uxn_opcodes_h_l2913_c40_907f_ins <= VAR_dup2_uxn_opcodes_h_l2913_c40_907f_ins;
     dup2_uxn_opcodes_h_l2913_c40_907f_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l2913_c40_907f_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l2913_c40_907f_return_output := dup2_uxn_opcodes_h_l2913_c40_907f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_cfdb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_cfdb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_cfdb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_cfdb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_cfdb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_cfdb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_cfdb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_cfdb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_cfdb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_5684] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5684_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5684_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5684_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5684_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5684_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5684_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5684_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5684_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c7b4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5684_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_4cf0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_5684_return_output;
     VAR_ovr_uxn_opcodes_h_l2914_c40_15b0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_cfdb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_3c3c_iftrue := VAR_dup2_uxn_opcodes_h_l2913_c40_907f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_4cf0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_4cf0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_4cf0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_4cf0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_4cf0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_4cf0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_4cf0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_4cf0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_4cf0_return_output;

     -- ovr[uxn_opcodes_h_l2914_c40_15b0] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l2914_c40_15b0_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l2914_c40_15b0_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l2914_c40_15b0_phase <= VAR_ovr_uxn_opcodes_h_l2914_c40_15b0_phase;
     ovr_uxn_opcodes_h_l2914_c40_15b0_ins <= VAR_ovr_uxn_opcodes_h_l2914_c40_15b0_ins;
     ovr_uxn_opcodes_h_l2914_c40_15b0_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l2914_c40_15b0_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l2914_c40_15b0_return_output := ovr_uxn_opcodes_h_l2914_c40_15b0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_c7b4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c7b4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c7b4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c7b4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c7b4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c7b4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c7b4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c7b4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c7b4_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_9fc1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c7b4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_eeb9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c7b4_return_output;
     VAR_ovr2_uxn_opcodes_h_l2915_c40_e347_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_4cf0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_b249_iftrue := VAR_ovr_uxn_opcodes_h_l2914_c40_15b0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_9fc1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_9fc1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_9fc1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_9fc1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_9fc1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_9fc1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_9fc1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_9fc1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_9fc1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_eeb9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_eeb9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_eeb9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_eeb9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_eeb9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_eeb9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_eeb9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_eeb9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_eeb9_return_output;

     -- ovr2[uxn_opcodes_h_l2915_c40_e347] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l2915_c40_e347_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l2915_c40_e347_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l2915_c40_e347_phase <= VAR_ovr2_uxn_opcodes_h_l2915_c40_e347_phase;
     ovr2_uxn_opcodes_h_l2915_c40_e347_ins <= VAR_ovr2_uxn_opcodes_h_l2915_c40_e347_ins;
     ovr2_uxn_opcodes_h_l2915_c40_e347_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l2915_c40_e347_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l2915_c40_e347_return_output := ovr2_uxn_opcodes_h_l2915_c40_e347_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_079c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_9fc1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f445_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_9fc1_return_output;
     VAR_equ_uxn_opcodes_h_l2916_c40_2ca8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_eeb9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_5684_iftrue := VAR_ovr2_uxn_opcodes_h_l2915_c40_e347_return_output;
     -- equ[uxn_opcodes_h_l2916_c40_2ca8] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l2916_c40_2ca8_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l2916_c40_2ca8_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l2916_c40_2ca8_phase <= VAR_equ_uxn_opcodes_h_l2916_c40_2ca8_phase;
     equ_uxn_opcodes_h_l2916_c40_2ca8_ins <= VAR_equ_uxn_opcodes_h_l2916_c40_2ca8_ins;
     equ_uxn_opcodes_h_l2916_c40_2ca8_previous_stack_read <= VAR_equ_uxn_opcodes_h_l2916_c40_2ca8_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l2916_c40_2ca8_return_output := equ_uxn_opcodes_h_l2916_c40_2ca8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_f445] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f445_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f445_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f445_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f445_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f445_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f445_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f445_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f445_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_079c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_079c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_079c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_079c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_079c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_079c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_079c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_079c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_079c_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_725b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_079c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ba3a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_079c_return_output;
     VAR_equ2_uxn_opcodes_h_l2917_c40_7b86_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f445_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_c7b4_iftrue := VAR_equ_uxn_opcodes_h_l2916_c40_2ca8_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_ba3a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ba3a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ba3a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ba3a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ba3a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ba3a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ba3a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ba3a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ba3a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_725b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_725b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_725b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_725b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_725b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_725b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_725b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_725b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_725b_return_output;

     -- equ2[uxn_opcodes_h_l2917_c40_7b86] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l2917_c40_7b86_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l2917_c40_7b86_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l2917_c40_7b86_phase <= VAR_equ2_uxn_opcodes_h_l2917_c40_7b86_phase;
     equ2_uxn_opcodes_h_l2917_c40_7b86_ins <= VAR_equ2_uxn_opcodes_h_l2917_c40_7b86_ins;
     equ2_uxn_opcodes_h_l2917_c40_7b86_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l2917_c40_7b86_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l2917_c40_7b86_return_output := equ2_uxn_opcodes_h_l2917_c40_7b86_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3041_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_725b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4d9d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_725b_return_output;
     VAR_neq_uxn_opcodes_h_l2918_c40_ab73_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ba3a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_9fc1_iftrue := VAR_equ2_uxn_opcodes_h_l2917_c40_7b86_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_3041] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3041_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3041_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3041_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3041_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3041_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3041_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3041_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3041_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_4d9d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4d9d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4d9d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4d9d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4d9d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4d9d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4d9d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4d9d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4d9d_return_output;

     -- neq[uxn_opcodes_h_l2918_c40_ab73] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l2918_c40_ab73_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l2918_c40_ab73_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l2918_c40_ab73_phase <= VAR_neq_uxn_opcodes_h_l2918_c40_ab73_phase;
     neq_uxn_opcodes_h_l2918_c40_ab73_ins <= VAR_neq_uxn_opcodes_h_l2918_c40_ab73_ins;
     neq_uxn_opcodes_h_l2918_c40_ab73_previous_stack_read <= VAR_neq_uxn_opcodes_h_l2918_c40_ab73_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l2918_c40_ab73_return_output := neq_uxn_opcodes_h_l2918_c40_ab73_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_9d27_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3041_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e5df_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3041_return_output;
     VAR_neq2_uxn_opcodes_h_l2919_c40_d31b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4d9d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_079c_iftrue := VAR_neq_uxn_opcodes_h_l2918_c40_ab73_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_e5df] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e5df_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e5df_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e5df_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e5df_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e5df_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e5df_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e5df_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e5df_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_9d27] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_9d27_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_9d27_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_9d27_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_9d27_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_9d27_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_9d27_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_9d27_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_9d27_return_output;

     -- neq2[uxn_opcodes_h_l2919_c40_d31b] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l2919_c40_d31b_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l2919_c40_d31b_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l2919_c40_d31b_phase <= VAR_neq2_uxn_opcodes_h_l2919_c40_d31b_phase;
     neq2_uxn_opcodes_h_l2919_c40_d31b_ins <= VAR_neq2_uxn_opcodes_h_l2919_c40_d31b_ins;
     neq2_uxn_opcodes_h_l2919_c40_d31b_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l2919_c40_d31b_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l2919_c40_d31b_return_output := neq2_uxn_opcodes_h_l2919_c40_d31b_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_569e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_9d27_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f1ec_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_9d27_return_output;
     VAR_gth_uxn_opcodes_h_l2920_c40_29df_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_e5df_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_725b_iftrue := VAR_neq2_uxn_opcodes_h_l2919_c40_d31b_return_output;
     -- gth[uxn_opcodes_h_l2920_c40_29df] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l2920_c40_29df_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l2920_c40_29df_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l2920_c40_29df_phase <= VAR_gth_uxn_opcodes_h_l2920_c40_29df_phase;
     gth_uxn_opcodes_h_l2920_c40_29df_ins <= VAR_gth_uxn_opcodes_h_l2920_c40_29df_ins;
     gth_uxn_opcodes_h_l2920_c40_29df_previous_stack_read <= VAR_gth_uxn_opcodes_h_l2920_c40_29df_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l2920_c40_29df_return_output := gth_uxn_opcodes_h_l2920_c40_29df_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_f1ec] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f1ec_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f1ec_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f1ec_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f1ec_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f1ec_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f1ec_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f1ec_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f1ec_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_569e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_569e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_569e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_569e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_569e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_569e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_569e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_569e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_569e_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_063c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_569e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_5bef_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_569e_return_output;
     VAR_gth2_uxn_opcodes_h_l2921_c40_1b5f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f1ec_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_3041_iftrue := VAR_gth_uxn_opcodes_h_l2920_c40_29df_return_output;
     -- gth2[uxn_opcodes_h_l2921_c40_1b5f] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l2921_c40_1b5f_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l2921_c40_1b5f_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l2921_c40_1b5f_phase <= VAR_gth2_uxn_opcodes_h_l2921_c40_1b5f_phase;
     gth2_uxn_opcodes_h_l2921_c40_1b5f_ins <= VAR_gth2_uxn_opcodes_h_l2921_c40_1b5f_ins;
     gth2_uxn_opcodes_h_l2921_c40_1b5f_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l2921_c40_1b5f_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l2921_c40_1b5f_return_output := gth2_uxn_opcodes_h_l2921_c40_1b5f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_5bef] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_5bef_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_5bef_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_5bef_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_5bef_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_5bef_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_5bef_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_5bef_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_5bef_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_063c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_063c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_063c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_063c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_063c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_063c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_063c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_063c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_063c_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_60be_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_063c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_c400_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_063c_return_output;
     VAR_lth_uxn_opcodes_h_l2922_c40_6c45_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_5bef_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_9d27_iftrue := VAR_gth2_uxn_opcodes_h_l2921_c40_1b5f_return_output;
     -- lth[uxn_opcodes_h_l2922_c40_6c45] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l2922_c40_6c45_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l2922_c40_6c45_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l2922_c40_6c45_phase <= VAR_lth_uxn_opcodes_h_l2922_c40_6c45_phase;
     lth_uxn_opcodes_h_l2922_c40_6c45_ins <= VAR_lth_uxn_opcodes_h_l2922_c40_6c45_ins;
     lth_uxn_opcodes_h_l2922_c40_6c45_previous_stack_read <= VAR_lth_uxn_opcodes_h_l2922_c40_6c45_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l2922_c40_6c45_return_output := lth_uxn_opcodes_h_l2922_c40_6c45_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_60be] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_60be_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_60be_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_60be_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_60be_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_60be_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_60be_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_60be_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_60be_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_c400] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_c400_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_c400_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_c400_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_c400_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_c400_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_c400_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_c400_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_c400_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_f293_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_60be_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2cff_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_60be_return_output;
     VAR_lth2_uxn_opcodes_h_l2923_c40_a691_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_c400_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_569e_iftrue := VAR_lth_uxn_opcodes_h_l2922_c40_6c45_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_f293] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_f293_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_f293_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_f293_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_f293_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_f293_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_f293_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_f293_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_f293_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_2cff] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2cff_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2cff_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2cff_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2cff_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2cff_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2cff_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2cff_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2cff_return_output;

     -- lth2[uxn_opcodes_h_l2923_c40_a691] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l2923_c40_a691_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l2923_c40_a691_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l2923_c40_a691_phase <= VAR_lth2_uxn_opcodes_h_l2923_c40_a691_phase;
     lth2_uxn_opcodes_h_l2923_c40_a691_ins <= VAR_lth2_uxn_opcodes_h_l2923_c40_a691_ins;
     lth2_uxn_opcodes_h_l2923_c40_a691_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l2923_c40_a691_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l2923_c40_a691_return_output := lth2_uxn_opcodes_h_l2923_c40_a691_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_4fc7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_f293_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_a50b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_f293_return_output;
     VAR_jmp_uxn_opcodes_h_l2924_c40_7981_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2cff_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_063c_iftrue := VAR_lth2_uxn_opcodes_h_l2923_c40_a691_return_output;
     -- jmp[uxn_opcodes_h_l2924_c40_7981] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l2924_c40_7981_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l2924_c40_7981_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l2924_c40_7981_phase <= VAR_jmp_uxn_opcodes_h_l2924_c40_7981_phase;
     jmp_uxn_opcodes_h_l2924_c40_7981_ins <= VAR_jmp_uxn_opcodes_h_l2924_c40_7981_ins;
     jmp_uxn_opcodes_h_l2924_c40_7981_pc <= VAR_jmp_uxn_opcodes_h_l2924_c40_7981_pc;
     jmp_uxn_opcodes_h_l2924_c40_7981_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l2924_c40_7981_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l2924_c40_7981_return_output := jmp_uxn_opcodes_h_l2924_c40_7981_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_a50b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_a50b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_a50b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_a50b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_a50b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_a50b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_a50b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_a50b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_a50b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_4fc7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_4fc7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_4fc7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_4fc7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_4fc7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_4fc7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_4fc7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_4fc7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_4fc7_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c235_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_4fc7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_87ff_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_4fc7_return_output;
     VAR_jmp2_uxn_opcodes_h_l2925_c40_8785_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_a50b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_60be_iftrue := VAR_jmp_uxn_opcodes_h_l2924_c40_7981_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_c235] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c235_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c235_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c235_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c235_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c235_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c235_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c235_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c235_return_output;

     -- jmp2[uxn_opcodes_h_l2925_c40_8785] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l2925_c40_8785_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l2925_c40_8785_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l2925_c40_8785_phase <= VAR_jmp2_uxn_opcodes_h_l2925_c40_8785_phase;
     jmp2_uxn_opcodes_h_l2925_c40_8785_ins <= VAR_jmp2_uxn_opcodes_h_l2925_c40_8785_ins;
     jmp2_uxn_opcodes_h_l2925_c40_8785_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l2925_c40_8785_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l2925_c40_8785_return_output := jmp2_uxn_opcodes_h_l2925_c40_8785_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_87ff] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_87ff_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_87ff_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_87ff_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_87ff_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_87ff_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_87ff_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_87ff_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_87ff_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9354_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c235_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_736f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c235_return_output;
     VAR_jcn_uxn_opcodes_h_l2926_c40_bf95_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_87ff_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_f293_iftrue := VAR_jmp2_uxn_opcodes_h_l2925_c40_8785_return_output;
     -- jcn[uxn_opcodes_h_l2926_c40_bf95] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l2926_c40_bf95_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l2926_c40_bf95_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l2926_c40_bf95_phase <= VAR_jcn_uxn_opcodes_h_l2926_c40_bf95_phase;
     jcn_uxn_opcodes_h_l2926_c40_bf95_ins <= VAR_jcn_uxn_opcodes_h_l2926_c40_bf95_ins;
     jcn_uxn_opcodes_h_l2926_c40_bf95_pc <= VAR_jcn_uxn_opcodes_h_l2926_c40_bf95_pc;
     jcn_uxn_opcodes_h_l2926_c40_bf95_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l2926_c40_bf95_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l2926_c40_bf95_return_output := jcn_uxn_opcodes_h_l2926_c40_bf95_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_9354] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9354_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9354_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9354_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9354_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9354_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9354_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9354_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9354_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_736f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_736f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_736f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_736f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_736f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_736f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_736f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_736f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_736f_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_b078_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9354_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_8900_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_9354_return_output;
     VAR_jcn2_uxn_opcodes_h_l2927_c40_1ece_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_736f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_4fc7_iftrue := VAR_jcn_uxn_opcodes_h_l2926_c40_bf95_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_8900] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_8900_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_8900_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_8900_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_8900_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_8900_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_8900_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_8900_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_8900_return_output;

     -- jcn2[uxn_opcodes_h_l2927_c40_1ece] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l2927_c40_1ece_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l2927_c40_1ece_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l2927_c40_1ece_phase <= VAR_jcn2_uxn_opcodes_h_l2927_c40_1ece_phase;
     jcn2_uxn_opcodes_h_l2927_c40_1ece_ins <= VAR_jcn2_uxn_opcodes_h_l2927_c40_1ece_ins;
     jcn2_uxn_opcodes_h_l2927_c40_1ece_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l2927_c40_1ece_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l2927_c40_1ece_return_output := jcn2_uxn_opcodes_h_l2927_c40_1ece_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_b078] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_b078_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_b078_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_b078_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_b078_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_b078_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_b078_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_b078_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_b078_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_25ff_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_b078_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_e997_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_b078_return_output;
     VAR_jsr_uxn_opcodes_h_l2928_c40_2309_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_8900_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_c235_iftrue := VAR_jcn2_uxn_opcodes_h_l2927_c40_1ece_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_e997] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_e997_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_e997_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_e997_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_e997_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_e997_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_e997_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_e997_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_e997_return_output;

     -- jsr[uxn_opcodes_h_l2928_c40_2309] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l2928_c40_2309_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l2928_c40_2309_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l2928_c40_2309_phase <= VAR_jsr_uxn_opcodes_h_l2928_c40_2309_phase;
     jsr_uxn_opcodes_h_l2928_c40_2309_ins <= VAR_jsr_uxn_opcodes_h_l2928_c40_2309_ins;
     jsr_uxn_opcodes_h_l2928_c40_2309_pc <= VAR_jsr_uxn_opcodes_h_l2928_c40_2309_pc;
     jsr_uxn_opcodes_h_l2928_c40_2309_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l2928_c40_2309_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l2928_c40_2309_return_output := jsr_uxn_opcodes_h_l2928_c40_2309_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_25ff] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_25ff_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_25ff_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_25ff_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_25ff_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_25ff_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_25ff_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_25ff_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_25ff_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ff89_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_25ff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5d01_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_25ff_return_output;
     VAR_jsr2_uxn_opcodes_h_l2929_c40_3cec_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_e997_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_9354_iftrue := VAR_jsr_uxn_opcodes_h_l2928_c40_2309_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_ff89] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ff89_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ff89_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ff89_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ff89_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ff89_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ff89_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ff89_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ff89_return_output;

     -- jsr2[uxn_opcodes_h_l2929_c40_3cec] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l2929_c40_3cec_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l2929_c40_3cec_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l2929_c40_3cec_phase <= VAR_jsr2_uxn_opcodes_h_l2929_c40_3cec_phase;
     jsr2_uxn_opcodes_h_l2929_c40_3cec_ins <= VAR_jsr2_uxn_opcodes_h_l2929_c40_3cec_ins;
     jsr2_uxn_opcodes_h_l2929_c40_3cec_pc <= VAR_jsr2_uxn_opcodes_h_l2929_c40_3cec_pc;
     jsr2_uxn_opcodes_h_l2929_c40_3cec_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l2929_c40_3cec_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l2929_c40_3cec_return_output := jsr2_uxn_opcodes_h_l2929_c40_3cec_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_5d01] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5d01_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5d01_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5d01_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5d01_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5d01_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5d01_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5d01_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5d01_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_110a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ff89_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8432_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ff89_return_output;
     VAR_sth_uxn_opcodes_h_l2930_c40_5228_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5d01_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_b078_iftrue := VAR_jsr2_uxn_opcodes_h_l2929_c40_3cec_return_output;
     -- sth[uxn_opcodes_h_l2930_c40_5228] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l2930_c40_5228_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l2930_c40_5228_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l2930_c40_5228_phase <= VAR_sth_uxn_opcodes_h_l2930_c40_5228_phase;
     sth_uxn_opcodes_h_l2930_c40_5228_ins <= VAR_sth_uxn_opcodes_h_l2930_c40_5228_ins;
     sth_uxn_opcodes_h_l2930_c40_5228_previous_stack_read <= VAR_sth_uxn_opcodes_h_l2930_c40_5228_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l2930_c40_5228_return_output := sth_uxn_opcodes_h_l2930_c40_5228_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_8432] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8432_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8432_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8432_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8432_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8432_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8432_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8432_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8432_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_110a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_110a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_110a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_110a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_110a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_110a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_110a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_110a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_110a_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_e3af_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_110a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_5bce_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_110a_return_output;
     VAR_sth2_uxn_opcodes_h_l2931_c40_60f7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8432_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_25ff_iftrue := VAR_sth_uxn_opcodes_h_l2930_c40_5228_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_5bce] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_5bce_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_5bce_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_5bce_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_5bce_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_5bce_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_5bce_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_5bce_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_5bce_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_e3af] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_e3af_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_e3af_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_e3af_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_e3af_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_e3af_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_e3af_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_e3af_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_e3af_return_output;

     -- sth2[uxn_opcodes_h_l2931_c40_60f7] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l2931_c40_60f7_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l2931_c40_60f7_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l2931_c40_60f7_phase <= VAR_sth2_uxn_opcodes_h_l2931_c40_60f7_phase;
     sth2_uxn_opcodes_h_l2931_c40_60f7_ins <= VAR_sth2_uxn_opcodes_h_l2931_c40_60f7_ins;
     sth2_uxn_opcodes_h_l2931_c40_60f7_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l2931_c40_60f7_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l2931_c40_60f7_return_output := sth2_uxn_opcodes_h_l2931_c40_60f7_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_ed89_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_e3af_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_61fc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_e3af_return_output;
     VAR_ldz_uxn_opcodes_h_l2932_c40_beec_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_5bce_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_ff89_iftrue := VAR_sth2_uxn_opcodes_h_l2931_c40_60f7_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_61fc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_61fc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_61fc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_61fc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_61fc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_61fc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_61fc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_61fc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_61fc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_ed89] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_ed89_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_ed89_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_ed89_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_ed89_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_ed89_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_ed89_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_ed89_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_ed89_return_output;

     -- ldz[uxn_opcodes_h_l2932_c40_beec] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l2932_c40_beec_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l2932_c40_beec_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l2932_c40_beec_phase <= VAR_ldz_uxn_opcodes_h_l2932_c40_beec_phase;
     ldz_uxn_opcodes_h_l2932_c40_beec_ins <= VAR_ldz_uxn_opcodes_h_l2932_c40_beec_ins;
     ldz_uxn_opcodes_h_l2932_c40_beec_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l2932_c40_beec_previous_stack_read;
     ldz_uxn_opcodes_h_l2932_c40_beec_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l2932_c40_beec_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l2932_c40_beec_return_output := ldz_uxn_opcodes_h_l2932_c40_beec_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_14a9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_ed89_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_9b2f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_ed89_return_output;
     VAR_ldz2_uxn_opcodes_h_l2933_c40_ec39_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_61fc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_110a_iftrue := VAR_ldz_uxn_opcodes_h_l2932_c40_beec_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_14a9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_14a9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_14a9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_14a9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_14a9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_14a9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_14a9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_14a9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_14a9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_9b2f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_9b2f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_9b2f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_9b2f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_9b2f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_9b2f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_9b2f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_9b2f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_9b2f_return_output;

     -- ldz2[uxn_opcodes_h_l2933_c40_ec39] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l2933_c40_ec39_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l2933_c40_ec39_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l2933_c40_ec39_phase <= VAR_ldz2_uxn_opcodes_h_l2933_c40_ec39_phase;
     ldz2_uxn_opcodes_h_l2933_c40_ec39_ins <= VAR_ldz2_uxn_opcodes_h_l2933_c40_ec39_ins;
     ldz2_uxn_opcodes_h_l2933_c40_ec39_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l2933_c40_ec39_previous_stack_read;
     ldz2_uxn_opcodes_h_l2933_c40_ec39_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l2933_c40_ec39_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l2933_c40_ec39_return_output := ldz2_uxn_opcodes_h_l2933_c40_ec39_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_9da5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_14a9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_8799_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_14a9_return_output;
     VAR_stz_uxn_opcodes_h_l2934_c40_08b5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_9b2f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_e3af_iftrue := VAR_ldz2_uxn_opcodes_h_l2933_c40_ec39_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_9da5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_9da5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_9da5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_9da5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_9da5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_9da5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_9da5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_9da5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_9da5_return_output;

     -- stz[uxn_opcodes_h_l2934_c40_08b5] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l2934_c40_08b5_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l2934_c40_08b5_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l2934_c40_08b5_phase <= VAR_stz_uxn_opcodes_h_l2934_c40_08b5_phase;
     stz_uxn_opcodes_h_l2934_c40_08b5_ins <= VAR_stz_uxn_opcodes_h_l2934_c40_08b5_ins;
     stz_uxn_opcodes_h_l2934_c40_08b5_previous_stack_read <= VAR_stz_uxn_opcodes_h_l2934_c40_08b5_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l2934_c40_08b5_return_output := stz_uxn_opcodes_h_l2934_c40_08b5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_8799] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_8799_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_8799_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_8799_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_8799_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_8799_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_8799_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_8799_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_8799_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_14fe_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_9da5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ba7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_9da5_return_output;
     VAR_stz2_uxn_opcodes_h_l2935_c40_1781_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_8799_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_ed89_iftrue := VAR_stz_uxn_opcodes_h_l2934_c40_08b5_return_output;
     -- stz2[uxn_opcodes_h_l2935_c40_1781] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l2935_c40_1781_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l2935_c40_1781_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l2935_c40_1781_phase <= VAR_stz2_uxn_opcodes_h_l2935_c40_1781_phase;
     stz2_uxn_opcodes_h_l2935_c40_1781_ins <= VAR_stz2_uxn_opcodes_h_l2935_c40_1781_ins;
     stz2_uxn_opcodes_h_l2935_c40_1781_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l2935_c40_1781_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l2935_c40_1781_return_output := stz2_uxn_opcodes_h_l2935_c40_1781_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_14fe] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_14fe_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_14fe_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_14fe_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_14fe_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_14fe_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_14fe_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_14fe_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_14fe_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_3ba7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ba7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ba7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ba7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ba7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ba7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ba7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ba7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ba7_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_3f46_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_14fe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_770f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_14fe_return_output;
     VAR_ldr_uxn_opcodes_h_l2936_c40_2b0f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ba7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_14a9_iftrue := VAR_stz2_uxn_opcodes_h_l2935_c40_1781_return_output;
     -- ldr[uxn_opcodes_h_l2936_c40_2b0f] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l2936_c40_2b0f_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l2936_c40_2b0f_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l2936_c40_2b0f_phase <= VAR_ldr_uxn_opcodes_h_l2936_c40_2b0f_phase;
     ldr_uxn_opcodes_h_l2936_c40_2b0f_ins <= VAR_ldr_uxn_opcodes_h_l2936_c40_2b0f_ins;
     ldr_uxn_opcodes_h_l2936_c40_2b0f_pc <= VAR_ldr_uxn_opcodes_h_l2936_c40_2b0f_pc;
     ldr_uxn_opcodes_h_l2936_c40_2b0f_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l2936_c40_2b0f_previous_stack_read;
     ldr_uxn_opcodes_h_l2936_c40_2b0f_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l2936_c40_2b0f_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l2936_c40_2b0f_return_output := ldr_uxn_opcodes_h_l2936_c40_2b0f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_770f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_770f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_770f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_770f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_770f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_770f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_770f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_770f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_770f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_3f46] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_3f46_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_3f46_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_3f46_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_3f46_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_3f46_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_3f46_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_3f46_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_3f46_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_1cd0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_3f46_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_3aff_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_3f46_return_output;
     VAR_ldr2_uxn_opcodes_h_l2937_c40_0c30_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_770f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_9da5_iftrue := VAR_ldr_uxn_opcodes_h_l2936_c40_2b0f_return_output;
     -- ldr2[uxn_opcodes_h_l2937_c40_0c30] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l2937_c40_0c30_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l2937_c40_0c30_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l2937_c40_0c30_phase <= VAR_ldr2_uxn_opcodes_h_l2937_c40_0c30_phase;
     ldr2_uxn_opcodes_h_l2937_c40_0c30_ins <= VAR_ldr2_uxn_opcodes_h_l2937_c40_0c30_ins;
     ldr2_uxn_opcodes_h_l2937_c40_0c30_pc <= VAR_ldr2_uxn_opcodes_h_l2937_c40_0c30_pc;
     ldr2_uxn_opcodes_h_l2937_c40_0c30_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l2937_c40_0c30_previous_stack_read;
     ldr2_uxn_opcodes_h_l2937_c40_0c30_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l2937_c40_0c30_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l2937_c40_0c30_return_output := ldr2_uxn_opcodes_h_l2937_c40_0c30_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_1cd0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_1cd0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_1cd0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_1cd0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_1cd0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_1cd0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_1cd0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_1cd0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_1cd0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_3aff] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_3aff_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_3aff_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_3aff_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_3aff_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_3aff_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_3aff_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_3aff_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_3aff_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_1276_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_1cd0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5ea3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_1cd0_return_output;
     VAR_str1_uxn_opcodes_h_l2938_c40_6062_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_3aff_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_14fe_iftrue := VAR_ldr2_uxn_opcodes_h_l2937_c40_0c30_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_5ea3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5ea3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5ea3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5ea3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5ea3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5ea3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5ea3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5ea3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5ea3_return_output;

     -- str1[uxn_opcodes_h_l2938_c40_6062] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l2938_c40_6062_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l2938_c40_6062_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l2938_c40_6062_phase <= VAR_str1_uxn_opcodes_h_l2938_c40_6062_phase;
     str1_uxn_opcodes_h_l2938_c40_6062_ins <= VAR_str1_uxn_opcodes_h_l2938_c40_6062_ins;
     str1_uxn_opcodes_h_l2938_c40_6062_pc <= VAR_str1_uxn_opcodes_h_l2938_c40_6062_pc;
     str1_uxn_opcodes_h_l2938_c40_6062_previous_stack_read <= VAR_str1_uxn_opcodes_h_l2938_c40_6062_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l2938_c40_6062_return_output := str1_uxn_opcodes_h_l2938_c40_6062_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_1276] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_1276_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_1276_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_1276_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_1276_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_1276_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_1276_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_1276_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_1276_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_cba6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_1276_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_e729_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_1276_return_output;
     VAR_str2_uxn_opcodes_h_l2939_c40_e81d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5ea3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_3f46_iftrue := VAR_str1_uxn_opcodes_h_l2938_c40_6062_return_output;
     -- str2[uxn_opcodes_h_l2939_c40_e81d] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l2939_c40_e81d_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l2939_c40_e81d_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l2939_c40_e81d_phase <= VAR_str2_uxn_opcodes_h_l2939_c40_e81d_phase;
     str2_uxn_opcodes_h_l2939_c40_e81d_ins <= VAR_str2_uxn_opcodes_h_l2939_c40_e81d_ins;
     str2_uxn_opcodes_h_l2939_c40_e81d_pc <= VAR_str2_uxn_opcodes_h_l2939_c40_e81d_pc;
     str2_uxn_opcodes_h_l2939_c40_e81d_previous_stack_read <= VAR_str2_uxn_opcodes_h_l2939_c40_e81d_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l2939_c40_e81d_return_output := str2_uxn_opcodes_h_l2939_c40_e81d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_e729] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_e729_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_e729_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_e729_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_e729_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_e729_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_e729_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_e729_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_e729_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c7_cba6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_cba6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_cba6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_cba6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_cba6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_cba6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_cba6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_cba6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_cba6_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_713f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_cba6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_630d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_cba6_return_output;
     VAR_lda_uxn_opcodes_h_l2940_c40_31f9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_e729_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_1cd0_iftrue := VAR_str2_uxn_opcodes_h_l2939_c40_e81d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2942_c7_713f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_713f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_713f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_713f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_713f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_713f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_713f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_713f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_713f_return_output;

     -- lda[uxn_opcodes_h_l2940_c40_31f9] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l2940_c40_31f9_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l2940_c40_31f9_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l2940_c40_31f9_phase <= VAR_lda_uxn_opcodes_h_l2940_c40_31f9_phase;
     lda_uxn_opcodes_h_l2940_c40_31f9_ins <= VAR_lda_uxn_opcodes_h_l2940_c40_31f9_ins;
     lda_uxn_opcodes_h_l2940_c40_31f9_previous_stack_read <= VAR_lda_uxn_opcodes_h_l2940_c40_31f9_previous_stack_read;
     lda_uxn_opcodes_h_l2940_c40_31f9_previous_ram_read <= VAR_lda_uxn_opcodes_h_l2940_c40_31f9_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l2940_c40_31f9_return_output := lda_uxn_opcodes_h_l2940_c40_31f9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c1_630d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_630d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_630d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_630d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_630d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_630d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_630d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_630d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_630d_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_bb37_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_713f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b8d2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_713f_return_output;
     VAR_lda2_uxn_opcodes_h_l2941_c40_f02f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_630d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_1276_iftrue := VAR_lda_uxn_opcodes_h_l2940_c40_31f9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2942_c1_b8d2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b8d2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b8d2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b8d2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b8d2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b8d2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b8d2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b8d2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b8d2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2943_c7_bb37] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_bb37_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_bb37_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_bb37_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_bb37_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_bb37_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_bb37_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_bb37_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_bb37_return_output;

     -- lda2[uxn_opcodes_h_l2941_c40_f02f] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l2941_c40_f02f_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l2941_c40_f02f_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l2941_c40_f02f_phase <= VAR_lda2_uxn_opcodes_h_l2941_c40_f02f_phase;
     lda2_uxn_opcodes_h_l2941_c40_f02f_ins <= VAR_lda2_uxn_opcodes_h_l2941_c40_f02f_ins;
     lda2_uxn_opcodes_h_l2941_c40_f02f_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l2941_c40_f02f_previous_stack_read;
     lda2_uxn_opcodes_h_l2941_c40_f02f_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l2941_c40_f02f_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l2941_c40_f02f_return_output := lda2_uxn_opcodes_h_l2941_c40_f02f_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_bdf4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_bb37_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_91d3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_bb37_return_output;
     VAR_sta_uxn_opcodes_h_l2942_c40_b0d7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b8d2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_cba6_iftrue := VAR_lda2_uxn_opcodes_h_l2941_c40_f02f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2944_c7_bdf4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_bdf4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_bdf4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_bdf4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_bdf4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_bdf4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_bdf4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_bdf4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_bdf4_return_output;

     -- sta[uxn_opcodes_h_l2942_c40_b0d7] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l2942_c40_b0d7_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l2942_c40_b0d7_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l2942_c40_b0d7_phase <= VAR_sta_uxn_opcodes_h_l2942_c40_b0d7_phase;
     sta_uxn_opcodes_h_l2942_c40_b0d7_ins <= VAR_sta_uxn_opcodes_h_l2942_c40_b0d7_ins;
     sta_uxn_opcodes_h_l2942_c40_b0d7_previous_stack_read <= VAR_sta_uxn_opcodes_h_l2942_c40_b0d7_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l2942_c40_b0d7_return_output := sta_uxn_opcodes_h_l2942_c40_b0d7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2943_c1_91d3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_91d3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_91d3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_91d3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_91d3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_91d3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_91d3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_91d3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_91d3_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_553d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_bdf4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_adea_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_bdf4_return_output;
     VAR_sta2_uxn_opcodes_h_l2943_c40_d176_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_91d3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_713f_iftrue := VAR_sta_uxn_opcodes_h_l2942_c40_b0d7_return_output;
     -- sta2[uxn_opcodes_h_l2943_c40_d176] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l2943_c40_d176_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l2943_c40_d176_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l2943_c40_d176_phase <= VAR_sta2_uxn_opcodes_h_l2943_c40_d176_phase;
     sta2_uxn_opcodes_h_l2943_c40_d176_ins <= VAR_sta2_uxn_opcodes_h_l2943_c40_d176_ins;
     sta2_uxn_opcodes_h_l2943_c40_d176_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l2943_c40_d176_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l2943_c40_d176_return_output := sta2_uxn_opcodes_h_l2943_c40_d176_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2944_c1_adea] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_adea_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_adea_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_adea_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_adea_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_adea_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_adea_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_adea_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_adea_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2945_c7_553d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_553d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_553d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_553d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_553d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_553d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_553d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_553d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_553d_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_756f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_553d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_996d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_553d_return_output;
     VAR_dei_uxn_opcodes_h_l2944_c40_ceb7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_adea_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_bb37_iftrue := VAR_sta2_uxn_opcodes_h_l2943_c40_d176_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2946_c7_756f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_756f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_756f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_756f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_756f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_756f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_756f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_756f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_756f_return_output;

     -- dei[uxn_opcodes_h_l2944_c40_ceb7] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l2944_c40_ceb7_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l2944_c40_ceb7_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l2944_c40_ceb7_phase <= VAR_dei_uxn_opcodes_h_l2944_c40_ceb7_phase;
     dei_uxn_opcodes_h_l2944_c40_ceb7_ins <= VAR_dei_uxn_opcodes_h_l2944_c40_ceb7_ins;
     dei_uxn_opcodes_h_l2944_c40_ceb7_previous_stack_read <= VAR_dei_uxn_opcodes_h_l2944_c40_ceb7_previous_stack_read;
     dei_uxn_opcodes_h_l2944_c40_ceb7_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l2944_c40_ceb7_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l2944_c40_ceb7_return_output := dei_uxn_opcodes_h_l2944_c40_ceb7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2945_c1_996d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_996d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_996d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_996d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_996d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_996d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_996d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_996d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_996d_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_040a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_756f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_780d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_756f_return_output;
     VAR_dei2_uxn_opcodes_h_l2945_c40_67db_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_996d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_bdf4_iftrue := VAR_dei_uxn_opcodes_h_l2944_c40_ceb7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2947_c7_040a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_040a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_040a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_040a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_040a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_040a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_040a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_040a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_040a_return_output;

     -- dei2[uxn_opcodes_h_l2945_c40_67db] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l2945_c40_67db_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l2945_c40_67db_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l2945_c40_67db_phase <= VAR_dei2_uxn_opcodes_h_l2945_c40_67db_phase;
     dei2_uxn_opcodes_h_l2945_c40_67db_ins <= VAR_dei2_uxn_opcodes_h_l2945_c40_67db_ins;
     dei2_uxn_opcodes_h_l2945_c40_67db_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l2945_c40_67db_previous_stack_read;
     dei2_uxn_opcodes_h_l2945_c40_67db_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l2945_c40_67db_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l2945_c40_67db_return_output := dei2_uxn_opcodes_h_l2945_c40_67db_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2946_c1_780d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_780d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_780d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_780d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_780d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_780d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_780d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_780d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_780d_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_d000_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_040a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_0a9e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_040a_return_output;
     VAR_deo_uxn_opcodes_h_l2946_c40_5f8f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_780d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_553d_iftrue := VAR_dei2_uxn_opcodes_h_l2945_c40_67db_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2948_c7_d000] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_d000_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_d000_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_d000_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_d000_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_d000_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_d000_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_d000_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_d000_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2947_c1_0a9e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_0a9e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_0a9e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_0a9e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_0a9e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_0a9e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_0a9e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_0a9e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_0a9e_return_output;

     -- deo[uxn_opcodes_h_l2946_c40_5f8f] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l2946_c40_5f8f_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l2946_c40_5f8f_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l2946_c40_5f8f_phase <= VAR_deo_uxn_opcodes_h_l2946_c40_5f8f_phase;
     deo_uxn_opcodes_h_l2946_c40_5f8f_ins <= VAR_deo_uxn_opcodes_h_l2946_c40_5f8f_ins;
     deo_uxn_opcodes_h_l2946_c40_5f8f_previous_stack_read <= VAR_deo_uxn_opcodes_h_l2946_c40_5f8f_previous_stack_read;
     deo_uxn_opcodes_h_l2946_c40_5f8f_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l2946_c40_5f8f_previous_device_ram_read;
     deo_uxn_opcodes_h_l2946_c40_5f8f_previous_ram_read <= VAR_deo_uxn_opcodes_h_l2946_c40_5f8f_previous_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l2946_c40_5f8f_return_output := deo_uxn_opcodes_h_l2946_c40_5f8f_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a058_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_d000_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_e5bc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_d000_return_output;
     VAR_deo2_uxn_opcodes_h_l2947_c40_c304_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_0a9e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_756f_iftrue := VAR_deo_uxn_opcodes_h_l2946_c40_5f8f_return_output;
     -- deo2[uxn_opcodes_h_l2947_c40_c304] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l2947_c40_c304_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l2947_c40_c304_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l2947_c40_c304_phase <= VAR_deo2_uxn_opcodes_h_l2947_c40_c304_phase;
     deo2_uxn_opcodes_h_l2947_c40_c304_ins <= VAR_deo2_uxn_opcodes_h_l2947_c40_c304_ins;
     deo2_uxn_opcodes_h_l2947_c40_c304_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l2947_c40_c304_previous_stack_read;
     deo2_uxn_opcodes_h_l2947_c40_c304_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l2947_c40_c304_previous_device_ram_read;
     deo2_uxn_opcodes_h_l2947_c40_c304_previous_ram_read <= VAR_deo2_uxn_opcodes_h_l2947_c40_c304_previous_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l2947_c40_c304_return_output := deo2_uxn_opcodes_h_l2947_c40_c304_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2949_c7_a058] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a058_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a058_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a058_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a058_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a058_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a058_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a058_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a058_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2948_c1_e5bc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_e5bc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_e5bc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_e5bc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_e5bc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_e5bc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_e5bc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_e5bc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_e5bc_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5574_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a058_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_4553_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a058_return_output;
     VAR_add_uxn_opcodes_h_l2948_c40_92a0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_e5bc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_040a_iftrue := VAR_deo2_uxn_opcodes_h_l2947_c40_c304_return_output;
     -- add[uxn_opcodes_h_l2948_c40_92a0] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l2948_c40_92a0_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l2948_c40_92a0_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l2948_c40_92a0_phase <= VAR_add_uxn_opcodes_h_l2948_c40_92a0_phase;
     add_uxn_opcodes_h_l2948_c40_92a0_ins <= VAR_add_uxn_opcodes_h_l2948_c40_92a0_ins;
     add_uxn_opcodes_h_l2948_c40_92a0_previous_stack_read <= VAR_add_uxn_opcodes_h_l2948_c40_92a0_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l2948_c40_92a0_return_output := add_uxn_opcodes_h_l2948_c40_92a0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2949_c1_4553] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_4553_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_4553_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_4553_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_4553_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_4553_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_4553_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_4553_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_4553_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2950_c7_5574] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5574_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5574_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5574_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5574_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5574_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5574_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5574_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5574_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_72bf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5574_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_4f89_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_5574_return_output;
     VAR_add2_uxn_opcodes_h_l2949_c40_75dc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_4553_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_d000_iftrue := VAR_add_uxn_opcodes_h_l2948_c40_92a0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2951_c7_72bf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_72bf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_72bf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_72bf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_72bf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_72bf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_72bf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_72bf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_72bf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2950_c1_4f89] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_4f89_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_4f89_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_4f89_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_4f89_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_4f89_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_4f89_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_4f89_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_4f89_return_output;

     -- add2[uxn_opcodes_h_l2949_c40_75dc] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l2949_c40_75dc_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l2949_c40_75dc_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l2949_c40_75dc_phase <= VAR_add2_uxn_opcodes_h_l2949_c40_75dc_phase;
     add2_uxn_opcodes_h_l2949_c40_75dc_ins <= VAR_add2_uxn_opcodes_h_l2949_c40_75dc_ins;
     add2_uxn_opcodes_h_l2949_c40_75dc_previous_stack_read <= VAR_add2_uxn_opcodes_h_l2949_c40_75dc_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l2949_c40_75dc_return_output := add2_uxn_opcodes_h_l2949_c40_75dc_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_5789_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_72bf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_1855_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_72bf_return_output;
     VAR_sub_uxn_opcodes_h_l2950_c40_110d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_4f89_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_a058_iftrue := VAR_add2_uxn_opcodes_h_l2949_c40_75dc_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2951_c1_1855] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_1855_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_1855_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_1855_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_1855_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_1855_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_1855_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_1855_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_1855_return_output;

     -- sub[uxn_opcodes_h_l2950_c40_110d] LATENCY=0
     -- Clock enable
     sub_uxn_opcodes_h_l2950_c40_110d_CLOCK_ENABLE <= VAR_sub_uxn_opcodes_h_l2950_c40_110d_CLOCK_ENABLE;
     -- Inputs
     sub_uxn_opcodes_h_l2950_c40_110d_phase <= VAR_sub_uxn_opcodes_h_l2950_c40_110d_phase;
     sub_uxn_opcodes_h_l2950_c40_110d_ins <= VAR_sub_uxn_opcodes_h_l2950_c40_110d_ins;
     sub_uxn_opcodes_h_l2950_c40_110d_previous_stack_read <= VAR_sub_uxn_opcodes_h_l2950_c40_110d_previous_stack_read;
     -- Outputs
     VAR_sub_uxn_opcodes_h_l2950_c40_110d_return_output := sub_uxn_opcodes_h_l2950_c40_110d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2952_c7_5789] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_5789_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_5789_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_5789_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_5789_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_5789_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_5789_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_5789_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_5789_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_87ca_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_5789_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4300_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_5789_return_output;
     VAR_sub2_uxn_opcodes_h_l2951_c40_3c50_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_1855_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_5574_iftrue := VAR_sub_uxn_opcodes_h_l2950_c40_110d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2952_c1_4300] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4300_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4300_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4300_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4300_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4300_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4300_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4300_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4300_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2953_c7_87ca] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_87ca_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_87ca_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_87ca_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_87ca_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_87ca_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_87ca_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_87ca_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_87ca_return_output;

     -- sub2[uxn_opcodes_h_l2951_c40_3c50] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l2951_c40_3c50_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l2951_c40_3c50_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l2951_c40_3c50_phase <= VAR_sub2_uxn_opcodes_h_l2951_c40_3c50_phase;
     sub2_uxn_opcodes_h_l2951_c40_3c50_ins <= VAR_sub2_uxn_opcodes_h_l2951_c40_3c50_ins;
     sub2_uxn_opcodes_h_l2951_c40_3c50_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l2951_c40_3c50_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l2951_c40_3c50_return_output := sub2_uxn_opcodes_h_l2951_c40_3c50_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e7a5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_87ca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_3d98_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_87ca_return_output;
     VAR_mul_uxn_opcodes_h_l2952_c40_6bd6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4300_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_72bf_iftrue := VAR_sub2_uxn_opcodes_h_l2951_c40_3c50_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2953_c1_3d98] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_3d98_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_3d98_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_3d98_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_3d98_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_3d98_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_3d98_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_3d98_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_3d98_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2954_c7_e7a5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e7a5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e7a5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e7a5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e7a5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e7a5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e7a5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e7a5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e7a5_return_output;

     -- mul[uxn_opcodes_h_l2952_c40_6bd6] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l2952_c40_6bd6_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l2952_c40_6bd6_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l2952_c40_6bd6_phase <= VAR_mul_uxn_opcodes_h_l2952_c40_6bd6_phase;
     mul_uxn_opcodes_h_l2952_c40_6bd6_ins <= VAR_mul_uxn_opcodes_h_l2952_c40_6bd6_ins;
     mul_uxn_opcodes_h_l2952_c40_6bd6_previous_stack_read <= VAR_mul_uxn_opcodes_h_l2952_c40_6bd6_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l2952_c40_6bd6_return_output := mul_uxn_opcodes_h_l2952_c40_6bd6_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ad12_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e7a5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_0df9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e7a5_return_output;
     VAR_mul2_uxn_opcodes_h_l2953_c40_7687_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_3d98_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_5789_iftrue := VAR_mul_uxn_opcodes_h_l2952_c40_6bd6_return_output;
     -- mul2[uxn_opcodes_h_l2953_c40_7687] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l2953_c40_7687_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l2953_c40_7687_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l2953_c40_7687_phase <= VAR_mul2_uxn_opcodes_h_l2953_c40_7687_phase;
     mul2_uxn_opcodes_h_l2953_c40_7687_ins <= VAR_mul2_uxn_opcodes_h_l2953_c40_7687_ins;
     mul2_uxn_opcodes_h_l2953_c40_7687_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l2953_c40_7687_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l2953_c40_7687_return_output := mul2_uxn_opcodes_h_l2953_c40_7687_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2954_c1_0df9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_0df9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_0df9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_0df9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_0df9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_0df9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_0df9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_0df9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_0df9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2955_c7_ad12] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ad12_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ad12_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ad12_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ad12_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ad12_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ad12_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ad12_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ad12_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_1de8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ad12_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_8426_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_ad12_return_output;
     VAR_div_uxn_opcodes_h_l2954_c40_4707_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_0df9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_87ca_iftrue := VAR_mul2_uxn_opcodes_h_l2953_c40_7687_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2955_c1_8426] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_8426_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_8426_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_8426_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_8426_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_8426_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_8426_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_8426_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_8426_return_output;

     -- div[uxn_opcodes_h_l2954_c40_4707] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l2954_c40_4707_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l2954_c40_4707_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l2954_c40_4707_phase <= VAR_div_uxn_opcodes_h_l2954_c40_4707_phase;
     div_uxn_opcodes_h_l2954_c40_4707_ins <= VAR_div_uxn_opcodes_h_l2954_c40_4707_ins;
     div_uxn_opcodes_h_l2954_c40_4707_previous_stack_read <= VAR_div_uxn_opcodes_h_l2954_c40_4707_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l2954_c40_4707_return_output := div_uxn_opcodes_h_l2954_c40_4707_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2956_c7_1de8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_1de8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_1de8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_1de8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_1de8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_1de8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_1de8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_1de8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_1de8_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_f15f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_1de8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_6f14_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_1de8_return_output;
     VAR_div2_uxn_opcodes_h_l2955_c40_1cb2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_8426_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_e7a5_iftrue := VAR_div_uxn_opcodes_h_l2954_c40_4707_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2957_c7_f15f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_f15f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_f15f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_f15f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_f15f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_f15f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_f15f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_f15f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_f15f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2956_c1_6f14] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_6f14_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_6f14_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_6f14_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_6f14_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_6f14_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_6f14_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_6f14_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_6f14_return_output;

     -- div2[uxn_opcodes_h_l2955_c40_1cb2] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l2955_c40_1cb2_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l2955_c40_1cb2_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l2955_c40_1cb2_phase <= VAR_div2_uxn_opcodes_h_l2955_c40_1cb2_phase;
     div2_uxn_opcodes_h_l2955_c40_1cb2_ins <= VAR_div2_uxn_opcodes_h_l2955_c40_1cb2_ins;
     div2_uxn_opcodes_h_l2955_c40_1cb2_previous_stack_read <= VAR_div2_uxn_opcodes_h_l2955_c40_1cb2_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l2955_c40_1cb2_return_output := div2_uxn_opcodes_h_l2955_c40_1cb2_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_60b8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_f15f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_5d8f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_f15f_return_output;
     VAR_and_uxn_opcodes_h_l2956_c40_b846_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_6f14_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_ad12_iftrue := VAR_div2_uxn_opcodes_h_l2955_c40_1cb2_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2957_c1_5d8f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_5d8f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_5d8f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_5d8f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_5d8f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_5d8f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_5d8f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_5d8f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_5d8f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2958_c7_60b8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_60b8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_60b8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_60b8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_60b8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_60b8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_60b8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_60b8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_60b8_return_output;

     -- and[uxn_opcodes_h_l2956_c40_b846] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l2956_c40_b846_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l2956_c40_b846_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l2956_c40_b846_phase <= VAR_and_uxn_opcodes_h_l2956_c40_b846_phase;
     and_uxn_opcodes_h_l2956_c40_b846_ins <= VAR_and_uxn_opcodes_h_l2956_c40_b846_ins;
     and_uxn_opcodes_h_l2956_c40_b846_previous_stack_read <= VAR_and_uxn_opcodes_h_l2956_c40_b846_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l2956_c40_b846_return_output := and_uxn_opcodes_h_l2956_c40_b846_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_8868_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_60b8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_6dde_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_60b8_return_output;
     VAR_and2_uxn_opcodes_h_l2957_c40_a05a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_5d8f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_1de8_iftrue := VAR_and_uxn_opcodes_h_l2956_c40_b846_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2958_c1_6dde] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_6dde_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_6dde_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_6dde_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_6dde_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_6dde_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_6dde_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_6dde_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_6dde_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2959_c7_8868] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_8868_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_8868_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_8868_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_8868_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_8868_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_8868_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_8868_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_8868_return_output;

     -- and2[uxn_opcodes_h_l2957_c40_a05a] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l2957_c40_a05a_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l2957_c40_a05a_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l2957_c40_a05a_phase <= VAR_and2_uxn_opcodes_h_l2957_c40_a05a_phase;
     and2_uxn_opcodes_h_l2957_c40_a05a_ins <= VAR_and2_uxn_opcodes_h_l2957_c40_a05a_ins;
     and2_uxn_opcodes_h_l2957_c40_a05a_previous_stack_read <= VAR_and2_uxn_opcodes_h_l2957_c40_a05a_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l2957_c40_a05a_return_output := and2_uxn_opcodes_h_l2957_c40_a05a_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_f9db_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_8868_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_cdf7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_8868_return_output;
     VAR_ora_uxn_opcodes_h_l2958_c40_1e2f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_6dde_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_f15f_iftrue := VAR_and2_uxn_opcodes_h_l2957_c40_a05a_return_output;
     -- ora[uxn_opcodes_h_l2958_c40_1e2f] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l2958_c40_1e2f_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l2958_c40_1e2f_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l2958_c40_1e2f_phase <= VAR_ora_uxn_opcodes_h_l2958_c40_1e2f_phase;
     ora_uxn_opcodes_h_l2958_c40_1e2f_ins <= VAR_ora_uxn_opcodes_h_l2958_c40_1e2f_ins;
     ora_uxn_opcodes_h_l2958_c40_1e2f_previous_stack_read <= VAR_ora_uxn_opcodes_h_l2958_c40_1e2f_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l2958_c40_1e2f_return_output := ora_uxn_opcodes_h_l2958_c40_1e2f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2959_c1_cdf7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_cdf7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_cdf7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_cdf7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_cdf7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_cdf7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_cdf7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_cdf7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_cdf7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2960_c7_f9db] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_f9db_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_f9db_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_f9db_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_f9db_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_f9db_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_f9db_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_f9db_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_f9db_return_output;

     -- Submodule level 74
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_23fd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_f9db_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_eb8d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_f9db_return_output;
     VAR_ora2_uxn_opcodes_h_l2959_c40_4dc9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_cdf7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_60b8_iftrue := VAR_ora_uxn_opcodes_h_l2958_c40_1e2f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2961_c7_23fd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_23fd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_23fd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_23fd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_23fd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_23fd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_23fd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_23fd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_23fd_return_output;

     -- ora2[uxn_opcodes_h_l2959_c40_4dc9] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l2959_c40_4dc9_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l2959_c40_4dc9_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l2959_c40_4dc9_phase <= VAR_ora2_uxn_opcodes_h_l2959_c40_4dc9_phase;
     ora2_uxn_opcodes_h_l2959_c40_4dc9_ins <= VAR_ora2_uxn_opcodes_h_l2959_c40_4dc9_ins;
     ora2_uxn_opcodes_h_l2959_c40_4dc9_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l2959_c40_4dc9_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l2959_c40_4dc9_return_output := ora2_uxn_opcodes_h_l2959_c40_4dc9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2960_c1_eb8d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_eb8d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_eb8d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_eb8d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_eb8d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_eb8d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_eb8d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_eb8d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_eb8d_return_output;

     -- Submodule level 75
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_8da2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_23fd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_c132_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_23fd_return_output;
     VAR_eor_uxn_opcodes_h_l2960_c40_0638_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_eb8d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2959_c7_8868_iftrue := VAR_ora2_uxn_opcodes_h_l2959_c40_4dc9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2961_c1_c132] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_c132_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_c132_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_c132_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_c132_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_c132_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_c132_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_c132_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_c132_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2962_c7_8da2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_8da2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_8da2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_8da2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_8da2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_8da2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_8da2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_8da2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_8da2_return_output;

     -- eor[uxn_opcodes_h_l2960_c40_0638] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l2960_c40_0638_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l2960_c40_0638_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l2960_c40_0638_phase <= VAR_eor_uxn_opcodes_h_l2960_c40_0638_phase;
     eor_uxn_opcodes_h_l2960_c40_0638_ins <= VAR_eor_uxn_opcodes_h_l2960_c40_0638_ins;
     eor_uxn_opcodes_h_l2960_c40_0638_previous_stack_read <= VAR_eor_uxn_opcodes_h_l2960_c40_0638_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l2960_c40_0638_return_output := eor_uxn_opcodes_h_l2960_c40_0638_return_output;

     -- Submodule level 76
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_f0c9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_8da2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_ab8e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_8da2_return_output;
     VAR_eor2_uxn_opcodes_h_l2961_c40_8326_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_c132_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2960_c7_f9db_iftrue := VAR_eor_uxn_opcodes_h_l2960_c40_0638_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2963_c7_f0c9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_f0c9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_f0c9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_f0c9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_f0c9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_f0c9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_f0c9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_f0c9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_f0c9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2962_c1_ab8e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_ab8e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_ab8e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_ab8e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_ab8e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_ab8e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_ab8e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_ab8e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_ab8e_return_output;

     -- eor2[uxn_opcodes_h_l2961_c40_8326] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l2961_c40_8326_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l2961_c40_8326_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l2961_c40_8326_phase <= VAR_eor2_uxn_opcodes_h_l2961_c40_8326_phase;
     eor2_uxn_opcodes_h_l2961_c40_8326_ins <= VAR_eor2_uxn_opcodes_h_l2961_c40_8326_ins;
     eor2_uxn_opcodes_h_l2961_c40_8326_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l2961_c40_8326_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l2961_c40_8326_return_output := eor2_uxn_opcodes_h_l2961_c40_8326_return_output;

     -- Submodule level 77
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_81f3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_f0c9_return_output;
     VAR_sft_uxn_opcodes_h_l2962_c40_433f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_ab8e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2961_c7_23fd_iftrue := VAR_eor2_uxn_opcodes_h_l2961_c40_8326_return_output;
     -- sft[uxn_opcodes_h_l2962_c40_433f] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l2962_c40_433f_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l2962_c40_433f_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l2962_c40_433f_phase <= VAR_sft_uxn_opcodes_h_l2962_c40_433f_phase;
     sft_uxn_opcodes_h_l2962_c40_433f_ins <= VAR_sft_uxn_opcodes_h_l2962_c40_433f_ins;
     sft_uxn_opcodes_h_l2962_c40_433f_previous_stack_read <= VAR_sft_uxn_opcodes_h_l2962_c40_433f_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l2962_c40_433f_return_output := sft_uxn_opcodes_h_l2962_c40_433f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2963_c1_81f3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_81f3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_81f3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_81f3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_81f3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_81f3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_81f3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_81f3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_81f3_return_output;

     -- Submodule level 78
     VAR_sft2_uxn_opcodes_h_l2963_c40_e322_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_81f3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2962_c7_8da2_iftrue := VAR_sft_uxn_opcodes_h_l2962_c40_433f_return_output;
     -- sft2[uxn_opcodes_h_l2963_c40_e322] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l2963_c40_e322_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l2963_c40_e322_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l2963_c40_e322_phase <= VAR_sft2_uxn_opcodes_h_l2963_c40_e322_phase;
     sft2_uxn_opcodes_h_l2963_c40_e322_ins <= VAR_sft2_uxn_opcodes_h_l2963_c40_e322_ins;
     sft2_uxn_opcodes_h_l2963_c40_e322_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l2963_c40_e322_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l2963_c40_e322_return_output := sft2_uxn_opcodes_h_l2963_c40_e322_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l2963_c7_f0c9_iftrue := VAR_sft2_uxn_opcodes_h_l2963_c40_e322_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2963_c7_f0c9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2963_c7_f0c9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2963_c7_f0c9_cond;
     opc_result_MUX_uxn_opcodes_h_l2963_c7_f0c9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2963_c7_f0c9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2963_c7_f0c9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2963_c7_f0c9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2963_c7_f0c9_return_output := opc_result_MUX_uxn_opcodes_h_l2963_c7_f0c9_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l2962_c7_8da2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2963_c7_f0c9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2962_c7_8da2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2962_c7_8da2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2962_c7_8da2_cond;
     opc_result_MUX_uxn_opcodes_h_l2962_c7_8da2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2962_c7_8da2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2962_c7_8da2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2962_c7_8da2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2962_c7_8da2_return_output := opc_result_MUX_uxn_opcodes_h_l2962_c7_8da2_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l2961_c7_23fd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2962_c7_8da2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2961_c7_23fd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2961_c7_23fd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2961_c7_23fd_cond;
     opc_result_MUX_uxn_opcodes_h_l2961_c7_23fd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2961_c7_23fd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2961_c7_23fd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2961_c7_23fd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2961_c7_23fd_return_output := opc_result_MUX_uxn_opcodes_h_l2961_c7_23fd_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l2960_c7_f9db_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2961_c7_23fd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2960_c7_f9db] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2960_c7_f9db_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2960_c7_f9db_cond;
     opc_result_MUX_uxn_opcodes_h_l2960_c7_f9db_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2960_c7_f9db_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2960_c7_f9db_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2960_c7_f9db_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2960_c7_f9db_return_output := opc_result_MUX_uxn_opcodes_h_l2960_c7_f9db_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l2959_c7_8868_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2960_c7_f9db_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2959_c7_8868] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2959_c7_8868_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2959_c7_8868_cond;
     opc_result_MUX_uxn_opcodes_h_l2959_c7_8868_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2959_c7_8868_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2959_c7_8868_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2959_c7_8868_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2959_c7_8868_return_output := opc_result_MUX_uxn_opcodes_h_l2959_c7_8868_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_60b8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2959_c7_8868_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2958_c7_60b8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2958_c7_60b8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_60b8_cond;
     opc_result_MUX_uxn_opcodes_h_l2958_c7_60b8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_60b8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2958_c7_60b8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_60b8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_60b8_return_output := opc_result_MUX_uxn_opcodes_h_l2958_c7_60b8_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_f15f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_60b8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2957_c7_f15f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2957_c7_f15f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_f15f_cond;
     opc_result_MUX_uxn_opcodes_h_l2957_c7_f15f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_f15f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2957_c7_f15f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_f15f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_f15f_return_output := opc_result_MUX_uxn_opcodes_h_l2957_c7_f15f_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_1de8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_f15f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2956_c7_1de8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2956_c7_1de8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_1de8_cond;
     opc_result_MUX_uxn_opcodes_h_l2956_c7_1de8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_1de8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2956_c7_1de8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_1de8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_1de8_return_output := opc_result_MUX_uxn_opcodes_h_l2956_c7_1de8_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_ad12_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_1de8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2955_c7_ad12] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2955_c7_ad12_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_ad12_cond;
     opc_result_MUX_uxn_opcodes_h_l2955_c7_ad12_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_ad12_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2955_c7_ad12_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_ad12_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_ad12_return_output := opc_result_MUX_uxn_opcodes_h_l2955_c7_ad12_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_e7a5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_ad12_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2954_c7_e7a5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2954_c7_e7a5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_e7a5_cond;
     opc_result_MUX_uxn_opcodes_h_l2954_c7_e7a5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_e7a5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2954_c7_e7a5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_e7a5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_e7a5_return_output := opc_result_MUX_uxn_opcodes_h_l2954_c7_e7a5_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_87ca_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_e7a5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2953_c7_87ca] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2953_c7_87ca_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_87ca_cond;
     opc_result_MUX_uxn_opcodes_h_l2953_c7_87ca_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_87ca_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2953_c7_87ca_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_87ca_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_87ca_return_output := opc_result_MUX_uxn_opcodes_h_l2953_c7_87ca_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_5789_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_87ca_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2952_c7_5789] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2952_c7_5789_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_5789_cond;
     opc_result_MUX_uxn_opcodes_h_l2952_c7_5789_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_5789_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2952_c7_5789_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_5789_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_5789_return_output := opc_result_MUX_uxn_opcodes_h_l2952_c7_5789_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_72bf_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_5789_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2951_c7_72bf] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2951_c7_72bf_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_72bf_cond;
     opc_result_MUX_uxn_opcodes_h_l2951_c7_72bf_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_72bf_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2951_c7_72bf_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_72bf_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_72bf_return_output := opc_result_MUX_uxn_opcodes_h_l2951_c7_72bf_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_5574_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_72bf_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2950_c7_5574] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2950_c7_5574_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_5574_cond;
     opc_result_MUX_uxn_opcodes_h_l2950_c7_5574_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_5574_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2950_c7_5574_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_5574_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_5574_return_output := opc_result_MUX_uxn_opcodes_h_l2950_c7_5574_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_a058_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_5574_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2949_c7_a058] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2949_c7_a058_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_a058_cond;
     opc_result_MUX_uxn_opcodes_h_l2949_c7_a058_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_a058_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2949_c7_a058_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_a058_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_a058_return_output := opc_result_MUX_uxn_opcodes_h_l2949_c7_a058_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_d000_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_a058_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2948_c7_d000] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2948_c7_d000_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_d000_cond;
     opc_result_MUX_uxn_opcodes_h_l2948_c7_d000_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_d000_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2948_c7_d000_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_d000_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_d000_return_output := opc_result_MUX_uxn_opcodes_h_l2948_c7_d000_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_040a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_d000_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2947_c7_040a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2947_c7_040a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_040a_cond;
     opc_result_MUX_uxn_opcodes_h_l2947_c7_040a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_040a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2947_c7_040a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_040a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_040a_return_output := opc_result_MUX_uxn_opcodes_h_l2947_c7_040a_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_756f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_040a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2946_c7_756f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2946_c7_756f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_756f_cond;
     opc_result_MUX_uxn_opcodes_h_l2946_c7_756f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_756f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2946_c7_756f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_756f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_756f_return_output := opc_result_MUX_uxn_opcodes_h_l2946_c7_756f_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_553d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_756f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2945_c7_553d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2945_c7_553d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_553d_cond;
     opc_result_MUX_uxn_opcodes_h_l2945_c7_553d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_553d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2945_c7_553d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_553d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_553d_return_output := opc_result_MUX_uxn_opcodes_h_l2945_c7_553d_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_bdf4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_553d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2944_c7_bdf4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2944_c7_bdf4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_bdf4_cond;
     opc_result_MUX_uxn_opcodes_h_l2944_c7_bdf4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_bdf4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2944_c7_bdf4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_bdf4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_bdf4_return_output := opc_result_MUX_uxn_opcodes_h_l2944_c7_bdf4_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_bb37_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_bdf4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2943_c7_bb37] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2943_c7_bb37_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_bb37_cond;
     opc_result_MUX_uxn_opcodes_h_l2943_c7_bb37_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_bb37_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2943_c7_bb37_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_bb37_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_bb37_return_output := opc_result_MUX_uxn_opcodes_h_l2943_c7_bb37_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_713f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_bb37_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2942_c7_713f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2942_c7_713f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_713f_cond;
     opc_result_MUX_uxn_opcodes_h_l2942_c7_713f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_713f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2942_c7_713f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_713f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_713f_return_output := opc_result_MUX_uxn_opcodes_h_l2942_c7_713f_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_cba6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_713f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2941_c7_cba6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2941_c7_cba6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_cba6_cond;
     opc_result_MUX_uxn_opcodes_h_l2941_c7_cba6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_cba6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2941_c7_cba6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_cba6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_cba6_return_output := opc_result_MUX_uxn_opcodes_h_l2941_c7_cba6_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_1276_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_cba6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2940_c7_1276] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2940_c7_1276_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_1276_cond;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_1276_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_1276_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_1276_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_1276_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_1276_return_output := opc_result_MUX_uxn_opcodes_h_l2940_c7_1276_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_1cd0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_1276_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2939_c7_1cd0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2939_c7_1cd0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_1cd0_cond;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_1cd0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_1cd0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_1cd0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_1cd0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_1cd0_return_output := opc_result_MUX_uxn_opcodes_h_l2939_c7_1cd0_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_3f46_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_1cd0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2938_c7_3f46] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2938_c7_3f46_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_3f46_cond;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_3f46_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_3f46_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_3f46_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_3f46_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_3f46_return_output := opc_result_MUX_uxn_opcodes_h_l2938_c7_3f46_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_14fe_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_3f46_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2937_c7_14fe] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2937_c7_14fe_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_14fe_cond;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_14fe_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_14fe_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_14fe_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_14fe_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_14fe_return_output := opc_result_MUX_uxn_opcodes_h_l2937_c7_14fe_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_9da5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_14fe_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2936_c7_9da5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2936_c7_9da5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_9da5_cond;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_9da5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_9da5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_9da5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_9da5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_9da5_return_output := opc_result_MUX_uxn_opcodes_h_l2936_c7_9da5_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_14a9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_9da5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2935_c7_14a9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2935_c7_14a9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_14a9_cond;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_14a9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_14a9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_14a9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_14a9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_14a9_return_output := opc_result_MUX_uxn_opcodes_h_l2935_c7_14a9_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_ed89_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_14a9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2934_c7_ed89] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2934_c7_ed89_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_ed89_cond;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_ed89_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_ed89_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_ed89_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_ed89_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_ed89_return_output := opc_result_MUX_uxn_opcodes_h_l2934_c7_ed89_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_e3af_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_ed89_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2933_c7_e3af] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2933_c7_e3af_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_e3af_cond;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_e3af_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_e3af_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_e3af_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_e3af_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_e3af_return_output := opc_result_MUX_uxn_opcodes_h_l2933_c7_e3af_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_110a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_e3af_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2932_c7_110a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2932_c7_110a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_110a_cond;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_110a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_110a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_110a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_110a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_110a_return_output := opc_result_MUX_uxn_opcodes_h_l2932_c7_110a_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_ff89_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_110a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2931_c7_ff89] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2931_c7_ff89_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_ff89_cond;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_ff89_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_ff89_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_ff89_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_ff89_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_ff89_return_output := opc_result_MUX_uxn_opcodes_h_l2931_c7_ff89_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_25ff_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_ff89_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2930_c7_25ff] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2930_c7_25ff_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_25ff_cond;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_25ff_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_25ff_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_25ff_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_25ff_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_25ff_return_output := opc_result_MUX_uxn_opcodes_h_l2930_c7_25ff_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_b078_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_25ff_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2929_c7_b078] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2929_c7_b078_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_b078_cond;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_b078_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_b078_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_b078_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_b078_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_b078_return_output := opc_result_MUX_uxn_opcodes_h_l2929_c7_b078_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_9354_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_b078_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2928_c7_9354] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2928_c7_9354_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_9354_cond;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_9354_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_9354_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_9354_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_9354_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_9354_return_output := opc_result_MUX_uxn_opcodes_h_l2928_c7_9354_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_c235_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_9354_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2927_c7_c235] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2927_c7_c235_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_c235_cond;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_c235_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_c235_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_c235_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_c235_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_c235_return_output := opc_result_MUX_uxn_opcodes_h_l2927_c7_c235_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_4fc7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_c235_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2926_c7_4fc7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2926_c7_4fc7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_4fc7_cond;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_4fc7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_4fc7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_4fc7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_4fc7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_4fc7_return_output := opc_result_MUX_uxn_opcodes_h_l2926_c7_4fc7_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_f293_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_4fc7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2925_c7_f293] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2925_c7_f293_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_f293_cond;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_f293_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_f293_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_f293_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_f293_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_f293_return_output := opc_result_MUX_uxn_opcodes_h_l2925_c7_f293_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_60be_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_f293_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2924_c7_60be] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2924_c7_60be_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_60be_cond;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_60be_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_60be_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_60be_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_60be_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_60be_return_output := opc_result_MUX_uxn_opcodes_h_l2924_c7_60be_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_063c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_60be_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2923_c7_063c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2923_c7_063c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_063c_cond;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_063c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_063c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_063c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_063c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_063c_return_output := opc_result_MUX_uxn_opcodes_h_l2923_c7_063c_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_569e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_063c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2922_c7_569e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2922_c7_569e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_569e_cond;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_569e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_569e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_569e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_569e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_569e_return_output := opc_result_MUX_uxn_opcodes_h_l2922_c7_569e_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_9d27_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_569e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2921_c7_9d27] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2921_c7_9d27_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_9d27_cond;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_9d27_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_9d27_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_9d27_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_9d27_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_9d27_return_output := opc_result_MUX_uxn_opcodes_h_l2921_c7_9d27_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_3041_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_9d27_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2920_c7_3041] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2920_c7_3041_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_3041_cond;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_3041_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_3041_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_3041_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_3041_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_3041_return_output := opc_result_MUX_uxn_opcodes_h_l2920_c7_3041_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_725b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_3041_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2919_c7_725b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2919_c7_725b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_725b_cond;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_725b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_725b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_725b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_725b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_725b_return_output := opc_result_MUX_uxn_opcodes_h_l2919_c7_725b_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_079c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_725b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2918_c7_079c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2918_c7_079c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_079c_cond;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_079c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_079c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_079c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_079c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_079c_return_output := opc_result_MUX_uxn_opcodes_h_l2918_c7_079c_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_9fc1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_079c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2917_c7_9fc1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2917_c7_9fc1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_9fc1_cond;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_9fc1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_9fc1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_9fc1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_9fc1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_9fc1_return_output := opc_result_MUX_uxn_opcodes_h_l2917_c7_9fc1_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_c7b4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_9fc1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2916_c7_c7b4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2916_c7_c7b4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_c7b4_cond;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_c7b4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_c7b4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_c7b4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_c7b4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_c7b4_return_output := opc_result_MUX_uxn_opcodes_h_l2916_c7_c7b4_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_5684_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_c7b4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2915_c7_5684] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2915_c7_5684_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_5684_cond;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_5684_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_5684_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_5684_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_5684_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_5684_return_output := opc_result_MUX_uxn_opcodes_h_l2915_c7_5684_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_b249_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_5684_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2914_c7_b249] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2914_c7_b249_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_b249_cond;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_b249_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_b249_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_b249_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_b249_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_b249_return_output := opc_result_MUX_uxn_opcodes_h_l2914_c7_b249_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_3c3c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_b249_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2913_c7_3c3c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2913_c7_3c3c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_3c3c_cond;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_3c3c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_3c3c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_3c3c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_3c3c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_3c3c_return_output := opc_result_MUX_uxn_opcodes_h_l2913_c7_3c3c_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_0bda_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_3c3c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2912_c7_0bda] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2912_c7_0bda_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_0bda_cond;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_0bda_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_0bda_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_0bda_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_0bda_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_0bda_return_output := opc_result_MUX_uxn_opcodes_h_l2912_c7_0bda_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_809c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_0bda_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2911_c7_809c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2911_c7_809c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_809c_cond;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_809c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_809c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_809c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_809c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_809c_return_output := opc_result_MUX_uxn_opcodes_h_l2911_c7_809c_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_78e8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_809c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2910_c7_78e8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2910_c7_78e8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_78e8_cond;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_78e8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_78e8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_78e8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_78e8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_78e8_return_output := opc_result_MUX_uxn_opcodes_h_l2910_c7_78e8_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_71b2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_78e8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2909_c7_71b2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2909_c7_71b2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_71b2_cond;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_71b2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_71b2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_71b2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_71b2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_71b2_return_output := opc_result_MUX_uxn_opcodes_h_l2909_c7_71b2_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_f462_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_71b2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2908_c7_f462] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2908_c7_f462_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_f462_cond;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_f462_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_f462_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_f462_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_f462_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_f462_return_output := opc_result_MUX_uxn_opcodes_h_l2908_c7_f462_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_90ba_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_f462_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2907_c7_90ba] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2907_c7_90ba_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_90ba_cond;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_90ba_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_90ba_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_90ba_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_90ba_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_90ba_return_output := opc_result_MUX_uxn_opcodes_h_l2907_c7_90ba_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_e572_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_90ba_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2906_c7_e572] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2906_c7_e572_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_e572_cond;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_e572_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_e572_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_e572_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_e572_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_e572_return_output := opc_result_MUX_uxn_opcodes_h_l2906_c7_e572_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_c240_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_e572_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2905_c7_c240] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2905_c7_c240_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_c240_cond;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_c240_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_c240_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_c240_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_c240_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_c240_return_output := opc_result_MUX_uxn_opcodes_h_l2905_c7_c240_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_dbf4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_c240_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2904_c7_dbf4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2904_c7_dbf4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_dbf4_cond;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_dbf4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_dbf4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_dbf4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_dbf4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_dbf4_return_output := opc_result_MUX_uxn_opcodes_h_l2904_c7_dbf4_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_ae00_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_dbf4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2903_c7_ae00] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2903_c7_ae00_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_ae00_cond;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_ae00_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_ae00_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_ae00_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_ae00_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_ae00_return_output := opc_result_MUX_uxn_opcodes_h_l2903_c7_ae00_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_84ad_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_ae00_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2902_c7_84ad] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2902_c7_84ad_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_84ad_cond;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_84ad_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_84ad_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_84ad_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_84ad_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_84ad_return_output := opc_result_MUX_uxn_opcodes_h_l2902_c7_84ad_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_15dc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_84ad_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2901_c7_15dc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2901_c7_15dc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_15dc_cond;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_15dc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_15dc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_15dc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_15dc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_15dc_return_output := opc_result_MUX_uxn_opcodes_h_l2901_c7_15dc_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_a9ef_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_15dc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2900_c7_a9ef] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2900_c7_a9ef_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_a9ef_cond;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_a9ef_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_a9ef_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_a9ef_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_a9ef_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_a9ef_return_output := opc_result_MUX_uxn_opcodes_h_l2900_c7_a9ef_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_9048_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_a9ef_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2899_c7_9048] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2899_c7_9048_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_9048_cond;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_9048_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_9048_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_9048_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_9048_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_9048_return_output := opc_result_MUX_uxn_opcodes_h_l2899_c7_9048_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_c2ab_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_9048_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2898_c7_c2ab] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2898_c7_c2ab_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_c2ab_cond;
     opc_result_MUX_uxn_opcodes_h_l2898_c7_c2ab_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_c2ab_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2898_c7_c2ab_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_c2ab_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_c2ab_return_output := opc_result_MUX_uxn_opcodes_h_l2898_c7_c2ab_return_output;

     -- Submodule level 145
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_f181_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_c2ab_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2897_c7_f181] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2897_c7_f181_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_f181_cond;
     opc_result_MUX_uxn_opcodes_h_l2897_c7_f181_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_f181_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2897_c7_f181_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_f181_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_f181_return_output := opc_result_MUX_uxn_opcodes_h_l2897_c7_f181_return_output;

     -- Submodule level 146
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_8c27_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_f181_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2896_c7_8c27] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2896_c7_8c27_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_8c27_cond;
     opc_result_MUX_uxn_opcodes_h_l2896_c7_8c27_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_8c27_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2896_c7_8c27_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_8c27_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_8c27_return_output := opc_result_MUX_uxn_opcodes_h_l2896_c7_8c27_return_output;

     -- Submodule level 147
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_9bf1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_8c27_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2895_c7_9bf1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2895_c7_9bf1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_9bf1_cond;
     opc_result_MUX_uxn_opcodes_h_l2895_c7_9bf1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_9bf1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2895_c7_9bf1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_9bf1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_9bf1_return_output := opc_result_MUX_uxn_opcodes_h_l2895_c7_9bf1_return_output;

     -- Submodule level 148
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_9bf1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2894_c2_fcbf] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_cond;
     opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_return_output := opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_return_output;

     -- Submodule level 149
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_return_output;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2990_c34_cb20] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2990_c34_cb20_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2980_l2992_DUPLICATE_630a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2980_l2992_DUPLICATE_630a_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_return_output.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2970_l2972_DUPLICATE_06aa LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2970_l2972_DUPLICATE_06aa_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2975_c68_e572] LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2975_c68_e572_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2967_c17_4137] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2967_c17_4137_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2981_c3_7ddf] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2981_c3_7ddf_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_return_output.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l2993_c32_8194] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2993_c32_8194_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_return_output.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d[uxn_opcodes_h_l2985_c39_25fe] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2985_c39_25fe_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_return_output.device_ram_address;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l2988_c30_47ca] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2988_c30_47ca_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2987_c34_7bff] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2987_c34_7bff_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d[uxn_opcodes_h_l2991_c37_4a5b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2991_c37_4a5b_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l2986_c40_ca99] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2986_c40_ca99_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2989_c33_14f7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2989_c33_14f7_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2894_c2_fcbf_return_output.is_ram_write;

     -- Submodule level 150
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2967_c2_f89b_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2967_c17_4137_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2978_c24_9680_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2981_c3_7ddf_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2978_c24_9680_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2980_l2992_DUPLICATE_630a_return_output;
     -- BIN_OP_XOR[uxn_opcodes_h_l2967_c2_f89b] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2967_c2_f89b_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2967_c2_f89b_left;
     BIN_OP_XOR_uxn_opcodes_h_l2967_c2_f89b_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2967_c2_f89b_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2967_c2_f89b_return_output := BIN_OP_XOR_uxn_opcodes_h_l2967_c2_f89b_return_output;

     -- CAST_TO_uint9_t[uxn_opcodes_h_l2975_c58_54f1] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2975_c58_54f1_return_output := CAST_TO_uint9_t_uint4_t(
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2975_c68_e572_return_output);

     -- CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2972_l2970_DUPLICATE_4f85 LATENCY=0
     VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2972_l2970_DUPLICATE_4f85_return_output := CAST_TO_int8_t_int4_t(
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2970_l2972_DUPLICATE_06aa_return_output);

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2995_l2871_DUPLICATE_8637 LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2995_l2871_DUPLICATE_8637_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0(
     VAR_is_wait_MUX_uxn_opcodes_h_l2894_c2_fcbf_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2985_c39_25fe_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2986_c40_ca99_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2987_c34_7bff_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2988_c30_47ca_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2989_c33_14f7_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2990_c34_cb20_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2991_c37_4a5b_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2980_l2992_DUPLICATE_630a_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2993_c32_8194_return_output);

     -- Submodule level 151
     VAR_MUX_uxn_opcodes_h_l2975_c29_eb6a_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2967_c2_f89b_return_output;
     VAR_MUX_uxn_opcodes_h_l2976_c20_1046_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2967_c2_f89b_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2969_c2_16f7_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2967_c2_f89b_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2969_c2_16f7_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2967_c2_f89b_return_output;
     REG_VAR_stack_index := VAR_BIN_OP_XOR_uxn_opcodes_h_l2967_c2_f89b_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2970_c3_bef6_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2972_l2970_DUPLICATE_4f85_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2972_c3_94ea_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2972_l2970_DUPLICATE_4f85_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2975_c19_f9f9_right := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2975_c58_54f1_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2995_l2871_DUPLICATE_8637_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2995_l2871_DUPLICATE_8637_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2972_c3_94ea] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2972_c3_94ea_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2972_c3_94ea_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2972_c3_94ea_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2972_c3_94ea_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2972_c3_94ea_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2972_c3_94ea_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2970_c3_bef6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2970_c3_bef6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2970_c3_bef6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2970_c3_bef6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2970_c3_bef6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2970_c3_bef6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2970_c3_bef6_return_output;

     -- MUX[uxn_opcodes_h_l2976_c20_1046] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2976_c20_1046_cond <= VAR_MUX_uxn_opcodes_h_l2976_c20_1046_cond;
     MUX_uxn_opcodes_h_l2976_c20_1046_iftrue <= VAR_MUX_uxn_opcodes_h_l2976_c20_1046_iftrue;
     MUX_uxn_opcodes_h_l2976_c20_1046_iffalse <= VAR_MUX_uxn_opcodes_h_l2976_c20_1046_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2976_c20_1046_return_output := MUX_uxn_opcodes_h_l2976_c20_1046_return_output;

     -- Submodule level 152
     VAR_sp1_uxn_opcodes_h_l2970_c3_0a5c := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2970_c3_bef6_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l2972_c3_8620 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2972_c3_94ea_return_output)),8);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2976_c2_1210_right := VAR_MUX_uxn_opcodes_h_l2976_c20_1046_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2969_c2_16f7_iffalse := VAR_sp0_uxn_opcodes_h_l2972_c3_8620;
     VAR_sp1_MUX_uxn_opcodes_h_l2969_c2_16f7_iftrue := VAR_sp1_uxn_opcodes_h_l2970_c3_0a5c;
     -- sp1_MUX[uxn_opcodes_h_l2969_c2_16f7] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2969_c2_16f7_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2969_c2_16f7_cond;
     sp1_MUX_uxn_opcodes_h_l2969_c2_16f7_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2969_c2_16f7_iftrue;
     sp1_MUX_uxn_opcodes_h_l2969_c2_16f7_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2969_c2_16f7_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2969_c2_16f7_return_output := sp1_MUX_uxn_opcodes_h_l2969_c2_16f7_return_output;

     -- sp0_MUX[uxn_opcodes_h_l2969_c2_16f7] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2969_c2_16f7_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2969_c2_16f7_cond;
     sp0_MUX_uxn_opcodes_h_l2969_c2_16f7_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2969_c2_16f7_iftrue;
     sp0_MUX_uxn_opcodes_h_l2969_c2_16f7_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2969_c2_16f7_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2969_c2_16f7_return_output := sp0_MUX_uxn_opcodes_h_l2969_c2_16f7_return_output;

     -- Submodule level 153
     VAR_MUX_uxn_opcodes_h_l2975_c29_eb6a_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l2969_c2_16f7_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l2969_c2_16f7_return_output;
     VAR_MUX_uxn_opcodes_h_l2975_c29_eb6a_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2969_c2_16f7_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l2969_c2_16f7_return_output;
     -- MUX[uxn_opcodes_h_l2975_c29_eb6a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2975_c29_eb6a_cond <= VAR_MUX_uxn_opcodes_h_l2975_c29_eb6a_cond;
     MUX_uxn_opcodes_h_l2975_c29_eb6a_iftrue <= VAR_MUX_uxn_opcodes_h_l2975_c29_eb6a_iftrue;
     MUX_uxn_opcodes_h_l2975_c29_eb6a_iffalse <= VAR_MUX_uxn_opcodes_h_l2975_c29_eb6a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2975_c29_eb6a_return_output := MUX_uxn_opcodes_h_l2975_c29_eb6a_return_output;

     -- Submodule level 154
     -- CAST_TO_uint9_t[uxn_opcodes_h_l2975_c19_917b] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2975_c19_917b_return_output := CAST_TO_uint9_t_uint8_t(
     VAR_MUX_uxn_opcodes_h_l2975_c29_eb6a_return_output);

     -- Submodule level 155
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2975_c19_f9f9_left := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2975_c19_917b_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l2975_c19_f9f9] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2975_c19_f9f9_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2975_c19_f9f9_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2975_c19_f9f9_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2975_c19_f9f9_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2975_c19_f9f9_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2975_c19_f9f9_return_output;

     -- Submodule level 156
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2976_c2_1210_left := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2975_c19_f9f9_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2976_c2_1210] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2976_c2_1210_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2976_c2_1210_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2976_c2_1210_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2976_c2_1210_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2976_c2_1210_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2976_c2_1210_return_output;

     -- Submodule level 157
     VAR_stack_address_uxn_opcodes_h_l2976_c2_f498 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2976_c2_1210_return_output, 9);
     REG_VAR_stack_address := VAR_stack_address_uxn_opcodes_h_l2976_c2_f498;
     VAR_stack_ram_update_uxn_opcodes_h_l2978_c24_9680_stack_address := VAR_stack_address_uxn_opcodes_h_l2976_c2_f498;
     -- stack_ram_update[uxn_opcodes_h_l2978_c24_9680] LATENCY=0
     -- Clock enable
     stack_ram_update_uxn_opcodes_h_l2978_c24_9680_CLOCK_ENABLE <= VAR_stack_ram_update_uxn_opcodes_h_l2978_c24_9680_CLOCK_ENABLE;
     -- Inputs
     stack_ram_update_uxn_opcodes_h_l2978_c24_9680_stack_address <= VAR_stack_ram_update_uxn_opcodes_h_l2978_c24_9680_stack_address;
     stack_ram_update_uxn_opcodes_h_l2978_c24_9680_value <= VAR_stack_ram_update_uxn_opcodes_h_l2978_c24_9680_value;
     stack_ram_update_uxn_opcodes_h_l2978_c24_9680_write_enable <= VAR_stack_ram_update_uxn_opcodes_h_l2978_c24_9680_write_enable;
     -- Outputs
     VAR_stack_ram_update_uxn_opcodes_h_l2978_c24_9680_return_output := stack_ram_update_uxn_opcodes_h_l2978_c24_9680_return_output;

     -- Submodule level 158
     REG_VAR_previous_stack_read := VAR_stack_ram_update_uxn_opcodes_h_l2978_c24_9680_return_output;
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
