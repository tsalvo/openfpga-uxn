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
-- Submodules: 384
entity eval_opcode_phased_0CLK_08affe97 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(15 downto 0);
 return_output : out eval_opcode_result_t);
end eval_opcode_phased_0CLK_08affe97;
architecture arch of eval_opcode_phased_0CLK_08affe97 is
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
signal previous_stack_read : unsigned(15 downto 0) := to_unsigned(0, 16);
signal opc_result : opcode_result_t := (
is_pc_updated => to_unsigned(0, 1),
is_stack_index_flipped => to_unsigned(0, 1),
is_sp_shift => to_unsigned(0, 1),
sp_relative_shift => to_signed(0, 4),
is_stack_operation_16bit => to_unsigned(0, 1),
is_stack_write => to_unsigned(0, 1),
stack_address_sp_offset => to_unsigned(0, 4),
is_ram_write => to_unsigned(0, 1),
is_device_ram_write => to_unsigned(0, 1),
is_device_ram_16bit => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
vram_address => to_unsigned(0, 24),
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
vram_address => to_unsigned(0, 24),
is_device_ram_write => to_unsigned(0, 1),
is_device_ram_16bit => to_unsigned(0, 1),
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
signal REG_COMB_previous_stack_read : unsigned(15 downto 0);
signal REG_COMB_opc_result : opcode_result_t;
signal REG_COMB_opc_eval_result : eval_opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_AND[uxn_opcodes_h_l2530_c14_cbfa]
signal BIN_OP_AND_uxn_opcodes_h_l2530_c14_cbfa_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2530_c14_cbfa_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2530_c14_cbfa_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2531_c14_8511]
signal BIN_OP_XOR_uxn_opcodes_h_l2531_c14_8511_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2531_c14_8511_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2531_c14_8511_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2531_c14_1762]
signal BIN_OP_OR_uxn_opcodes_h_l2531_c14_1762_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2531_c14_1762_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2531_c14_1762_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l2531_c14_5ff0]
signal UNARY_OP_NOT_uxn_opcodes_h_l2531_c14_5ff0_expr : unsigned(7 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l2531_c14_5ff0_return_output : unsigned(7 downto 0);

-- BIN_OP_NEQ[uxn_opcodes_h_l2531_c14_9a48]
signal BIN_OP_NEQ_uxn_opcodes_h_l2531_c14_9a48_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2531_c14_9a48_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2531_c14_9a48_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2531_c14_30cb]
signal MUX_uxn_opcodes_h_l2531_c14_30cb_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2531_c14_30cb_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2531_c14_30cb_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2531_c14_30cb_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2532_c8_3899]
signal MUX_uxn_opcodes_h_l2532_c8_3899_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2532_c8_3899_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2532_c8_3899_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2532_c8_3899_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2538_c6_c949]
signal BIN_OP_EQ_uxn_opcodes_h_l2538_c6_c949_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2538_c6_c949_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2538_c6_c949_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2539_c7_cbdf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c7_cbdf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c7_cbdf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c7_cbdf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c7_cbdf_return_output : unsigned(0 downto 0);

-- is_wait_MUX[uxn_opcodes_h_l2538_c2_5792]
signal is_wait_MUX_uxn_opcodes_h_l2538_c2_5792_cond : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2538_c2_5792_iftrue : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2538_c2_5792_iffalse : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2538_c2_5792_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2538_c2_5792]
signal opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2539_c11_164b]
signal BIN_OP_EQ_uxn_opcodes_h_l2539_c11_164b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2539_c11_164b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2539_c11_164b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2539_c1_ba06]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_ba06_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_ba06_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_ba06_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_ba06_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2540_c7_72b2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c7_72b2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c7_72b2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c7_72b2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c7_72b2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2539_c7_cbdf]
signal opc_result_MUX_uxn_opcodes_h_l2539_c7_cbdf_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2539_c7_cbdf_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2539_c7_cbdf_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2539_c7_cbdf_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l2539_c40_2c85]
signal jci_uxn_opcodes_h_l2539_c40_2c85_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l2539_c40_2c85_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2539_c40_2c85_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l2539_c40_2c85_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2539_c40_2c85_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2539_c40_2c85_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2540_c11_13c0]
signal BIN_OP_EQ_uxn_opcodes_h_l2540_c11_13c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2540_c11_13c0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2540_c11_13c0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2540_c1_7273]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c1_7273_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c1_7273_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c1_7273_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c1_7273_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2541_c7_115a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c7_115a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c7_115a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c7_115a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c7_115a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2540_c7_72b2]
signal opc_result_MUX_uxn_opcodes_h_l2540_c7_72b2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2540_c7_72b2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2540_c7_72b2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2540_c7_72b2_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l2540_c40_8d3b]
signal jmi_uxn_opcodes_h_l2540_c40_8d3b_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l2540_c40_8d3b_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2540_c40_8d3b_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l2540_c40_8d3b_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2540_c40_8d3b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2541_c11_feb8]
signal BIN_OP_EQ_uxn_opcodes_h_l2541_c11_feb8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2541_c11_feb8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2541_c11_feb8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2541_c1_75cc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_75cc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_75cc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_75cc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_75cc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2542_c7_a205]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c7_a205_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c7_a205_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c7_a205_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c7_a205_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2541_c7_115a]
signal opc_result_MUX_uxn_opcodes_h_l2541_c7_115a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2541_c7_115a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2541_c7_115a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2541_c7_115a_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l2541_c40_2ec7]
signal jsi_uxn_opcodes_h_l2541_c40_2ec7_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l2541_c40_2ec7_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2541_c40_2ec7_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l2541_c40_2ec7_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2541_c40_2ec7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2542_c11_cb0b]
signal BIN_OP_EQ_uxn_opcodes_h_l2542_c11_cb0b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2542_c11_cb0b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2542_c11_cb0b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2542_c1_b870]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c1_b870_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c1_b870_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c1_b870_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c1_b870_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2543_c7_4920]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c7_4920_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c7_4920_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c7_4920_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c7_4920_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2542_c7_a205]
signal opc_result_MUX_uxn_opcodes_h_l2542_c7_a205_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2542_c7_a205_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2542_c7_a205_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2542_c7_a205_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2542_c40_3478]
signal lit_uxn_opcodes_h_l2542_c40_3478_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2542_c40_3478_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2542_c40_3478_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2542_c40_3478_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2542_c40_3478_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2543_c11_6e32]
signal BIN_OP_EQ_uxn_opcodes_h_l2543_c11_6e32_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2543_c11_6e32_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2543_c11_6e32_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2543_c1_6d0d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c1_6d0d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c1_6d0d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c1_6d0d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c1_6d0d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2544_c7_db71]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c7_db71_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c7_db71_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c7_db71_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c7_db71_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2543_c7_4920]
signal opc_result_MUX_uxn_opcodes_h_l2543_c7_4920_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2543_c7_4920_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2543_c7_4920_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2543_c7_4920_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2543_c40_e8d6]
signal lit2_uxn_opcodes_h_l2543_c40_e8d6_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2543_c40_e8d6_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2543_c40_e8d6_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2543_c40_e8d6_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2543_c40_e8d6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2544_c11_e716]
signal BIN_OP_EQ_uxn_opcodes_h_l2544_c11_e716_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2544_c11_e716_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2544_c11_e716_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2544_c1_c6be]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c1_c6be_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c1_c6be_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c1_c6be_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c1_c6be_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2545_c7_da25]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c7_da25_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c7_da25_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c7_da25_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c7_da25_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2544_c7_db71]
signal opc_result_MUX_uxn_opcodes_h_l2544_c7_db71_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2544_c7_db71_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2544_c7_db71_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2544_c7_db71_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2544_c40_c683]
signal lit_uxn_opcodes_h_l2544_c40_c683_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2544_c40_c683_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2544_c40_c683_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2544_c40_c683_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2544_c40_c683_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2545_c11_a4af]
signal BIN_OP_EQ_uxn_opcodes_h_l2545_c11_a4af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2545_c11_a4af_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2545_c11_a4af_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2545_c1_1a80]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_1a80_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_1a80_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_1a80_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_1a80_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2546_c7_5548]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c7_5548_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c7_5548_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c7_5548_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c7_5548_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2545_c7_da25]
signal opc_result_MUX_uxn_opcodes_h_l2545_c7_da25_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2545_c7_da25_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2545_c7_da25_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2545_c7_da25_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2545_c40_20a4]
signal lit2_uxn_opcodes_h_l2545_c40_20a4_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2545_c40_20a4_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2545_c40_20a4_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2545_c40_20a4_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2545_c40_20a4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2546_c11_e1b3]
signal BIN_OP_EQ_uxn_opcodes_h_l2546_c11_e1b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2546_c11_e1b3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2546_c11_e1b3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2546_c1_afaa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_afaa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_afaa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_afaa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_afaa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2547_c7_a0c7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c7_a0c7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c7_a0c7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c7_a0c7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c7_a0c7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2546_c7_5548]
signal opc_result_MUX_uxn_opcodes_h_l2546_c7_5548_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2546_c7_5548_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2546_c7_5548_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2546_c7_5548_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l2546_c40_1930]
signal inc_uxn_opcodes_h_l2546_c40_1930_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l2546_c40_1930_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2546_c40_1930_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2546_c40_1930_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2546_c40_1930_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2547_c11_8781]
signal BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8781_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8781_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8781_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2547_c1_e2db]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_e2db_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_e2db_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_e2db_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_e2db_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2548_c7_afca]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c7_afca_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c7_afca_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c7_afca_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c7_afca_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2547_c7_a0c7]
signal opc_result_MUX_uxn_opcodes_h_l2547_c7_a0c7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2547_c7_a0c7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2547_c7_a0c7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2547_c7_a0c7_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l2547_c40_8cb1]
signal inc2_uxn_opcodes_h_l2547_c40_8cb1_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l2547_c40_8cb1_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2547_c40_8cb1_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2547_c40_8cb1_previous_stack_read : unsigned(15 downto 0);
signal inc2_uxn_opcodes_h_l2547_c40_8cb1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2548_c11_20fd]
signal BIN_OP_EQ_uxn_opcodes_h_l2548_c11_20fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2548_c11_20fd_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2548_c11_20fd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2548_c1_6238]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c1_6238_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c1_6238_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c1_6238_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c1_6238_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2549_c7_a035]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c7_a035_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c7_a035_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c7_a035_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c7_a035_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2548_c7_afca]
signal opc_result_MUX_uxn_opcodes_h_l2548_c7_afca_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2548_c7_afca_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2548_c7_afca_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2548_c7_afca_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l2548_c40_2076]
signal pop_uxn_opcodes_h_l2548_c40_2076_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l2548_c40_2076_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2548_c40_2076_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2548_c40_2076_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2549_c11_7ac2]
signal BIN_OP_EQ_uxn_opcodes_h_l2549_c11_7ac2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2549_c11_7ac2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2549_c11_7ac2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2549_c1_4066]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_4066_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_4066_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_4066_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_4066_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2550_c7_3516]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c7_3516_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c7_3516_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c7_3516_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c7_3516_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2549_c7_a035]
signal opc_result_MUX_uxn_opcodes_h_l2549_c7_a035_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2549_c7_a035_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2549_c7_a035_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2549_c7_a035_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l2549_c40_8f2e]
signal pop2_uxn_opcodes_h_l2549_c40_8f2e_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l2549_c40_8f2e_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2549_c40_8f2e_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2549_c40_8f2e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2550_c11_b620]
signal BIN_OP_EQ_uxn_opcodes_h_l2550_c11_b620_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2550_c11_b620_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2550_c11_b620_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2550_c1_6151]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_6151_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_6151_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_6151_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_6151_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2551_c7_0356]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c7_0356_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c7_0356_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c7_0356_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c7_0356_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2550_c7_3516]
signal opc_result_MUX_uxn_opcodes_h_l2550_c7_3516_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2550_c7_3516_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2550_c7_3516_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2550_c7_3516_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l2550_c40_3b9f]
signal nip_uxn_opcodes_h_l2550_c40_3b9f_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l2550_c40_3b9f_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2550_c40_3b9f_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2550_c40_3b9f_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2550_c40_3b9f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2551_c11_4125]
signal BIN_OP_EQ_uxn_opcodes_h_l2551_c11_4125_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2551_c11_4125_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2551_c11_4125_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2551_c1_75fc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c1_75fc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c1_75fc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c1_75fc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c1_75fc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2552_c7_2629]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c7_2629_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c7_2629_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c7_2629_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c7_2629_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2551_c7_0356]
signal opc_result_MUX_uxn_opcodes_h_l2551_c7_0356_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2551_c7_0356_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2551_c7_0356_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2551_c7_0356_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l2551_c40_96e3]
signal nip2_uxn_opcodes_h_l2551_c40_96e3_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l2551_c40_96e3_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2551_c40_96e3_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2551_c40_96e3_previous_stack_read : unsigned(15 downto 0);
signal nip2_uxn_opcodes_h_l2551_c40_96e3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2552_c11_81d0]
signal BIN_OP_EQ_uxn_opcodes_h_l2552_c11_81d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2552_c11_81d0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2552_c11_81d0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2552_c1_6953]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c1_6953_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c1_6953_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c1_6953_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c1_6953_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2553_c7_f031]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c7_f031_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c7_f031_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c7_f031_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c7_f031_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2552_c7_2629]
signal opc_result_MUX_uxn_opcodes_h_l2552_c7_2629_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2552_c7_2629_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2552_c7_2629_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2552_c7_2629_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l2552_c40_3757]
signal swp_uxn_opcodes_h_l2552_c40_3757_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l2552_c40_3757_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2552_c40_3757_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2552_c40_3757_previous_stack_read : unsigned(15 downto 0);
signal swp_uxn_opcodes_h_l2552_c40_3757_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2553_c11_495b]
signal BIN_OP_EQ_uxn_opcodes_h_l2553_c11_495b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2553_c11_495b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2553_c11_495b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2553_c1_d51f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c1_d51f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c1_d51f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c1_d51f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c1_d51f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2554_c7_ba37]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c7_ba37_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c7_ba37_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c7_ba37_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c7_ba37_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2553_c7_f031]
signal opc_result_MUX_uxn_opcodes_h_l2553_c7_f031_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2553_c7_f031_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2553_c7_f031_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2553_c7_f031_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l2553_c40_5c76]
signal swp2_uxn_opcodes_h_l2553_c40_5c76_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l2553_c40_5c76_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2553_c40_5c76_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2553_c40_5c76_previous_stack_read : unsigned(15 downto 0);
signal swp2_uxn_opcodes_h_l2553_c40_5c76_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2554_c11_fbd5]
signal BIN_OP_EQ_uxn_opcodes_h_l2554_c11_fbd5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2554_c11_fbd5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2554_c11_fbd5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2554_c1_3d40]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c1_3d40_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c1_3d40_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c1_3d40_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c1_3d40_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2555_c7_d61b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c7_d61b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c7_d61b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c7_d61b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c7_d61b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2554_c7_ba37]
signal opc_result_MUX_uxn_opcodes_h_l2554_c7_ba37_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2554_c7_ba37_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2554_c7_ba37_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2554_c7_ba37_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l2554_c40_4358]
signal rot_uxn_opcodes_h_l2554_c40_4358_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l2554_c40_4358_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2554_c40_4358_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2554_c40_4358_previous_stack_read : unsigned(15 downto 0);
signal rot_uxn_opcodes_h_l2554_c40_4358_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2555_c11_7f20]
signal BIN_OP_EQ_uxn_opcodes_h_l2555_c11_7f20_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2555_c11_7f20_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2555_c11_7f20_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2555_c1_2c24]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c1_2c24_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c1_2c24_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c1_2c24_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c1_2c24_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2556_c7_f7cf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c7_f7cf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c7_f7cf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c7_f7cf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c7_f7cf_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2555_c7_d61b]
signal opc_result_MUX_uxn_opcodes_h_l2555_c7_d61b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2555_c7_d61b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2555_c7_d61b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2555_c7_d61b_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l2555_c40_7aa5]
signal rot2_uxn_opcodes_h_l2555_c40_7aa5_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l2555_c40_7aa5_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2555_c40_7aa5_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2555_c40_7aa5_previous_stack_read : unsigned(15 downto 0);
signal rot2_uxn_opcodes_h_l2555_c40_7aa5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2556_c11_11c8]
signal BIN_OP_EQ_uxn_opcodes_h_l2556_c11_11c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2556_c11_11c8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2556_c11_11c8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2556_c1_8a48]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c1_8a48_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c1_8a48_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c1_8a48_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c1_8a48_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2557_c7_148a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c7_148a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c7_148a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c7_148a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c7_148a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2556_c7_f7cf]
signal opc_result_MUX_uxn_opcodes_h_l2556_c7_f7cf_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2556_c7_f7cf_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2556_c7_f7cf_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2556_c7_f7cf_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l2556_c40_9f2a]
signal dup_uxn_opcodes_h_l2556_c40_9f2a_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l2556_c40_9f2a_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2556_c40_9f2a_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2556_c40_9f2a_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2556_c40_9f2a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2557_c11_63ac]
signal BIN_OP_EQ_uxn_opcodes_h_l2557_c11_63ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2557_c11_63ac_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2557_c11_63ac_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2557_c1_c77c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c1_c77c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c1_c77c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c1_c77c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c1_c77c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2558_c7_df66]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c7_df66_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c7_df66_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c7_df66_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c7_df66_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2557_c7_148a]
signal opc_result_MUX_uxn_opcodes_h_l2557_c7_148a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2557_c7_148a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2557_c7_148a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2557_c7_148a_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l2557_c40_190d]
signal dup2_uxn_opcodes_h_l2557_c40_190d_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l2557_c40_190d_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2557_c40_190d_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2557_c40_190d_previous_stack_read : unsigned(15 downto 0);
signal dup2_uxn_opcodes_h_l2557_c40_190d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2558_c11_bcc6]
signal BIN_OP_EQ_uxn_opcodes_h_l2558_c11_bcc6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2558_c11_bcc6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2558_c11_bcc6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2558_c1_4d05]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c1_4d05_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c1_4d05_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c1_4d05_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c1_4d05_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2559_c7_0b1d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c7_0b1d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c7_0b1d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c7_0b1d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c7_0b1d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2558_c7_df66]
signal opc_result_MUX_uxn_opcodes_h_l2558_c7_df66_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2558_c7_df66_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2558_c7_df66_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2558_c7_df66_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l2558_c40_b12c]
signal ovr_uxn_opcodes_h_l2558_c40_b12c_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l2558_c40_b12c_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2558_c40_b12c_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2558_c40_b12c_previous_stack_read : unsigned(15 downto 0);
signal ovr_uxn_opcodes_h_l2558_c40_b12c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2559_c11_6485]
signal BIN_OP_EQ_uxn_opcodes_h_l2559_c11_6485_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2559_c11_6485_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2559_c11_6485_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2559_c1_af2f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c1_af2f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c1_af2f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c1_af2f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c1_af2f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2560_c7_cf3a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c7_cf3a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c7_cf3a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c7_cf3a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c7_cf3a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2559_c7_0b1d]
signal opc_result_MUX_uxn_opcodes_h_l2559_c7_0b1d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2559_c7_0b1d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2559_c7_0b1d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2559_c7_0b1d_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l2559_c40_8f4c]
signal ovr2_uxn_opcodes_h_l2559_c40_8f4c_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l2559_c40_8f4c_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2559_c40_8f4c_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2559_c40_8f4c_previous_stack_read : unsigned(15 downto 0);
signal ovr2_uxn_opcodes_h_l2559_c40_8f4c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2560_c11_13f2]
signal BIN_OP_EQ_uxn_opcodes_h_l2560_c11_13f2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2560_c11_13f2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2560_c11_13f2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2560_c1_2a2d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c1_2a2d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c1_2a2d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c1_2a2d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c1_2a2d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2561_c7_19cc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c7_19cc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c7_19cc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c7_19cc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c7_19cc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2560_c7_cf3a]
signal opc_result_MUX_uxn_opcodes_h_l2560_c7_cf3a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2560_c7_cf3a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2560_c7_cf3a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2560_c7_cf3a_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l2560_c40_49aa]
signal equ_uxn_opcodes_h_l2560_c40_49aa_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l2560_c40_49aa_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2560_c40_49aa_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2560_c40_49aa_previous_stack_read : unsigned(15 downto 0);
signal equ_uxn_opcodes_h_l2560_c40_49aa_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2561_c11_35e0]
signal BIN_OP_EQ_uxn_opcodes_h_l2561_c11_35e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2561_c11_35e0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2561_c11_35e0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2561_c1_47ab]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c1_47ab_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c1_47ab_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c1_47ab_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c1_47ab_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2562_c7_2335]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c7_2335_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c7_2335_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c7_2335_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c7_2335_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2561_c7_19cc]
signal opc_result_MUX_uxn_opcodes_h_l2561_c7_19cc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2561_c7_19cc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2561_c7_19cc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2561_c7_19cc_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l2561_c40_93d5]
signal equ2_uxn_opcodes_h_l2561_c40_93d5_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l2561_c40_93d5_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2561_c40_93d5_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2561_c40_93d5_previous_stack_read : unsigned(15 downto 0);
signal equ2_uxn_opcodes_h_l2561_c40_93d5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2562_c11_5fd5]
signal BIN_OP_EQ_uxn_opcodes_h_l2562_c11_5fd5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2562_c11_5fd5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2562_c11_5fd5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2562_c1_4ab1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c1_4ab1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c1_4ab1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c1_4ab1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c1_4ab1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2563_c7_a38f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c7_a38f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c7_a38f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c7_a38f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c7_a38f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2562_c7_2335]
signal opc_result_MUX_uxn_opcodes_h_l2562_c7_2335_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2562_c7_2335_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2562_c7_2335_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2562_c7_2335_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l2562_c40_5284]
signal neq_uxn_opcodes_h_l2562_c40_5284_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l2562_c40_5284_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2562_c40_5284_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2562_c40_5284_previous_stack_read : unsigned(15 downto 0);
signal neq_uxn_opcodes_h_l2562_c40_5284_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2563_c11_d8c9]
signal BIN_OP_EQ_uxn_opcodes_h_l2563_c11_d8c9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2563_c11_d8c9_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2563_c11_d8c9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2563_c1_2826]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c1_2826_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c1_2826_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c1_2826_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c1_2826_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2564_c7_f981]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c7_f981_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c7_f981_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c7_f981_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c7_f981_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2563_c7_a38f]
signal opc_result_MUX_uxn_opcodes_h_l2563_c7_a38f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2563_c7_a38f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2563_c7_a38f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2563_c7_a38f_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l2563_c40_9708]
signal neq2_uxn_opcodes_h_l2563_c40_9708_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l2563_c40_9708_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2563_c40_9708_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2563_c40_9708_previous_stack_read : unsigned(15 downto 0);
signal neq2_uxn_opcodes_h_l2563_c40_9708_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2564_c11_a073]
signal BIN_OP_EQ_uxn_opcodes_h_l2564_c11_a073_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2564_c11_a073_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2564_c11_a073_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2564_c1_edad]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c1_edad_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c1_edad_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c1_edad_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c1_edad_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2565_c7_23c6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c7_23c6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c7_23c6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c7_23c6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c7_23c6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2564_c7_f981]
signal opc_result_MUX_uxn_opcodes_h_l2564_c7_f981_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2564_c7_f981_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2564_c7_f981_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2564_c7_f981_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l2564_c40_6836]
signal gth_uxn_opcodes_h_l2564_c40_6836_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l2564_c40_6836_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2564_c40_6836_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2564_c40_6836_previous_stack_read : unsigned(15 downto 0);
signal gth_uxn_opcodes_h_l2564_c40_6836_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2565_c11_5bf4]
signal BIN_OP_EQ_uxn_opcodes_h_l2565_c11_5bf4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2565_c11_5bf4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2565_c11_5bf4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2565_c1_466a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_466a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_466a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_466a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_466a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2566_c7_b73a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c7_b73a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c7_b73a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c7_b73a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c7_b73a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2565_c7_23c6]
signal opc_result_MUX_uxn_opcodes_h_l2565_c7_23c6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2565_c7_23c6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2565_c7_23c6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2565_c7_23c6_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l2565_c40_fd50]
signal gth2_uxn_opcodes_h_l2565_c40_fd50_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l2565_c40_fd50_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2565_c40_fd50_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2565_c40_fd50_previous_stack_read : unsigned(15 downto 0);
signal gth2_uxn_opcodes_h_l2565_c40_fd50_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2566_c11_61a5]
signal BIN_OP_EQ_uxn_opcodes_h_l2566_c11_61a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2566_c11_61a5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2566_c11_61a5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2566_c1_216d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c1_216d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c1_216d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c1_216d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c1_216d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2567_c7_7f81]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c7_7f81_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c7_7f81_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c7_7f81_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c7_7f81_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2566_c7_b73a]
signal opc_result_MUX_uxn_opcodes_h_l2566_c7_b73a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2566_c7_b73a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2566_c7_b73a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2566_c7_b73a_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l2566_c40_a5e1]
signal lth_uxn_opcodes_h_l2566_c40_a5e1_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l2566_c40_a5e1_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2566_c40_a5e1_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2566_c40_a5e1_previous_stack_read : unsigned(15 downto 0);
signal lth_uxn_opcodes_h_l2566_c40_a5e1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2567_c11_e8ee]
signal BIN_OP_EQ_uxn_opcodes_h_l2567_c11_e8ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2567_c11_e8ee_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2567_c11_e8ee_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2567_c1_83c7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c1_83c7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c1_83c7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c1_83c7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c1_83c7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2568_c7_a31a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c7_a31a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c7_a31a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c7_a31a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c7_a31a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2567_c7_7f81]
signal opc_result_MUX_uxn_opcodes_h_l2567_c7_7f81_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2567_c7_7f81_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2567_c7_7f81_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2567_c7_7f81_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l2567_c40_dc84]
signal lth2_uxn_opcodes_h_l2567_c40_dc84_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l2567_c40_dc84_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2567_c40_dc84_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2567_c40_dc84_previous_stack_read : unsigned(15 downto 0);
signal lth2_uxn_opcodes_h_l2567_c40_dc84_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2568_c11_7306]
signal BIN_OP_EQ_uxn_opcodes_h_l2568_c11_7306_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2568_c11_7306_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2568_c11_7306_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2568_c1_d332]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c1_d332_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c1_d332_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c1_d332_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c1_d332_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2569_c7_f572]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c7_f572_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c7_f572_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c7_f572_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c7_f572_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2568_c7_a31a]
signal opc_result_MUX_uxn_opcodes_h_l2568_c7_a31a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2568_c7_a31a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2568_c7_a31a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2568_c7_a31a_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l2568_c40_84d1]
signal jmp_uxn_opcodes_h_l2568_c40_84d1_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l2568_c40_84d1_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2568_c40_84d1_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2568_c40_84d1_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l2568_c40_84d1_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2568_c40_84d1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2569_c11_ca0a]
signal BIN_OP_EQ_uxn_opcodes_h_l2569_c11_ca0a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2569_c11_ca0a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2569_c11_ca0a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2569_c1_266f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c1_266f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c1_266f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c1_266f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c1_266f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2570_c7_4440]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c7_4440_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c7_4440_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c7_4440_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c7_4440_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2569_c7_f572]
signal opc_result_MUX_uxn_opcodes_h_l2569_c7_f572_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2569_c7_f572_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2569_c7_f572_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2569_c7_f572_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l2569_c40_d58f]
signal jmp2_uxn_opcodes_h_l2569_c40_d58f_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l2569_c40_d58f_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2569_c40_d58f_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2569_c40_d58f_previous_stack_read : unsigned(15 downto 0);
signal jmp2_uxn_opcodes_h_l2569_c40_d58f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2570_c11_393b]
signal BIN_OP_EQ_uxn_opcodes_h_l2570_c11_393b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2570_c11_393b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2570_c11_393b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2570_c1_0fd3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_0fd3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_0fd3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_0fd3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_0fd3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2571_c7_653e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c7_653e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c7_653e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c7_653e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c7_653e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2570_c7_4440]
signal opc_result_MUX_uxn_opcodes_h_l2570_c7_4440_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2570_c7_4440_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2570_c7_4440_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2570_c7_4440_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l2570_c40_f0d2]
signal jcn_uxn_opcodes_h_l2570_c40_f0d2_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l2570_c40_f0d2_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2570_c40_f0d2_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2570_c40_f0d2_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l2570_c40_f0d2_previous_stack_read : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l2570_c40_f0d2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2571_c11_06db]
signal BIN_OP_EQ_uxn_opcodes_h_l2571_c11_06db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2571_c11_06db_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2571_c11_06db_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2571_c1_ce56]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_ce56_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_ce56_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_ce56_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_ce56_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2572_c7_2fe5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c7_2fe5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c7_2fe5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c7_2fe5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c7_2fe5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2571_c7_653e]
signal opc_result_MUX_uxn_opcodes_h_l2571_c7_653e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2571_c7_653e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2571_c7_653e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2571_c7_653e_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l2571_c40_5828]
signal jcn2_uxn_opcodes_h_l2571_c40_5828_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l2571_c40_5828_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2571_c40_5828_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2571_c40_5828_previous_stack_read : unsigned(15 downto 0);
signal jcn2_uxn_opcodes_h_l2571_c40_5828_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2572_c11_deb5]
signal BIN_OP_EQ_uxn_opcodes_h_l2572_c11_deb5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2572_c11_deb5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2572_c11_deb5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2572_c1_e6ea]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c1_e6ea_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c1_e6ea_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c1_e6ea_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c1_e6ea_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2573_c7_2c4c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c7_2c4c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c7_2c4c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c7_2c4c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c7_2c4c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2572_c7_2fe5]
signal opc_result_MUX_uxn_opcodes_h_l2572_c7_2fe5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2572_c7_2fe5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2572_c7_2fe5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2572_c7_2fe5_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l2572_c40_6d7b]
signal jsr_uxn_opcodes_h_l2572_c40_6d7b_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l2572_c40_6d7b_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2572_c40_6d7b_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2572_c40_6d7b_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l2572_c40_6d7b_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2572_c40_6d7b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2573_c11_62b1]
signal BIN_OP_EQ_uxn_opcodes_h_l2573_c11_62b1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2573_c11_62b1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2573_c11_62b1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2573_c1_4525]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_4525_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_4525_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_4525_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_4525_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2574_c7_a82c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c7_a82c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c7_a82c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c7_a82c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c7_a82c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2573_c7_2c4c]
signal opc_result_MUX_uxn_opcodes_h_l2573_c7_2c4c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2573_c7_2c4c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2573_c7_2c4c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2573_c7_2c4c_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l2573_c40_8faf]
signal jsr2_uxn_opcodes_h_l2573_c40_8faf_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l2573_c40_8faf_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2573_c40_8faf_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2573_c40_8faf_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l2573_c40_8faf_previous_stack_read : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l2573_c40_8faf_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2574_c11_c5b8]
signal BIN_OP_EQ_uxn_opcodes_h_l2574_c11_c5b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2574_c11_c5b8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2574_c11_c5b8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2574_c1_4611]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c1_4611_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c1_4611_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c1_4611_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c1_4611_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2575_c7_ee9c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c7_ee9c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c7_ee9c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c7_ee9c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c7_ee9c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2574_c7_a82c]
signal opc_result_MUX_uxn_opcodes_h_l2574_c7_a82c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2574_c7_a82c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2574_c7_a82c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2574_c7_a82c_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l2574_c40_399b]
signal sth_uxn_opcodes_h_l2574_c40_399b_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l2574_c40_399b_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2574_c40_399b_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2574_c40_399b_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2574_c40_399b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2575_c11_c57a]
signal BIN_OP_EQ_uxn_opcodes_h_l2575_c11_c57a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2575_c11_c57a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2575_c11_c57a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2575_c1_0256]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c1_0256_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c1_0256_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c1_0256_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c1_0256_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2576_c7_dc9e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c7_dc9e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c7_dc9e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c7_dc9e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c7_dc9e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2575_c7_ee9c]
signal opc_result_MUX_uxn_opcodes_h_l2575_c7_ee9c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2575_c7_ee9c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2575_c7_ee9c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2575_c7_ee9c_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l2575_c40_d79c]
signal sth2_uxn_opcodes_h_l2575_c40_d79c_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l2575_c40_d79c_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2575_c40_d79c_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2575_c40_d79c_previous_stack_read : unsigned(15 downto 0);
signal sth2_uxn_opcodes_h_l2575_c40_d79c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2576_c11_9530]
signal BIN_OP_EQ_uxn_opcodes_h_l2576_c11_9530_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2576_c11_9530_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2576_c11_9530_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2576_c1_f7d4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_f7d4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_f7d4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_f7d4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_f7d4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2577_c7_af91]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c7_af91_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c7_af91_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c7_af91_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c7_af91_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2576_c7_dc9e]
signal opc_result_MUX_uxn_opcodes_h_l2576_c7_dc9e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2576_c7_dc9e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2576_c7_dc9e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2576_c7_dc9e_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l2576_c40_72ae]
signal ldz_uxn_opcodes_h_l2576_c40_72ae_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l2576_c40_72ae_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2576_c40_72ae_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2576_c40_72ae_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2576_c40_72ae_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2576_c40_72ae_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2577_c11_c6ab]
signal BIN_OP_EQ_uxn_opcodes_h_l2577_c11_c6ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2577_c11_c6ab_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2577_c11_c6ab_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2577_c1_b1e7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c1_b1e7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c1_b1e7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c1_b1e7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c1_b1e7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2578_c7_c0d8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c7_c0d8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c7_c0d8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c7_c0d8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c7_c0d8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2577_c7_af91]
signal opc_result_MUX_uxn_opcodes_h_l2577_c7_af91_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2577_c7_af91_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2577_c7_af91_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2577_c7_af91_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l2577_c40_a1fd]
signal ldz2_uxn_opcodes_h_l2577_c40_a1fd_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l2577_c40_a1fd_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2577_c40_a1fd_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2577_c40_a1fd_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2577_c40_a1fd_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2577_c40_a1fd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2578_c11_618c]
signal BIN_OP_EQ_uxn_opcodes_h_l2578_c11_618c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2578_c11_618c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2578_c11_618c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2578_c1_9bf9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c1_9bf9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c1_9bf9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c1_9bf9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c1_9bf9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2579_c7_8c50]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c7_8c50_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c7_8c50_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c7_8c50_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c7_8c50_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2578_c7_c0d8]
signal opc_result_MUX_uxn_opcodes_h_l2578_c7_c0d8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2578_c7_c0d8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2578_c7_c0d8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2578_c7_c0d8_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l2578_c40_49bc]
signal stz_uxn_opcodes_h_l2578_c40_49bc_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l2578_c40_49bc_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2578_c40_49bc_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2578_c40_49bc_previous_stack_read : unsigned(15 downto 0);
signal stz_uxn_opcodes_h_l2578_c40_49bc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2579_c11_4223]
signal BIN_OP_EQ_uxn_opcodes_h_l2579_c11_4223_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2579_c11_4223_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2579_c11_4223_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2579_c1_4f85]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c1_4f85_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c1_4f85_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c1_4f85_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c1_4f85_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2580_c7_3d61]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c7_3d61_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c7_3d61_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c7_3d61_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c7_3d61_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2579_c7_8c50]
signal opc_result_MUX_uxn_opcodes_h_l2579_c7_8c50_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2579_c7_8c50_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2579_c7_8c50_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2579_c7_8c50_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l2579_c40_f4b9]
signal stz2_uxn_opcodes_h_l2579_c40_f4b9_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l2579_c40_f4b9_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2579_c40_f4b9_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2579_c40_f4b9_previous_stack_read : unsigned(15 downto 0);
signal stz2_uxn_opcodes_h_l2579_c40_f4b9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2580_c11_ffc5]
signal BIN_OP_EQ_uxn_opcodes_h_l2580_c11_ffc5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2580_c11_ffc5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2580_c11_ffc5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2580_c1_5e1f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c1_5e1f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c1_5e1f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c1_5e1f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c1_5e1f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2581_c7_f736]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c7_f736_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c7_f736_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c7_f736_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c7_f736_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2580_c7_3d61]
signal opc_result_MUX_uxn_opcodes_h_l2580_c7_3d61_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2580_c7_3d61_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2580_c7_3d61_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2580_c7_3d61_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l2580_c40_88bc]
signal ldr_uxn_opcodes_h_l2580_c40_88bc_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l2580_c40_88bc_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2580_c40_88bc_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2580_c40_88bc_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l2580_c40_88bc_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2580_c40_88bc_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2580_c40_88bc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2581_c11_c6c4]
signal BIN_OP_EQ_uxn_opcodes_h_l2581_c11_c6c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2581_c11_c6c4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2581_c11_c6c4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2581_c1_d7a6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c1_d7a6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c1_d7a6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c1_d7a6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c1_d7a6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2582_c7_8b31]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c7_8b31_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c7_8b31_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c7_8b31_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c7_8b31_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2581_c7_f736]
signal opc_result_MUX_uxn_opcodes_h_l2581_c7_f736_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2581_c7_f736_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2581_c7_f736_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2581_c7_f736_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l2581_c40_4b84]
signal ldr2_uxn_opcodes_h_l2581_c40_4b84_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l2581_c40_4b84_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2581_c40_4b84_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2581_c40_4b84_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l2581_c40_4b84_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2581_c40_4b84_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2581_c40_4b84_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2582_c11_f4de]
signal BIN_OP_EQ_uxn_opcodes_h_l2582_c11_f4de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2582_c11_f4de_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2582_c11_f4de_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2582_c1_d8f7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c1_d8f7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c1_d8f7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c1_d8f7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c1_d8f7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2583_c7_43f0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c7_43f0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c7_43f0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c7_43f0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c7_43f0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2582_c7_8b31]
signal opc_result_MUX_uxn_opcodes_h_l2582_c7_8b31_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2582_c7_8b31_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2582_c7_8b31_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2582_c7_8b31_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l2582_c40_9cb6]
signal str1_uxn_opcodes_h_l2582_c40_9cb6_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l2582_c40_9cb6_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2582_c40_9cb6_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2582_c40_9cb6_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l2582_c40_9cb6_previous_stack_read : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l2582_c40_9cb6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2583_c11_1ef8]
signal BIN_OP_EQ_uxn_opcodes_h_l2583_c11_1ef8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2583_c11_1ef8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2583_c11_1ef8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2583_c1_670f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c1_670f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c1_670f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c1_670f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c1_670f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2584_c7_ff57]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c7_ff57_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c7_ff57_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c7_ff57_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c7_ff57_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2583_c7_43f0]
signal opc_result_MUX_uxn_opcodes_h_l2583_c7_43f0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2583_c7_43f0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2583_c7_43f0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2583_c7_43f0_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l2583_c40_2538]
signal str2_uxn_opcodes_h_l2583_c40_2538_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l2583_c40_2538_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2583_c40_2538_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2583_c40_2538_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l2583_c40_2538_previous_stack_read : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l2583_c40_2538_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2584_c11_4d63]
signal BIN_OP_EQ_uxn_opcodes_h_l2584_c11_4d63_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2584_c11_4d63_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2584_c11_4d63_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2584_c1_0ae6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c1_0ae6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c1_0ae6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c1_0ae6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c1_0ae6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2585_c7_955d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c7_955d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c7_955d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c7_955d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c7_955d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2584_c7_ff57]
signal opc_result_MUX_uxn_opcodes_h_l2584_c7_ff57_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2584_c7_ff57_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2584_c7_ff57_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2584_c7_ff57_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l2584_c40_8757]
signal lda_uxn_opcodes_h_l2584_c40_8757_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l2584_c40_8757_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2584_c40_8757_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2584_c40_8757_previous_stack_read : unsigned(15 downto 0);
signal lda_uxn_opcodes_h_l2584_c40_8757_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2584_c40_8757_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2585_c11_ce36]
signal BIN_OP_EQ_uxn_opcodes_h_l2585_c11_ce36_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2585_c11_ce36_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2585_c11_ce36_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2585_c1_95e2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c1_95e2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c1_95e2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c1_95e2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c1_95e2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2586_c7_205c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c7_205c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c7_205c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c7_205c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c7_205c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2585_c7_955d]
signal opc_result_MUX_uxn_opcodes_h_l2585_c7_955d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2585_c7_955d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2585_c7_955d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2585_c7_955d_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l2585_c40_36dd]
signal lda2_uxn_opcodes_h_l2585_c40_36dd_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l2585_c40_36dd_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2585_c40_36dd_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2585_c40_36dd_previous_stack_read : unsigned(15 downto 0);
signal lda2_uxn_opcodes_h_l2585_c40_36dd_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2585_c40_36dd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2586_c11_b7cd]
signal BIN_OP_EQ_uxn_opcodes_h_l2586_c11_b7cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2586_c11_b7cd_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2586_c11_b7cd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2586_c1_c3d1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c1_c3d1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c1_c3d1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c1_c3d1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c1_c3d1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2587_c7_9db0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c7_9db0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c7_9db0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c7_9db0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c7_9db0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2586_c7_205c]
signal opc_result_MUX_uxn_opcodes_h_l2586_c7_205c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2586_c7_205c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2586_c7_205c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2586_c7_205c_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l2586_c40_c4ac]
signal sta_uxn_opcodes_h_l2586_c40_c4ac_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l2586_c40_c4ac_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2586_c40_c4ac_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2586_c40_c4ac_previous_stack_read : unsigned(15 downto 0);
signal sta_uxn_opcodes_h_l2586_c40_c4ac_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2587_c11_5dab]
signal BIN_OP_EQ_uxn_opcodes_h_l2587_c11_5dab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2587_c11_5dab_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2587_c11_5dab_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2587_c1_f247]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c1_f247_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c1_f247_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c1_f247_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c1_f247_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2588_c7_474f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c7_474f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c7_474f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c7_474f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c7_474f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2587_c7_9db0]
signal opc_result_MUX_uxn_opcodes_h_l2587_c7_9db0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2587_c7_9db0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2587_c7_9db0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2587_c7_9db0_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l2587_c40_e790]
signal sta2_uxn_opcodes_h_l2587_c40_e790_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l2587_c40_e790_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2587_c40_e790_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2587_c40_e790_previous_stack_read : unsigned(15 downto 0);
signal sta2_uxn_opcodes_h_l2587_c40_e790_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2588_c11_7def]
signal BIN_OP_EQ_uxn_opcodes_h_l2588_c11_7def_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2588_c11_7def_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2588_c11_7def_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2588_c1_92e3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c1_92e3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c1_92e3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c1_92e3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c1_92e3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2589_c7_5280]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c7_5280_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c7_5280_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c7_5280_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c7_5280_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2588_c7_474f]
signal opc_result_MUX_uxn_opcodes_h_l2588_c7_474f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2588_c7_474f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2588_c7_474f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2588_c7_474f_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l2588_c40_69c1]
signal dei_uxn_opcodes_h_l2588_c40_69c1_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l2588_c40_69c1_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2588_c40_69c1_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2588_c40_69c1_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2588_c40_69c1_previous_device_ram_read : unsigned(15 downto 0);
signal dei_uxn_opcodes_h_l2588_c40_69c1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2589_c11_d95c]
signal BIN_OP_EQ_uxn_opcodes_h_l2589_c11_d95c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2589_c11_d95c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2589_c11_d95c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2589_c1_b6d3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c1_b6d3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c1_b6d3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c1_b6d3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c1_b6d3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2590_c7_157b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c7_157b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c7_157b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c7_157b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c7_157b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2589_c7_5280]
signal opc_result_MUX_uxn_opcodes_h_l2589_c7_5280_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2589_c7_5280_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2589_c7_5280_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2589_c7_5280_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l2589_c40_a853]
signal dei2_uxn_opcodes_h_l2589_c40_a853_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l2589_c40_a853_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2589_c40_a853_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2589_c40_a853_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2589_c40_a853_previous_device_ram_read : unsigned(15 downto 0);
signal dei2_uxn_opcodes_h_l2589_c40_a853_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2590_c11_eb97]
signal BIN_OP_EQ_uxn_opcodes_h_l2590_c11_eb97_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2590_c11_eb97_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2590_c11_eb97_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2590_c1_4287]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c1_4287_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c1_4287_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c1_4287_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c1_4287_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2591_c7_7683]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c7_7683_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c7_7683_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c7_7683_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c7_7683_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2590_c7_157b]
signal opc_result_MUX_uxn_opcodes_h_l2590_c7_157b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2590_c7_157b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2590_c7_157b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2590_c7_157b_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l2590_c40_7c9c]
signal deo_uxn_opcodes_h_l2590_c40_7c9c_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l2590_c40_7c9c_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2590_c40_7c9c_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2590_c40_7c9c_previous_stack_read : unsigned(15 downto 0);
signal deo_uxn_opcodes_h_l2590_c40_7c9c_previous_device_ram_read : unsigned(15 downto 0);
signal deo_uxn_opcodes_h_l2590_c40_7c9c_previous_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2590_c40_7c9c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2591_c11_8041]
signal BIN_OP_EQ_uxn_opcodes_h_l2591_c11_8041_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2591_c11_8041_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2591_c11_8041_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2591_c1_d2d1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c1_d2d1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c1_d2d1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c1_d2d1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c1_d2d1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2592_c7_9ad0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c7_9ad0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c7_9ad0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c7_9ad0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c7_9ad0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2591_c7_7683]
signal opc_result_MUX_uxn_opcodes_h_l2591_c7_7683_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2591_c7_7683_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2591_c7_7683_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2591_c7_7683_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l2591_c40_6834]
signal deo2_uxn_opcodes_h_l2591_c40_6834_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l2591_c40_6834_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2591_c40_6834_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2591_c40_6834_previous_stack_read : unsigned(15 downto 0);
signal deo2_uxn_opcodes_h_l2591_c40_6834_previous_device_ram_read : unsigned(15 downto 0);
signal deo2_uxn_opcodes_h_l2591_c40_6834_previous_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2591_c40_6834_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2592_c11_4fde]
signal BIN_OP_EQ_uxn_opcodes_h_l2592_c11_4fde_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2592_c11_4fde_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2592_c11_4fde_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2592_c1_3b5a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c1_3b5a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c1_3b5a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c1_3b5a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c1_3b5a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2593_c7_498d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c7_498d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c7_498d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c7_498d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c7_498d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2592_c7_9ad0]
signal opc_result_MUX_uxn_opcodes_h_l2592_c7_9ad0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2592_c7_9ad0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2592_c7_9ad0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2592_c7_9ad0_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l2592_c40_97de]
signal add_uxn_opcodes_h_l2592_c40_97de_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l2592_c40_97de_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2592_c40_97de_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2592_c40_97de_previous_stack_read : unsigned(15 downto 0);
signal add_uxn_opcodes_h_l2592_c40_97de_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2593_c11_74c9]
signal BIN_OP_EQ_uxn_opcodes_h_l2593_c11_74c9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2593_c11_74c9_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2593_c11_74c9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2593_c1_d3cb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c1_d3cb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c1_d3cb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c1_d3cb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c1_d3cb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2594_c7_ea71]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c7_ea71_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c7_ea71_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c7_ea71_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c7_ea71_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2593_c7_498d]
signal opc_result_MUX_uxn_opcodes_h_l2593_c7_498d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2593_c7_498d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2593_c7_498d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2593_c7_498d_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l2593_c40_b951]
signal add2_uxn_opcodes_h_l2593_c40_b951_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l2593_c40_b951_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2593_c40_b951_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2593_c40_b951_previous_stack_read : unsigned(15 downto 0);
signal add2_uxn_opcodes_h_l2593_c40_b951_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2594_c11_1cbf]
signal BIN_OP_EQ_uxn_opcodes_h_l2594_c11_1cbf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2594_c11_1cbf_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2594_c11_1cbf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2594_c1_8c8e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c1_8c8e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c1_8c8e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c1_8c8e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c1_8c8e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2595_c7_b70d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c7_b70d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c7_b70d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c7_b70d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c7_b70d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2594_c7_ea71]
signal opc_result_MUX_uxn_opcodes_h_l2594_c7_ea71_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2594_c7_ea71_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2594_c7_ea71_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2594_c7_ea71_return_output : opcode_result_t;

-- sub[uxn_opcodes_h_l2594_c40_3537]
signal sub_uxn_opcodes_h_l2594_c40_3537_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub_uxn_opcodes_h_l2594_c40_3537_phase : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2594_c40_3537_ins : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2594_c40_3537_previous_stack_read : unsigned(15 downto 0);
signal sub_uxn_opcodes_h_l2594_c40_3537_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2595_c11_f255]
signal BIN_OP_EQ_uxn_opcodes_h_l2595_c11_f255_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2595_c11_f255_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2595_c11_f255_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2595_c1_2988]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c1_2988_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c1_2988_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c1_2988_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c1_2988_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2596_c7_2426]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c7_2426_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c7_2426_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c7_2426_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c7_2426_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2595_c7_b70d]
signal opc_result_MUX_uxn_opcodes_h_l2595_c7_b70d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2595_c7_b70d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2595_c7_b70d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2595_c7_b70d_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l2595_c40_50bd]
signal sub2_uxn_opcodes_h_l2595_c40_50bd_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l2595_c40_50bd_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2595_c40_50bd_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2595_c40_50bd_previous_stack_read : unsigned(15 downto 0);
signal sub2_uxn_opcodes_h_l2595_c40_50bd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2596_c11_d91e]
signal BIN_OP_EQ_uxn_opcodes_h_l2596_c11_d91e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2596_c11_d91e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2596_c11_d91e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2596_c1_9856]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c1_9856_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c1_9856_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c1_9856_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c1_9856_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2597_c7_c0ec]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c7_c0ec_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c7_c0ec_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c7_c0ec_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c7_c0ec_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2596_c7_2426]
signal opc_result_MUX_uxn_opcodes_h_l2596_c7_2426_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2596_c7_2426_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2596_c7_2426_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2596_c7_2426_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l2596_c40_feff]
signal mul_uxn_opcodes_h_l2596_c40_feff_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l2596_c40_feff_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2596_c40_feff_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2596_c40_feff_previous_stack_read : unsigned(15 downto 0);
signal mul_uxn_opcodes_h_l2596_c40_feff_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2597_c11_1e97]
signal BIN_OP_EQ_uxn_opcodes_h_l2597_c11_1e97_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2597_c11_1e97_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2597_c11_1e97_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2597_c1_38b1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c1_38b1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c1_38b1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c1_38b1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c1_38b1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2598_c7_f595]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c7_f595_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c7_f595_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c7_f595_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c7_f595_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2597_c7_c0ec]
signal opc_result_MUX_uxn_opcodes_h_l2597_c7_c0ec_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2597_c7_c0ec_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2597_c7_c0ec_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2597_c7_c0ec_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l2597_c40_9413]
signal mul2_uxn_opcodes_h_l2597_c40_9413_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l2597_c40_9413_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2597_c40_9413_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2597_c40_9413_previous_stack_read : unsigned(15 downto 0);
signal mul2_uxn_opcodes_h_l2597_c40_9413_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2598_c11_0f1f]
signal BIN_OP_EQ_uxn_opcodes_h_l2598_c11_0f1f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2598_c11_0f1f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2598_c11_0f1f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2598_c1_ccf5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c1_ccf5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c1_ccf5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c1_ccf5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c1_ccf5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2599_c7_1fbf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c7_1fbf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c7_1fbf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c7_1fbf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c7_1fbf_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2598_c7_f595]
signal opc_result_MUX_uxn_opcodes_h_l2598_c7_f595_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2598_c7_f595_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2598_c7_f595_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2598_c7_f595_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l2598_c40_cc14]
signal div_uxn_opcodes_h_l2598_c40_cc14_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l2598_c40_cc14_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2598_c40_cc14_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2598_c40_cc14_previous_stack_read : unsigned(15 downto 0);
signal div_uxn_opcodes_h_l2598_c40_cc14_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2599_c11_540a]
signal BIN_OP_EQ_uxn_opcodes_h_l2599_c11_540a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2599_c11_540a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2599_c11_540a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2599_c1_2417]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c1_2417_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c1_2417_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c1_2417_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c1_2417_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2600_c7_683b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c7_683b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c7_683b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c7_683b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c7_683b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2599_c7_1fbf]
signal opc_result_MUX_uxn_opcodes_h_l2599_c7_1fbf_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2599_c7_1fbf_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2599_c7_1fbf_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2599_c7_1fbf_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l2599_c40_3dd1]
signal div2_uxn_opcodes_h_l2599_c40_3dd1_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l2599_c40_3dd1_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2599_c40_3dd1_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2599_c40_3dd1_previous_stack_read : unsigned(15 downto 0);
signal div2_uxn_opcodes_h_l2599_c40_3dd1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2600_c11_6438]
signal BIN_OP_EQ_uxn_opcodes_h_l2600_c11_6438_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2600_c11_6438_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2600_c11_6438_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2600_c1_84ac]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_84ac_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_84ac_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_84ac_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_84ac_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2601_c7_1efa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c7_1efa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c7_1efa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c7_1efa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c7_1efa_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2600_c7_683b]
signal opc_result_MUX_uxn_opcodes_h_l2600_c7_683b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2600_c7_683b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2600_c7_683b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2600_c7_683b_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l2600_c40_3c81]
signal and_uxn_opcodes_h_l2600_c40_3c81_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l2600_c40_3c81_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2600_c40_3c81_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2600_c40_3c81_previous_stack_read : unsigned(15 downto 0);
signal and_uxn_opcodes_h_l2600_c40_3c81_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2601_c11_ff18]
signal BIN_OP_EQ_uxn_opcodes_h_l2601_c11_ff18_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2601_c11_ff18_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2601_c11_ff18_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2601_c1_0b00]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c1_0b00_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c1_0b00_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c1_0b00_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c1_0b00_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2602_c7_620a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c7_620a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c7_620a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c7_620a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c7_620a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2601_c7_1efa]
signal opc_result_MUX_uxn_opcodes_h_l2601_c7_1efa_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2601_c7_1efa_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2601_c7_1efa_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2601_c7_1efa_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l2601_c40_991a]
signal and2_uxn_opcodes_h_l2601_c40_991a_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l2601_c40_991a_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2601_c40_991a_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2601_c40_991a_previous_stack_read : unsigned(15 downto 0);
signal and2_uxn_opcodes_h_l2601_c40_991a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2602_c11_d90e]
signal BIN_OP_EQ_uxn_opcodes_h_l2602_c11_d90e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2602_c11_d90e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2602_c11_d90e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2602_c1_180f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c1_180f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c1_180f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c1_180f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c1_180f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2603_c7_5e21]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c7_5e21_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c7_5e21_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c7_5e21_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c7_5e21_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2602_c7_620a]
signal opc_result_MUX_uxn_opcodes_h_l2602_c7_620a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2602_c7_620a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2602_c7_620a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2602_c7_620a_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l2602_c40_ceea]
signal ora_uxn_opcodes_h_l2602_c40_ceea_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l2602_c40_ceea_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2602_c40_ceea_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2602_c40_ceea_previous_stack_read : unsigned(15 downto 0);
signal ora_uxn_opcodes_h_l2602_c40_ceea_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2603_c11_ff07]
signal BIN_OP_EQ_uxn_opcodes_h_l2603_c11_ff07_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2603_c11_ff07_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2603_c11_ff07_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2603_c1_d680]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_d680_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_d680_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_d680_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_d680_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2604_c7_1270]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c7_1270_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c7_1270_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c7_1270_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c7_1270_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2603_c7_5e21]
signal opc_result_MUX_uxn_opcodes_h_l2603_c7_5e21_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2603_c7_5e21_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2603_c7_5e21_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2603_c7_5e21_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l2603_c40_b642]
signal ora2_uxn_opcodes_h_l2603_c40_b642_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l2603_c40_b642_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2603_c40_b642_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2603_c40_b642_previous_stack_read : unsigned(15 downto 0);
signal ora2_uxn_opcodes_h_l2603_c40_b642_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2604_c11_b354]
signal BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b354_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b354_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b354_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2604_c1_0fac]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c1_0fac_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c1_0fac_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c1_0fac_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c1_0fac_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2605_c7_5e80]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c7_5e80_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c7_5e80_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c7_5e80_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c7_5e80_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2604_c7_1270]
signal opc_result_MUX_uxn_opcodes_h_l2604_c7_1270_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2604_c7_1270_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2604_c7_1270_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2604_c7_1270_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l2604_c40_8850]
signal eor_uxn_opcodes_h_l2604_c40_8850_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l2604_c40_8850_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2604_c40_8850_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2604_c40_8850_previous_stack_read : unsigned(15 downto 0);
signal eor_uxn_opcodes_h_l2604_c40_8850_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2605_c11_d529]
signal BIN_OP_EQ_uxn_opcodes_h_l2605_c11_d529_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2605_c11_d529_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2605_c11_d529_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2605_c1_0a11]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c1_0a11_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c1_0a11_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c1_0a11_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c1_0a11_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2606_c7_2198]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c7_2198_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c7_2198_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c7_2198_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c7_2198_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2605_c7_5e80]
signal opc_result_MUX_uxn_opcodes_h_l2605_c7_5e80_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2605_c7_5e80_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2605_c7_5e80_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2605_c7_5e80_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l2605_c40_71d3]
signal eor2_uxn_opcodes_h_l2605_c40_71d3_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l2605_c40_71d3_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2605_c40_71d3_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2605_c40_71d3_previous_stack_read : unsigned(15 downto 0);
signal eor2_uxn_opcodes_h_l2605_c40_71d3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2606_c11_f0c7]
signal BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f0c7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f0c7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f0c7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2606_c1_d368]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c1_d368_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c1_d368_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c1_d368_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c1_d368_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2607_c7_a5d0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c7_a5d0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c7_a5d0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c7_a5d0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c7_a5d0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2606_c7_2198]
signal opc_result_MUX_uxn_opcodes_h_l2606_c7_2198_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2606_c7_2198_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2606_c7_2198_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2606_c7_2198_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l2606_c40_5c65]
signal sft_uxn_opcodes_h_l2606_c40_5c65_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l2606_c40_5c65_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2606_c40_5c65_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2606_c40_5c65_previous_stack_read : unsigned(15 downto 0);
signal sft_uxn_opcodes_h_l2606_c40_5c65_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2607_c11_be22]
signal BIN_OP_EQ_uxn_opcodes_h_l2607_c11_be22_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2607_c11_be22_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2607_c11_be22_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2607_c1_b90f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c1_b90f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c1_b90f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c1_b90f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c1_b90f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2607_c7_a5d0]
signal opc_result_MUX_uxn_opcodes_h_l2607_c7_a5d0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2607_c7_a5d0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2607_c7_a5d0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2607_c7_a5d0_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l2607_c40_c639]
signal sft2_uxn_opcodes_h_l2607_c40_c639_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l2607_c40_c639_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2607_c40_c639_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2607_c40_c639_previous_stack_read : unsigned(15 downto 0);
signal sft2_uxn_opcodes_h_l2607_c40_c639_return_output : opcode_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l2609_c18_318d]
signal BIN_OP_AND_uxn_opcodes_h_l2609_c18_318d_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2609_c18_318d_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2609_c18_318d_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2609_c18_2605]
signal BIN_OP_GT_uxn_opcodes_h_l2609_c18_2605_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2609_c18_2605_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2609_c18_2605_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2609_c18_9746]
signal MUX_uxn_opcodes_h_l2609_c18_9746_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2609_c18_9746_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2609_c18_9746_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2609_c18_9746_return_output : unsigned(0 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2610_c2_a2ec]
signal BIN_OP_XOR_uxn_opcodes_h_l2610_c2_a2ec_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2610_c2_a2ec_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2610_c2_a2ec_return_output : unsigned(0 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2612_c2_2c8f]
signal sp0_MUX_uxn_opcodes_h_l2612_c2_2c8f_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2612_c2_2c8f_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2612_c2_2c8f_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2612_c2_2c8f_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2612_c2_2c8f]
signal sp1_MUX_uxn_opcodes_h_l2612_c2_2c8f_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2612_c2_2c8f_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2612_c2_2c8f_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2612_c2_2c8f_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2613_c3_5b0b]
signal sp0_MUX_uxn_opcodes_h_l2613_c3_5b0b_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2613_c3_5b0b_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2613_c3_5b0b_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2613_c3_5b0b_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2613_c3_5b0b]
signal sp1_MUX_uxn_opcodes_h_l2613_c3_5b0b_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2613_c3_5b0b_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2613_c3_5b0b_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2613_c3_5b0b_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2614_c4_a0ac]
signal BIN_OP_PLUS_uxn_opcodes_h_l2614_c4_a0ac_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2614_c4_a0ac_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2614_c4_a0ac_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2616_c4_9de2]
signal BIN_OP_PLUS_uxn_opcodes_h_l2616_c4_9de2_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2616_c4_9de2_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2616_c4_9de2_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l2620_c29_2608]
signal MUX_uxn_opcodes_h_l2620_c29_2608_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2620_c29_2608_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2620_c29_2608_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2620_c29_2608_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2620_c19_f9e4]
signal BIN_OP_MINUS_uxn_opcodes_h_l2620_c19_f9e4_left : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2620_c19_f9e4_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2620_c19_f9e4_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l2621_c20_119f]
signal MUX_uxn_opcodes_h_l2621_c20_119f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2621_c20_119f_iftrue : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2621_c20_119f_iffalse : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2621_c20_119f_return_output : unsigned(8 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2621_c2_e601]
signal BIN_OP_PLUS_uxn_opcodes_h_l2621_c2_e601_left : unsigned(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2621_c2_e601_right : unsigned(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2621_c2_e601_return_output : unsigned(9 downto 0);

-- MUX[uxn_opcodes_h_l2624_c3_fe7e]
signal MUX_uxn_opcodes_h_l2624_c3_fe7e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2624_c3_fe7e_iftrue : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2624_c3_fe7e_iffalse : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2624_c3_fe7e_return_output : unsigned(8 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2625_c52_6f82]
signal CONST_SR_8_uxn_opcodes_h_l2625_c52_6f82_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2625_c52_6f82_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l2625_c3_259d]
signal MUX_uxn_opcodes_h_l2625_c3_259d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2625_c3_259d_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2625_c3_259d_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2625_c3_259d_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2626_c3_0a38]
signal BIN_OP_AND_uxn_opcodes_h_l2626_c3_0a38_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2626_c3_0a38_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2626_c3_0a38_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2627_c42_5e8f]
signal BIN_OP_PLUS_uxn_opcodes_h_l2627_c42_5e8f_left : unsigned(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2627_c42_5e8f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2627_c42_5e8f_return_output : unsigned(9 downto 0);

-- MUX[uxn_opcodes_h_l2627_c3_0d28]
signal MUX_uxn_opcodes_h_l2627_c3_0d28_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2627_c3_0d28_iftrue : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2627_c3_0d28_iffalse : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2627_c3_0d28_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l2628_c3_e0ed]
signal MUX_uxn_opcodes_h_l2628_c3_e0ed_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2628_c3_e0ed_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2628_c3_e0ed_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2628_c3_e0ed_return_output : unsigned(7 downto 0);

-- stack_ram_update[uxn_opcodes_h_l2623_c24_ac81]
signal stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_address0 : unsigned(8 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_write0_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_write0_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_address1 : unsigned(8 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_write1_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_write1_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_return_output : unsigned(15 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;

      return_output := base;
      return return_output; 
end function;

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

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_int8_t_int4_t( rhs : signed) return signed is

  --variable rhs : signed(3 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9a3e( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned) return eval_opcode_result_t is
 
  variable base : eval_opcode_result_t; 
  variable return_output : eval_opcode_result_t;
begin
      base.is_waiting := ref_toks_0;
      base.device_ram_address := ref_toks_1;
      base.is_device_ram_write := ref_toks_2;
      base.is_device_ram_16bit := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.u16_value := ref_toks_5;
      base.is_ram_write := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.vram_write_layer := ref_toks_8;
      base.vram_address := ref_toks_9;
      base.u8_value := ref_toks_10;
      base.is_opc_done := ref_toks_11;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_opcodes_h_l2530_c14_cbfa
BIN_OP_AND_uxn_opcodes_h_l2530_c14_cbfa : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2530_c14_cbfa_left,
BIN_OP_AND_uxn_opcodes_h_l2530_c14_cbfa_right,
BIN_OP_AND_uxn_opcodes_h_l2530_c14_cbfa_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2531_c14_8511
BIN_OP_XOR_uxn_opcodes_h_l2531_c14_8511 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2531_c14_8511_left,
BIN_OP_XOR_uxn_opcodes_h_l2531_c14_8511_right,
BIN_OP_XOR_uxn_opcodes_h_l2531_c14_8511_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2531_c14_1762
BIN_OP_OR_uxn_opcodes_h_l2531_c14_1762 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2531_c14_1762_left,
BIN_OP_OR_uxn_opcodes_h_l2531_c14_1762_right,
BIN_OP_OR_uxn_opcodes_h_l2531_c14_1762_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l2531_c14_5ff0
UNARY_OP_NOT_uxn_opcodes_h_l2531_c14_5ff0 : entity work.UNARY_OP_NOT_uint8_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l2531_c14_5ff0_expr,
UNARY_OP_NOT_uxn_opcodes_h_l2531_c14_5ff0_return_output);

-- BIN_OP_NEQ_uxn_opcodes_h_l2531_c14_9a48
BIN_OP_NEQ_uxn_opcodes_h_l2531_c14_9a48 : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_opcodes_h_l2531_c14_9a48_left,
BIN_OP_NEQ_uxn_opcodes_h_l2531_c14_9a48_right,
BIN_OP_NEQ_uxn_opcodes_h_l2531_c14_9a48_return_output);

-- MUX_uxn_opcodes_h_l2531_c14_30cb
MUX_uxn_opcodes_h_l2531_c14_30cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2531_c14_30cb_cond,
MUX_uxn_opcodes_h_l2531_c14_30cb_iftrue,
MUX_uxn_opcodes_h_l2531_c14_30cb_iffalse,
MUX_uxn_opcodes_h_l2531_c14_30cb_return_output);

-- MUX_uxn_opcodes_h_l2532_c8_3899
MUX_uxn_opcodes_h_l2532_c8_3899 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2532_c8_3899_cond,
MUX_uxn_opcodes_h_l2532_c8_3899_iftrue,
MUX_uxn_opcodes_h_l2532_c8_3899_iffalse,
MUX_uxn_opcodes_h_l2532_c8_3899_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2538_c6_c949
BIN_OP_EQ_uxn_opcodes_h_l2538_c6_c949 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2538_c6_c949_left,
BIN_OP_EQ_uxn_opcodes_h_l2538_c6_c949_right,
BIN_OP_EQ_uxn_opcodes_h_l2538_c6_c949_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c7_cbdf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c7_cbdf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c7_cbdf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c7_cbdf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c7_cbdf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c7_cbdf_return_output);

-- is_wait_MUX_uxn_opcodes_h_l2538_c2_5792
is_wait_MUX_uxn_opcodes_h_l2538_c2_5792 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_wait_MUX_uxn_opcodes_h_l2538_c2_5792_cond,
is_wait_MUX_uxn_opcodes_h_l2538_c2_5792_iftrue,
is_wait_MUX_uxn_opcodes_h_l2538_c2_5792_iffalse,
is_wait_MUX_uxn_opcodes_h_l2538_c2_5792_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2538_c2_5792
opc_result_MUX_uxn_opcodes_h_l2538_c2_5792 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_cond,
opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_iftrue,
opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_iffalse,
opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2539_c11_164b
BIN_OP_EQ_uxn_opcodes_h_l2539_c11_164b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2539_c11_164b_left,
BIN_OP_EQ_uxn_opcodes_h_l2539_c11_164b_right,
BIN_OP_EQ_uxn_opcodes_h_l2539_c11_164b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_ba06
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_ba06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_ba06_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_ba06_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_ba06_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_ba06_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c7_72b2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c7_72b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c7_72b2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c7_72b2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c7_72b2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c7_72b2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2539_c7_cbdf
opc_result_MUX_uxn_opcodes_h_l2539_c7_cbdf : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2539_c7_cbdf_cond,
opc_result_MUX_uxn_opcodes_h_l2539_c7_cbdf_iftrue,
opc_result_MUX_uxn_opcodes_h_l2539_c7_cbdf_iffalse,
opc_result_MUX_uxn_opcodes_h_l2539_c7_cbdf_return_output);

-- jci_uxn_opcodes_h_l2539_c40_2c85
jci_uxn_opcodes_h_l2539_c40_2c85 : entity work.jci_0CLK_a148083c port map (
clk,
jci_uxn_opcodes_h_l2539_c40_2c85_CLOCK_ENABLE,
jci_uxn_opcodes_h_l2539_c40_2c85_phase,
jci_uxn_opcodes_h_l2539_c40_2c85_pc,
jci_uxn_opcodes_h_l2539_c40_2c85_previous_stack_read,
jci_uxn_opcodes_h_l2539_c40_2c85_previous_ram_read,
jci_uxn_opcodes_h_l2539_c40_2c85_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2540_c11_13c0
BIN_OP_EQ_uxn_opcodes_h_l2540_c11_13c0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2540_c11_13c0_left,
BIN_OP_EQ_uxn_opcodes_h_l2540_c11_13c0_right,
BIN_OP_EQ_uxn_opcodes_h_l2540_c11_13c0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c1_7273
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c1_7273 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c1_7273_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c1_7273_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c1_7273_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c1_7273_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c7_115a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c7_115a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c7_115a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c7_115a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c7_115a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c7_115a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2540_c7_72b2
opc_result_MUX_uxn_opcodes_h_l2540_c7_72b2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2540_c7_72b2_cond,
opc_result_MUX_uxn_opcodes_h_l2540_c7_72b2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2540_c7_72b2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2540_c7_72b2_return_output);

-- jmi_uxn_opcodes_h_l2540_c40_8d3b
jmi_uxn_opcodes_h_l2540_c40_8d3b : entity work.jmi_0CLK_fa355561 port map (
clk,
jmi_uxn_opcodes_h_l2540_c40_8d3b_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l2540_c40_8d3b_phase,
jmi_uxn_opcodes_h_l2540_c40_8d3b_pc,
jmi_uxn_opcodes_h_l2540_c40_8d3b_previous_ram_read,
jmi_uxn_opcodes_h_l2540_c40_8d3b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2541_c11_feb8
BIN_OP_EQ_uxn_opcodes_h_l2541_c11_feb8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2541_c11_feb8_left,
BIN_OP_EQ_uxn_opcodes_h_l2541_c11_feb8_right,
BIN_OP_EQ_uxn_opcodes_h_l2541_c11_feb8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_75cc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_75cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_75cc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_75cc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_75cc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_75cc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c7_a205
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c7_a205 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c7_a205_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c7_a205_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c7_a205_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c7_a205_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2541_c7_115a
opc_result_MUX_uxn_opcodes_h_l2541_c7_115a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2541_c7_115a_cond,
opc_result_MUX_uxn_opcodes_h_l2541_c7_115a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2541_c7_115a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2541_c7_115a_return_output);

-- jsi_uxn_opcodes_h_l2541_c40_2ec7
jsi_uxn_opcodes_h_l2541_c40_2ec7 : entity work.jsi_0CLK_b30fc8f1 port map (
clk,
jsi_uxn_opcodes_h_l2541_c40_2ec7_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l2541_c40_2ec7_phase,
jsi_uxn_opcodes_h_l2541_c40_2ec7_pc,
jsi_uxn_opcodes_h_l2541_c40_2ec7_previous_ram_read,
jsi_uxn_opcodes_h_l2541_c40_2ec7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2542_c11_cb0b
BIN_OP_EQ_uxn_opcodes_h_l2542_c11_cb0b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2542_c11_cb0b_left,
BIN_OP_EQ_uxn_opcodes_h_l2542_c11_cb0b_right,
BIN_OP_EQ_uxn_opcodes_h_l2542_c11_cb0b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c1_b870
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c1_b870 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c1_b870_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c1_b870_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c1_b870_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c1_b870_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c7_4920
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c7_4920 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c7_4920_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c7_4920_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c7_4920_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c7_4920_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2542_c7_a205
opc_result_MUX_uxn_opcodes_h_l2542_c7_a205 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2542_c7_a205_cond,
opc_result_MUX_uxn_opcodes_h_l2542_c7_a205_iftrue,
opc_result_MUX_uxn_opcodes_h_l2542_c7_a205_iffalse,
opc_result_MUX_uxn_opcodes_h_l2542_c7_a205_return_output);

-- lit_uxn_opcodes_h_l2542_c40_3478
lit_uxn_opcodes_h_l2542_c40_3478 : entity work.lit_0CLK_393f0be6 port map (
clk,
lit_uxn_opcodes_h_l2542_c40_3478_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2542_c40_3478_phase,
lit_uxn_opcodes_h_l2542_c40_3478_pc,
lit_uxn_opcodes_h_l2542_c40_3478_previous_ram_read,
lit_uxn_opcodes_h_l2542_c40_3478_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2543_c11_6e32
BIN_OP_EQ_uxn_opcodes_h_l2543_c11_6e32 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2543_c11_6e32_left,
BIN_OP_EQ_uxn_opcodes_h_l2543_c11_6e32_right,
BIN_OP_EQ_uxn_opcodes_h_l2543_c11_6e32_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c1_6d0d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c1_6d0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c1_6d0d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c1_6d0d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c1_6d0d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c1_6d0d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c7_db71
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c7_db71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c7_db71_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c7_db71_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c7_db71_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c7_db71_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2543_c7_4920
opc_result_MUX_uxn_opcodes_h_l2543_c7_4920 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2543_c7_4920_cond,
opc_result_MUX_uxn_opcodes_h_l2543_c7_4920_iftrue,
opc_result_MUX_uxn_opcodes_h_l2543_c7_4920_iffalse,
opc_result_MUX_uxn_opcodes_h_l2543_c7_4920_return_output);

-- lit2_uxn_opcodes_h_l2543_c40_e8d6
lit2_uxn_opcodes_h_l2543_c40_e8d6 : entity work.lit2_0CLK_4c8178ef port map (
clk,
lit2_uxn_opcodes_h_l2543_c40_e8d6_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2543_c40_e8d6_phase,
lit2_uxn_opcodes_h_l2543_c40_e8d6_pc,
lit2_uxn_opcodes_h_l2543_c40_e8d6_previous_ram_read,
lit2_uxn_opcodes_h_l2543_c40_e8d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2544_c11_e716
BIN_OP_EQ_uxn_opcodes_h_l2544_c11_e716 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2544_c11_e716_left,
BIN_OP_EQ_uxn_opcodes_h_l2544_c11_e716_right,
BIN_OP_EQ_uxn_opcodes_h_l2544_c11_e716_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c1_c6be
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c1_c6be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c1_c6be_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c1_c6be_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c1_c6be_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c1_c6be_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c7_da25
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c7_da25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c7_da25_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c7_da25_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c7_da25_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c7_da25_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2544_c7_db71
opc_result_MUX_uxn_opcodes_h_l2544_c7_db71 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2544_c7_db71_cond,
opc_result_MUX_uxn_opcodes_h_l2544_c7_db71_iftrue,
opc_result_MUX_uxn_opcodes_h_l2544_c7_db71_iffalse,
opc_result_MUX_uxn_opcodes_h_l2544_c7_db71_return_output);

-- lit_uxn_opcodes_h_l2544_c40_c683
lit_uxn_opcodes_h_l2544_c40_c683 : entity work.lit_0CLK_393f0be6 port map (
clk,
lit_uxn_opcodes_h_l2544_c40_c683_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2544_c40_c683_phase,
lit_uxn_opcodes_h_l2544_c40_c683_pc,
lit_uxn_opcodes_h_l2544_c40_c683_previous_ram_read,
lit_uxn_opcodes_h_l2544_c40_c683_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2545_c11_a4af
BIN_OP_EQ_uxn_opcodes_h_l2545_c11_a4af : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2545_c11_a4af_left,
BIN_OP_EQ_uxn_opcodes_h_l2545_c11_a4af_right,
BIN_OP_EQ_uxn_opcodes_h_l2545_c11_a4af_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_1a80
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_1a80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_1a80_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_1a80_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_1a80_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_1a80_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c7_5548
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c7_5548 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c7_5548_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c7_5548_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c7_5548_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c7_5548_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2545_c7_da25
opc_result_MUX_uxn_opcodes_h_l2545_c7_da25 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2545_c7_da25_cond,
opc_result_MUX_uxn_opcodes_h_l2545_c7_da25_iftrue,
opc_result_MUX_uxn_opcodes_h_l2545_c7_da25_iffalse,
opc_result_MUX_uxn_opcodes_h_l2545_c7_da25_return_output);

-- lit2_uxn_opcodes_h_l2545_c40_20a4
lit2_uxn_opcodes_h_l2545_c40_20a4 : entity work.lit2_0CLK_4c8178ef port map (
clk,
lit2_uxn_opcodes_h_l2545_c40_20a4_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2545_c40_20a4_phase,
lit2_uxn_opcodes_h_l2545_c40_20a4_pc,
lit2_uxn_opcodes_h_l2545_c40_20a4_previous_ram_read,
lit2_uxn_opcodes_h_l2545_c40_20a4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2546_c11_e1b3
BIN_OP_EQ_uxn_opcodes_h_l2546_c11_e1b3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2546_c11_e1b3_left,
BIN_OP_EQ_uxn_opcodes_h_l2546_c11_e1b3_right,
BIN_OP_EQ_uxn_opcodes_h_l2546_c11_e1b3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_afaa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_afaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_afaa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_afaa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_afaa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_afaa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c7_a0c7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c7_a0c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c7_a0c7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c7_a0c7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c7_a0c7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c7_a0c7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2546_c7_5548
opc_result_MUX_uxn_opcodes_h_l2546_c7_5548 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2546_c7_5548_cond,
opc_result_MUX_uxn_opcodes_h_l2546_c7_5548_iftrue,
opc_result_MUX_uxn_opcodes_h_l2546_c7_5548_iffalse,
opc_result_MUX_uxn_opcodes_h_l2546_c7_5548_return_output);

-- inc_uxn_opcodes_h_l2546_c40_1930
inc_uxn_opcodes_h_l2546_c40_1930 : entity work.inc_0CLK_b6f89731 port map (
clk,
inc_uxn_opcodes_h_l2546_c40_1930_CLOCK_ENABLE,
inc_uxn_opcodes_h_l2546_c40_1930_phase,
inc_uxn_opcodes_h_l2546_c40_1930_ins,
inc_uxn_opcodes_h_l2546_c40_1930_previous_stack_read,
inc_uxn_opcodes_h_l2546_c40_1930_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8781
BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8781 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8781_left,
BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8781_right,
BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8781_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_e2db
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_e2db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_e2db_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_e2db_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_e2db_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_e2db_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c7_afca
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c7_afca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c7_afca_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c7_afca_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c7_afca_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c7_afca_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2547_c7_a0c7
opc_result_MUX_uxn_opcodes_h_l2547_c7_a0c7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2547_c7_a0c7_cond,
opc_result_MUX_uxn_opcodes_h_l2547_c7_a0c7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2547_c7_a0c7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2547_c7_a0c7_return_output);

-- inc2_uxn_opcodes_h_l2547_c40_8cb1
inc2_uxn_opcodes_h_l2547_c40_8cb1 : entity work.inc2_0CLK_d4b33a56 port map (
clk,
inc2_uxn_opcodes_h_l2547_c40_8cb1_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l2547_c40_8cb1_phase,
inc2_uxn_opcodes_h_l2547_c40_8cb1_ins,
inc2_uxn_opcodes_h_l2547_c40_8cb1_previous_stack_read,
inc2_uxn_opcodes_h_l2547_c40_8cb1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2548_c11_20fd
BIN_OP_EQ_uxn_opcodes_h_l2548_c11_20fd : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2548_c11_20fd_left,
BIN_OP_EQ_uxn_opcodes_h_l2548_c11_20fd_right,
BIN_OP_EQ_uxn_opcodes_h_l2548_c11_20fd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c1_6238
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c1_6238 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c1_6238_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c1_6238_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c1_6238_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c1_6238_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c7_a035
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c7_a035 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c7_a035_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c7_a035_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c7_a035_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c7_a035_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2548_c7_afca
opc_result_MUX_uxn_opcodes_h_l2548_c7_afca : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2548_c7_afca_cond,
opc_result_MUX_uxn_opcodes_h_l2548_c7_afca_iftrue,
opc_result_MUX_uxn_opcodes_h_l2548_c7_afca_iffalse,
opc_result_MUX_uxn_opcodes_h_l2548_c7_afca_return_output);

-- pop_uxn_opcodes_h_l2548_c40_2076
pop_uxn_opcodes_h_l2548_c40_2076 : entity work.pop_0CLK_d4523e9c port map (
clk,
pop_uxn_opcodes_h_l2548_c40_2076_CLOCK_ENABLE,
pop_uxn_opcodes_h_l2548_c40_2076_phase,
pop_uxn_opcodes_h_l2548_c40_2076_ins,
pop_uxn_opcodes_h_l2548_c40_2076_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2549_c11_7ac2
BIN_OP_EQ_uxn_opcodes_h_l2549_c11_7ac2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2549_c11_7ac2_left,
BIN_OP_EQ_uxn_opcodes_h_l2549_c11_7ac2_right,
BIN_OP_EQ_uxn_opcodes_h_l2549_c11_7ac2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_4066
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_4066 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_4066_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_4066_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_4066_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_4066_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c7_3516
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c7_3516 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c7_3516_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c7_3516_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c7_3516_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c7_3516_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2549_c7_a035
opc_result_MUX_uxn_opcodes_h_l2549_c7_a035 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2549_c7_a035_cond,
opc_result_MUX_uxn_opcodes_h_l2549_c7_a035_iftrue,
opc_result_MUX_uxn_opcodes_h_l2549_c7_a035_iffalse,
opc_result_MUX_uxn_opcodes_h_l2549_c7_a035_return_output);

-- pop2_uxn_opcodes_h_l2549_c40_8f2e
pop2_uxn_opcodes_h_l2549_c40_8f2e : entity work.pop2_0CLK_d4523e9c port map (
clk,
pop2_uxn_opcodes_h_l2549_c40_8f2e_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l2549_c40_8f2e_phase,
pop2_uxn_opcodes_h_l2549_c40_8f2e_ins,
pop2_uxn_opcodes_h_l2549_c40_8f2e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2550_c11_b620
BIN_OP_EQ_uxn_opcodes_h_l2550_c11_b620 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2550_c11_b620_left,
BIN_OP_EQ_uxn_opcodes_h_l2550_c11_b620_right,
BIN_OP_EQ_uxn_opcodes_h_l2550_c11_b620_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_6151
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_6151 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_6151_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_6151_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_6151_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_6151_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c7_0356
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c7_0356 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c7_0356_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c7_0356_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c7_0356_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c7_0356_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2550_c7_3516
opc_result_MUX_uxn_opcodes_h_l2550_c7_3516 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2550_c7_3516_cond,
opc_result_MUX_uxn_opcodes_h_l2550_c7_3516_iftrue,
opc_result_MUX_uxn_opcodes_h_l2550_c7_3516_iffalse,
opc_result_MUX_uxn_opcodes_h_l2550_c7_3516_return_output);

-- nip_uxn_opcodes_h_l2550_c40_3b9f
nip_uxn_opcodes_h_l2550_c40_3b9f : entity work.nip_0CLK_e65ea25b port map (
clk,
nip_uxn_opcodes_h_l2550_c40_3b9f_CLOCK_ENABLE,
nip_uxn_opcodes_h_l2550_c40_3b9f_phase,
nip_uxn_opcodes_h_l2550_c40_3b9f_ins,
nip_uxn_opcodes_h_l2550_c40_3b9f_previous_stack_read,
nip_uxn_opcodes_h_l2550_c40_3b9f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2551_c11_4125
BIN_OP_EQ_uxn_opcodes_h_l2551_c11_4125 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2551_c11_4125_left,
BIN_OP_EQ_uxn_opcodes_h_l2551_c11_4125_right,
BIN_OP_EQ_uxn_opcodes_h_l2551_c11_4125_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c1_75fc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c1_75fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c1_75fc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c1_75fc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c1_75fc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c1_75fc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c7_2629
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c7_2629 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c7_2629_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c7_2629_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c7_2629_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c7_2629_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2551_c7_0356
opc_result_MUX_uxn_opcodes_h_l2551_c7_0356 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2551_c7_0356_cond,
opc_result_MUX_uxn_opcodes_h_l2551_c7_0356_iftrue,
opc_result_MUX_uxn_opcodes_h_l2551_c7_0356_iffalse,
opc_result_MUX_uxn_opcodes_h_l2551_c7_0356_return_output);

-- nip2_uxn_opcodes_h_l2551_c40_96e3
nip2_uxn_opcodes_h_l2551_c40_96e3 : entity work.nip2_0CLK_b7103d16 port map (
clk,
nip2_uxn_opcodes_h_l2551_c40_96e3_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l2551_c40_96e3_phase,
nip2_uxn_opcodes_h_l2551_c40_96e3_ins,
nip2_uxn_opcodes_h_l2551_c40_96e3_previous_stack_read,
nip2_uxn_opcodes_h_l2551_c40_96e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2552_c11_81d0
BIN_OP_EQ_uxn_opcodes_h_l2552_c11_81d0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2552_c11_81d0_left,
BIN_OP_EQ_uxn_opcodes_h_l2552_c11_81d0_right,
BIN_OP_EQ_uxn_opcodes_h_l2552_c11_81d0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c1_6953
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c1_6953 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c1_6953_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c1_6953_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c1_6953_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c1_6953_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c7_f031
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c7_f031 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c7_f031_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c7_f031_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c7_f031_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c7_f031_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2552_c7_2629
opc_result_MUX_uxn_opcodes_h_l2552_c7_2629 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2552_c7_2629_cond,
opc_result_MUX_uxn_opcodes_h_l2552_c7_2629_iftrue,
opc_result_MUX_uxn_opcodes_h_l2552_c7_2629_iffalse,
opc_result_MUX_uxn_opcodes_h_l2552_c7_2629_return_output);

-- swp_uxn_opcodes_h_l2552_c40_3757
swp_uxn_opcodes_h_l2552_c40_3757 : entity work.swp_0CLK_2c9c5441 port map (
clk,
swp_uxn_opcodes_h_l2552_c40_3757_CLOCK_ENABLE,
swp_uxn_opcodes_h_l2552_c40_3757_phase,
swp_uxn_opcodes_h_l2552_c40_3757_ins,
swp_uxn_opcodes_h_l2552_c40_3757_previous_stack_read,
swp_uxn_opcodes_h_l2552_c40_3757_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2553_c11_495b
BIN_OP_EQ_uxn_opcodes_h_l2553_c11_495b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2553_c11_495b_left,
BIN_OP_EQ_uxn_opcodes_h_l2553_c11_495b_right,
BIN_OP_EQ_uxn_opcodes_h_l2553_c11_495b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c1_d51f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c1_d51f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c1_d51f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c1_d51f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c1_d51f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c1_d51f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c7_ba37
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c7_ba37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c7_ba37_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c7_ba37_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c7_ba37_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c7_ba37_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2553_c7_f031
opc_result_MUX_uxn_opcodes_h_l2553_c7_f031 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2553_c7_f031_cond,
opc_result_MUX_uxn_opcodes_h_l2553_c7_f031_iftrue,
opc_result_MUX_uxn_opcodes_h_l2553_c7_f031_iffalse,
opc_result_MUX_uxn_opcodes_h_l2553_c7_f031_return_output);

-- swp2_uxn_opcodes_h_l2553_c40_5c76
swp2_uxn_opcodes_h_l2553_c40_5c76 : entity work.swp2_0CLK_85d5529e port map (
clk,
swp2_uxn_opcodes_h_l2553_c40_5c76_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l2553_c40_5c76_phase,
swp2_uxn_opcodes_h_l2553_c40_5c76_ins,
swp2_uxn_opcodes_h_l2553_c40_5c76_previous_stack_read,
swp2_uxn_opcodes_h_l2553_c40_5c76_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2554_c11_fbd5
BIN_OP_EQ_uxn_opcodes_h_l2554_c11_fbd5 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2554_c11_fbd5_left,
BIN_OP_EQ_uxn_opcodes_h_l2554_c11_fbd5_right,
BIN_OP_EQ_uxn_opcodes_h_l2554_c11_fbd5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c1_3d40
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c1_3d40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c1_3d40_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c1_3d40_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c1_3d40_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c1_3d40_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c7_d61b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c7_d61b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c7_d61b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c7_d61b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c7_d61b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c7_d61b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2554_c7_ba37
opc_result_MUX_uxn_opcodes_h_l2554_c7_ba37 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2554_c7_ba37_cond,
opc_result_MUX_uxn_opcodes_h_l2554_c7_ba37_iftrue,
opc_result_MUX_uxn_opcodes_h_l2554_c7_ba37_iffalse,
opc_result_MUX_uxn_opcodes_h_l2554_c7_ba37_return_output);

-- rot_uxn_opcodes_h_l2554_c40_4358
rot_uxn_opcodes_h_l2554_c40_4358 : entity work.rot_0CLK_af0b7c12 port map (
clk,
rot_uxn_opcodes_h_l2554_c40_4358_CLOCK_ENABLE,
rot_uxn_opcodes_h_l2554_c40_4358_phase,
rot_uxn_opcodes_h_l2554_c40_4358_ins,
rot_uxn_opcodes_h_l2554_c40_4358_previous_stack_read,
rot_uxn_opcodes_h_l2554_c40_4358_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2555_c11_7f20
BIN_OP_EQ_uxn_opcodes_h_l2555_c11_7f20 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2555_c11_7f20_left,
BIN_OP_EQ_uxn_opcodes_h_l2555_c11_7f20_right,
BIN_OP_EQ_uxn_opcodes_h_l2555_c11_7f20_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c1_2c24
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c1_2c24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c1_2c24_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c1_2c24_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c1_2c24_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c1_2c24_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c7_f7cf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c7_f7cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c7_f7cf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c7_f7cf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c7_f7cf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c7_f7cf_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2555_c7_d61b
opc_result_MUX_uxn_opcodes_h_l2555_c7_d61b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2555_c7_d61b_cond,
opc_result_MUX_uxn_opcodes_h_l2555_c7_d61b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2555_c7_d61b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2555_c7_d61b_return_output);

-- rot2_uxn_opcodes_h_l2555_c40_7aa5
rot2_uxn_opcodes_h_l2555_c40_7aa5 : entity work.rot2_0CLK_666ea292 port map (
clk,
rot2_uxn_opcodes_h_l2555_c40_7aa5_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l2555_c40_7aa5_phase,
rot2_uxn_opcodes_h_l2555_c40_7aa5_ins,
rot2_uxn_opcodes_h_l2555_c40_7aa5_previous_stack_read,
rot2_uxn_opcodes_h_l2555_c40_7aa5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2556_c11_11c8
BIN_OP_EQ_uxn_opcodes_h_l2556_c11_11c8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2556_c11_11c8_left,
BIN_OP_EQ_uxn_opcodes_h_l2556_c11_11c8_right,
BIN_OP_EQ_uxn_opcodes_h_l2556_c11_11c8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c1_8a48
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c1_8a48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c1_8a48_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c1_8a48_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c1_8a48_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c1_8a48_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c7_148a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c7_148a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c7_148a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c7_148a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c7_148a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c7_148a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2556_c7_f7cf
opc_result_MUX_uxn_opcodes_h_l2556_c7_f7cf : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2556_c7_f7cf_cond,
opc_result_MUX_uxn_opcodes_h_l2556_c7_f7cf_iftrue,
opc_result_MUX_uxn_opcodes_h_l2556_c7_f7cf_iffalse,
opc_result_MUX_uxn_opcodes_h_l2556_c7_f7cf_return_output);

-- dup_uxn_opcodes_h_l2556_c40_9f2a
dup_uxn_opcodes_h_l2556_c40_9f2a : entity work.dup_0CLK_5176672b port map (
clk,
dup_uxn_opcodes_h_l2556_c40_9f2a_CLOCK_ENABLE,
dup_uxn_opcodes_h_l2556_c40_9f2a_phase,
dup_uxn_opcodes_h_l2556_c40_9f2a_ins,
dup_uxn_opcodes_h_l2556_c40_9f2a_previous_stack_read,
dup_uxn_opcodes_h_l2556_c40_9f2a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2557_c11_63ac
BIN_OP_EQ_uxn_opcodes_h_l2557_c11_63ac : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2557_c11_63ac_left,
BIN_OP_EQ_uxn_opcodes_h_l2557_c11_63ac_right,
BIN_OP_EQ_uxn_opcodes_h_l2557_c11_63ac_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c1_c77c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c1_c77c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c1_c77c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c1_c77c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c1_c77c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c1_c77c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c7_df66
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c7_df66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c7_df66_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c7_df66_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c7_df66_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c7_df66_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2557_c7_148a
opc_result_MUX_uxn_opcodes_h_l2557_c7_148a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2557_c7_148a_cond,
opc_result_MUX_uxn_opcodes_h_l2557_c7_148a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2557_c7_148a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2557_c7_148a_return_output);

-- dup2_uxn_opcodes_h_l2557_c40_190d
dup2_uxn_opcodes_h_l2557_c40_190d : entity work.dup2_0CLK_0d289325 port map (
clk,
dup2_uxn_opcodes_h_l2557_c40_190d_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l2557_c40_190d_phase,
dup2_uxn_opcodes_h_l2557_c40_190d_ins,
dup2_uxn_opcodes_h_l2557_c40_190d_previous_stack_read,
dup2_uxn_opcodes_h_l2557_c40_190d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2558_c11_bcc6
BIN_OP_EQ_uxn_opcodes_h_l2558_c11_bcc6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2558_c11_bcc6_left,
BIN_OP_EQ_uxn_opcodes_h_l2558_c11_bcc6_right,
BIN_OP_EQ_uxn_opcodes_h_l2558_c11_bcc6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c1_4d05
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c1_4d05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c1_4d05_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c1_4d05_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c1_4d05_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c1_4d05_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c7_0b1d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c7_0b1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c7_0b1d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c7_0b1d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c7_0b1d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c7_0b1d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2558_c7_df66
opc_result_MUX_uxn_opcodes_h_l2558_c7_df66 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2558_c7_df66_cond,
opc_result_MUX_uxn_opcodes_h_l2558_c7_df66_iftrue,
opc_result_MUX_uxn_opcodes_h_l2558_c7_df66_iffalse,
opc_result_MUX_uxn_opcodes_h_l2558_c7_df66_return_output);

-- ovr_uxn_opcodes_h_l2558_c40_b12c
ovr_uxn_opcodes_h_l2558_c40_b12c : entity work.ovr_0CLK_12d025fa port map (
clk,
ovr_uxn_opcodes_h_l2558_c40_b12c_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l2558_c40_b12c_phase,
ovr_uxn_opcodes_h_l2558_c40_b12c_ins,
ovr_uxn_opcodes_h_l2558_c40_b12c_previous_stack_read,
ovr_uxn_opcodes_h_l2558_c40_b12c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2559_c11_6485
BIN_OP_EQ_uxn_opcodes_h_l2559_c11_6485 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2559_c11_6485_left,
BIN_OP_EQ_uxn_opcodes_h_l2559_c11_6485_right,
BIN_OP_EQ_uxn_opcodes_h_l2559_c11_6485_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c1_af2f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c1_af2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c1_af2f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c1_af2f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c1_af2f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c1_af2f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c7_cf3a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c7_cf3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c7_cf3a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c7_cf3a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c7_cf3a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c7_cf3a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2559_c7_0b1d
opc_result_MUX_uxn_opcodes_h_l2559_c7_0b1d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2559_c7_0b1d_cond,
opc_result_MUX_uxn_opcodes_h_l2559_c7_0b1d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2559_c7_0b1d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2559_c7_0b1d_return_output);

-- ovr2_uxn_opcodes_h_l2559_c40_8f4c
ovr2_uxn_opcodes_h_l2559_c40_8f4c : entity work.ovr2_0CLK_57104a4d port map (
clk,
ovr2_uxn_opcodes_h_l2559_c40_8f4c_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l2559_c40_8f4c_phase,
ovr2_uxn_opcodes_h_l2559_c40_8f4c_ins,
ovr2_uxn_opcodes_h_l2559_c40_8f4c_previous_stack_read,
ovr2_uxn_opcodes_h_l2559_c40_8f4c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2560_c11_13f2
BIN_OP_EQ_uxn_opcodes_h_l2560_c11_13f2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2560_c11_13f2_left,
BIN_OP_EQ_uxn_opcodes_h_l2560_c11_13f2_right,
BIN_OP_EQ_uxn_opcodes_h_l2560_c11_13f2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c1_2a2d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c1_2a2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c1_2a2d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c1_2a2d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c1_2a2d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c1_2a2d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c7_19cc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c7_19cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c7_19cc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c7_19cc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c7_19cc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c7_19cc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2560_c7_cf3a
opc_result_MUX_uxn_opcodes_h_l2560_c7_cf3a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2560_c7_cf3a_cond,
opc_result_MUX_uxn_opcodes_h_l2560_c7_cf3a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2560_c7_cf3a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2560_c7_cf3a_return_output);

-- equ_uxn_opcodes_h_l2560_c40_49aa
equ_uxn_opcodes_h_l2560_c40_49aa : entity work.equ_0CLK_0d289325 port map (
clk,
equ_uxn_opcodes_h_l2560_c40_49aa_CLOCK_ENABLE,
equ_uxn_opcodes_h_l2560_c40_49aa_phase,
equ_uxn_opcodes_h_l2560_c40_49aa_ins,
equ_uxn_opcodes_h_l2560_c40_49aa_previous_stack_read,
equ_uxn_opcodes_h_l2560_c40_49aa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2561_c11_35e0
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_35e0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_35e0_left,
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_35e0_right,
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_35e0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c1_47ab
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c1_47ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c1_47ab_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c1_47ab_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c1_47ab_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c1_47ab_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c7_2335
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c7_2335 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c7_2335_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c7_2335_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c7_2335_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c7_2335_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2561_c7_19cc
opc_result_MUX_uxn_opcodes_h_l2561_c7_19cc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2561_c7_19cc_cond,
opc_result_MUX_uxn_opcodes_h_l2561_c7_19cc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2561_c7_19cc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2561_c7_19cc_return_output);

-- equ2_uxn_opcodes_h_l2561_c40_93d5
equ2_uxn_opcodes_h_l2561_c40_93d5 : entity work.equ2_0CLK_85d5529e port map (
clk,
equ2_uxn_opcodes_h_l2561_c40_93d5_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l2561_c40_93d5_phase,
equ2_uxn_opcodes_h_l2561_c40_93d5_ins,
equ2_uxn_opcodes_h_l2561_c40_93d5_previous_stack_read,
equ2_uxn_opcodes_h_l2561_c40_93d5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2562_c11_5fd5
BIN_OP_EQ_uxn_opcodes_h_l2562_c11_5fd5 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2562_c11_5fd5_left,
BIN_OP_EQ_uxn_opcodes_h_l2562_c11_5fd5_right,
BIN_OP_EQ_uxn_opcodes_h_l2562_c11_5fd5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c1_4ab1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c1_4ab1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c1_4ab1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c1_4ab1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c1_4ab1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c1_4ab1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c7_a38f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c7_a38f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c7_a38f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c7_a38f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c7_a38f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c7_a38f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2562_c7_2335
opc_result_MUX_uxn_opcodes_h_l2562_c7_2335 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2562_c7_2335_cond,
opc_result_MUX_uxn_opcodes_h_l2562_c7_2335_iftrue,
opc_result_MUX_uxn_opcodes_h_l2562_c7_2335_iffalse,
opc_result_MUX_uxn_opcodes_h_l2562_c7_2335_return_output);

-- neq_uxn_opcodes_h_l2562_c40_5284
neq_uxn_opcodes_h_l2562_c40_5284 : entity work.neq_0CLK_0d289325 port map (
clk,
neq_uxn_opcodes_h_l2562_c40_5284_CLOCK_ENABLE,
neq_uxn_opcodes_h_l2562_c40_5284_phase,
neq_uxn_opcodes_h_l2562_c40_5284_ins,
neq_uxn_opcodes_h_l2562_c40_5284_previous_stack_read,
neq_uxn_opcodes_h_l2562_c40_5284_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2563_c11_d8c9
BIN_OP_EQ_uxn_opcodes_h_l2563_c11_d8c9 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2563_c11_d8c9_left,
BIN_OP_EQ_uxn_opcodes_h_l2563_c11_d8c9_right,
BIN_OP_EQ_uxn_opcodes_h_l2563_c11_d8c9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c1_2826
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c1_2826 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c1_2826_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c1_2826_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c1_2826_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c1_2826_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c7_f981
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c7_f981 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c7_f981_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c7_f981_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c7_f981_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c7_f981_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2563_c7_a38f
opc_result_MUX_uxn_opcodes_h_l2563_c7_a38f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2563_c7_a38f_cond,
opc_result_MUX_uxn_opcodes_h_l2563_c7_a38f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2563_c7_a38f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2563_c7_a38f_return_output);

-- neq2_uxn_opcodes_h_l2563_c40_9708
neq2_uxn_opcodes_h_l2563_c40_9708 : entity work.neq2_0CLK_85d5529e port map (
clk,
neq2_uxn_opcodes_h_l2563_c40_9708_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l2563_c40_9708_phase,
neq2_uxn_opcodes_h_l2563_c40_9708_ins,
neq2_uxn_opcodes_h_l2563_c40_9708_previous_stack_read,
neq2_uxn_opcodes_h_l2563_c40_9708_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2564_c11_a073
BIN_OP_EQ_uxn_opcodes_h_l2564_c11_a073 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2564_c11_a073_left,
BIN_OP_EQ_uxn_opcodes_h_l2564_c11_a073_right,
BIN_OP_EQ_uxn_opcodes_h_l2564_c11_a073_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c1_edad
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c1_edad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c1_edad_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c1_edad_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c1_edad_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c1_edad_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c7_23c6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c7_23c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c7_23c6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c7_23c6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c7_23c6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c7_23c6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2564_c7_f981
opc_result_MUX_uxn_opcodes_h_l2564_c7_f981 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2564_c7_f981_cond,
opc_result_MUX_uxn_opcodes_h_l2564_c7_f981_iftrue,
opc_result_MUX_uxn_opcodes_h_l2564_c7_f981_iffalse,
opc_result_MUX_uxn_opcodes_h_l2564_c7_f981_return_output);

-- gth_uxn_opcodes_h_l2564_c40_6836
gth_uxn_opcodes_h_l2564_c40_6836 : entity work.gth_0CLK_0d289325 port map (
clk,
gth_uxn_opcodes_h_l2564_c40_6836_CLOCK_ENABLE,
gth_uxn_opcodes_h_l2564_c40_6836_phase,
gth_uxn_opcodes_h_l2564_c40_6836_ins,
gth_uxn_opcodes_h_l2564_c40_6836_previous_stack_read,
gth_uxn_opcodes_h_l2564_c40_6836_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2565_c11_5bf4
BIN_OP_EQ_uxn_opcodes_h_l2565_c11_5bf4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2565_c11_5bf4_left,
BIN_OP_EQ_uxn_opcodes_h_l2565_c11_5bf4_right,
BIN_OP_EQ_uxn_opcodes_h_l2565_c11_5bf4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_466a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_466a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_466a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_466a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_466a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_466a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c7_b73a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c7_b73a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c7_b73a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c7_b73a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c7_b73a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c7_b73a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2565_c7_23c6
opc_result_MUX_uxn_opcodes_h_l2565_c7_23c6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2565_c7_23c6_cond,
opc_result_MUX_uxn_opcodes_h_l2565_c7_23c6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2565_c7_23c6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2565_c7_23c6_return_output);

-- gth2_uxn_opcodes_h_l2565_c40_fd50
gth2_uxn_opcodes_h_l2565_c40_fd50 : entity work.gth2_0CLK_85d5529e port map (
clk,
gth2_uxn_opcodes_h_l2565_c40_fd50_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l2565_c40_fd50_phase,
gth2_uxn_opcodes_h_l2565_c40_fd50_ins,
gth2_uxn_opcodes_h_l2565_c40_fd50_previous_stack_read,
gth2_uxn_opcodes_h_l2565_c40_fd50_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2566_c11_61a5
BIN_OP_EQ_uxn_opcodes_h_l2566_c11_61a5 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2566_c11_61a5_left,
BIN_OP_EQ_uxn_opcodes_h_l2566_c11_61a5_right,
BIN_OP_EQ_uxn_opcodes_h_l2566_c11_61a5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c1_216d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c1_216d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c1_216d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c1_216d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c1_216d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c1_216d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c7_7f81
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c7_7f81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c7_7f81_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c7_7f81_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c7_7f81_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c7_7f81_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2566_c7_b73a
opc_result_MUX_uxn_opcodes_h_l2566_c7_b73a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2566_c7_b73a_cond,
opc_result_MUX_uxn_opcodes_h_l2566_c7_b73a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2566_c7_b73a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2566_c7_b73a_return_output);

-- lth_uxn_opcodes_h_l2566_c40_a5e1
lth_uxn_opcodes_h_l2566_c40_a5e1 : entity work.lth_0CLK_0d289325 port map (
clk,
lth_uxn_opcodes_h_l2566_c40_a5e1_CLOCK_ENABLE,
lth_uxn_opcodes_h_l2566_c40_a5e1_phase,
lth_uxn_opcodes_h_l2566_c40_a5e1_ins,
lth_uxn_opcodes_h_l2566_c40_a5e1_previous_stack_read,
lth_uxn_opcodes_h_l2566_c40_a5e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2567_c11_e8ee
BIN_OP_EQ_uxn_opcodes_h_l2567_c11_e8ee : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2567_c11_e8ee_left,
BIN_OP_EQ_uxn_opcodes_h_l2567_c11_e8ee_right,
BIN_OP_EQ_uxn_opcodes_h_l2567_c11_e8ee_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c1_83c7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c1_83c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c1_83c7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c1_83c7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c1_83c7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c1_83c7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c7_a31a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c7_a31a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c7_a31a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c7_a31a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c7_a31a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c7_a31a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2567_c7_7f81
opc_result_MUX_uxn_opcodes_h_l2567_c7_7f81 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2567_c7_7f81_cond,
opc_result_MUX_uxn_opcodes_h_l2567_c7_7f81_iftrue,
opc_result_MUX_uxn_opcodes_h_l2567_c7_7f81_iffalse,
opc_result_MUX_uxn_opcodes_h_l2567_c7_7f81_return_output);

-- lth2_uxn_opcodes_h_l2567_c40_dc84
lth2_uxn_opcodes_h_l2567_c40_dc84 : entity work.lth2_0CLK_85d5529e port map (
clk,
lth2_uxn_opcodes_h_l2567_c40_dc84_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l2567_c40_dc84_phase,
lth2_uxn_opcodes_h_l2567_c40_dc84_ins,
lth2_uxn_opcodes_h_l2567_c40_dc84_previous_stack_read,
lth2_uxn_opcodes_h_l2567_c40_dc84_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2568_c11_7306
BIN_OP_EQ_uxn_opcodes_h_l2568_c11_7306 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2568_c11_7306_left,
BIN_OP_EQ_uxn_opcodes_h_l2568_c11_7306_right,
BIN_OP_EQ_uxn_opcodes_h_l2568_c11_7306_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c1_d332
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c1_d332 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c1_d332_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c1_d332_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c1_d332_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c1_d332_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c7_f572
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c7_f572 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c7_f572_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c7_f572_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c7_f572_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c7_f572_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2568_c7_a31a
opc_result_MUX_uxn_opcodes_h_l2568_c7_a31a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2568_c7_a31a_cond,
opc_result_MUX_uxn_opcodes_h_l2568_c7_a31a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2568_c7_a31a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2568_c7_a31a_return_output);

-- jmp_uxn_opcodes_h_l2568_c40_84d1
jmp_uxn_opcodes_h_l2568_c40_84d1 : entity work.jmp_0CLK_b6f89731 port map (
clk,
jmp_uxn_opcodes_h_l2568_c40_84d1_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l2568_c40_84d1_phase,
jmp_uxn_opcodes_h_l2568_c40_84d1_ins,
jmp_uxn_opcodes_h_l2568_c40_84d1_pc,
jmp_uxn_opcodes_h_l2568_c40_84d1_previous_stack_read,
jmp_uxn_opcodes_h_l2568_c40_84d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2569_c11_ca0a
BIN_OP_EQ_uxn_opcodes_h_l2569_c11_ca0a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2569_c11_ca0a_left,
BIN_OP_EQ_uxn_opcodes_h_l2569_c11_ca0a_right,
BIN_OP_EQ_uxn_opcodes_h_l2569_c11_ca0a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c1_266f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c1_266f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c1_266f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c1_266f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c1_266f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c1_266f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c7_4440
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c7_4440 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c7_4440_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c7_4440_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c7_4440_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c7_4440_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2569_c7_f572
opc_result_MUX_uxn_opcodes_h_l2569_c7_f572 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2569_c7_f572_cond,
opc_result_MUX_uxn_opcodes_h_l2569_c7_f572_iftrue,
opc_result_MUX_uxn_opcodes_h_l2569_c7_f572_iffalse,
opc_result_MUX_uxn_opcodes_h_l2569_c7_f572_return_output);

-- jmp2_uxn_opcodes_h_l2569_c40_d58f
jmp2_uxn_opcodes_h_l2569_c40_d58f : entity work.jmp2_0CLK_b6f89731 port map (
clk,
jmp2_uxn_opcodes_h_l2569_c40_d58f_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l2569_c40_d58f_phase,
jmp2_uxn_opcodes_h_l2569_c40_d58f_ins,
jmp2_uxn_opcodes_h_l2569_c40_d58f_previous_stack_read,
jmp2_uxn_opcodes_h_l2569_c40_d58f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2570_c11_393b
BIN_OP_EQ_uxn_opcodes_h_l2570_c11_393b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2570_c11_393b_left,
BIN_OP_EQ_uxn_opcodes_h_l2570_c11_393b_right,
BIN_OP_EQ_uxn_opcodes_h_l2570_c11_393b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_0fd3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_0fd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_0fd3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_0fd3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_0fd3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_0fd3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c7_653e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c7_653e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c7_653e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c7_653e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c7_653e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c7_653e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2570_c7_4440
opc_result_MUX_uxn_opcodes_h_l2570_c7_4440 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2570_c7_4440_cond,
opc_result_MUX_uxn_opcodes_h_l2570_c7_4440_iftrue,
opc_result_MUX_uxn_opcodes_h_l2570_c7_4440_iffalse,
opc_result_MUX_uxn_opcodes_h_l2570_c7_4440_return_output);

-- jcn_uxn_opcodes_h_l2570_c40_f0d2
jcn_uxn_opcodes_h_l2570_c40_f0d2 : entity work.jcn_0CLK_0d289325 port map (
clk,
jcn_uxn_opcodes_h_l2570_c40_f0d2_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l2570_c40_f0d2_phase,
jcn_uxn_opcodes_h_l2570_c40_f0d2_ins,
jcn_uxn_opcodes_h_l2570_c40_f0d2_pc,
jcn_uxn_opcodes_h_l2570_c40_f0d2_previous_stack_read,
jcn_uxn_opcodes_h_l2570_c40_f0d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2571_c11_06db
BIN_OP_EQ_uxn_opcodes_h_l2571_c11_06db : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2571_c11_06db_left,
BIN_OP_EQ_uxn_opcodes_h_l2571_c11_06db_right,
BIN_OP_EQ_uxn_opcodes_h_l2571_c11_06db_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_ce56
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_ce56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_ce56_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_ce56_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_ce56_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_ce56_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c7_2fe5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c7_2fe5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c7_2fe5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c7_2fe5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c7_2fe5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c7_2fe5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2571_c7_653e
opc_result_MUX_uxn_opcodes_h_l2571_c7_653e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2571_c7_653e_cond,
opc_result_MUX_uxn_opcodes_h_l2571_c7_653e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2571_c7_653e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2571_c7_653e_return_output);

-- jcn2_uxn_opcodes_h_l2571_c40_5828
jcn2_uxn_opcodes_h_l2571_c40_5828 : entity work.jcn2_0CLK_85d5529e port map (
clk,
jcn2_uxn_opcodes_h_l2571_c40_5828_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l2571_c40_5828_phase,
jcn2_uxn_opcodes_h_l2571_c40_5828_ins,
jcn2_uxn_opcodes_h_l2571_c40_5828_previous_stack_read,
jcn2_uxn_opcodes_h_l2571_c40_5828_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2572_c11_deb5
BIN_OP_EQ_uxn_opcodes_h_l2572_c11_deb5 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2572_c11_deb5_left,
BIN_OP_EQ_uxn_opcodes_h_l2572_c11_deb5_right,
BIN_OP_EQ_uxn_opcodes_h_l2572_c11_deb5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c1_e6ea
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c1_e6ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c1_e6ea_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c1_e6ea_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c1_e6ea_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c1_e6ea_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c7_2c4c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c7_2c4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c7_2c4c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c7_2c4c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c7_2c4c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c7_2c4c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2572_c7_2fe5
opc_result_MUX_uxn_opcodes_h_l2572_c7_2fe5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2572_c7_2fe5_cond,
opc_result_MUX_uxn_opcodes_h_l2572_c7_2fe5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2572_c7_2fe5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2572_c7_2fe5_return_output);

-- jsr_uxn_opcodes_h_l2572_c40_6d7b
jsr_uxn_opcodes_h_l2572_c40_6d7b : entity work.jsr_0CLK_f62d646e port map (
clk,
jsr_uxn_opcodes_h_l2572_c40_6d7b_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l2572_c40_6d7b_phase,
jsr_uxn_opcodes_h_l2572_c40_6d7b_ins,
jsr_uxn_opcodes_h_l2572_c40_6d7b_pc,
jsr_uxn_opcodes_h_l2572_c40_6d7b_previous_stack_read,
jsr_uxn_opcodes_h_l2572_c40_6d7b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2573_c11_62b1
BIN_OP_EQ_uxn_opcodes_h_l2573_c11_62b1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2573_c11_62b1_left,
BIN_OP_EQ_uxn_opcodes_h_l2573_c11_62b1_right,
BIN_OP_EQ_uxn_opcodes_h_l2573_c11_62b1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_4525
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_4525 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_4525_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_4525_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_4525_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_4525_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c7_a82c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c7_a82c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c7_a82c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c7_a82c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c7_a82c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c7_a82c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2573_c7_2c4c
opc_result_MUX_uxn_opcodes_h_l2573_c7_2c4c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2573_c7_2c4c_cond,
opc_result_MUX_uxn_opcodes_h_l2573_c7_2c4c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2573_c7_2c4c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2573_c7_2c4c_return_output);

-- jsr2_uxn_opcodes_h_l2573_c40_8faf
jsr2_uxn_opcodes_h_l2573_c40_8faf : entity work.jsr2_0CLK_fedec265 port map (
clk,
jsr2_uxn_opcodes_h_l2573_c40_8faf_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l2573_c40_8faf_phase,
jsr2_uxn_opcodes_h_l2573_c40_8faf_ins,
jsr2_uxn_opcodes_h_l2573_c40_8faf_pc,
jsr2_uxn_opcodes_h_l2573_c40_8faf_previous_stack_read,
jsr2_uxn_opcodes_h_l2573_c40_8faf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2574_c11_c5b8
BIN_OP_EQ_uxn_opcodes_h_l2574_c11_c5b8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2574_c11_c5b8_left,
BIN_OP_EQ_uxn_opcodes_h_l2574_c11_c5b8_right,
BIN_OP_EQ_uxn_opcodes_h_l2574_c11_c5b8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c1_4611
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c1_4611 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c1_4611_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c1_4611_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c1_4611_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c1_4611_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c7_ee9c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c7_ee9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c7_ee9c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c7_ee9c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c7_ee9c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c7_ee9c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2574_c7_a82c
opc_result_MUX_uxn_opcodes_h_l2574_c7_a82c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2574_c7_a82c_cond,
opc_result_MUX_uxn_opcodes_h_l2574_c7_a82c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2574_c7_a82c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2574_c7_a82c_return_output);

-- sth_uxn_opcodes_h_l2574_c40_399b
sth_uxn_opcodes_h_l2574_c40_399b : entity work.sth_0CLK_02ab8d09 port map (
clk,
sth_uxn_opcodes_h_l2574_c40_399b_CLOCK_ENABLE,
sth_uxn_opcodes_h_l2574_c40_399b_phase,
sth_uxn_opcodes_h_l2574_c40_399b_ins,
sth_uxn_opcodes_h_l2574_c40_399b_previous_stack_read,
sth_uxn_opcodes_h_l2574_c40_399b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2575_c11_c57a
BIN_OP_EQ_uxn_opcodes_h_l2575_c11_c57a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2575_c11_c57a_left,
BIN_OP_EQ_uxn_opcodes_h_l2575_c11_c57a_right,
BIN_OP_EQ_uxn_opcodes_h_l2575_c11_c57a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c1_0256
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c1_0256 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c1_0256_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c1_0256_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c1_0256_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c1_0256_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c7_dc9e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c7_dc9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c7_dc9e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c7_dc9e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c7_dc9e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c7_dc9e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2575_c7_ee9c
opc_result_MUX_uxn_opcodes_h_l2575_c7_ee9c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2575_c7_ee9c_cond,
opc_result_MUX_uxn_opcodes_h_l2575_c7_ee9c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2575_c7_ee9c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2575_c7_ee9c_return_output);

-- sth2_uxn_opcodes_h_l2575_c40_d79c
sth2_uxn_opcodes_h_l2575_c40_d79c : entity work.sth2_0CLK_282a76ca port map (
clk,
sth2_uxn_opcodes_h_l2575_c40_d79c_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l2575_c40_d79c_phase,
sth2_uxn_opcodes_h_l2575_c40_d79c_ins,
sth2_uxn_opcodes_h_l2575_c40_d79c_previous_stack_read,
sth2_uxn_opcodes_h_l2575_c40_d79c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2576_c11_9530
BIN_OP_EQ_uxn_opcodes_h_l2576_c11_9530 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2576_c11_9530_left,
BIN_OP_EQ_uxn_opcodes_h_l2576_c11_9530_right,
BIN_OP_EQ_uxn_opcodes_h_l2576_c11_9530_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_f7d4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_f7d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_f7d4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_f7d4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_f7d4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_f7d4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c7_af91
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c7_af91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c7_af91_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c7_af91_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c7_af91_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c7_af91_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2576_c7_dc9e
opc_result_MUX_uxn_opcodes_h_l2576_c7_dc9e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2576_c7_dc9e_cond,
opc_result_MUX_uxn_opcodes_h_l2576_c7_dc9e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2576_c7_dc9e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2576_c7_dc9e_return_output);

-- ldz_uxn_opcodes_h_l2576_c40_72ae
ldz_uxn_opcodes_h_l2576_c40_72ae : entity work.ldz_0CLK_a8170e34 port map (
clk,
ldz_uxn_opcodes_h_l2576_c40_72ae_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l2576_c40_72ae_phase,
ldz_uxn_opcodes_h_l2576_c40_72ae_ins,
ldz_uxn_opcodes_h_l2576_c40_72ae_previous_stack_read,
ldz_uxn_opcodes_h_l2576_c40_72ae_previous_ram_read,
ldz_uxn_opcodes_h_l2576_c40_72ae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2577_c11_c6ab
BIN_OP_EQ_uxn_opcodes_h_l2577_c11_c6ab : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2577_c11_c6ab_left,
BIN_OP_EQ_uxn_opcodes_h_l2577_c11_c6ab_right,
BIN_OP_EQ_uxn_opcodes_h_l2577_c11_c6ab_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c1_b1e7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c1_b1e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c1_b1e7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c1_b1e7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c1_b1e7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c1_b1e7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c7_c0d8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c7_c0d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c7_c0d8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c7_c0d8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c7_c0d8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c7_c0d8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2577_c7_af91
opc_result_MUX_uxn_opcodes_h_l2577_c7_af91 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2577_c7_af91_cond,
opc_result_MUX_uxn_opcodes_h_l2577_c7_af91_iftrue,
opc_result_MUX_uxn_opcodes_h_l2577_c7_af91_iffalse,
opc_result_MUX_uxn_opcodes_h_l2577_c7_af91_return_output);

-- ldz2_uxn_opcodes_h_l2577_c40_a1fd
ldz2_uxn_opcodes_h_l2577_c40_a1fd : entity work.ldz2_0CLK_f255bac8 port map (
clk,
ldz2_uxn_opcodes_h_l2577_c40_a1fd_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l2577_c40_a1fd_phase,
ldz2_uxn_opcodes_h_l2577_c40_a1fd_ins,
ldz2_uxn_opcodes_h_l2577_c40_a1fd_previous_stack_read,
ldz2_uxn_opcodes_h_l2577_c40_a1fd_previous_ram_read,
ldz2_uxn_opcodes_h_l2577_c40_a1fd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2578_c11_618c
BIN_OP_EQ_uxn_opcodes_h_l2578_c11_618c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2578_c11_618c_left,
BIN_OP_EQ_uxn_opcodes_h_l2578_c11_618c_right,
BIN_OP_EQ_uxn_opcodes_h_l2578_c11_618c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c1_9bf9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c1_9bf9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c1_9bf9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c1_9bf9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c1_9bf9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c1_9bf9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c7_8c50
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c7_8c50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c7_8c50_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c7_8c50_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c7_8c50_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c7_8c50_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2578_c7_c0d8
opc_result_MUX_uxn_opcodes_h_l2578_c7_c0d8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2578_c7_c0d8_cond,
opc_result_MUX_uxn_opcodes_h_l2578_c7_c0d8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2578_c7_c0d8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2578_c7_c0d8_return_output);

-- stz_uxn_opcodes_h_l2578_c40_49bc
stz_uxn_opcodes_h_l2578_c40_49bc : entity work.stz_0CLK_282a76ca port map (
clk,
stz_uxn_opcodes_h_l2578_c40_49bc_CLOCK_ENABLE,
stz_uxn_opcodes_h_l2578_c40_49bc_phase,
stz_uxn_opcodes_h_l2578_c40_49bc_ins,
stz_uxn_opcodes_h_l2578_c40_49bc_previous_stack_read,
stz_uxn_opcodes_h_l2578_c40_49bc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2579_c11_4223
BIN_OP_EQ_uxn_opcodes_h_l2579_c11_4223 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2579_c11_4223_left,
BIN_OP_EQ_uxn_opcodes_h_l2579_c11_4223_right,
BIN_OP_EQ_uxn_opcodes_h_l2579_c11_4223_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c1_4f85
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c1_4f85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c1_4f85_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c1_4f85_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c1_4f85_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c1_4f85_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c7_3d61
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c7_3d61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c7_3d61_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c7_3d61_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c7_3d61_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c7_3d61_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2579_c7_8c50
opc_result_MUX_uxn_opcodes_h_l2579_c7_8c50 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2579_c7_8c50_cond,
opc_result_MUX_uxn_opcodes_h_l2579_c7_8c50_iftrue,
opc_result_MUX_uxn_opcodes_h_l2579_c7_8c50_iffalse,
opc_result_MUX_uxn_opcodes_h_l2579_c7_8c50_return_output);

-- stz2_uxn_opcodes_h_l2579_c40_f4b9
stz2_uxn_opcodes_h_l2579_c40_f4b9 : entity work.stz2_0CLK_dd8f5d52 port map (
clk,
stz2_uxn_opcodes_h_l2579_c40_f4b9_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l2579_c40_f4b9_phase,
stz2_uxn_opcodes_h_l2579_c40_f4b9_ins,
stz2_uxn_opcodes_h_l2579_c40_f4b9_previous_stack_read,
stz2_uxn_opcodes_h_l2579_c40_f4b9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2580_c11_ffc5
BIN_OP_EQ_uxn_opcodes_h_l2580_c11_ffc5 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2580_c11_ffc5_left,
BIN_OP_EQ_uxn_opcodes_h_l2580_c11_ffc5_right,
BIN_OP_EQ_uxn_opcodes_h_l2580_c11_ffc5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c1_5e1f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c1_5e1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c1_5e1f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c1_5e1f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c1_5e1f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c1_5e1f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c7_f736
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c7_f736 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c7_f736_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c7_f736_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c7_f736_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c7_f736_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2580_c7_3d61
opc_result_MUX_uxn_opcodes_h_l2580_c7_3d61 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2580_c7_3d61_cond,
opc_result_MUX_uxn_opcodes_h_l2580_c7_3d61_iftrue,
opc_result_MUX_uxn_opcodes_h_l2580_c7_3d61_iffalse,
opc_result_MUX_uxn_opcodes_h_l2580_c7_3d61_return_output);

-- ldr_uxn_opcodes_h_l2580_c40_88bc
ldr_uxn_opcodes_h_l2580_c40_88bc : entity work.ldr_0CLK_b128164d port map (
clk,
ldr_uxn_opcodes_h_l2580_c40_88bc_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l2580_c40_88bc_phase,
ldr_uxn_opcodes_h_l2580_c40_88bc_ins,
ldr_uxn_opcodes_h_l2580_c40_88bc_pc,
ldr_uxn_opcodes_h_l2580_c40_88bc_previous_stack_read,
ldr_uxn_opcodes_h_l2580_c40_88bc_previous_ram_read,
ldr_uxn_opcodes_h_l2580_c40_88bc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2581_c11_c6c4
BIN_OP_EQ_uxn_opcodes_h_l2581_c11_c6c4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2581_c11_c6c4_left,
BIN_OP_EQ_uxn_opcodes_h_l2581_c11_c6c4_right,
BIN_OP_EQ_uxn_opcodes_h_l2581_c11_c6c4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c1_d7a6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c1_d7a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c1_d7a6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c1_d7a6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c1_d7a6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c1_d7a6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c7_8b31
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c7_8b31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c7_8b31_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c7_8b31_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c7_8b31_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c7_8b31_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2581_c7_f736
opc_result_MUX_uxn_opcodes_h_l2581_c7_f736 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2581_c7_f736_cond,
opc_result_MUX_uxn_opcodes_h_l2581_c7_f736_iftrue,
opc_result_MUX_uxn_opcodes_h_l2581_c7_f736_iffalse,
opc_result_MUX_uxn_opcodes_h_l2581_c7_f736_return_output);

-- ldr2_uxn_opcodes_h_l2581_c40_4b84
ldr2_uxn_opcodes_h_l2581_c40_4b84 : entity work.ldr2_0CLK_47454ab1 port map (
clk,
ldr2_uxn_opcodes_h_l2581_c40_4b84_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l2581_c40_4b84_phase,
ldr2_uxn_opcodes_h_l2581_c40_4b84_ins,
ldr2_uxn_opcodes_h_l2581_c40_4b84_pc,
ldr2_uxn_opcodes_h_l2581_c40_4b84_previous_stack_read,
ldr2_uxn_opcodes_h_l2581_c40_4b84_previous_ram_read,
ldr2_uxn_opcodes_h_l2581_c40_4b84_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2582_c11_f4de
BIN_OP_EQ_uxn_opcodes_h_l2582_c11_f4de : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2582_c11_f4de_left,
BIN_OP_EQ_uxn_opcodes_h_l2582_c11_f4de_right,
BIN_OP_EQ_uxn_opcodes_h_l2582_c11_f4de_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c1_d8f7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c1_d8f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c1_d8f7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c1_d8f7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c1_d8f7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c1_d8f7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c7_43f0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c7_43f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c7_43f0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c7_43f0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c7_43f0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c7_43f0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2582_c7_8b31
opc_result_MUX_uxn_opcodes_h_l2582_c7_8b31 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2582_c7_8b31_cond,
opc_result_MUX_uxn_opcodes_h_l2582_c7_8b31_iftrue,
opc_result_MUX_uxn_opcodes_h_l2582_c7_8b31_iffalse,
opc_result_MUX_uxn_opcodes_h_l2582_c7_8b31_return_output);

-- str1_uxn_opcodes_h_l2582_c40_9cb6
str1_uxn_opcodes_h_l2582_c40_9cb6 : entity work.str1_0CLK_64d180f1 port map (
clk,
str1_uxn_opcodes_h_l2582_c40_9cb6_CLOCK_ENABLE,
str1_uxn_opcodes_h_l2582_c40_9cb6_phase,
str1_uxn_opcodes_h_l2582_c40_9cb6_ins,
str1_uxn_opcodes_h_l2582_c40_9cb6_pc,
str1_uxn_opcodes_h_l2582_c40_9cb6_previous_stack_read,
str1_uxn_opcodes_h_l2582_c40_9cb6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2583_c11_1ef8
BIN_OP_EQ_uxn_opcodes_h_l2583_c11_1ef8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2583_c11_1ef8_left,
BIN_OP_EQ_uxn_opcodes_h_l2583_c11_1ef8_right,
BIN_OP_EQ_uxn_opcodes_h_l2583_c11_1ef8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c1_670f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c1_670f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c1_670f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c1_670f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c1_670f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c1_670f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c7_ff57
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c7_ff57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c7_ff57_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c7_ff57_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c7_ff57_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c7_ff57_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2583_c7_43f0
opc_result_MUX_uxn_opcodes_h_l2583_c7_43f0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2583_c7_43f0_cond,
opc_result_MUX_uxn_opcodes_h_l2583_c7_43f0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2583_c7_43f0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2583_c7_43f0_return_output);

-- str2_uxn_opcodes_h_l2583_c40_2538
str2_uxn_opcodes_h_l2583_c40_2538 : entity work.str2_0CLK_dd8f5d52 port map (
clk,
str2_uxn_opcodes_h_l2583_c40_2538_CLOCK_ENABLE,
str2_uxn_opcodes_h_l2583_c40_2538_phase,
str2_uxn_opcodes_h_l2583_c40_2538_ins,
str2_uxn_opcodes_h_l2583_c40_2538_pc,
str2_uxn_opcodes_h_l2583_c40_2538_previous_stack_read,
str2_uxn_opcodes_h_l2583_c40_2538_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2584_c11_4d63
BIN_OP_EQ_uxn_opcodes_h_l2584_c11_4d63 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2584_c11_4d63_left,
BIN_OP_EQ_uxn_opcodes_h_l2584_c11_4d63_right,
BIN_OP_EQ_uxn_opcodes_h_l2584_c11_4d63_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c1_0ae6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c1_0ae6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c1_0ae6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c1_0ae6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c1_0ae6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c1_0ae6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c7_955d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c7_955d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c7_955d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c7_955d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c7_955d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c7_955d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2584_c7_ff57
opc_result_MUX_uxn_opcodes_h_l2584_c7_ff57 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2584_c7_ff57_cond,
opc_result_MUX_uxn_opcodes_h_l2584_c7_ff57_iftrue,
opc_result_MUX_uxn_opcodes_h_l2584_c7_ff57_iffalse,
opc_result_MUX_uxn_opcodes_h_l2584_c7_ff57_return_output);

-- lda_uxn_opcodes_h_l2584_c40_8757
lda_uxn_opcodes_h_l2584_c40_8757 : entity work.lda_0CLK_5e3bbf52 port map (
clk,
lda_uxn_opcodes_h_l2584_c40_8757_CLOCK_ENABLE,
lda_uxn_opcodes_h_l2584_c40_8757_phase,
lda_uxn_opcodes_h_l2584_c40_8757_ins,
lda_uxn_opcodes_h_l2584_c40_8757_previous_stack_read,
lda_uxn_opcodes_h_l2584_c40_8757_previous_ram_read,
lda_uxn_opcodes_h_l2584_c40_8757_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2585_c11_ce36
BIN_OP_EQ_uxn_opcodes_h_l2585_c11_ce36 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2585_c11_ce36_left,
BIN_OP_EQ_uxn_opcodes_h_l2585_c11_ce36_right,
BIN_OP_EQ_uxn_opcodes_h_l2585_c11_ce36_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c1_95e2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c1_95e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c1_95e2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c1_95e2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c1_95e2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c1_95e2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c7_205c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c7_205c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c7_205c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c7_205c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c7_205c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c7_205c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2585_c7_955d
opc_result_MUX_uxn_opcodes_h_l2585_c7_955d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2585_c7_955d_cond,
opc_result_MUX_uxn_opcodes_h_l2585_c7_955d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2585_c7_955d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2585_c7_955d_return_output);

-- lda2_uxn_opcodes_h_l2585_c40_36dd
lda2_uxn_opcodes_h_l2585_c40_36dd : entity work.lda2_0CLK_36dfad59 port map (
clk,
lda2_uxn_opcodes_h_l2585_c40_36dd_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l2585_c40_36dd_phase,
lda2_uxn_opcodes_h_l2585_c40_36dd_ins,
lda2_uxn_opcodes_h_l2585_c40_36dd_previous_stack_read,
lda2_uxn_opcodes_h_l2585_c40_36dd_previous_ram_read,
lda2_uxn_opcodes_h_l2585_c40_36dd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2586_c11_b7cd
BIN_OP_EQ_uxn_opcodes_h_l2586_c11_b7cd : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2586_c11_b7cd_left,
BIN_OP_EQ_uxn_opcodes_h_l2586_c11_b7cd_right,
BIN_OP_EQ_uxn_opcodes_h_l2586_c11_b7cd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c1_c3d1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c1_c3d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c1_c3d1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c1_c3d1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c1_c3d1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c1_c3d1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c7_9db0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c7_9db0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c7_9db0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c7_9db0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c7_9db0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c7_9db0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2586_c7_205c
opc_result_MUX_uxn_opcodes_h_l2586_c7_205c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2586_c7_205c_cond,
opc_result_MUX_uxn_opcodes_h_l2586_c7_205c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2586_c7_205c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2586_c7_205c_return_output);

-- sta_uxn_opcodes_h_l2586_c40_c4ac
sta_uxn_opcodes_h_l2586_c40_c4ac : entity work.sta_0CLK_9159c4aa port map (
clk,
sta_uxn_opcodes_h_l2586_c40_c4ac_CLOCK_ENABLE,
sta_uxn_opcodes_h_l2586_c40_c4ac_phase,
sta_uxn_opcodes_h_l2586_c40_c4ac_ins,
sta_uxn_opcodes_h_l2586_c40_c4ac_previous_stack_read,
sta_uxn_opcodes_h_l2586_c40_c4ac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2587_c11_5dab
BIN_OP_EQ_uxn_opcodes_h_l2587_c11_5dab : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2587_c11_5dab_left,
BIN_OP_EQ_uxn_opcodes_h_l2587_c11_5dab_right,
BIN_OP_EQ_uxn_opcodes_h_l2587_c11_5dab_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c1_f247
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c1_f247 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c1_f247_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c1_f247_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c1_f247_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c1_f247_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c7_474f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c7_474f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c7_474f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c7_474f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c7_474f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c7_474f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2587_c7_9db0
opc_result_MUX_uxn_opcodes_h_l2587_c7_9db0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2587_c7_9db0_cond,
opc_result_MUX_uxn_opcodes_h_l2587_c7_9db0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2587_c7_9db0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2587_c7_9db0_return_output);

-- sta2_uxn_opcodes_h_l2587_c40_e790
sta2_uxn_opcodes_h_l2587_c40_e790 : entity work.sta2_0CLK_bce25fe8 port map (
clk,
sta2_uxn_opcodes_h_l2587_c40_e790_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l2587_c40_e790_phase,
sta2_uxn_opcodes_h_l2587_c40_e790_ins,
sta2_uxn_opcodes_h_l2587_c40_e790_previous_stack_read,
sta2_uxn_opcodes_h_l2587_c40_e790_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2588_c11_7def
BIN_OP_EQ_uxn_opcodes_h_l2588_c11_7def : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2588_c11_7def_left,
BIN_OP_EQ_uxn_opcodes_h_l2588_c11_7def_right,
BIN_OP_EQ_uxn_opcodes_h_l2588_c11_7def_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c1_92e3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c1_92e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c1_92e3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c1_92e3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c1_92e3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c1_92e3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c7_5280
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c7_5280 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c7_5280_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c7_5280_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c7_5280_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c7_5280_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2588_c7_474f
opc_result_MUX_uxn_opcodes_h_l2588_c7_474f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2588_c7_474f_cond,
opc_result_MUX_uxn_opcodes_h_l2588_c7_474f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2588_c7_474f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2588_c7_474f_return_output);

-- dei_uxn_opcodes_h_l2588_c40_69c1
dei_uxn_opcodes_h_l2588_c40_69c1 : entity work.dei_0CLK_fcb212cd port map (
clk,
dei_uxn_opcodes_h_l2588_c40_69c1_CLOCK_ENABLE,
dei_uxn_opcodes_h_l2588_c40_69c1_phase,
dei_uxn_opcodes_h_l2588_c40_69c1_ins,
dei_uxn_opcodes_h_l2588_c40_69c1_previous_stack_read,
dei_uxn_opcodes_h_l2588_c40_69c1_previous_device_ram_read,
dei_uxn_opcodes_h_l2588_c40_69c1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2589_c11_d95c
BIN_OP_EQ_uxn_opcodes_h_l2589_c11_d95c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2589_c11_d95c_left,
BIN_OP_EQ_uxn_opcodes_h_l2589_c11_d95c_right,
BIN_OP_EQ_uxn_opcodes_h_l2589_c11_d95c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c1_b6d3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c1_b6d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c1_b6d3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c1_b6d3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c1_b6d3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c1_b6d3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c7_157b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c7_157b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c7_157b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c7_157b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c7_157b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c7_157b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2589_c7_5280
opc_result_MUX_uxn_opcodes_h_l2589_c7_5280 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2589_c7_5280_cond,
opc_result_MUX_uxn_opcodes_h_l2589_c7_5280_iftrue,
opc_result_MUX_uxn_opcodes_h_l2589_c7_5280_iffalse,
opc_result_MUX_uxn_opcodes_h_l2589_c7_5280_return_output);

-- dei2_uxn_opcodes_h_l2589_c40_a853
dei2_uxn_opcodes_h_l2589_c40_a853 : entity work.dei2_0CLK_22d8dfe9 port map (
clk,
dei2_uxn_opcodes_h_l2589_c40_a853_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l2589_c40_a853_phase,
dei2_uxn_opcodes_h_l2589_c40_a853_ins,
dei2_uxn_opcodes_h_l2589_c40_a853_previous_stack_read,
dei2_uxn_opcodes_h_l2589_c40_a853_previous_device_ram_read,
dei2_uxn_opcodes_h_l2589_c40_a853_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2590_c11_eb97
BIN_OP_EQ_uxn_opcodes_h_l2590_c11_eb97 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2590_c11_eb97_left,
BIN_OP_EQ_uxn_opcodes_h_l2590_c11_eb97_right,
BIN_OP_EQ_uxn_opcodes_h_l2590_c11_eb97_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c1_4287
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c1_4287 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c1_4287_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c1_4287_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c1_4287_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c1_4287_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c7_7683
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c7_7683 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c7_7683_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c7_7683_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c7_7683_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c7_7683_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2590_c7_157b
opc_result_MUX_uxn_opcodes_h_l2590_c7_157b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2590_c7_157b_cond,
opc_result_MUX_uxn_opcodes_h_l2590_c7_157b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2590_c7_157b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2590_c7_157b_return_output);

-- deo_uxn_opcodes_h_l2590_c40_7c9c
deo_uxn_opcodes_h_l2590_c40_7c9c : entity work.deo_0CLK_da9cb8d4 port map (
clk,
deo_uxn_opcodes_h_l2590_c40_7c9c_CLOCK_ENABLE,
deo_uxn_opcodes_h_l2590_c40_7c9c_phase,
deo_uxn_opcodes_h_l2590_c40_7c9c_ins,
deo_uxn_opcodes_h_l2590_c40_7c9c_previous_stack_read,
deo_uxn_opcodes_h_l2590_c40_7c9c_previous_device_ram_read,
deo_uxn_opcodes_h_l2590_c40_7c9c_previous_ram_read,
deo_uxn_opcodes_h_l2590_c40_7c9c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2591_c11_8041
BIN_OP_EQ_uxn_opcodes_h_l2591_c11_8041 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2591_c11_8041_left,
BIN_OP_EQ_uxn_opcodes_h_l2591_c11_8041_right,
BIN_OP_EQ_uxn_opcodes_h_l2591_c11_8041_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c1_d2d1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c1_d2d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c1_d2d1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c1_d2d1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c1_d2d1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c1_d2d1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c7_9ad0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c7_9ad0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c7_9ad0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c7_9ad0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c7_9ad0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c7_9ad0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2591_c7_7683
opc_result_MUX_uxn_opcodes_h_l2591_c7_7683 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2591_c7_7683_cond,
opc_result_MUX_uxn_opcodes_h_l2591_c7_7683_iftrue,
opc_result_MUX_uxn_opcodes_h_l2591_c7_7683_iffalse,
opc_result_MUX_uxn_opcodes_h_l2591_c7_7683_return_output);

-- deo2_uxn_opcodes_h_l2591_c40_6834
deo2_uxn_opcodes_h_l2591_c40_6834 : entity work.deo2_0CLK_122ec5f5 port map (
clk,
deo2_uxn_opcodes_h_l2591_c40_6834_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l2591_c40_6834_phase,
deo2_uxn_opcodes_h_l2591_c40_6834_ins,
deo2_uxn_opcodes_h_l2591_c40_6834_previous_stack_read,
deo2_uxn_opcodes_h_l2591_c40_6834_previous_device_ram_read,
deo2_uxn_opcodes_h_l2591_c40_6834_previous_ram_read,
deo2_uxn_opcodes_h_l2591_c40_6834_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2592_c11_4fde
BIN_OP_EQ_uxn_opcodes_h_l2592_c11_4fde : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2592_c11_4fde_left,
BIN_OP_EQ_uxn_opcodes_h_l2592_c11_4fde_right,
BIN_OP_EQ_uxn_opcodes_h_l2592_c11_4fde_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c1_3b5a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c1_3b5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c1_3b5a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c1_3b5a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c1_3b5a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c1_3b5a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c7_498d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c7_498d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c7_498d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c7_498d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c7_498d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c7_498d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2592_c7_9ad0
opc_result_MUX_uxn_opcodes_h_l2592_c7_9ad0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2592_c7_9ad0_cond,
opc_result_MUX_uxn_opcodes_h_l2592_c7_9ad0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2592_c7_9ad0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2592_c7_9ad0_return_output);

-- add_uxn_opcodes_h_l2592_c40_97de
add_uxn_opcodes_h_l2592_c40_97de : entity work.add_0CLK_7883ef49 port map (
clk,
add_uxn_opcodes_h_l2592_c40_97de_CLOCK_ENABLE,
add_uxn_opcodes_h_l2592_c40_97de_phase,
add_uxn_opcodes_h_l2592_c40_97de_ins,
add_uxn_opcodes_h_l2592_c40_97de_previous_stack_read,
add_uxn_opcodes_h_l2592_c40_97de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2593_c11_74c9
BIN_OP_EQ_uxn_opcodes_h_l2593_c11_74c9 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2593_c11_74c9_left,
BIN_OP_EQ_uxn_opcodes_h_l2593_c11_74c9_right,
BIN_OP_EQ_uxn_opcodes_h_l2593_c11_74c9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c1_d3cb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c1_d3cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c1_d3cb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c1_d3cb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c1_d3cb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c1_d3cb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c7_ea71
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c7_ea71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c7_ea71_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c7_ea71_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c7_ea71_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c7_ea71_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2593_c7_498d
opc_result_MUX_uxn_opcodes_h_l2593_c7_498d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2593_c7_498d_cond,
opc_result_MUX_uxn_opcodes_h_l2593_c7_498d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2593_c7_498d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2593_c7_498d_return_output);

-- add2_uxn_opcodes_h_l2593_c40_b951
add2_uxn_opcodes_h_l2593_c40_b951 : entity work.add2_0CLK_06b39b76 port map (
clk,
add2_uxn_opcodes_h_l2593_c40_b951_CLOCK_ENABLE,
add2_uxn_opcodes_h_l2593_c40_b951_phase,
add2_uxn_opcodes_h_l2593_c40_b951_ins,
add2_uxn_opcodes_h_l2593_c40_b951_previous_stack_read,
add2_uxn_opcodes_h_l2593_c40_b951_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2594_c11_1cbf
BIN_OP_EQ_uxn_opcodes_h_l2594_c11_1cbf : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2594_c11_1cbf_left,
BIN_OP_EQ_uxn_opcodes_h_l2594_c11_1cbf_right,
BIN_OP_EQ_uxn_opcodes_h_l2594_c11_1cbf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c1_8c8e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c1_8c8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c1_8c8e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c1_8c8e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c1_8c8e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c1_8c8e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c7_b70d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c7_b70d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c7_b70d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c7_b70d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c7_b70d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c7_b70d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2594_c7_ea71
opc_result_MUX_uxn_opcodes_h_l2594_c7_ea71 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2594_c7_ea71_cond,
opc_result_MUX_uxn_opcodes_h_l2594_c7_ea71_iftrue,
opc_result_MUX_uxn_opcodes_h_l2594_c7_ea71_iffalse,
opc_result_MUX_uxn_opcodes_h_l2594_c7_ea71_return_output);

-- sub_uxn_opcodes_h_l2594_c40_3537
sub_uxn_opcodes_h_l2594_c40_3537 : entity work.sub_0CLK_7883ef49 port map (
clk,
sub_uxn_opcodes_h_l2594_c40_3537_CLOCK_ENABLE,
sub_uxn_opcodes_h_l2594_c40_3537_phase,
sub_uxn_opcodes_h_l2594_c40_3537_ins,
sub_uxn_opcodes_h_l2594_c40_3537_previous_stack_read,
sub_uxn_opcodes_h_l2594_c40_3537_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2595_c11_f255
BIN_OP_EQ_uxn_opcodes_h_l2595_c11_f255 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2595_c11_f255_left,
BIN_OP_EQ_uxn_opcodes_h_l2595_c11_f255_right,
BIN_OP_EQ_uxn_opcodes_h_l2595_c11_f255_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c1_2988
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c1_2988 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c1_2988_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c1_2988_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c1_2988_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c1_2988_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c7_2426
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c7_2426 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c7_2426_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c7_2426_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c7_2426_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c7_2426_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2595_c7_b70d
opc_result_MUX_uxn_opcodes_h_l2595_c7_b70d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2595_c7_b70d_cond,
opc_result_MUX_uxn_opcodes_h_l2595_c7_b70d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2595_c7_b70d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2595_c7_b70d_return_output);

-- sub2_uxn_opcodes_h_l2595_c40_50bd
sub2_uxn_opcodes_h_l2595_c40_50bd : entity work.sub2_0CLK_06b39b76 port map (
clk,
sub2_uxn_opcodes_h_l2595_c40_50bd_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l2595_c40_50bd_phase,
sub2_uxn_opcodes_h_l2595_c40_50bd_ins,
sub2_uxn_opcodes_h_l2595_c40_50bd_previous_stack_read,
sub2_uxn_opcodes_h_l2595_c40_50bd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2596_c11_d91e
BIN_OP_EQ_uxn_opcodes_h_l2596_c11_d91e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2596_c11_d91e_left,
BIN_OP_EQ_uxn_opcodes_h_l2596_c11_d91e_right,
BIN_OP_EQ_uxn_opcodes_h_l2596_c11_d91e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c1_9856
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c1_9856 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c1_9856_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c1_9856_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c1_9856_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c1_9856_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c7_c0ec
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c7_c0ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c7_c0ec_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c7_c0ec_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c7_c0ec_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c7_c0ec_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2596_c7_2426
opc_result_MUX_uxn_opcodes_h_l2596_c7_2426 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2596_c7_2426_cond,
opc_result_MUX_uxn_opcodes_h_l2596_c7_2426_iftrue,
opc_result_MUX_uxn_opcodes_h_l2596_c7_2426_iffalse,
opc_result_MUX_uxn_opcodes_h_l2596_c7_2426_return_output);

-- mul_uxn_opcodes_h_l2596_c40_feff
mul_uxn_opcodes_h_l2596_c40_feff : entity work.mul_0CLK_7883ef49 port map (
clk,
mul_uxn_opcodes_h_l2596_c40_feff_CLOCK_ENABLE,
mul_uxn_opcodes_h_l2596_c40_feff_phase,
mul_uxn_opcodes_h_l2596_c40_feff_ins,
mul_uxn_opcodes_h_l2596_c40_feff_previous_stack_read,
mul_uxn_opcodes_h_l2596_c40_feff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2597_c11_1e97
BIN_OP_EQ_uxn_opcodes_h_l2597_c11_1e97 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2597_c11_1e97_left,
BIN_OP_EQ_uxn_opcodes_h_l2597_c11_1e97_right,
BIN_OP_EQ_uxn_opcodes_h_l2597_c11_1e97_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c1_38b1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c1_38b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c1_38b1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c1_38b1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c1_38b1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c1_38b1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c7_f595
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c7_f595 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c7_f595_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c7_f595_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c7_f595_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c7_f595_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2597_c7_c0ec
opc_result_MUX_uxn_opcodes_h_l2597_c7_c0ec : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2597_c7_c0ec_cond,
opc_result_MUX_uxn_opcodes_h_l2597_c7_c0ec_iftrue,
opc_result_MUX_uxn_opcodes_h_l2597_c7_c0ec_iffalse,
opc_result_MUX_uxn_opcodes_h_l2597_c7_c0ec_return_output);

-- mul2_uxn_opcodes_h_l2597_c40_9413
mul2_uxn_opcodes_h_l2597_c40_9413 : entity work.mul2_0CLK_06b39b76 port map (
clk,
mul2_uxn_opcodes_h_l2597_c40_9413_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l2597_c40_9413_phase,
mul2_uxn_opcodes_h_l2597_c40_9413_ins,
mul2_uxn_opcodes_h_l2597_c40_9413_previous_stack_read,
mul2_uxn_opcodes_h_l2597_c40_9413_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2598_c11_0f1f
BIN_OP_EQ_uxn_opcodes_h_l2598_c11_0f1f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2598_c11_0f1f_left,
BIN_OP_EQ_uxn_opcodes_h_l2598_c11_0f1f_right,
BIN_OP_EQ_uxn_opcodes_h_l2598_c11_0f1f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c1_ccf5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c1_ccf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c1_ccf5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c1_ccf5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c1_ccf5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c1_ccf5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c7_1fbf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c7_1fbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c7_1fbf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c7_1fbf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c7_1fbf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c7_1fbf_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2598_c7_f595
opc_result_MUX_uxn_opcodes_h_l2598_c7_f595 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2598_c7_f595_cond,
opc_result_MUX_uxn_opcodes_h_l2598_c7_f595_iftrue,
opc_result_MUX_uxn_opcodes_h_l2598_c7_f595_iffalse,
opc_result_MUX_uxn_opcodes_h_l2598_c7_f595_return_output);

-- div_uxn_opcodes_h_l2598_c40_cc14
div_uxn_opcodes_h_l2598_c40_cc14 : entity work.div_0CLK_2426f54f port map (
clk,
div_uxn_opcodes_h_l2598_c40_cc14_CLOCK_ENABLE,
div_uxn_opcodes_h_l2598_c40_cc14_phase,
div_uxn_opcodes_h_l2598_c40_cc14_ins,
div_uxn_opcodes_h_l2598_c40_cc14_previous_stack_read,
div_uxn_opcodes_h_l2598_c40_cc14_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2599_c11_540a
BIN_OP_EQ_uxn_opcodes_h_l2599_c11_540a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2599_c11_540a_left,
BIN_OP_EQ_uxn_opcodes_h_l2599_c11_540a_right,
BIN_OP_EQ_uxn_opcodes_h_l2599_c11_540a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c1_2417
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c1_2417 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c1_2417_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c1_2417_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c1_2417_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c1_2417_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c7_683b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c7_683b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c7_683b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c7_683b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c7_683b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c7_683b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2599_c7_1fbf
opc_result_MUX_uxn_opcodes_h_l2599_c7_1fbf : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2599_c7_1fbf_cond,
opc_result_MUX_uxn_opcodes_h_l2599_c7_1fbf_iftrue,
opc_result_MUX_uxn_opcodes_h_l2599_c7_1fbf_iffalse,
opc_result_MUX_uxn_opcodes_h_l2599_c7_1fbf_return_output);

-- div2_uxn_opcodes_h_l2599_c40_3dd1
div2_uxn_opcodes_h_l2599_c40_3dd1 : entity work.div2_0CLK_4496d276 port map (
clk,
div2_uxn_opcodes_h_l2599_c40_3dd1_CLOCK_ENABLE,
div2_uxn_opcodes_h_l2599_c40_3dd1_phase,
div2_uxn_opcodes_h_l2599_c40_3dd1_ins,
div2_uxn_opcodes_h_l2599_c40_3dd1_previous_stack_read,
div2_uxn_opcodes_h_l2599_c40_3dd1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2600_c11_6438
BIN_OP_EQ_uxn_opcodes_h_l2600_c11_6438 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2600_c11_6438_left,
BIN_OP_EQ_uxn_opcodes_h_l2600_c11_6438_right,
BIN_OP_EQ_uxn_opcodes_h_l2600_c11_6438_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_84ac
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_84ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_84ac_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_84ac_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_84ac_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_84ac_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c7_1efa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c7_1efa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c7_1efa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c7_1efa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c7_1efa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c7_1efa_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2600_c7_683b
opc_result_MUX_uxn_opcodes_h_l2600_c7_683b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2600_c7_683b_cond,
opc_result_MUX_uxn_opcodes_h_l2600_c7_683b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2600_c7_683b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2600_c7_683b_return_output);

-- and_uxn_opcodes_h_l2600_c40_3c81
and_uxn_opcodes_h_l2600_c40_3c81 : entity work.and_0CLK_7883ef49 port map (
clk,
and_uxn_opcodes_h_l2600_c40_3c81_CLOCK_ENABLE,
and_uxn_opcodes_h_l2600_c40_3c81_phase,
and_uxn_opcodes_h_l2600_c40_3c81_ins,
and_uxn_opcodes_h_l2600_c40_3c81_previous_stack_read,
and_uxn_opcodes_h_l2600_c40_3c81_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2601_c11_ff18
BIN_OP_EQ_uxn_opcodes_h_l2601_c11_ff18 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2601_c11_ff18_left,
BIN_OP_EQ_uxn_opcodes_h_l2601_c11_ff18_right,
BIN_OP_EQ_uxn_opcodes_h_l2601_c11_ff18_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c1_0b00
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c1_0b00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c1_0b00_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c1_0b00_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c1_0b00_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c1_0b00_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c7_620a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c7_620a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c7_620a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c7_620a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c7_620a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c7_620a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2601_c7_1efa
opc_result_MUX_uxn_opcodes_h_l2601_c7_1efa : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2601_c7_1efa_cond,
opc_result_MUX_uxn_opcodes_h_l2601_c7_1efa_iftrue,
opc_result_MUX_uxn_opcodes_h_l2601_c7_1efa_iffalse,
opc_result_MUX_uxn_opcodes_h_l2601_c7_1efa_return_output);

-- and2_uxn_opcodes_h_l2601_c40_991a
and2_uxn_opcodes_h_l2601_c40_991a : entity work.and2_0CLK_9159c4aa port map (
clk,
and2_uxn_opcodes_h_l2601_c40_991a_CLOCK_ENABLE,
and2_uxn_opcodes_h_l2601_c40_991a_phase,
and2_uxn_opcodes_h_l2601_c40_991a_ins,
and2_uxn_opcodes_h_l2601_c40_991a_previous_stack_read,
and2_uxn_opcodes_h_l2601_c40_991a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2602_c11_d90e
BIN_OP_EQ_uxn_opcodes_h_l2602_c11_d90e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2602_c11_d90e_left,
BIN_OP_EQ_uxn_opcodes_h_l2602_c11_d90e_right,
BIN_OP_EQ_uxn_opcodes_h_l2602_c11_d90e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c1_180f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c1_180f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c1_180f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c1_180f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c1_180f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c1_180f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c7_5e21
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c7_5e21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c7_5e21_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c7_5e21_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c7_5e21_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c7_5e21_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2602_c7_620a
opc_result_MUX_uxn_opcodes_h_l2602_c7_620a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2602_c7_620a_cond,
opc_result_MUX_uxn_opcodes_h_l2602_c7_620a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2602_c7_620a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2602_c7_620a_return_output);

-- ora_uxn_opcodes_h_l2602_c40_ceea
ora_uxn_opcodes_h_l2602_c40_ceea : entity work.ora_0CLK_7883ef49 port map (
clk,
ora_uxn_opcodes_h_l2602_c40_ceea_CLOCK_ENABLE,
ora_uxn_opcodes_h_l2602_c40_ceea_phase,
ora_uxn_opcodes_h_l2602_c40_ceea_ins,
ora_uxn_opcodes_h_l2602_c40_ceea_previous_stack_read,
ora_uxn_opcodes_h_l2602_c40_ceea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2603_c11_ff07
BIN_OP_EQ_uxn_opcodes_h_l2603_c11_ff07 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2603_c11_ff07_left,
BIN_OP_EQ_uxn_opcodes_h_l2603_c11_ff07_right,
BIN_OP_EQ_uxn_opcodes_h_l2603_c11_ff07_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_d680
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_d680 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_d680_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_d680_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_d680_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_d680_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c7_1270
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c7_1270 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c7_1270_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c7_1270_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c7_1270_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c7_1270_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2603_c7_5e21
opc_result_MUX_uxn_opcodes_h_l2603_c7_5e21 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2603_c7_5e21_cond,
opc_result_MUX_uxn_opcodes_h_l2603_c7_5e21_iftrue,
opc_result_MUX_uxn_opcodes_h_l2603_c7_5e21_iffalse,
opc_result_MUX_uxn_opcodes_h_l2603_c7_5e21_return_output);

-- ora2_uxn_opcodes_h_l2603_c40_b642
ora2_uxn_opcodes_h_l2603_c40_b642 : entity work.ora2_0CLK_06b39b76 port map (
clk,
ora2_uxn_opcodes_h_l2603_c40_b642_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l2603_c40_b642_phase,
ora2_uxn_opcodes_h_l2603_c40_b642_ins,
ora2_uxn_opcodes_h_l2603_c40_b642_previous_stack_read,
ora2_uxn_opcodes_h_l2603_c40_b642_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b354
BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b354 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b354_left,
BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b354_right,
BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b354_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c1_0fac
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c1_0fac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c1_0fac_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c1_0fac_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c1_0fac_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c1_0fac_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c7_5e80
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c7_5e80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c7_5e80_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c7_5e80_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c7_5e80_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c7_5e80_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2604_c7_1270
opc_result_MUX_uxn_opcodes_h_l2604_c7_1270 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2604_c7_1270_cond,
opc_result_MUX_uxn_opcodes_h_l2604_c7_1270_iftrue,
opc_result_MUX_uxn_opcodes_h_l2604_c7_1270_iffalse,
opc_result_MUX_uxn_opcodes_h_l2604_c7_1270_return_output);

-- eor_uxn_opcodes_h_l2604_c40_8850
eor_uxn_opcodes_h_l2604_c40_8850 : entity work.eor_0CLK_7883ef49 port map (
clk,
eor_uxn_opcodes_h_l2604_c40_8850_CLOCK_ENABLE,
eor_uxn_opcodes_h_l2604_c40_8850_phase,
eor_uxn_opcodes_h_l2604_c40_8850_ins,
eor_uxn_opcodes_h_l2604_c40_8850_previous_stack_read,
eor_uxn_opcodes_h_l2604_c40_8850_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2605_c11_d529
BIN_OP_EQ_uxn_opcodes_h_l2605_c11_d529 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2605_c11_d529_left,
BIN_OP_EQ_uxn_opcodes_h_l2605_c11_d529_right,
BIN_OP_EQ_uxn_opcodes_h_l2605_c11_d529_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c1_0a11
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c1_0a11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c1_0a11_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c1_0a11_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c1_0a11_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c1_0a11_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c7_2198
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c7_2198 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c7_2198_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c7_2198_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c7_2198_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c7_2198_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2605_c7_5e80
opc_result_MUX_uxn_opcodes_h_l2605_c7_5e80 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2605_c7_5e80_cond,
opc_result_MUX_uxn_opcodes_h_l2605_c7_5e80_iftrue,
opc_result_MUX_uxn_opcodes_h_l2605_c7_5e80_iffalse,
opc_result_MUX_uxn_opcodes_h_l2605_c7_5e80_return_output);

-- eor2_uxn_opcodes_h_l2605_c40_71d3
eor2_uxn_opcodes_h_l2605_c40_71d3 : entity work.eor2_0CLK_06b39b76 port map (
clk,
eor2_uxn_opcodes_h_l2605_c40_71d3_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l2605_c40_71d3_phase,
eor2_uxn_opcodes_h_l2605_c40_71d3_ins,
eor2_uxn_opcodes_h_l2605_c40_71d3_previous_stack_read,
eor2_uxn_opcodes_h_l2605_c40_71d3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f0c7
BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f0c7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f0c7_left,
BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f0c7_right,
BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f0c7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c1_d368
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c1_d368 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c1_d368_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c1_d368_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c1_d368_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c1_d368_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c7_a5d0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c7_a5d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c7_a5d0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c7_a5d0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c7_a5d0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c7_a5d0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2606_c7_2198
opc_result_MUX_uxn_opcodes_h_l2606_c7_2198 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2606_c7_2198_cond,
opc_result_MUX_uxn_opcodes_h_l2606_c7_2198_iftrue,
opc_result_MUX_uxn_opcodes_h_l2606_c7_2198_iffalse,
opc_result_MUX_uxn_opcodes_h_l2606_c7_2198_return_output);

-- sft_uxn_opcodes_h_l2606_c40_5c65
sft_uxn_opcodes_h_l2606_c40_5c65 : entity work.sft_0CLK_bfe1abba port map (
clk,
sft_uxn_opcodes_h_l2606_c40_5c65_CLOCK_ENABLE,
sft_uxn_opcodes_h_l2606_c40_5c65_phase,
sft_uxn_opcodes_h_l2606_c40_5c65_ins,
sft_uxn_opcodes_h_l2606_c40_5c65_previous_stack_read,
sft_uxn_opcodes_h_l2606_c40_5c65_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2607_c11_be22
BIN_OP_EQ_uxn_opcodes_h_l2607_c11_be22 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2607_c11_be22_left,
BIN_OP_EQ_uxn_opcodes_h_l2607_c11_be22_right,
BIN_OP_EQ_uxn_opcodes_h_l2607_c11_be22_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c1_b90f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c1_b90f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c1_b90f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c1_b90f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c1_b90f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c1_b90f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2607_c7_a5d0
opc_result_MUX_uxn_opcodes_h_l2607_c7_a5d0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2607_c7_a5d0_cond,
opc_result_MUX_uxn_opcodes_h_l2607_c7_a5d0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2607_c7_a5d0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2607_c7_a5d0_return_output);

-- sft2_uxn_opcodes_h_l2607_c40_c639
sft2_uxn_opcodes_h_l2607_c40_c639 : entity work.sft2_0CLK_91f0cf2d port map (
clk,
sft2_uxn_opcodes_h_l2607_c40_c639_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l2607_c40_c639_phase,
sft2_uxn_opcodes_h_l2607_c40_c639_ins,
sft2_uxn_opcodes_h_l2607_c40_c639_previous_stack_read,
sft2_uxn_opcodes_h_l2607_c40_c639_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2609_c18_318d
BIN_OP_AND_uxn_opcodes_h_l2609_c18_318d : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2609_c18_318d_left,
BIN_OP_AND_uxn_opcodes_h_l2609_c18_318d_right,
BIN_OP_AND_uxn_opcodes_h_l2609_c18_318d_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2609_c18_2605
BIN_OP_GT_uxn_opcodes_h_l2609_c18_2605 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2609_c18_2605_left,
BIN_OP_GT_uxn_opcodes_h_l2609_c18_2605_right,
BIN_OP_GT_uxn_opcodes_h_l2609_c18_2605_return_output);

-- MUX_uxn_opcodes_h_l2609_c18_9746
MUX_uxn_opcodes_h_l2609_c18_9746 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2609_c18_9746_cond,
MUX_uxn_opcodes_h_l2609_c18_9746_iftrue,
MUX_uxn_opcodes_h_l2609_c18_9746_iffalse,
MUX_uxn_opcodes_h_l2609_c18_9746_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2610_c2_a2ec
BIN_OP_XOR_uxn_opcodes_h_l2610_c2_a2ec : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2610_c2_a2ec_left,
BIN_OP_XOR_uxn_opcodes_h_l2610_c2_a2ec_right,
BIN_OP_XOR_uxn_opcodes_h_l2610_c2_a2ec_return_output);

-- sp0_MUX_uxn_opcodes_h_l2612_c2_2c8f
sp0_MUX_uxn_opcodes_h_l2612_c2_2c8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2612_c2_2c8f_cond,
sp0_MUX_uxn_opcodes_h_l2612_c2_2c8f_iftrue,
sp0_MUX_uxn_opcodes_h_l2612_c2_2c8f_iffalse,
sp0_MUX_uxn_opcodes_h_l2612_c2_2c8f_return_output);

-- sp1_MUX_uxn_opcodes_h_l2612_c2_2c8f
sp1_MUX_uxn_opcodes_h_l2612_c2_2c8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2612_c2_2c8f_cond,
sp1_MUX_uxn_opcodes_h_l2612_c2_2c8f_iftrue,
sp1_MUX_uxn_opcodes_h_l2612_c2_2c8f_iffalse,
sp1_MUX_uxn_opcodes_h_l2612_c2_2c8f_return_output);

-- sp0_MUX_uxn_opcodes_h_l2613_c3_5b0b
sp0_MUX_uxn_opcodes_h_l2613_c3_5b0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2613_c3_5b0b_cond,
sp0_MUX_uxn_opcodes_h_l2613_c3_5b0b_iftrue,
sp0_MUX_uxn_opcodes_h_l2613_c3_5b0b_iffalse,
sp0_MUX_uxn_opcodes_h_l2613_c3_5b0b_return_output);

-- sp1_MUX_uxn_opcodes_h_l2613_c3_5b0b
sp1_MUX_uxn_opcodes_h_l2613_c3_5b0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2613_c3_5b0b_cond,
sp1_MUX_uxn_opcodes_h_l2613_c3_5b0b_iftrue,
sp1_MUX_uxn_opcodes_h_l2613_c3_5b0b_iffalse,
sp1_MUX_uxn_opcodes_h_l2613_c3_5b0b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2614_c4_a0ac
BIN_OP_PLUS_uxn_opcodes_h_l2614_c4_a0ac : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2614_c4_a0ac_left,
BIN_OP_PLUS_uxn_opcodes_h_l2614_c4_a0ac_right,
BIN_OP_PLUS_uxn_opcodes_h_l2614_c4_a0ac_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2616_c4_9de2
BIN_OP_PLUS_uxn_opcodes_h_l2616_c4_9de2 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2616_c4_9de2_left,
BIN_OP_PLUS_uxn_opcodes_h_l2616_c4_9de2_right,
BIN_OP_PLUS_uxn_opcodes_h_l2616_c4_9de2_return_output);

-- MUX_uxn_opcodes_h_l2620_c29_2608
MUX_uxn_opcodes_h_l2620_c29_2608 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2620_c29_2608_cond,
MUX_uxn_opcodes_h_l2620_c29_2608_iftrue,
MUX_uxn_opcodes_h_l2620_c29_2608_iffalse,
MUX_uxn_opcodes_h_l2620_c29_2608_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2620_c19_f9e4
BIN_OP_MINUS_uxn_opcodes_h_l2620_c19_f9e4 : entity work.BIN_OP_MINUS_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2620_c19_f9e4_left,
BIN_OP_MINUS_uxn_opcodes_h_l2620_c19_f9e4_right,
BIN_OP_MINUS_uxn_opcodes_h_l2620_c19_f9e4_return_output);

-- MUX_uxn_opcodes_h_l2621_c20_119f
MUX_uxn_opcodes_h_l2621_c20_119f : entity work.MUX_uint1_t_uint9_t_uint9_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2621_c20_119f_cond,
MUX_uxn_opcodes_h_l2621_c20_119f_iftrue,
MUX_uxn_opcodes_h_l2621_c20_119f_iffalse,
MUX_uxn_opcodes_h_l2621_c20_119f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2621_c2_e601
BIN_OP_PLUS_uxn_opcodes_h_l2621_c2_e601 : entity work.BIN_OP_PLUS_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2621_c2_e601_left,
BIN_OP_PLUS_uxn_opcodes_h_l2621_c2_e601_right,
BIN_OP_PLUS_uxn_opcodes_h_l2621_c2_e601_return_output);

-- MUX_uxn_opcodes_h_l2624_c3_fe7e
MUX_uxn_opcodes_h_l2624_c3_fe7e : entity work.MUX_uint1_t_uint9_t_uint9_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2624_c3_fe7e_cond,
MUX_uxn_opcodes_h_l2624_c3_fe7e_iftrue,
MUX_uxn_opcodes_h_l2624_c3_fe7e_iffalse,
MUX_uxn_opcodes_h_l2624_c3_fe7e_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2625_c52_6f82
CONST_SR_8_uxn_opcodes_h_l2625_c52_6f82 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2625_c52_6f82_x,
CONST_SR_8_uxn_opcodes_h_l2625_c52_6f82_return_output);

-- MUX_uxn_opcodes_h_l2625_c3_259d
MUX_uxn_opcodes_h_l2625_c3_259d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2625_c3_259d_cond,
MUX_uxn_opcodes_h_l2625_c3_259d_iftrue,
MUX_uxn_opcodes_h_l2625_c3_259d_iffalse,
MUX_uxn_opcodes_h_l2625_c3_259d_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2626_c3_0a38
BIN_OP_AND_uxn_opcodes_h_l2626_c3_0a38 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2626_c3_0a38_left,
BIN_OP_AND_uxn_opcodes_h_l2626_c3_0a38_right,
BIN_OP_AND_uxn_opcodes_h_l2626_c3_0a38_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2627_c42_5e8f
BIN_OP_PLUS_uxn_opcodes_h_l2627_c42_5e8f : entity work.BIN_OP_PLUS_uint9_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2627_c42_5e8f_left,
BIN_OP_PLUS_uxn_opcodes_h_l2627_c42_5e8f_right,
BIN_OP_PLUS_uxn_opcodes_h_l2627_c42_5e8f_return_output);

-- MUX_uxn_opcodes_h_l2627_c3_0d28
MUX_uxn_opcodes_h_l2627_c3_0d28 : entity work.MUX_uint1_t_uint9_t_uint9_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2627_c3_0d28_cond,
MUX_uxn_opcodes_h_l2627_c3_0d28_iftrue,
MUX_uxn_opcodes_h_l2627_c3_0d28_iffalse,
MUX_uxn_opcodes_h_l2627_c3_0d28_return_output);

-- MUX_uxn_opcodes_h_l2628_c3_e0ed
MUX_uxn_opcodes_h_l2628_c3_e0ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2628_c3_e0ed_cond,
MUX_uxn_opcodes_h_l2628_c3_e0ed_iftrue,
MUX_uxn_opcodes_h_l2628_c3_e0ed_iffalse,
MUX_uxn_opcodes_h_l2628_c3_e0ed_return_output);

-- stack_ram_update_uxn_opcodes_h_l2623_c24_ac81
stack_ram_update_uxn_opcodes_h_l2623_c24_ac81 : entity work.stack_ram_update_0CLK_e1b2c3f8 port map (
clk,
stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_CLOCK_ENABLE,
stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_address0,
stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_write0_value,
stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_write0_enable,
stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_address1,
stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_write1_value,
stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_write1_enable,
stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_return_output);



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
 BIN_OP_AND_uxn_opcodes_h_l2530_c14_cbfa_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2531_c14_8511_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2531_c14_1762_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l2531_c14_5ff0_return_output,
 BIN_OP_NEQ_uxn_opcodes_h_l2531_c14_9a48_return_output,
 MUX_uxn_opcodes_h_l2531_c14_30cb_return_output,
 MUX_uxn_opcodes_h_l2532_c8_3899_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2538_c6_c949_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c7_cbdf_return_output,
 is_wait_MUX_uxn_opcodes_h_l2538_c2_5792_return_output,
 opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2539_c11_164b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_ba06_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c7_72b2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2539_c7_cbdf_return_output,
 jci_uxn_opcodes_h_l2539_c40_2c85_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2540_c11_13c0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c1_7273_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c7_115a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2540_c7_72b2_return_output,
 jmi_uxn_opcodes_h_l2540_c40_8d3b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2541_c11_feb8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_75cc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c7_a205_return_output,
 opc_result_MUX_uxn_opcodes_h_l2541_c7_115a_return_output,
 jsi_uxn_opcodes_h_l2541_c40_2ec7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2542_c11_cb0b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c1_b870_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c7_4920_return_output,
 opc_result_MUX_uxn_opcodes_h_l2542_c7_a205_return_output,
 lit_uxn_opcodes_h_l2542_c40_3478_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2543_c11_6e32_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c1_6d0d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c7_db71_return_output,
 opc_result_MUX_uxn_opcodes_h_l2543_c7_4920_return_output,
 lit2_uxn_opcodes_h_l2543_c40_e8d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2544_c11_e716_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c1_c6be_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c7_da25_return_output,
 opc_result_MUX_uxn_opcodes_h_l2544_c7_db71_return_output,
 lit_uxn_opcodes_h_l2544_c40_c683_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2545_c11_a4af_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_1a80_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c7_5548_return_output,
 opc_result_MUX_uxn_opcodes_h_l2545_c7_da25_return_output,
 lit2_uxn_opcodes_h_l2545_c40_20a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2546_c11_e1b3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_afaa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c7_a0c7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2546_c7_5548_return_output,
 inc_uxn_opcodes_h_l2546_c40_1930_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8781_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_e2db_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c7_afca_return_output,
 opc_result_MUX_uxn_opcodes_h_l2547_c7_a0c7_return_output,
 inc2_uxn_opcodes_h_l2547_c40_8cb1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2548_c11_20fd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c1_6238_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c7_a035_return_output,
 opc_result_MUX_uxn_opcodes_h_l2548_c7_afca_return_output,
 pop_uxn_opcodes_h_l2548_c40_2076_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2549_c11_7ac2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_4066_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c7_3516_return_output,
 opc_result_MUX_uxn_opcodes_h_l2549_c7_a035_return_output,
 pop2_uxn_opcodes_h_l2549_c40_8f2e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2550_c11_b620_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_6151_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c7_0356_return_output,
 opc_result_MUX_uxn_opcodes_h_l2550_c7_3516_return_output,
 nip_uxn_opcodes_h_l2550_c40_3b9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2551_c11_4125_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c1_75fc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c7_2629_return_output,
 opc_result_MUX_uxn_opcodes_h_l2551_c7_0356_return_output,
 nip2_uxn_opcodes_h_l2551_c40_96e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2552_c11_81d0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c1_6953_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c7_f031_return_output,
 opc_result_MUX_uxn_opcodes_h_l2552_c7_2629_return_output,
 swp_uxn_opcodes_h_l2552_c40_3757_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2553_c11_495b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c1_d51f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c7_ba37_return_output,
 opc_result_MUX_uxn_opcodes_h_l2553_c7_f031_return_output,
 swp2_uxn_opcodes_h_l2553_c40_5c76_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2554_c11_fbd5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c1_3d40_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c7_d61b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2554_c7_ba37_return_output,
 rot_uxn_opcodes_h_l2554_c40_4358_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2555_c11_7f20_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c1_2c24_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c7_f7cf_return_output,
 opc_result_MUX_uxn_opcodes_h_l2555_c7_d61b_return_output,
 rot2_uxn_opcodes_h_l2555_c40_7aa5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2556_c11_11c8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c1_8a48_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c7_148a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2556_c7_f7cf_return_output,
 dup_uxn_opcodes_h_l2556_c40_9f2a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2557_c11_63ac_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c1_c77c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c7_df66_return_output,
 opc_result_MUX_uxn_opcodes_h_l2557_c7_148a_return_output,
 dup2_uxn_opcodes_h_l2557_c40_190d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2558_c11_bcc6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c1_4d05_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c7_0b1d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2558_c7_df66_return_output,
 ovr_uxn_opcodes_h_l2558_c40_b12c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2559_c11_6485_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c1_af2f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c7_cf3a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2559_c7_0b1d_return_output,
 ovr2_uxn_opcodes_h_l2559_c40_8f4c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2560_c11_13f2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c1_2a2d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c7_19cc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2560_c7_cf3a_return_output,
 equ_uxn_opcodes_h_l2560_c40_49aa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2561_c11_35e0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c1_47ab_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c7_2335_return_output,
 opc_result_MUX_uxn_opcodes_h_l2561_c7_19cc_return_output,
 equ2_uxn_opcodes_h_l2561_c40_93d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2562_c11_5fd5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c1_4ab1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c7_a38f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2562_c7_2335_return_output,
 neq_uxn_opcodes_h_l2562_c40_5284_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2563_c11_d8c9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c1_2826_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c7_f981_return_output,
 opc_result_MUX_uxn_opcodes_h_l2563_c7_a38f_return_output,
 neq2_uxn_opcodes_h_l2563_c40_9708_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2564_c11_a073_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c1_edad_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c7_23c6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2564_c7_f981_return_output,
 gth_uxn_opcodes_h_l2564_c40_6836_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2565_c11_5bf4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_466a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c7_b73a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2565_c7_23c6_return_output,
 gth2_uxn_opcodes_h_l2565_c40_fd50_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2566_c11_61a5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c1_216d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c7_7f81_return_output,
 opc_result_MUX_uxn_opcodes_h_l2566_c7_b73a_return_output,
 lth_uxn_opcodes_h_l2566_c40_a5e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2567_c11_e8ee_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c1_83c7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c7_a31a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2567_c7_7f81_return_output,
 lth2_uxn_opcodes_h_l2567_c40_dc84_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2568_c11_7306_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c1_d332_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c7_f572_return_output,
 opc_result_MUX_uxn_opcodes_h_l2568_c7_a31a_return_output,
 jmp_uxn_opcodes_h_l2568_c40_84d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2569_c11_ca0a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c1_266f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c7_4440_return_output,
 opc_result_MUX_uxn_opcodes_h_l2569_c7_f572_return_output,
 jmp2_uxn_opcodes_h_l2569_c40_d58f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2570_c11_393b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_0fd3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c7_653e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2570_c7_4440_return_output,
 jcn_uxn_opcodes_h_l2570_c40_f0d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2571_c11_06db_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_ce56_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c7_2fe5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2571_c7_653e_return_output,
 jcn2_uxn_opcodes_h_l2571_c40_5828_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2572_c11_deb5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c1_e6ea_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c7_2c4c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2572_c7_2fe5_return_output,
 jsr_uxn_opcodes_h_l2572_c40_6d7b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2573_c11_62b1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_4525_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c7_a82c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2573_c7_2c4c_return_output,
 jsr2_uxn_opcodes_h_l2573_c40_8faf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2574_c11_c5b8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c1_4611_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c7_ee9c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2574_c7_a82c_return_output,
 sth_uxn_opcodes_h_l2574_c40_399b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2575_c11_c57a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c1_0256_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c7_dc9e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2575_c7_ee9c_return_output,
 sth2_uxn_opcodes_h_l2575_c40_d79c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2576_c11_9530_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_f7d4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c7_af91_return_output,
 opc_result_MUX_uxn_opcodes_h_l2576_c7_dc9e_return_output,
 ldz_uxn_opcodes_h_l2576_c40_72ae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2577_c11_c6ab_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c1_b1e7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c7_c0d8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2577_c7_af91_return_output,
 ldz2_uxn_opcodes_h_l2577_c40_a1fd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2578_c11_618c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c1_9bf9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c7_8c50_return_output,
 opc_result_MUX_uxn_opcodes_h_l2578_c7_c0d8_return_output,
 stz_uxn_opcodes_h_l2578_c40_49bc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2579_c11_4223_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c1_4f85_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c7_3d61_return_output,
 opc_result_MUX_uxn_opcodes_h_l2579_c7_8c50_return_output,
 stz2_uxn_opcodes_h_l2579_c40_f4b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2580_c11_ffc5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c1_5e1f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c7_f736_return_output,
 opc_result_MUX_uxn_opcodes_h_l2580_c7_3d61_return_output,
 ldr_uxn_opcodes_h_l2580_c40_88bc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2581_c11_c6c4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c1_d7a6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c7_8b31_return_output,
 opc_result_MUX_uxn_opcodes_h_l2581_c7_f736_return_output,
 ldr2_uxn_opcodes_h_l2581_c40_4b84_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2582_c11_f4de_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c1_d8f7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c7_43f0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2582_c7_8b31_return_output,
 str1_uxn_opcodes_h_l2582_c40_9cb6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2583_c11_1ef8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c1_670f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c7_ff57_return_output,
 opc_result_MUX_uxn_opcodes_h_l2583_c7_43f0_return_output,
 str2_uxn_opcodes_h_l2583_c40_2538_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2584_c11_4d63_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c1_0ae6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c7_955d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2584_c7_ff57_return_output,
 lda_uxn_opcodes_h_l2584_c40_8757_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2585_c11_ce36_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c1_95e2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c7_205c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2585_c7_955d_return_output,
 lda2_uxn_opcodes_h_l2585_c40_36dd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2586_c11_b7cd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c1_c3d1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c7_9db0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2586_c7_205c_return_output,
 sta_uxn_opcodes_h_l2586_c40_c4ac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2587_c11_5dab_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c1_f247_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c7_474f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2587_c7_9db0_return_output,
 sta2_uxn_opcodes_h_l2587_c40_e790_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2588_c11_7def_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c1_92e3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c7_5280_return_output,
 opc_result_MUX_uxn_opcodes_h_l2588_c7_474f_return_output,
 dei_uxn_opcodes_h_l2588_c40_69c1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2589_c11_d95c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c1_b6d3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c7_157b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2589_c7_5280_return_output,
 dei2_uxn_opcodes_h_l2589_c40_a853_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2590_c11_eb97_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c1_4287_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c7_7683_return_output,
 opc_result_MUX_uxn_opcodes_h_l2590_c7_157b_return_output,
 deo_uxn_opcodes_h_l2590_c40_7c9c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2591_c11_8041_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c1_d2d1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c7_9ad0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2591_c7_7683_return_output,
 deo2_uxn_opcodes_h_l2591_c40_6834_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2592_c11_4fde_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c1_3b5a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c7_498d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2592_c7_9ad0_return_output,
 add_uxn_opcodes_h_l2592_c40_97de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2593_c11_74c9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c1_d3cb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c7_ea71_return_output,
 opc_result_MUX_uxn_opcodes_h_l2593_c7_498d_return_output,
 add2_uxn_opcodes_h_l2593_c40_b951_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2594_c11_1cbf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c1_8c8e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c7_b70d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2594_c7_ea71_return_output,
 sub_uxn_opcodes_h_l2594_c40_3537_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2595_c11_f255_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c1_2988_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c7_2426_return_output,
 opc_result_MUX_uxn_opcodes_h_l2595_c7_b70d_return_output,
 sub2_uxn_opcodes_h_l2595_c40_50bd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2596_c11_d91e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c1_9856_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c7_c0ec_return_output,
 opc_result_MUX_uxn_opcodes_h_l2596_c7_2426_return_output,
 mul_uxn_opcodes_h_l2596_c40_feff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2597_c11_1e97_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c1_38b1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c7_f595_return_output,
 opc_result_MUX_uxn_opcodes_h_l2597_c7_c0ec_return_output,
 mul2_uxn_opcodes_h_l2597_c40_9413_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2598_c11_0f1f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c1_ccf5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c7_1fbf_return_output,
 opc_result_MUX_uxn_opcodes_h_l2598_c7_f595_return_output,
 div_uxn_opcodes_h_l2598_c40_cc14_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2599_c11_540a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c1_2417_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c7_683b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2599_c7_1fbf_return_output,
 div2_uxn_opcodes_h_l2599_c40_3dd1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2600_c11_6438_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_84ac_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c7_1efa_return_output,
 opc_result_MUX_uxn_opcodes_h_l2600_c7_683b_return_output,
 and_uxn_opcodes_h_l2600_c40_3c81_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2601_c11_ff18_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c1_0b00_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c7_620a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2601_c7_1efa_return_output,
 and2_uxn_opcodes_h_l2601_c40_991a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2602_c11_d90e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c1_180f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c7_5e21_return_output,
 opc_result_MUX_uxn_opcodes_h_l2602_c7_620a_return_output,
 ora_uxn_opcodes_h_l2602_c40_ceea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2603_c11_ff07_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_d680_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c7_1270_return_output,
 opc_result_MUX_uxn_opcodes_h_l2603_c7_5e21_return_output,
 ora2_uxn_opcodes_h_l2603_c40_b642_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b354_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c1_0fac_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c7_5e80_return_output,
 opc_result_MUX_uxn_opcodes_h_l2604_c7_1270_return_output,
 eor_uxn_opcodes_h_l2604_c40_8850_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2605_c11_d529_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c1_0a11_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c7_2198_return_output,
 opc_result_MUX_uxn_opcodes_h_l2605_c7_5e80_return_output,
 eor2_uxn_opcodes_h_l2605_c40_71d3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f0c7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c1_d368_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c7_a5d0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2606_c7_2198_return_output,
 sft_uxn_opcodes_h_l2606_c40_5c65_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2607_c11_be22_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c1_b90f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2607_c7_a5d0_return_output,
 sft2_uxn_opcodes_h_l2607_c40_c639_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2609_c18_318d_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2609_c18_2605_return_output,
 MUX_uxn_opcodes_h_l2609_c18_9746_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2610_c2_a2ec_return_output,
 sp0_MUX_uxn_opcodes_h_l2612_c2_2c8f_return_output,
 sp1_MUX_uxn_opcodes_h_l2612_c2_2c8f_return_output,
 sp0_MUX_uxn_opcodes_h_l2613_c3_5b0b_return_output,
 sp1_MUX_uxn_opcodes_h_l2613_c3_5b0b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2614_c4_a0ac_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2616_c4_9de2_return_output,
 MUX_uxn_opcodes_h_l2620_c29_2608_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2620_c19_f9e4_return_output,
 MUX_uxn_opcodes_h_l2621_c20_119f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2621_c2_e601_return_output,
 MUX_uxn_opcodes_h_l2624_c3_fe7e_return_output,
 CONST_SR_8_uxn_opcodes_h_l2625_c52_6f82_return_output,
 MUX_uxn_opcodes_h_l2625_c3_259d_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2626_c3_0a38_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2627_c42_5e8f_return_output,
 MUX_uxn_opcodes_h_l2627_c3_0d28_return_output,
 MUX_uxn_opcodes_h_l2628_c3_e0ed_return_output,
 stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2530_c14_cbfa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2530_c14_cbfa_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2530_c14_cbfa_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2531_c14_30cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2531_c14_8511_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2531_c14_8511_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2531_c14_8511_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2531_c14_1762_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2531_c14_1762_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2531_c14_1762_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2531_c14_5ff0_expr : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2531_c14_5ff0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2531_c14_9a48_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2531_c14_9a48_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2531_c14_9a48_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2531_c14_30cb_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2531_c14_30cb_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2531_c14_30cb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2532_c8_3899_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2532_c8_3899_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2532_c8_3899_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c6_c949_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c6_c949_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c6_c949_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c7_cbdf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c7_cbdf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c7_cbdf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c7_cbdf_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2538_c2_5792_iftrue : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2538_c2_5792_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2538_c2_5792_return_output : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2538_c2_5792_cond : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2538_c2_5792_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2539_c7_cbdf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c11_164b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c11_164b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c11_164b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_ba06_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_ba06_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_ba06_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_ba06_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c7_72b2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c7_72b2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c7_72b2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c7_72b2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2539_c7_cbdf_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2539_c7_cbdf_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2540_c7_72b2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2539_c7_cbdf_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2539_c40_2c85_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2539_c40_2c85_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2539_c40_2c85_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2539_c40_2c85_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2539_c40_2c85_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2539_c40_2c85_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_13c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_13c0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_13c0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c1_7273_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c1_7273_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c1_7273_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c1_7273_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c7_115a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c7_115a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c7_115a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c7_115a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2540_c7_72b2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2540_c7_72b2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2541_c7_115a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2540_c7_72b2_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2540_c40_8d3b_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2540_c40_8d3b_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2540_c40_8d3b_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2540_c40_8d3b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2540_c40_8d3b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_feb8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_feb8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_feb8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_75cc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_75cc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_75cc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_75cc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c7_a205_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c7_a205_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c7_a205_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c7_a205_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2541_c7_115a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2541_c7_115a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2542_c7_a205_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2541_c7_115a_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2541_c40_2ec7_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2541_c40_2ec7_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2541_c40_2ec7_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2541_c40_2ec7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2541_c40_2ec7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_cb0b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_cb0b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_cb0b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c1_b870_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c1_b870_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c1_b870_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c1_b870_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c7_4920_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c7_4920_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c7_4920_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c7_4920_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2542_c7_a205_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2542_c7_a205_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2543_c7_4920_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2542_c7_a205_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2542_c40_3478_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2542_c40_3478_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2542_c40_3478_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2542_c40_3478_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2542_c40_3478_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2543_c11_6e32_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2543_c11_6e32_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2543_c11_6e32_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c1_6d0d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c1_6d0d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c1_6d0d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c1_6d0d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c7_db71_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c7_db71_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c7_db71_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c7_db71_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2543_c7_4920_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2543_c7_4920_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2544_c7_db71_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2543_c7_4920_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2543_c40_e8d6_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2543_c40_e8d6_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2543_c40_e8d6_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2543_c40_e8d6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2543_c40_e8d6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_e716_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_e716_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_e716_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c1_c6be_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c1_c6be_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c1_c6be_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c1_c6be_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c7_da25_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c7_da25_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c7_da25_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c7_da25_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2544_c7_db71_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2544_c7_db71_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2545_c7_da25_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2544_c7_db71_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2544_c40_c683_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2544_c40_c683_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2544_c40_c683_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2544_c40_c683_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2544_c40_c683_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c11_a4af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c11_a4af_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c11_a4af_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_1a80_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_1a80_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_1a80_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_1a80_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c7_5548_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c7_5548_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c7_5548_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c7_5548_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2545_c7_da25_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2545_c7_da25_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2546_c7_5548_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2545_c7_da25_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2545_c40_20a4_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2545_c40_20a4_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2545_c40_20a4_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2545_c40_20a4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2545_c40_20a4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_e1b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_e1b3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_e1b3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_afaa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_afaa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_afaa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_afaa_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c7_a0c7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c7_a0c7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c7_a0c7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c7_a0c7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2546_c7_5548_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2546_c7_5548_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2547_c7_a0c7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2546_c7_5548_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2546_c40_1930_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2546_c40_1930_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2546_c40_1930_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2546_c40_1930_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2546_c40_1930_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8781_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8781_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8781_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_e2db_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_e2db_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_e2db_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_e2db_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c7_afca_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c7_afca_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c7_afca_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c7_afca_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2547_c7_a0c7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2547_c7_a0c7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2548_c7_afca_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2547_c7_a0c7_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2547_c40_8cb1_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2547_c40_8cb1_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2547_c40_8cb1_previous_stack_read : unsigned(15 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2547_c40_8cb1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2547_c40_8cb1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_20fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_20fd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_20fd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c1_6238_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c1_6238_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c1_6238_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c1_6238_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c7_a035_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c7_a035_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c7_a035_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c7_a035_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2548_c7_afca_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2548_c7_afca_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2549_c7_a035_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2548_c7_afca_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2548_c40_2076_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2548_c40_2076_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2548_c40_2076_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2548_c40_2076_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_7ac2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_7ac2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_7ac2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_4066_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_4066_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_4066_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_4066_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c7_3516_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c7_3516_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c7_3516_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c7_3516_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2549_c7_a035_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2549_c7_a035_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2550_c7_3516_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2549_c7_a035_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2549_c40_8f2e_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2549_c40_8f2e_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2549_c40_8f2e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2549_c40_8f2e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_b620_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_b620_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_b620_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_6151_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_6151_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_6151_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_6151_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c7_0356_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c7_0356_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c7_0356_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c7_0356_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2550_c7_3516_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2550_c7_3516_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2551_c7_0356_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2550_c7_3516_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2550_c40_3b9f_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2550_c40_3b9f_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2550_c40_3b9f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2550_c40_3b9f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2550_c40_3b9f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2551_c11_4125_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2551_c11_4125_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2551_c11_4125_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c1_75fc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c1_75fc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c1_75fc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c1_75fc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c7_2629_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c7_2629_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c7_2629_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c7_2629_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2551_c7_0356_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2551_c7_0356_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2552_c7_2629_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2551_c7_0356_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2551_c40_96e3_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2551_c40_96e3_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2551_c40_96e3_previous_stack_read : unsigned(15 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2551_c40_96e3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2551_c40_96e3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_81d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_81d0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_81d0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c1_6953_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c1_6953_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c1_6953_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c1_6953_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c7_f031_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c7_f031_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c7_f031_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c7_f031_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2552_c7_2629_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2552_c7_2629_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2553_c7_f031_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2552_c7_2629_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2552_c40_3757_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2552_c40_3757_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2552_c40_3757_previous_stack_read : unsigned(15 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2552_c40_3757_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2552_c40_3757_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_495b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_495b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_495b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c1_d51f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c1_d51f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c1_d51f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c1_d51f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c7_ba37_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c7_ba37_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c7_ba37_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c7_ba37_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2553_c7_f031_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2553_c7_f031_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2554_c7_ba37_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2553_c7_f031_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2553_c40_5c76_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2553_c40_5c76_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2553_c40_5c76_previous_stack_read : unsigned(15 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2553_c40_5c76_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2553_c40_5c76_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_fbd5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_fbd5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_fbd5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c1_3d40_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c1_3d40_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c1_3d40_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c1_3d40_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c7_d61b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c7_d61b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c7_d61b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c7_d61b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2554_c7_ba37_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2554_c7_ba37_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2555_c7_d61b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2554_c7_ba37_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2554_c40_4358_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2554_c40_4358_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2554_c40_4358_previous_stack_read : unsigned(15 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2554_c40_4358_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2554_c40_4358_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_7f20_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_7f20_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_7f20_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c1_2c24_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c1_2c24_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c1_2c24_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c1_2c24_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c7_f7cf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c7_f7cf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c7_f7cf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c7_f7cf_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2555_c7_d61b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2555_c7_d61b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2556_c7_f7cf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2555_c7_d61b_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2555_c40_7aa5_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2555_c40_7aa5_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2555_c40_7aa5_previous_stack_read : unsigned(15 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2555_c40_7aa5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2555_c40_7aa5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_11c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_11c8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_11c8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c1_8a48_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c1_8a48_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c1_8a48_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c1_8a48_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c7_148a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c7_148a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c7_148a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c7_148a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2556_c7_f7cf_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2556_c7_f7cf_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2557_c7_148a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2556_c7_f7cf_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2556_c40_9f2a_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2556_c40_9f2a_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2556_c40_9f2a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2556_c40_9f2a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2556_c40_9f2a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_63ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_63ac_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_63ac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c1_c77c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c1_c77c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c1_c77c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c1_c77c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c7_df66_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c7_df66_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c7_df66_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c7_df66_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2557_c7_148a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2557_c7_148a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2558_c7_df66_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2557_c7_148a_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2557_c40_190d_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2557_c40_190d_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2557_c40_190d_previous_stack_read : unsigned(15 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2557_c40_190d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2557_c40_190d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_bcc6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_bcc6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_bcc6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c1_4d05_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c1_4d05_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c1_4d05_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c1_4d05_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c7_0b1d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c7_0b1d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c7_0b1d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c7_0b1d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2558_c7_df66_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2558_c7_df66_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2559_c7_0b1d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2558_c7_df66_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2558_c40_b12c_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2558_c40_b12c_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2558_c40_b12c_previous_stack_read : unsigned(15 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2558_c40_b12c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2558_c40_b12c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2559_c11_6485_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2559_c11_6485_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2559_c11_6485_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c1_af2f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c1_af2f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c1_af2f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c1_af2f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c7_cf3a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c7_cf3a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c7_cf3a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c7_cf3a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2559_c7_0b1d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2559_c7_0b1d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2560_c7_cf3a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2559_c7_0b1d_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2559_c40_8f4c_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2559_c40_8f4c_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2559_c40_8f4c_previous_stack_read : unsigned(15 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2559_c40_8f4c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2559_c40_8f4c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_13f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_13f2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_13f2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c1_2a2d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c1_2a2d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c1_2a2d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c1_2a2d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c7_19cc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c7_19cc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c7_19cc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c7_19cc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2560_c7_cf3a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2560_c7_cf3a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2561_c7_19cc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2560_c7_cf3a_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2560_c40_49aa_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2560_c40_49aa_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2560_c40_49aa_previous_stack_read : unsigned(15 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2560_c40_49aa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2560_c40_49aa_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_35e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_35e0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_35e0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c1_47ab_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c1_47ab_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c1_47ab_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c1_47ab_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c7_2335_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c7_2335_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c7_2335_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c7_2335_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2561_c7_19cc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2561_c7_19cc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2562_c7_2335_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2561_c7_19cc_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2561_c40_93d5_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2561_c40_93d5_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2561_c40_93d5_previous_stack_read : unsigned(15 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2561_c40_93d5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2561_c40_93d5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_5fd5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_5fd5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_5fd5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c1_4ab1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c1_4ab1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c1_4ab1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c1_4ab1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c7_a38f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c7_a38f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c7_a38f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c7_a38f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2562_c7_2335_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2562_c7_2335_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2563_c7_a38f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2562_c7_2335_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2562_c40_5284_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2562_c40_5284_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2562_c40_5284_previous_stack_read : unsigned(15 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2562_c40_5284_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2562_c40_5284_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_d8c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_d8c9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_d8c9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c1_2826_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c1_2826_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c1_2826_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c1_2826_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c7_f981_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c7_f981_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c7_f981_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c7_f981_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2563_c7_a38f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2563_c7_a38f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2564_c7_f981_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2563_c7_a38f_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2563_c40_9708_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2563_c40_9708_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2563_c40_9708_previous_stack_read : unsigned(15 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2563_c40_9708_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2563_c40_9708_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_a073_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_a073_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_a073_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c1_edad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c1_edad_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c1_edad_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c1_edad_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c7_23c6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c7_23c6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c7_23c6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c7_23c6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2564_c7_f981_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2564_c7_f981_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2565_c7_23c6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2564_c7_f981_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2564_c40_6836_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2564_c40_6836_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2564_c40_6836_previous_stack_read : unsigned(15 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2564_c40_6836_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2564_c40_6836_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_5bf4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_5bf4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_5bf4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_466a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_466a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_466a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_466a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c7_b73a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c7_b73a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c7_b73a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c7_b73a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2565_c7_23c6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2565_c7_23c6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2566_c7_b73a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2565_c7_23c6_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2565_c40_fd50_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2565_c40_fd50_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2565_c40_fd50_previous_stack_read : unsigned(15 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2565_c40_fd50_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2565_c40_fd50_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2566_c11_61a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2566_c11_61a5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2566_c11_61a5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c1_216d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c1_216d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c1_216d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c1_216d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c7_7f81_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c7_7f81_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c7_7f81_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c7_7f81_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2566_c7_b73a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2566_c7_b73a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2567_c7_7f81_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2566_c7_b73a_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2566_c40_a5e1_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2566_c40_a5e1_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2566_c40_a5e1_previous_stack_read : unsigned(15 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2566_c40_a5e1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2566_c40_a5e1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_e8ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_e8ee_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_e8ee_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c1_83c7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c1_83c7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c1_83c7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c1_83c7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c7_a31a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c7_a31a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c7_a31a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c7_a31a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2567_c7_7f81_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2567_c7_7f81_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2568_c7_a31a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2567_c7_7f81_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2567_c40_dc84_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2567_c40_dc84_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2567_c40_dc84_previous_stack_read : unsigned(15 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2567_c40_dc84_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2567_c40_dc84_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_7306_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_7306_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_7306_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c1_d332_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c1_d332_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c1_d332_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c1_d332_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c7_f572_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c7_f572_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c7_f572_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c7_f572_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2568_c7_a31a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2568_c7_a31a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2569_c7_f572_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2568_c7_a31a_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2568_c40_84d1_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2568_c40_84d1_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2568_c40_84d1_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2568_c40_84d1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2568_c40_84d1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2568_c40_84d1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_ca0a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_ca0a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_ca0a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c1_266f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c1_266f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c1_266f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c1_266f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c7_4440_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c7_4440_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c7_4440_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c7_4440_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2569_c7_f572_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2569_c7_f572_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2570_c7_4440_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2569_c7_f572_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2569_c40_d58f_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2569_c40_d58f_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2569_c40_d58f_previous_stack_read : unsigned(15 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2569_c40_d58f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2569_c40_d58f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_393b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_393b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_393b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_0fd3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_0fd3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_0fd3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_0fd3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c7_653e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c7_653e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c7_653e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c7_653e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2570_c7_4440_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2570_c7_4440_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2571_c7_653e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2570_c7_4440_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2570_c40_f0d2_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2570_c40_f0d2_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2570_c40_f0d2_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2570_c40_f0d2_previous_stack_read : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2570_c40_f0d2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2570_c40_f0d2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_06db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_06db_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_06db_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_ce56_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_ce56_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_ce56_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_ce56_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c7_2fe5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c7_2fe5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c7_2fe5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c7_2fe5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2571_c7_653e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2571_c7_653e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2572_c7_2fe5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2571_c7_653e_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2571_c40_5828_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2571_c40_5828_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2571_c40_5828_previous_stack_read : unsigned(15 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2571_c40_5828_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2571_c40_5828_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2572_c11_deb5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2572_c11_deb5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2572_c11_deb5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c1_e6ea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c1_e6ea_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c1_e6ea_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c1_e6ea_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c7_2c4c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c7_2c4c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c7_2c4c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c7_2c4c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2572_c7_2fe5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2572_c7_2fe5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2573_c7_2c4c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2572_c7_2fe5_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2572_c40_6d7b_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2572_c40_6d7b_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2572_c40_6d7b_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2572_c40_6d7b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2572_c40_6d7b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2572_c40_6d7b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_62b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_62b1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_62b1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_4525_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_4525_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_4525_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_4525_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c7_a82c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c7_a82c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c7_a82c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c7_a82c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2573_c7_2c4c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2573_c7_2c4c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2574_c7_a82c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2573_c7_2c4c_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2573_c40_8faf_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2573_c40_8faf_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2573_c40_8faf_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2573_c40_8faf_previous_stack_read : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2573_c40_8faf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2573_c40_8faf_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_c5b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_c5b8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_c5b8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c1_4611_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c1_4611_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c1_4611_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c1_4611_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c7_ee9c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c7_ee9c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c7_ee9c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c7_ee9c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2574_c7_a82c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2574_c7_a82c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2575_c7_ee9c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2574_c7_a82c_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2574_c40_399b_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2574_c40_399b_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2574_c40_399b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2574_c40_399b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2574_c40_399b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_c57a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_c57a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_c57a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c1_0256_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c1_0256_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c1_0256_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c1_0256_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c7_dc9e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c7_dc9e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c7_dc9e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c7_dc9e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2575_c7_ee9c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2575_c7_ee9c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2576_c7_dc9e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2575_c7_ee9c_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2575_c40_d79c_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2575_c40_d79c_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2575_c40_d79c_previous_stack_read : unsigned(15 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2575_c40_d79c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2575_c40_d79c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_9530_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_9530_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_9530_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_f7d4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_f7d4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_f7d4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_f7d4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c7_af91_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c7_af91_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c7_af91_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c7_af91_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2576_c7_dc9e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2576_c7_dc9e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2577_c7_af91_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2576_c7_dc9e_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2576_c40_72ae_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2576_c40_72ae_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2576_c40_72ae_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2576_c40_72ae_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2576_c40_72ae_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2576_c40_72ae_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_c6ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_c6ab_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_c6ab_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c1_b1e7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c1_b1e7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c1_b1e7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c1_b1e7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c7_c0d8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c7_c0d8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c7_c0d8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c7_c0d8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2577_c7_af91_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2577_c7_af91_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2578_c7_c0d8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2577_c7_af91_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2577_c40_a1fd_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2577_c40_a1fd_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2577_c40_a1fd_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2577_c40_a1fd_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2577_c40_a1fd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2577_c40_a1fd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_618c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_618c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_618c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c1_9bf9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c1_9bf9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c1_9bf9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c1_9bf9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c7_8c50_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c7_8c50_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c7_8c50_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c7_8c50_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2578_c7_c0d8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2578_c7_c0d8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2579_c7_8c50_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2578_c7_c0d8_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2578_c40_49bc_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2578_c40_49bc_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2578_c40_49bc_previous_stack_read : unsigned(15 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2578_c40_49bc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2578_c40_49bc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_4223_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_4223_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_4223_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c1_4f85_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c1_4f85_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c1_4f85_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c1_4f85_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c7_3d61_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c7_3d61_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c7_3d61_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c7_3d61_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2579_c7_8c50_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2579_c7_8c50_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2580_c7_3d61_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2579_c7_8c50_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2579_c40_f4b9_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2579_c40_f4b9_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2579_c40_f4b9_previous_stack_read : unsigned(15 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2579_c40_f4b9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2579_c40_f4b9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_ffc5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_ffc5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_ffc5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c1_5e1f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c1_5e1f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c1_5e1f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c1_5e1f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c7_f736_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c7_f736_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c7_f736_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c7_f736_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2580_c7_3d61_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2580_c7_3d61_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2581_c7_f736_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2580_c7_3d61_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2580_c40_88bc_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2580_c40_88bc_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2580_c40_88bc_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2580_c40_88bc_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2580_c40_88bc_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2580_c40_88bc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2580_c40_88bc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_c6c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_c6c4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_c6c4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c1_d7a6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c1_d7a6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c1_d7a6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c1_d7a6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c7_8b31_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c7_8b31_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c7_8b31_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c7_8b31_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2581_c7_f736_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2581_c7_f736_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2582_c7_8b31_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2581_c7_f736_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2581_c40_4b84_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2581_c40_4b84_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2581_c40_4b84_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2581_c40_4b84_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2581_c40_4b84_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2581_c40_4b84_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2581_c40_4b84_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_f4de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_f4de_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_f4de_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c1_d8f7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c1_d8f7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c1_d8f7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c1_d8f7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c7_43f0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c7_43f0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c7_43f0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c7_43f0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2582_c7_8b31_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2582_c7_8b31_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2583_c7_43f0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2582_c7_8b31_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2582_c40_9cb6_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2582_c40_9cb6_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2582_c40_9cb6_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2582_c40_9cb6_previous_stack_read : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2582_c40_9cb6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2582_c40_9cb6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_1ef8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_1ef8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_1ef8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c1_670f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c1_670f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c1_670f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c1_670f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c7_ff57_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c7_ff57_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c7_ff57_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c7_ff57_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2583_c7_43f0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2583_c7_43f0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2584_c7_ff57_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2583_c7_43f0_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2583_c40_2538_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2583_c40_2538_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2583_c40_2538_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2583_c40_2538_previous_stack_read : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2583_c40_2538_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2583_c40_2538_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_4d63_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_4d63_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_4d63_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c1_0ae6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c1_0ae6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c1_0ae6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c1_0ae6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c7_955d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c7_955d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c7_955d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c7_955d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2584_c7_ff57_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2584_c7_ff57_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2585_c7_955d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2584_c7_ff57_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2584_c40_8757_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2584_c40_8757_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2584_c40_8757_previous_stack_read : unsigned(15 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2584_c40_8757_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2584_c40_8757_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2584_c40_8757_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_ce36_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_ce36_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_ce36_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c1_95e2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c1_95e2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c1_95e2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c1_95e2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c7_205c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c7_205c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c7_205c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c7_205c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2585_c7_955d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2585_c7_955d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2586_c7_205c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2585_c7_955d_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2585_c40_36dd_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2585_c40_36dd_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2585_c40_36dd_previous_stack_read : unsigned(15 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2585_c40_36dd_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2585_c40_36dd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2585_c40_36dd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_b7cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_b7cd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_b7cd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c1_c3d1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c1_c3d1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c1_c3d1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c1_c3d1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c7_9db0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c7_9db0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c7_9db0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c7_9db0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2586_c7_205c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2586_c7_205c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2587_c7_9db0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2586_c7_205c_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2586_c40_c4ac_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2586_c40_c4ac_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2586_c40_c4ac_previous_stack_read : unsigned(15 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2586_c40_c4ac_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2586_c40_c4ac_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_5dab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_5dab_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_5dab_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c1_f247_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c1_f247_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c1_f247_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c1_f247_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c7_474f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c7_474f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c7_474f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c7_474f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2587_c7_9db0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2587_c7_9db0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2588_c7_474f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2587_c7_9db0_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2587_c40_e790_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2587_c40_e790_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2587_c40_e790_previous_stack_read : unsigned(15 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2587_c40_e790_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2587_c40_e790_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_7def_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_7def_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_7def_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c1_92e3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c1_92e3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c1_92e3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c1_92e3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c7_5280_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c7_5280_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c7_5280_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c7_5280_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2588_c7_474f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2588_c7_474f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2589_c7_5280_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2588_c7_474f_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2588_c40_69c1_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2588_c40_69c1_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2588_c40_69c1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2588_c40_69c1_previous_device_ram_read : unsigned(15 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2588_c40_69c1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2588_c40_69c1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_d95c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_d95c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_d95c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c1_b6d3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c1_b6d3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c1_b6d3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c1_b6d3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c7_157b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c7_157b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c7_157b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c7_157b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2589_c7_5280_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2589_c7_5280_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2590_c7_157b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2589_c7_5280_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2589_c40_a853_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2589_c40_a853_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2589_c40_a853_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2589_c40_a853_previous_device_ram_read : unsigned(15 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2589_c40_a853_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2589_c40_a853_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_eb97_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_eb97_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_eb97_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c1_4287_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c1_4287_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c1_4287_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c1_4287_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c7_7683_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c7_7683_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c7_7683_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c7_7683_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2590_c7_157b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2590_c7_157b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2591_c7_7683_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2590_c7_157b_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2590_c40_7c9c_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2590_c40_7c9c_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2590_c40_7c9c_previous_stack_read : unsigned(15 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2590_c40_7c9c_previous_device_ram_read : unsigned(15 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2590_c40_7c9c_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2590_c40_7c9c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2590_c40_7c9c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2591_c11_8041_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2591_c11_8041_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2591_c11_8041_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c1_d2d1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c1_d2d1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c1_d2d1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c1_d2d1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c7_9ad0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c7_9ad0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c7_9ad0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c7_9ad0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2591_c7_7683_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2591_c7_7683_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2592_c7_9ad0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2591_c7_7683_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2591_c40_6834_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2591_c40_6834_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2591_c40_6834_previous_stack_read : unsigned(15 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2591_c40_6834_previous_device_ram_read : unsigned(15 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2591_c40_6834_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2591_c40_6834_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2591_c40_6834_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_4fde_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_4fde_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_4fde_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c1_3b5a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c1_3b5a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c1_3b5a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c1_3b5a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c7_498d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c7_498d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c7_498d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c7_498d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2592_c7_9ad0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2592_c7_9ad0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2593_c7_498d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2592_c7_9ad0_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2592_c40_97de_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2592_c40_97de_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2592_c40_97de_previous_stack_read : unsigned(15 downto 0);
 variable VAR_add_uxn_opcodes_h_l2592_c40_97de_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2592_c40_97de_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2593_c11_74c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2593_c11_74c9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2593_c11_74c9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c1_d3cb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c1_d3cb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c1_d3cb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c1_d3cb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c7_ea71_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c7_ea71_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c7_ea71_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c7_ea71_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2593_c7_498d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2593_c7_498d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2594_c7_ea71_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2593_c7_498d_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2593_c40_b951_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2593_c40_b951_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2593_c40_b951_previous_stack_read : unsigned(15 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2593_c40_b951_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2593_c40_b951_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_1cbf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_1cbf_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_1cbf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c1_8c8e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c1_8c8e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c1_8c8e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c1_8c8e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c7_b70d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c7_b70d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c7_b70d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c7_b70d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2594_c7_ea71_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2594_c7_ea71_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2595_c7_b70d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2594_c7_ea71_cond : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2594_c40_3537_phase : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2594_c40_3537_ins : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2594_c40_3537_previous_stack_read : unsigned(15 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2594_c40_3537_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2594_c40_3537_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_f255_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_f255_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_f255_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c1_2988_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c1_2988_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c1_2988_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c1_2988_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c7_2426_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c7_2426_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c7_2426_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c7_2426_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2595_c7_b70d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2595_c7_b70d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2596_c7_2426_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2595_c7_b70d_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2595_c40_50bd_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2595_c40_50bd_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2595_c40_50bd_previous_stack_read : unsigned(15 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2595_c40_50bd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2595_c40_50bd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_d91e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_d91e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_d91e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c1_9856_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c1_9856_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c1_9856_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c1_9856_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c7_c0ec_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c7_c0ec_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c7_c0ec_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c7_c0ec_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2596_c7_2426_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2596_c7_2426_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2597_c7_c0ec_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2596_c7_2426_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2596_c40_feff_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2596_c40_feff_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2596_c40_feff_previous_stack_read : unsigned(15 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2596_c40_feff_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2596_c40_feff_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2597_c11_1e97_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2597_c11_1e97_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2597_c11_1e97_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c1_38b1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c1_38b1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c1_38b1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c1_38b1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c7_f595_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c7_f595_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c7_f595_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c7_f595_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2597_c7_c0ec_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2597_c7_c0ec_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2598_c7_f595_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2597_c7_c0ec_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2597_c40_9413_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2597_c40_9413_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2597_c40_9413_previous_stack_read : unsigned(15 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2597_c40_9413_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2597_c40_9413_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_0f1f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_0f1f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_0f1f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c1_ccf5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c1_ccf5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c1_ccf5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c1_ccf5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c7_1fbf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c7_1fbf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c7_1fbf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c7_1fbf_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2598_c7_f595_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2598_c7_f595_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2599_c7_1fbf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2598_c7_f595_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2598_c40_cc14_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2598_c40_cc14_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2598_c40_cc14_previous_stack_read : unsigned(15 downto 0);
 variable VAR_div_uxn_opcodes_h_l2598_c40_cc14_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2598_c40_cc14_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_540a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_540a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_540a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c1_2417_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c1_2417_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c1_2417_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c1_2417_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c7_683b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c7_683b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c7_683b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c7_683b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2599_c7_1fbf_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2599_c7_1fbf_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2600_c7_683b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2599_c7_1fbf_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2599_c40_3dd1_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2599_c40_3dd1_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2599_c40_3dd1_previous_stack_read : unsigned(15 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2599_c40_3dd1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2599_c40_3dd1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_6438_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_6438_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_6438_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_84ac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_84ac_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_84ac_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_84ac_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c7_1efa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c7_1efa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c7_1efa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c7_1efa_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2600_c7_683b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2600_c7_683b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2601_c7_1efa_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2600_c7_683b_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2600_c40_3c81_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2600_c40_3c81_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2600_c40_3c81_previous_stack_read : unsigned(15 downto 0);
 variable VAR_and_uxn_opcodes_h_l2600_c40_3c81_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2600_c40_3c81_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_ff18_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_ff18_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_ff18_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c1_0b00_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c1_0b00_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c1_0b00_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c1_0b00_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c7_620a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c7_620a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c7_620a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c7_620a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2601_c7_1efa_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2601_c7_1efa_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2602_c7_620a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2601_c7_1efa_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2601_c40_991a_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2601_c40_991a_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2601_c40_991a_previous_stack_read : unsigned(15 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2601_c40_991a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2601_c40_991a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_d90e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_d90e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_d90e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c1_180f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c1_180f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c1_180f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c1_180f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c7_5e21_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c7_5e21_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c7_5e21_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c7_5e21_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2602_c7_620a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2602_c7_620a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2603_c7_5e21_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2602_c7_620a_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2602_c40_ceea_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2602_c40_ceea_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2602_c40_ceea_previous_stack_read : unsigned(15 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2602_c40_ceea_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2602_c40_ceea_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c11_ff07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c11_ff07_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c11_ff07_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_d680_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_d680_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_d680_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_d680_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c7_1270_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c7_1270_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c7_1270_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c7_1270_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2603_c7_5e21_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2603_c7_5e21_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2604_c7_1270_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2603_c7_5e21_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2603_c40_b642_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2603_c40_b642_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2603_c40_b642_previous_stack_read : unsigned(15 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2603_c40_b642_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2603_c40_b642_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b354_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b354_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b354_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c1_0fac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c1_0fac_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c1_0fac_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c1_0fac_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c7_5e80_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c7_5e80_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c7_5e80_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c7_5e80_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2604_c7_1270_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2604_c7_1270_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2605_c7_5e80_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2604_c7_1270_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2604_c40_8850_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2604_c40_8850_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2604_c40_8850_previous_stack_read : unsigned(15 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2604_c40_8850_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2604_c40_8850_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_d529_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_d529_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_d529_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c1_0a11_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c1_0a11_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c1_0a11_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c1_0a11_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c7_2198_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c7_2198_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c7_2198_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c7_2198_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2605_c7_5e80_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2605_c7_5e80_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2606_c7_2198_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2605_c7_5e80_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2605_c40_71d3_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2605_c40_71d3_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2605_c40_71d3_previous_stack_read : unsigned(15 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2605_c40_71d3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2605_c40_71d3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f0c7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f0c7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f0c7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c1_d368_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c1_d368_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c1_d368_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c1_d368_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c7_a5d0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c7_a5d0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c7_a5d0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c7_a5d0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2606_c7_2198_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2606_c7_2198_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2607_c7_a5d0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2606_c7_2198_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2606_c40_5c65_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2606_c40_5c65_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2606_c40_5c65_previous_stack_read : unsigned(15 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2606_c40_5c65_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2606_c40_5c65_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_be22_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_be22_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_be22_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c1_b90f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c1_b90f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c1_b90f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c1_b90f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2607_c7_a5d0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2607_c7_a5d0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2607_c7_a5d0_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2607_c40_c639_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2607_c40_c639_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2607_c40_c639_previous_stack_read : unsigned(15 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2607_c40_c639_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2607_c40_c639_return_output : opcode_result_t;
 variable VAR_MUX_uxn_opcodes_h_l2609_c18_9746_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2609_c18_318d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2609_c18_318d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2609_c18_318d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2609_c18_2605_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2609_c18_2605_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2609_c18_2605_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2609_c18_9746_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2609_c18_9746_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2609_c18_9746_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2610_c2_a2ec_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2610_c17_bd8f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2610_c2_a2ec_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2610_c2_a2ec_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2612_c6_97e9_return_output : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2612_c2_2c8f_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2613_c3_5b0b_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2612_c2_2c8f_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2612_c2_2c8f_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2612_c2_2c8f_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2612_c2_2c8f_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2613_c3_5b0b_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2612_c2_2c8f_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2612_c2_2c8f_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2612_c2_2c8f_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2613_c3_5b0b_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2613_c3_5b0b_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l2616_c4_1e8b : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2613_c3_5b0b_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2613_c3_5b0b_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l2614_c4_643e : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2613_c3_5b0b_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2613_c3_5b0b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2614_c4_a0ac_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2614_c4_a0ac_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2614_c4_a0ac_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2616_c4_9de2_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2616_c4_9de2_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2616_c4_9de2_return_output : signed(9 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2620_c29_2608_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2620_c29_2608_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2620_c29_2608_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2620_c29_2608_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2620_c19_3388_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2620_c19_f9e4_left : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2620_c68_cc26_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2620_c58_e09e_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2620_c19_f9e4_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2620_c19_f9e4_return_output : unsigned(8 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l2621_c2_3caa : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2621_c2_e601_left : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2621_c20_119f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2621_c20_119f_iftrue : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2621_c20_119f_iffalse : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2621_c20_119f_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2621_c2_e601_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2621_c2_e601_return_output : unsigned(9 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_address0 : unsigned(8 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_write0_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_write0_enable : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_address1 : unsigned(8 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_write1_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_write1_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2624_c3_fe7e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2624_c3_fe7e_iftrue : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2624_c3_fe7e_iffalse : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2624_c3_fe7e_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2625_c3_259d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2625_c3_259d_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2625_c3_259d_iffalse : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2625_c52_6f82_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2625_c52_6f82_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2625_c42_f0f8_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2625_c3_259d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2626_c3_0a38_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2626_c3_0a38_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2626_c3_0a38_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2627_c3_0d28_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2627_c3_0d28_iftrue : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2627_c3_0d28_iffalse : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2627_c42_5e8f_left : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2627_c42_5e8f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2627_c42_5e8f_return_output : unsigned(9 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2627_c3_0d28_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2628_c3_e0ed_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2628_c3_e0ed_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2628_c3_e0ed_iffalse : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2628_c42_4c16_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2628_c3_e0ed_return_output : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2633_c39_753c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2634_c40_aa38_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_16bit_d41d_uxn_opcodes_h_l2635_c40_5831_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2636_c34_0d98_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2638_c33_a0bc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2639_c34_c2ff_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2640_c37_645d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint24_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l2641_c33_c56a_return_output : unsigned(23 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2643_c32_331d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2616_l2614_DUPLICATE_6dba_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2614_l2616_DUPLICATE_4599_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l2627_l2625_l2626_l2628_l2624_DUPLICATE_b058_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2625_l2628_l2637_DUPLICATE_7a01_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2626_l2629_DUPLICATE_fa1c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2628_l2642_DUPLICATE_c80f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9a3e_uxn_opcodes_h_l2515_l2645_DUPLICATE_c047_return_output : eval_opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_sp0 : unsigned(7 downto 0);
variable REG_VAR_sp1 : unsigned(7 downto 0);
variable REG_VAR_ins_a_3f : unsigned(7 downto 0);
variable REG_VAR_opc : unsigned(7 downto 0);
variable REG_VAR_stack_index : unsigned(0 downto 0);
variable REG_VAR_is_wait : unsigned(0 downto 0);
variable REG_VAR_is_imm : unsigned(0 downto 0);
variable REG_VAR_stack_address : unsigned(8 downto 0);
variable REG_VAR_previous_stack_read : unsigned(15 downto 0);
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c7_ff57_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c1_670f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_ce36_right := to_unsigned(52, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_d8c9_right := to_unsigned(41, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c1_47ab_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c7_2335_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c1_4ab1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c7_a38f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c1_7273_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c7_115a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_b7cd_right := to_unsigned(21, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2572_c11_deb5_right := to_unsigned(14, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_7ac2_right := to_unsigned(34, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_495b_right := to_unsigned(36, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c1_9856_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c7_c0ec_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c1_4d05_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c7_0b1d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_0f1f_right := to_unsigned(27, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_13c0_right := to_unsigned(64, 8);
     VAR_MUX_uxn_opcodes_h_l2531_c14_30cb_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c7_a035_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c1_6238_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_e8ee_right := to_unsigned(43, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c1_0a11_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c7_2198_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c11_ff07_right := to_unsigned(61, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c1_e6ea_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c7_2c4c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c1_d368_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c7_a5d0_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c7_205c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c1_95e2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c7_4440_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c1_266f_iffalse := to_unsigned(0, 1);
     VAR_is_wait_MUX_uxn_opcodes_h_l2538_c2_5792_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8781_right := to_unsigned(33, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_ff18_right := to_unsigned(60, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c7_1fbf_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c1_ccf5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_a073_right := to_unsigned(10, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_b620_right := to_unsigned(3, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_1cbf_right := to_unsigned(25, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c7_da25_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c1_c6be_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_7f20_right := to_unsigned(37, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c11_a4af_right := to_unsigned(224, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_9530_right := to_unsigned(16, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c1_c3d1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c7_9db0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c6_c949_right := to_unsigned(0, 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2609_c18_2605_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2624_c3_fe7e_iffalse := resize(to_unsigned(0, 1), 9);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c1_6953_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c7_f031_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c1_b870_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c7_4920_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_f4de_right := to_unsigned(19, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c11_164b_right := to_unsigned(32, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2559_c11_6485_right := to_unsigned(39, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c7_b70d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c1_8c8e_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_f7d4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c7_af91_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c1_4287_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c7_7683_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_eb97_right := to_unsigned(23, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_20fd_right := to_unsigned(2, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f0c7_right := to_unsigned(31, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c1_2a2d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c7_19cc_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c7_1efa_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_84ac_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c7_cbdf_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_fbd5_right := to_unsigned(5, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c1_8a48_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c7_148a_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2531_c14_30cb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2530_c14_cbfa_right := to_unsigned(63, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_f255_right := to_unsigned(57, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c1_b90f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_7306_right := to_unsigned(12, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c7_2fe5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_ce56_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c7_3d61_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c1_4f85_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b354_right := to_unsigned(30, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c7_a205_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_75cc_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_d91e_right := to_unsigned(26, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c7_157b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c1_b6d3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2531_c14_1762_right := to_unsigned(32, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_81d0_right := to_unsigned(4, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c7_23c6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c1_edad_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_e716_right := to_unsigned(192, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c7_afca_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_e2db_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c7_2629_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c1_75fc_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c1_af2f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c7_cf3a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_5dab_right := to_unsigned(53, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c1_3b5a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c7_498d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_618c_right := to_unsigned(17, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_7def_right := to_unsigned(22, 8);
     VAR_MUX_uxn_opcodes_h_l2621_c20_119f_iftrue := to_unsigned(256, 9);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2551_c11_4125_right := to_unsigned(35, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_c57a_right := to_unsigned(47, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c1_0fac_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c7_5e80_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2531_c14_9a48_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c7_8c50_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c1_9bf9_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_d680_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c7_1270_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_e1b3_right := to_unsigned(1, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_cb0b_right := to_unsigned(128, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c1_2417_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c7_683b_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c7_df66_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c1_c77c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2627_c42_5e8f_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c7_f595_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c1_38b1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c7_9ad0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c1_d2d1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c7_2426_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c1_2988_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c1_d51f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c7_ba37_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2543_c11_6e32_right := to_unsigned(160, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c1_2826_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c7_f981_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_4fde_right := to_unsigned(24, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_540a_right := to_unsigned(59, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c1_5e1f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c7_f736_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c1_3d40_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c7_d61b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_5bf4_right := to_unsigned(42, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c7_dc9e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c1_0256_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c7_5548_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_1a80_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c7_474f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c1_f247_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_d529_right := to_unsigned(62, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c7_5280_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c1_92e3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_62b1_right := to_unsigned(46, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c7_620a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c1_0b00_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_ffc5_right := to_unsigned(18, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_ca0a_right := to_unsigned(44, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_11c8_right := to_unsigned(6, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_35e0_right := to_unsigned(40, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c1_216d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c7_7f81_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c7_653e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_0fd3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_393b_right := to_unsigned(13, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c7_3516_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_4066_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c1_d3cb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c7_ea71_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c7_c0d8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c1_b1e7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c7_a82c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_4525_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c7_5e21_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c1_180f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c7_72b2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_ba06_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_afaa_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c7_a0c7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_5fd5_right := to_unsigned(9, 8);
     VAR_MUX_uxn_opcodes_h_l2609_c18_9746_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2621_c20_119f_iffalse := resize(to_unsigned(0, 1), 9);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_bcc6_right := to_unsigned(7, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_feb8_right := to_unsigned(96, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c1_4611_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c7_ee9c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_4d63_right := to_unsigned(20, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_13f2_right := to_unsigned(8, 8);
     VAR_MUX_uxn_opcodes_h_l2625_c3_259d_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_06db_right := to_unsigned(45, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c1_0ae6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c7_955d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2593_c11_74c9_right := to_unsigned(56, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_1ef8_right := to_unsigned(51, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c7_0356_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_6151_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c7_db71_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c1_6d0d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_63ac_right := to_unsigned(38, 8);
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2531_c14_8511_right := to_unsigned(223, 8);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2609_c18_318d_right := to_unsigned(64, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2597_c11_1e97_right := to_unsigned(58, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_c5b8_right := to_unsigned(15, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2591_c11_8041_right := to_unsigned(55, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_6438_right := to_unsigned(28, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c1_d8f7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c7_43f0_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2609_c18_9746_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c7_a31a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c1_83c7_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_d95c_right := to_unsigned(54, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_be22_right := to_unsigned(63, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2566_c11_61a5_right := to_unsigned(11, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_d90e_right := to_unsigned(29, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c1_d332_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c7_f572_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_c6c4_right := to_unsigned(50, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c7_8b31_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c1_d7a6_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_c6ab_right := to_unsigned(48, 8);
     VAR_is_wait_MUX_uxn_opcodes_h_l2538_c2_5792_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_466a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c7_b73a_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c7_f7cf_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c1_2c24_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_4223_right := to_unsigned(49, 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c7_cbdf_iffalse := VAR_CLOCK_ENABLE;
     VAR_stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2530_c14_cbfa_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2609_c18_318d_left := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l2532_c8_3899_iftrue := VAR_ins;
     VAR_add2_uxn_opcodes_h_l2593_c40_b951_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l2592_c40_97de_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l2601_c40_991a_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l2600_c40_3c81_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l2589_c40_a853_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l2588_c40_69c1_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l2591_c40_6834_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l2590_c40_7c9c_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l2599_c40_3dd1_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l2598_c40_cc14_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l2557_c40_190d_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l2556_c40_9f2a_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l2605_c40_71d3_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l2604_c40_8850_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l2561_c40_93d5_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l2560_c40_49aa_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l2565_c40_fd50_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l2564_c40_6836_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l2547_c40_8cb1_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l2546_c40_1930_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l2571_c40_5828_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l2570_c40_f0d2_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l2569_c40_d58f_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l2568_c40_84d1_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l2573_c40_8faf_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l2572_c40_6d7b_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l2585_c40_36dd_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l2584_c40_8757_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l2581_c40_4b84_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l2580_c40_88bc_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l2577_c40_a1fd_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l2576_c40_72ae_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l2567_c40_dc84_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l2566_c40_a5e1_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l2597_c40_9413_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l2596_c40_feff_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l2563_c40_9708_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l2562_c40_5284_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l2551_c40_96e3_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l2550_c40_3b9f_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l2603_c40_b642_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l2602_c40_ceea_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l2559_c40_8f4c_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l2558_c40_b12c_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l2549_c40_8f2e_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l2548_c40_2076_ins := VAR_ins;
     VAR_rot2_uxn_opcodes_h_l2555_c40_7aa5_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l2554_c40_4358_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l2607_c40_c639_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l2606_c40_5c65_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l2587_c40_e790_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l2586_c40_c4ac_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l2575_c40_d79c_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l2574_c40_399b_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l2582_c40_9cb6_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l2583_c40_2538_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l2579_c40_f4b9_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l2578_c40_49bc_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l2595_c40_50bd_ins := VAR_ins;
     VAR_sub_uxn_opcodes_h_l2594_c40_3537_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l2553_c40_5c76_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l2552_c40_3757_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l2607_c7_a5d0_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l2539_c40_2c85_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l2570_c40_f0d2_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l2540_c40_8d3b_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l2568_c40_84d1_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l2541_c40_2ec7_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l2573_c40_8faf_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l2572_c40_6d7b_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l2581_c40_4b84_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l2580_c40_88bc_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2543_c40_e8d6_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2545_c40_20a4_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2542_c40_3478_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2544_c40_c683_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l2582_c40_9cb6_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l2583_c40_2538_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l2593_c40_b951_phase := VAR_phase;
     VAR_add_uxn_opcodes_h_l2592_c40_97de_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l2601_c40_991a_phase := VAR_phase;
     VAR_and_uxn_opcodes_h_l2600_c40_3c81_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2589_c40_a853_phase := VAR_phase;
     VAR_dei_uxn_opcodes_h_l2588_c40_69c1_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l2591_c40_6834_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l2590_c40_7c9c_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l2599_c40_3dd1_phase := VAR_phase;
     VAR_div_uxn_opcodes_h_l2598_c40_cc14_phase := VAR_phase;
     VAR_dup2_uxn_opcodes_h_l2557_c40_190d_phase := VAR_phase;
     VAR_dup_uxn_opcodes_h_l2556_c40_9f2a_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l2605_c40_71d3_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l2604_c40_8850_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l2561_c40_93d5_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l2560_c40_49aa_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l2565_c40_fd50_phase := VAR_phase;
     VAR_gth_uxn_opcodes_h_l2564_c40_6836_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l2547_c40_8cb1_phase := VAR_phase;
     VAR_inc_uxn_opcodes_h_l2546_c40_1930_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l2539_c40_2c85_phase := VAR_phase;
     VAR_jcn2_uxn_opcodes_h_l2571_c40_5828_phase := VAR_phase;
     VAR_jcn_uxn_opcodes_h_l2570_c40_f0d2_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l2540_c40_8d3b_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l2569_c40_d58f_phase := VAR_phase;
     VAR_jmp_uxn_opcodes_h_l2568_c40_84d1_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l2541_c40_2ec7_phase := VAR_phase;
     VAR_jsr2_uxn_opcodes_h_l2573_c40_8faf_phase := VAR_phase;
     VAR_jsr_uxn_opcodes_h_l2572_c40_6d7b_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l2585_c40_36dd_phase := VAR_phase;
     VAR_lda_uxn_opcodes_h_l2584_c40_8757_phase := VAR_phase;
     VAR_ldr2_uxn_opcodes_h_l2581_c40_4b84_phase := VAR_phase;
     VAR_ldr_uxn_opcodes_h_l2580_c40_88bc_phase := VAR_phase;
     VAR_ldz2_uxn_opcodes_h_l2577_c40_a1fd_phase := VAR_phase;
     VAR_ldz_uxn_opcodes_h_l2576_c40_72ae_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2543_c40_e8d6_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2545_c40_20a4_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2542_c40_3478_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2544_c40_c683_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l2567_c40_dc84_phase := VAR_phase;
     VAR_lth_uxn_opcodes_h_l2566_c40_a5e1_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l2597_c40_9413_phase := VAR_phase;
     VAR_mul_uxn_opcodes_h_l2596_c40_feff_phase := VAR_phase;
     VAR_neq2_uxn_opcodes_h_l2563_c40_9708_phase := VAR_phase;
     VAR_neq_uxn_opcodes_h_l2562_c40_5284_phase := VAR_phase;
     VAR_nip2_uxn_opcodes_h_l2551_c40_96e3_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l2550_c40_3b9f_phase := VAR_phase;
     VAR_ora2_uxn_opcodes_h_l2603_c40_b642_phase := VAR_phase;
     VAR_ora_uxn_opcodes_h_l2602_c40_ceea_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l2559_c40_8f4c_phase := VAR_phase;
     VAR_ovr_uxn_opcodes_h_l2558_c40_b12c_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l2549_c40_8f2e_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l2548_c40_2076_phase := VAR_phase;
     VAR_rot2_uxn_opcodes_h_l2555_c40_7aa5_phase := VAR_phase;
     VAR_rot_uxn_opcodes_h_l2554_c40_4358_phase := VAR_phase;
     VAR_sft2_uxn_opcodes_h_l2607_c40_c639_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l2606_c40_5c65_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l2587_c40_e790_phase := VAR_phase;
     VAR_sta_uxn_opcodes_h_l2586_c40_c4ac_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l2575_c40_d79c_phase := VAR_phase;
     VAR_sth_uxn_opcodes_h_l2574_c40_399b_phase := VAR_phase;
     VAR_str1_uxn_opcodes_h_l2582_c40_9cb6_phase := VAR_phase;
     VAR_str2_uxn_opcodes_h_l2583_c40_2538_phase := VAR_phase;
     VAR_stz2_uxn_opcodes_h_l2579_c40_f4b9_phase := VAR_phase;
     VAR_stz_uxn_opcodes_h_l2578_c40_49bc_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l2595_c40_50bd_phase := VAR_phase;
     VAR_sub_uxn_opcodes_h_l2594_c40_3537_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l2553_c40_5c76_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l2552_c40_3757_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2589_c40_a853_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_dei_uxn_opcodes_h_l2588_c40_69c1_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2591_c40_6834_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo_uxn_opcodes_h_l2590_c40_7c9c_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2591_c40_6834_previous_ram_read := VAR_previous_ram_read;
     VAR_deo_uxn_opcodes_h_l2590_c40_7c9c_previous_ram_read := VAR_previous_ram_read;
     VAR_jci_uxn_opcodes_h_l2539_c40_2c85_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l2540_c40_8d3b_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l2541_c40_2ec7_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l2585_c40_36dd_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l2584_c40_8757_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l2581_c40_4b84_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l2580_c40_88bc_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l2577_c40_a1fd_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l2576_c40_72ae_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2543_c40_e8d6_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2545_c40_20a4_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2542_c40_3478_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2544_c40_c683_previous_ram_read := VAR_previous_ram_read;
     VAR_add2_uxn_opcodes_h_l2593_c40_b951_previous_stack_read := previous_stack_read;
     VAR_add_uxn_opcodes_h_l2592_c40_97de_previous_stack_read := previous_stack_read;
     VAR_and2_uxn_opcodes_h_l2601_c40_991a_previous_stack_read := previous_stack_read;
     VAR_and_uxn_opcodes_h_l2600_c40_3c81_previous_stack_read := previous_stack_read;
     VAR_dei2_uxn_opcodes_h_l2589_c40_a853_previous_stack_read := resize(previous_stack_read, 8);
     VAR_dei_uxn_opcodes_h_l2588_c40_69c1_previous_stack_read := resize(previous_stack_read, 8);
     VAR_deo2_uxn_opcodes_h_l2591_c40_6834_previous_stack_read := previous_stack_read;
     VAR_deo_uxn_opcodes_h_l2590_c40_7c9c_previous_stack_read := previous_stack_read;
     VAR_div2_uxn_opcodes_h_l2599_c40_3dd1_previous_stack_read := previous_stack_read;
     VAR_div_uxn_opcodes_h_l2598_c40_cc14_previous_stack_read := previous_stack_read;
     VAR_dup2_uxn_opcodes_h_l2557_c40_190d_previous_stack_read := previous_stack_read;
     VAR_dup_uxn_opcodes_h_l2556_c40_9f2a_previous_stack_read := resize(previous_stack_read, 8);
     VAR_eor2_uxn_opcodes_h_l2605_c40_71d3_previous_stack_read := previous_stack_read;
     VAR_eor_uxn_opcodes_h_l2604_c40_8850_previous_stack_read := previous_stack_read;
     VAR_equ2_uxn_opcodes_h_l2561_c40_93d5_previous_stack_read := previous_stack_read;
     VAR_equ_uxn_opcodes_h_l2560_c40_49aa_previous_stack_read := previous_stack_read;
     VAR_gth2_uxn_opcodes_h_l2565_c40_fd50_previous_stack_read := previous_stack_read;
     VAR_gth_uxn_opcodes_h_l2564_c40_6836_previous_stack_read := previous_stack_read;
     VAR_inc2_uxn_opcodes_h_l2547_c40_8cb1_previous_stack_read := previous_stack_read;
     VAR_inc_uxn_opcodes_h_l2546_c40_1930_previous_stack_read := resize(previous_stack_read, 8);
     VAR_jci_uxn_opcodes_h_l2539_c40_2c85_previous_stack_read := resize(previous_stack_read, 8);
     VAR_jcn2_uxn_opcodes_h_l2571_c40_5828_previous_stack_read := previous_stack_read;
     VAR_jcn_uxn_opcodes_h_l2570_c40_f0d2_previous_stack_read := previous_stack_read;
     VAR_jmp2_uxn_opcodes_h_l2569_c40_d58f_previous_stack_read := previous_stack_read;
     VAR_jmp_uxn_opcodes_h_l2568_c40_84d1_previous_stack_read := resize(previous_stack_read, 8);
     VAR_jsr2_uxn_opcodes_h_l2573_c40_8faf_previous_stack_read := previous_stack_read;
     VAR_jsr_uxn_opcodes_h_l2572_c40_6d7b_previous_stack_read := resize(previous_stack_read, 8);
     VAR_lda2_uxn_opcodes_h_l2585_c40_36dd_previous_stack_read := previous_stack_read;
     VAR_lda_uxn_opcodes_h_l2584_c40_8757_previous_stack_read := previous_stack_read;
     VAR_ldr2_uxn_opcodes_h_l2581_c40_4b84_previous_stack_read := resize(previous_stack_read, 8);
     VAR_ldr_uxn_opcodes_h_l2580_c40_88bc_previous_stack_read := resize(previous_stack_read, 8);
     VAR_ldz2_uxn_opcodes_h_l2577_c40_a1fd_previous_stack_read := resize(previous_stack_read, 8);
     VAR_ldz_uxn_opcodes_h_l2576_c40_72ae_previous_stack_read := resize(previous_stack_read, 8);
     VAR_lth2_uxn_opcodes_h_l2567_c40_dc84_previous_stack_read := previous_stack_read;
     VAR_lth_uxn_opcodes_h_l2566_c40_a5e1_previous_stack_read := previous_stack_read;
     VAR_mul2_uxn_opcodes_h_l2597_c40_9413_previous_stack_read := previous_stack_read;
     VAR_mul_uxn_opcodes_h_l2596_c40_feff_previous_stack_read := previous_stack_read;
     VAR_neq2_uxn_opcodes_h_l2563_c40_9708_previous_stack_read := previous_stack_read;
     VAR_neq_uxn_opcodes_h_l2562_c40_5284_previous_stack_read := previous_stack_read;
     VAR_nip2_uxn_opcodes_h_l2551_c40_96e3_previous_stack_read := previous_stack_read;
     VAR_nip_uxn_opcodes_h_l2550_c40_3b9f_previous_stack_read := resize(previous_stack_read, 8);
     VAR_ora2_uxn_opcodes_h_l2603_c40_b642_previous_stack_read := previous_stack_read;
     VAR_ora_uxn_opcodes_h_l2602_c40_ceea_previous_stack_read := previous_stack_read;
     VAR_ovr2_uxn_opcodes_h_l2559_c40_8f4c_previous_stack_read := previous_stack_read;
     VAR_ovr_uxn_opcodes_h_l2558_c40_b12c_previous_stack_read := previous_stack_read;
     VAR_rot2_uxn_opcodes_h_l2555_c40_7aa5_previous_stack_read := previous_stack_read;
     VAR_rot_uxn_opcodes_h_l2554_c40_4358_previous_stack_read := previous_stack_read;
     VAR_sft2_uxn_opcodes_h_l2607_c40_c639_previous_stack_read := previous_stack_read;
     VAR_sft_uxn_opcodes_h_l2606_c40_5c65_previous_stack_read := previous_stack_read;
     VAR_sta2_uxn_opcodes_h_l2587_c40_e790_previous_stack_read := previous_stack_read;
     VAR_sta_uxn_opcodes_h_l2586_c40_c4ac_previous_stack_read := previous_stack_read;
     VAR_sth2_uxn_opcodes_h_l2575_c40_d79c_previous_stack_read := previous_stack_read;
     VAR_sth_uxn_opcodes_h_l2574_c40_399b_previous_stack_read := resize(previous_stack_read, 8);
     VAR_str1_uxn_opcodes_h_l2582_c40_9cb6_previous_stack_read := previous_stack_read;
     VAR_str2_uxn_opcodes_h_l2583_c40_2538_previous_stack_read := previous_stack_read;
     VAR_stz2_uxn_opcodes_h_l2579_c40_f4b9_previous_stack_read := previous_stack_read;
     VAR_stz_uxn_opcodes_h_l2578_c40_49bc_previous_stack_read := previous_stack_read;
     VAR_sub2_uxn_opcodes_h_l2595_c40_50bd_previous_stack_read := previous_stack_read;
     VAR_sub_uxn_opcodes_h_l2594_c40_3537_previous_stack_read := previous_stack_read;
     VAR_swp2_uxn_opcodes_h_l2553_c40_5c76_previous_stack_read := previous_stack_read;
     VAR_swp_uxn_opcodes_h_l2552_c40_3757_previous_stack_read := previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2616_c4_9de2_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l2612_c2_2c8f_iffalse := sp0;
     VAR_sp0_MUX_uxn_opcodes_h_l2613_c3_5b0b_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2614_c4_a0ac_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l2612_c2_2c8f_iffalse := sp1;
     VAR_sp1_MUX_uxn_opcodes_h_l2613_c3_5b0b_iffalse := sp1;
     -- BIN_OP_AND[uxn_opcodes_h_l2609_c18_318d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2609_c18_318d_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2609_c18_318d_left;
     BIN_OP_AND_uxn_opcodes_h_l2609_c18_318d_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2609_c18_318d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2609_c18_318d_return_output := BIN_OP_AND_uxn_opcodes_h_l2609_c18_318d_return_output;

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2538_c2_5792] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2538_c2_5792_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- BIN_OP_AND[uxn_opcodes_h_l2530_c14_cbfa] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2530_c14_cbfa_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2530_c14_cbfa_left;
     BIN_OP_AND_uxn_opcodes_h_l2530_c14_cbfa_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2530_c14_cbfa_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2530_c14_cbfa_return_output := BIN_OP_AND_uxn_opcodes_h_l2530_c14_cbfa_return_output;

     -- Submodule level 1
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2531_c14_8511_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2530_c14_cbfa_return_output;
     VAR_MUX_uxn_opcodes_h_l2532_c8_3899_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l2530_c14_cbfa_return_output;
     REG_VAR_ins_a_3f := VAR_BIN_OP_AND_uxn_opcodes_h_l2530_c14_cbfa_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2609_c18_2605_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2609_c18_318d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2538_c2_5792_return_output;
     -- BIN_OP_XOR[uxn_opcodes_h_l2531_c14_8511] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2531_c14_8511_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2531_c14_8511_left;
     BIN_OP_XOR_uxn_opcodes_h_l2531_c14_8511_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2531_c14_8511_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2531_c14_8511_return_output := BIN_OP_XOR_uxn_opcodes_h_l2531_c14_8511_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2609_c18_2605] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2609_c18_2605_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2609_c18_2605_left;
     BIN_OP_GT_uxn_opcodes_h_l2609_c18_2605_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2609_c18_2605_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2609_c18_2605_return_output := BIN_OP_GT_uxn_opcodes_h_l2609_c18_2605_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2609_c18_9746_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2609_c18_2605_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2531_c14_1762_left := VAR_BIN_OP_XOR_uxn_opcodes_h_l2531_c14_8511_return_output;
     -- MUX[uxn_opcodes_h_l2609_c18_9746] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2609_c18_9746_cond <= VAR_MUX_uxn_opcodes_h_l2609_c18_9746_cond;
     MUX_uxn_opcodes_h_l2609_c18_9746_iftrue <= VAR_MUX_uxn_opcodes_h_l2609_c18_9746_iftrue;
     MUX_uxn_opcodes_h_l2609_c18_9746_iffalse <= VAR_MUX_uxn_opcodes_h_l2609_c18_9746_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2609_c18_9746_return_output := MUX_uxn_opcodes_h_l2609_c18_9746_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2531_c14_1762] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2531_c14_1762_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2531_c14_1762_left;
     BIN_OP_OR_uxn_opcodes_h_l2531_c14_1762_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2531_c14_1762_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2531_c14_1762_return_output := BIN_OP_OR_uxn_opcodes_h_l2531_c14_1762_return_output;

     -- Submodule level 3
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2531_c14_5ff0_expr := VAR_BIN_OP_OR_uxn_opcodes_h_l2531_c14_1762_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2610_c2_a2ec_left := VAR_MUX_uxn_opcodes_h_l2609_c18_9746_return_output;
     -- UNARY_OP_NOT[uxn_opcodes_h_l2531_c14_5ff0] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l2531_c14_5ff0_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l2531_c14_5ff0_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2531_c14_5ff0_return_output := UNARY_OP_NOT_uxn_opcodes_h_l2531_c14_5ff0_return_output;

     -- Submodule level 4
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2531_c14_9a48_left := VAR_UNARY_OP_NOT_uxn_opcodes_h_l2531_c14_5ff0_return_output;
     -- BIN_OP_NEQ[uxn_opcodes_h_l2531_c14_9a48] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_opcodes_h_l2531_c14_9a48_left <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2531_c14_9a48_left;
     BIN_OP_NEQ_uxn_opcodes_h_l2531_c14_9a48_right <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2531_c14_9a48_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2531_c14_9a48_return_output := BIN_OP_NEQ_uxn_opcodes_h_l2531_c14_9a48_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_opcodes_h_l2531_c14_30cb_cond := VAR_BIN_OP_NEQ_uxn_opcodes_h_l2531_c14_9a48_return_output;
     -- MUX[uxn_opcodes_h_l2531_c14_30cb] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2531_c14_30cb_cond <= VAR_MUX_uxn_opcodes_h_l2531_c14_30cb_cond;
     MUX_uxn_opcodes_h_l2531_c14_30cb_iftrue <= VAR_MUX_uxn_opcodes_h_l2531_c14_30cb_iftrue;
     MUX_uxn_opcodes_h_l2531_c14_30cb_iffalse <= VAR_MUX_uxn_opcodes_h_l2531_c14_30cb_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2531_c14_30cb_return_output := MUX_uxn_opcodes_h_l2531_c14_30cb_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_opcodes_h_l2532_c8_3899_cond := VAR_MUX_uxn_opcodes_h_l2531_c14_30cb_return_output;
     REG_VAR_is_imm := VAR_MUX_uxn_opcodes_h_l2531_c14_30cb_return_output;
     -- MUX[uxn_opcodes_h_l2532_c8_3899] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2532_c8_3899_cond <= VAR_MUX_uxn_opcodes_h_l2532_c8_3899_cond;
     MUX_uxn_opcodes_h_l2532_c8_3899_iftrue <= VAR_MUX_uxn_opcodes_h_l2532_c8_3899_iftrue;
     MUX_uxn_opcodes_h_l2532_c8_3899_iffalse <= VAR_MUX_uxn_opcodes_h_l2532_c8_3899_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output := MUX_uxn_opcodes_h_l2532_c8_3899_return_output;

     -- Submodule level 7
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c6_c949_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c11_164b_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_13c0_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_feb8_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_cb0b_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2543_c11_6e32_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_e716_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c11_a4af_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_e1b3_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8781_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_20fd_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_7ac2_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_b620_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2551_c11_4125_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_81d0_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_495b_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_fbd5_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_7f20_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_11c8_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_63ac_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_bcc6_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2559_c11_6485_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_13f2_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_35e0_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_5fd5_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_d8c9_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_a073_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_5bf4_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2566_c11_61a5_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_e8ee_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_7306_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_ca0a_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_393b_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_06db_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2572_c11_deb5_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_62b1_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_c5b8_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_c57a_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_9530_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_c6ab_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_618c_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_4223_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_ffc5_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_c6c4_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_f4de_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_1ef8_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_4d63_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_ce36_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_b7cd_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_5dab_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_7def_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_d95c_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_eb97_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2591_c11_8041_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_4fde_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2593_c11_74c9_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_1cbf_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_f255_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_d91e_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2597_c11_1e97_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_0f1f_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_540a_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_6438_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_ff18_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_d90e_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c11_ff07_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b354_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_d529_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f0c7_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_be22_left := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     REG_VAR_opc := VAR_MUX_uxn_opcodes_h_l2532_c8_3899_return_output;
     -- BIN_OP_EQ[uxn_opcodes_h_l2581_c11_c6c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2581_c11_c6c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_c6c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2581_c11_c6c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_c6c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_c6c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2581_c11_c6c4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2572_c11_deb5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2572_c11_deb5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2572_c11_deb5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2572_c11_deb5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2572_c11_deb5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2572_c11_deb5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2572_c11_deb5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2568_c11_7306] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2568_c11_7306_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_7306_left;
     BIN_OP_EQ_uxn_opcodes_h_l2568_c11_7306_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_7306_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_7306_return_output := BIN_OP_EQ_uxn_opcodes_h_l2568_c11_7306_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2545_c11_a4af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2545_c11_a4af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c11_a4af_left;
     BIN_OP_EQ_uxn_opcodes_h_l2545_c11_a4af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c11_a4af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c11_a4af_return_output := BIN_OP_EQ_uxn_opcodes_h_l2545_c11_a4af_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2589_c11_d95c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2589_c11_d95c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_d95c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2589_c11_d95c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_d95c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_d95c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2589_c11_d95c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2596_c11_d91e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2596_c11_d91e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_d91e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2596_c11_d91e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_d91e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_d91e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2596_c11_d91e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2591_c11_8041] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2591_c11_8041_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2591_c11_8041_left;
     BIN_OP_EQ_uxn_opcodes_h_l2591_c11_8041_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2591_c11_8041_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2591_c11_8041_return_output := BIN_OP_EQ_uxn_opcodes_h_l2591_c11_8041_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2540_c11_13c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2540_c11_13c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_13c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2540_c11_13c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_13c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_13c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2540_c11_13c0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2585_c11_ce36] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2585_c11_ce36_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_ce36_left;
     BIN_OP_EQ_uxn_opcodes_h_l2585_c11_ce36_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_ce36_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_ce36_return_output := BIN_OP_EQ_uxn_opcodes_h_l2585_c11_ce36_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2576_c11_9530] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2576_c11_9530_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_9530_left;
     BIN_OP_EQ_uxn_opcodes_h_l2576_c11_9530_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_9530_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_9530_return_output := BIN_OP_EQ_uxn_opcodes_h_l2576_c11_9530_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2548_c11_20fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2548_c11_20fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_20fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2548_c11_20fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_20fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_20fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2548_c11_20fd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2607_c11_be22] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2607_c11_be22_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_be22_left;
     BIN_OP_EQ_uxn_opcodes_h_l2607_c11_be22_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_be22_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_be22_return_output := BIN_OP_EQ_uxn_opcodes_h_l2607_c11_be22_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2597_c11_1e97] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2597_c11_1e97_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2597_c11_1e97_left;
     BIN_OP_EQ_uxn_opcodes_h_l2597_c11_1e97_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2597_c11_1e97_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2597_c11_1e97_return_output := BIN_OP_EQ_uxn_opcodes_h_l2597_c11_1e97_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2587_c11_5dab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2587_c11_5dab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_5dab_left;
     BIN_OP_EQ_uxn_opcodes_h_l2587_c11_5dab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_5dab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_5dab_return_output := BIN_OP_EQ_uxn_opcodes_h_l2587_c11_5dab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2569_c11_ca0a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2569_c11_ca0a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_ca0a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2569_c11_ca0a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_ca0a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_ca0a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2569_c11_ca0a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2595_c11_f255] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2595_c11_f255_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_f255_left;
     BIN_OP_EQ_uxn_opcodes_h_l2595_c11_f255_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_f255_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_f255_return_output := BIN_OP_EQ_uxn_opcodes_h_l2595_c11_f255_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2563_c11_d8c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2563_c11_d8c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_d8c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2563_c11_d8c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_d8c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_d8c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2563_c11_d8c9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2560_c11_13f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2560_c11_13f2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_13f2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2560_c11_13f2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_13f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_13f2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2560_c11_13f2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2552_c11_81d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2552_c11_81d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_81d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2552_c11_81d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_81d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_81d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2552_c11_81d0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2561_c11_35e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2561_c11_35e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_35e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2561_c11_35e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_35e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_35e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2561_c11_35e0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2541_c11_feb8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2541_c11_feb8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_feb8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2541_c11_feb8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_feb8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_feb8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2541_c11_feb8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2606_c11_f0c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f0c7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f0c7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f0c7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f0c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f0c7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f0c7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2579_c11_4223] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2579_c11_4223_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_4223_left;
     BIN_OP_EQ_uxn_opcodes_h_l2579_c11_4223_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_4223_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_4223_return_output := BIN_OP_EQ_uxn_opcodes_h_l2579_c11_4223_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2586_c11_b7cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2586_c11_b7cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_b7cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2586_c11_b7cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_b7cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_b7cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2586_c11_b7cd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2582_c11_f4de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2582_c11_f4de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_f4de_left;
     BIN_OP_EQ_uxn_opcodes_h_l2582_c11_f4de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_f4de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_f4de_return_output := BIN_OP_EQ_uxn_opcodes_h_l2582_c11_f4de_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2550_c11_b620] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2550_c11_b620_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_b620_left;
     BIN_OP_EQ_uxn_opcodes_h_l2550_c11_b620_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_b620_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_b620_return_output := BIN_OP_EQ_uxn_opcodes_h_l2550_c11_b620_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2559_c11_6485] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2559_c11_6485_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2559_c11_6485_left;
     BIN_OP_EQ_uxn_opcodes_h_l2559_c11_6485_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2559_c11_6485_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2559_c11_6485_return_output := BIN_OP_EQ_uxn_opcodes_h_l2559_c11_6485_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2539_c11_164b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2539_c11_164b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c11_164b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2539_c11_164b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c11_164b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c11_164b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2539_c11_164b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2544_c11_e716] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2544_c11_e716_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_e716_left;
     BIN_OP_EQ_uxn_opcodes_h_l2544_c11_e716_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_e716_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_e716_return_output := BIN_OP_EQ_uxn_opcodes_h_l2544_c11_e716_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2602_c11_d90e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2602_c11_d90e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_d90e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2602_c11_d90e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_d90e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_d90e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2602_c11_d90e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2557_c11_63ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2557_c11_63ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_63ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l2557_c11_63ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_63ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_63ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l2557_c11_63ac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2593_c11_74c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2593_c11_74c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2593_c11_74c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2593_c11_74c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2593_c11_74c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2593_c11_74c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2593_c11_74c9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2584_c11_4d63] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2584_c11_4d63_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_4d63_left;
     BIN_OP_EQ_uxn_opcodes_h_l2584_c11_4d63_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_4d63_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_4d63_return_output := BIN_OP_EQ_uxn_opcodes_h_l2584_c11_4d63_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2590_c11_eb97] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2590_c11_eb97_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_eb97_left;
     BIN_OP_EQ_uxn_opcodes_h_l2590_c11_eb97_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_eb97_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_eb97_return_output := BIN_OP_EQ_uxn_opcodes_h_l2590_c11_eb97_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2542_c11_cb0b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2542_c11_cb0b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_cb0b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2542_c11_cb0b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_cb0b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_cb0b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2542_c11_cb0b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2594_c11_1cbf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2594_c11_1cbf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_1cbf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2594_c11_1cbf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_1cbf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_1cbf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2594_c11_1cbf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2547_c11_8781] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8781_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8781_left;
     BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8781_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8781_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8781_return_output := BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8781_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2577_c11_c6ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2577_c11_c6ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_c6ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l2577_c11_c6ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_c6ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_c6ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l2577_c11_c6ab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2553_c11_495b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2553_c11_495b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_495b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2553_c11_495b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_495b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_495b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2553_c11_495b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2562_c11_5fd5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2562_c11_5fd5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_5fd5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2562_c11_5fd5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_5fd5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_5fd5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2562_c11_5fd5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2566_c11_61a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2566_c11_61a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2566_c11_61a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2566_c11_61a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2566_c11_61a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2566_c11_61a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2566_c11_61a5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2554_c11_fbd5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2554_c11_fbd5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_fbd5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2554_c11_fbd5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_fbd5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_fbd5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2554_c11_fbd5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2588_c11_7def] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2588_c11_7def_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_7def_left;
     BIN_OP_EQ_uxn_opcodes_h_l2588_c11_7def_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_7def_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_7def_return_output := BIN_OP_EQ_uxn_opcodes_h_l2588_c11_7def_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2570_c11_393b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2570_c11_393b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_393b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2570_c11_393b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_393b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_393b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2570_c11_393b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2598_c11_0f1f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2598_c11_0f1f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_0f1f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2598_c11_0f1f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_0f1f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_0f1f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2598_c11_0f1f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2551_c11_4125] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2551_c11_4125_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2551_c11_4125_left;
     BIN_OP_EQ_uxn_opcodes_h_l2551_c11_4125_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2551_c11_4125_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2551_c11_4125_return_output := BIN_OP_EQ_uxn_opcodes_h_l2551_c11_4125_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2538_c6_c949] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2538_c6_c949_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c6_c949_left;
     BIN_OP_EQ_uxn_opcodes_h_l2538_c6_c949_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c6_c949_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c6_c949_return_output := BIN_OP_EQ_uxn_opcodes_h_l2538_c6_c949_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2599_c11_540a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2599_c11_540a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_540a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2599_c11_540a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_540a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_540a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2599_c11_540a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2600_c11_6438] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2600_c11_6438_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_6438_left;
     BIN_OP_EQ_uxn_opcodes_h_l2600_c11_6438_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_6438_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_6438_return_output := BIN_OP_EQ_uxn_opcodes_h_l2600_c11_6438_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2604_c11_b354] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b354_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b354_left;
     BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b354_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b354_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b354_return_output := BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b354_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2578_c11_618c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2578_c11_618c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_618c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2578_c11_618c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_618c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_618c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2578_c11_618c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2580_c11_ffc5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2580_c11_ffc5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_ffc5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2580_c11_ffc5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_ffc5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_ffc5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2580_c11_ffc5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2543_c11_6e32] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2543_c11_6e32_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2543_c11_6e32_left;
     BIN_OP_EQ_uxn_opcodes_h_l2543_c11_6e32_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2543_c11_6e32_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2543_c11_6e32_return_output := BIN_OP_EQ_uxn_opcodes_h_l2543_c11_6e32_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2573_c11_62b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2573_c11_62b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_62b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2573_c11_62b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_62b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_62b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2573_c11_62b1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2603_c11_ff07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2603_c11_ff07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c11_ff07_left;
     BIN_OP_EQ_uxn_opcodes_h_l2603_c11_ff07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c11_ff07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c11_ff07_return_output := BIN_OP_EQ_uxn_opcodes_h_l2603_c11_ff07_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2605_c11_d529] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2605_c11_d529_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_d529_left;
     BIN_OP_EQ_uxn_opcodes_h_l2605_c11_d529_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_d529_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_d529_return_output := BIN_OP_EQ_uxn_opcodes_h_l2605_c11_d529_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2567_c11_e8ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2567_c11_e8ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_e8ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l2567_c11_e8ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_e8ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_e8ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l2567_c11_e8ee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2575_c11_c57a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2575_c11_c57a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_c57a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2575_c11_c57a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_c57a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_c57a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2575_c11_c57a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2564_c11_a073] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2564_c11_a073_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_a073_left;
     BIN_OP_EQ_uxn_opcodes_h_l2564_c11_a073_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_a073_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_a073_return_output := BIN_OP_EQ_uxn_opcodes_h_l2564_c11_a073_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2601_c11_ff18] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2601_c11_ff18_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_ff18_left;
     BIN_OP_EQ_uxn_opcodes_h_l2601_c11_ff18_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_ff18_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_ff18_return_output := BIN_OP_EQ_uxn_opcodes_h_l2601_c11_ff18_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2571_c11_06db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2571_c11_06db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_06db_left;
     BIN_OP_EQ_uxn_opcodes_h_l2571_c11_06db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_06db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_06db_return_output := BIN_OP_EQ_uxn_opcodes_h_l2571_c11_06db_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2546_c11_e1b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2546_c11_e1b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_e1b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2546_c11_e1b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_e1b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_e1b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2546_c11_e1b3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2583_c11_1ef8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2583_c11_1ef8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_1ef8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2583_c11_1ef8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_1ef8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_1ef8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2583_c11_1ef8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2549_c11_7ac2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2549_c11_7ac2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_7ac2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2549_c11_7ac2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_7ac2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_7ac2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2549_c11_7ac2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2555_c11_7f20] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2555_c11_7f20_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_7f20_left;
     BIN_OP_EQ_uxn_opcodes_h_l2555_c11_7f20_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_7f20_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_7f20_return_output := BIN_OP_EQ_uxn_opcodes_h_l2555_c11_7f20_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2592_c11_4fde] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2592_c11_4fde_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_4fde_left;
     BIN_OP_EQ_uxn_opcodes_h_l2592_c11_4fde_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_4fde_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_4fde_return_output := BIN_OP_EQ_uxn_opcodes_h_l2592_c11_4fde_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2565_c11_5bf4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2565_c11_5bf4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_5bf4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2565_c11_5bf4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_5bf4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_5bf4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2565_c11_5bf4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2556_c11_11c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2556_c11_11c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_11c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2556_c11_11c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_11c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_11c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2556_c11_11c8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2558_c11_bcc6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2558_c11_bcc6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_bcc6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2558_c11_bcc6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_bcc6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_bcc6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2558_c11_bcc6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2574_c11_c5b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2574_c11_c5b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_c5b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2574_c11_c5b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_c5b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_c5b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2574_c11_c5b8_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c7_cbdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c6_c949_return_output;
     VAR_is_wait_MUX_uxn_opcodes_h_l2538_c2_5792_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c6_c949_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c6_c949_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c7_72b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c11_164b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_ba06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c11_164b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2539_c7_cbdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c11_164b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c7_115a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_13c0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c1_7273_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_13c0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2540_c7_72b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_13c0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c7_a205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_feb8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_75cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_feb8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2541_c7_115a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_feb8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c7_4920_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_cb0b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c1_b870_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_cb0b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2542_c7_a205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_cb0b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c7_db71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2543_c11_6e32_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c1_6d0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2543_c11_6e32_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2543_c7_4920_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2543_c11_6e32_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c7_da25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_e716_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c1_c6be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_e716_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2544_c7_db71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_e716_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c7_5548_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c11_a4af_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_1a80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c11_a4af_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2545_c7_da25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c11_a4af_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c7_a0c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_e1b3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_afaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_e1b3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2546_c7_5548_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_e1b3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c7_afca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8781_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_e2db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8781_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2547_c7_a0c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8781_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c7_a035_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_20fd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c1_6238_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_20fd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2548_c7_afca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_20fd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c7_3516_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_7ac2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_4066_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_7ac2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2549_c7_a035_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_7ac2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c7_0356_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_b620_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_6151_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_b620_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2550_c7_3516_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_b620_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c7_2629_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2551_c11_4125_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c1_75fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2551_c11_4125_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2551_c7_0356_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2551_c11_4125_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c7_f031_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_81d0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c1_6953_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_81d0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2552_c7_2629_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_81d0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c7_ba37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_495b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c1_d51f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_495b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2553_c7_f031_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_495b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c7_d61b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_fbd5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c1_3d40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_fbd5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2554_c7_ba37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_fbd5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c7_f7cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_7f20_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c1_2c24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_7f20_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2555_c7_d61b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_7f20_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c7_148a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_11c8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c1_8a48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_11c8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2556_c7_f7cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_11c8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c7_df66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_63ac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c1_c77c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_63ac_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2557_c7_148a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_63ac_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c7_0b1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_bcc6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c1_4d05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_bcc6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2558_c7_df66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_bcc6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c7_cf3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2559_c11_6485_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c1_af2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2559_c11_6485_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2559_c7_0b1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2559_c11_6485_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c7_19cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_13f2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c1_2a2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_13f2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2560_c7_cf3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_13f2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c7_2335_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_35e0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c1_47ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_35e0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2561_c7_19cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_35e0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c7_a38f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_5fd5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c1_4ab1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_5fd5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2562_c7_2335_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2562_c11_5fd5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c7_f981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_d8c9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c1_2826_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_d8c9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2563_c7_a38f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_d8c9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c7_23c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_a073_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c1_edad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_a073_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2564_c7_f981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_a073_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c7_b73a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_5bf4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_466a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_5bf4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2565_c7_23c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_5bf4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c7_7f81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2566_c11_61a5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c1_216d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2566_c11_61a5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2566_c7_b73a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2566_c11_61a5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c7_a31a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_e8ee_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c1_83c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_e8ee_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2567_c7_7f81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_e8ee_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c7_f572_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_7306_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c1_d332_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_7306_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2568_c7_a31a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_7306_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c7_4440_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_ca0a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c1_266f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_ca0a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2569_c7_f572_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_ca0a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c7_653e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_393b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_0fd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_393b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2570_c7_4440_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_393b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c7_2fe5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_06db_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_ce56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_06db_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2571_c7_653e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_06db_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c7_2c4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2572_c11_deb5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c1_e6ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2572_c11_deb5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2572_c7_2fe5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2572_c11_deb5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c7_a82c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_62b1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_4525_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_62b1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2573_c7_2c4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_62b1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c7_ee9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_c5b8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c1_4611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_c5b8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2574_c7_a82c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_c5b8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c7_dc9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_c57a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c1_0256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_c57a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2575_c7_ee9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_c57a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c7_af91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_9530_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_f7d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_9530_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2576_c7_dc9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_9530_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c7_c0d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_c6ab_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c1_b1e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_c6ab_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2577_c7_af91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_c6ab_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c7_8c50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_618c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c1_9bf9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_618c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2578_c7_c0d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_618c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c7_3d61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_4223_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c1_4f85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_4223_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2579_c7_8c50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_4223_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c7_f736_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_ffc5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c1_5e1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_ffc5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2580_c7_3d61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_ffc5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c7_8b31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_c6c4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c1_d7a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_c6c4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2581_c7_f736_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_c6c4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c7_43f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_f4de_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c1_d8f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_f4de_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2582_c7_8b31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_f4de_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c7_ff57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_1ef8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c1_670f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_1ef8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2583_c7_43f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_1ef8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c7_955d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_4d63_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c1_0ae6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_4d63_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2584_c7_ff57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_4d63_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c7_205c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_ce36_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c1_95e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_ce36_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2585_c7_955d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_ce36_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c7_9db0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_b7cd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c1_c3d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_b7cd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2586_c7_205c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_b7cd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c7_474f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_5dab_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c1_f247_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_5dab_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2587_c7_9db0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_5dab_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c7_5280_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_7def_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c1_92e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_7def_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2588_c7_474f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_7def_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c7_157b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_d95c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c1_b6d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_d95c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2589_c7_5280_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_d95c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c7_7683_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_eb97_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c1_4287_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_eb97_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2590_c7_157b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2590_c11_eb97_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c7_9ad0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2591_c11_8041_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c1_d2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2591_c11_8041_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2591_c7_7683_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2591_c11_8041_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c7_498d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_4fde_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c1_3b5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_4fde_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2592_c7_9ad0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_4fde_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c7_ea71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2593_c11_74c9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c1_d3cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2593_c11_74c9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2593_c7_498d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2593_c11_74c9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c7_b70d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_1cbf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c1_8c8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_1cbf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2594_c7_ea71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_1cbf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c7_2426_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_f255_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c1_2988_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_f255_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2595_c7_b70d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_f255_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c7_c0ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_d91e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c1_9856_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_d91e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2596_c7_2426_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_d91e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c7_f595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2597_c11_1e97_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c1_38b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2597_c11_1e97_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2597_c7_c0ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2597_c11_1e97_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c7_1fbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_0f1f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c1_ccf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_0f1f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2598_c7_f595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_0f1f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c7_683b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_540a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c1_2417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_540a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2599_c7_1fbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_540a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c7_1efa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_6438_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_84ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_6438_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2600_c7_683b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_6438_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c7_620a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_ff18_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c1_0b00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_ff18_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2601_c7_1efa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_ff18_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c7_5e21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_d90e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c1_180f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_d90e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2602_c7_620a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_d90e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c7_1270_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c11_ff07_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_d680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c11_ff07_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2603_c7_5e21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c11_ff07_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c7_5e80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b354_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c1_0fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b354_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2604_c7_1270_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b354_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c7_2198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_d529_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c1_0a11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_d529_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2605_c7_5e80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_d529_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c7_a5d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f0c7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c1_d368_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f0c7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2606_c7_2198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f0c7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c1_b90f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_be22_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2607_c7_a5d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_be22_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2539_c7_cbdf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c7_cbdf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c7_cbdf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c7_cbdf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c7_cbdf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c7_cbdf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c7_cbdf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c7_cbdf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c7_cbdf_return_output;

     -- is_wait_MUX[uxn_opcodes_h_l2538_c2_5792] LATENCY=0
     -- Inputs
     is_wait_MUX_uxn_opcodes_h_l2538_c2_5792_cond <= VAR_is_wait_MUX_uxn_opcodes_h_l2538_c2_5792_cond;
     is_wait_MUX_uxn_opcodes_h_l2538_c2_5792_iftrue <= VAR_is_wait_MUX_uxn_opcodes_h_l2538_c2_5792_iftrue;
     is_wait_MUX_uxn_opcodes_h_l2538_c2_5792_iffalse <= VAR_is_wait_MUX_uxn_opcodes_h_l2538_c2_5792_iffalse;
     -- Outputs
     VAR_is_wait_MUX_uxn_opcodes_h_l2538_c2_5792_return_output := is_wait_MUX_uxn_opcodes_h_l2538_c2_5792_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c7_72b2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c7_cbdf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_ba06_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c7_cbdf_return_output;
     REG_VAR_is_wait := VAR_is_wait_MUX_uxn_opcodes_h_l2538_c2_5792_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2539_c1_ba06] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_ba06_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_ba06_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_ba06_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_ba06_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_ba06_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_ba06_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_ba06_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_ba06_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2540_c7_72b2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c7_72b2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c7_72b2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c7_72b2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c7_72b2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c7_72b2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c7_72b2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c7_72b2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c7_72b2_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c7_115a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c7_72b2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c1_7273_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c7_72b2_return_output;
     VAR_jci_uxn_opcodes_h_l2539_c40_2c85_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_ba06_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2540_c1_7273] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c1_7273_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c1_7273_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c1_7273_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c1_7273_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c1_7273_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c1_7273_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c1_7273_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c1_7273_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2541_c7_115a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c7_115a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c7_115a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c7_115a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c7_115a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c7_115a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c7_115a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c7_115a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c7_115a_return_output;

     -- jci[uxn_opcodes_h_l2539_c40_2c85] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l2539_c40_2c85_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l2539_c40_2c85_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l2539_c40_2c85_phase <= VAR_jci_uxn_opcodes_h_l2539_c40_2c85_phase;
     jci_uxn_opcodes_h_l2539_c40_2c85_pc <= VAR_jci_uxn_opcodes_h_l2539_c40_2c85_pc;
     jci_uxn_opcodes_h_l2539_c40_2c85_previous_stack_read <= VAR_jci_uxn_opcodes_h_l2539_c40_2c85_previous_stack_read;
     jci_uxn_opcodes_h_l2539_c40_2c85_previous_ram_read <= VAR_jci_uxn_opcodes_h_l2539_c40_2c85_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l2539_c40_2c85_return_output := jci_uxn_opcodes_h_l2539_c40_2c85_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c7_a205_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c7_115a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_75cc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c7_115a_return_output;
     VAR_jmi_uxn_opcodes_h_l2540_c40_8d3b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2540_c1_7273_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2539_c7_cbdf_iftrue := VAR_jci_uxn_opcodes_h_l2539_c40_2c85_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2541_c1_75cc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_75cc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_75cc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_75cc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_75cc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_75cc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_75cc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_75cc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_75cc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2542_c7_a205] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c7_a205_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c7_a205_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c7_a205_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c7_a205_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c7_a205_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c7_a205_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c7_a205_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c7_a205_return_output;

     -- jmi[uxn_opcodes_h_l2540_c40_8d3b] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l2540_c40_8d3b_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l2540_c40_8d3b_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l2540_c40_8d3b_phase <= VAR_jmi_uxn_opcodes_h_l2540_c40_8d3b_phase;
     jmi_uxn_opcodes_h_l2540_c40_8d3b_pc <= VAR_jmi_uxn_opcodes_h_l2540_c40_8d3b_pc;
     jmi_uxn_opcodes_h_l2540_c40_8d3b_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l2540_c40_8d3b_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l2540_c40_8d3b_return_output := jmi_uxn_opcodes_h_l2540_c40_8d3b_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c7_4920_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c7_a205_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c1_b870_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c7_a205_return_output;
     VAR_jsi_uxn_opcodes_h_l2541_c40_2ec7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_75cc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2540_c7_72b2_iftrue := VAR_jmi_uxn_opcodes_h_l2540_c40_8d3b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2542_c1_b870] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c1_b870_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c1_b870_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c1_b870_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c1_b870_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c1_b870_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c1_b870_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c1_b870_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c1_b870_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2543_c7_4920] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c7_4920_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c7_4920_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c7_4920_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c7_4920_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c7_4920_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c7_4920_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c7_4920_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c7_4920_return_output;

     -- jsi[uxn_opcodes_h_l2541_c40_2ec7] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l2541_c40_2ec7_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l2541_c40_2ec7_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l2541_c40_2ec7_phase <= VAR_jsi_uxn_opcodes_h_l2541_c40_2ec7_phase;
     jsi_uxn_opcodes_h_l2541_c40_2ec7_pc <= VAR_jsi_uxn_opcodes_h_l2541_c40_2ec7_pc;
     jsi_uxn_opcodes_h_l2541_c40_2ec7_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l2541_c40_2ec7_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l2541_c40_2ec7_return_output := jsi_uxn_opcodes_h_l2541_c40_2ec7_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c7_db71_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c7_4920_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c1_6d0d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c7_4920_return_output;
     VAR_lit_uxn_opcodes_h_l2542_c40_3478_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2542_c1_b870_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2541_c7_115a_iftrue := VAR_jsi_uxn_opcodes_h_l2541_c40_2ec7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2544_c7_db71] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c7_db71_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c7_db71_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c7_db71_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c7_db71_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c7_db71_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c7_db71_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c7_db71_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c7_db71_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2543_c1_6d0d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c1_6d0d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c1_6d0d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c1_6d0d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c1_6d0d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c1_6d0d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c1_6d0d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c1_6d0d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c1_6d0d_return_output;

     -- lit[uxn_opcodes_h_l2542_c40_3478] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2542_c40_3478_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2542_c40_3478_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2542_c40_3478_phase <= VAR_lit_uxn_opcodes_h_l2542_c40_3478_phase;
     lit_uxn_opcodes_h_l2542_c40_3478_pc <= VAR_lit_uxn_opcodes_h_l2542_c40_3478_pc;
     lit_uxn_opcodes_h_l2542_c40_3478_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2542_c40_3478_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2542_c40_3478_return_output := lit_uxn_opcodes_h_l2542_c40_3478_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c7_da25_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c7_db71_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c1_c6be_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c7_db71_return_output;
     VAR_lit2_uxn_opcodes_h_l2543_c40_e8d6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2543_c1_6d0d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2542_c7_a205_iftrue := VAR_lit_uxn_opcodes_h_l2542_c40_3478_return_output;
     -- lit2[uxn_opcodes_h_l2543_c40_e8d6] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2543_c40_e8d6_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2543_c40_e8d6_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2543_c40_e8d6_phase <= VAR_lit2_uxn_opcodes_h_l2543_c40_e8d6_phase;
     lit2_uxn_opcodes_h_l2543_c40_e8d6_pc <= VAR_lit2_uxn_opcodes_h_l2543_c40_e8d6_pc;
     lit2_uxn_opcodes_h_l2543_c40_e8d6_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2543_c40_e8d6_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2543_c40_e8d6_return_output := lit2_uxn_opcodes_h_l2543_c40_e8d6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2545_c7_da25] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c7_da25_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c7_da25_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c7_da25_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c7_da25_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c7_da25_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c7_da25_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c7_da25_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c7_da25_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2544_c1_c6be] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c1_c6be_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c1_c6be_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c1_c6be_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c1_c6be_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c1_c6be_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c1_c6be_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c1_c6be_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c1_c6be_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c7_5548_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c7_da25_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_1a80_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c7_da25_return_output;
     VAR_lit_uxn_opcodes_h_l2544_c40_c683_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2544_c1_c6be_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2543_c7_4920_iftrue := VAR_lit2_uxn_opcodes_h_l2543_c40_e8d6_return_output;
     -- lit[uxn_opcodes_h_l2544_c40_c683] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2544_c40_c683_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2544_c40_c683_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2544_c40_c683_phase <= VAR_lit_uxn_opcodes_h_l2544_c40_c683_phase;
     lit_uxn_opcodes_h_l2544_c40_c683_pc <= VAR_lit_uxn_opcodes_h_l2544_c40_c683_pc;
     lit_uxn_opcodes_h_l2544_c40_c683_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2544_c40_c683_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2544_c40_c683_return_output := lit_uxn_opcodes_h_l2544_c40_c683_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2545_c1_1a80] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_1a80_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_1a80_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_1a80_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_1a80_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_1a80_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_1a80_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_1a80_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_1a80_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2546_c7_5548] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c7_5548_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c7_5548_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c7_5548_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c7_5548_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c7_5548_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c7_5548_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c7_5548_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c7_5548_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c7_a0c7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c7_5548_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_afaa_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c7_5548_return_output;
     VAR_lit2_uxn_opcodes_h_l2545_c40_20a4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_1a80_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2544_c7_db71_iftrue := VAR_lit_uxn_opcodes_h_l2544_c40_c683_return_output;
     -- lit2[uxn_opcodes_h_l2545_c40_20a4] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2545_c40_20a4_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2545_c40_20a4_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2545_c40_20a4_phase <= VAR_lit2_uxn_opcodes_h_l2545_c40_20a4_phase;
     lit2_uxn_opcodes_h_l2545_c40_20a4_pc <= VAR_lit2_uxn_opcodes_h_l2545_c40_20a4_pc;
     lit2_uxn_opcodes_h_l2545_c40_20a4_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2545_c40_20a4_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2545_c40_20a4_return_output := lit2_uxn_opcodes_h_l2545_c40_20a4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2546_c1_afaa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_afaa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_afaa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_afaa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_afaa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_afaa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_afaa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_afaa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_afaa_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2547_c7_a0c7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c7_a0c7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c7_a0c7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c7_a0c7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c7_a0c7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c7_a0c7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c7_a0c7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c7_a0c7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c7_a0c7_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c7_afca_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c7_a0c7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_e2db_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c7_a0c7_return_output;
     VAR_inc_uxn_opcodes_h_l2546_c40_1930_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2546_c1_afaa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2545_c7_da25_iftrue := VAR_lit2_uxn_opcodes_h_l2545_c40_20a4_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2547_c1_e2db] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_e2db_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_e2db_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_e2db_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_e2db_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_e2db_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_e2db_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_e2db_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_e2db_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2548_c7_afca] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c7_afca_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c7_afca_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c7_afca_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c7_afca_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c7_afca_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c7_afca_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c7_afca_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c7_afca_return_output;

     -- inc[uxn_opcodes_h_l2546_c40_1930] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l2546_c40_1930_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l2546_c40_1930_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l2546_c40_1930_phase <= VAR_inc_uxn_opcodes_h_l2546_c40_1930_phase;
     inc_uxn_opcodes_h_l2546_c40_1930_ins <= VAR_inc_uxn_opcodes_h_l2546_c40_1930_ins;
     inc_uxn_opcodes_h_l2546_c40_1930_previous_stack_read <= VAR_inc_uxn_opcodes_h_l2546_c40_1930_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l2546_c40_1930_return_output := inc_uxn_opcodes_h_l2546_c40_1930_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c7_a035_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c7_afca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c1_6238_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c7_afca_return_output;
     VAR_inc2_uxn_opcodes_h_l2547_c40_8cb1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_e2db_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2546_c7_5548_iftrue := VAR_inc_uxn_opcodes_h_l2546_c40_1930_return_output;
     -- inc2[uxn_opcodes_h_l2547_c40_8cb1] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l2547_c40_8cb1_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l2547_c40_8cb1_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l2547_c40_8cb1_phase <= VAR_inc2_uxn_opcodes_h_l2547_c40_8cb1_phase;
     inc2_uxn_opcodes_h_l2547_c40_8cb1_ins <= VAR_inc2_uxn_opcodes_h_l2547_c40_8cb1_ins;
     inc2_uxn_opcodes_h_l2547_c40_8cb1_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l2547_c40_8cb1_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l2547_c40_8cb1_return_output := inc2_uxn_opcodes_h_l2547_c40_8cb1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2548_c1_6238] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c1_6238_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c1_6238_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c1_6238_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c1_6238_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c1_6238_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c1_6238_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c1_6238_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c1_6238_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2549_c7_a035] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c7_a035_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c7_a035_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c7_a035_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c7_a035_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c7_a035_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c7_a035_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c7_a035_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c7_a035_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c7_3516_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c7_a035_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_4066_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c7_a035_return_output;
     VAR_pop_uxn_opcodes_h_l2548_c40_2076_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2548_c1_6238_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2547_c7_a0c7_iftrue := VAR_inc2_uxn_opcodes_h_l2547_c40_8cb1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2549_c1_4066] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_4066_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_4066_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_4066_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_4066_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_4066_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_4066_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_4066_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_4066_return_output;

     -- pop[uxn_opcodes_h_l2548_c40_2076] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l2548_c40_2076_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l2548_c40_2076_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l2548_c40_2076_phase <= VAR_pop_uxn_opcodes_h_l2548_c40_2076_phase;
     pop_uxn_opcodes_h_l2548_c40_2076_ins <= VAR_pop_uxn_opcodes_h_l2548_c40_2076_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l2548_c40_2076_return_output := pop_uxn_opcodes_h_l2548_c40_2076_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2550_c7_3516] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c7_3516_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c7_3516_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c7_3516_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c7_3516_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c7_3516_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c7_3516_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c7_3516_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c7_3516_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c7_0356_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c7_3516_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_6151_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c7_3516_return_output;
     VAR_pop2_uxn_opcodes_h_l2549_c40_8f2e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2549_c1_4066_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2548_c7_afca_iftrue := VAR_pop_uxn_opcodes_h_l2548_c40_2076_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2550_c1_6151] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_6151_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_6151_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_6151_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_6151_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_6151_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_6151_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_6151_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_6151_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2551_c7_0356] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c7_0356_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c7_0356_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c7_0356_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c7_0356_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c7_0356_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c7_0356_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c7_0356_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c7_0356_return_output;

     -- pop2[uxn_opcodes_h_l2549_c40_8f2e] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l2549_c40_8f2e_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l2549_c40_8f2e_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l2549_c40_8f2e_phase <= VAR_pop2_uxn_opcodes_h_l2549_c40_8f2e_phase;
     pop2_uxn_opcodes_h_l2549_c40_8f2e_ins <= VAR_pop2_uxn_opcodes_h_l2549_c40_8f2e_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l2549_c40_8f2e_return_output := pop2_uxn_opcodes_h_l2549_c40_8f2e_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c7_2629_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c7_0356_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c1_75fc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c7_0356_return_output;
     VAR_nip_uxn_opcodes_h_l2550_c40_3b9f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_6151_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2549_c7_a035_iftrue := VAR_pop2_uxn_opcodes_h_l2549_c40_8f2e_return_output;
     -- nip[uxn_opcodes_h_l2550_c40_3b9f] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l2550_c40_3b9f_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l2550_c40_3b9f_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l2550_c40_3b9f_phase <= VAR_nip_uxn_opcodes_h_l2550_c40_3b9f_phase;
     nip_uxn_opcodes_h_l2550_c40_3b9f_ins <= VAR_nip_uxn_opcodes_h_l2550_c40_3b9f_ins;
     nip_uxn_opcodes_h_l2550_c40_3b9f_previous_stack_read <= VAR_nip_uxn_opcodes_h_l2550_c40_3b9f_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l2550_c40_3b9f_return_output := nip_uxn_opcodes_h_l2550_c40_3b9f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2552_c7_2629] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c7_2629_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c7_2629_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c7_2629_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c7_2629_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c7_2629_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c7_2629_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c7_2629_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c7_2629_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2551_c1_75fc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c1_75fc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c1_75fc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c1_75fc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c1_75fc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c1_75fc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c1_75fc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c1_75fc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c1_75fc_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c7_f031_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c7_2629_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c1_6953_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c7_2629_return_output;
     VAR_nip2_uxn_opcodes_h_l2551_c40_96e3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2551_c1_75fc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2550_c7_3516_iftrue := VAR_nip_uxn_opcodes_h_l2550_c40_3b9f_return_output;
     -- nip2[uxn_opcodes_h_l2551_c40_96e3] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l2551_c40_96e3_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l2551_c40_96e3_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l2551_c40_96e3_phase <= VAR_nip2_uxn_opcodes_h_l2551_c40_96e3_phase;
     nip2_uxn_opcodes_h_l2551_c40_96e3_ins <= VAR_nip2_uxn_opcodes_h_l2551_c40_96e3_ins;
     nip2_uxn_opcodes_h_l2551_c40_96e3_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l2551_c40_96e3_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l2551_c40_96e3_return_output := nip2_uxn_opcodes_h_l2551_c40_96e3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2552_c1_6953] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c1_6953_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c1_6953_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c1_6953_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c1_6953_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c1_6953_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c1_6953_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c1_6953_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c1_6953_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2553_c7_f031] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c7_f031_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c7_f031_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c7_f031_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c7_f031_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c7_f031_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c7_f031_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c7_f031_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c7_f031_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c7_ba37_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c7_f031_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c1_d51f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c7_f031_return_output;
     VAR_swp_uxn_opcodes_h_l2552_c40_3757_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2552_c1_6953_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2551_c7_0356_iftrue := VAR_nip2_uxn_opcodes_h_l2551_c40_96e3_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2554_c7_ba37] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c7_ba37_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c7_ba37_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c7_ba37_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c7_ba37_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c7_ba37_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c7_ba37_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c7_ba37_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c7_ba37_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2553_c1_d51f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c1_d51f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c1_d51f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c1_d51f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c1_d51f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c1_d51f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c1_d51f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c1_d51f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c1_d51f_return_output;

     -- swp[uxn_opcodes_h_l2552_c40_3757] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l2552_c40_3757_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l2552_c40_3757_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l2552_c40_3757_phase <= VAR_swp_uxn_opcodes_h_l2552_c40_3757_phase;
     swp_uxn_opcodes_h_l2552_c40_3757_ins <= VAR_swp_uxn_opcodes_h_l2552_c40_3757_ins;
     swp_uxn_opcodes_h_l2552_c40_3757_previous_stack_read <= VAR_swp_uxn_opcodes_h_l2552_c40_3757_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l2552_c40_3757_return_output := swp_uxn_opcodes_h_l2552_c40_3757_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c7_d61b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c7_ba37_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c1_3d40_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c7_ba37_return_output;
     VAR_swp2_uxn_opcodes_h_l2553_c40_5c76_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2553_c1_d51f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2552_c7_2629_iftrue := VAR_swp_uxn_opcodes_h_l2552_c40_3757_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2554_c1_3d40] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c1_3d40_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c1_3d40_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c1_3d40_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c1_3d40_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c1_3d40_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c1_3d40_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c1_3d40_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c1_3d40_return_output;

     -- swp2[uxn_opcodes_h_l2553_c40_5c76] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l2553_c40_5c76_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l2553_c40_5c76_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l2553_c40_5c76_phase <= VAR_swp2_uxn_opcodes_h_l2553_c40_5c76_phase;
     swp2_uxn_opcodes_h_l2553_c40_5c76_ins <= VAR_swp2_uxn_opcodes_h_l2553_c40_5c76_ins;
     swp2_uxn_opcodes_h_l2553_c40_5c76_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l2553_c40_5c76_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l2553_c40_5c76_return_output := swp2_uxn_opcodes_h_l2553_c40_5c76_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2555_c7_d61b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c7_d61b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c7_d61b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c7_d61b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c7_d61b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c7_d61b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c7_d61b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c7_d61b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c7_d61b_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c7_f7cf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c7_d61b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c1_2c24_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c7_d61b_return_output;
     VAR_rot_uxn_opcodes_h_l2554_c40_4358_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2554_c1_3d40_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2553_c7_f031_iftrue := VAR_swp2_uxn_opcodes_h_l2553_c40_5c76_return_output;
     -- rot[uxn_opcodes_h_l2554_c40_4358] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l2554_c40_4358_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l2554_c40_4358_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l2554_c40_4358_phase <= VAR_rot_uxn_opcodes_h_l2554_c40_4358_phase;
     rot_uxn_opcodes_h_l2554_c40_4358_ins <= VAR_rot_uxn_opcodes_h_l2554_c40_4358_ins;
     rot_uxn_opcodes_h_l2554_c40_4358_previous_stack_read <= VAR_rot_uxn_opcodes_h_l2554_c40_4358_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l2554_c40_4358_return_output := rot_uxn_opcodes_h_l2554_c40_4358_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2556_c7_f7cf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c7_f7cf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c7_f7cf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c7_f7cf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c7_f7cf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c7_f7cf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c7_f7cf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c7_f7cf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c7_f7cf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2555_c1_2c24] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c1_2c24_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c1_2c24_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c1_2c24_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c1_2c24_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c1_2c24_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c1_2c24_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c1_2c24_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c1_2c24_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c7_148a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c7_f7cf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c1_8a48_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c7_f7cf_return_output;
     VAR_rot2_uxn_opcodes_h_l2555_c40_7aa5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2555_c1_2c24_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2554_c7_ba37_iftrue := VAR_rot_uxn_opcodes_h_l2554_c40_4358_return_output;
     -- rot2[uxn_opcodes_h_l2555_c40_7aa5] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l2555_c40_7aa5_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l2555_c40_7aa5_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l2555_c40_7aa5_phase <= VAR_rot2_uxn_opcodes_h_l2555_c40_7aa5_phase;
     rot2_uxn_opcodes_h_l2555_c40_7aa5_ins <= VAR_rot2_uxn_opcodes_h_l2555_c40_7aa5_ins;
     rot2_uxn_opcodes_h_l2555_c40_7aa5_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l2555_c40_7aa5_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l2555_c40_7aa5_return_output := rot2_uxn_opcodes_h_l2555_c40_7aa5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2556_c1_8a48] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c1_8a48_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c1_8a48_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c1_8a48_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c1_8a48_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c1_8a48_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c1_8a48_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c1_8a48_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c1_8a48_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2557_c7_148a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c7_148a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c7_148a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c7_148a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c7_148a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c7_148a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c7_148a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c7_148a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c7_148a_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c7_df66_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c7_148a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c1_c77c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c7_148a_return_output;
     VAR_dup_uxn_opcodes_h_l2556_c40_9f2a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2556_c1_8a48_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2555_c7_d61b_iftrue := VAR_rot2_uxn_opcodes_h_l2555_c40_7aa5_return_output;
     -- dup[uxn_opcodes_h_l2556_c40_9f2a] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l2556_c40_9f2a_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l2556_c40_9f2a_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l2556_c40_9f2a_phase <= VAR_dup_uxn_opcodes_h_l2556_c40_9f2a_phase;
     dup_uxn_opcodes_h_l2556_c40_9f2a_ins <= VAR_dup_uxn_opcodes_h_l2556_c40_9f2a_ins;
     dup_uxn_opcodes_h_l2556_c40_9f2a_previous_stack_read <= VAR_dup_uxn_opcodes_h_l2556_c40_9f2a_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l2556_c40_9f2a_return_output := dup_uxn_opcodes_h_l2556_c40_9f2a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2558_c7_df66] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c7_df66_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c7_df66_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c7_df66_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c7_df66_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c7_df66_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c7_df66_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c7_df66_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c7_df66_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2557_c1_c77c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c1_c77c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c1_c77c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c1_c77c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c1_c77c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c1_c77c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c1_c77c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c1_c77c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c1_c77c_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c7_0b1d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c7_df66_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c1_4d05_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c7_df66_return_output;
     VAR_dup2_uxn_opcodes_h_l2557_c40_190d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2557_c1_c77c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2556_c7_f7cf_iftrue := VAR_dup_uxn_opcodes_h_l2556_c40_9f2a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2558_c1_4d05] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c1_4d05_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c1_4d05_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c1_4d05_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c1_4d05_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c1_4d05_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c1_4d05_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c1_4d05_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c1_4d05_return_output;

     -- dup2[uxn_opcodes_h_l2557_c40_190d] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l2557_c40_190d_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l2557_c40_190d_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l2557_c40_190d_phase <= VAR_dup2_uxn_opcodes_h_l2557_c40_190d_phase;
     dup2_uxn_opcodes_h_l2557_c40_190d_ins <= VAR_dup2_uxn_opcodes_h_l2557_c40_190d_ins;
     dup2_uxn_opcodes_h_l2557_c40_190d_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l2557_c40_190d_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l2557_c40_190d_return_output := dup2_uxn_opcodes_h_l2557_c40_190d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2559_c7_0b1d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c7_0b1d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c7_0b1d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c7_0b1d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c7_0b1d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c7_0b1d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c7_0b1d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c7_0b1d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c7_0b1d_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c7_cf3a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c7_0b1d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c1_af2f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c7_0b1d_return_output;
     VAR_ovr_uxn_opcodes_h_l2558_c40_b12c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2558_c1_4d05_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2557_c7_148a_iftrue := VAR_dup2_uxn_opcodes_h_l2557_c40_190d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2559_c1_af2f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c1_af2f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c1_af2f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c1_af2f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c1_af2f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c1_af2f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c1_af2f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c1_af2f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c1_af2f_return_output;

     -- ovr[uxn_opcodes_h_l2558_c40_b12c] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l2558_c40_b12c_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l2558_c40_b12c_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l2558_c40_b12c_phase <= VAR_ovr_uxn_opcodes_h_l2558_c40_b12c_phase;
     ovr_uxn_opcodes_h_l2558_c40_b12c_ins <= VAR_ovr_uxn_opcodes_h_l2558_c40_b12c_ins;
     ovr_uxn_opcodes_h_l2558_c40_b12c_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l2558_c40_b12c_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l2558_c40_b12c_return_output := ovr_uxn_opcodes_h_l2558_c40_b12c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2560_c7_cf3a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c7_cf3a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c7_cf3a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c7_cf3a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c7_cf3a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c7_cf3a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c7_cf3a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c7_cf3a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c7_cf3a_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c7_19cc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c7_cf3a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c1_2a2d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c7_cf3a_return_output;
     VAR_ovr2_uxn_opcodes_h_l2559_c40_8f4c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2559_c1_af2f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2558_c7_df66_iftrue := VAR_ovr_uxn_opcodes_h_l2558_c40_b12c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2561_c7_19cc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c7_19cc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c7_19cc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c7_19cc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c7_19cc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c7_19cc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c7_19cc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c7_19cc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c7_19cc_return_output;

     -- ovr2[uxn_opcodes_h_l2559_c40_8f4c] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l2559_c40_8f4c_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l2559_c40_8f4c_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l2559_c40_8f4c_phase <= VAR_ovr2_uxn_opcodes_h_l2559_c40_8f4c_phase;
     ovr2_uxn_opcodes_h_l2559_c40_8f4c_ins <= VAR_ovr2_uxn_opcodes_h_l2559_c40_8f4c_ins;
     ovr2_uxn_opcodes_h_l2559_c40_8f4c_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l2559_c40_8f4c_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l2559_c40_8f4c_return_output := ovr2_uxn_opcodes_h_l2559_c40_8f4c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2560_c1_2a2d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c1_2a2d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c1_2a2d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c1_2a2d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c1_2a2d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c1_2a2d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c1_2a2d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c1_2a2d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c1_2a2d_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c7_2335_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c7_19cc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c1_47ab_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c7_19cc_return_output;
     VAR_equ_uxn_opcodes_h_l2560_c40_49aa_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2560_c1_2a2d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2559_c7_0b1d_iftrue := VAR_ovr2_uxn_opcodes_h_l2559_c40_8f4c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2562_c7_2335] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c7_2335_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c7_2335_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c7_2335_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c7_2335_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c7_2335_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c7_2335_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c7_2335_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c7_2335_return_output;

     -- equ[uxn_opcodes_h_l2560_c40_49aa] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l2560_c40_49aa_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l2560_c40_49aa_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l2560_c40_49aa_phase <= VAR_equ_uxn_opcodes_h_l2560_c40_49aa_phase;
     equ_uxn_opcodes_h_l2560_c40_49aa_ins <= VAR_equ_uxn_opcodes_h_l2560_c40_49aa_ins;
     equ_uxn_opcodes_h_l2560_c40_49aa_previous_stack_read <= VAR_equ_uxn_opcodes_h_l2560_c40_49aa_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l2560_c40_49aa_return_output := equ_uxn_opcodes_h_l2560_c40_49aa_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2561_c1_47ab] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c1_47ab_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c1_47ab_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c1_47ab_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c1_47ab_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c1_47ab_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c1_47ab_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c1_47ab_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c1_47ab_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c7_a38f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c7_2335_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c1_4ab1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c7_2335_return_output;
     VAR_equ2_uxn_opcodes_h_l2561_c40_93d5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2561_c1_47ab_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2560_c7_cf3a_iftrue := VAR_equ_uxn_opcodes_h_l2560_c40_49aa_return_output;
     -- equ2[uxn_opcodes_h_l2561_c40_93d5] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l2561_c40_93d5_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l2561_c40_93d5_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l2561_c40_93d5_phase <= VAR_equ2_uxn_opcodes_h_l2561_c40_93d5_phase;
     equ2_uxn_opcodes_h_l2561_c40_93d5_ins <= VAR_equ2_uxn_opcodes_h_l2561_c40_93d5_ins;
     equ2_uxn_opcodes_h_l2561_c40_93d5_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l2561_c40_93d5_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l2561_c40_93d5_return_output := equ2_uxn_opcodes_h_l2561_c40_93d5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2563_c7_a38f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c7_a38f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c7_a38f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c7_a38f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c7_a38f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c7_a38f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c7_a38f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c7_a38f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c7_a38f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2562_c1_4ab1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c1_4ab1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c1_4ab1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c1_4ab1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c1_4ab1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c1_4ab1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c1_4ab1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c1_4ab1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c1_4ab1_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c7_f981_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c7_a38f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c1_2826_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c7_a38f_return_output;
     VAR_neq_uxn_opcodes_h_l2562_c40_5284_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2562_c1_4ab1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2561_c7_19cc_iftrue := VAR_equ2_uxn_opcodes_h_l2561_c40_93d5_return_output;
     -- neq[uxn_opcodes_h_l2562_c40_5284] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l2562_c40_5284_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l2562_c40_5284_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l2562_c40_5284_phase <= VAR_neq_uxn_opcodes_h_l2562_c40_5284_phase;
     neq_uxn_opcodes_h_l2562_c40_5284_ins <= VAR_neq_uxn_opcodes_h_l2562_c40_5284_ins;
     neq_uxn_opcodes_h_l2562_c40_5284_previous_stack_read <= VAR_neq_uxn_opcodes_h_l2562_c40_5284_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l2562_c40_5284_return_output := neq_uxn_opcodes_h_l2562_c40_5284_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2563_c1_2826] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c1_2826_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c1_2826_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c1_2826_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c1_2826_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c1_2826_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c1_2826_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c1_2826_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c1_2826_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2564_c7_f981] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c7_f981_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c7_f981_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c7_f981_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c7_f981_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c7_f981_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c7_f981_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c7_f981_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c7_f981_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c7_23c6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c7_f981_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c1_edad_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c7_f981_return_output;
     VAR_neq2_uxn_opcodes_h_l2563_c40_9708_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2563_c1_2826_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2562_c7_2335_iftrue := VAR_neq_uxn_opcodes_h_l2562_c40_5284_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2564_c1_edad] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c1_edad_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c1_edad_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c1_edad_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c1_edad_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c1_edad_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c1_edad_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c1_edad_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c1_edad_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2565_c7_23c6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c7_23c6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c7_23c6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c7_23c6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c7_23c6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c7_23c6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c7_23c6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c7_23c6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c7_23c6_return_output;

     -- neq2[uxn_opcodes_h_l2563_c40_9708] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l2563_c40_9708_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l2563_c40_9708_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l2563_c40_9708_phase <= VAR_neq2_uxn_opcodes_h_l2563_c40_9708_phase;
     neq2_uxn_opcodes_h_l2563_c40_9708_ins <= VAR_neq2_uxn_opcodes_h_l2563_c40_9708_ins;
     neq2_uxn_opcodes_h_l2563_c40_9708_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l2563_c40_9708_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l2563_c40_9708_return_output := neq2_uxn_opcodes_h_l2563_c40_9708_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c7_b73a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c7_23c6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_466a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c7_23c6_return_output;
     VAR_gth_uxn_opcodes_h_l2564_c40_6836_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2564_c1_edad_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2563_c7_a38f_iftrue := VAR_neq2_uxn_opcodes_h_l2563_c40_9708_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2566_c7_b73a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c7_b73a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c7_b73a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c7_b73a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c7_b73a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c7_b73a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c7_b73a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c7_b73a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c7_b73a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2565_c1_466a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_466a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_466a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_466a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_466a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_466a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_466a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_466a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_466a_return_output;

     -- gth[uxn_opcodes_h_l2564_c40_6836] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l2564_c40_6836_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l2564_c40_6836_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l2564_c40_6836_phase <= VAR_gth_uxn_opcodes_h_l2564_c40_6836_phase;
     gth_uxn_opcodes_h_l2564_c40_6836_ins <= VAR_gth_uxn_opcodes_h_l2564_c40_6836_ins;
     gth_uxn_opcodes_h_l2564_c40_6836_previous_stack_read <= VAR_gth_uxn_opcodes_h_l2564_c40_6836_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l2564_c40_6836_return_output := gth_uxn_opcodes_h_l2564_c40_6836_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c7_7f81_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c7_b73a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c1_216d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c7_b73a_return_output;
     VAR_gth2_uxn_opcodes_h_l2565_c40_fd50_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_466a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2564_c7_f981_iftrue := VAR_gth_uxn_opcodes_h_l2564_c40_6836_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2566_c1_216d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c1_216d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c1_216d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c1_216d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c1_216d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c1_216d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c1_216d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c1_216d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c1_216d_return_output;

     -- gth2[uxn_opcodes_h_l2565_c40_fd50] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l2565_c40_fd50_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l2565_c40_fd50_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l2565_c40_fd50_phase <= VAR_gth2_uxn_opcodes_h_l2565_c40_fd50_phase;
     gth2_uxn_opcodes_h_l2565_c40_fd50_ins <= VAR_gth2_uxn_opcodes_h_l2565_c40_fd50_ins;
     gth2_uxn_opcodes_h_l2565_c40_fd50_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l2565_c40_fd50_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l2565_c40_fd50_return_output := gth2_uxn_opcodes_h_l2565_c40_fd50_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2567_c7_7f81] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c7_7f81_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c7_7f81_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c7_7f81_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c7_7f81_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c7_7f81_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c7_7f81_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c7_7f81_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c7_7f81_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c7_a31a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c7_7f81_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c1_83c7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c7_7f81_return_output;
     VAR_lth_uxn_opcodes_h_l2566_c40_a5e1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2566_c1_216d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2565_c7_23c6_iftrue := VAR_gth2_uxn_opcodes_h_l2565_c40_fd50_return_output;
     -- lth[uxn_opcodes_h_l2566_c40_a5e1] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l2566_c40_a5e1_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l2566_c40_a5e1_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l2566_c40_a5e1_phase <= VAR_lth_uxn_opcodes_h_l2566_c40_a5e1_phase;
     lth_uxn_opcodes_h_l2566_c40_a5e1_ins <= VAR_lth_uxn_opcodes_h_l2566_c40_a5e1_ins;
     lth_uxn_opcodes_h_l2566_c40_a5e1_previous_stack_read <= VAR_lth_uxn_opcodes_h_l2566_c40_a5e1_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l2566_c40_a5e1_return_output := lth_uxn_opcodes_h_l2566_c40_a5e1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2567_c1_83c7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c1_83c7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c1_83c7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c1_83c7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c1_83c7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c1_83c7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c1_83c7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c1_83c7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c1_83c7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2568_c7_a31a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c7_a31a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c7_a31a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c7_a31a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c7_a31a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c7_a31a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c7_a31a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c7_a31a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c7_a31a_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c7_f572_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c7_a31a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c1_d332_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c7_a31a_return_output;
     VAR_lth2_uxn_opcodes_h_l2567_c40_dc84_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2567_c1_83c7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2566_c7_b73a_iftrue := VAR_lth_uxn_opcodes_h_l2566_c40_a5e1_return_output;
     -- lth2[uxn_opcodes_h_l2567_c40_dc84] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l2567_c40_dc84_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l2567_c40_dc84_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l2567_c40_dc84_phase <= VAR_lth2_uxn_opcodes_h_l2567_c40_dc84_phase;
     lth2_uxn_opcodes_h_l2567_c40_dc84_ins <= VAR_lth2_uxn_opcodes_h_l2567_c40_dc84_ins;
     lth2_uxn_opcodes_h_l2567_c40_dc84_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l2567_c40_dc84_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l2567_c40_dc84_return_output := lth2_uxn_opcodes_h_l2567_c40_dc84_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2568_c1_d332] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c1_d332_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c1_d332_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c1_d332_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c1_d332_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c1_d332_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c1_d332_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c1_d332_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c1_d332_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2569_c7_f572] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c7_f572_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c7_f572_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c7_f572_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c7_f572_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c7_f572_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c7_f572_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c7_f572_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c7_f572_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c7_4440_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c7_f572_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c1_266f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c7_f572_return_output;
     VAR_jmp_uxn_opcodes_h_l2568_c40_84d1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2568_c1_d332_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2567_c7_7f81_iftrue := VAR_lth2_uxn_opcodes_h_l2567_c40_dc84_return_output;
     -- jmp[uxn_opcodes_h_l2568_c40_84d1] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l2568_c40_84d1_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l2568_c40_84d1_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l2568_c40_84d1_phase <= VAR_jmp_uxn_opcodes_h_l2568_c40_84d1_phase;
     jmp_uxn_opcodes_h_l2568_c40_84d1_ins <= VAR_jmp_uxn_opcodes_h_l2568_c40_84d1_ins;
     jmp_uxn_opcodes_h_l2568_c40_84d1_pc <= VAR_jmp_uxn_opcodes_h_l2568_c40_84d1_pc;
     jmp_uxn_opcodes_h_l2568_c40_84d1_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l2568_c40_84d1_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l2568_c40_84d1_return_output := jmp_uxn_opcodes_h_l2568_c40_84d1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2569_c1_266f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c1_266f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c1_266f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c1_266f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c1_266f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c1_266f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c1_266f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c1_266f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c1_266f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2570_c7_4440] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c7_4440_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c7_4440_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c7_4440_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c7_4440_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c7_4440_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c7_4440_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c7_4440_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c7_4440_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c7_653e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c7_4440_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_0fd3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c7_4440_return_output;
     VAR_jmp2_uxn_opcodes_h_l2569_c40_d58f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2569_c1_266f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2568_c7_a31a_iftrue := VAR_jmp_uxn_opcodes_h_l2568_c40_84d1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2571_c7_653e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c7_653e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c7_653e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c7_653e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c7_653e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c7_653e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c7_653e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c7_653e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c7_653e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2570_c1_0fd3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_0fd3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_0fd3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_0fd3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_0fd3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_0fd3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_0fd3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_0fd3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_0fd3_return_output;

     -- jmp2[uxn_opcodes_h_l2569_c40_d58f] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l2569_c40_d58f_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l2569_c40_d58f_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l2569_c40_d58f_phase <= VAR_jmp2_uxn_opcodes_h_l2569_c40_d58f_phase;
     jmp2_uxn_opcodes_h_l2569_c40_d58f_ins <= VAR_jmp2_uxn_opcodes_h_l2569_c40_d58f_ins;
     jmp2_uxn_opcodes_h_l2569_c40_d58f_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l2569_c40_d58f_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l2569_c40_d58f_return_output := jmp2_uxn_opcodes_h_l2569_c40_d58f_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c7_2fe5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c7_653e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_ce56_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c7_653e_return_output;
     VAR_jcn_uxn_opcodes_h_l2570_c40_f0d2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2570_c1_0fd3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2569_c7_f572_iftrue := VAR_jmp2_uxn_opcodes_h_l2569_c40_d58f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2571_c1_ce56] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_ce56_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_ce56_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_ce56_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_ce56_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_ce56_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_ce56_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_ce56_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_ce56_return_output;

     -- jcn[uxn_opcodes_h_l2570_c40_f0d2] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l2570_c40_f0d2_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l2570_c40_f0d2_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l2570_c40_f0d2_phase <= VAR_jcn_uxn_opcodes_h_l2570_c40_f0d2_phase;
     jcn_uxn_opcodes_h_l2570_c40_f0d2_ins <= VAR_jcn_uxn_opcodes_h_l2570_c40_f0d2_ins;
     jcn_uxn_opcodes_h_l2570_c40_f0d2_pc <= VAR_jcn_uxn_opcodes_h_l2570_c40_f0d2_pc;
     jcn_uxn_opcodes_h_l2570_c40_f0d2_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l2570_c40_f0d2_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l2570_c40_f0d2_return_output := jcn_uxn_opcodes_h_l2570_c40_f0d2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2572_c7_2fe5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c7_2fe5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c7_2fe5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c7_2fe5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c7_2fe5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c7_2fe5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c7_2fe5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c7_2fe5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c7_2fe5_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c7_2c4c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c7_2fe5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c1_e6ea_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c7_2fe5_return_output;
     VAR_jcn2_uxn_opcodes_h_l2571_c40_5828_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_ce56_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2570_c7_4440_iftrue := VAR_jcn_uxn_opcodes_h_l2570_c40_f0d2_return_output;
     -- jcn2[uxn_opcodes_h_l2571_c40_5828] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l2571_c40_5828_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l2571_c40_5828_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l2571_c40_5828_phase <= VAR_jcn2_uxn_opcodes_h_l2571_c40_5828_phase;
     jcn2_uxn_opcodes_h_l2571_c40_5828_ins <= VAR_jcn2_uxn_opcodes_h_l2571_c40_5828_ins;
     jcn2_uxn_opcodes_h_l2571_c40_5828_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l2571_c40_5828_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l2571_c40_5828_return_output := jcn2_uxn_opcodes_h_l2571_c40_5828_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2573_c7_2c4c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c7_2c4c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c7_2c4c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c7_2c4c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c7_2c4c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c7_2c4c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c7_2c4c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c7_2c4c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c7_2c4c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2572_c1_e6ea] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c1_e6ea_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c1_e6ea_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c1_e6ea_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c1_e6ea_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c1_e6ea_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c1_e6ea_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c1_e6ea_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c1_e6ea_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c7_a82c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c7_2c4c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_4525_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c7_2c4c_return_output;
     VAR_jsr_uxn_opcodes_h_l2572_c40_6d7b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2572_c1_e6ea_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2571_c7_653e_iftrue := VAR_jcn2_uxn_opcodes_h_l2571_c40_5828_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2573_c1_4525] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_4525_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_4525_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_4525_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_4525_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_4525_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_4525_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_4525_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_4525_return_output;

     -- jsr[uxn_opcodes_h_l2572_c40_6d7b] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l2572_c40_6d7b_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l2572_c40_6d7b_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l2572_c40_6d7b_phase <= VAR_jsr_uxn_opcodes_h_l2572_c40_6d7b_phase;
     jsr_uxn_opcodes_h_l2572_c40_6d7b_ins <= VAR_jsr_uxn_opcodes_h_l2572_c40_6d7b_ins;
     jsr_uxn_opcodes_h_l2572_c40_6d7b_pc <= VAR_jsr_uxn_opcodes_h_l2572_c40_6d7b_pc;
     jsr_uxn_opcodes_h_l2572_c40_6d7b_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l2572_c40_6d7b_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l2572_c40_6d7b_return_output := jsr_uxn_opcodes_h_l2572_c40_6d7b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2574_c7_a82c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c7_a82c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c7_a82c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c7_a82c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c7_a82c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c7_a82c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c7_a82c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c7_a82c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c7_a82c_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c7_ee9c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c7_a82c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c1_4611_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c7_a82c_return_output;
     VAR_jsr2_uxn_opcodes_h_l2573_c40_8faf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_4525_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2572_c7_2fe5_iftrue := VAR_jsr_uxn_opcodes_h_l2572_c40_6d7b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2574_c1_4611] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c1_4611_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c1_4611_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c1_4611_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c1_4611_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c1_4611_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c1_4611_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c1_4611_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c1_4611_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2575_c7_ee9c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c7_ee9c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c7_ee9c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c7_ee9c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c7_ee9c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c7_ee9c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c7_ee9c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c7_ee9c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c7_ee9c_return_output;

     -- jsr2[uxn_opcodes_h_l2573_c40_8faf] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l2573_c40_8faf_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l2573_c40_8faf_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l2573_c40_8faf_phase <= VAR_jsr2_uxn_opcodes_h_l2573_c40_8faf_phase;
     jsr2_uxn_opcodes_h_l2573_c40_8faf_ins <= VAR_jsr2_uxn_opcodes_h_l2573_c40_8faf_ins;
     jsr2_uxn_opcodes_h_l2573_c40_8faf_pc <= VAR_jsr2_uxn_opcodes_h_l2573_c40_8faf_pc;
     jsr2_uxn_opcodes_h_l2573_c40_8faf_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l2573_c40_8faf_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l2573_c40_8faf_return_output := jsr2_uxn_opcodes_h_l2573_c40_8faf_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c7_dc9e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c7_ee9c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c1_0256_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c7_ee9c_return_output;
     VAR_sth_uxn_opcodes_h_l2574_c40_399b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2574_c1_4611_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2573_c7_2c4c_iftrue := VAR_jsr2_uxn_opcodes_h_l2573_c40_8faf_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2576_c7_dc9e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c7_dc9e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c7_dc9e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c7_dc9e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c7_dc9e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c7_dc9e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c7_dc9e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c7_dc9e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c7_dc9e_return_output;

     -- sth[uxn_opcodes_h_l2574_c40_399b] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l2574_c40_399b_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l2574_c40_399b_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l2574_c40_399b_phase <= VAR_sth_uxn_opcodes_h_l2574_c40_399b_phase;
     sth_uxn_opcodes_h_l2574_c40_399b_ins <= VAR_sth_uxn_opcodes_h_l2574_c40_399b_ins;
     sth_uxn_opcodes_h_l2574_c40_399b_previous_stack_read <= VAR_sth_uxn_opcodes_h_l2574_c40_399b_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l2574_c40_399b_return_output := sth_uxn_opcodes_h_l2574_c40_399b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2575_c1_0256] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c1_0256_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c1_0256_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c1_0256_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c1_0256_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c1_0256_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c1_0256_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c1_0256_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c1_0256_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c7_af91_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c7_dc9e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_f7d4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c7_dc9e_return_output;
     VAR_sth2_uxn_opcodes_h_l2575_c40_d79c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2575_c1_0256_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2574_c7_a82c_iftrue := VAR_sth_uxn_opcodes_h_l2574_c40_399b_return_output;
     -- sth2[uxn_opcodes_h_l2575_c40_d79c] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l2575_c40_d79c_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l2575_c40_d79c_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l2575_c40_d79c_phase <= VAR_sth2_uxn_opcodes_h_l2575_c40_d79c_phase;
     sth2_uxn_opcodes_h_l2575_c40_d79c_ins <= VAR_sth2_uxn_opcodes_h_l2575_c40_d79c_ins;
     sth2_uxn_opcodes_h_l2575_c40_d79c_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l2575_c40_d79c_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l2575_c40_d79c_return_output := sth2_uxn_opcodes_h_l2575_c40_d79c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2576_c1_f7d4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_f7d4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_f7d4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_f7d4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_f7d4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_f7d4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_f7d4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_f7d4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_f7d4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2577_c7_af91] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c7_af91_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c7_af91_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c7_af91_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c7_af91_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c7_af91_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c7_af91_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c7_af91_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c7_af91_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c7_c0d8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c7_af91_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c1_b1e7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c7_af91_return_output;
     VAR_ldz_uxn_opcodes_h_l2576_c40_72ae_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_f7d4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2575_c7_ee9c_iftrue := VAR_sth2_uxn_opcodes_h_l2575_c40_d79c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2577_c1_b1e7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c1_b1e7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c1_b1e7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c1_b1e7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c1_b1e7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c1_b1e7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c1_b1e7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c1_b1e7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c1_b1e7_return_output;

     -- ldz[uxn_opcodes_h_l2576_c40_72ae] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l2576_c40_72ae_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l2576_c40_72ae_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l2576_c40_72ae_phase <= VAR_ldz_uxn_opcodes_h_l2576_c40_72ae_phase;
     ldz_uxn_opcodes_h_l2576_c40_72ae_ins <= VAR_ldz_uxn_opcodes_h_l2576_c40_72ae_ins;
     ldz_uxn_opcodes_h_l2576_c40_72ae_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l2576_c40_72ae_previous_stack_read;
     ldz_uxn_opcodes_h_l2576_c40_72ae_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l2576_c40_72ae_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l2576_c40_72ae_return_output := ldz_uxn_opcodes_h_l2576_c40_72ae_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2578_c7_c0d8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c7_c0d8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c7_c0d8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c7_c0d8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c7_c0d8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c7_c0d8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c7_c0d8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c7_c0d8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c7_c0d8_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c7_8c50_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c7_c0d8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c1_9bf9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c7_c0d8_return_output;
     VAR_ldz2_uxn_opcodes_h_l2577_c40_a1fd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2577_c1_b1e7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2576_c7_dc9e_iftrue := VAR_ldz_uxn_opcodes_h_l2576_c40_72ae_return_output;
     -- ldz2[uxn_opcodes_h_l2577_c40_a1fd] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l2577_c40_a1fd_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l2577_c40_a1fd_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l2577_c40_a1fd_phase <= VAR_ldz2_uxn_opcodes_h_l2577_c40_a1fd_phase;
     ldz2_uxn_opcodes_h_l2577_c40_a1fd_ins <= VAR_ldz2_uxn_opcodes_h_l2577_c40_a1fd_ins;
     ldz2_uxn_opcodes_h_l2577_c40_a1fd_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l2577_c40_a1fd_previous_stack_read;
     ldz2_uxn_opcodes_h_l2577_c40_a1fd_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l2577_c40_a1fd_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l2577_c40_a1fd_return_output := ldz2_uxn_opcodes_h_l2577_c40_a1fd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2579_c7_8c50] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c7_8c50_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c7_8c50_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c7_8c50_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c7_8c50_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c7_8c50_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c7_8c50_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c7_8c50_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c7_8c50_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2578_c1_9bf9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c1_9bf9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c1_9bf9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c1_9bf9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c1_9bf9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c1_9bf9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c1_9bf9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c1_9bf9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c1_9bf9_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c7_3d61_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c7_8c50_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c1_4f85_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c7_8c50_return_output;
     VAR_stz_uxn_opcodes_h_l2578_c40_49bc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2578_c1_9bf9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2577_c7_af91_iftrue := VAR_ldz2_uxn_opcodes_h_l2577_c40_a1fd_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2579_c1_4f85] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c1_4f85_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c1_4f85_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c1_4f85_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c1_4f85_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c1_4f85_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c1_4f85_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c1_4f85_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c1_4f85_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2580_c7_3d61] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c7_3d61_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c7_3d61_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c7_3d61_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c7_3d61_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c7_3d61_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c7_3d61_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c7_3d61_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c7_3d61_return_output;

     -- stz[uxn_opcodes_h_l2578_c40_49bc] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l2578_c40_49bc_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l2578_c40_49bc_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l2578_c40_49bc_phase <= VAR_stz_uxn_opcodes_h_l2578_c40_49bc_phase;
     stz_uxn_opcodes_h_l2578_c40_49bc_ins <= VAR_stz_uxn_opcodes_h_l2578_c40_49bc_ins;
     stz_uxn_opcodes_h_l2578_c40_49bc_previous_stack_read <= VAR_stz_uxn_opcodes_h_l2578_c40_49bc_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l2578_c40_49bc_return_output := stz_uxn_opcodes_h_l2578_c40_49bc_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c7_f736_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c7_3d61_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c1_5e1f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c7_3d61_return_output;
     VAR_stz2_uxn_opcodes_h_l2579_c40_f4b9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2579_c1_4f85_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2578_c7_c0d8_iftrue := VAR_stz_uxn_opcodes_h_l2578_c40_49bc_return_output;
     -- stz2[uxn_opcodes_h_l2579_c40_f4b9] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l2579_c40_f4b9_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l2579_c40_f4b9_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l2579_c40_f4b9_phase <= VAR_stz2_uxn_opcodes_h_l2579_c40_f4b9_phase;
     stz2_uxn_opcodes_h_l2579_c40_f4b9_ins <= VAR_stz2_uxn_opcodes_h_l2579_c40_f4b9_ins;
     stz2_uxn_opcodes_h_l2579_c40_f4b9_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l2579_c40_f4b9_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l2579_c40_f4b9_return_output := stz2_uxn_opcodes_h_l2579_c40_f4b9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2581_c7_f736] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c7_f736_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c7_f736_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c7_f736_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c7_f736_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c7_f736_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c7_f736_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c7_f736_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c7_f736_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2580_c1_5e1f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c1_5e1f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c1_5e1f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c1_5e1f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c1_5e1f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c1_5e1f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c1_5e1f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c1_5e1f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c1_5e1f_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c7_8b31_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c7_f736_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c1_d7a6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c7_f736_return_output;
     VAR_ldr_uxn_opcodes_h_l2580_c40_88bc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2580_c1_5e1f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2579_c7_8c50_iftrue := VAR_stz2_uxn_opcodes_h_l2579_c40_f4b9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2581_c1_d7a6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c1_d7a6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c1_d7a6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c1_d7a6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c1_d7a6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c1_d7a6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c1_d7a6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c1_d7a6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c1_d7a6_return_output;

     -- ldr[uxn_opcodes_h_l2580_c40_88bc] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l2580_c40_88bc_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l2580_c40_88bc_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l2580_c40_88bc_phase <= VAR_ldr_uxn_opcodes_h_l2580_c40_88bc_phase;
     ldr_uxn_opcodes_h_l2580_c40_88bc_ins <= VAR_ldr_uxn_opcodes_h_l2580_c40_88bc_ins;
     ldr_uxn_opcodes_h_l2580_c40_88bc_pc <= VAR_ldr_uxn_opcodes_h_l2580_c40_88bc_pc;
     ldr_uxn_opcodes_h_l2580_c40_88bc_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l2580_c40_88bc_previous_stack_read;
     ldr_uxn_opcodes_h_l2580_c40_88bc_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l2580_c40_88bc_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l2580_c40_88bc_return_output := ldr_uxn_opcodes_h_l2580_c40_88bc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2582_c7_8b31] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c7_8b31_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c7_8b31_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c7_8b31_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c7_8b31_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c7_8b31_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c7_8b31_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c7_8b31_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c7_8b31_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c7_43f0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c7_8b31_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c1_d8f7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c7_8b31_return_output;
     VAR_ldr2_uxn_opcodes_h_l2581_c40_4b84_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2581_c1_d7a6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2580_c7_3d61_iftrue := VAR_ldr_uxn_opcodes_h_l2580_c40_88bc_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2582_c1_d8f7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c1_d8f7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c1_d8f7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c1_d8f7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c1_d8f7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c1_d8f7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c1_d8f7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c1_d8f7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c1_d8f7_return_output;

     -- ldr2[uxn_opcodes_h_l2581_c40_4b84] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l2581_c40_4b84_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l2581_c40_4b84_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l2581_c40_4b84_phase <= VAR_ldr2_uxn_opcodes_h_l2581_c40_4b84_phase;
     ldr2_uxn_opcodes_h_l2581_c40_4b84_ins <= VAR_ldr2_uxn_opcodes_h_l2581_c40_4b84_ins;
     ldr2_uxn_opcodes_h_l2581_c40_4b84_pc <= VAR_ldr2_uxn_opcodes_h_l2581_c40_4b84_pc;
     ldr2_uxn_opcodes_h_l2581_c40_4b84_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l2581_c40_4b84_previous_stack_read;
     ldr2_uxn_opcodes_h_l2581_c40_4b84_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l2581_c40_4b84_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l2581_c40_4b84_return_output := ldr2_uxn_opcodes_h_l2581_c40_4b84_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2583_c7_43f0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c7_43f0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c7_43f0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c7_43f0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c7_43f0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c7_43f0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c7_43f0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c7_43f0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c7_43f0_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c7_ff57_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c7_43f0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c1_670f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c7_43f0_return_output;
     VAR_str1_uxn_opcodes_h_l2582_c40_9cb6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2582_c1_d8f7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2581_c7_f736_iftrue := VAR_ldr2_uxn_opcodes_h_l2581_c40_4b84_return_output;
     -- str1[uxn_opcodes_h_l2582_c40_9cb6] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l2582_c40_9cb6_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l2582_c40_9cb6_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l2582_c40_9cb6_phase <= VAR_str1_uxn_opcodes_h_l2582_c40_9cb6_phase;
     str1_uxn_opcodes_h_l2582_c40_9cb6_ins <= VAR_str1_uxn_opcodes_h_l2582_c40_9cb6_ins;
     str1_uxn_opcodes_h_l2582_c40_9cb6_pc <= VAR_str1_uxn_opcodes_h_l2582_c40_9cb6_pc;
     str1_uxn_opcodes_h_l2582_c40_9cb6_previous_stack_read <= VAR_str1_uxn_opcodes_h_l2582_c40_9cb6_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l2582_c40_9cb6_return_output := str1_uxn_opcodes_h_l2582_c40_9cb6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2583_c1_670f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c1_670f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c1_670f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c1_670f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c1_670f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c1_670f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c1_670f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c1_670f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c1_670f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2584_c7_ff57] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c7_ff57_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c7_ff57_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c7_ff57_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c7_ff57_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c7_ff57_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c7_ff57_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c7_ff57_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c7_ff57_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c7_955d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c7_ff57_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c1_0ae6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c7_ff57_return_output;
     VAR_str2_uxn_opcodes_h_l2583_c40_2538_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2583_c1_670f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2582_c7_8b31_iftrue := VAR_str1_uxn_opcodes_h_l2582_c40_9cb6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2585_c7_955d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c7_955d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c7_955d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c7_955d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c7_955d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c7_955d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c7_955d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c7_955d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c7_955d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2584_c1_0ae6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c1_0ae6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c1_0ae6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c1_0ae6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c1_0ae6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c1_0ae6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c1_0ae6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c1_0ae6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c1_0ae6_return_output;

     -- str2[uxn_opcodes_h_l2583_c40_2538] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l2583_c40_2538_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l2583_c40_2538_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l2583_c40_2538_phase <= VAR_str2_uxn_opcodes_h_l2583_c40_2538_phase;
     str2_uxn_opcodes_h_l2583_c40_2538_ins <= VAR_str2_uxn_opcodes_h_l2583_c40_2538_ins;
     str2_uxn_opcodes_h_l2583_c40_2538_pc <= VAR_str2_uxn_opcodes_h_l2583_c40_2538_pc;
     str2_uxn_opcodes_h_l2583_c40_2538_previous_stack_read <= VAR_str2_uxn_opcodes_h_l2583_c40_2538_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l2583_c40_2538_return_output := str2_uxn_opcodes_h_l2583_c40_2538_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c7_205c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c7_955d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c1_95e2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c7_955d_return_output;
     VAR_lda_uxn_opcodes_h_l2584_c40_8757_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2584_c1_0ae6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2583_c7_43f0_iftrue := VAR_str2_uxn_opcodes_h_l2583_c40_2538_return_output;
     -- lda[uxn_opcodes_h_l2584_c40_8757] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l2584_c40_8757_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l2584_c40_8757_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l2584_c40_8757_phase <= VAR_lda_uxn_opcodes_h_l2584_c40_8757_phase;
     lda_uxn_opcodes_h_l2584_c40_8757_ins <= VAR_lda_uxn_opcodes_h_l2584_c40_8757_ins;
     lda_uxn_opcodes_h_l2584_c40_8757_previous_stack_read <= VAR_lda_uxn_opcodes_h_l2584_c40_8757_previous_stack_read;
     lda_uxn_opcodes_h_l2584_c40_8757_previous_ram_read <= VAR_lda_uxn_opcodes_h_l2584_c40_8757_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l2584_c40_8757_return_output := lda_uxn_opcodes_h_l2584_c40_8757_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2586_c7_205c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c7_205c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c7_205c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c7_205c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c7_205c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c7_205c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c7_205c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c7_205c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c7_205c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2585_c1_95e2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c1_95e2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c1_95e2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c1_95e2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c1_95e2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c1_95e2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c1_95e2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c1_95e2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c1_95e2_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c7_9db0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c7_205c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c1_c3d1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c7_205c_return_output;
     VAR_lda2_uxn_opcodes_h_l2585_c40_36dd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2585_c1_95e2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2584_c7_ff57_iftrue := VAR_lda_uxn_opcodes_h_l2584_c40_8757_return_output;
     -- lda2[uxn_opcodes_h_l2585_c40_36dd] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l2585_c40_36dd_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l2585_c40_36dd_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l2585_c40_36dd_phase <= VAR_lda2_uxn_opcodes_h_l2585_c40_36dd_phase;
     lda2_uxn_opcodes_h_l2585_c40_36dd_ins <= VAR_lda2_uxn_opcodes_h_l2585_c40_36dd_ins;
     lda2_uxn_opcodes_h_l2585_c40_36dd_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l2585_c40_36dd_previous_stack_read;
     lda2_uxn_opcodes_h_l2585_c40_36dd_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l2585_c40_36dd_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l2585_c40_36dd_return_output := lda2_uxn_opcodes_h_l2585_c40_36dd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2586_c1_c3d1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c1_c3d1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c1_c3d1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c1_c3d1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c1_c3d1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c1_c3d1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c1_c3d1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c1_c3d1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c1_c3d1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2587_c7_9db0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c7_9db0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c7_9db0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c7_9db0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c7_9db0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c7_9db0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c7_9db0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c7_9db0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c7_9db0_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c7_474f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c7_9db0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c1_f247_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c7_9db0_return_output;
     VAR_sta_uxn_opcodes_h_l2586_c40_c4ac_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2586_c1_c3d1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2585_c7_955d_iftrue := VAR_lda2_uxn_opcodes_h_l2585_c40_36dd_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2587_c1_f247] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c1_f247_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c1_f247_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c1_f247_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c1_f247_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c1_f247_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c1_f247_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c1_f247_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c1_f247_return_output;

     -- sta[uxn_opcodes_h_l2586_c40_c4ac] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l2586_c40_c4ac_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l2586_c40_c4ac_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l2586_c40_c4ac_phase <= VAR_sta_uxn_opcodes_h_l2586_c40_c4ac_phase;
     sta_uxn_opcodes_h_l2586_c40_c4ac_ins <= VAR_sta_uxn_opcodes_h_l2586_c40_c4ac_ins;
     sta_uxn_opcodes_h_l2586_c40_c4ac_previous_stack_read <= VAR_sta_uxn_opcodes_h_l2586_c40_c4ac_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l2586_c40_c4ac_return_output := sta_uxn_opcodes_h_l2586_c40_c4ac_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2588_c7_474f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c7_474f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c7_474f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c7_474f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c7_474f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c7_474f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c7_474f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c7_474f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c7_474f_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c7_5280_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c7_474f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c1_92e3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c7_474f_return_output;
     VAR_sta2_uxn_opcodes_h_l2587_c40_e790_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2587_c1_f247_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2586_c7_205c_iftrue := VAR_sta_uxn_opcodes_h_l2586_c40_c4ac_return_output;
     -- sta2[uxn_opcodes_h_l2587_c40_e790] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l2587_c40_e790_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l2587_c40_e790_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l2587_c40_e790_phase <= VAR_sta2_uxn_opcodes_h_l2587_c40_e790_phase;
     sta2_uxn_opcodes_h_l2587_c40_e790_ins <= VAR_sta2_uxn_opcodes_h_l2587_c40_e790_ins;
     sta2_uxn_opcodes_h_l2587_c40_e790_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l2587_c40_e790_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l2587_c40_e790_return_output := sta2_uxn_opcodes_h_l2587_c40_e790_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2588_c1_92e3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c1_92e3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c1_92e3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c1_92e3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c1_92e3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c1_92e3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c1_92e3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c1_92e3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c1_92e3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2589_c7_5280] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c7_5280_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c7_5280_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c7_5280_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c7_5280_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c7_5280_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c7_5280_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c7_5280_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c7_5280_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c7_157b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c7_5280_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c1_b6d3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c7_5280_return_output;
     VAR_dei_uxn_opcodes_h_l2588_c40_69c1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2588_c1_92e3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2587_c7_9db0_iftrue := VAR_sta2_uxn_opcodes_h_l2587_c40_e790_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2590_c7_157b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c7_157b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c7_157b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c7_157b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c7_157b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c7_157b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c7_157b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c7_157b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c7_157b_return_output;

     -- dei[uxn_opcodes_h_l2588_c40_69c1] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l2588_c40_69c1_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l2588_c40_69c1_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l2588_c40_69c1_phase <= VAR_dei_uxn_opcodes_h_l2588_c40_69c1_phase;
     dei_uxn_opcodes_h_l2588_c40_69c1_ins <= VAR_dei_uxn_opcodes_h_l2588_c40_69c1_ins;
     dei_uxn_opcodes_h_l2588_c40_69c1_previous_stack_read <= VAR_dei_uxn_opcodes_h_l2588_c40_69c1_previous_stack_read;
     dei_uxn_opcodes_h_l2588_c40_69c1_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l2588_c40_69c1_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l2588_c40_69c1_return_output := dei_uxn_opcodes_h_l2588_c40_69c1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2589_c1_b6d3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c1_b6d3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c1_b6d3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c1_b6d3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c1_b6d3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c1_b6d3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c1_b6d3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c1_b6d3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c1_b6d3_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c7_7683_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c7_157b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c1_4287_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c7_157b_return_output;
     VAR_dei2_uxn_opcodes_h_l2589_c40_a853_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2589_c1_b6d3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2588_c7_474f_iftrue := VAR_dei_uxn_opcodes_h_l2588_c40_69c1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2591_c7_7683] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c7_7683_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c7_7683_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c7_7683_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c7_7683_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c7_7683_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c7_7683_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c7_7683_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c7_7683_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2590_c1_4287] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c1_4287_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c1_4287_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c1_4287_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c1_4287_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c1_4287_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c1_4287_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c1_4287_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c1_4287_return_output;

     -- dei2[uxn_opcodes_h_l2589_c40_a853] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l2589_c40_a853_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l2589_c40_a853_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l2589_c40_a853_phase <= VAR_dei2_uxn_opcodes_h_l2589_c40_a853_phase;
     dei2_uxn_opcodes_h_l2589_c40_a853_ins <= VAR_dei2_uxn_opcodes_h_l2589_c40_a853_ins;
     dei2_uxn_opcodes_h_l2589_c40_a853_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l2589_c40_a853_previous_stack_read;
     dei2_uxn_opcodes_h_l2589_c40_a853_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l2589_c40_a853_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l2589_c40_a853_return_output := dei2_uxn_opcodes_h_l2589_c40_a853_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c7_9ad0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c7_7683_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c1_d2d1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c7_7683_return_output;
     VAR_deo_uxn_opcodes_h_l2590_c40_7c9c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2590_c1_4287_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2589_c7_5280_iftrue := VAR_dei2_uxn_opcodes_h_l2589_c40_a853_return_output;
     -- deo[uxn_opcodes_h_l2590_c40_7c9c] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l2590_c40_7c9c_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l2590_c40_7c9c_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l2590_c40_7c9c_phase <= VAR_deo_uxn_opcodes_h_l2590_c40_7c9c_phase;
     deo_uxn_opcodes_h_l2590_c40_7c9c_ins <= VAR_deo_uxn_opcodes_h_l2590_c40_7c9c_ins;
     deo_uxn_opcodes_h_l2590_c40_7c9c_previous_stack_read <= VAR_deo_uxn_opcodes_h_l2590_c40_7c9c_previous_stack_read;
     deo_uxn_opcodes_h_l2590_c40_7c9c_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l2590_c40_7c9c_previous_device_ram_read;
     deo_uxn_opcodes_h_l2590_c40_7c9c_previous_ram_read <= VAR_deo_uxn_opcodes_h_l2590_c40_7c9c_previous_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l2590_c40_7c9c_return_output := deo_uxn_opcodes_h_l2590_c40_7c9c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2592_c7_9ad0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c7_9ad0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c7_9ad0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c7_9ad0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c7_9ad0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c7_9ad0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c7_9ad0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c7_9ad0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c7_9ad0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2591_c1_d2d1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c1_d2d1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c1_d2d1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c1_d2d1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c1_d2d1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c1_d2d1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c1_d2d1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c1_d2d1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c1_d2d1_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c7_498d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c7_9ad0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c1_3b5a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c7_9ad0_return_output;
     VAR_deo2_uxn_opcodes_h_l2591_c40_6834_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2591_c1_d2d1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2590_c7_157b_iftrue := VAR_deo_uxn_opcodes_h_l2590_c40_7c9c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2592_c1_3b5a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c1_3b5a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c1_3b5a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c1_3b5a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c1_3b5a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c1_3b5a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c1_3b5a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c1_3b5a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c1_3b5a_return_output;

     -- deo2[uxn_opcodes_h_l2591_c40_6834] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l2591_c40_6834_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l2591_c40_6834_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l2591_c40_6834_phase <= VAR_deo2_uxn_opcodes_h_l2591_c40_6834_phase;
     deo2_uxn_opcodes_h_l2591_c40_6834_ins <= VAR_deo2_uxn_opcodes_h_l2591_c40_6834_ins;
     deo2_uxn_opcodes_h_l2591_c40_6834_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l2591_c40_6834_previous_stack_read;
     deo2_uxn_opcodes_h_l2591_c40_6834_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l2591_c40_6834_previous_device_ram_read;
     deo2_uxn_opcodes_h_l2591_c40_6834_previous_ram_read <= VAR_deo2_uxn_opcodes_h_l2591_c40_6834_previous_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l2591_c40_6834_return_output := deo2_uxn_opcodes_h_l2591_c40_6834_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2593_c7_498d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c7_498d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c7_498d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c7_498d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c7_498d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c7_498d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c7_498d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c7_498d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c7_498d_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c7_ea71_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c7_498d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c1_d3cb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c7_498d_return_output;
     VAR_add_uxn_opcodes_h_l2592_c40_97de_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2592_c1_3b5a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2591_c7_7683_iftrue := VAR_deo2_uxn_opcodes_h_l2591_c40_6834_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2593_c1_d3cb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c1_d3cb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c1_d3cb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c1_d3cb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c1_d3cb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c1_d3cb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c1_d3cb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c1_d3cb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c1_d3cb_return_output;

     -- add[uxn_opcodes_h_l2592_c40_97de] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l2592_c40_97de_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l2592_c40_97de_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l2592_c40_97de_phase <= VAR_add_uxn_opcodes_h_l2592_c40_97de_phase;
     add_uxn_opcodes_h_l2592_c40_97de_ins <= VAR_add_uxn_opcodes_h_l2592_c40_97de_ins;
     add_uxn_opcodes_h_l2592_c40_97de_previous_stack_read <= VAR_add_uxn_opcodes_h_l2592_c40_97de_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l2592_c40_97de_return_output := add_uxn_opcodes_h_l2592_c40_97de_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2594_c7_ea71] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c7_ea71_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c7_ea71_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c7_ea71_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c7_ea71_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c7_ea71_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c7_ea71_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c7_ea71_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c7_ea71_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c7_b70d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c7_ea71_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c1_8c8e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c7_ea71_return_output;
     VAR_add2_uxn_opcodes_h_l2593_c40_b951_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2593_c1_d3cb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2592_c7_9ad0_iftrue := VAR_add_uxn_opcodes_h_l2592_c40_97de_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2594_c1_8c8e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c1_8c8e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c1_8c8e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c1_8c8e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c1_8c8e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c1_8c8e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c1_8c8e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c1_8c8e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c1_8c8e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2595_c7_b70d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c7_b70d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c7_b70d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c7_b70d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c7_b70d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c7_b70d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c7_b70d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c7_b70d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c7_b70d_return_output;

     -- add2[uxn_opcodes_h_l2593_c40_b951] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l2593_c40_b951_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l2593_c40_b951_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l2593_c40_b951_phase <= VAR_add2_uxn_opcodes_h_l2593_c40_b951_phase;
     add2_uxn_opcodes_h_l2593_c40_b951_ins <= VAR_add2_uxn_opcodes_h_l2593_c40_b951_ins;
     add2_uxn_opcodes_h_l2593_c40_b951_previous_stack_read <= VAR_add2_uxn_opcodes_h_l2593_c40_b951_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l2593_c40_b951_return_output := add2_uxn_opcodes_h_l2593_c40_b951_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c7_2426_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c7_b70d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c1_2988_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c7_b70d_return_output;
     VAR_sub_uxn_opcodes_h_l2594_c40_3537_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2594_c1_8c8e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2593_c7_498d_iftrue := VAR_add2_uxn_opcodes_h_l2593_c40_b951_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2596_c7_2426] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c7_2426_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c7_2426_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c7_2426_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c7_2426_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c7_2426_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c7_2426_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c7_2426_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c7_2426_return_output;

     -- sub[uxn_opcodes_h_l2594_c40_3537] LATENCY=0
     -- Clock enable
     sub_uxn_opcodes_h_l2594_c40_3537_CLOCK_ENABLE <= VAR_sub_uxn_opcodes_h_l2594_c40_3537_CLOCK_ENABLE;
     -- Inputs
     sub_uxn_opcodes_h_l2594_c40_3537_phase <= VAR_sub_uxn_opcodes_h_l2594_c40_3537_phase;
     sub_uxn_opcodes_h_l2594_c40_3537_ins <= VAR_sub_uxn_opcodes_h_l2594_c40_3537_ins;
     sub_uxn_opcodes_h_l2594_c40_3537_previous_stack_read <= VAR_sub_uxn_opcodes_h_l2594_c40_3537_previous_stack_read;
     -- Outputs
     VAR_sub_uxn_opcodes_h_l2594_c40_3537_return_output := sub_uxn_opcodes_h_l2594_c40_3537_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2595_c1_2988] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c1_2988_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c1_2988_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c1_2988_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c1_2988_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c1_2988_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c1_2988_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c1_2988_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c1_2988_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c7_c0ec_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c7_2426_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c1_9856_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c7_2426_return_output;
     VAR_sub2_uxn_opcodes_h_l2595_c40_50bd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2595_c1_2988_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2594_c7_ea71_iftrue := VAR_sub_uxn_opcodes_h_l2594_c40_3537_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2596_c1_9856] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c1_9856_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c1_9856_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c1_9856_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c1_9856_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c1_9856_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c1_9856_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c1_9856_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c1_9856_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2597_c7_c0ec] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c7_c0ec_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c7_c0ec_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c7_c0ec_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c7_c0ec_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c7_c0ec_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c7_c0ec_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c7_c0ec_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c7_c0ec_return_output;

     -- sub2[uxn_opcodes_h_l2595_c40_50bd] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l2595_c40_50bd_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l2595_c40_50bd_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l2595_c40_50bd_phase <= VAR_sub2_uxn_opcodes_h_l2595_c40_50bd_phase;
     sub2_uxn_opcodes_h_l2595_c40_50bd_ins <= VAR_sub2_uxn_opcodes_h_l2595_c40_50bd_ins;
     sub2_uxn_opcodes_h_l2595_c40_50bd_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l2595_c40_50bd_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l2595_c40_50bd_return_output := sub2_uxn_opcodes_h_l2595_c40_50bd_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c7_f595_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c7_c0ec_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c1_38b1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c7_c0ec_return_output;
     VAR_mul_uxn_opcodes_h_l2596_c40_feff_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2596_c1_9856_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2595_c7_b70d_iftrue := VAR_sub2_uxn_opcodes_h_l2595_c40_50bd_return_output;
     -- mul[uxn_opcodes_h_l2596_c40_feff] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l2596_c40_feff_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l2596_c40_feff_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l2596_c40_feff_phase <= VAR_mul_uxn_opcodes_h_l2596_c40_feff_phase;
     mul_uxn_opcodes_h_l2596_c40_feff_ins <= VAR_mul_uxn_opcodes_h_l2596_c40_feff_ins;
     mul_uxn_opcodes_h_l2596_c40_feff_previous_stack_read <= VAR_mul_uxn_opcodes_h_l2596_c40_feff_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l2596_c40_feff_return_output := mul_uxn_opcodes_h_l2596_c40_feff_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2597_c1_38b1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c1_38b1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c1_38b1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c1_38b1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c1_38b1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c1_38b1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c1_38b1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c1_38b1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c1_38b1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2598_c7_f595] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c7_f595_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c7_f595_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c7_f595_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c7_f595_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c7_f595_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c7_f595_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c7_f595_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c7_f595_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c7_1fbf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c7_f595_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c1_ccf5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c7_f595_return_output;
     VAR_mul2_uxn_opcodes_h_l2597_c40_9413_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2597_c1_38b1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2596_c7_2426_iftrue := VAR_mul_uxn_opcodes_h_l2596_c40_feff_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2599_c7_1fbf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c7_1fbf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c7_1fbf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c7_1fbf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c7_1fbf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c7_1fbf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c7_1fbf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c7_1fbf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c7_1fbf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2598_c1_ccf5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c1_ccf5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c1_ccf5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c1_ccf5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c1_ccf5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c1_ccf5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c1_ccf5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c1_ccf5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c1_ccf5_return_output;

     -- mul2[uxn_opcodes_h_l2597_c40_9413] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l2597_c40_9413_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l2597_c40_9413_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l2597_c40_9413_phase <= VAR_mul2_uxn_opcodes_h_l2597_c40_9413_phase;
     mul2_uxn_opcodes_h_l2597_c40_9413_ins <= VAR_mul2_uxn_opcodes_h_l2597_c40_9413_ins;
     mul2_uxn_opcodes_h_l2597_c40_9413_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l2597_c40_9413_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l2597_c40_9413_return_output := mul2_uxn_opcodes_h_l2597_c40_9413_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c7_683b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c7_1fbf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c1_2417_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c7_1fbf_return_output;
     VAR_div_uxn_opcodes_h_l2598_c40_cc14_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2598_c1_ccf5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2597_c7_c0ec_iftrue := VAR_mul2_uxn_opcodes_h_l2597_c40_9413_return_output;
     -- div[uxn_opcodes_h_l2598_c40_cc14] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l2598_c40_cc14_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l2598_c40_cc14_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l2598_c40_cc14_phase <= VAR_div_uxn_opcodes_h_l2598_c40_cc14_phase;
     div_uxn_opcodes_h_l2598_c40_cc14_ins <= VAR_div_uxn_opcodes_h_l2598_c40_cc14_ins;
     div_uxn_opcodes_h_l2598_c40_cc14_previous_stack_read <= VAR_div_uxn_opcodes_h_l2598_c40_cc14_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l2598_c40_cc14_return_output := div_uxn_opcodes_h_l2598_c40_cc14_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2599_c1_2417] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c1_2417_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c1_2417_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c1_2417_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c1_2417_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c1_2417_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c1_2417_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c1_2417_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c1_2417_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2600_c7_683b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c7_683b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c7_683b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c7_683b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c7_683b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c7_683b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c7_683b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c7_683b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c7_683b_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c7_1efa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c7_683b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_84ac_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c7_683b_return_output;
     VAR_div2_uxn_opcodes_h_l2599_c40_3dd1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2599_c1_2417_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2598_c7_f595_iftrue := VAR_div_uxn_opcodes_h_l2598_c40_cc14_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2600_c1_84ac] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_84ac_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_84ac_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_84ac_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_84ac_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_84ac_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_84ac_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_84ac_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_84ac_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2601_c7_1efa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c7_1efa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c7_1efa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c7_1efa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c7_1efa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c7_1efa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c7_1efa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c7_1efa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c7_1efa_return_output;

     -- div2[uxn_opcodes_h_l2599_c40_3dd1] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l2599_c40_3dd1_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l2599_c40_3dd1_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l2599_c40_3dd1_phase <= VAR_div2_uxn_opcodes_h_l2599_c40_3dd1_phase;
     div2_uxn_opcodes_h_l2599_c40_3dd1_ins <= VAR_div2_uxn_opcodes_h_l2599_c40_3dd1_ins;
     div2_uxn_opcodes_h_l2599_c40_3dd1_previous_stack_read <= VAR_div2_uxn_opcodes_h_l2599_c40_3dd1_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l2599_c40_3dd1_return_output := div2_uxn_opcodes_h_l2599_c40_3dd1_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c7_620a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c7_1efa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c1_0b00_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c7_1efa_return_output;
     VAR_and_uxn_opcodes_h_l2600_c40_3c81_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_84ac_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2599_c7_1fbf_iftrue := VAR_div2_uxn_opcodes_h_l2599_c40_3dd1_return_output;
     -- and[uxn_opcodes_h_l2600_c40_3c81] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l2600_c40_3c81_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l2600_c40_3c81_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l2600_c40_3c81_phase <= VAR_and_uxn_opcodes_h_l2600_c40_3c81_phase;
     and_uxn_opcodes_h_l2600_c40_3c81_ins <= VAR_and_uxn_opcodes_h_l2600_c40_3c81_ins;
     and_uxn_opcodes_h_l2600_c40_3c81_previous_stack_read <= VAR_and_uxn_opcodes_h_l2600_c40_3c81_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l2600_c40_3c81_return_output := and_uxn_opcodes_h_l2600_c40_3c81_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2601_c1_0b00] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c1_0b00_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c1_0b00_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c1_0b00_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c1_0b00_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c1_0b00_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c1_0b00_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c1_0b00_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c1_0b00_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2602_c7_620a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c7_620a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c7_620a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c7_620a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c7_620a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c7_620a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c7_620a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c7_620a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c7_620a_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c7_5e21_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c7_620a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c1_180f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c7_620a_return_output;
     VAR_and2_uxn_opcodes_h_l2601_c40_991a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2601_c1_0b00_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2600_c7_683b_iftrue := VAR_and_uxn_opcodes_h_l2600_c40_3c81_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2603_c7_5e21] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c7_5e21_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c7_5e21_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c7_5e21_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c7_5e21_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c7_5e21_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c7_5e21_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c7_5e21_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c7_5e21_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2602_c1_180f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c1_180f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c1_180f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c1_180f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c1_180f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c1_180f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c1_180f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c1_180f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c1_180f_return_output;

     -- and2[uxn_opcodes_h_l2601_c40_991a] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l2601_c40_991a_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l2601_c40_991a_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l2601_c40_991a_phase <= VAR_and2_uxn_opcodes_h_l2601_c40_991a_phase;
     and2_uxn_opcodes_h_l2601_c40_991a_ins <= VAR_and2_uxn_opcodes_h_l2601_c40_991a_ins;
     and2_uxn_opcodes_h_l2601_c40_991a_previous_stack_read <= VAR_and2_uxn_opcodes_h_l2601_c40_991a_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l2601_c40_991a_return_output := and2_uxn_opcodes_h_l2601_c40_991a_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c7_1270_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c7_5e21_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_d680_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c7_5e21_return_output;
     VAR_ora_uxn_opcodes_h_l2602_c40_ceea_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2602_c1_180f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2601_c7_1efa_iftrue := VAR_and2_uxn_opcodes_h_l2601_c40_991a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2604_c7_1270] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c7_1270_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c7_1270_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c7_1270_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c7_1270_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c7_1270_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c7_1270_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c7_1270_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c7_1270_return_output;

     -- ora[uxn_opcodes_h_l2602_c40_ceea] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l2602_c40_ceea_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l2602_c40_ceea_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l2602_c40_ceea_phase <= VAR_ora_uxn_opcodes_h_l2602_c40_ceea_phase;
     ora_uxn_opcodes_h_l2602_c40_ceea_ins <= VAR_ora_uxn_opcodes_h_l2602_c40_ceea_ins;
     ora_uxn_opcodes_h_l2602_c40_ceea_previous_stack_read <= VAR_ora_uxn_opcodes_h_l2602_c40_ceea_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l2602_c40_ceea_return_output := ora_uxn_opcodes_h_l2602_c40_ceea_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2603_c1_d680] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_d680_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_d680_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_d680_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_d680_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_d680_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_d680_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_d680_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_d680_return_output;

     -- Submodule level 74
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c7_5e80_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c7_1270_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c1_0fac_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c7_1270_return_output;
     VAR_ora2_uxn_opcodes_h_l2603_c40_b642_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_d680_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2602_c7_620a_iftrue := VAR_ora_uxn_opcodes_h_l2602_c40_ceea_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2604_c1_0fac] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c1_0fac_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c1_0fac_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c1_0fac_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c1_0fac_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c1_0fac_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c1_0fac_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c1_0fac_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c1_0fac_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2605_c7_5e80] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c7_5e80_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c7_5e80_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c7_5e80_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c7_5e80_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c7_5e80_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c7_5e80_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c7_5e80_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c7_5e80_return_output;

     -- ora2[uxn_opcodes_h_l2603_c40_b642] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l2603_c40_b642_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l2603_c40_b642_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l2603_c40_b642_phase <= VAR_ora2_uxn_opcodes_h_l2603_c40_b642_phase;
     ora2_uxn_opcodes_h_l2603_c40_b642_ins <= VAR_ora2_uxn_opcodes_h_l2603_c40_b642_ins;
     ora2_uxn_opcodes_h_l2603_c40_b642_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l2603_c40_b642_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l2603_c40_b642_return_output := ora2_uxn_opcodes_h_l2603_c40_b642_return_output;

     -- Submodule level 75
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c7_2198_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c7_5e80_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c1_0a11_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c7_5e80_return_output;
     VAR_eor_uxn_opcodes_h_l2604_c40_8850_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2604_c1_0fac_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2603_c7_5e21_iftrue := VAR_ora2_uxn_opcodes_h_l2603_c40_b642_return_output;
     -- eor[uxn_opcodes_h_l2604_c40_8850] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l2604_c40_8850_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l2604_c40_8850_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l2604_c40_8850_phase <= VAR_eor_uxn_opcodes_h_l2604_c40_8850_phase;
     eor_uxn_opcodes_h_l2604_c40_8850_ins <= VAR_eor_uxn_opcodes_h_l2604_c40_8850_ins;
     eor_uxn_opcodes_h_l2604_c40_8850_previous_stack_read <= VAR_eor_uxn_opcodes_h_l2604_c40_8850_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l2604_c40_8850_return_output := eor_uxn_opcodes_h_l2604_c40_8850_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2605_c1_0a11] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c1_0a11_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c1_0a11_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c1_0a11_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c1_0a11_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c1_0a11_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c1_0a11_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c1_0a11_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c1_0a11_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2606_c7_2198] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c7_2198_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c7_2198_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c7_2198_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c7_2198_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c7_2198_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c7_2198_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c7_2198_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c7_2198_return_output;

     -- Submodule level 76
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c7_a5d0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c7_2198_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c1_d368_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c7_2198_return_output;
     VAR_eor2_uxn_opcodes_h_l2605_c40_71d3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2605_c1_0a11_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2604_c7_1270_iftrue := VAR_eor_uxn_opcodes_h_l2604_c40_8850_return_output;
     -- eor2[uxn_opcodes_h_l2605_c40_71d3] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l2605_c40_71d3_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l2605_c40_71d3_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l2605_c40_71d3_phase <= VAR_eor2_uxn_opcodes_h_l2605_c40_71d3_phase;
     eor2_uxn_opcodes_h_l2605_c40_71d3_ins <= VAR_eor2_uxn_opcodes_h_l2605_c40_71d3_ins;
     eor2_uxn_opcodes_h_l2605_c40_71d3_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l2605_c40_71d3_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l2605_c40_71d3_return_output := eor2_uxn_opcodes_h_l2605_c40_71d3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2607_c7_a5d0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c7_a5d0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c7_a5d0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c7_a5d0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c7_a5d0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c7_a5d0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c7_a5d0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c7_a5d0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c7_a5d0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2606_c1_d368] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c1_d368_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c1_d368_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c1_d368_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c1_d368_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c1_d368_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c1_d368_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c1_d368_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c1_d368_return_output;

     -- Submodule level 77
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c1_b90f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c7_a5d0_return_output;
     VAR_sft_uxn_opcodes_h_l2606_c40_5c65_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2606_c1_d368_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2605_c7_5e80_iftrue := VAR_eor2_uxn_opcodes_h_l2605_c40_71d3_return_output;
     -- sft[uxn_opcodes_h_l2606_c40_5c65] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l2606_c40_5c65_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l2606_c40_5c65_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l2606_c40_5c65_phase <= VAR_sft_uxn_opcodes_h_l2606_c40_5c65_phase;
     sft_uxn_opcodes_h_l2606_c40_5c65_ins <= VAR_sft_uxn_opcodes_h_l2606_c40_5c65_ins;
     sft_uxn_opcodes_h_l2606_c40_5c65_previous_stack_read <= VAR_sft_uxn_opcodes_h_l2606_c40_5c65_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l2606_c40_5c65_return_output := sft_uxn_opcodes_h_l2606_c40_5c65_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2607_c1_b90f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c1_b90f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c1_b90f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c1_b90f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c1_b90f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c1_b90f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c1_b90f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c1_b90f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c1_b90f_return_output;

     -- Submodule level 78
     VAR_sft2_uxn_opcodes_h_l2607_c40_c639_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2607_c1_b90f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2606_c7_2198_iftrue := VAR_sft_uxn_opcodes_h_l2606_c40_5c65_return_output;
     -- sft2[uxn_opcodes_h_l2607_c40_c639] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l2607_c40_c639_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l2607_c40_c639_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l2607_c40_c639_phase <= VAR_sft2_uxn_opcodes_h_l2607_c40_c639_phase;
     sft2_uxn_opcodes_h_l2607_c40_c639_ins <= VAR_sft2_uxn_opcodes_h_l2607_c40_c639_ins;
     sft2_uxn_opcodes_h_l2607_c40_c639_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l2607_c40_c639_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l2607_c40_c639_return_output := sft2_uxn_opcodes_h_l2607_c40_c639_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l2607_c7_a5d0_iftrue := VAR_sft2_uxn_opcodes_h_l2607_c40_c639_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2607_c7_a5d0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2607_c7_a5d0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2607_c7_a5d0_cond;
     opc_result_MUX_uxn_opcodes_h_l2607_c7_a5d0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2607_c7_a5d0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2607_c7_a5d0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2607_c7_a5d0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2607_c7_a5d0_return_output := opc_result_MUX_uxn_opcodes_h_l2607_c7_a5d0_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l2606_c7_2198_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2607_c7_a5d0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2606_c7_2198] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2606_c7_2198_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2606_c7_2198_cond;
     opc_result_MUX_uxn_opcodes_h_l2606_c7_2198_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2606_c7_2198_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2606_c7_2198_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2606_c7_2198_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2606_c7_2198_return_output := opc_result_MUX_uxn_opcodes_h_l2606_c7_2198_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l2605_c7_5e80_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2606_c7_2198_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2605_c7_5e80] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2605_c7_5e80_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2605_c7_5e80_cond;
     opc_result_MUX_uxn_opcodes_h_l2605_c7_5e80_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2605_c7_5e80_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2605_c7_5e80_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2605_c7_5e80_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2605_c7_5e80_return_output := opc_result_MUX_uxn_opcodes_h_l2605_c7_5e80_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l2604_c7_1270_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2605_c7_5e80_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2604_c7_1270] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2604_c7_1270_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2604_c7_1270_cond;
     opc_result_MUX_uxn_opcodes_h_l2604_c7_1270_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2604_c7_1270_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2604_c7_1270_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2604_c7_1270_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2604_c7_1270_return_output := opc_result_MUX_uxn_opcodes_h_l2604_c7_1270_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l2603_c7_5e21_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2604_c7_1270_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2603_c7_5e21] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2603_c7_5e21_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2603_c7_5e21_cond;
     opc_result_MUX_uxn_opcodes_h_l2603_c7_5e21_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2603_c7_5e21_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2603_c7_5e21_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2603_c7_5e21_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2603_c7_5e21_return_output := opc_result_MUX_uxn_opcodes_h_l2603_c7_5e21_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l2602_c7_620a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2603_c7_5e21_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2602_c7_620a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2602_c7_620a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2602_c7_620a_cond;
     opc_result_MUX_uxn_opcodes_h_l2602_c7_620a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2602_c7_620a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2602_c7_620a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2602_c7_620a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2602_c7_620a_return_output := opc_result_MUX_uxn_opcodes_h_l2602_c7_620a_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l2601_c7_1efa_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2602_c7_620a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2601_c7_1efa] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2601_c7_1efa_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2601_c7_1efa_cond;
     opc_result_MUX_uxn_opcodes_h_l2601_c7_1efa_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2601_c7_1efa_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2601_c7_1efa_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2601_c7_1efa_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2601_c7_1efa_return_output := opc_result_MUX_uxn_opcodes_h_l2601_c7_1efa_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l2600_c7_683b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2601_c7_1efa_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2600_c7_683b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2600_c7_683b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2600_c7_683b_cond;
     opc_result_MUX_uxn_opcodes_h_l2600_c7_683b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2600_c7_683b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2600_c7_683b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2600_c7_683b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2600_c7_683b_return_output := opc_result_MUX_uxn_opcodes_h_l2600_c7_683b_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l2599_c7_1fbf_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2600_c7_683b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2599_c7_1fbf] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2599_c7_1fbf_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2599_c7_1fbf_cond;
     opc_result_MUX_uxn_opcodes_h_l2599_c7_1fbf_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2599_c7_1fbf_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2599_c7_1fbf_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2599_c7_1fbf_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2599_c7_1fbf_return_output := opc_result_MUX_uxn_opcodes_h_l2599_c7_1fbf_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l2598_c7_f595_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2599_c7_1fbf_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2598_c7_f595] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2598_c7_f595_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2598_c7_f595_cond;
     opc_result_MUX_uxn_opcodes_h_l2598_c7_f595_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2598_c7_f595_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2598_c7_f595_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2598_c7_f595_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2598_c7_f595_return_output := opc_result_MUX_uxn_opcodes_h_l2598_c7_f595_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l2597_c7_c0ec_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2598_c7_f595_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2597_c7_c0ec] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2597_c7_c0ec_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2597_c7_c0ec_cond;
     opc_result_MUX_uxn_opcodes_h_l2597_c7_c0ec_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2597_c7_c0ec_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2597_c7_c0ec_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2597_c7_c0ec_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2597_c7_c0ec_return_output := opc_result_MUX_uxn_opcodes_h_l2597_c7_c0ec_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l2596_c7_2426_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2597_c7_c0ec_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2596_c7_2426] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2596_c7_2426_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2596_c7_2426_cond;
     opc_result_MUX_uxn_opcodes_h_l2596_c7_2426_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2596_c7_2426_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2596_c7_2426_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2596_c7_2426_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2596_c7_2426_return_output := opc_result_MUX_uxn_opcodes_h_l2596_c7_2426_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l2595_c7_b70d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2596_c7_2426_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2595_c7_b70d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2595_c7_b70d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2595_c7_b70d_cond;
     opc_result_MUX_uxn_opcodes_h_l2595_c7_b70d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2595_c7_b70d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2595_c7_b70d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2595_c7_b70d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2595_c7_b70d_return_output := opc_result_MUX_uxn_opcodes_h_l2595_c7_b70d_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l2594_c7_ea71_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2595_c7_b70d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2594_c7_ea71] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2594_c7_ea71_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2594_c7_ea71_cond;
     opc_result_MUX_uxn_opcodes_h_l2594_c7_ea71_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2594_c7_ea71_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2594_c7_ea71_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2594_c7_ea71_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2594_c7_ea71_return_output := opc_result_MUX_uxn_opcodes_h_l2594_c7_ea71_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l2593_c7_498d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2594_c7_ea71_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2593_c7_498d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2593_c7_498d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2593_c7_498d_cond;
     opc_result_MUX_uxn_opcodes_h_l2593_c7_498d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2593_c7_498d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2593_c7_498d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2593_c7_498d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2593_c7_498d_return_output := opc_result_MUX_uxn_opcodes_h_l2593_c7_498d_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l2592_c7_9ad0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2593_c7_498d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2592_c7_9ad0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2592_c7_9ad0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2592_c7_9ad0_cond;
     opc_result_MUX_uxn_opcodes_h_l2592_c7_9ad0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2592_c7_9ad0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2592_c7_9ad0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2592_c7_9ad0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2592_c7_9ad0_return_output := opc_result_MUX_uxn_opcodes_h_l2592_c7_9ad0_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l2591_c7_7683_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2592_c7_9ad0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2591_c7_7683] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2591_c7_7683_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2591_c7_7683_cond;
     opc_result_MUX_uxn_opcodes_h_l2591_c7_7683_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2591_c7_7683_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2591_c7_7683_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2591_c7_7683_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2591_c7_7683_return_output := opc_result_MUX_uxn_opcodes_h_l2591_c7_7683_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l2590_c7_157b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2591_c7_7683_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2590_c7_157b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2590_c7_157b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2590_c7_157b_cond;
     opc_result_MUX_uxn_opcodes_h_l2590_c7_157b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2590_c7_157b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2590_c7_157b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2590_c7_157b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2590_c7_157b_return_output := opc_result_MUX_uxn_opcodes_h_l2590_c7_157b_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l2589_c7_5280_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2590_c7_157b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2589_c7_5280] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2589_c7_5280_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2589_c7_5280_cond;
     opc_result_MUX_uxn_opcodes_h_l2589_c7_5280_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2589_c7_5280_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2589_c7_5280_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2589_c7_5280_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2589_c7_5280_return_output := opc_result_MUX_uxn_opcodes_h_l2589_c7_5280_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l2588_c7_474f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2589_c7_5280_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2588_c7_474f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2588_c7_474f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2588_c7_474f_cond;
     opc_result_MUX_uxn_opcodes_h_l2588_c7_474f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2588_c7_474f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2588_c7_474f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2588_c7_474f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2588_c7_474f_return_output := opc_result_MUX_uxn_opcodes_h_l2588_c7_474f_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l2587_c7_9db0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2588_c7_474f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2587_c7_9db0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2587_c7_9db0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2587_c7_9db0_cond;
     opc_result_MUX_uxn_opcodes_h_l2587_c7_9db0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2587_c7_9db0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2587_c7_9db0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2587_c7_9db0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2587_c7_9db0_return_output := opc_result_MUX_uxn_opcodes_h_l2587_c7_9db0_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l2586_c7_205c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2587_c7_9db0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2586_c7_205c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2586_c7_205c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2586_c7_205c_cond;
     opc_result_MUX_uxn_opcodes_h_l2586_c7_205c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2586_c7_205c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2586_c7_205c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2586_c7_205c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2586_c7_205c_return_output := opc_result_MUX_uxn_opcodes_h_l2586_c7_205c_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l2585_c7_955d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2586_c7_205c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2585_c7_955d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2585_c7_955d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2585_c7_955d_cond;
     opc_result_MUX_uxn_opcodes_h_l2585_c7_955d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2585_c7_955d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2585_c7_955d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2585_c7_955d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2585_c7_955d_return_output := opc_result_MUX_uxn_opcodes_h_l2585_c7_955d_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l2584_c7_ff57_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2585_c7_955d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2584_c7_ff57] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2584_c7_ff57_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2584_c7_ff57_cond;
     opc_result_MUX_uxn_opcodes_h_l2584_c7_ff57_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2584_c7_ff57_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2584_c7_ff57_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2584_c7_ff57_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2584_c7_ff57_return_output := opc_result_MUX_uxn_opcodes_h_l2584_c7_ff57_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l2583_c7_43f0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2584_c7_ff57_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2583_c7_43f0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2583_c7_43f0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2583_c7_43f0_cond;
     opc_result_MUX_uxn_opcodes_h_l2583_c7_43f0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2583_c7_43f0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2583_c7_43f0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2583_c7_43f0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2583_c7_43f0_return_output := opc_result_MUX_uxn_opcodes_h_l2583_c7_43f0_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l2582_c7_8b31_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2583_c7_43f0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2582_c7_8b31] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2582_c7_8b31_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2582_c7_8b31_cond;
     opc_result_MUX_uxn_opcodes_h_l2582_c7_8b31_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2582_c7_8b31_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2582_c7_8b31_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2582_c7_8b31_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2582_c7_8b31_return_output := opc_result_MUX_uxn_opcodes_h_l2582_c7_8b31_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l2581_c7_f736_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2582_c7_8b31_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2581_c7_f736] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2581_c7_f736_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2581_c7_f736_cond;
     opc_result_MUX_uxn_opcodes_h_l2581_c7_f736_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2581_c7_f736_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2581_c7_f736_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2581_c7_f736_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2581_c7_f736_return_output := opc_result_MUX_uxn_opcodes_h_l2581_c7_f736_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l2580_c7_3d61_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2581_c7_f736_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2580_c7_3d61] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2580_c7_3d61_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2580_c7_3d61_cond;
     opc_result_MUX_uxn_opcodes_h_l2580_c7_3d61_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2580_c7_3d61_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2580_c7_3d61_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2580_c7_3d61_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2580_c7_3d61_return_output := opc_result_MUX_uxn_opcodes_h_l2580_c7_3d61_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l2579_c7_8c50_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2580_c7_3d61_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2579_c7_8c50] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2579_c7_8c50_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2579_c7_8c50_cond;
     opc_result_MUX_uxn_opcodes_h_l2579_c7_8c50_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2579_c7_8c50_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2579_c7_8c50_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2579_c7_8c50_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2579_c7_8c50_return_output := opc_result_MUX_uxn_opcodes_h_l2579_c7_8c50_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l2578_c7_c0d8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2579_c7_8c50_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2578_c7_c0d8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2578_c7_c0d8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2578_c7_c0d8_cond;
     opc_result_MUX_uxn_opcodes_h_l2578_c7_c0d8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2578_c7_c0d8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2578_c7_c0d8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2578_c7_c0d8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2578_c7_c0d8_return_output := opc_result_MUX_uxn_opcodes_h_l2578_c7_c0d8_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l2577_c7_af91_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2578_c7_c0d8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2577_c7_af91] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2577_c7_af91_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2577_c7_af91_cond;
     opc_result_MUX_uxn_opcodes_h_l2577_c7_af91_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2577_c7_af91_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2577_c7_af91_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2577_c7_af91_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2577_c7_af91_return_output := opc_result_MUX_uxn_opcodes_h_l2577_c7_af91_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l2576_c7_dc9e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2577_c7_af91_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2576_c7_dc9e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2576_c7_dc9e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2576_c7_dc9e_cond;
     opc_result_MUX_uxn_opcodes_h_l2576_c7_dc9e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2576_c7_dc9e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2576_c7_dc9e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2576_c7_dc9e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2576_c7_dc9e_return_output := opc_result_MUX_uxn_opcodes_h_l2576_c7_dc9e_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l2575_c7_ee9c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2576_c7_dc9e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2575_c7_ee9c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2575_c7_ee9c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2575_c7_ee9c_cond;
     opc_result_MUX_uxn_opcodes_h_l2575_c7_ee9c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2575_c7_ee9c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2575_c7_ee9c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2575_c7_ee9c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2575_c7_ee9c_return_output := opc_result_MUX_uxn_opcodes_h_l2575_c7_ee9c_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l2574_c7_a82c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2575_c7_ee9c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2574_c7_a82c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2574_c7_a82c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2574_c7_a82c_cond;
     opc_result_MUX_uxn_opcodes_h_l2574_c7_a82c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2574_c7_a82c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2574_c7_a82c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2574_c7_a82c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2574_c7_a82c_return_output := opc_result_MUX_uxn_opcodes_h_l2574_c7_a82c_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l2573_c7_2c4c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2574_c7_a82c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2573_c7_2c4c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2573_c7_2c4c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2573_c7_2c4c_cond;
     opc_result_MUX_uxn_opcodes_h_l2573_c7_2c4c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2573_c7_2c4c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2573_c7_2c4c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2573_c7_2c4c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2573_c7_2c4c_return_output := opc_result_MUX_uxn_opcodes_h_l2573_c7_2c4c_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l2572_c7_2fe5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2573_c7_2c4c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2572_c7_2fe5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2572_c7_2fe5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2572_c7_2fe5_cond;
     opc_result_MUX_uxn_opcodes_h_l2572_c7_2fe5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2572_c7_2fe5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2572_c7_2fe5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2572_c7_2fe5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2572_c7_2fe5_return_output := opc_result_MUX_uxn_opcodes_h_l2572_c7_2fe5_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l2571_c7_653e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2572_c7_2fe5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2571_c7_653e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2571_c7_653e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2571_c7_653e_cond;
     opc_result_MUX_uxn_opcodes_h_l2571_c7_653e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2571_c7_653e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2571_c7_653e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2571_c7_653e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2571_c7_653e_return_output := opc_result_MUX_uxn_opcodes_h_l2571_c7_653e_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l2570_c7_4440_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2571_c7_653e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2570_c7_4440] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2570_c7_4440_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2570_c7_4440_cond;
     opc_result_MUX_uxn_opcodes_h_l2570_c7_4440_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2570_c7_4440_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2570_c7_4440_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2570_c7_4440_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2570_c7_4440_return_output := opc_result_MUX_uxn_opcodes_h_l2570_c7_4440_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l2569_c7_f572_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2570_c7_4440_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2569_c7_f572] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2569_c7_f572_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2569_c7_f572_cond;
     opc_result_MUX_uxn_opcodes_h_l2569_c7_f572_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2569_c7_f572_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2569_c7_f572_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2569_c7_f572_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2569_c7_f572_return_output := opc_result_MUX_uxn_opcodes_h_l2569_c7_f572_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l2568_c7_a31a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2569_c7_f572_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2568_c7_a31a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2568_c7_a31a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2568_c7_a31a_cond;
     opc_result_MUX_uxn_opcodes_h_l2568_c7_a31a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2568_c7_a31a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2568_c7_a31a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2568_c7_a31a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2568_c7_a31a_return_output := opc_result_MUX_uxn_opcodes_h_l2568_c7_a31a_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l2567_c7_7f81_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2568_c7_a31a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2567_c7_7f81] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2567_c7_7f81_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2567_c7_7f81_cond;
     opc_result_MUX_uxn_opcodes_h_l2567_c7_7f81_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2567_c7_7f81_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2567_c7_7f81_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2567_c7_7f81_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2567_c7_7f81_return_output := opc_result_MUX_uxn_opcodes_h_l2567_c7_7f81_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l2566_c7_b73a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2567_c7_7f81_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2566_c7_b73a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2566_c7_b73a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2566_c7_b73a_cond;
     opc_result_MUX_uxn_opcodes_h_l2566_c7_b73a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2566_c7_b73a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2566_c7_b73a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2566_c7_b73a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2566_c7_b73a_return_output := opc_result_MUX_uxn_opcodes_h_l2566_c7_b73a_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l2565_c7_23c6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2566_c7_b73a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2565_c7_23c6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2565_c7_23c6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2565_c7_23c6_cond;
     opc_result_MUX_uxn_opcodes_h_l2565_c7_23c6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2565_c7_23c6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2565_c7_23c6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2565_c7_23c6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2565_c7_23c6_return_output := opc_result_MUX_uxn_opcodes_h_l2565_c7_23c6_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l2564_c7_f981_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2565_c7_23c6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2564_c7_f981] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2564_c7_f981_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2564_c7_f981_cond;
     opc_result_MUX_uxn_opcodes_h_l2564_c7_f981_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2564_c7_f981_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2564_c7_f981_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2564_c7_f981_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2564_c7_f981_return_output := opc_result_MUX_uxn_opcodes_h_l2564_c7_f981_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l2563_c7_a38f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2564_c7_f981_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2563_c7_a38f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2563_c7_a38f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2563_c7_a38f_cond;
     opc_result_MUX_uxn_opcodes_h_l2563_c7_a38f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2563_c7_a38f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2563_c7_a38f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2563_c7_a38f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2563_c7_a38f_return_output := opc_result_MUX_uxn_opcodes_h_l2563_c7_a38f_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l2562_c7_2335_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2563_c7_a38f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2562_c7_2335] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2562_c7_2335_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2562_c7_2335_cond;
     opc_result_MUX_uxn_opcodes_h_l2562_c7_2335_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2562_c7_2335_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2562_c7_2335_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2562_c7_2335_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2562_c7_2335_return_output := opc_result_MUX_uxn_opcodes_h_l2562_c7_2335_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l2561_c7_19cc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2562_c7_2335_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2561_c7_19cc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2561_c7_19cc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2561_c7_19cc_cond;
     opc_result_MUX_uxn_opcodes_h_l2561_c7_19cc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2561_c7_19cc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2561_c7_19cc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2561_c7_19cc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2561_c7_19cc_return_output := opc_result_MUX_uxn_opcodes_h_l2561_c7_19cc_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l2560_c7_cf3a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2561_c7_19cc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2560_c7_cf3a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2560_c7_cf3a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2560_c7_cf3a_cond;
     opc_result_MUX_uxn_opcodes_h_l2560_c7_cf3a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2560_c7_cf3a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2560_c7_cf3a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2560_c7_cf3a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2560_c7_cf3a_return_output := opc_result_MUX_uxn_opcodes_h_l2560_c7_cf3a_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l2559_c7_0b1d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2560_c7_cf3a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2559_c7_0b1d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2559_c7_0b1d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2559_c7_0b1d_cond;
     opc_result_MUX_uxn_opcodes_h_l2559_c7_0b1d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2559_c7_0b1d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2559_c7_0b1d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2559_c7_0b1d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2559_c7_0b1d_return_output := opc_result_MUX_uxn_opcodes_h_l2559_c7_0b1d_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l2558_c7_df66_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2559_c7_0b1d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2558_c7_df66] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2558_c7_df66_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2558_c7_df66_cond;
     opc_result_MUX_uxn_opcodes_h_l2558_c7_df66_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2558_c7_df66_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2558_c7_df66_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2558_c7_df66_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2558_c7_df66_return_output := opc_result_MUX_uxn_opcodes_h_l2558_c7_df66_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l2557_c7_148a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2558_c7_df66_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2557_c7_148a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2557_c7_148a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2557_c7_148a_cond;
     opc_result_MUX_uxn_opcodes_h_l2557_c7_148a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2557_c7_148a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2557_c7_148a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2557_c7_148a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2557_c7_148a_return_output := opc_result_MUX_uxn_opcodes_h_l2557_c7_148a_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l2556_c7_f7cf_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2557_c7_148a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2556_c7_f7cf] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2556_c7_f7cf_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2556_c7_f7cf_cond;
     opc_result_MUX_uxn_opcodes_h_l2556_c7_f7cf_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2556_c7_f7cf_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2556_c7_f7cf_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2556_c7_f7cf_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2556_c7_f7cf_return_output := opc_result_MUX_uxn_opcodes_h_l2556_c7_f7cf_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l2555_c7_d61b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2556_c7_f7cf_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2555_c7_d61b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2555_c7_d61b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2555_c7_d61b_cond;
     opc_result_MUX_uxn_opcodes_h_l2555_c7_d61b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2555_c7_d61b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2555_c7_d61b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2555_c7_d61b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2555_c7_d61b_return_output := opc_result_MUX_uxn_opcodes_h_l2555_c7_d61b_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l2554_c7_ba37_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2555_c7_d61b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2554_c7_ba37] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2554_c7_ba37_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2554_c7_ba37_cond;
     opc_result_MUX_uxn_opcodes_h_l2554_c7_ba37_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2554_c7_ba37_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2554_c7_ba37_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2554_c7_ba37_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2554_c7_ba37_return_output := opc_result_MUX_uxn_opcodes_h_l2554_c7_ba37_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l2553_c7_f031_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2554_c7_ba37_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2553_c7_f031] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2553_c7_f031_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2553_c7_f031_cond;
     opc_result_MUX_uxn_opcodes_h_l2553_c7_f031_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2553_c7_f031_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2553_c7_f031_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2553_c7_f031_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2553_c7_f031_return_output := opc_result_MUX_uxn_opcodes_h_l2553_c7_f031_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l2552_c7_2629_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2553_c7_f031_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2552_c7_2629] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2552_c7_2629_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2552_c7_2629_cond;
     opc_result_MUX_uxn_opcodes_h_l2552_c7_2629_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2552_c7_2629_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2552_c7_2629_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2552_c7_2629_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2552_c7_2629_return_output := opc_result_MUX_uxn_opcodes_h_l2552_c7_2629_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l2551_c7_0356_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2552_c7_2629_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2551_c7_0356] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2551_c7_0356_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2551_c7_0356_cond;
     opc_result_MUX_uxn_opcodes_h_l2551_c7_0356_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2551_c7_0356_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2551_c7_0356_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2551_c7_0356_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2551_c7_0356_return_output := opc_result_MUX_uxn_opcodes_h_l2551_c7_0356_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l2550_c7_3516_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2551_c7_0356_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2550_c7_3516] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2550_c7_3516_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2550_c7_3516_cond;
     opc_result_MUX_uxn_opcodes_h_l2550_c7_3516_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2550_c7_3516_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2550_c7_3516_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2550_c7_3516_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2550_c7_3516_return_output := opc_result_MUX_uxn_opcodes_h_l2550_c7_3516_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l2549_c7_a035_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2550_c7_3516_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2549_c7_a035] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2549_c7_a035_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2549_c7_a035_cond;
     opc_result_MUX_uxn_opcodes_h_l2549_c7_a035_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2549_c7_a035_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2549_c7_a035_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2549_c7_a035_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2549_c7_a035_return_output := opc_result_MUX_uxn_opcodes_h_l2549_c7_a035_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l2548_c7_afca_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2549_c7_a035_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2548_c7_afca] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2548_c7_afca_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2548_c7_afca_cond;
     opc_result_MUX_uxn_opcodes_h_l2548_c7_afca_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2548_c7_afca_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2548_c7_afca_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2548_c7_afca_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2548_c7_afca_return_output := opc_result_MUX_uxn_opcodes_h_l2548_c7_afca_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l2547_c7_a0c7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2548_c7_afca_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2547_c7_a0c7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2547_c7_a0c7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2547_c7_a0c7_cond;
     opc_result_MUX_uxn_opcodes_h_l2547_c7_a0c7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2547_c7_a0c7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2547_c7_a0c7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2547_c7_a0c7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2547_c7_a0c7_return_output := opc_result_MUX_uxn_opcodes_h_l2547_c7_a0c7_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l2546_c7_5548_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2547_c7_a0c7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2546_c7_5548] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2546_c7_5548_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2546_c7_5548_cond;
     opc_result_MUX_uxn_opcodes_h_l2546_c7_5548_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2546_c7_5548_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2546_c7_5548_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2546_c7_5548_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2546_c7_5548_return_output := opc_result_MUX_uxn_opcodes_h_l2546_c7_5548_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l2545_c7_da25_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2546_c7_5548_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2545_c7_da25] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2545_c7_da25_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2545_c7_da25_cond;
     opc_result_MUX_uxn_opcodes_h_l2545_c7_da25_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2545_c7_da25_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2545_c7_da25_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2545_c7_da25_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2545_c7_da25_return_output := opc_result_MUX_uxn_opcodes_h_l2545_c7_da25_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l2544_c7_db71_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2545_c7_da25_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2544_c7_db71] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2544_c7_db71_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2544_c7_db71_cond;
     opc_result_MUX_uxn_opcodes_h_l2544_c7_db71_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2544_c7_db71_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2544_c7_db71_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2544_c7_db71_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2544_c7_db71_return_output := opc_result_MUX_uxn_opcodes_h_l2544_c7_db71_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l2543_c7_4920_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2544_c7_db71_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2543_c7_4920] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2543_c7_4920_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2543_c7_4920_cond;
     opc_result_MUX_uxn_opcodes_h_l2543_c7_4920_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2543_c7_4920_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2543_c7_4920_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2543_c7_4920_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2543_c7_4920_return_output := opc_result_MUX_uxn_opcodes_h_l2543_c7_4920_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l2542_c7_a205_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2543_c7_4920_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2542_c7_a205] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2542_c7_a205_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2542_c7_a205_cond;
     opc_result_MUX_uxn_opcodes_h_l2542_c7_a205_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2542_c7_a205_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2542_c7_a205_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2542_c7_a205_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2542_c7_a205_return_output := opc_result_MUX_uxn_opcodes_h_l2542_c7_a205_return_output;

     -- Submodule level 145
     VAR_opc_result_MUX_uxn_opcodes_h_l2541_c7_115a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2542_c7_a205_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2541_c7_115a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2541_c7_115a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2541_c7_115a_cond;
     opc_result_MUX_uxn_opcodes_h_l2541_c7_115a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2541_c7_115a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2541_c7_115a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2541_c7_115a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2541_c7_115a_return_output := opc_result_MUX_uxn_opcodes_h_l2541_c7_115a_return_output;

     -- Submodule level 146
     VAR_opc_result_MUX_uxn_opcodes_h_l2540_c7_72b2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2541_c7_115a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2540_c7_72b2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2540_c7_72b2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2540_c7_72b2_cond;
     opc_result_MUX_uxn_opcodes_h_l2540_c7_72b2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2540_c7_72b2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2540_c7_72b2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2540_c7_72b2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2540_c7_72b2_return_output := opc_result_MUX_uxn_opcodes_h_l2540_c7_72b2_return_output;

     -- Submodule level 147
     VAR_opc_result_MUX_uxn_opcodes_h_l2539_c7_cbdf_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2540_c7_72b2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2539_c7_cbdf] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2539_c7_cbdf_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2539_c7_cbdf_cond;
     opc_result_MUX_uxn_opcodes_h_l2539_c7_cbdf_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2539_c7_cbdf_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2539_c7_cbdf_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2539_c7_cbdf_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2539_c7_cbdf_return_output := opc_result_MUX_uxn_opcodes_h_l2539_c7_cbdf_return_output;

     -- Submodule level 148
     VAR_opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2539_c7_cbdf_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2538_c2_5792] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_cond;
     opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_return_output := opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_return_output;

     -- Submodule level 149
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_return_output;
     -- CONST_REF_RD_uint24_t_opcode_result_t_vram_address_d41d[uxn_opcodes_h_l2641_c33_c56a] LATENCY=0
     VAR_CONST_REF_RD_uint24_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l2641_c33_c56a_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2636_c34_0d98] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2636_c34_0d98_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_return_output.is_pc_updated;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d[uxn_opcodes_h_l2633_c39_753c] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2633_c39_753c_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_return_output.device_ram_address;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2620_c68_cc26] LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2620_c68_cc26_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d[uxn_opcodes_h_l2640_c37_645d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2640_c37_645d_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_return_output.vram_write_layer;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2625_l2628_l2637_DUPLICATE_7a01 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2625_l2628_l2637_DUPLICATE_7a01_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2610_c17_bd8f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2610_c17_bd8f_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2638_c33_a0bc] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2638_c33_a0bc_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l2634_c40_aa38] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2634_c40_aa38_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2639_c34_c2ff] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2639_c34_c2ff_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l2612_c6_97e9] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2612_c6_97e9_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_return_output.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2628_l2642_DUPLICATE_c80f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2628_l2642_DUPLICATE_c80f_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_return_output.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2616_l2614_DUPLICATE_6dba LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2616_l2614_DUPLICATE_6dba_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l2627_l2625_l2626_l2628_l2624_DUPLICATE_b058 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l2627_l2625_l2626_l2628_l2624_DUPLICATE_b058_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_return_output.is_stack_operation_16bit;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2626_l2629_DUPLICATE_fa1c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2626_l2629_DUPLICATE_fa1c_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_return_output.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_16bit_d41d[uxn_opcodes_h_l2635_c40_5831] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_16bit_d41d_uxn_opcodes_h_l2635_c40_5831_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_return_output.is_device_ram_16bit;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l2643_c32_331d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2643_c32_331d_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2538_c2_5792_return_output.is_opc_done;

     -- Submodule level 150
     VAR_CONST_SR_8_uxn_opcodes_h_l2625_c52_6f82_x := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2625_l2628_l2637_DUPLICATE_7a01_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2612_c2_2c8f_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2612_c6_97e9_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2612_c2_2c8f_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2612_c6_97e9_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2610_c2_a2ec_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2610_c17_bd8f_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2626_c3_0a38_left := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l2627_l2625_l2626_l2628_l2624_DUPLICATE_b058_return_output;
     VAR_MUX_uxn_opcodes_h_l2624_c3_fe7e_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l2627_l2625_l2626_l2628_l2624_DUPLICATE_b058_return_output;
     VAR_MUX_uxn_opcodes_h_l2625_c3_259d_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l2627_l2625_l2626_l2628_l2624_DUPLICATE_b058_return_output;
     VAR_MUX_uxn_opcodes_h_l2627_c3_0d28_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l2627_l2625_l2626_l2628_l2624_DUPLICATE_b058_return_output;
     VAR_MUX_uxn_opcodes_h_l2628_c3_e0ed_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l2627_l2625_l2626_l2628_l2624_DUPLICATE_b058_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2626_c3_0a38_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2626_l2629_DUPLICATE_fa1c_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_write1_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2626_l2629_DUPLICATE_fa1c_return_output;
     VAR_MUX_uxn_opcodes_h_l2628_c3_e0ed_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2628_l2642_DUPLICATE_c80f_return_output;
     -- CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2614_l2616_DUPLICATE_4599 LATENCY=0
     VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2614_l2616_DUPLICATE_4599_return_output := CAST_TO_int8_t_int4_t(
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2616_l2614_DUPLICATE_6dba_return_output);

     -- CONST_SR_8[uxn_opcodes_h_l2625_c52_6f82] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2625_c52_6f82_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2625_c52_6f82_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2625_c52_6f82_return_output := CONST_SR_8_uxn_opcodes_h_l2625_c52_6f82_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l2610_c2_a2ec] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2610_c2_a2ec_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2610_c2_a2ec_left;
     BIN_OP_XOR_uxn_opcodes_h_l2610_c2_a2ec_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2610_c2_a2ec_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2610_c2_a2ec_return_output := BIN_OP_XOR_uxn_opcodes_h_l2610_c2_a2ec_return_output;

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9a3e_uxn_opcodes_h_l2515_l2645_DUPLICATE_c047 LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9a3e_uxn_opcodes_h_l2515_l2645_DUPLICATE_c047_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9a3e(
     VAR_is_wait_MUX_uxn_opcodes_h_l2538_c2_5792_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2633_c39_753c_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2634_c40_aa38_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_16bit_d41d_uxn_opcodes_h_l2635_c40_5831_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2636_c34_0d98_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2625_l2628_l2637_DUPLICATE_7a01_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2638_c33_a0bc_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2639_c34_c2ff_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2640_c37_645d_return_output,
     VAR_CONST_REF_RD_uint24_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l2641_c33_c56a_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2628_l2642_DUPLICATE_c80f_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2643_c32_331d_return_output);

     -- CAST_TO_uint9_t[uxn_opcodes_h_l2620_c58_e09e] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2620_c58_e09e_return_output := CAST_TO_uint9_t_uint4_t(
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2620_c68_cc26_return_output);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2628_c42_4c16] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2628_c42_4c16_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2625_l2628_l2637_DUPLICATE_7a01_return_output);

     -- BIN_OP_AND[uxn_opcodes_h_l2626_c3_0a38] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2626_c3_0a38_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2626_c3_0a38_left;
     BIN_OP_AND_uxn_opcodes_h_l2626_c3_0a38_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2626_c3_0a38_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2626_c3_0a38_return_output := BIN_OP_AND_uxn_opcodes_h_l2626_c3_0a38_return_output;

     -- Submodule level 151
     VAR_stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_write0_enable := VAR_BIN_OP_AND_uxn_opcodes_h_l2626_c3_0a38_return_output;
     VAR_MUX_uxn_opcodes_h_l2620_c29_2608_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2610_c2_a2ec_return_output;
     VAR_MUX_uxn_opcodes_h_l2621_c20_119f_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2610_c2_a2ec_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2613_c3_5b0b_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2610_c2_a2ec_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2613_c3_5b0b_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2610_c2_a2ec_return_output;
     REG_VAR_stack_index := VAR_BIN_OP_XOR_uxn_opcodes_h_l2610_c2_a2ec_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2614_c4_a0ac_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2614_l2616_DUPLICATE_4599_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2616_c4_9de2_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2614_l2616_DUPLICATE_4599_return_output;
     VAR_MUX_uxn_opcodes_h_l2628_c3_e0ed_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2628_c42_4c16_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2620_c19_f9e4_right := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2620_c58_e09e_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9a3e_uxn_opcodes_h_l2515_l2645_DUPLICATE_c047_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9a3e_uxn_opcodes_h_l2515_l2645_DUPLICATE_c047_return_output;
     -- MUX[uxn_opcodes_h_l2621_c20_119f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2621_c20_119f_cond <= VAR_MUX_uxn_opcodes_h_l2621_c20_119f_cond;
     MUX_uxn_opcodes_h_l2621_c20_119f_iftrue <= VAR_MUX_uxn_opcodes_h_l2621_c20_119f_iftrue;
     MUX_uxn_opcodes_h_l2621_c20_119f_iffalse <= VAR_MUX_uxn_opcodes_h_l2621_c20_119f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2621_c20_119f_return_output := MUX_uxn_opcodes_h_l2621_c20_119f_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2614_c4_a0ac] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2614_c4_a0ac_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2614_c4_a0ac_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2614_c4_a0ac_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2614_c4_a0ac_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2614_c4_a0ac_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2614_c4_a0ac_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2616_c4_9de2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2616_c4_9de2_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2616_c4_9de2_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2616_c4_9de2_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2616_c4_9de2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2616_c4_9de2_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2616_c4_9de2_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2625_c42_f0f8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2625_c42_f0f8_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2625_c52_6f82_return_output);

     -- MUX[uxn_opcodes_h_l2628_c3_e0ed] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2628_c3_e0ed_cond <= VAR_MUX_uxn_opcodes_h_l2628_c3_e0ed_cond;
     MUX_uxn_opcodes_h_l2628_c3_e0ed_iftrue <= VAR_MUX_uxn_opcodes_h_l2628_c3_e0ed_iftrue;
     MUX_uxn_opcodes_h_l2628_c3_e0ed_iffalse <= VAR_MUX_uxn_opcodes_h_l2628_c3_e0ed_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2628_c3_e0ed_return_output := MUX_uxn_opcodes_h_l2628_c3_e0ed_return_output;

     -- Submodule level 152
     VAR_sp1_uxn_opcodes_h_l2614_c4_643e := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2614_c4_a0ac_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l2616_c4_1e8b := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2616_c4_9de2_return_output)),8);
     VAR_MUX_uxn_opcodes_h_l2625_c3_259d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2625_c42_f0f8_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2621_c2_e601_right := VAR_MUX_uxn_opcodes_h_l2621_c20_119f_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_write1_value := VAR_MUX_uxn_opcodes_h_l2628_c3_e0ed_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2613_c3_5b0b_iffalse := VAR_sp0_uxn_opcodes_h_l2616_c4_1e8b;
     VAR_sp1_MUX_uxn_opcodes_h_l2613_c3_5b0b_iftrue := VAR_sp1_uxn_opcodes_h_l2614_c4_643e;
     -- sp0_MUX[uxn_opcodes_h_l2613_c3_5b0b] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2613_c3_5b0b_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2613_c3_5b0b_cond;
     sp0_MUX_uxn_opcodes_h_l2613_c3_5b0b_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2613_c3_5b0b_iftrue;
     sp0_MUX_uxn_opcodes_h_l2613_c3_5b0b_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2613_c3_5b0b_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2613_c3_5b0b_return_output := sp0_MUX_uxn_opcodes_h_l2613_c3_5b0b_return_output;

     -- MUX[uxn_opcodes_h_l2625_c3_259d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2625_c3_259d_cond <= VAR_MUX_uxn_opcodes_h_l2625_c3_259d_cond;
     MUX_uxn_opcodes_h_l2625_c3_259d_iftrue <= VAR_MUX_uxn_opcodes_h_l2625_c3_259d_iftrue;
     MUX_uxn_opcodes_h_l2625_c3_259d_iffalse <= VAR_MUX_uxn_opcodes_h_l2625_c3_259d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2625_c3_259d_return_output := MUX_uxn_opcodes_h_l2625_c3_259d_return_output;

     -- sp1_MUX[uxn_opcodes_h_l2613_c3_5b0b] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2613_c3_5b0b_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2613_c3_5b0b_cond;
     sp1_MUX_uxn_opcodes_h_l2613_c3_5b0b_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2613_c3_5b0b_iftrue;
     sp1_MUX_uxn_opcodes_h_l2613_c3_5b0b_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2613_c3_5b0b_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2613_c3_5b0b_return_output := sp1_MUX_uxn_opcodes_h_l2613_c3_5b0b_return_output;

     -- Submodule level 153
     VAR_stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_write0_value := VAR_MUX_uxn_opcodes_h_l2625_c3_259d_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2612_c2_2c8f_iftrue := VAR_sp0_MUX_uxn_opcodes_h_l2613_c3_5b0b_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2612_c2_2c8f_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2613_c3_5b0b_return_output;
     -- sp1_MUX[uxn_opcodes_h_l2612_c2_2c8f] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2612_c2_2c8f_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2612_c2_2c8f_cond;
     sp1_MUX_uxn_opcodes_h_l2612_c2_2c8f_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2612_c2_2c8f_iftrue;
     sp1_MUX_uxn_opcodes_h_l2612_c2_2c8f_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2612_c2_2c8f_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2612_c2_2c8f_return_output := sp1_MUX_uxn_opcodes_h_l2612_c2_2c8f_return_output;

     -- sp0_MUX[uxn_opcodes_h_l2612_c2_2c8f] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2612_c2_2c8f_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2612_c2_2c8f_cond;
     sp0_MUX_uxn_opcodes_h_l2612_c2_2c8f_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2612_c2_2c8f_iftrue;
     sp0_MUX_uxn_opcodes_h_l2612_c2_2c8f_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2612_c2_2c8f_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2612_c2_2c8f_return_output := sp0_MUX_uxn_opcodes_h_l2612_c2_2c8f_return_output;

     -- Submodule level 154
     VAR_MUX_uxn_opcodes_h_l2620_c29_2608_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l2612_c2_2c8f_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l2612_c2_2c8f_return_output;
     VAR_MUX_uxn_opcodes_h_l2620_c29_2608_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2612_c2_2c8f_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l2612_c2_2c8f_return_output;
     -- MUX[uxn_opcodes_h_l2620_c29_2608] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2620_c29_2608_cond <= VAR_MUX_uxn_opcodes_h_l2620_c29_2608_cond;
     MUX_uxn_opcodes_h_l2620_c29_2608_iftrue <= VAR_MUX_uxn_opcodes_h_l2620_c29_2608_iftrue;
     MUX_uxn_opcodes_h_l2620_c29_2608_iffalse <= VAR_MUX_uxn_opcodes_h_l2620_c29_2608_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2620_c29_2608_return_output := MUX_uxn_opcodes_h_l2620_c29_2608_return_output;

     -- Submodule level 155
     -- CAST_TO_uint9_t[uxn_opcodes_h_l2620_c19_3388] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2620_c19_3388_return_output := CAST_TO_uint9_t_uint8_t(
     VAR_MUX_uxn_opcodes_h_l2620_c29_2608_return_output);

     -- Submodule level 156
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2620_c19_f9e4_left := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2620_c19_3388_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l2620_c19_f9e4] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2620_c19_f9e4_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2620_c19_f9e4_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2620_c19_f9e4_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2620_c19_f9e4_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2620_c19_f9e4_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2620_c19_f9e4_return_output;

     -- Submodule level 157
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2621_c2_e601_left := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2620_c19_f9e4_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2621_c2_e601] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2621_c2_e601_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2621_c2_e601_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2621_c2_e601_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2621_c2_e601_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2621_c2_e601_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2621_c2_e601_return_output;

     -- Submodule level 158
     VAR_stack_address_uxn_opcodes_h_l2621_c2_3caa := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2621_c2_e601_return_output, 9);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2627_c42_5e8f_left := VAR_stack_address_uxn_opcodes_h_l2621_c2_3caa;
     VAR_MUX_uxn_opcodes_h_l2624_c3_fe7e_iftrue := VAR_stack_address_uxn_opcodes_h_l2621_c2_3caa;
     VAR_MUX_uxn_opcodes_h_l2627_c3_0d28_iffalse := VAR_stack_address_uxn_opcodes_h_l2621_c2_3caa;
     REG_VAR_stack_address := VAR_stack_address_uxn_opcodes_h_l2621_c2_3caa;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2627_c42_5e8f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2627_c42_5e8f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2627_c42_5e8f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2627_c42_5e8f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2627_c42_5e8f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2627_c42_5e8f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2627_c42_5e8f_return_output;

     -- MUX[uxn_opcodes_h_l2624_c3_fe7e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2624_c3_fe7e_cond <= VAR_MUX_uxn_opcodes_h_l2624_c3_fe7e_cond;
     MUX_uxn_opcodes_h_l2624_c3_fe7e_iftrue <= VAR_MUX_uxn_opcodes_h_l2624_c3_fe7e_iftrue;
     MUX_uxn_opcodes_h_l2624_c3_fe7e_iffalse <= VAR_MUX_uxn_opcodes_h_l2624_c3_fe7e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2624_c3_fe7e_return_output := MUX_uxn_opcodes_h_l2624_c3_fe7e_return_output;

     -- Submodule level 159
     VAR_MUX_uxn_opcodes_h_l2627_c3_0d28_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2627_c42_5e8f_return_output, 9);
     VAR_stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_address0 := VAR_MUX_uxn_opcodes_h_l2624_c3_fe7e_return_output;
     -- MUX[uxn_opcodes_h_l2627_c3_0d28] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2627_c3_0d28_cond <= VAR_MUX_uxn_opcodes_h_l2627_c3_0d28_cond;
     MUX_uxn_opcodes_h_l2627_c3_0d28_iftrue <= VAR_MUX_uxn_opcodes_h_l2627_c3_0d28_iftrue;
     MUX_uxn_opcodes_h_l2627_c3_0d28_iffalse <= VAR_MUX_uxn_opcodes_h_l2627_c3_0d28_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2627_c3_0d28_return_output := MUX_uxn_opcodes_h_l2627_c3_0d28_return_output;

     -- Submodule level 160
     VAR_stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_address1 := VAR_MUX_uxn_opcodes_h_l2627_c3_0d28_return_output;
     -- stack_ram_update[uxn_opcodes_h_l2623_c24_ac81] LATENCY=0
     -- Clock enable
     stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_CLOCK_ENABLE <= VAR_stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_CLOCK_ENABLE;
     -- Inputs
     stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_address0 <= VAR_stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_address0;
     stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_write0_value <= VAR_stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_write0_value;
     stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_write0_enable <= VAR_stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_write0_enable;
     stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_address1 <= VAR_stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_address1;
     stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_write1_value <= VAR_stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_write1_value;
     stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_write1_enable <= VAR_stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_write1_enable;
     -- Outputs
     VAR_stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_return_output := stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_return_output;

     -- Submodule level 161
     REG_VAR_previous_stack_read := VAR_stack_ram_update_uxn_opcodes_h_l2623_c24_ac81_return_output;
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
