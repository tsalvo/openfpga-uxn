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
-- Submodules: 380
entity eval_opcode_phased_0CLK_7feed348 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out eval_opcode_result_t);
end eval_opcode_phased_0CLK_7feed348;
architecture arch of eval_opcode_phased_0CLK_7feed348 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal sp0 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal sp1 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal opc : unsigned(11 downto 0) := to_unsigned(0, 12);
signal stack_index : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_wait : unsigned(0 downto 0) := to_unsigned(0, 1);
signal stack_address : unsigned(11 downto 0) := to_unsigned(0, 12);
signal stack_read_value : unsigned(7 downto 0) := to_unsigned(0, 8);
signal opc_result : opcode_result_t := (
is_pc_updated => to_unsigned(0, 1),
is_stack_index_flipped => to_unsigned(0, 1),
is_sp_shift => to_unsigned(0, 1),
sp_relative_shift => to_signed(0, 4),
is_stack_write => to_unsigned(0, 1),
stack_address_sp_offset => to_unsigned(0, 4),
is_ram_write => to_unsigned(0, 1),
is_device_ram_write => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
vram_address => to_unsigned(0, 32),
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
vram_address => to_unsigned(0, 32),
is_device_ram_write => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
u8_value => to_unsigned(0, 8),
u16_value => to_unsigned(0, 16),
is_opc_done => to_unsigned(0, 1))
;
signal REG_COMB_sp0 : unsigned(7 downto 0);
signal REG_COMB_sp1 : unsigned(7 downto 0);
signal REG_COMB_opc : unsigned(11 downto 0);
signal REG_COMB_stack_index : unsigned(0 downto 0);
signal REG_COMB_is_wait : unsigned(0 downto 0);
signal REG_COMB_stack_address : unsigned(11 downto 0);
signal REG_COMB_stack_read_value : unsigned(7 downto 0);
signal REG_COMB_opc_result : opcode_result_t;
signal REG_COMB_opc_eval_result : eval_opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_AND[uxn_opcodes_h_l2715_c10_1b5d]
signal BIN_OP_AND_uxn_opcodes_h_l2715_c10_1b5d_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2715_c10_1b5d_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2715_c10_1b5d_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2715_c10_e480]
signal BIN_OP_GT_uxn_opcodes_h_l2715_c10_e480_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2715_c10_e480_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2715_c10_e480_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2715_c41_fc87]
signal BIN_OP_AND_uxn_opcodes_h_l2715_c41_fc87_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2715_c41_fc87_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2715_c41_fc87_return_output : unsigned(7 downto 0);

-- CONST_SL_4[uxn_opcodes_h_l2715_c57_42cc]
signal CONST_SL_4_uxn_opcodes_h_l2715_c57_42cc_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_opcodes_h_l2715_c57_42cc_return_output : unsigned(11 downto 0);

-- MUX[uxn_opcodes_h_l2715_c10_9a20]
signal MUX_uxn_opcodes_h_l2715_c10_9a20_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2715_c10_9a20_iftrue : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l2715_c10_9a20_iffalse : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l2715_c10_9a20_return_output : unsigned(11 downto 0);

-- printf_uxn_opcodes_h_l2717_c2_8fa5[uxn_opcodes_h_l2717_c2_8fa5]
signal printf_uxn_opcodes_h_l2717_c2_8fa5_uxn_opcodes_h_l2717_c2_8fa5_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2717_c2_8fa5_uxn_opcodes_h_l2717_c2_8fa5_arg0 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l2717_c2_8fa5_uxn_opcodes_h_l2717_c2_8fa5_arg1 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l2717_c2_8fa5_uxn_opcodes_h_l2717_c2_8fa5_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2719_c6_9c85]
signal BIN_OP_EQ_uxn_opcodes_h_l2719_c6_9c85_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2719_c6_9c85_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2719_c6_9c85_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2719_c1_373a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_373a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_373a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_373a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_373a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2720_c7_e407]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_e407_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_e407_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_e407_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_e407_return_output : unsigned(0 downto 0);

-- is_wait_MUX[uxn_opcodes_h_l2719_c2_7623]
signal is_wait_MUX_uxn_opcodes_h_l2719_c2_7623_cond : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2719_c2_7623_iftrue : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2719_c2_7623_iffalse : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2719_c2_7623_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2719_c2_7623]
signal opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2719_c23_84f6[uxn_opcodes_h_l2719_c23_84f6]
signal printf_uxn_opcodes_h_l2719_c23_84f6_uxn_opcodes_h_l2719_c23_84f6_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2720_c11_00db]
signal BIN_OP_EQ_uxn_opcodes_h_l2720_c11_00db_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2720_c11_00db_right : unsigned(9 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2720_c11_00db_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2720_c1_a825]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_a825_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_a825_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_a825_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_a825_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2721_c7_ec20]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ec20_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ec20_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ec20_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ec20_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2720_c7_e407]
signal opc_result_MUX_uxn_opcodes_h_l2720_c7_e407_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2720_c7_e407_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2720_c7_e407_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2720_c7_e407_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l2720_c41_46ad]
signal jci_uxn_opcodes_h_l2720_c41_46ad_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l2720_c41_46ad_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2720_c41_46ad_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l2720_c41_46ad_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2720_c41_46ad_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2720_c41_46ad_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2721_c11_b889]
signal BIN_OP_EQ_uxn_opcodes_h_l2721_c11_b889_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2721_c11_b889_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2721_c11_b889_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2721_c1_ae96]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ae96_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ae96_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ae96_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ae96_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2722_c7_c4d4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_c4d4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_c4d4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_c4d4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_c4d4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2721_c7_ec20]
signal opc_result_MUX_uxn_opcodes_h_l2721_c7_ec20_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2721_c7_ec20_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2721_c7_ec20_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2721_c7_ec20_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l2721_c41_8067]
signal jmi_uxn_opcodes_h_l2721_c41_8067_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l2721_c41_8067_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2721_c41_8067_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l2721_c41_8067_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2721_c41_8067_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2722_c11_3037]
signal BIN_OP_EQ_uxn_opcodes_h_l2722_c11_3037_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2722_c11_3037_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2722_c11_3037_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2722_c1_d39b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_d39b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_d39b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_d39b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_d39b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2723_c7_00f0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_00f0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_00f0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_00f0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_00f0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2722_c7_c4d4]
signal opc_result_MUX_uxn_opcodes_h_l2722_c7_c4d4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2722_c7_c4d4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2722_c7_c4d4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2722_c7_c4d4_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l2722_c41_19e6]
signal jsi_uxn_opcodes_h_l2722_c41_19e6_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l2722_c41_19e6_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2722_c41_19e6_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l2722_c41_19e6_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2722_c41_19e6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2723_c11_199e]
signal BIN_OP_EQ_uxn_opcodes_h_l2723_c11_199e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2723_c11_199e_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2723_c11_199e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2723_c1_c6b9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_c6b9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_c6b9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_c6b9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_c6b9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2724_c7_a630]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_a630_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_a630_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_a630_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_a630_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2723_c7_00f0]
signal opc_result_MUX_uxn_opcodes_h_l2723_c7_00f0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2723_c7_00f0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2723_c7_00f0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2723_c7_00f0_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2723_c41_d996]
signal lit_uxn_opcodes_h_l2723_c41_d996_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2723_c41_d996_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2723_c41_d996_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2723_c41_d996_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2723_c41_d996_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2724_c11_44ba]
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_44ba_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_44ba_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_44ba_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2724_c1_2230]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_2230_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_2230_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_2230_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_2230_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2725_c7_7af2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_7af2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_7af2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_7af2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_7af2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2724_c7_a630]
signal opc_result_MUX_uxn_opcodes_h_l2724_c7_a630_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2724_c7_a630_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2724_c7_a630_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2724_c7_a630_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2724_c41_0f38]
signal lit2_uxn_opcodes_h_l2724_c41_0f38_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2724_c41_0f38_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2724_c41_0f38_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2724_c41_0f38_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2724_c41_0f38_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2725_c11_a14c]
signal BIN_OP_EQ_uxn_opcodes_h_l2725_c11_a14c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2725_c11_a14c_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2725_c11_a14c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2725_c1_03ea]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_03ea_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_03ea_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_03ea_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_03ea_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2726_c7_3a5d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_3a5d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_3a5d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_3a5d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_3a5d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2725_c7_7af2]
signal opc_result_MUX_uxn_opcodes_h_l2725_c7_7af2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2725_c7_7af2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2725_c7_7af2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2725_c7_7af2_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2725_c41_c710]
signal lit_uxn_opcodes_h_l2725_c41_c710_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2725_c41_c710_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2725_c41_c710_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2725_c41_c710_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2725_c41_c710_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2726_c11_c5e6]
signal BIN_OP_EQ_uxn_opcodes_h_l2726_c11_c5e6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2726_c11_c5e6_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2726_c11_c5e6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2726_c1_ee2d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_ee2d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_ee2d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_ee2d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_ee2d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2727_c7_dbd2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_dbd2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_dbd2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_dbd2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_dbd2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2726_c7_3a5d]
signal opc_result_MUX_uxn_opcodes_h_l2726_c7_3a5d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2726_c7_3a5d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2726_c7_3a5d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2726_c7_3a5d_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2726_c41_e80e]
signal lit2_uxn_opcodes_h_l2726_c41_e80e_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2726_c41_e80e_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2726_c41_e80e_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2726_c41_e80e_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2726_c41_e80e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2727_c11_5ef0]
signal BIN_OP_EQ_uxn_opcodes_h_l2727_c11_5ef0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2727_c11_5ef0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2727_c11_5ef0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2727_c1_889b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_889b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_889b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_889b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_889b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2728_c7_a2ba]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_a2ba_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_a2ba_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_a2ba_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_a2ba_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2727_c7_dbd2]
signal opc_result_MUX_uxn_opcodes_h_l2727_c7_dbd2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2727_c7_dbd2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2727_c7_dbd2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2727_c7_dbd2_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l2727_c41_8d51]
signal inc_uxn_opcodes_h_l2727_c41_8d51_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l2727_c41_8d51_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2727_c41_8d51_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2727_c41_8d51_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2727_c41_8d51_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2728_c11_0ad2]
signal BIN_OP_EQ_uxn_opcodes_h_l2728_c11_0ad2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2728_c11_0ad2_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2728_c11_0ad2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2728_c1_0f21]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_0f21_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_0f21_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_0f21_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_0f21_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2729_c7_988f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_988f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_988f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_988f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_988f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2728_c7_a2ba]
signal opc_result_MUX_uxn_opcodes_h_l2728_c7_a2ba_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2728_c7_a2ba_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2728_c7_a2ba_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2728_c7_a2ba_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l2728_c41_e26b]
signal inc2_uxn_opcodes_h_l2728_c41_e26b_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l2728_c41_e26b_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2728_c41_e26b_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2728_c41_e26b_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2728_c41_e26b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2729_c11_5533]
signal BIN_OP_EQ_uxn_opcodes_h_l2729_c11_5533_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2729_c11_5533_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2729_c11_5533_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2729_c1_f84d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_f84d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_f84d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_f84d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_f84d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2730_c7_7400]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7400_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7400_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7400_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7400_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2729_c7_988f]
signal opc_result_MUX_uxn_opcodes_h_l2729_c7_988f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2729_c7_988f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2729_c7_988f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2729_c7_988f_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l2729_c41_d160]
signal pop_uxn_opcodes_h_l2729_c41_d160_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l2729_c41_d160_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2729_c41_d160_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2729_c41_d160_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2730_c11_4aae]
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4aae_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4aae_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4aae_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2730_c1_509f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_509f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_509f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_509f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_509f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2731_c7_3b86]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_3b86_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_3b86_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_3b86_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_3b86_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2730_c7_7400]
signal opc_result_MUX_uxn_opcodes_h_l2730_c7_7400_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2730_c7_7400_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2730_c7_7400_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2730_c7_7400_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l2730_c41_6214]
signal pop2_uxn_opcodes_h_l2730_c41_6214_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l2730_c41_6214_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2730_c41_6214_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2730_c41_6214_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2731_c11_6de8]
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_6de8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_6de8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_6de8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2731_c1_9bb2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_9bb2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_9bb2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_9bb2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_9bb2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2732_c7_f6bb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_f6bb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_f6bb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_f6bb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_f6bb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2731_c7_3b86]
signal opc_result_MUX_uxn_opcodes_h_l2731_c7_3b86_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2731_c7_3b86_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2731_c7_3b86_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2731_c7_3b86_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l2731_c41_eb29]
signal nip_uxn_opcodes_h_l2731_c41_eb29_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l2731_c41_eb29_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2731_c41_eb29_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2731_c41_eb29_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2731_c41_eb29_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2732_c11_fafe]
signal BIN_OP_EQ_uxn_opcodes_h_l2732_c11_fafe_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2732_c11_fafe_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2732_c11_fafe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2732_c1_c424]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_c424_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_c424_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_c424_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_c424_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2733_c7_5637]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_5637_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_5637_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_5637_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_5637_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2732_c7_f6bb]
signal opc_result_MUX_uxn_opcodes_h_l2732_c7_f6bb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2732_c7_f6bb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2732_c7_f6bb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2732_c7_f6bb_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l2732_c41_f77a]
signal nip2_uxn_opcodes_h_l2732_c41_f77a_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l2732_c41_f77a_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2732_c41_f77a_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2732_c41_f77a_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2732_c41_f77a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2733_c11_e808]
signal BIN_OP_EQ_uxn_opcodes_h_l2733_c11_e808_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2733_c11_e808_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2733_c11_e808_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2733_c1_bc11]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_bc11_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_bc11_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_bc11_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_bc11_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2734_c7_9913]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_9913_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_9913_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_9913_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_9913_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2733_c7_5637]
signal opc_result_MUX_uxn_opcodes_h_l2733_c7_5637_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2733_c7_5637_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2733_c7_5637_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2733_c7_5637_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l2733_c41_8d73]
signal swp_uxn_opcodes_h_l2733_c41_8d73_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l2733_c41_8d73_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2733_c41_8d73_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2733_c41_8d73_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2733_c41_8d73_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_ac0e]
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ac0e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ac0e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ac0e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2734_c1_4713]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_4713_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_4713_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_4713_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_4713_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2735_c7_9222]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_9222_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_9222_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_9222_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_9222_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2734_c7_9913]
signal opc_result_MUX_uxn_opcodes_h_l2734_c7_9913_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2734_c7_9913_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2734_c7_9913_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2734_c7_9913_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l2734_c41_d5f8]
signal swp2_uxn_opcodes_h_l2734_c41_d5f8_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l2734_c41_d5f8_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2734_c41_d5f8_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2734_c41_d5f8_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2734_c41_d5f8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2735_c11_a0fe]
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_a0fe_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_a0fe_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_a0fe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2735_c1_be25]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_be25_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_be25_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_be25_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_be25_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2736_c7_c9d1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_c9d1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_c9d1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_c9d1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_c9d1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2735_c7_9222]
signal opc_result_MUX_uxn_opcodes_h_l2735_c7_9222_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2735_c7_9222_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2735_c7_9222_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2735_c7_9222_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l2735_c41_e9ea]
signal rot_uxn_opcodes_h_l2735_c41_e9ea_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l2735_c41_e9ea_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2735_c41_e9ea_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2735_c41_e9ea_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2735_c41_e9ea_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2736_c11_8aa1]
signal BIN_OP_EQ_uxn_opcodes_h_l2736_c11_8aa1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2736_c11_8aa1_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2736_c11_8aa1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2736_c1_ef8c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_ef8c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_ef8c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_ef8c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_ef8c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2737_c7_5747]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5747_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5747_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5747_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5747_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2736_c7_c9d1]
signal opc_result_MUX_uxn_opcodes_h_l2736_c7_c9d1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2736_c7_c9d1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2736_c7_c9d1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2736_c7_c9d1_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l2736_c41_5e8a]
signal rot2_uxn_opcodes_h_l2736_c41_5e8a_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l2736_c41_5e8a_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2736_c41_5e8a_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2736_c41_5e8a_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2736_c41_5e8a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2737_c11_5f86]
signal BIN_OP_EQ_uxn_opcodes_h_l2737_c11_5f86_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2737_c11_5f86_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2737_c11_5f86_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2737_c1_55f3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_55f3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_55f3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_55f3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_55f3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2738_c7_de36]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_de36_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_de36_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_de36_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_de36_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2737_c7_5747]
signal opc_result_MUX_uxn_opcodes_h_l2737_c7_5747_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2737_c7_5747_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2737_c7_5747_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2737_c7_5747_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l2737_c41_3be7]
signal dup_uxn_opcodes_h_l2737_c41_3be7_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l2737_c41_3be7_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2737_c41_3be7_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2737_c41_3be7_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2737_c41_3be7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2738_c11_7149]
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7149_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7149_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7149_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2738_c1_2997]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_2997_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_2997_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_2997_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_2997_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2739_c7_5f2f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_5f2f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_5f2f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_5f2f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_5f2f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2738_c7_de36]
signal opc_result_MUX_uxn_opcodes_h_l2738_c7_de36_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2738_c7_de36_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2738_c7_de36_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2738_c7_de36_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l2738_c41_aabb]
signal dup2_uxn_opcodes_h_l2738_c41_aabb_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l2738_c41_aabb_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2738_c41_aabb_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2738_c41_aabb_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2738_c41_aabb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2739_c11_22ca]
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_22ca_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_22ca_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_22ca_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2739_c1_4560]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_4560_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_4560_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_4560_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_4560_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2740_c7_019a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_019a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_019a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_019a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_019a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2739_c7_5f2f]
signal opc_result_MUX_uxn_opcodes_h_l2739_c7_5f2f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2739_c7_5f2f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2739_c7_5f2f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2739_c7_5f2f_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l2739_c41_d2de]
signal ovr_uxn_opcodes_h_l2739_c41_d2de_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l2739_c41_d2de_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2739_c41_d2de_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2739_c41_d2de_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2739_c41_d2de_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2740_c11_e27e]
signal BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e27e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e27e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e27e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2740_c1_105b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_105b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_105b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_105b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_105b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2741_c7_7319]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_7319_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_7319_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_7319_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_7319_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2740_c7_019a]
signal opc_result_MUX_uxn_opcodes_h_l2740_c7_019a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2740_c7_019a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2740_c7_019a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2740_c7_019a_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l2740_c41_b517]
signal ovr2_uxn_opcodes_h_l2740_c41_b517_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l2740_c41_b517_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2740_c41_b517_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2740_c41_b517_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2740_c41_b517_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2741_c11_7a1b]
signal BIN_OP_EQ_uxn_opcodes_h_l2741_c11_7a1b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2741_c11_7a1b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2741_c11_7a1b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2741_c1_d3e4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_d3e4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_d3e4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_d3e4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_d3e4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2742_c7_5e67]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5e67_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5e67_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5e67_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5e67_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2741_c7_7319]
signal opc_result_MUX_uxn_opcodes_h_l2741_c7_7319_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2741_c7_7319_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2741_c7_7319_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2741_c7_7319_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l2741_c41_d8da]
signal equ_uxn_opcodes_h_l2741_c41_d8da_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l2741_c41_d8da_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2741_c41_d8da_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2741_c41_d8da_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2741_c41_d8da_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2742_c11_6413]
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6413_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6413_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6413_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2742_c1_0c31]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_0c31_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_0c31_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_0c31_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_0c31_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2743_c7_e6ca]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_e6ca_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_e6ca_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_e6ca_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_e6ca_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2742_c7_5e67]
signal opc_result_MUX_uxn_opcodes_h_l2742_c7_5e67_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2742_c7_5e67_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2742_c7_5e67_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2742_c7_5e67_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l2742_c41_adc2]
signal equ2_uxn_opcodes_h_l2742_c41_adc2_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l2742_c41_adc2_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2742_c41_adc2_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2742_c41_adc2_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2742_c41_adc2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2743_c11_0609]
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_0609_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_0609_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_0609_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2743_c1_04c1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_04c1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_04c1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_04c1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_04c1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2744_c7_a164]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_a164_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_a164_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_a164_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_a164_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2743_c7_e6ca]
signal opc_result_MUX_uxn_opcodes_h_l2743_c7_e6ca_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2743_c7_e6ca_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2743_c7_e6ca_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2743_c7_e6ca_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l2743_c41_07e5]
signal neq_uxn_opcodes_h_l2743_c41_07e5_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l2743_c41_07e5_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2743_c41_07e5_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2743_c41_07e5_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2743_c41_07e5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2744_c11_a896]
signal BIN_OP_EQ_uxn_opcodes_h_l2744_c11_a896_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2744_c11_a896_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2744_c11_a896_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2744_c1_7d78]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_7d78_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_7d78_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_7d78_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_7d78_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2745_c7_b420]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_b420_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_b420_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_b420_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_b420_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2744_c7_a164]
signal opc_result_MUX_uxn_opcodes_h_l2744_c7_a164_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2744_c7_a164_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2744_c7_a164_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2744_c7_a164_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l2744_c41_585e]
signal neq2_uxn_opcodes_h_l2744_c41_585e_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l2744_c41_585e_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2744_c41_585e_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2744_c41_585e_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2744_c41_585e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2745_c11_1bb8]
signal BIN_OP_EQ_uxn_opcodes_h_l2745_c11_1bb8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2745_c11_1bb8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2745_c11_1bb8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2745_c1_5f12]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_5f12_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_5f12_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_5f12_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_5f12_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2746_c7_d2e2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_d2e2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_d2e2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_d2e2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_d2e2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2745_c7_b420]
signal opc_result_MUX_uxn_opcodes_h_l2745_c7_b420_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2745_c7_b420_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2745_c7_b420_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2745_c7_b420_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l2745_c41_19d9]
signal gth_uxn_opcodes_h_l2745_c41_19d9_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l2745_c41_19d9_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2745_c41_19d9_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2745_c41_19d9_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2745_c41_19d9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2746_c11_6138]
signal BIN_OP_EQ_uxn_opcodes_h_l2746_c11_6138_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2746_c11_6138_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2746_c11_6138_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2746_c1_f622]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_f622_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_f622_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_f622_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_f622_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2747_c7_f293]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_f293_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_f293_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_f293_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_f293_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2746_c7_d2e2]
signal opc_result_MUX_uxn_opcodes_h_l2746_c7_d2e2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2746_c7_d2e2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2746_c7_d2e2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2746_c7_d2e2_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l2746_c41_ee3e]
signal gth2_uxn_opcodes_h_l2746_c41_ee3e_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l2746_c41_ee3e_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2746_c41_ee3e_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2746_c41_ee3e_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2746_c41_ee3e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2747_c11_514e]
signal BIN_OP_EQ_uxn_opcodes_h_l2747_c11_514e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2747_c11_514e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2747_c11_514e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2747_c1_14a3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_14a3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_14a3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_14a3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_14a3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2748_c7_d33a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_d33a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_d33a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_d33a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_d33a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2747_c7_f293]
signal opc_result_MUX_uxn_opcodes_h_l2747_c7_f293_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2747_c7_f293_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2747_c7_f293_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2747_c7_f293_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l2747_c41_6584]
signal lth_uxn_opcodes_h_l2747_c41_6584_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l2747_c41_6584_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2747_c41_6584_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2747_c41_6584_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2747_c41_6584_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2748_c11_09e7]
signal BIN_OP_EQ_uxn_opcodes_h_l2748_c11_09e7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2748_c11_09e7_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2748_c11_09e7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2748_c1_73f9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_73f9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_73f9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_73f9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_73f9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2749_c7_6263]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_6263_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_6263_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_6263_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_6263_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2748_c7_d33a]
signal opc_result_MUX_uxn_opcodes_h_l2748_c7_d33a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2748_c7_d33a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2748_c7_d33a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2748_c7_d33a_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l2748_c41_01ea]
signal lth2_uxn_opcodes_h_l2748_c41_01ea_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l2748_c41_01ea_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2748_c41_01ea_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2748_c41_01ea_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2748_c41_01ea_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2749_c11_f60b]
signal BIN_OP_EQ_uxn_opcodes_h_l2749_c11_f60b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2749_c11_f60b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2749_c11_f60b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2749_c1_4674]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_4674_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_4674_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_4674_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_4674_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2750_c7_5aec]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_5aec_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_5aec_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_5aec_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_5aec_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2749_c7_6263]
signal opc_result_MUX_uxn_opcodes_h_l2749_c7_6263_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2749_c7_6263_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2749_c7_6263_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2749_c7_6263_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l2749_c41_e115]
signal jmp_uxn_opcodes_h_l2749_c41_e115_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l2749_c41_e115_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2749_c41_e115_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2749_c41_e115_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l2749_c41_e115_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2749_c41_e115_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2750_c11_2f39]
signal BIN_OP_EQ_uxn_opcodes_h_l2750_c11_2f39_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2750_c11_2f39_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2750_c11_2f39_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2750_c1_473e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_473e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_473e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_473e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_473e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2751_c7_bd9c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_bd9c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_bd9c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_bd9c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_bd9c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2750_c7_5aec]
signal opc_result_MUX_uxn_opcodes_h_l2750_c7_5aec_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2750_c7_5aec_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2750_c7_5aec_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2750_c7_5aec_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l2750_c41_dabe]
signal jmp2_uxn_opcodes_h_l2750_c41_dabe_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l2750_c41_dabe_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2750_c41_dabe_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2750_c41_dabe_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2750_c41_dabe_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2751_c11_a76c]
signal BIN_OP_EQ_uxn_opcodes_h_l2751_c11_a76c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2751_c11_a76c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2751_c11_a76c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2751_c1_d9d4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_d9d4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_d9d4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_d9d4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_d9d4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2752_c7_6f4f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_6f4f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_6f4f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_6f4f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_6f4f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2751_c7_bd9c]
signal opc_result_MUX_uxn_opcodes_h_l2751_c7_bd9c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2751_c7_bd9c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2751_c7_bd9c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2751_c7_bd9c_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l2751_c41_f92d]
signal jcn_uxn_opcodes_h_l2751_c41_f92d_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l2751_c41_f92d_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2751_c41_f92d_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2751_c41_f92d_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l2751_c41_f92d_previous_stack_read : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2751_c41_f92d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2752_c11_bf54]
signal BIN_OP_EQ_uxn_opcodes_h_l2752_c11_bf54_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2752_c11_bf54_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2752_c11_bf54_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2752_c1_dbbc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_dbbc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_dbbc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_dbbc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_dbbc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2753_c7_7348]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_7348_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_7348_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_7348_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_7348_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2752_c7_6f4f]
signal opc_result_MUX_uxn_opcodes_h_l2752_c7_6f4f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2752_c7_6f4f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2752_c7_6f4f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2752_c7_6f4f_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l2752_c41_f5ce]
signal jcn2_uxn_opcodes_h_l2752_c41_f5ce_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l2752_c41_f5ce_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2752_c41_f5ce_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2752_c41_f5ce_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2752_c41_f5ce_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2753_c11_78a8]
signal BIN_OP_EQ_uxn_opcodes_h_l2753_c11_78a8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2753_c11_78a8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2753_c11_78a8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2753_c1_ebac]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_ebac_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_ebac_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_ebac_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_ebac_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2754_c7_b6fe]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_b6fe_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_b6fe_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_b6fe_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_b6fe_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2753_c7_7348]
signal opc_result_MUX_uxn_opcodes_h_l2753_c7_7348_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2753_c7_7348_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2753_c7_7348_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2753_c7_7348_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l2753_c41_be6e]
signal jsr_uxn_opcodes_h_l2753_c41_be6e_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l2753_c41_be6e_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2753_c41_be6e_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2753_c41_be6e_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l2753_c41_be6e_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2753_c41_be6e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2754_c11_84dd]
signal BIN_OP_EQ_uxn_opcodes_h_l2754_c11_84dd_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2754_c11_84dd_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2754_c11_84dd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2754_c1_f981]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_f981_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_f981_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_f981_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_f981_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2755_c7_abc1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_abc1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_abc1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_abc1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_abc1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2754_c7_b6fe]
signal opc_result_MUX_uxn_opcodes_h_l2754_c7_b6fe_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2754_c7_b6fe_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2754_c7_b6fe_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2754_c7_b6fe_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l2754_c41_daf7]
signal jsr2_uxn_opcodes_h_l2754_c41_daf7_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l2754_c41_daf7_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2754_c41_daf7_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2754_c41_daf7_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l2754_c41_daf7_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2754_c41_daf7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2755_c11_5c1a]
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c11_5c1a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c11_5c1a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c11_5c1a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2755_c1_3d97]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_3d97_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_3d97_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_3d97_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_3d97_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2756_c7_a1cb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_a1cb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_a1cb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_a1cb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_a1cb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2755_c7_abc1]
signal opc_result_MUX_uxn_opcodes_h_l2755_c7_abc1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2755_c7_abc1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2755_c7_abc1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2755_c7_abc1_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l2755_c41_5d99]
signal sth_uxn_opcodes_h_l2755_c41_5d99_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l2755_c41_5d99_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2755_c41_5d99_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2755_c41_5d99_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2755_c41_5d99_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2756_c11_5a5c]
signal BIN_OP_EQ_uxn_opcodes_h_l2756_c11_5a5c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2756_c11_5a5c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2756_c11_5a5c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2756_c1_1fc7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_1fc7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_1fc7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_1fc7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_1fc7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2757_c7_3c85]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_3c85_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_3c85_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_3c85_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_3c85_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2756_c7_a1cb]
signal opc_result_MUX_uxn_opcodes_h_l2756_c7_a1cb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2756_c7_a1cb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2756_c7_a1cb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2756_c7_a1cb_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l2756_c41_0d9b]
signal sth2_uxn_opcodes_h_l2756_c41_0d9b_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l2756_c41_0d9b_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2756_c41_0d9b_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2756_c41_0d9b_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2756_c41_0d9b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2757_c11_1878]
signal BIN_OP_EQ_uxn_opcodes_h_l2757_c11_1878_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2757_c11_1878_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2757_c11_1878_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2757_c1_4ff3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_4ff3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_4ff3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_4ff3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_4ff3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2758_c7_d95e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_d95e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_d95e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_d95e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_d95e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2757_c7_3c85]
signal opc_result_MUX_uxn_opcodes_h_l2757_c7_3c85_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2757_c7_3c85_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2757_c7_3c85_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2757_c7_3c85_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l2757_c41_b38e]
signal ldz_uxn_opcodes_h_l2757_c41_b38e_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l2757_c41_b38e_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2757_c41_b38e_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2757_c41_b38e_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2757_c41_b38e_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2757_c41_b38e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2758_c11_65f0]
signal BIN_OP_EQ_uxn_opcodes_h_l2758_c11_65f0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2758_c11_65f0_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2758_c11_65f0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2758_c1_8d5d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_8d5d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_8d5d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_8d5d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_8d5d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2759_c7_1288]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1288_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1288_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1288_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1288_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2758_c7_d95e]
signal opc_result_MUX_uxn_opcodes_h_l2758_c7_d95e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2758_c7_d95e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2758_c7_d95e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2758_c7_d95e_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l2758_c41_6f6e]
signal ldz2_uxn_opcodes_h_l2758_c41_6f6e_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l2758_c41_6f6e_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2758_c41_6f6e_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2758_c41_6f6e_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2758_c41_6f6e_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2758_c41_6f6e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2759_c11_6d13]
signal BIN_OP_EQ_uxn_opcodes_h_l2759_c11_6d13_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2759_c11_6d13_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2759_c11_6d13_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2759_c1_73a4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_73a4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_73a4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_73a4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_73a4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2760_c7_79e6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_79e6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_79e6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_79e6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_79e6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2759_c7_1288]
signal opc_result_MUX_uxn_opcodes_h_l2759_c7_1288_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2759_c7_1288_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2759_c7_1288_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2759_c7_1288_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l2759_c41_a8de]
signal stz_uxn_opcodes_h_l2759_c41_a8de_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l2759_c41_a8de_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2759_c41_a8de_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2759_c41_a8de_previous_stack_read : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2759_c41_a8de_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2760_c11_1fde]
signal BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1fde_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1fde_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1fde_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2760_c1_9ffd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_9ffd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_9ffd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_9ffd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_9ffd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2761_c7_4431]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_4431_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_4431_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_4431_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_4431_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2760_c7_79e6]
signal opc_result_MUX_uxn_opcodes_h_l2760_c7_79e6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2760_c7_79e6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2760_c7_79e6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2760_c7_79e6_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l2760_c41_fb87]
signal stz2_uxn_opcodes_h_l2760_c41_fb87_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l2760_c41_fb87_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2760_c41_fb87_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2760_c41_fb87_previous_stack_read : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2760_c41_fb87_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2761_c11_176d]
signal BIN_OP_EQ_uxn_opcodes_h_l2761_c11_176d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2761_c11_176d_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2761_c11_176d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2761_c1_0a6c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_0a6c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_0a6c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_0a6c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_0a6c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2762_c7_e022]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_e022_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_e022_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_e022_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_e022_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2761_c7_4431]
signal opc_result_MUX_uxn_opcodes_h_l2761_c7_4431_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2761_c7_4431_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2761_c7_4431_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2761_c7_4431_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l2761_c41_8783]
signal ldr_uxn_opcodes_h_l2761_c41_8783_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l2761_c41_8783_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2761_c41_8783_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2761_c41_8783_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l2761_c41_8783_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2761_c41_8783_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2761_c41_8783_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2762_c11_01d4]
signal BIN_OP_EQ_uxn_opcodes_h_l2762_c11_01d4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2762_c11_01d4_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2762_c11_01d4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2762_c1_6150]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6150_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6150_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6150_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6150_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2763_c7_b6e2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_b6e2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_b6e2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_b6e2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_b6e2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2762_c7_e022]
signal opc_result_MUX_uxn_opcodes_h_l2762_c7_e022_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2762_c7_e022_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2762_c7_e022_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2762_c7_e022_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l2762_c41_c2f9]
signal ldr2_uxn_opcodes_h_l2762_c41_c2f9_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l2762_c41_c2f9_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2762_c41_c2f9_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2762_c41_c2f9_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l2762_c41_c2f9_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2762_c41_c2f9_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2762_c41_c2f9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2763_c11_266d]
signal BIN_OP_EQ_uxn_opcodes_h_l2763_c11_266d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2763_c11_266d_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2763_c11_266d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2763_c1_838b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_838b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_838b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_838b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_838b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2764_c7_5cdd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_5cdd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_5cdd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_5cdd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_5cdd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2763_c7_b6e2]
signal opc_result_MUX_uxn_opcodes_h_l2763_c7_b6e2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2763_c7_b6e2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2763_c7_b6e2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2763_c7_b6e2_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l2763_c41_015e]
signal str1_uxn_opcodes_h_l2763_c41_015e_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l2763_c41_015e_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2763_c41_015e_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2763_c41_015e_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l2763_c41_015e_previous_stack_read : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2763_c41_015e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2764_c11_b6b2]
signal BIN_OP_EQ_uxn_opcodes_h_l2764_c11_b6b2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2764_c11_b6b2_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2764_c11_b6b2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2764_c1_c8be]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_c8be_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_c8be_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_c8be_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_c8be_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2765_c7_6ff0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_6ff0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_6ff0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_6ff0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_6ff0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2764_c7_5cdd]
signal opc_result_MUX_uxn_opcodes_h_l2764_c7_5cdd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2764_c7_5cdd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2764_c7_5cdd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2764_c7_5cdd_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l2764_c41_bb2b]
signal str2_uxn_opcodes_h_l2764_c41_bb2b_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l2764_c41_bb2b_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2764_c41_bb2b_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2764_c41_bb2b_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l2764_c41_bb2b_previous_stack_read : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2764_c41_bb2b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2765_c11_a869]
signal BIN_OP_EQ_uxn_opcodes_h_l2765_c11_a869_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2765_c11_a869_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2765_c11_a869_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2765_c1_32a7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_32a7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_32a7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_32a7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_32a7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2766_c7_00d4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_00d4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_00d4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_00d4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_00d4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2765_c7_6ff0]
signal opc_result_MUX_uxn_opcodes_h_l2765_c7_6ff0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2765_c7_6ff0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2765_c7_6ff0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2765_c7_6ff0_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l2765_c41_31a1]
signal lda_uxn_opcodes_h_l2765_c41_31a1_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l2765_c41_31a1_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2765_c41_31a1_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2765_c41_31a1_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2765_c41_31a1_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2765_c41_31a1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2766_c11_240e]
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_240e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_240e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_240e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2766_c1_3762]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_3762_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_3762_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_3762_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_3762_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2767_c7_8f80]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_8f80_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_8f80_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_8f80_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_8f80_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2766_c7_00d4]
signal opc_result_MUX_uxn_opcodes_h_l2766_c7_00d4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2766_c7_00d4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2766_c7_00d4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2766_c7_00d4_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l2766_c41_cd54]
signal lda2_uxn_opcodes_h_l2766_c41_cd54_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l2766_c41_cd54_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2766_c41_cd54_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2766_c41_cd54_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2766_c41_cd54_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2766_c41_cd54_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2767_c11_9032]
signal BIN_OP_EQ_uxn_opcodes_h_l2767_c11_9032_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2767_c11_9032_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2767_c11_9032_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2767_c1_bd7f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_bd7f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_bd7f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_bd7f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_bd7f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2768_c7_11d7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_11d7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_11d7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_11d7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_11d7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2767_c7_8f80]
signal opc_result_MUX_uxn_opcodes_h_l2767_c7_8f80_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2767_c7_8f80_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2767_c7_8f80_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2767_c7_8f80_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l2767_c41_71e6]
signal sta_uxn_opcodes_h_l2767_c41_71e6_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l2767_c41_71e6_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2767_c41_71e6_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2767_c41_71e6_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2767_c41_71e6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2768_c11_f613]
signal BIN_OP_EQ_uxn_opcodes_h_l2768_c11_f613_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2768_c11_f613_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2768_c11_f613_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2768_c1_d8b2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d8b2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d8b2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d8b2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d8b2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2769_c7_78bb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_78bb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_78bb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_78bb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_78bb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2768_c7_11d7]
signal opc_result_MUX_uxn_opcodes_h_l2768_c7_11d7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2768_c7_11d7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2768_c7_11d7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2768_c7_11d7_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l2768_c41_4b8d]
signal sta2_uxn_opcodes_h_l2768_c41_4b8d_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l2768_c41_4b8d_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2768_c41_4b8d_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2768_c41_4b8d_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2768_c41_4b8d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2769_c11_d653]
signal BIN_OP_EQ_uxn_opcodes_h_l2769_c11_d653_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2769_c11_d653_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2769_c11_d653_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2769_c1_7e55]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7e55_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7e55_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7e55_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7e55_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2770_c7_7171]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_7171_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_7171_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_7171_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_7171_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2769_c7_78bb]
signal opc_result_MUX_uxn_opcodes_h_l2769_c7_78bb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2769_c7_78bb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2769_c7_78bb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2769_c7_78bb_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l2769_c41_9a0e]
signal dei_uxn_opcodes_h_l2769_c41_9a0e_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l2769_c41_9a0e_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2769_c41_9a0e_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2769_c41_9a0e_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2769_c41_9a0e_previous_device_ram_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2769_c41_9a0e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2770_c11_cba2]
signal BIN_OP_EQ_uxn_opcodes_h_l2770_c11_cba2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2770_c11_cba2_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2770_c11_cba2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2770_c1_994a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_994a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_994a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_994a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_994a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2771_c7_19ef]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_19ef_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_19ef_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_19ef_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_19ef_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2770_c7_7171]
signal opc_result_MUX_uxn_opcodes_h_l2770_c7_7171_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2770_c7_7171_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2770_c7_7171_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2770_c7_7171_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l2770_c41_d02e]
signal dei2_uxn_opcodes_h_l2770_c41_d02e_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l2770_c41_d02e_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2770_c41_d02e_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2770_c41_d02e_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2770_c41_d02e_previous_device_ram_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2770_c41_d02e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2771_c11_3bd7]
signal BIN_OP_EQ_uxn_opcodes_h_l2771_c11_3bd7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2771_c11_3bd7_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2771_c11_3bd7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2771_c1_4699]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_4699_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_4699_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_4699_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_4699_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2772_c7_fbeb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fbeb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fbeb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fbeb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fbeb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2771_c7_19ef]
signal opc_result_MUX_uxn_opcodes_h_l2771_c7_19ef_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2771_c7_19ef_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2771_c7_19ef_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2771_c7_19ef_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l2771_c41_d1c0]
signal deo_uxn_opcodes_h_l2771_c41_d1c0_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l2771_c41_d1c0_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2771_c41_d1c0_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2771_c41_d1c0_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2771_c41_d1c0_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2771_c41_d1c0_previous_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2771_c41_d1c0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2772_c11_0dfb]
signal BIN_OP_EQ_uxn_opcodes_h_l2772_c11_0dfb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2772_c11_0dfb_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2772_c11_0dfb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2772_c1_0aaa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_0aaa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_0aaa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_0aaa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_0aaa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2773_c7_e729]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_e729_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_e729_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_e729_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_e729_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2772_c7_fbeb]
signal opc_result_MUX_uxn_opcodes_h_l2772_c7_fbeb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2772_c7_fbeb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2772_c7_fbeb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2772_c7_fbeb_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l2772_c41_a1d9]
signal deo2_uxn_opcodes_h_l2772_c41_a1d9_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l2772_c41_a1d9_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2772_c41_a1d9_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2772_c41_a1d9_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2772_c41_a1d9_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2772_c41_a1d9_previous_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2772_c41_a1d9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2773_c11_5404]
signal BIN_OP_EQ_uxn_opcodes_h_l2773_c11_5404_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2773_c11_5404_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2773_c11_5404_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2773_c1_fe36]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_fe36_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_fe36_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_fe36_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_fe36_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2774_c7_0c6e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_0c6e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_0c6e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_0c6e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_0c6e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2773_c7_e729]
signal opc_result_MUX_uxn_opcodes_h_l2773_c7_e729_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2773_c7_e729_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2773_c7_e729_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2773_c7_e729_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l2773_c41_9472]
signal add_uxn_opcodes_h_l2773_c41_9472_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l2773_c41_9472_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2773_c41_9472_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2773_c41_9472_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2773_c41_9472_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2774_c11_21d7]
signal BIN_OP_EQ_uxn_opcodes_h_l2774_c11_21d7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2774_c11_21d7_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2774_c11_21d7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2774_c1_8e4b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8e4b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8e4b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8e4b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8e4b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2775_c7_dfdd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_dfdd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_dfdd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_dfdd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_dfdd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2774_c7_0c6e]
signal opc_result_MUX_uxn_opcodes_h_l2774_c7_0c6e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2774_c7_0c6e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2774_c7_0c6e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2774_c7_0c6e_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l2774_c41_f0b6]
signal add2_uxn_opcodes_h_l2774_c41_f0b6_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l2774_c41_f0b6_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2774_c41_f0b6_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2774_c41_f0b6_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2774_c41_f0b6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2775_c11_a966]
signal BIN_OP_EQ_uxn_opcodes_h_l2775_c11_a966_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2775_c11_a966_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2775_c11_a966_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2775_c1_eb0a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_eb0a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_eb0a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_eb0a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_eb0a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2776_c7_86e6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_86e6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_86e6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_86e6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_86e6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2775_c7_dfdd]
signal opc_result_MUX_uxn_opcodes_h_l2775_c7_dfdd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2775_c7_dfdd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2775_c7_dfdd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2775_c7_dfdd_return_output : opcode_result_t;

-- sub[uxn_opcodes_h_l2775_c41_2b09]
signal sub_uxn_opcodes_h_l2775_c41_2b09_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub_uxn_opcodes_h_l2775_c41_2b09_phase : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2775_c41_2b09_ins : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2775_c41_2b09_previous_stack_read : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2775_c41_2b09_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2776_c11_fcb1]
signal BIN_OP_EQ_uxn_opcodes_h_l2776_c11_fcb1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2776_c11_fcb1_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2776_c11_fcb1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2776_c1_fb29]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fb29_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fb29_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fb29_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fb29_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2777_c7_e883]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_e883_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_e883_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_e883_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_e883_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2776_c7_86e6]
signal opc_result_MUX_uxn_opcodes_h_l2776_c7_86e6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2776_c7_86e6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2776_c7_86e6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2776_c7_86e6_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l2776_c41_1929]
signal sub2_uxn_opcodes_h_l2776_c41_1929_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l2776_c41_1929_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2776_c41_1929_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2776_c41_1929_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2776_c41_1929_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2777_c11_8161]
signal BIN_OP_EQ_uxn_opcodes_h_l2777_c11_8161_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2777_c11_8161_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2777_c11_8161_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2777_c1_810f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_810f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_810f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_810f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_810f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2778_c7_3cbe]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_3cbe_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_3cbe_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_3cbe_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_3cbe_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2777_c7_e883]
signal opc_result_MUX_uxn_opcodes_h_l2777_c7_e883_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2777_c7_e883_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2777_c7_e883_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2777_c7_e883_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l2777_c41_2a47]
signal mul_uxn_opcodes_h_l2777_c41_2a47_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l2777_c41_2a47_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2777_c41_2a47_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2777_c41_2a47_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2777_c41_2a47_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2778_c11_0ec5]
signal BIN_OP_EQ_uxn_opcodes_h_l2778_c11_0ec5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2778_c11_0ec5_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2778_c11_0ec5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2778_c1_8252]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_8252_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_8252_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_8252_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_8252_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2779_c7_4639]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_4639_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_4639_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_4639_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_4639_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2778_c7_3cbe]
signal opc_result_MUX_uxn_opcodes_h_l2778_c7_3cbe_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2778_c7_3cbe_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2778_c7_3cbe_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2778_c7_3cbe_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l2778_c41_7a26]
signal mul2_uxn_opcodes_h_l2778_c41_7a26_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l2778_c41_7a26_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2778_c41_7a26_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2778_c41_7a26_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2778_c41_7a26_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2779_c11_396f]
signal BIN_OP_EQ_uxn_opcodes_h_l2779_c11_396f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2779_c11_396f_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2779_c11_396f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2779_c1_27d9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_27d9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_27d9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_27d9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_27d9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2780_c7_e6c5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_e6c5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_e6c5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_e6c5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_e6c5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2779_c7_4639]
signal opc_result_MUX_uxn_opcodes_h_l2779_c7_4639_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2779_c7_4639_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2779_c7_4639_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2779_c7_4639_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l2779_c41_fa5d]
signal div_uxn_opcodes_h_l2779_c41_fa5d_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l2779_c41_fa5d_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2779_c41_fa5d_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2779_c41_fa5d_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2779_c41_fa5d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2780_c11_b1c2]
signal BIN_OP_EQ_uxn_opcodes_h_l2780_c11_b1c2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2780_c11_b1c2_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2780_c11_b1c2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2780_c1_28e3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_28e3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_28e3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_28e3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_28e3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2781_c7_8f15]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_8f15_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_8f15_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_8f15_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_8f15_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2780_c7_e6c5]
signal opc_result_MUX_uxn_opcodes_h_l2780_c7_e6c5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2780_c7_e6c5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2780_c7_e6c5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2780_c7_e6c5_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l2780_c41_78b8]
signal div2_uxn_opcodes_h_l2780_c41_78b8_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l2780_c41_78b8_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2780_c41_78b8_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2780_c41_78b8_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2780_c41_78b8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2781_c11_8744]
signal BIN_OP_EQ_uxn_opcodes_h_l2781_c11_8744_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2781_c11_8744_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2781_c11_8744_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2781_c1_9c00]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_9c00_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_9c00_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_9c00_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_9c00_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2782_c7_1774]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c7_1774_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c7_1774_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c7_1774_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c7_1774_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2781_c7_8f15]
signal opc_result_MUX_uxn_opcodes_h_l2781_c7_8f15_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2781_c7_8f15_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2781_c7_8f15_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2781_c7_8f15_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l2781_c41_3c0b]
signal and_uxn_opcodes_h_l2781_c41_3c0b_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l2781_c41_3c0b_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2781_c41_3c0b_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2781_c41_3c0b_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2781_c41_3c0b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2782_c11_e346]
signal BIN_OP_EQ_uxn_opcodes_h_l2782_c11_e346_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2782_c11_e346_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2782_c11_e346_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2782_c1_0042]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_0042_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_0042_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_0042_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_0042_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2783_c7_13d7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c7_13d7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c7_13d7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c7_13d7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c7_13d7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2782_c7_1774]
signal opc_result_MUX_uxn_opcodes_h_l2782_c7_1774_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2782_c7_1774_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2782_c7_1774_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2782_c7_1774_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l2782_c41_2cae]
signal and2_uxn_opcodes_h_l2782_c41_2cae_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l2782_c41_2cae_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2782_c41_2cae_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2782_c41_2cae_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2782_c41_2cae_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2783_c11_2563]
signal BIN_OP_EQ_uxn_opcodes_h_l2783_c11_2563_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2783_c11_2563_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2783_c11_2563_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2783_c1_b3f7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c1_b3f7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c1_b3f7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c1_b3f7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c1_b3f7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2784_c7_4d58]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c7_4d58_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c7_4d58_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c7_4d58_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c7_4d58_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2783_c7_13d7]
signal opc_result_MUX_uxn_opcodes_h_l2783_c7_13d7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2783_c7_13d7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2783_c7_13d7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2783_c7_13d7_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l2783_c41_9203]
signal ora_uxn_opcodes_h_l2783_c41_9203_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l2783_c41_9203_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2783_c41_9203_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2783_c41_9203_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2783_c41_9203_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2784_c11_15d9]
signal BIN_OP_EQ_uxn_opcodes_h_l2784_c11_15d9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2784_c11_15d9_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2784_c11_15d9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2784_c1_7d8c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c1_7d8c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c1_7d8c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c1_7d8c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c1_7d8c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2785_c7_a5f1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c7_a5f1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c7_a5f1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c7_a5f1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c7_a5f1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2784_c7_4d58]
signal opc_result_MUX_uxn_opcodes_h_l2784_c7_4d58_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2784_c7_4d58_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2784_c7_4d58_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2784_c7_4d58_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l2784_c41_6380]
signal ora2_uxn_opcodes_h_l2784_c41_6380_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l2784_c41_6380_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2784_c41_6380_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2784_c41_6380_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2784_c41_6380_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2785_c11_0d8e]
signal BIN_OP_EQ_uxn_opcodes_h_l2785_c11_0d8e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2785_c11_0d8e_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2785_c11_0d8e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2785_c1_01b4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c1_01b4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c1_01b4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c1_01b4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c1_01b4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2786_c7_bd8a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c7_bd8a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c7_bd8a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c7_bd8a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c7_bd8a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2785_c7_a5f1]
signal opc_result_MUX_uxn_opcodes_h_l2785_c7_a5f1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2785_c7_a5f1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2785_c7_a5f1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2785_c7_a5f1_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l2785_c41_21f3]
signal eor_uxn_opcodes_h_l2785_c41_21f3_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l2785_c41_21f3_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2785_c41_21f3_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2785_c41_21f3_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2785_c41_21f3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2786_c11_d294]
signal BIN_OP_EQ_uxn_opcodes_h_l2786_c11_d294_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2786_c11_d294_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2786_c11_d294_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2786_c1_bc33]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c1_bc33_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c1_bc33_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c1_bc33_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c1_bc33_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2787_c7_7515]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c7_7515_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c7_7515_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c7_7515_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c7_7515_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2786_c7_bd8a]
signal opc_result_MUX_uxn_opcodes_h_l2786_c7_bd8a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2786_c7_bd8a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2786_c7_bd8a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2786_c7_bd8a_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l2786_c41_451a]
signal eor2_uxn_opcodes_h_l2786_c41_451a_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l2786_c41_451a_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2786_c41_451a_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2786_c41_451a_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2786_c41_451a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2787_c11_26d2]
signal BIN_OP_EQ_uxn_opcodes_h_l2787_c11_26d2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2787_c11_26d2_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2787_c11_26d2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2787_c1_5847]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c1_5847_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c1_5847_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c1_5847_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c1_5847_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2788_c7_9bc2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c7_9bc2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c7_9bc2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c7_9bc2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c7_9bc2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2787_c7_7515]
signal opc_result_MUX_uxn_opcodes_h_l2787_c7_7515_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2787_c7_7515_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2787_c7_7515_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2787_c7_7515_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l2787_c41_741a]
signal sft_uxn_opcodes_h_l2787_c41_741a_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l2787_c41_741a_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2787_c41_741a_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2787_c41_741a_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2787_c41_741a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2788_c11_ebd0]
signal BIN_OP_EQ_uxn_opcodes_h_l2788_c11_ebd0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2788_c11_ebd0_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2788_c11_ebd0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2788_c1_c8ae]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c1_c8ae_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c1_c8ae_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c1_c8ae_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c1_c8ae_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2789_c1_1fe8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2789_c1_1fe8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2789_c1_1fe8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2789_c1_1fe8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2789_c1_1fe8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2788_c7_9bc2]
signal opc_result_MUX_uxn_opcodes_h_l2788_c7_9bc2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2788_c7_9bc2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2788_c7_9bc2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2788_c7_9bc2_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l2788_c41_908a]
signal sft2_uxn_opcodes_h_l2788_c41_908a_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l2788_c41_908a_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2788_c41_908a_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2788_c41_908a_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2788_c41_908a_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2789_c9_4682[uxn_opcodes_h_l2789_c9_4682]
signal printf_uxn_opcodes_h_l2789_c9_4682_uxn_opcodes_h_l2789_c9_4682_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2789_c9_4682_uxn_opcodes_h_l2789_c9_4682_arg0 : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2791_c18_bc25]
signal BIN_OP_AND_uxn_opcodes_h_l2791_c18_bc25_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2791_c18_bc25_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2791_c18_bc25_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2791_c18_7b50]
signal BIN_OP_GT_uxn_opcodes_h_l2791_c18_7b50_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2791_c18_7b50_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2791_c18_7b50_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2791_c18_cedb]
signal MUX_uxn_opcodes_h_l2791_c18_cedb_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2791_c18_cedb_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2791_c18_cedb_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2791_c18_cedb_return_output : unsigned(0 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2792_c2_d383]
signal BIN_OP_XOR_uxn_opcodes_h_l2792_c2_d383_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2792_c2_d383_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2792_c2_d383_return_output : unsigned(0 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2794_c2_4f32]
signal sp1_MUX_uxn_opcodes_h_l2794_c2_4f32_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2794_c2_4f32_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2794_c2_4f32_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2794_c2_4f32_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2794_c2_4f32]
signal sp0_MUX_uxn_opcodes_h_l2794_c2_4f32_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2794_c2_4f32_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2794_c2_4f32_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2794_c2_4f32_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2795_c3_3a25]
signal sp1_MUX_uxn_opcodes_h_l2795_c3_3a25_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2795_c3_3a25_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2795_c3_3a25_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2795_c3_3a25_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2795_c3_3a25]
signal sp0_MUX_uxn_opcodes_h_l2795_c3_3a25_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2795_c3_3a25_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2795_c3_3a25_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2795_c3_3a25_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2796_c4_90ce]
signal BIN_OP_PLUS_uxn_opcodes_h_l2796_c4_90ce_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2796_c4_90ce_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2796_c4_90ce_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2798_c4_bc13]
signal BIN_OP_PLUS_uxn_opcodes_h_l2798_c4_bc13_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2798_c4_bc13_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2798_c4_bc13_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l2802_c30_774b]
signal MUX_uxn_opcodes_h_l2802_c30_774b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2802_c30_774b_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2802_c30_774b_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2802_c30_774b_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2802_c19_97c4]
signal BIN_OP_MINUS_uxn_opcodes_h_l2802_c19_97c4_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2802_c19_97c4_right : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2802_c19_97c4_return_output : unsigned(11 downto 0);

-- MUX[uxn_opcodes_h_l2803_c20_27ed]
signal MUX_uxn_opcodes_h_l2803_c20_27ed_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2803_c20_27ed_iftrue : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2803_c20_27ed_iffalse : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2803_c20_27ed_return_output : unsigned(8 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2803_c2_f948]
signal BIN_OP_PLUS_uxn_opcodes_h_l2803_c2_f948_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2803_c2_f948_right : unsigned(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2803_c2_f948_return_output : unsigned(12 downto 0);

-- stack_ram_update[uxn_opcodes_h_l2805_c21_f7ff]
signal stack_ram_update_uxn_opcodes_h_l2805_c21_f7ff_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2805_c21_f7ff_stack_address : unsigned(11 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2805_c21_f7ff_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2805_c21_f7ff_write_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2805_c21_f7ff_return_output : unsigned(7 downto 0);

function CAST_TO_uint12_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(11 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,12)));
    return return_output;
end function;

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

function CAST_TO_uint12_t_uint4_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(3 downto 0);
  variable return_output : unsigned(11 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,12)));
    return return_output;
end function;

function CAST_TO_int8_t_int4_t( rhs : signed) return signed is

  --variable rhs : signed(3 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_27e9( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return eval_opcode_result_t is
 
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
      base.vram_address := ref_toks_8;
      base.u8_value := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_opcodes_h_l2715_c10_1b5d
BIN_OP_AND_uxn_opcodes_h_l2715_c10_1b5d : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2715_c10_1b5d_left,
BIN_OP_AND_uxn_opcodes_h_l2715_c10_1b5d_right,
BIN_OP_AND_uxn_opcodes_h_l2715_c10_1b5d_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2715_c10_e480
BIN_OP_GT_uxn_opcodes_h_l2715_c10_e480 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2715_c10_e480_left,
BIN_OP_GT_uxn_opcodes_h_l2715_c10_e480_right,
BIN_OP_GT_uxn_opcodes_h_l2715_c10_e480_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2715_c41_fc87
BIN_OP_AND_uxn_opcodes_h_l2715_c41_fc87 : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2715_c41_fc87_left,
BIN_OP_AND_uxn_opcodes_h_l2715_c41_fc87_right,
BIN_OP_AND_uxn_opcodes_h_l2715_c41_fc87_return_output);

-- CONST_SL_4_uxn_opcodes_h_l2715_c57_42cc
CONST_SL_4_uxn_opcodes_h_l2715_c57_42cc : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_opcodes_h_l2715_c57_42cc_x,
CONST_SL_4_uxn_opcodes_h_l2715_c57_42cc_return_output);

-- MUX_uxn_opcodes_h_l2715_c10_9a20
MUX_uxn_opcodes_h_l2715_c10_9a20 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2715_c10_9a20_cond,
MUX_uxn_opcodes_h_l2715_c10_9a20_iftrue,
MUX_uxn_opcodes_h_l2715_c10_9a20_iffalse,
MUX_uxn_opcodes_h_l2715_c10_9a20_return_output);

-- printf_uxn_opcodes_h_l2717_c2_8fa5_uxn_opcodes_h_l2717_c2_8fa5
printf_uxn_opcodes_h_l2717_c2_8fa5_uxn_opcodes_h_l2717_c2_8fa5 : entity work.printf_uxn_opcodes_h_l2717_c2_8fa5_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2717_c2_8fa5_uxn_opcodes_h_l2717_c2_8fa5_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2717_c2_8fa5_uxn_opcodes_h_l2717_c2_8fa5_arg0,
printf_uxn_opcodes_h_l2717_c2_8fa5_uxn_opcodes_h_l2717_c2_8fa5_arg1,
printf_uxn_opcodes_h_l2717_c2_8fa5_uxn_opcodes_h_l2717_c2_8fa5_arg2);

-- BIN_OP_EQ_uxn_opcodes_h_l2719_c6_9c85
BIN_OP_EQ_uxn_opcodes_h_l2719_c6_9c85 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2719_c6_9c85_left,
BIN_OP_EQ_uxn_opcodes_h_l2719_c6_9c85_right,
BIN_OP_EQ_uxn_opcodes_h_l2719_c6_9c85_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_373a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_373a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_373a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_373a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_373a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_373a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_e407
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_e407 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_e407_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_e407_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_e407_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_e407_return_output);

-- is_wait_MUX_uxn_opcodes_h_l2719_c2_7623
is_wait_MUX_uxn_opcodes_h_l2719_c2_7623 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_wait_MUX_uxn_opcodes_h_l2719_c2_7623_cond,
is_wait_MUX_uxn_opcodes_h_l2719_c2_7623_iftrue,
is_wait_MUX_uxn_opcodes_h_l2719_c2_7623_iffalse,
is_wait_MUX_uxn_opcodes_h_l2719_c2_7623_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2719_c2_7623
opc_result_MUX_uxn_opcodes_h_l2719_c2_7623 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_cond,
opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_iftrue,
opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_iffalse,
opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_return_output);

-- printf_uxn_opcodes_h_l2719_c23_84f6_uxn_opcodes_h_l2719_c23_84f6
printf_uxn_opcodes_h_l2719_c23_84f6_uxn_opcodes_h_l2719_c23_84f6 : entity work.printf_uxn_opcodes_h_l2719_c23_84f6_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2719_c23_84f6_uxn_opcodes_h_l2719_c23_84f6_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2720_c11_00db
BIN_OP_EQ_uxn_opcodes_h_l2720_c11_00db : entity work.BIN_OP_EQ_uint12_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2720_c11_00db_left,
BIN_OP_EQ_uxn_opcodes_h_l2720_c11_00db_right,
BIN_OP_EQ_uxn_opcodes_h_l2720_c11_00db_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_a825
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_a825 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_a825_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_a825_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_a825_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_a825_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ec20
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ec20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ec20_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ec20_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ec20_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ec20_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2720_c7_e407
opc_result_MUX_uxn_opcodes_h_l2720_c7_e407 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2720_c7_e407_cond,
opc_result_MUX_uxn_opcodes_h_l2720_c7_e407_iftrue,
opc_result_MUX_uxn_opcodes_h_l2720_c7_e407_iffalse,
opc_result_MUX_uxn_opcodes_h_l2720_c7_e407_return_output);

-- jci_uxn_opcodes_h_l2720_c41_46ad
jci_uxn_opcodes_h_l2720_c41_46ad : entity work.jci_0CLK_edc09f97 port map (
clk,
jci_uxn_opcodes_h_l2720_c41_46ad_CLOCK_ENABLE,
jci_uxn_opcodes_h_l2720_c41_46ad_phase,
jci_uxn_opcodes_h_l2720_c41_46ad_pc,
jci_uxn_opcodes_h_l2720_c41_46ad_previous_stack_read,
jci_uxn_opcodes_h_l2720_c41_46ad_previous_ram_read,
jci_uxn_opcodes_h_l2720_c41_46ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2721_c11_b889
BIN_OP_EQ_uxn_opcodes_h_l2721_c11_b889 : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2721_c11_b889_left,
BIN_OP_EQ_uxn_opcodes_h_l2721_c11_b889_right,
BIN_OP_EQ_uxn_opcodes_h_l2721_c11_b889_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ae96
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ae96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ae96_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ae96_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ae96_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ae96_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_c4d4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_c4d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_c4d4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_c4d4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_c4d4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_c4d4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2721_c7_ec20
opc_result_MUX_uxn_opcodes_h_l2721_c7_ec20 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2721_c7_ec20_cond,
opc_result_MUX_uxn_opcodes_h_l2721_c7_ec20_iftrue,
opc_result_MUX_uxn_opcodes_h_l2721_c7_ec20_iffalse,
opc_result_MUX_uxn_opcodes_h_l2721_c7_ec20_return_output);

-- jmi_uxn_opcodes_h_l2721_c41_8067
jmi_uxn_opcodes_h_l2721_c41_8067 : entity work.jmi_0CLK_8f4d4fc5 port map (
clk,
jmi_uxn_opcodes_h_l2721_c41_8067_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l2721_c41_8067_phase,
jmi_uxn_opcodes_h_l2721_c41_8067_pc,
jmi_uxn_opcodes_h_l2721_c41_8067_previous_ram_read,
jmi_uxn_opcodes_h_l2721_c41_8067_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2722_c11_3037
BIN_OP_EQ_uxn_opcodes_h_l2722_c11_3037 : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2722_c11_3037_left,
BIN_OP_EQ_uxn_opcodes_h_l2722_c11_3037_right,
BIN_OP_EQ_uxn_opcodes_h_l2722_c11_3037_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_d39b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_d39b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_d39b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_d39b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_d39b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_d39b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_00f0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_00f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_00f0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_00f0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_00f0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_00f0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2722_c7_c4d4
opc_result_MUX_uxn_opcodes_h_l2722_c7_c4d4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2722_c7_c4d4_cond,
opc_result_MUX_uxn_opcodes_h_l2722_c7_c4d4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2722_c7_c4d4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2722_c7_c4d4_return_output);

-- jsi_uxn_opcodes_h_l2722_c41_19e6
jsi_uxn_opcodes_h_l2722_c41_19e6 : entity work.jsi_0CLK_af8c339b port map (
clk,
jsi_uxn_opcodes_h_l2722_c41_19e6_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l2722_c41_19e6_phase,
jsi_uxn_opcodes_h_l2722_c41_19e6_pc,
jsi_uxn_opcodes_h_l2722_c41_19e6_previous_ram_read,
jsi_uxn_opcodes_h_l2722_c41_19e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2723_c11_199e
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_199e : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_199e_left,
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_199e_right,
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_199e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_c6b9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_c6b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_c6b9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_c6b9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_c6b9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_c6b9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_a630
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_a630 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_a630_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_a630_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_a630_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_a630_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2723_c7_00f0
opc_result_MUX_uxn_opcodes_h_l2723_c7_00f0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2723_c7_00f0_cond,
opc_result_MUX_uxn_opcodes_h_l2723_c7_00f0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2723_c7_00f0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2723_c7_00f0_return_output);

-- lit_uxn_opcodes_h_l2723_c41_d996
lit_uxn_opcodes_h_l2723_c41_d996 : entity work.lit_0CLK_ac9ce6a4 port map (
clk,
lit_uxn_opcodes_h_l2723_c41_d996_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2723_c41_d996_phase,
lit_uxn_opcodes_h_l2723_c41_d996_pc,
lit_uxn_opcodes_h_l2723_c41_d996_previous_ram_read,
lit_uxn_opcodes_h_l2723_c41_d996_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2724_c11_44ba
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_44ba : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_44ba_left,
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_44ba_right,
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_44ba_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_2230
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_2230 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_2230_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_2230_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_2230_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_2230_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_7af2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_7af2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_7af2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_7af2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_7af2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_7af2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2724_c7_a630
opc_result_MUX_uxn_opcodes_h_l2724_c7_a630 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2724_c7_a630_cond,
opc_result_MUX_uxn_opcodes_h_l2724_c7_a630_iftrue,
opc_result_MUX_uxn_opcodes_h_l2724_c7_a630_iffalse,
opc_result_MUX_uxn_opcodes_h_l2724_c7_a630_return_output);

-- lit2_uxn_opcodes_h_l2724_c41_0f38
lit2_uxn_opcodes_h_l2724_c41_0f38 : entity work.lit2_0CLK_edc09f97 port map (
clk,
lit2_uxn_opcodes_h_l2724_c41_0f38_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2724_c41_0f38_phase,
lit2_uxn_opcodes_h_l2724_c41_0f38_pc,
lit2_uxn_opcodes_h_l2724_c41_0f38_previous_ram_read,
lit2_uxn_opcodes_h_l2724_c41_0f38_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2725_c11_a14c
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_a14c : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_a14c_left,
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_a14c_right,
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_a14c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_03ea
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_03ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_03ea_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_03ea_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_03ea_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_03ea_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_3a5d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_3a5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_3a5d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_3a5d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_3a5d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_3a5d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2725_c7_7af2
opc_result_MUX_uxn_opcodes_h_l2725_c7_7af2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2725_c7_7af2_cond,
opc_result_MUX_uxn_opcodes_h_l2725_c7_7af2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2725_c7_7af2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2725_c7_7af2_return_output);

-- lit_uxn_opcodes_h_l2725_c41_c710
lit_uxn_opcodes_h_l2725_c41_c710 : entity work.lit_0CLK_ac9ce6a4 port map (
clk,
lit_uxn_opcodes_h_l2725_c41_c710_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2725_c41_c710_phase,
lit_uxn_opcodes_h_l2725_c41_c710_pc,
lit_uxn_opcodes_h_l2725_c41_c710_previous_ram_read,
lit_uxn_opcodes_h_l2725_c41_c710_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2726_c11_c5e6
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_c5e6 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_c5e6_left,
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_c5e6_right,
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_c5e6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_ee2d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_ee2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_ee2d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_ee2d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_ee2d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_ee2d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_dbd2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_dbd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_dbd2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_dbd2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_dbd2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_dbd2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2726_c7_3a5d
opc_result_MUX_uxn_opcodes_h_l2726_c7_3a5d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2726_c7_3a5d_cond,
opc_result_MUX_uxn_opcodes_h_l2726_c7_3a5d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2726_c7_3a5d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2726_c7_3a5d_return_output);

-- lit2_uxn_opcodes_h_l2726_c41_e80e
lit2_uxn_opcodes_h_l2726_c41_e80e : entity work.lit2_0CLK_edc09f97 port map (
clk,
lit2_uxn_opcodes_h_l2726_c41_e80e_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2726_c41_e80e_phase,
lit2_uxn_opcodes_h_l2726_c41_e80e_pc,
lit2_uxn_opcodes_h_l2726_c41_e80e_previous_ram_read,
lit2_uxn_opcodes_h_l2726_c41_e80e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2727_c11_5ef0
BIN_OP_EQ_uxn_opcodes_h_l2727_c11_5ef0 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2727_c11_5ef0_left,
BIN_OP_EQ_uxn_opcodes_h_l2727_c11_5ef0_right,
BIN_OP_EQ_uxn_opcodes_h_l2727_c11_5ef0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_889b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_889b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_889b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_889b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_889b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_889b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_a2ba
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_a2ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_a2ba_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_a2ba_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_a2ba_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_a2ba_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2727_c7_dbd2
opc_result_MUX_uxn_opcodes_h_l2727_c7_dbd2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2727_c7_dbd2_cond,
opc_result_MUX_uxn_opcodes_h_l2727_c7_dbd2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2727_c7_dbd2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2727_c7_dbd2_return_output);

-- inc_uxn_opcodes_h_l2727_c41_8d51
inc_uxn_opcodes_h_l2727_c41_8d51 : entity work.inc_0CLK_b7103d16 port map (
clk,
inc_uxn_opcodes_h_l2727_c41_8d51_CLOCK_ENABLE,
inc_uxn_opcodes_h_l2727_c41_8d51_phase,
inc_uxn_opcodes_h_l2727_c41_8d51_ins,
inc_uxn_opcodes_h_l2727_c41_8d51_previous_stack_read,
inc_uxn_opcodes_h_l2727_c41_8d51_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2728_c11_0ad2
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_0ad2 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_0ad2_left,
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_0ad2_right,
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_0ad2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_0f21
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_0f21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_0f21_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_0f21_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_0f21_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_0f21_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_988f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_988f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_988f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_988f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_988f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_988f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2728_c7_a2ba
opc_result_MUX_uxn_opcodes_h_l2728_c7_a2ba : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2728_c7_a2ba_cond,
opc_result_MUX_uxn_opcodes_h_l2728_c7_a2ba_iftrue,
opc_result_MUX_uxn_opcodes_h_l2728_c7_a2ba_iffalse,
opc_result_MUX_uxn_opcodes_h_l2728_c7_a2ba_return_output);

-- inc2_uxn_opcodes_h_l2728_c41_e26b
inc2_uxn_opcodes_h_l2728_c41_e26b : entity work.inc2_0CLK_a6885b22 port map (
clk,
inc2_uxn_opcodes_h_l2728_c41_e26b_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l2728_c41_e26b_phase,
inc2_uxn_opcodes_h_l2728_c41_e26b_ins,
inc2_uxn_opcodes_h_l2728_c41_e26b_previous_stack_read,
inc2_uxn_opcodes_h_l2728_c41_e26b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2729_c11_5533
BIN_OP_EQ_uxn_opcodes_h_l2729_c11_5533 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2729_c11_5533_left,
BIN_OP_EQ_uxn_opcodes_h_l2729_c11_5533_right,
BIN_OP_EQ_uxn_opcodes_h_l2729_c11_5533_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_f84d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_f84d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_f84d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_f84d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_f84d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_f84d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7400
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7400 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7400_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7400_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7400_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7400_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2729_c7_988f
opc_result_MUX_uxn_opcodes_h_l2729_c7_988f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2729_c7_988f_cond,
opc_result_MUX_uxn_opcodes_h_l2729_c7_988f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2729_c7_988f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2729_c7_988f_return_output);

-- pop_uxn_opcodes_h_l2729_c41_d160
pop_uxn_opcodes_h_l2729_c41_d160 : entity work.pop_0CLK_bd0fc640 port map (
clk,
pop_uxn_opcodes_h_l2729_c41_d160_CLOCK_ENABLE,
pop_uxn_opcodes_h_l2729_c41_d160_phase,
pop_uxn_opcodes_h_l2729_c41_d160_ins,
pop_uxn_opcodes_h_l2729_c41_d160_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4aae
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4aae : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4aae_left,
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4aae_right,
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4aae_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_509f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_509f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_509f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_509f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_509f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_509f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_3b86
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_3b86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_3b86_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_3b86_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_3b86_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_3b86_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2730_c7_7400
opc_result_MUX_uxn_opcodes_h_l2730_c7_7400 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2730_c7_7400_cond,
opc_result_MUX_uxn_opcodes_h_l2730_c7_7400_iftrue,
opc_result_MUX_uxn_opcodes_h_l2730_c7_7400_iffalse,
opc_result_MUX_uxn_opcodes_h_l2730_c7_7400_return_output);

-- pop2_uxn_opcodes_h_l2730_c41_6214
pop2_uxn_opcodes_h_l2730_c41_6214 : entity work.pop2_0CLK_bd0fc640 port map (
clk,
pop2_uxn_opcodes_h_l2730_c41_6214_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l2730_c41_6214_phase,
pop2_uxn_opcodes_h_l2730_c41_6214_ins,
pop2_uxn_opcodes_h_l2730_c41_6214_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2731_c11_6de8
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_6de8 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_6de8_left,
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_6de8_right,
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_6de8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_9bb2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_9bb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_9bb2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_9bb2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_9bb2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_9bb2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_f6bb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_f6bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_f6bb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_f6bb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_f6bb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_f6bb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2731_c7_3b86
opc_result_MUX_uxn_opcodes_h_l2731_c7_3b86 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2731_c7_3b86_cond,
opc_result_MUX_uxn_opcodes_h_l2731_c7_3b86_iftrue,
opc_result_MUX_uxn_opcodes_h_l2731_c7_3b86_iffalse,
opc_result_MUX_uxn_opcodes_h_l2731_c7_3b86_return_output);

-- nip_uxn_opcodes_h_l2731_c41_eb29
nip_uxn_opcodes_h_l2731_c41_eb29 : entity work.nip_0CLK_a9f1e08f port map (
clk,
nip_uxn_opcodes_h_l2731_c41_eb29_CLOCK_ENABLE,
nip_uxn_opcodes_h_l2731_c41_eb29_phase,
nip_uxn_opcodes_h_l2731_c41_eb29_ins,
nip_uxn_opcodes_h_l2731_c41_eb29_previous_stack_read,
nip_uxn_opcodes_h_l2731_c41_eb29_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2732_c11_fafe
BIN_OP_EQ_uxn_opcodes_h_l2732_c11_fafe : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2732_c11_fafe_left,
BIN_OP_EQ_uxn_opcodes_h_l2732_c11_fafe_right,
BIN_OP_EQ_uxn_opcodes_h_l2732_c11_fafe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_c424
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_c424 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_c424_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_c424_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_c424_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_c424_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_5637
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_5637 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_5637_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_5637_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_5637_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_5637_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2732_c7_f6bb
opc_result_MUX_uxn_opcodes_h_l2732_c7_f6bb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2732_c7_f6bb_cond,
opc_result_MUX_uxn_opcodes_h_l2732_c7_f6bb_iftrue,
opc_result_MUX_uxn_opcodes_h_l2732_c7_f6bb_iffalse,
opc_result_MUX_uxn_opcodes_h_l2732_c7_f6bb_return_output);

-- nip2_uxn_opcodes_h_l2732_c41_f77a
nip2_uxn_opcodes_h_l2732_c41_f77a : entity work.nip2_0CLK_9a874500 port map (
clk,
nip2_uxn_opcodes_h_l2732_c41_f77a_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l2732_c41_f77a_phase,
nip2_uxn_opcodes_h_l2732_c41_f77a_ins,
nip2_uxn_opcodes_h_l2732_c41_f77a_previous_stack_read,
nip2_uxn_opcodes_h_l2732_c41_f77a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2733_c11_e808
BIN_OP_EQ_uxn_opcodes_h_l2733_c11_e808 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2733_c11_e808_left,
BIN_OP_EQ_uxn_opcodes_h_l2733_c11_e808_right,
BIN_OP_EQ_uxn_opcodes_h_l2733_c11_e808_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_bc11
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_bc11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_bc11_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_bc11_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_bc11_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_bc11_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_9913
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_9913 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_9913_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_9913_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_9913_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_9913_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2733_c7_5637
opc_result_MUX_uxn_opcodes_h_l2733_c7_5637 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2733_c7_5637_cond,
opc_result_MUX_uxn_opcodes_h_l2733_c7_5637_iftrue,
opc_result_MUX_uxn_opcodes_h_l2733_c7_5637_iffalse,
opc_result_MUX_uxn_opcodes_h_l2733_c7_5637_return_output);

-- swp_uxn_opcodes_h_l2733_c41_8d73
swp_uxn_opcodes_h_l2733_c41_8d73 : entity work.swp_0CLK_faaf4b1a port map (
clk,
swp_uxn_opcodes_h_l2733_c41_8d73_CLOCK_ENABLE,
swp_uxn_opcodes_h_l2733_c41_8d73_phase,
swp_uxn_opcodes_h_l2733_c41_8d73_ins,
swp_uxn_opcodes_h_l2733_c41_8d73_previous_stack_read,
swp_uxn_opcodes_h_l2733_c41_8d73_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ac0e
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ac0e : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ac0e_left,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ac0e_right,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ac0e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_4713
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_4713 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_4713_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_4713_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_4713_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_4713_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_9222
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_9222 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_9222_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_9222_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_9222_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_9222_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2734_c7_9913
opc_result_MUX_uxn_opcodes_h_l2734_c7_9913 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2734_c7_9913_cond,
opc_result_MUX_uxn_opcodes_h_l2734_c7_9913_iftrue,
opc_result_MUX_uxn_opcodes_h_l2734_c7_9913_iffalse,
opc_result_MUX_uxn_opcodes_h_l2734_c7_9913_return_output);

-- swp2_uxn_opcodes_h_l2734_c41_d5f8
swp2_uxn_opcodes_h_l2734_c41_d5f8 : entity work.swp2_0CLK_e768ce5a port map (
clk,
swp2_uxn_opcodes_h_l2734_c41_d5f8_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l2734_c41_d5f8_phase,
swp2_uxn_opcodes_h_l2734_c41_d5f8_ins,
swp2_uxn_opcodes_h_l2734_c41_d5f8_previous_stack_read,
swp2_uxn_opcodes_h_l2734_c41_d5f8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2735_c11_a0fe
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_a0fe : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_a0fe_left,
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_a0fe_right,
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_a0fe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_be25
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_be25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_be25_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_be25_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_be25_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_be25_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_c9d1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_c9d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_c9d1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_c9d1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_c9d1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_c9d1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2735_c7_9222
opc_result_MUX_uxn_opcodes_h_l2735_c7_9222 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2735_c7_9222_cond,
opc_result_MUX_uxn_opcodes_h_l2735_c7_9222_iftrue,
opc_result_MUX_uxn_opcodes_h_l2735_c7_9222_iffalse,
opc_result_MUX_uxn_opcodes_h_l2735_c7_9222_return_output);

-- rot_uxn_opcodes_h_l2735_c41_e9ea
rot_uxn_opcodes_h_l2735_c41_e9ea : entity work.rot_0CLK_97e5913d port map (
clk,
rot_uxn_opcodes_h_l2735_c41_e9ea_CLOCK_ENABLE,
rot_uxn_opcodes_h_l2735_c41_e9ea_phase,
rot_uxn_opcodes_h_l2735_c41_e9ea_ins,
rot_uxn_opcodes_h_l2735_c41_e9ea_previous_stack_read,
rot_uxn_opcodes_h_l2735_c41_e9ea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2736_c11_8aa1
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_8aa1 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_8aa1_left,
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_8aa1_right,
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_8aa1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_ef8c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_ef8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_ef8c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_ef8c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_ef8c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_ef8c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5747
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5747 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5747_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5747_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5747_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5747_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2736_c7_c9d1
opc_result_MUX_uxn_opcodes_h_l2736_c7_c9d1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2736_c7_c9d1_cond,
opc_result_MUX_uxn_opcodes_h_l2736_c7_c9d1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2736_c7_c9d1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2736_c7_c9d1_return_output);

-- rot2_uxn_opcodes_h_l2736_c41_5e8a
rot2_uxn_opcodes_h_l2736_c41_5e8a : entity work.rot2_0CLK_ee402a1b port map (
clk,
rot2_uxn_opcodes_h_l2736_c41_5e8a_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l2736_c41_5e8a_phase,
rot2_uxn_opcodes_h_l2736_c41_5e8a_ins,
rot2_uxn_opcodes_h_l2736_c41_5e8a_previous_stack_read,
rot2_uxn_opcodes_h_l2736_c41_5e8a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2737_c11_5f86
BIN_OP_EQ_uxn_opcodes_h_l2737_c11_5f86 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2737_c11_5f86_left,
BIN_OP_EQ_uxn_opcodes_h_l2737_c11_5f86_right,
BIN_OP_EQ_uxn_opcodes_h_l2737_c11_5f86_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_55f3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_55f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_55f3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_55f3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_55f3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_55f3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_de36
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_de36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_de36_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_de36_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_de36_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_de36_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2737_c7_5747
opc_result_MUX_uxn_opcodes_h_l2737_c7_5747 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2737_c7_5747_cond,
opc_result_MUX_uxn_opcodes_h_l2737_c7_5747_iftrue,
opc_result_MUX_uxn_opcodes_h_l2737_c7_5747_iffalse,
opc_result_MUX_uxn_opcodes_h_l2737_c7_5747_return_output);

-- dup_uxn_opcodes_h_l2737_c41_3be7
dup_uxn_opcodes_h_l2737_c41_3be7 : entity work.dup_0CLK_6be78140 port map (
clk,
dup_uxn_opcodes_h_l2737_c41_3be7_CLOCK_ENABLE,
dup_uxn_opcodes_h_l2737_c41_3be7_phase,
dup_uxn_opcodes_h_l2737_c41_3be7_ins,
dup_uxn_opcodes_h_l2737_c41_3be7_previous_stack_read,
dup_uxn_opcodes_h_l2737_c41_3be7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7149
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7149 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7149_left,
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7149_right,
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7149_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_2997
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_2997 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_2997_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_2997_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_2997_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_2997_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_5f2f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_5f2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_5f2f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_5f2f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_5f2f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_5f2f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2738_c7_de36
opc_result_MUX_uxn_opcodes_h_l2738_c7_de36 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2738_c7_de36_cond,
opc_result_MUX_uxn_opcodes_h_l2738_c7_de36_iftrue,
opc_result_MUX_uxn_opcodes_h_l2738_c7_de36_iffalse,
opc_result_MUX_uxn_opcodes_h_l2738_c7_de36_return_output);

-- dup2_uxn_opcodes_h_l2738_c41_aabb
dup2_uxn_opcodes_h_l2738_c41_aabb : entity work.dup2_0CLK_49f2c137 port map (
clk,
dup2_uxn_opcodes_h_l2738_c41_aabb_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l2738_c41_aabb_phase,
dup2_uxn_opcodes_h_l2738_c41_aabb_ins,
dup2_uxn_opcodes_h_l2738_c41_aabb_previous_stack_read,
dup2_uxn_opcodes_h_l2738_c41_aabb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2739_c11_22ca
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_22ca : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_22ca_left,
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_22ca_right,
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_22ca_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_4560
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_4560 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_4560_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_4560_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_4560_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_4560_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_019a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_019a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_019a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_019a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_019a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_019a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2739_c7_5f2f
opc_result_MUX_uxn_opcodes_h_l2739_c7_5f2f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2739_c7_5f2f_cond,
opc_result_MUX_uxn_opcodes_h_l2739_c7_5f2f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2739_c7_5f2f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2739_c7_5f2f_return_output);

-- ovr_uxn_opcodes_h_l2739_c41_d2de
ovr_uxn_opcodes_h_l2739_c41_d2de : entity work.ovr_0CLK_6d7675a8 port map (
clk,
ovr_uxn_opcodes_h_l2739_c41_d2de_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l2739_c41_d2de_phase,
ovr_uxn_opcodes_h_l2739_c41_d2de_ins,
ovr_uxn_opcodes_h_l2739_c41_d2de_previous_stack_read,
ovr_uxn_opcodes_h_l2739_c41_d2de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e27e
BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e27e : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e27e_left,
BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e27e_right,
BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e27e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_105b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_105b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_105b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_105b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_105b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_105b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_7319
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_7319 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_7319_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_7319_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_7319_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_7319_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2740_c7_019a
opc_result_MUX_uxn_opcodes_h_l2740_c7_019a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2740_c7_019a_cond,
opc_result_MUX_uxn_opcodes_h_l2740_c7_019a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2740_c7_019a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2740_c7_019a_return_output);

-- ovr2_uxn_opcodes_h_l2740_c41_b517
ovr2_uxn_opcodes_h_l2740_c41_b517 : entity work.ovr2_0CLK_946b5f6a port map (
clk,
ovr2_uxn_opcodes_h_l2740_c41_b517_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l2740_c41_b517_phase,
ovr2_uxn_opcodes_h_l2740_c41_b517_ins,
ovr2_uxn_opcodes_h_l2740_c41_b517_previous_stack_read,
ovr2_uxn_opcodes_h_l2740_c41_b517_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2741_c11_7a1b
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_7a1b : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_7a1b_left,
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_7a1b_right,
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_7a1b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_d3e4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_d3e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_d3e4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_d3e4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_d3e4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_d3e4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5e67
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5e67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5e67_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5e67_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5e67_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5e67_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2741_c7_7319
opc_result_MUX_uxn_opcodes_h_l2741_c7_7319 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2741_c7_7319_cond,
opc_result_MUX_uxn_opcodes_h_l2741_c7_7319_iftrue,
opc_result_MUX_uxn_opcodes_h_l2741_c7_7319_iffalse,
opc_result_MUX_uxn_opcodes_h_l2741_c7_7319_return_output);

-- equ_uxn_opcodes_h_l2741_c41_d8da
equ_uxn_opcodes_h_l2741_c41_d8da : entity work.equ_0CLK_85d5529e port map (
clk,
equ_uxn_opcodes_h_l2741_c41_d8da_CLOCK_ENABLE,
equ_uxn_opcodes_h_l2741_c41_d8da_phase,
equ_uxn_opcodes_h_l2741_c41_d8da_ins,
equ_uxn_opcodes_h_l2741_c41_d8da_previous_stack_read,
equ_uxn_opcodes_h_l2741_c41_d8da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6413
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6413 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6413_left,
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6413_right,
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6413_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_0c31
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_0c31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_0c31_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_0c31_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_0c31_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_0c31_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_e6ca
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_e6ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_e6ca_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_e6ca_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_e6ca_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_e6ca_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2742_c7_5e67
opc_result_MUX_uxn_opcodes_h_l2742_c7_5e67 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2742_c7_5e67_cond,
opc_result_MUX_uxn_opcodes_h_l2742_c7_5e67_iftrue,
opc_result_MUX_uxn_opcodes_h_l2742_c7_5e67_iffalse,
opc_result_MUX_uxn_opcodes_h_l2742_c7_5e67_return_output);

-- equ2_uxn_opcodes_h_l2742_c41_adc2
equ2_uxn_opcodes_h_l2742_c41_adc2 : entity work.equ2_0CLK_302e9520 port map (
clk,
equ2_uxn_opcodes_h_l2742_c41_adc2_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l2742_c41_adc2_phase,
equ2_uxn_opcodes_h_l2742_c41_adc2_ins,
equ2_uxn_opcodes_h_l2742_c41_adc2_previous_stack_read,
equ2_uxn_opcodes_h_l2742_c41_adc2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2743_c11_0609
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_0609 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_0609_left,
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_0609_right,
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_0609_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_04c1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_04c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_04c1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_04c1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_04c1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_04c1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_a164
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_a164 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_a164_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_a164_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_a164_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_a164_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2743_c7_e6ca
opc_result_MUX_uxn_opcodes_h_l2743_c7_e6ca : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2743_c7_e6ca_cond,
opc_result_MUX_uxn_opcodes_h_l2743_c7_e6ca_iftrue,
opc_result_MUX_uxn_opcodes_h_l2743_c7_e6ca_iffalse,
opc_result_MUX_uxn_opcodes_h_l2743_c7_e6ca_return_output);

-- neq_uxn_opcodes_h_l2743_c41_07e5
neq_uxn_opcodes_h_l2743_c41_07e5 : entity work.neq_0CLK_85d5529e port map (
clk,
neq_uxn_opcodes_h_l2743_c41_07e5_CLOCK_ENABLE,
neq_uxn_opcodes_h_l2743_c41_07e5_phase,
neq_uxn_opcodes_h_l2743_c41_07e5_ins,
neq_uxn_opcodes_h_l2743_c41_07e5_previous_stack_read,
neq_uxn_opcodes_h_l2743_c41_07e5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2744_c11_a896
BIN_OP_EQ_uxn_opcodes_h_l2744_c11_a896 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2744_c11_a896_left,
BIN_OP_EQ_uxn_opcodes_h_l2744_c11_a896_right,
BIN_OP_EQ_uxn_opcodes_h_l2744_c11_a896_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_7d78
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_7d78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_7d78_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_7d78_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_7d78_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_7d78_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_b420
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_b420 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_b420_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_b420_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_b420_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_b420_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2744_c7_a164
opc_result_MUX_uxn_opcodes_h_l2744_c7_a164 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2744_c7_a164_cond,
opc_result_MUX_uxn_opcodes_h_l2744_c7_a164_iftrue,
opc_result_MUX_uxn_opcodes_h_l2744_c7_a164_iffalse,
opc_result_MUX_uxn_opcodes_h_l2744_c7_a164_return_output);

-- neq2_uxn_opcodes_h_l2744_c41_585e
neq2_uxn_opcodes_h_l2744_c41_585e : entity work.neq2_0CLK_302e9520 port map (
clk,
neq2_uxn_opcodes_h_l2744_c41_585e_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l2744_c41_585e_phase,
neq2_uxn_opcodes_h_l2744_c41_585e_ins,
neq2_uxn_opcodes_h_l2744_c41_585e_previous_stack_read,
neq2_uxn_opcodes_h_l2744_c41_585e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2745_c11_1bb8
BIN_OP_EQ_uxn_opcodes_h_l2745_c11_1bb8 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2745_c11_1bb8_left,
BIN_OP_EQ_uxn_opcodes_h_l2745_c11_1bb8_right,
BIN_OP_EQ_uxn_opcodes_h_l2745_c11_1bb8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_5f12
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_5f12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_5f12_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_5f12_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_5f12_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_5f12_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_d2e2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_d2e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_d2e2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_d2e2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_d2e2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_d2e2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2745_c7_b420
opc_result_MUX_uxn_opcodes_h_l2745_c7_b420 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2745_c7_b420_cond,
opc_result_MUX_uxn_opcodes_h_l2745_c7_b420_iftrue,
opc_result_MUX_uxn_opcodes_h_l2745_c7_b420_iffalse,
opc_result_MUX_uxn_opcodes_h_l2745_c7_b420_return_output);

-- gth_uxn_opcodes_h_l2745_c41_19d9
gth_uxn_opcodes_h_l2745_c41_19d9 : entity work.gth_0CLK_85d5529e port map (
clk,
gth_uxn_opcodes_h_l2745_c41_19d9_CLOCK_ENABLE,
gth_uxn_opcodes_h_l2745_c41_19d9_phase,
gth_uxn_opcodes_h_l2745_c41_19d9_ins,
gth_uxn_opcodes_h_l2745_c41_19d9_previous_stack_read,
gth_uxn_opcodes_h_l2745_c41_19d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2746_c11_6138
BIN_OP_EQ_uxn_opcodes_h_l2746_c11_6138 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2746_c11_6138_left,
BIN_OP_EQ_uxn_opcodes_h_l2746_c11_6138_right,
BIN_OP_EQ_uxn_opcodes_h_l2746_c11_6138_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_f622
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_f622 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_f622_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_f622_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_f622_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_f622_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_f293
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_f293 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_f293_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_f293_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_f293_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_f293_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2746_c7_d2e2
opc_result_MUX_uxn_opcodes_h_l2746_c7_d2e2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2746_c7_d2e2_cond,
opc_result_MUX_uxn_opcodes_h_l2746_c7_d2e2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2746_c7_d2e2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2746_c7_d2e2_return_output);

-- gth2_uxn_opcodes_h_l2746_c41_ee3e
gth2_uxn_opcodes_h_l2746_c41_ee3e : entity work.gth2_0CLK_302e9520 port map (
clk,
gth2_uxn_opcodes_h_l2746_c41_ee3e_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l2746_c41_ee3e_phase,
gth2_uxn_opcodes_h_l2746_c41_ee3e_ins,
gth2_uxn_opcodes_h_l2746_c41_ee3e_previous_stack_read,
gth2_uxn_opcodes_h_l2746_c41_ee3e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2747_c11_514e
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_514e : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_514e_left,
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_514e_right,
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_514e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_14a3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_14a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_14a3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_14a3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_14a3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_14a3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_d33a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_d33a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_d33a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_d33a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_d33a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_d33a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2747_c7_f293
opc_result_MUX_uxn_opcodes_h_l2747_c7_f293 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2747_c7_f293_cond,
opc_result_MUX_uxn_opcodes_h_l2747_c7_f293_iftrue,
opc_result_MUX_uxn_opcodes_h_l2747_c7_f293_iffalse,
opc_result_MUX_uxn_opcodes_h_l2747_c7_f293_return_output);

-- lth_uxn_opcodes_h_l2747_c41_6584
lth_uxn_opcodes_h_l2747_c41_6584 : entity work.lth_0CLK_85d5529e port map (
clk,
lth_uxn_opcodes_h_l2747_c41_6584_CLOCK_ENABLE,
lth_uxn_opcodes_h_l2747_c41_6584_phase,
lth_uxn_opcodes_h_l2747_c41_6584_ins,
lth_uxn_opcodes_h_l2747_c41_6584_previous_stack_read,
lth_uxn_opcodes_h_l2747_c41_6584_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2748_c11_09e7
BIN_OP_EQ_uxn_opcodes_h_l2748_c11_09e7 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2748_c11_09e7_left,
BIN_OP_EQ_uxn_opcodes_h_l2748_c11_09e7_right,
BIN_OP_EQ_uxn_opcodes_h_l2748_c11_09e7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_73f9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_73f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_73f9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_73f9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_73f9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_73f9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_6263
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_6263 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_6263_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_6263_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_6263_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_6263_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2748_c7_d33a
opc_result_MUX_uxn_opcodes_h_l2748_c7_d33a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2748_c7_d33a_cond,
opc_result_MUX_uxn_opcodes_h_l2748_c7_d33a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2748_c7_d33a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2748_c7_d33a_return_output);

-- lth2_uxn_opcodes_h_l2748_c41_01ea
lth2_uxn_opcodes_h_l2748_c41_01ea : entity work.lth2_0CLK_302e9520 port map (
clk,
lth2_uxn_opcodes_h_l2748_c41_01ea_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l2748_c41_01ea_phase,
lth2_uxn_opcodes_h_l2748_c41_01ea_ins,
lth2_uxn_opcodes_h_l2748_c41_01ea_previous_stack_read,
lth2_uxn_opcodes_h_l2748_c41_01ea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2749_c11_f60b
BIN_OP_EQ_uxn_opcodes_h_l2749_c11_f60b : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2749_c11_f60b_left,
BIN_OP_EQ_uxn_opcodes_h_l2749_c11_f60b_right,
BIN_OP_EQ_uxn_opcodes_h_l2749_c11_f60b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_4674
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_4674 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_4674_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_4674_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_4674_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_4674_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_5aec
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_5aec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_5aec_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_5aec_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_5aec_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_5aec_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2749_c7_6263
opc_result_MUX_uxn_opcodes_h_l2749_c7_6263 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2749_c7_6263_cond,
opc_result_MUX_uxn_opcodes_h_l2749_c7_6263_iftrue,
opc_result_MUX_uxn_opcodes_h_l2749_c7_6263_iffalse,
opc_result_MUX_uxn_opcodes_h_l2749_c7_6263_return_output);

-- jmp_uxn_opcodes_h_l2749_c41_e115
jmp_uxn_opcodes_h_l2749_c41_e115 : entity work.jmp_0CLK_b7103d16 port map (
clk,
jmp_uxn_opcodes_h_l2749_c41_e115_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l2749_c41_e115_phase,
jmp_uxn_opcodes_h_l2749_c41_e115_ins,
jmp_uxn_opcodes_h_l2749_c41_e115_pc,
jmp_uxn_opcodes_h_l2749_c41_e115_previous_stack_read,
jmp_uxn_opcodes_h_l2749_c41_e115_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2750_c11_2f39
BIN_OP_EQ_uxn_opcodes_h_l2750_c11_2f39 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2750_c11_2f39_left,
BIN_OP_EQ_uxn_opcodes_h_l2750_c11_2f39_right,
BIN_OP_EQ_uxn_opcodes_h_l2750_c11_2f39_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_473e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_473e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_473e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_473e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_473e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_473e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_bd9c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_bd9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_bd9c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_bd9c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_bd9c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_bd9c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2750_c7_5aec
opc_result_MUX_uxn_opcodes_h_l2750_c7_5aec : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2750_c7_5aec_cond,
opc_result_MUX_uxn_opcodes_h_l2750_c7_5aec_iftrue,
opc_result_MUX_uxn_opcodes_h_l2750_c7_5aec_iffalse,
opc_result_MUX_uxn_opcodes_h_l2750_c7_5aec_return_output);

-- jmp2_uxn_opcodes_h_l2750_c41_dabe
jmp2_uxn_opcodes_h_l2750_c41_dabe : entity work.jmp2_0CLK_0b1ee796 port map (
clk,
jmp2_uxn_opcodes_h_l2750_c41_dabe_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l2750_c41_dabe_phase,
jmp2_uxn_opcodes_h_l2750_c41_dabe_ins,
jmp2_uxn_opcodes_h_l2750_c41_dabe_previous_stack_read,
jmp2_uxn_opcodes_h_l2750_c41_dabe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2751_c11_a76c
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_a76c : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_a76c_left,
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_a76c_right,
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_a76c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_d9d4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_d9d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_d9d4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_d9d4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_d9d4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_d9d4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_6f4f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_6f4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_6f4f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_6f4f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_6f4f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_6f4f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2751_c7_bd9c
opc_result_MUX_uxn_opcodes_h_l2751_c7_bd9c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2751_c7_bd9c_cond,
opc_result_MUX_uxn_opcodes_h_l2751_c7_bd9c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2751_c7_bd9c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2751_c7_bd9c_return_output);

-- jcn_uxn_opcodes_h_l2751_c41_f92d
jcn_uxn_opcodes_h_l2751_c41_f92d : entity work.jcn_0CLK_85d5529e port map (
clk,
jcn_uxn_opcodes_h_l2751_c41_f92d_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l2751_c41_f92d_phase,
jcn_uxn_opcodes_h_l2751_c41_f92d_ins,
jcn_uxn_opcodes_h_l2751_c41_f92d_pc,
jcn_uxn_opcodes_h_l2751_c41_f92d_previous_stack_read,
jcn_uxn_opcodes_h_l2751_c41_f92d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2752_c11_bf54
BIN_OP_EQ_uxn_opcodes_h_l2752_c11_bf54 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2752_c11_bf54_left,
BIN_OP_EQ_uxn_opcodes_h_l2752_c11_bf54_right,
BIN_OP_EQ_uxn_opcodes_h_l2752_c11_bf54_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_dbbc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_dbbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_dbbc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_dbbc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_dbbc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_dbbc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_7348
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_7348 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_7348_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_7348_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_7348_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_7348_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2752_c7_6f4f
opc_result_MUX_uxn_opcodes_h_l2752_c7_6f4f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2752_c7_6f4f_cond,
opc_result_MUX_uxn_opcodes_h_l2752_c7_6f4f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2752_c7_6f4f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2752_c7_6f4f_return_output);

-- jcn2_uxn_opcodes_h_l2752_c41_f5ce
jcn2_uxn_opcodes_h_l2752_c41_f5ce : entity work.jcn2_0CLK_0226dad5 port map (
clk,
jcn2_uxn_opcodes_h_l2752_c41_f5ce_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l2752_c41_f5ce_phase,
jcn2_uxn_opcodes_h_l2752_c41_f5ce_ins,
jcn2_uxn_opcodes_h_l2752_c41_f5ce_previous_stack_read,
jcn2_uxn_opcodes_h_l2752_c41_f5ce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2753_c11_78a8
BIN_OP_EQ_uxn_opcodes_h_l2753_c11_78a8 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2753_c11_78a8_left,
BIN_OP_EQ_uxn_opcodes_h_l2753_c11_78a8_right,
BIN_OP_EQ_uxn_opcodes_h_l2753_c11_78a8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_ebac
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_ebac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_ebac_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_ebac_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_ebac_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_ebac_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_b6fe
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_b6fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_b6fe_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_b6fe_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_b6fe_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_b6fe_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2753_c7_7348
opc_result_MUX_uxn_opcodes_h_l2753_c7_7348 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2753_c7_7348_cond,
opc_result_MUX_uxn_opcodes_h_l2753_c7_7348_iftrue,
opc_result_MUX_uxn_opcodes_h_l2753_c7_7348_iffalse,
opc_result_MUX_uxn_opcodes_h_l2753_c7_7348_return_output);

-- jsr_uxn_opcodes_h_l2753_c41_be6e
jsr_uxn_opcodes_h_l2753_c41_be6e : entity work.jsr_0CLK_4f993427 port map (
clk,
jsr_uxn_opcodes_h_l2753_c41_be6e_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l2753_c41_be6e_phase,
jsr_uxn_opcodes_h_l2753_c41_be6e_ins,
jsr_uxn_opcodes_h_l2753_c41_be6e_pc,
jsr_uxn_opcodes_h_l2753_c41_be6e_previous_stack_read,
jsr_uxn_opcodes_h_l2753_c41_be6e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2754_c11_84dd
BIN_OP_EQ_uxn_opcodes_h_l2754_c11_84dd : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2754_c11_84dd_left,
BIN_OP_EQ_uxn_opcodes_h_l2754_c11_84dd_right,
BIN_OP_EQ_uxn_opcodes_h_l2754_c11_84dd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_f981
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_f981 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_f981_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_f981_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_f981_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_f981_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_abc1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_abc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_abc1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_abc1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_abc1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_abc1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2754_c7_b6fe
opc_result_MUX_uxn_opcodes_h_l2754_c7_b6fe : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2754_c7_b6fe_cond,
opc_result_MUX_uxn_opcodes_h_l2754_c7_b6fe_iftrue,
opc_result_MUX_uxn_opcodes_h_l2754_c7_b6fe_iffalse,
opc_result_MUX_uxn_opcodes_h_l2754_c7_b6fe_return_output);

-- jsr2_uxn_opcodes_h_l2754_c41_daf7
jsr2_uxn_opcodes_h_l2754_c41_daf7 : entity work.jsr2_0CLK_9728fdff port map (
clk,
jsr2_uxn_opcodes_h_l2754_c41_daf7_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l2754_c41_daf7_phase,
jsr2_uxn_opcodes_h_l2754_c41_daf7_ins,
jsr2_uxn_opcodes_h_l2754_c41_daf7_pc,
jsr2_uxn_opcodes_h_l2754_c41_daf7_previous_stack_read,
jsr2_uxn_opcodes_h_l2754_c41_daf7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2755_c11_5c1a
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_5c1a : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_5c1a_left,
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_5c1a_right,
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_5c1a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_3d97
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_3d97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_3d97_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_3d97_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_3d97_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_3d97_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_a1cb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_a1cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_a1cb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_a1cb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_a1cb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_a1cb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2755_c7_abc1
opc_result_MUX_uxn_opcodes_h_l2755_c7_abc1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2755_c7_abc1_cond,
opc_result_MUX_uxn_opcodes_h_l2755_c7_abc1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2755_c7_abc1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2755_c7_abc1_return_output);

-- sth_uxn_opcodes_h_l2755_c41_5d99
sth_uxn_opcodes_h_l2755_c41_5d99 : entity work.sth_0CLK_85d5529e port map (
clk,
sth_uxn_opcodes_h_l2755_c41_5d99_CLOCK_ENABLE,
sth_uxn_opcodes_h_l2755_c41_5d99_phase,
sth_uxn_opcodes_h_l2755_c41_5d99_ins,
sth_uxn_opcodes_h_l2755_c41_5d99_previous_stack_read,
sth_uxn_opcodes_h_l2755_c41_5d99_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2756_c11_5a5c
BIN_OP_EQ_uxn_opcodes_h_l2756_c11_5a5c : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2756_c11_5a5c_left,
BIN_OP_EQ_uxn_opcodes_h_l2756_c11_5a5c_right,
BIN_OP_EQ_uxn_opcodes_h_l2756_c11_5a5c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_1fc7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_1fc7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_1fc7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_1fc7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_1fc7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_1fc7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_3c85
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_3c85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_3c85_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_3c85_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_3c85_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_3c85_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2756_c7_a1cb
opc_result_MUX_uxn_opcodes_h_l2756_c7_a1cb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2756_c7_a1cb_cond,
opc_result_MUX_uxn_opcodes_h_l2756_c7_a1cb_iftrue,
opc_result_MUX_uxn_opcodes_h_l2756_c7_a1cb_iffalse,
opc_result_MUX_uxn_opcodes_h_l2756_c7_a1cb_return_output);

-- sth2_uxn_opcodes_h_l2756_c41_0d9b
sth2_uxn_opcodes_h_l2756_c41_0d9b : entity work.sth2_0CLK_302e9520 port map (
clk,
sth2_uxn_opcodes_h_l2756_c41_0d9b_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l2756_c41_0d9b_phase,
sth2_uxn_opcodes_h_l2756_c41_0d9b_ins,
sth2_uxn_opcodes_h_l2756_c41_0d9b_previous_stack_read,
sth2_uxn_opcodes_h_l2756_c41_0d9b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2757_c11_1878
BIN_OP_EQ_uxn_opcodes_h_l2757_c11_1878 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2757_c11_1878_left,
BIN_OP_EQ_uxn_opcodes_h_l2757_c11_1878_right,
BIN_OP_EQ_uxn_opcodes_h_l2757_c11_1878_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_4ff3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_4ff3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_4ff3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_4ff3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_4ff3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_4ff3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_d95e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_d95e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_d95e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_d95e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_d95e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_d95e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2757_c7_3c85
opc_result_MUX_uxn_opcodes_h_l2757_c7_3c85 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2757_c7_3c85_cond,
opc_result_MUX_uxn_opcodes_h_l2757_c7_3c85_iftrue,
opc_result_MUX_uxn_opcodes_h_l2757_c7_3c85_iffalse,
opc_result_MUX_uxn_opcodes_h_l2757_c7_3c85_return_output);

-- ldz_uxn_opcodes_h_l2757_c41_b38e
ldz_uxn_opcodes_h_l2757_c41_b38e : entity work.ldz_0CLK_f74745d5 port map (
clk,
ldz_uxn_opcodes_h_l2757_c41_b38e_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l2757_c41_b38e_phase,
ldz_uxn_opcodes_h_l2757_c41_b38e_ins,
ldz_uxn_opcodes_h_l2757_c41_b38e_previous_stack_read,
ldz_uxn_opcodes_h_l2757_c41_b38e_previous_ram_read,
ldz_uxn_opcodes_h_l2757_c41_b38e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2758_c11_65f0
BIN_OP_EQ_uxn_opcodes_h_l2758_c11_65f0 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2758_c11_65f0_left,
BIN_OP_EQ_uxn_opcodes_h_l2758_c11_65f0_right,
BIN_OP_EQ_uxn_opcodes_h_l2758_c11_65f0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_8d5d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_8d5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_8d5d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_8d5d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_8d5d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_8d5d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1288
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1288 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1288_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1288_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1288_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1288_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2758_c7_d95e
opc_result_MUX_uxn_opcodes_h_l2758_c7_d95e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2758_c7_d95e_cond,
opc_result_MUX_uxn_opcodes_h_l2758_c7_d95e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2758_c7_d95e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2758_c7_d95e_return_output);

-- ldz2_uxn_opcodes_h_l2758_c41_6f6e
ldz2_uxn_opcodes_h_l2758_c41_6f6e : entity work.ldz2_0CLK_d662d237 port map (
clk,
ldz2_uxn_opcodes_h_l2758_c41_6f6e_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l2758_c41_6f6e_phase,
ldz2_uxn_opcodes_h_l2758_c41_6f6e_ins,
ldz2_uxn_opcodes_h_l2758_c41_6f6e_previous_stack_read,
ldz2_uxn_opcodes_h_l2758_c41_6f6e_previous_ram_read,
ldz2_uxn_opcodes_h_l2758_c41_6f6e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2759_c11_6d13
BIN_OP_EQ_uxn_opcodes_h_l2759_c11_6d13 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2759_c11_6d13_left,
BIN_OP_EQ_uxn_opcodes_h_l2759_c11_6d13_right,
BIN_OP_EQ_uxn_opcodes_h_l2759_c11_6d13_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_73a4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_73a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_73a4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_73a4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_73a4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_73a4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_79e6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_79e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_79e6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_79e6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_79e6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_79e6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2759_c7_1288
opc_result_MUX_uxn_opcodes_h_l2759_c7_1288 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2759_c7_1288_cond,
opc_result_MUX_uxn_opcodes_h_l2759_c7_1288_iftrue,
opc_result_MUX_uxn_opcodes_h_l2759_c7_1288_iffalse,
opc_result_MUX_uxn_opcodes_h_l2759_c7_1288_return_output);

-- stz_uxn_opcodes_h_l2759_c41_a8de
stz_uxn_opcodes_h_l2759_c41_a8de : entity work.stz_0CLK_ffdfe23b port map (
clk,
stz_uxn_opcodes_h_l2759_c41_a8de_CLOCK_ENABLE,
stz_uxn_opcodes_h_l2759_c41_a8de_phase,
stz_uxn_opcodes_h_l2759_c41_a8de_ins,
stz_uxn_opcodes_h_l2759_c41_a8de_previous_stack_read,
stz_uxn_opcodes_h_l2759_c41_a8de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1fde
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1fde : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1fde_left,
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1fde_right,
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1fde_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_9ffd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_9ffd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_9ffd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_9ffd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_9ffd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_9ffd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_4431
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_4431 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_4431_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_4431_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_4431_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_4431_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2760_c7_79e6
opc_result_MUX_uxn_opcodes_h_l2760_c7_79e6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2760_c7_79e6_cond,
opc_result_MUX_uxn_opcodes_h_l2760_c7_79e6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2760_c7_79e6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2760_c7_79e6_return_output);

-- stz2_uxn_opcodes_h_l2760_c41_fb87
stz2_uxn_opcodes_h_l2760_c41_fb87 : entity work.stz2_0CLK_4f993427 port map (
clk,
stz2_uxn_opcodes_h_l2760_c41_fb87_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l2760_c41_fb87_phase,
stz2_uxn_opcodes_h_l2760_c41_fb87_ins,
stz2_uxn_opcodes_h_l2760_c41_fb87_previous_stack_read,
stz2_uxn_opcodes_h_l2760_c41_fb87_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2761_c11_176d
BIN_OP_EQ_uxn_opcodes_h_l2761_c11_176d : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2761_c11_176d_left,
BIN_OP_EQ_uxn_opcodes_h_l2761_c11_176d_right,
BIN_OP_EQ_uxn_opcodes_h_l2761_c11_176d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_0a6c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_0a6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_0a6c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_0a6c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_0a6c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_0a6c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_e022
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_e022 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_e022_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_e022_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_e022_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_e022_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2761_c7_4431
opc_result_MUX_uxn_opcodes_h_l2761_c7_4431 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2761_c7_4431_cond,
opc_result_MUX_uxn_opcodes_h_l2761_c7_4431_iftrue,
opc_result_MUX_uxn_opcodes_h_l2761_c7_4431_iffalse,
opc_result_MUX_uxn_opcodes_h_l2761_c7_4431_return_output);

-- ldr_uxn_opcodes_h_l2761_c41_8783
ldr_uxn_opcodes_h_l2761_c41_8783 : entity work.ldr_0CLK_c61094da port map (
clk,
ldr_uxn_opcodes_h_l2761_c41_8783_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l2761_c41_8783_phase,
ldr_uxn_opcodes_h_l2761_c41_8783_ins,
ldr_uxn_opcodes_h_l2761_c41_8783_pc,
ldr_uxn_opcodes_h_l2761_c41_8783_previous_stack_read,
ldr_uxn_opcodes_h_l2761_c41_8783_previous_ram_read,
ldr_uxn_opcodes_h_l2761_c41_8783_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2762_c11_01d4
BIN_OP_EQ_uxn_opcodes_h_l2762_c11_01d4 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2762_c11_01d4_left,
BIN_OP_EQ_uxn_opcodes_h_l2762_c11_01d4_right,
BIN_OP_EQ_uxn_opcodes_h_l2762_c11_01d4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6150
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6150 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6150_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6150_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6150_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6150_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_b6e2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_b6e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_b6e2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_b6e2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_b6e2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_b6e2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2762_c7_e022
opc_result_MUX_uxn_opcodes_h_l2762_c7_e022 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2762_c7_e022_cond,
opc_result_MUX_uxn_opcodes_h_l2762_c7_e022_iftrue,
opc_result_MUX_uxn_opcodes_h_l2762_c7_e022_iffalse,
opc_result_MUX_uxn_opcodes_h_l2762_c7_e022_return_output);

-- ldr2_uxn_opcodes_h_l2762_c41_c2f9
ldr2_uxn_opcodes_h_l2762_c41_c2f9 : entity work.ldr2_0CLK_6193b0ef port map (
clk,
ldr2_uxn_opcodes_h_l2762_c41_c2f9_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l2762_c41_c2f9_phase,
ldr2_uxn_opcodes_h_l2762_c41_c2f9_ins,
ldr2_uxn_opcodes_h_l2762_c41_c2f9_pc,
ldr2_uxn_opcodes_h_l2762_c41_c2f9_previous_stack_read,
ldr2_uxn_opcodes_h_l2762_c41_c2f9_previous_ram_read,
ldr2_uxn_opcodes_h_l2762_c41_c2f9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2763_c11_266d
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_266d : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_266d_left,
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_266d_right,
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_266d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_838b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_838b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_838b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_838b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_838b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_838b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_5cdd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_5cdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_5cdd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_5cdd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_5cdd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_5cdd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2763_c7_b6e2
opc_result_MUX_uxn_opcodes_h_l2763_c7_b6e2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2763_c7_b6e2_cond,
opc_result_MUX_uxn_opcodes_h_l2763_c7_b6e2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2763_c7_b6e2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2763_c7_b6e2_return_output);

-- str1_uxn_opcodes_h_l2763_c41_015e
str1_uxn_opcodes_h_l2763_c41_015e : entity work.str1_0CLK_faaf4b1a port map (
clk,
str1_uxn_opcodes_h_l2763_c41_015e_CLOCK_ENABLE,
str1_uxn_opcodes_h_l2763_c41_015e_phase,
str1_uxn_opcodes_h_l2763_c41_015e_ins,
str1_uxn_opcodes_h_l2763_c41_015e_pc,
str1_uxn_opcodes_h_l2763_c41_015e_previous_stack_read,
str1_uxn_opcodes_h_l2763_c41_015e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2764_c11_b6b2
BIN_OP_EQ_uxn_opcodes_h_l2764_c11_b6b2 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2764_c11_b6b2_left,
BIN_OP_EQ_uxn_opcodes_h_l2764_c11_b6b2_right,
BIN_OP_EQ_uxn_opcodes_h_l2764_c11_b6b2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_c8be
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_c8be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_c8be_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_c8be_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_c8be_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_c8be_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_6ff0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_6ff0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_6ff0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_6ff0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_6ff0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_6ff0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2764_c7_5cdd
opc_result_MUX_uxn_opcodes_h_l2764_c7_5cdd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2764_c7_5cdd_cond,
opc_result_MUX_uxn_opcodes_h_l2764_c7_5cdd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2764_c7_5cdd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2764_c7_5cdd_return_output);

-- str2_uxn_opcodes_h_l2764_c41_bb2b
str2_uxn_opcodes_h_l2764_c41_bb2b : entity work.str2_0CLK_4f993427 port map (
clk,
str2_uxn_opcodes_h_l2764_c41_bb2b_CLOCK_ENABLE,
str2_uxn_opcodes_h_l2764_c41_bb2b_phase,
str2_uxn_opcodes_h_l2764_c41_bb2b_ins,
str2_uxn_opcodes_h_l2764_c41_bb2b_pc,
str2_uxn_opcodes_h_l2764_c41_bb2b_previous_stack_read,
str2_uxn_opcodes_h_l2764_c41_bb2b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2765_c11_a869
BIN_OP_EQ_uxn_opcodes_h_l2765_c11_a869 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2765_c11_a869_left,
BIN_OP_EQ_uxn_opcodes_h_l2765_c11_a869_right,
BIN_OP_EQ_uxn_opcodes_h_l2765_c11_a869_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_32a7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_32a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_32a7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_32a7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_32a7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_32a7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_00d4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_00d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_00d4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_00d4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_00d4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_00d4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2765_c7_6ff0
opc_result_MUX_uxn_opcodes_h_l2765_c7_6ff0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2765_c7_6ff0_cond,
opc_result_MUX_uxn_opcodes_h_l2765_c7_6ff0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2765_c7_6ff0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2765_c7_6ff0_return_output);

-- lda_uxn_opcodes_h_l2765_c41_31a1
lda_uxn_opcodes_h_l2765_c41_31a1 : entity work.lda_0CLK_dc46ab2b port map (
clk,
lda_uxn_opcodes_h_l2765_c41_31a1_CLOCK_ENABLE,
lda_uxn_opcodes_h_l2765_c41_31a1_phase,
lda_uxn_opcodes_h_l2765_c41_31a1_ins,
lda_uxn_opcodes_h_l2765_c41_31a1_previous_stack_read,
lda_uxn_opcodes_h_l2765_c41_31a1_previous_ram_read,
lda_uxn_opcodes_h_l2765_c41_31a1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2766_c11_240e
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_240e : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_240e_left,
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_240e_right,
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_240e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_3762
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_3762 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_3762_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_3762_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_3762_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_3762_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_8f80
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_8f80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_8f80_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_8f80_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_8f80_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_8f80_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2766_c7_00d4
opc_result_MUX_uxn_opcodes_h_l2766_c7_00d4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2766_c7_00d4_cond,
opc_result_MUX_uxn_opcodes_h_l2766_c7_00d4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2766_c7_00d4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2766_c7_00d4_return_output);

-- lda2_uxn_opcodes_h_l2766_c41_cd54
lda2_uxn_opcodes_h_l2766_c41_cd54 : entity work.lda2_0CLK_0d6e2712 port map (
clk,
lda2_uxn_opcodes_h_l2766_c41_cd54_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l2766_c41_cd54_phase,
lda2_uxn_opcodes_h_l2766_c41_cd54_ins,
lda2_uxn_opcodes_h_l2766_c41_cd54_previous_stack_read,
lda2_uxn_opcodes_h_l2766_c41_cd54_previous_ram_read,
lda2_uxn_opcodes_h_l2766_c41_cd54_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2767_c11_9032
BIN_OP_EQ_uxn_opcodes_h_l2767_c11_9032 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2767_c11_9032_left,
BIN_OP_EQ_uxn_opcodes_h_l2767_c11_9032_right,
BIN_OP_EQ_uxn_opcodes_h_l2767_c11_9032_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_bd7f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_bd7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_bd7f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_bd7f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_bd7f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_bd7f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_11d7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_11d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_11d7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_11d7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_11d7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_11d7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2767_c7_8f80
opc_result_MUX_uxn_opcodes_h_l2767_c7_8f80 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2767_c7_8f80_cond,
opc_result_MUX_uxn_opcodes_h_l2767_c7_8f80_iftrue,
opc_result_MUX_uxn_opcodes_h_l2767_c7_8f80_iffalse,
opc_result_MUX_uxn_opcodes_h_l2767_c7_8f80_return_output);

-- sta_uxn_opcodes_h_l2767_c41_71e6
sta_uxn_opcodes_h_l2767_c41_71e6 : entity work.sta_0CLK_03a72d0b port map (
clk,
sta_uxn_opcodes_h_l2767_c41_71e6_CLOCK_ENABLE,
sta_uxn_opcodes_h_l2767_c41_71e6_phase,
sta_uxn_opcodes_h_l2767_c41_71e6_ins,
sta_uxn_opcodes_h_l2767_c41_71e6_previous_stack_read,
sta_uxn_opcodes_h_l2767_c41_71e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2768_c11_f613
BIN_OP_EQ_uxn_opcodes_h_l2768_c11_f613 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2768_c11_f613_left,
BIN_OP_EQ_uxn_opcodes_h_l2768_c11_f613_right,
BIN_OP_EQ_uxn_opcodes_h_l2768_c11_f613_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d8b2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d8b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d8b2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d8b2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d8b2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d8b2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_78bb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_78bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_78bb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_78bb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_78bb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_78bb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2768_c7_11d7
opc_result_MUX_uxn_opcodes_h_l2768_c7_11d7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2768_c7_11d7_cond,
opc_result_MUX_uxn_opcodes_h_l2768_c7_11d7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2768_c7_11d7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2768_c7_11d7_return_output);

-- sta2_uxn_opcodes_h_l2768_c41_4b8d
sta2_uxn_opcodes_h_l2768_c41_4b8d : entity work.sta2_0CLK_7d7b1f8b port map (
clk,
sta2_uxn_opcodes_h_l2768_c41_4b8d_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l2768_c41_4b8d_phase,
sta2_uxn_opcodes_h_l2768_c41_4b8d_ins,
sta2_uxn_opcodes_h_l2768_c41_4b8d_previous_stack_read,
sta2_uxn_opcodes_h_l2768_c41_4b8d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2769_c11_d653
BIN_OP_EQ_uxn_opcodes_h_l2769_c11_d653 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2769_c11_d653_left,
BIN_OP_EQ_uxn_opcodes_h_l2769_c11_d653_right,
BIN_OP_EQ_uxn_opcodes_h_l2769_c11_d653_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7e55
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7e55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7e55_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7e55_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7e55_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7e55_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_7171
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_7171 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_7171_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_7171_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_7171_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_7171_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2769_c7_78bb
opc_result_MUX_uxn_opcodes_h_l2769_c7_78bb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2769_c7_78bb_cond,
opc_result_MUX_uxn_opcodes_h_l2769_c7_78bb_iftrue,
opc_result_MUX_uxn_opcodes_h_l2769_c7_78bb_iffalse,
opc_result_MUX_uxn_opcodes_h_l2769_c7_78bb_return_output);

-- dei_uxn_opcodes_h_l2769_c41_9a0e
dei_uxn_opcodes_h_l2769_c41_9a0e : entity work.dei_0CLK_1826c28e port map (
clk,
dei_uxn_opcodes_h_l2769_c41_9a0e_CLOCK_ENABLE,
dei_uxn_opcodes_h_l2769_c41_9a0e_phase,
dei_uxn_opcodes_h_l2769_c41_9a0e_ins,
dei_uxn_opcodes_h_l2769_c41_9a0e_previous_stack_read,
dei_uxn_opcodes_h_l2769_c41_9a0e_previous_device_ram_read,
dei_uxn_opcodes_h_l2769_c41_9a0e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2770_c11_cba2
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_cba2 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_cba2_left,
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_cba2_right,
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_cba2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_994a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_994a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_994a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_994a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_994a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_994a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_19ef
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_19ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_19ef_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_19ef_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_19ef_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_19ef_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2770_c7_7171
opc_result_MUX_uxn_opcodes_h_l2770_c7_7171 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2770_c7_7171_cond,
opc_result_MUX_uxn_opcodes_h_l2770_c7_7171_iftrue,
opc_result_MUX_uxn_opcodes_h_l2770_c7_7171_iffalse,
opc_result_MUX_uxn_opcodes_h_l2770_c7_7171_return_output);

-- dei2_uxn_opcodes_h_l2770_c41_d02e
dei2_uxn_opcodes_h_l2770_c41_d02e : entity work.dei2_0CLK_82b906b0 port map (
clk,
dei2_uxn_opcodes_h_l2770_c41_d02e_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l2770_c41_d02e_phase,
dei2_uxn_opcodes_h_l2770_c41_d02e_ins,
dei2_uxn_opcodes_h_l2770_c41_d02e_previous_stack_read,
dei2_uxn_opcodes_h_l2770_c41_d02e_previous_device_ram_read,
dei2_uxn_opcodes_h_l2770_c41_d02e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2771_c11_3bd7
BIN_OP_EQ_uxn_opcodes_h_l2771_c11_3bd7 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2771_c11_3bd7_left,
BIN_OP_EQ_uxn_opcodes_h_l2771_c11_3bd7_right,
BIN_OP_EQ_uxn_opcodes_h_l2771_c11_3bd7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_4699
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_4699 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_4699_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_4699_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_4699_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_4699_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fbeb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fbeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fbeb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fbeb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fbeb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fbeb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2771_c7_19ef
opc_result_MUX_uxn_opcodes_h_l2771_c7_19ef : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2771_c7_19ef_cond,
opc_result_MUX_uxn_opcodes_h_l2771_c7_19ef_iftrue,
opc_result_MUX_uxn_opcodes_h_l2771_c7_19ef_iffalse,
opc_result_MUX_uxn_opcodes_h_l2771_c7_19ef_return_output);

-- deo_uxn_opcodes_h_l2771_c41_d1c0
deo_uxn_opcodes_h_l2771_c41_d1c0 : entity work.deo_0CLK_0f1297eb port map (
clk,
deo_uxn_opcodes_h_l2771_c41_d1c0_CLOCK_ENABLE,
deo_uxn_opcodes_h_l2771_c41_d1c0_phase,
deo_uxn_opcodes_h_l2771_c41_d1c0_ins,
deo_uxn_opcodes_h_l2771_c41_d1c0_previous_stack_read,
deo_uxn_opcodes_h_l2771_c41_d1c0_previous_device_ram_read,
deo_uxn_opcodes_h_l2771_c41_d1c0_previous_ram_read,
deo_uxn_opcodes_h_l2771_c41_d1c0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2772_c11_0dfb
BIN_OP_EQ_uxn_opcodes_h_l2772_c11_0dfb : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2772_c11_0dfb_left,
BIN_OP_EQ_uxn_opcodes_h_l2772_c11_0dfb_right,
BIN_OP_EQ_uxn_opcodes_h_l2772_c11_0dfb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_0aaa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_0aaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_0aaa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_0aaa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_0aaa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_0aaa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_e729
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_e729 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_e729_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_e729_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_e729_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_e729_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2772_c7_fbeb
opc_result_MUX_uxn_opcodes_h_l2772_c7_fbeb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2772_c7_fbeb_cond,
opc_result_MUX_uxn_opcodes_h_l2772_c7_fbeb_iftrue,
opc_result_MUX_uxn_opcodes_h_l2772_c7_fbeb_iffalse,
opc_result_MUX_uxn_opcodes_h_l2772_c7_fbeb_return_output);

-- deo2_uxn_opcodes_h_l2772_c41_a1d9
deo2_uxn_opcodes_h_l2772_c41_a1d9 : entity work.deo2_0CLK_0f83c89f port map (
clk,
deo2_uxn_opcodes_h_l2772_c41_a1d9_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l2772_c41_a1d9_phase,
deo2_uxn_opcodes_h_l2772_c41_a1d9_ins,
deo2_uxn_opcodes_h_l2772_c41_a1d9_previous_stack_read,
deo2_uxn_opcodes_h_l2772_c41_a1d9_previous_device_ram_read,
deo2_uxn_opcodes_h_l2772_c41_a1d9_previous_ram_read,
deo2_uxn_opcodes_h_l2772_c41_a1d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2773_c11_5404
BIN_OP_EQ_uxn_opcodes_h_l2773_c11_5404 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2773_c11_5404_left,
BIN_OP_EQ_uxn_opcodes_h_l2773_c11_5404_right,
BIN_OP_EQ_uxn_opcodes_h_l2773_c11_5404_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_fe36
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_fe36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_fe36_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_fe36_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_fe36_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_fe36_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_0c6e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_0c6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_0c6e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_0c6e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_0c6e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_0c6e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2773_c7_e729
opc_result_MUX_uxn_opcodes_h_l2773_c7_e729 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2773_c7_e729_cond,
opc_result_MUX_uxn_opcodes_h_l2773_c7_e729_iftrue,
opc_result_MUX_uxn_opcodes_h_l2773_c7_e729_iffalse,
opc_result_MUX_uxn_opcodes_h_l2773_c7_e729_return_output);

-- add_uxn_opcodes_h_l2773_c41_9472
add_uxn_opcodes_h_l2773_c41_9472 : entity work.add_0CLK_bacf6a1d port map (
clk,
add_uxn_opcodes_h_l2773_c41_9472_CLOCK_ENABLE,
add_uxn_opcodes_h_l2773_c41_9472_phase,
add_uxn_opcodes_h_l2773_c41_9472_ins,
add_uxn_opcodes_h_l2773_c41_9472_previous_stack_read,
add_uxn_opcodes_h_l2773_c41_9472_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2774_c11_21d7
BIN_OP_EQ_uxn_opcodes_h_l2774_c11_21d7 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2774_c11_21d7_left,
BIN_OP_EQ_uxn_opcodes_h_l2774_c11_21d7_right,
BIN_OP_EQ_uxn_opcodes_h_l2774_c11_21d7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8e4b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8e4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8e4b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8e4b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8e4b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8e4b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_dfdd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_dfdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_dfdd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_dfdd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_dfdd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_dfdd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2774_c7_0c6e
opc_result_MUX_uxn_opcodes_h_l2774_c7_0c6e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2774_c7_0c6e_cond,
opc_result_MUX_uxn_opcodes_h_l2774_c7_0c6e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2774_c7_0c6e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2774_c7_0c6e_return_output);

-- add2_uxn_opcodes_h_l2774_c41_f0b6
add2_uxn_opcodes_h_l2774_c41_f0b6 : entity work.add2_0CLK_f74041be port map (
clk,
add2_uxn_opcodes_h_l2774_c41_f0b6_CLOCK_ENABLE,
add2_uxn_opcodes_h_l2774_c41_f0b6_phase,
add2_uxn_opcodes_h_l2774_c41_f0b6_ins,
add2_uxn_opcodes_h_l2774_c41_f0b6_previous_stack_read,
add2_uxn_opcodes_h_l2774_c41_f0b6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2775_c11_a966
BIN_OP_EQ_uxn_opcodes_h_l2775_c11_a966 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2775_c11_a966_left,
BIN_OP_EQ_uxn_opcodes_h_l2775_c11_a966_right,
BIN_OP_EQ_uxn_opcodes_h_l2775_c11_a966_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_eb0a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_eb0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_eb0a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_eb0a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_eb0a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_eb0a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_86e6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_86e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_86e6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_86e6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_86e6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_86e6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2775_c7_dfdd
opc_result_MUX_uxn_opcodes_h_l2775_c7_dfdd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2775_c7_dfdd_cond,
opc_result_MUX_uxn_opcodes_h_l2775_c7_dfdd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2775_c7_dfdd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2775_c7_dfdd_return_output);

-- sub_uxn_opcodes_h_l2775_c41_2b09
sub_uxn_opcodes_h_l2775_c41_2b09 : entity work.sub_0CLK_bacf6a1d port map (
clk,
sub_uxn_opcodes_h_l2775_c41_2b09_CLOCK_ENABLE,
sub_uxn_opcodes_h_l2775_c41_2b09_phase,
sub_uxn_opcodes_h_l2775_c41_2b09_ins,
sub_uxn_opcodes_h_l2775_c41_2b09_previous_stack_read,
sub_uxn_opcodes_h_l2775_c41_2b09_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2776_c11_fcb1
BIN_OP_EQ_uxn_opcodes_h_l2776_c11_fcb1 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2776_c11_fcb1_left,
BIN_OP_EQ_uxn_opcodes_h_l2776_c11_fcb1_right,
BIN_OP_EQ_uxn_opcodes_h_l2776_c11_fcb1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fb29
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fb29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fb29_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fb29_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fb29_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fb29_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_e883
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_e883 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_e883_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_e883_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_e883_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_e883_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2776_c7_86e6
opc_result_MUX_uxn_opcodes_h_l2776_c7_86e6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2776_c7_86e6_cond,
opc_result_MUX_uxn_opcodes_h_l2776_c7_86e6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2776_c7_86e6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2776_c7_86e6_return_output);

-- sub2_uxn_opcodes_h_l2776_c41_1929
sub2_uxn_opcodes_h_l2776_c41_1929 : entity work.sub2_0CLK_f74041be port map (
clk,
sub2_uxn_opcodes_h_l2776_c41_1929_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l2776_c41_1929_phase,
sub2_uxn_opcodes_h_l2776_c41_1929_ins,
sub2_uxn_opcodes_h_l2776_c41_1929_previous_stack_read,
sub2_uxn_opcodes_h_l2776_c41_1929_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2777_c11_8161
BIN_OP_EQ_uxn_opcodes_h_l2777_c11_8161 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2777_c11_8161_left,
BIN_OP_EQ_uxn_opcodes_h_l2777_c11_8161_right,
BIN_OP_EQ_uxn_opcodes_h_l2777_c11_8161_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_810f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_810f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_810f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_810f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_810f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_810f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_3cbe
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_3cbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_3cbe_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_3cbe_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_3cbe_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_3cbe_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2777_c7_e883
opc_result_MUX_uxn_opcodes_h_l2777_c7_e883 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2777_c7_e883_cond,
opc_result_MUX_uxn_opcodes_h_l2777_c7_e883_iftrue,
opc_result_MUX_uxn_opcodes_h_l2777_c7_e883_iffalse,
opc_result_MUX_uxn_opcodes_h_l2777_c7_e883_return_output);

-- mul_uxn_opcodes_h_l2777_c41_2a47
mul_uxn_opcodes_h_l2777_c41_2a47 : entity work.mul_0CLK_bacf6a1d port map (
clk,
mul_uxn_opcodes_h_l2777_c41_2a47_CLOCK_ENABLE,
mul_uxn_opcodes_h_l2777_c41_2a47_phase,
mul_uxn_opcodes_h_l2777_c41_2a47_ins,
mul_uxn_opcodes_h_l2777_c41_2a47_previous_stack_read,
mul_uxn_opcodes_h_l2777_c41_2a47_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2778_c11_0ec5
BIN_OP_EQ_uxn_opcodes_h_l2778_c11_0ec5 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2778_c11_0ec5_left,
BIN_OP_EQ_uxn_opcodes_h_l2778_c11_0ec5_right,
BIN_OP_EQ_uxn_opcodes_h_l2778_c11_0ec5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_8252
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_8252 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_8252_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_8252_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_8252_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_8252_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_4639
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_4639 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_4639_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_4639_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_4639_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_4639_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2778_c7_3cbe
opc_result_MUX_uxn_opcodes_h_l2778_c7_3cbe : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2778_c7_3cbe_cond,
opc_result_MUX_uxn_opcodes_h_l2778_c7_3cbe_iftrue,
opc_result_MUX_uxn_opcodes_h_l2778_c7_3cbe_iffalse,
opc_result_MUX_uxn_opcodes_h_l2778_c7_3cbe_return_output);

-- mul2_uxn_opcodes_h_l2778_c41_7a26
mul2_uxn_opcodes_h_l2778_c41_7a26 : entity work.mul2_0CLK_f74041be port map (
clk,
mul2_uxn_opcodes_h_l2778_c41_7a26_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l2778_c41_7a26_phase,
mul2_uxn_opcodes_h_l2778_c41_7a26_ins,
mul2_uxn_opcodes_h_l2778_c41_7a26_previous_stack_read,
mul2_uxn_opcodes_h_l2778_c41_7a26_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2779_c11_396f
BIN_OP_EQ_uxn_opcodes_h_l2779_c11_396f : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2779_c11_396f_left,
BIN_OP_EQ_uxn_opcodes_h_l2779_c11_396f_right,
BIN_OP_EQ_uxn_opcodes_h_l2779_c11_396f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_27d9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_27d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_27d9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_27d9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_27d9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_27d9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_e6c5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_e6c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_e6c5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_e6c5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_e6c5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_e6c5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2779_c7_4639
opc_result_MUX_uxn_opcodes_h_l2779_c7_4639 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2779_c7_4639_cond,
opc_result_MUX_uxn_opcodes_h_l2779_c7_4639_iftrue,
opc_result_MUX_uxn_opcodes_h_l2779_c7_4639_iffalse,
opc_result_MUX_uxn_opcodes_h_l2779_c7_4639_return_output);

-- div_uxn_opcodes_h_l2779_c41_fa5d
div_uxn_opcodes_h_l2779_c41_fa5d : entity work.div_0CLK_a35230ee port map (
clk,
div_uxn_opcodes_h_l2779_c41_fa5d_CLOCK_ENABLE,
div_uxn_opcodes_h_l2779_c41_fa5d_phase,
div_uxn_opcodes_h_l2779_c41_fa5d_ins,
div_uxn_opcodes_h_l2779_c41_fa5d_previous_stack_read,
div_uxn_opcodes_h_l2779_c41_fa5d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2780_c11_b1c2
BIN_OP_EQ_uxn_opcodes_h_l2780_c11_b1c2 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2780_c11_b1c2_left,
BIN_OP_EQ_uxn_opcodes_h_l2780_c11_b1c2_right,
BIN_OP_EQ_uxn_opcodes_h_l2780_c11_b1c2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_28e3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_28e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_28e3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_28e3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_28e3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_28e3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_8f15
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_8f15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_8f15_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_8f15_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_8f15_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_8f15_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2780_c7_e6c5
opc_result_MUX_uxn_opcodes_h_l2780_c7_e6c5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2780_c7_e6c5_cond,
opc_result_MUX_uxn_opcodes_h_l2780_c7_e6c5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2780_c7_e6c5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2780_c7_e6c5_return_output);

-- div2_uxn_opcodes_h_l2780_c41_78b8
div2_uxn_opcodes_h_l2780_c41_78b8 : entity work.div2_0CLK_6d03de33 port map (
clk,
div2_uxn_opcodes_h_l2780_c41_78b8_CLOCK_ENABLE,
div2_uxn_opcodes_h_l2780_c41_78b8_phase,
div2_uxn_opcodes_h_l2780_c41_78b8_ins,
div2_uxn_opcodes_h_l2780_c41_78b8_previous_stack_read,
div2_uxn_opcodes_h_l2780_c41_78b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2781_c11_8744
BIN_OP_EQ_uxn_opcodes_h_l2781_c11_8744 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2781_c11_8744_left,
BIN_OP_EQ_uxn_opcodes_h_l2781_c11_8744_right,
BIN_OP_EQ_uxn_opcodes_h_l2781_c11_8744_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_9c00
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_9c00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_9c00_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_9c00_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_9c00_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_9c00_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c7_1774
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c7_1774 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c7_1774_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c7_1774_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c7_1774_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c7_1774_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2781_c7_8f15
opc_result_MUX_uxn_opcodes_h_l2781_c7_8f15 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2781_c7_8f15_cond,
opc_result_MUX_uxn_opcodes_h_l2781_c7_8f15_iftrue,
opc_result_MUX_uxn_opcodes_h_l2781_c7_8f15_iffalse,
opc_result_MUX_uxn_opcodes_h_l2781_c7_8f15_return_output);

-- and_uxn_opcodes_h_l2781_c41_3c0b
and_uxn_opcodes_h_l2781_c41_3c0b : entity work.and_0CLK_bacf6a1d port map (
clk,
and_uxn_opcodes_h_l2781_c41_3c0b_CLOCK_ENABLE,
and_uxn_opcodes_h_l2781_c41_3c0b_phase,
and_uxn_opcodes_h_l2781_c41_3c0b_ins,
and_uxn_opcodes_h_l2781_c41_3c0b_previous_stack_read,
and_uxn_opcodes_h_l2781_c41_3c0b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2782_c11_e346
BIN_OP_EQ_uxn_opcodes_h_l2782_c11_e346 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2782_c11_e346_left,
BIN_OP_EQ_uxn_opcodes_h_l2782_c11_e346_right,
BIN_OP_EQ_uxn_opcodes_h_l2782_c11_e346_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_0042
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_0042 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_0042_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_0042_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_0042_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_0042_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c7_13d7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c7_13d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c7_13d7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c7_13d7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c7_13d7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c7_13d7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2782_c7_1774
opc_result_MUX_uxn_opcodes_h_l2782_c7_1774 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2782_c7_1774_cond,
opc_result_MUX_uxn_opcodes_h_l2782_c7_1774_iftrue,
opc_result_MUX_uxn_opcodes_h_l2782_c7_1774_iffalse,
opc_result_MUX_uxn_opcodes_h_l2782_c7_1774_return_output);

-- and2_uxn_opcodes_h_l2782_c41_2cae
and2_uxn_opcodes_h_l2782_c41_2cae : entity work.and2_0CLK_f74041be port map (
clk,
and2_uxn_opcodes_h_l2782_c41_2cae_CLOCK_ENABLE,
and2_uxn_opcodes_h_l2782_c41_2cae_phase,
and2_uxn_opcodes_h_l2782_c41_2cae_ins,
and2_uxn_opcodes_h_l2782_c41_2cae_previous_stack_read,
and2_uxn_opcodes_h_l2782_c41_2cae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2783_c11_2563
BIN_OP_EQ_uxn_opcodes_h_l2783_c11_2563 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2783_c11_2563_left,
BIN_OP_EQ_uxn_opcodes_h_l2783_c11_2563_right,
BIN_OP_EQ_uxn_opcodes_h_l2783_c11_2563_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c1_b3f7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c1_b3f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c1_b3f7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c1_b3f7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c1_b3f7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c1_b3f7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c7_4d58
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c7_4d58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c7_4d58_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c7_4d58_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c7_4d58_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c7_4d58_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2783_c7_13d7
opc_result_MUX_uxn_opcodes_h_l2783_c7_13d7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2783_c7_13d7_cond,
opc_result_MUX_uxn_opcodes_h_l2783_c7_13d7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2783_c7_13d7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2783_c7_13d7_return_output);

-- ora_uxn_opcodes_h_l2783_c41_9203
ora_uxn_opcodes_h_l2783_c41_9203 : entity work.ora_0CLK_bacf6a1d port map (
clk,
ora_uxn_opcodes_h_l2783_c41_9203_CLOCK_ENABLE,
ora_uxn_opcodes_h_l2783_c41_9203_phase,
ora_uxn_opcodes_h_l2783_c41_9203_ins,
ora_uxn_opcodes_h_l2783_c41_9203_previous_stack_read,
ora_uxn_opcodes_h_l2783_c41_9203_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2784_c11_15d9
BIN_OP_EQ_uxn_opcodes_h_l2784_c11_15d9 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2784_c11_15d9_left,
BIN_OP_EQ_uxn_opcodes_h_l2784_c11_15d9_right,
BIN_OP_EQ_uxn_opcodes_h_l2784_c11_15d9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c1_7d8c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c1_7d8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c1_7d8c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c1_7d8c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c1_7d8c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c1_7d8c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c7_a5f1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c7_a5f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c7_a5f1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c7_a5f1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c7_a5f1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c7_a5f1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2784_c7_4d58
opc_result_MUX_uxn_opcodes_h_l2784_c7_4d58 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2784_c7_4d58_cond,
opc_result_MUX_uxn_opcodes_h_l2784_c7_4d58_iftrue,
opc_result_MUX_uxn_opcodes_h_l2784_c7_4d58_iffalse,
opc_result_MUX_uxn_opcodes_h_l2784_c7_4d58_return_output);

-- ora2_uxn_opcodes_h_l2784_c41_6380
ora2_uxn_opcodes_h_l2784_c41_6380 : entity work.ora2_0CLK_f74041be port map (
clk,
ora2_uxn_opcodes_h_l2784_c41_6380_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l2784_c41_6380_phase,
ora2_uxn_opcodes_h_l2784_c41_6380_ins,
ora2_uxn_opcodes_h_l2784_c41_6380_previous_stack_read,
ora2_uxn_opcodes_h_l2784_c41_6380_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2785_c11_0d8e
BIN_OP_EQ_uxn_opcodes_h_l2785_c11_0d8e : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2785_c11_0d8e_left,
BIN_OP_EQ_uxn_opcodes_h_l2785_c11_0d8e_right,
BIN_OP_EQ_uxn_opcodes_h_l2785_c11_0d8e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c1_01b4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c1_01b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c1_01b4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c1_01b4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c1_01b4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c1_01b4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c7_bd8a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c7_bd8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c7_bd8a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c7_bd8a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c7_bd8a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c7_bd8a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2785_c7_a5f1
opc_result_MUX_uxn_opcodes_h_l2785_c7_a5f1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2785_c7_a5f1_cond,
opc_result_MUX_uxn_opcodes_h_l2785_c7_a5f1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2785_c7_a5f1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2785_c7_a5f1_return_output);

-- eor_uxn_opcodes_h_l2785_c41_21f3
eor_uxn_opcodes_h_l2785_c41_21f3 : entity work.eor_0CLK_bacf6a1d port map (
clk,
eor_uxn_opcodes_h_l2785_c41_21f3_CLOCK_ENABLE,
eor_uxn_opcodes_h_l2785_c41_21f3_phase,
eor_uxn_opcodes_h_l2785_c41_21f3_ins,
eor_uxn_opcodes_h_l2785_c41_21f3_previous_stack_read,
eor_uxn_opcodes_h_l2785_c41_21f3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2786_c11_d294
BIN_OP_EQ_uxn_opcodes_h_l2786_c11_d294 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2786_c11_d294_left,
BIN_OP_EQ_uxn_opcodes_h_l2786_c11_d294_right,
BIN_OP_EQ_uxn_opcodes_h_l2786_c11_d294_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c1_bc33
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c1_bc33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c1_bc33_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c1_bc33_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c1_bc33_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c1_bc33_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c7_7515
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c7_7515 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c7_7515_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c7_7515_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c7_7515_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c7_7515_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2786_c7_bd8a
opc_result_MUX_uxn_opcodes_h_l2786_c7_bd8a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2786_c7_bd8a_cond,
opc_result_MUX_uxn_opcodes_h_l2786_c7_bd8a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2786_c7_bd8a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2786_c7_bd8a_return_output);

-- eor2_uxn_opcodes_h_l2786_c41_451a
eor2_uxn_opcodes_h_l2786_c41_451a : entity work.eor2_0CLK_f74041be port map (
clk,
eor2_uxn_opcodes_h_l2786_c41_451a_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l2786_c41_451a_phase,
eor2_uxn_opcodes_h_l2786_c41_451a_ins,
eor2_uxn_opcodes_h_l2786_c41_451a_previous_stack_read,
eor2_uxn_opcodes_h_l2786_c41_451a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2787_c11_26d2
BIN_OP_EQ_uxn_opcodes_h_l2787_c11_26d2 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2787_c11_26d2_left,
BIN_OP_EQ_uxn_opcodes_h_l2787_c11_26d2_right,
BIN_OP_EQ_uxn_opcodes_h_l2787_c11_26d2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c1_5847
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c1_5847 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c1_5847_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c1_5847_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c1_5847_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c1_5847_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c7_9bc2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c7_9bc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c7_9bc2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c7_9bc2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c7_9bc2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c7_9bc2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2787_c7_7515
opc_result_MUX_uxn_opcodes_h_l2787_c7_7515 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2787_c7_7515_cond,
opc_result_MUX_uxn_opcodes_h_l2787_c7_7515_iftrue,
opc_result_MUX_uxn_opcodes_h_l2787_c7_7515_iffalse,
opc_result_MUX_uxn_opcodes_h_l2787_c7_7515_return_output);

-- sft_uxn_opcodes_h_l2787_c41_741a
sft_uxn_opcodes_h_l2787_c41_741a : entity work.sft_0CLK_10aab3e1 port map (
clk,
sft_uxn_opcodes_h_l2787_c41_741a_CLOCK_ENABLE,
sft_uxn_opcodes_h_l2787_c41_741a_phase,
sft_uxn_opcodes_h_l2787_c41_741a_ins,
sft_uxn_opcodes_h_l2787_c41_741a_previous_stack_read,
sft_uxn_opcodes_h_l2787_c41_741a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2788_c11_ebd0
BIN_OP_EQ_uxn_opcodes_h_l2788_c11_ebd0 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2788_c11_ebd0_left,
BIN_OP_EQ_uxn_opcodes_h_l2788_c11_ebd0_right,
BIN_OP_EQ_uxn_opcodes_h_l2788_c11_ebd0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c1_c8ae
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c1_c8ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c1_c8ae_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c1_c8ae_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c1_c8ae_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c1_c8ae_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2789_c1_1fe8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2789_c1_1fe8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2789_c1_1fe8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2789_c1_1fe8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2789_c1_1fe8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2789_c1_1fe8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2788_c7_9bc2
opc_result_MUX_uxn_opcodes_h_l2788_c7_9bc2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2788_c7_9bc2_cond,
opc_result_MUX_uxn_opcodes_h_l2788_c7_9bc2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2788_c7_9bc2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2788_c7_9bc2_return_output);

-- sft2_uxn_opcodes_h_l2788_c41_908a
sft2_uxn_opcodes_h_l2788_c41_908a : entity work.sft2_0CLK_77062510 port map (
clk,
sft2_uxn_opcodes_h_l2788_c41_908a_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l2788_c41_908a_phase,
sft2_uxn_opcodes_h_l2788_c41_908a_ins,
sft2_uxn_opcodes_h_l2788_c41_908a_previous_stack_read,
sft2_uxn_opcodes_h_l2788_c41_908a_return_output);

-- printf_uxn_opcodes_h_l2789_c9_4682_uxn_opcodes_h_l2789_c9_4682
printf_uxn_opcodes_h_l2789_c9_4682_uxn_opcodes_h_l2789_c9_4682 : entity work.printf_uxn_opcodes_h_l2789_c9_4682_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2789_c9_4682_uxn_opcodes_h_l2789_c9_4682_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2789_c9_4682_uxn_opcodes_h_l2789_c9_4682_arg0);

-- BIN_OP_AND_uxn_opcodes_h_l2791_c18_bc25
BIN_OP_AND_uxn_opcodes_h_l2791_c18_bc25 : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2791_c18_bc25_left,
BIN_OP_AND_uxn_opcodes_h_l2791_c18_bc25_right,
BIN_OP_AND_uxn_opcodes_h_l2791_c18_bc25_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2791_c18_7b50
BIN_OP_GT_uxn_opcodes_h_l2791_c18_7b50 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2791_c18_7b50_left,
BIN_OP_GT_uxn_opcodes_h_l2791_c18_7b50_right,
BIN_OP_GT_uxn_opcodes_h_l2791_c18_7b50_return_output);

-- MUX_uxn_opcodes_h_l2791_c18_cedb
MUX_uxn_opcodes_h_l2791_c18_cedb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2791_c18_cedb_cond,
MUX_uxn_opcodes_h_l2791_c18_cedb_iftrue,
MUX_uxn_opcodes_h_l2791_c18_cedb_iffalse,
MUX_uxn_opcodes_h_l2791_c18_cedb_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2792_c2_d383
BIN_OP_XOR_uxn_opcodes_h_l2792_c2_d383 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2792_c2_d383_left,
BIN_OP_XOR_uxn_opcodes_h_l2792_c2_d383_right,
BIN_OP_XOR_uxn_opcodes_h_l2792_c2_d383_return_output);

-- sp1_MUX_uxn_opcodes_h_l2794_c2_4f32
sp1_MUX_uxn_opcodes_h_l2794_c2_4f32 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2794_c2_4f32_cond,
sp1_MUX_uxn_opcodes_h_l2794_c2_4f32_iftrue,
sp1_MUX_uxn_opcodes_h_l2794_c2_4f32_iffalse,
sp1_MUX_uxn_opcodes_h_l2794_c2_4f32_return_output);

-- sp0_MUX_uxn_opcodes_h_l2794_c2_4f32
sp0_MUX_uxn_opcodes_h_l2794_c2_4f32 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2794_c2_4f32_cond,
sp0_MUX_uxn_opcodes_h_l2794_c2_4f32_iftrue,
sp0_MUX_uxn_opcodes_h_l2794_c2_4f32_iffalse,
sp0_MUX_uxn_opcodes_h_l2794_c2_4f32_return_output);

-- sp1_MUX_uxn_opcodes_h_l2795_c3_3a25
sp1_MUX_uxn_opcodes_h_l2795_c3_3a25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2795_c3_3a25_cond,
sp1_MUX_uxn_opcodes_h_l2795_c3_3a25_iftrue,
sp1_MUX_uxn_opcodes_h_l2795_c3_3a25_iffalse,
sp1_MUX_uxn_opcodes_h_l2795_c3_3a25_return_output);

-- sp0_MUX_uxn_opcodes_h_l2795_c3_3a25
sp0_MUX_uxn_opcodes_h_l2795_c3_3a25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2795_c3_3a25_cond,
sp0_MUX_uxn_opcodes_h_l2795_c3_3a25_iftrue,
sp0_MUX_uxn_opcodes_h_l2795_c3_3a25_iffalse,
sp0_MUX_uxn_opcodes_h_l2795_c3_3a25_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2796_c4_90ce
BIN_OP_PLUS_uxn_opcodes_h_l2796_c4_90ce : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2796_c4_90ce_left,
BIN_OP_PLUS_uxn_opcodes_h_l2796_c4_90ce_right,
BIN_OP_PLUS_uxn_opcodes_h_l2796_c4_90ce_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2798_c4_bc13
BIN_OP_PLUS_uxn_opcodes_h_l2798_c4_bc13 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2798_c4_bc13_left,
BIN_OP_PLUS_uxn_opcodes_h_l2798_c4_bc13_right,
BIN_OP_PLUS_uxn_opcodes_h_l2798_c4_bc13_return_output);

-- MUX_uxn_opcodes_h_l2802_c30_774b
MUX_uxn_opcodes_h_l2802_c30_774b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2802_c30_774b_cond,
MUX_uxn_opcodes_h_l2802_c30_774b_iftrue,
MUX_uxn_opcodes_h_l2802_c30_774b_iffalse,
MUX_uxn_opcodes_h_l2802_c30_774b_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2802_c19_97c4
BIN_OP_MINUS_uxn_opcodes_h_l2802_c19_97c4 : entity work.BIN_OP_MINUS_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2802_c19_97c4_left,
BIN_OP_MINUS_uxn_opcodes_h_l2802_c19_97c4_right,
BIN_OP_MINUS_uxn_opcodes_h_l2802_c19_97c4_return_output);

-- MUX_uxn_opcodes_h_l2803_c20_27ed
MUX_uxn_opcodes_h_l2803_c20_27ed : entity work.MUX_uint1_t_uint9_t_uint9_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2803_c20_27ed_cond,
MUX_uxn_opcodes_h_l2803_c20_27ed_iftrue,
MUX_uxn_opcodes_h_l2803_c20_27ed_iffalse,
MUX_uxn_opcodes_h_l2803_c20_27ed_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2803_c2_f948
BIN_OP_PLUS_uxn_opcodes_h_l2803_c2_f948 : entity work.BIN_OP_PLUS_uint12_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2803_c2_f948_left,
BIN_OP_PLUS_uxn_opcodes_h_l2803_c2_f948_right,
BIN_OP_PLUS_uxn_opcodes_h_l2803_c2_f948_return_output);

-- stack_ram_update_uxn_opcodes_h_l2805_c21_f7ff
stack_ram_update_uxn_opcodes_h_l2805_c21_f7ff : entity work.stack_ram_update_0CLK_23f04728 port map (
clk,
stack_ram_update_uxn_opcodes_h_l2805_c21_f7ff_CLOCK_ENABLE,
stack_ram_update_uxn_opcodes_h_l2805_c21_f7ff_stack_address,
stack_ram_update_uxn_opcodes_h_l2805_c21_f7ff_value,
stack_ram_update_uxn_opcodes_h_l2805_c21_f7ff_write_enable,
stack_ram_update_uxn_opcodes_h_l2805_c21_f7ff_return_output);



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
 opc,
 stack_index,
 is_wait,
 stack_address,
 stack_read_value,
 opc_result,
 opc_eval_result,
 -- All submodule outputs
 BIN_OP_AND_uxn_opcodes_h_l2715_c10_1b5d_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2715_c10_e480_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2715_c41_fc87_return_output,
 CONST_SL_4_uxn_opcodes_h_l2715_c57_42cc_return_output,
 MUX_uxn_opcodes_h_l2715_c10_9a20_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2719_c6_9c85_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_373a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_e407_return_output,
 is_wait_MUX_uxn_opcodes_h_l2719_c2_7623_return_output,
 opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2720_c11_00db_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_a825_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ec20_return_output,
 opc_result_MUX_uxn_opcodes_h_l2720_c7_e407_return_output,
 jci_uxn_opcodes_h_l2720_c41_46ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2721_c11_b889_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ae96_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_c4d4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2721_c7_ec20_return_output,
 jmi_uxn_opcodes_h_l2721_c41_8067_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2722_c11_3037_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_d39b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_00f0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2722_c7_c4d4_return_output,
 jsi_uxn_opcodes_h_l2722_c41_19e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2723_c11_199e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_c6b9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_a630_return_output,
 opc_result_MUX_uxn_opcodes_h_l2723_c7_00f0_return_output,
 lit_uxn_opcodes_h_l2723_c41_d996_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2724_c11_44ba_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_2230_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_7af2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2724_c7_a630_return_output,
 lit2_uxn_opcodes_h_l2724_c41_0f38_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2725_c11_a14c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_03ea_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_3a5d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2725_c7_7af2_return_output,
 lit_uxn_opcodes_h_l2725_c41_c710_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2726_c11_c5e6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_ee2d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_dbd2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2726_c7_3a5d_return_output,
 lit2_uxn_opcodes_h_l2726_c41_e80e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2727_c11_5ef0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_889b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_a2ba_return_output,
 opc_result_MUX_uxn_opcodes_h_l2727_c7_dbd2_return_output,
 inc_uxn_opcodes_h_l2727_c41_8d51_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2728_c11_0ad2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_0f21_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_988f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2728_c7_a2ba_return_output,
 inc2_uxn_opcodes_h_l2728_c41_e26b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2729_c11_5533_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_f84d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7400_return_output,
 opc_result_MUX_uxn_opcodes_h_l2729_c7_988f_return_output,
 pop_uxn_opcodes_h_l2729_c41_d160_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4aae_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_509f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_3b86_return_output,
 opc_result_MUX_uxn_opcodes_h_l2730_c7_7400_return_output,
 pop2_uxn_opcodes_h_l2730_c41_6214_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2731_c11_6de8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_9bb2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_f6bb_return_output,
 opc_result_MUX_uxn_opcodes_h_l2731_c7_3b86_return_output,
 nip_uxn_opcodes_h_l2731_c41_eb29_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2732_c11_fafe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_c424_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_5637_return_output,
 opc_result_MUX_uxn_opcodes_h_l2732_c7_f6bb_return_output,
 nip2_uxn_opcodes_h_l2732_c41_f77a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2733_c11_e808_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_bc11_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_9913_return_output,
 opc_result_MUX_uxn_opcodes_h_l2733_c7_5637_return_output,
 swp_uxn_opcodes_h_l2733_c41_8d73_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ac0e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_4713_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_9222_return_output,
 opc_result_MUX_uxn_opcodes_h_l2734_c7_9913_return_output,
 swp2_uxn_opcodes_h_l2734_c41_d5f8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2735_c11_a0fe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_be25_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_c9d1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2735_c7_9222_return_output,
 rot_uxn_opcodes_h_l2735_c41_e9ea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2736_c11_8aa1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_ef8c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5747_return_output,
 opc_result_MUX_uxn_opcodes_h_l2736_c7_c9d1_return_output,
 rot2_uxn_opcodes_h_l2736_c41_5e8a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2737_c11_5f86_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_55f3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_de36_return_output,
 opc_result_MUX_uxn_opcodes_h_l2737_c7_5747_return_output,
 dup_uxn_opcodes_h_l2737_c41_3be7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7149_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_2997_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_5f2f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2738_c7_de36_return_output,
 dup2_uxn_opcodes_h_l2738_c41_aabb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2739_c11_22ca_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_4560_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_019a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2739_c7_5f2f_return_output,
 ovr_uxn_opcodes_h_l2739_c41_d2de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e27e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_105b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_7319_return_output,
 opc_result_MUX_uxn_opcodes_h_l2740_c7_019a_return_output,
 ovr2_uxn_opcodes_h_l2740_c41_b517_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2741_c11_7a1b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_d3e4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5e67_return_output,
 opc_result_MUX_uxn_opcodes_h_l2741_c7_7319_return_output,
 equ_uxn_opcodes_h_l2741_c41_d8da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6413_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_0c31_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_e6ca_return_output,
 opc_result_MUX_uxn_opcodes_h_l2742_c7_5e67_return_output,
 equ2_uxn_opcodes_h_l2742_c41_adc2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2743_c11_0609_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_04c1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_a164_return_output,
 opc_result_MUX_uxn_opcodes_h_l2743_c7_e6ca_return_output,
 neq_uxn_opcodes_h_l2743_c41_07e5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2744_c11_a896_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_7d78_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_b420_return_output,
 opc_result_MUX_uxn_opcodes_h_l2744_c7_a164_return_output,
 neq2_uxn_opcodes_h_l2744_c41_585e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2745_c11_1bb8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_5f12_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_d2e2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2745_c7_b420_return_output,
 gth_uxn_opcodes_h_l2745_c41_19d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2746_c11_6138_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_f622_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_f293_return_output,
 opc_result_MUX_uxn_opcodes_h_l2746_c7_d2e2_return_output,
 gth2_uxn_opcodes_h_l2746_c41_ee3e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2747_c11_514e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_14a3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_d33a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2747_c7_f293_return_output,
 lth_uxn_opcodes_h_l2747_c41_6584_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2748_c11_09e7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_73f9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_6263_return_output,
 opc_result_MUX_uxn_opcodes_h_l2748_c7_d33a_return_output,
 lth2_uxn_opcodes_h_l2748_c41_01ea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2749_c11_f60b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_4674_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_5aec_return_output,
 opc_result_MUX_uxn_opcodes_h_l2749_c7_6263_return_output,
 jmp_uxn_opcodes_h_l2749_c41_e115_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2750_c11_2f39_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_473e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_bd9c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2750_c7_5aec_return_output,
 jmp2_uxn_opcodes_h_l2750_c41_dabe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2751_c11_a76c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_d9d4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_6f4f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2751_c7_bd9c_return_output,
 jcn_uxn_opcodes_h_l2751_c41_f92d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2752_c11_bf54_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_dbbc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_7348_return_output,
 opc_result_MUX_uxn_opcodes_h_l2752_c7_6f4f_return_output,
 jcn2_uxn_opcodes_h_l2752_c41_f5ce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2753_c11_78a8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_ebac_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_b6fe_return_output,
 opc_result_MUX_uxn_opcodes_h_l2753_c7_7348_return_output,
 jsr_uxn_opcodes_h_l2753_c41_be6e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2754_c11_84dd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_f981_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_abc1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2754_c7_b6fe_return_output,
 jsr2_uxn_opcodes_h_l2754_c41_daf7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2755_c11_5c1a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_3d97_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_a1cb_return_output,
 opc_result_MUX_uxn_opcodes_h_l2755_c7_abc1_return_output,
 sth_uxn_opcodes_h_l2755_c41_5d99_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2756_c11_5a5c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_1fc7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_3c85_return_output,
 opc_result_MUX_uxn_opcodes_h_l2756_c7_a1cb_return_output,
 sth2_uxn_opcodes_h_l2756_c41_0d9b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2757_c11_1878_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_4ff3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_d95e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2757_c7_3c85_return_output,
 ldz_uxn_opcodes_h_l2757_c41_b38e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2758_c11_65f0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_8d5d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1288_return_output,
 opc_result_MUX_uxn_opcodes_h_l2758_c7_d95e_return_output,
 ldz2_uxn_opcodes_h_l2758_c41_6f6e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2759_c11_6d13_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_73a4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_79e6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2759_c7_1288_return_output,
 stz_uxn_opcodes_h_l2759_c41_a8de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1fde_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_9ffd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_4431_return_output,
 opc_result_MUX_uxn_opcodes_h_l2760_c7_79e6_return_output,
 stz2_uxn_opcodes_h_l2760_c41_fb87_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2761_c11_176d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_0a6c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_e022_return_output,
 opc_result_MUX_uxn_opcodes_h_l2761_c7_4431_return_output,
 ldr_uxn_opcodes_h_l2761_c41_8783_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2762_c11_01d4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6150_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_b6e2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2762_c7_e022_return_output,
 ldr2_uxn_opcodes_h_l2762_c41_c2f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2763_c11_266d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_838b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_5cdd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2763_c7_b6e2_return_output,
 str1_uxn_opcodes_h_l2763_c41_015e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2764_c11_b6b2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_c8be_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_6ff0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2764_c7_5cdd_return_output,
 str2_uxn_opcodes_h_l2764_c41_bb2b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2765_c11_a869_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_32a7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_00d4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2765_c7_6ff0_return_output,
 lda_uxn_opcodes_h_l2765_c41_31a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2766_c11_240e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_3762_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_8f80_return_output,
 opc_result_MUX_uxn_opcodes_h_l2766_c7_00d4_return_output,
 lda2_uxn_opcodes_h_l2766_c41_cd54_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2767_c11_9032_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_bd7f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_11d7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2767_c7_8f80_return_output,
 sta_uxn_opcodes_h_l2767_c41_71e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2768_c11_f613_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d8b2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_78bb_return_output,
 opc_result_MUX_uxn_opcodes_h_l2768_c7_11d7_return_output,
 sta2_uxn_opcodes_h_l2768_c41_4b8d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2769_c11_d653_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7e55_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_7171_return_output,
 opc_result_MUX_uxn_opcodes_h_l2769_c7_78bb_return_output,
 dei_uxn_opcodes_h_l2769_c41_9a0e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2770_c11_cba2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_994a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_19ef_return_output,
 opc_result_MUX_uxn_opcodes_h_l2770_c7_7171_return_output,
 dei2_uxn_opcodes_h_l2770_c41_d02e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2771_c11_3bd7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_4699_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fbeb_return_output,
 opc_result_MUX_uxn_opcodes_h_l2771_c7_19ef_return_output,
 deo_uxn_opcodes_h_l2771_c41_d1c0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2772_c11_0dfb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_0aaa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_e729_return_output,
 opc_result_MUX_uxn_opcodes_h_l2772_c7_fbeb_return_output,
 deo2_uxn_opcodes_h_l2772_c41_a1d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2773_c11_5404_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_fe36_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_0c6e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2773_c7_e729_return_output,
 add_uxn_opcodes_h_l2773_c41_9472_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2774_c11_21d7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8e4b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_dfdd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2774_c7_0c6e_return_output,
 add2_uxn_opcodes_h_l2774_c41_f0b6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2775_c11_a966_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_eb0a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_86e6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2775_c7_dfdd_return_output,
 sub_uxn_opcodes_h_l2775_c41_2b09_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2776_c11_fcb1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fb29_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_e883_return_output,
 opc_result_MUX_uxn_opcodes_h_l2776_c7_86e6_return_output,
 sub2_uxn_opcodes_h_l2776_c41_1929_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2777_c11_8161_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_810f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_3cbe_return_output,
 opc_result_MUX_uxn_opcodes_h_l2777_c7_e883_return_output,
 mul_uxn_opcodes_h_l2777_c41_2a47_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2778_c11_0ec5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_8252_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_4639_return_output,
 opc_result_MUX_uxn_opcodes_h_l2778_c7_3cbe_return_output,
 mul2_uxn_opcodes_h_l2778_c41_7a26_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2779_c11_396f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_27d9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_e6c5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2779_c7_4639_return_output,
 div_uxn_opcodes_h_l2779_c41_fa5d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2780_c11_b1c2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_28e3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_8f15_return_output,
 opc_result_MUX_uxn_opcodes_h_l2780_c7_e6c5_return_output,
 div2_uxn_opcodes_h_l2780_c41_78b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2781_c11_8744_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_9c00_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c7_1774_return_output,
 opc_result_MUX_uxn_opcodes_h_l2781_c7_8f15_return_output,
 and_uxn_opcodes_h_l2781_c41_3c0b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2782_c11_e346_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_0042_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c7_13d7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2782_c7_1774_return_output,
 and2_uxn_opcodes_h_l2782_c41_2cae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2783_c11_2563_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c1_b3f7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c7_4d58_return_output,
 opc_result_MUX_uxn_opcodes_h_l2783_c7_13d7_return_output,
 ora_uxn_opcodes_h_l2783_c41_9203_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2784_c11_15d9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c1_7d8c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c7_a5f1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2784_c7_4d58_return_output,
 ora2_uxn_opcodes_h_l2784_c41_6380_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2785_c11_0d8e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c1_01b4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c7_bd8a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2785_c7_a5f1_return_output,
 eor_uxn_opcodes_h_l2785_c41_21f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2786_c11_d294_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c1_bc33_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c7_7515_return_output,
 opc_result_MUX_uxn_opcodes_h_l2786_c7_bd8a_return_output,
 eor2_uxn_opcodes_h_l2786_c41_451a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2787_c11_26d2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c1_5847_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c7_9bc2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2787_c7_7515_return_output,
 sft_uxn_opcodes_h_l2787_c41_741a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2788_c11_ebd0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c1_c8ae_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2789_c1_1fe8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2788_c7_9bc2_return_output,
 sft2_uxn_opcodes_h_l2788_c41_908a_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2791_c18_bc25_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2791_c18_7b50_return_output,
 MUX_uxn_opcodes_h_l2791_c18_cedb_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2792_c2_d383_return_output,
 sp1_MUX_uxn_opcodes_h_l2794_c2_4f32_return_output,
 sp0_MUX_uxn_opcodes_h_l2794_c2_4f32_return_output,
 sp1_MUX_uxn_opcodes_h_l2795_c3_3a25_return_output,
 sp0_MUX_uxn_opcodes_h_l2795_c3_3a25_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2796_c4_90ce_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2798_c4_bc13_return_output,
 MUX_uxn_opcodes_h_l2802_c30_774b_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2802_c19_97c4_return_output,
 MUX_uxn_opcodes_h_l2803_c20_27ed_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2803_c2_f948_return_output,
 stack_ram_update_uxn_opcodes_h_l2805_c21_f7ff_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_opc_uxn_opcodes_h_l2715_c2_eaa0 : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2715_c10_9a20_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2715_c10_9a20_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2715_c10_9a20_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2715_c10_1b5d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2715_c10_1b5d_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2715_c10_1b5d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2715_c10_e480_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2715_c10_e480_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2715_c10_e480_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2715_c41_fc87_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2715_c41_fc87_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2715_c41_fc87_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2715_c30_0ff7_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2715_c57_50fa_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l2715_c57_42cc_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l2715_c57_42cc_x : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2715_c10_9a20_return_output : unsigned(11 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2717_c2_8fa5_uxn_opcodes_h_l2717_c2_8fa5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2717_c2_8fa5_uxn_opcodes_h_l2717_c2_8fa5_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2717_c2_8fa5_uxn_opcodes_h_l2717_c2_8fa5_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2717_c2_8fa5_uxn_opcodes_h_l2717_c2_8fa5_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c6_9c85_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c6_9c85_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c6_9c85_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_373a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_373a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_373a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_373a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_e407_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_e407_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_e407_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_e407_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2719_c2_7623_iftrue : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2719_c2_7623_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2719_c2_7623_return_output : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2719_c2_7623_cond : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2719_c2_7623_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_e407_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2719_c23_84f6_uxn_opcodes_h_l2719_c23_84f6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_00db_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_00db_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_00db_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_a825_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_a825_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_a825_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_a825_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ec20_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ec20_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ec20_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ec20_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_e407_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_e407_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_ec20_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_e407_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2720_c41_46ad_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2720_c41_46ad_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2720_c41_46ad_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2720_c41_46ad_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2720_c41_46ad_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2720_c41_46ad_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_b889_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_b889_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_b889_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ae96_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ae96_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ae96_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ae96_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_c4d4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_c4d4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_c4d4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_c4d4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_ec20_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_ec20_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_c4d4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_ec20_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2721_c41_8067_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2721_c41_8067_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2721_c41_8067_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2721_c41_8067_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2721_c41_8067_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_3037_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_3037_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_3037_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_d39b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_d39b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_d39b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_d39b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_00f0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_00f0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_00f0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_00f0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_c4d4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_c4d4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_00f0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_c4d4_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2722_c41_19e6_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2722_c41_19e6_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2722_c41_19e6_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2722_c41_19e6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2722_c41_19e6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_199e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_199e_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_199e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_c6b9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_c6b9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_c6b9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_c6b9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_a630_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_a630_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_a630_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_a630_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_00f0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_00f0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_a630_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_00f0_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2723_c41_d996_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2723_c41_d996_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2723_c41_d996_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2723_c41_d996_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2723_c41_d996_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_44ba_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_44ba_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_44ba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_2230_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_2230_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_2230_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_2230_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_7af2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_7af2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_7af2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_7af2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_a630_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_a630_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_7af2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_a630_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2724_c41_0f38_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2724_c41_0f38_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2724_c41_0f38_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2724_c41_0f38_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2724_c41_0f38_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_a14c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_a14c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_a14c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_03ea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_03ea_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_03ea_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_03ea_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_3a5d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_3a5d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_3a5d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_3a5d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_7af2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_7af2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_3a5d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_7af2_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2725_c41_c710_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2725_c41_c710_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2725_c41_c710_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2725_c41_c710_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2725_c41_c710_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_c5e6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_c5e6_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_c5e6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_ee2d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_ee2d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_ee2d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_ee2d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_dbd2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_dbd2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_dbd2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_dbd2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_3a5d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_3a5d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_dbd2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_3a5d_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2726_c41_e80e_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2726_c41_e80e_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2726_c41_e80e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2726_c41_e80e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2726_c41_e80e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_5ef0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_5ef0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_5ef0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_889b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_889b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_889b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_889b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_a2ba_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_a2ba_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_a2ba_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_a2ba_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_dbd2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_dbd2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_a2ba_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_dbd2_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2727_c41_8d51_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2727_c41_8d51_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2727_c41_8d51_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2727_c41_8d51_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2727_c41_8d51_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_0ad2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_0ad2_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_0ad2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_0f21_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_0f21_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_0f21_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_0f21_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_988f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_988f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_988f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_988f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_a2ba_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_a2ba_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_988f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_a2ba_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2728_c41_e26b_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2728_c41_e26b_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2728_c41_e26b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2728_c41_e26b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2728_c41_e26b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_5533_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_5533_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_5533_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_f84d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_f84d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_f84d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_f84d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7400_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7400_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7400_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7400_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_988f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_988f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_7400_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_988f_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2729_c41_d160_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2729_c41_d160_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2729_c41_d160_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2729_c41_d160_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4aae_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4aae_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4aae_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_509f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_509f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_509f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_509f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_3b86_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_3b86_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_3b86_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_3b86_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_7400_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_7400_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_3b86_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_7400_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2730_c41_6214_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2730_c41_6214_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2730_c41_6214_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2730_c41_6214_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_6de8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_6de8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_6de8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_9bb2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_9bb2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_9bb2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_9bb2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_f6bb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_f6bb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_f6bb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_f6bb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_3b86_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_3b86_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_f6bb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_3b86_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2731_c41_eb29_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2731_c41_eb29_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2731_c41_eb29_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2731_c41_eb29_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2731_c41_eb29_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_fafe_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_fafe_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_fafe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_c424_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_c424_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_c424_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_c424_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_5637_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_5637_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_5637_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_5637_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_f6bb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_f6bb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_5637_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_f6bb_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2732_c41_f77a_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2732_c41_f77a_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2732_c41_f77a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2732_c41_f77a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2732_c41_f77a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_e808_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_e808_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_e808_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_bc11_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_bc11_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_bc11_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_bc11_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_9913_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_9913_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_9913_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_9913_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_5637_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_5637_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_9913_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_5637_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2733_c41_8d73_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2733_c41_8d73_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2733_c41_8d73_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2733_c41_8d73_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2733_c41_8d73_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ac0e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ac0e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ac0e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_4713_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_4713_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_4713_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_4713_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_9222_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_9222_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_9222_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_9222_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_9913_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_9913_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_9222_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_9913_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2734_c41_d5f8_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2734_c41_d5f8_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2734_c41_d5f8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2734_c41_d5f8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2734_c41_d5f8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_a0fe_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_a0fe_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_a0fe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_be25_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_be25_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_be25_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_be25_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_c9d1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_c9d1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_c9d1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_c9d1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_9222_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_9222_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_c9d1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_9222_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2735_c41_e9ea_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2735_c41_e9ea_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2735_c41_e9ea_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2735_c41_e9ea_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2735_c41_e9ea_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_8aa1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_8aa1_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_8aa1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_ef8c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_ef8c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_ef8c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_ef8c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5747_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5747_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5747_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5747_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_c9d1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_c9d1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_5747_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_c9d1_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2736_c41_5e8a_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2736_c41_5e8a_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2736_c41_5e8a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2736_c41_5e8a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2736_c41_5e8a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_5f86_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_5f86_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_5f86_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_55f3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_55f3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_55f3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_55f3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_de36_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_de36_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_de36_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_de36_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_5747_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_5747_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_de36_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_5747_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2737_c41_3be7_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2737_c41_3be7_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2737_c41_3be7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2737_c41_3be7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2737_c41_3be7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7149_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7149_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7149_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_2997_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_2997_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_2997_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_2997_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_5f2f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_5f2f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_5f2f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_5f2f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_de36_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_de36_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_5f2f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_de36_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2738_c41_aabb_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2738_c41_aabb_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2738_c41_aabb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2738_c41_aabb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2738_c41_aabb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_22ca_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_22ca_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_22ca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_4560_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_4560_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_4560_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_4560_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_019a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_019a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_019a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_019a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_5f2f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_5f2f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_019a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_5f2f_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2739_c41_d2de_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2739_c41_d2de_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2739_c41_d2de_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2739_c41_d2de_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2739_c41_d2de_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e27e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e27e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e27e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_105b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_105b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_105b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_105b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_7319_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_7319_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_7319_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_7319_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_019a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_019a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_7319_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_019a_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2740_c41_b517_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2740_c41_b517_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2740_c41_b517_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2740_c41_b517_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2740_c41_b517_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_7a1b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_7a1b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_7a1b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_d3e4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_d3e4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_d3e4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_d3e4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5e67_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5e67_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5e67_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5e67_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_7319_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_7319_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5e67_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_7319_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2741_c41_d8da_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2741_c41_d8da_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2741_c41_d8da_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2741_c41_d8da_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2741_c41_d8da_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6413_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6413_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6413_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_0c31_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_0c31_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_0c31_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_0c31_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_e6ca_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_e6ca_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_e6ca_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_e6ca_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5e67_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5e67_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_e6ca_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5e67_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2742_c41_adc2_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2742_c41_adc2_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2742_c41_adc2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2742_c41_adc2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2742_c41_adc2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_0609_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_0609_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_0609_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_04c1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_04c1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_04c1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_04c1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_a164_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_a164_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_a164_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_a164_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_e6ca_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_e6ca_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_a164_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_e6ca_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2743_c41_07e5_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2743_c41_07e5_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2743_c41_07e5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2743_c41_07e5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2743_c41_07e5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_a896_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_a896_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_a896_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_7d78_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_7d78_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_7d78_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_7d78_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_b420_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_b420_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_b420_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_b420_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_a164_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_a164_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_b420_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_a164_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2744_c41_585e_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2744_c41_585e_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2744_c41_585e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2744_c41_585e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2744_c41_585e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_1bb8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_1bb8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_1bb8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_5f12_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_5f12_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_5f12_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_5f12_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_d2e2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_d2e2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_d2e2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_d2e2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_b420_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_b420_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_d2e2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_b420_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2745_c41_19d9_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2745_c41_19d9_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2745_c41_19d9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2745_c41_19d9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2745_c41_19d9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_6138_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_6138_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_6138_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_f622_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_f622_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_f622_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_f622_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_f293_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_f293_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_f293_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_f293_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_d2e2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_d2e2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_f293_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_d2e2_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2746_c41_ee3e_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2746_c41_ee3e_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2746_c41_ee3e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2746_c41_ee3e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2746_c41_ee3e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_514e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_514e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_514e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_14a3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_14a3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_14a3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_14a3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_d33a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_d33a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_d33a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_d33a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_f293_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_f293_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_d33a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_f293_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2747_c41_6584_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2747_c41_6584_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2747_c41_6584_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2747_c41_6584_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2747_c41_6584_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_09e7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_09e7_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_09e7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_73f9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_73f9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_73f9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_73f9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_6263_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_6263_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_6263_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_6263_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_d33a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_d33a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_6263_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_d33a_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2748_c41_01ea_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2748_c41_01ea_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2748_c41_01ea_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2748_c41_01ea_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2748_c41_01ea_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_f60b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_f60b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_f60b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_4674_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_4674_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_4674_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_4674_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_5aec_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_5aec_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_5aec_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_5aec_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_6263_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_6263_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_5aec_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_6263_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2749_c41_e115_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2749_c41_e115_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2749_c41_e115_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2749_c41_e115_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2749_c41_e115_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2749_c41_e115_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_2f39_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_2f39_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_2f39_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_473e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_473e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_473e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_473e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_bd9c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_bd9c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_bd9c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_bd9c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_5aec_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_5aec_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_bd9c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_5aec_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2750_c41_dabe_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2750_c41_dabe_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2750_c41_dabe_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2750_c41_dabe_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2750_c41_dabe_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_a76c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_a76c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_a76c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_d9d4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_d9d4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_d9d4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_d9d4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_6f4f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_6f4f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_6f4f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_6f4f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_bd9c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_bd9c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_6f4f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_bd9c_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2751_c41_f92d_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2751_c41_f92d_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2751_c41_f92d_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2751_c41_f92d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2751_c41_f92d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2751_c41_f92d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_bf54_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_bf54_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_bf54_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_dbbc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_dbbc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_dbbc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_dbbc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_7348_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_7348_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_7348_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_7348_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_6f4f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_6f4f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_7348_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_6f4f_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2752_c41_f5ce_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2752_c41_f5ce_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2752_c41_f5ce_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2752_c41_f5ce_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2752_c41_f5ce_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_78a8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_78a8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_78a8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_ebac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_ebac_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_ebac_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_ebac_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_b6fe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_b6fe_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_b6fe_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_b6fe_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_7348_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_7348_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_b6fe_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_7348_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2753_c41_be6e_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2753_c41_be6e_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2753_c41_be6e_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2753_c41_be6e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2753_c41_be6e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2753_c41_be6e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_84dd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_84dd_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_84dd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_f981_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_f981_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_f981_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_f981_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_abc1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_abc1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_abc1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_abc1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_b6fe_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_b6fe_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_abc1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_b6fe_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2754_c41_daf7_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2754_c41_daf7_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2754_c41_daf7_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2754_c41_daf7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2754_c41_daf7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2754_c41_daf7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_5c1a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_5c1a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_5c1a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_3d97_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_3d97_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_3d97_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_3d97_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_a1cb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_a1cb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_a1cb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_a1cb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_abc1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_abc1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_a1cb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_abc1_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2755_c41_5d99_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2755_c41_5d99_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2755_c41_5d99_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2755_c41_5d99_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2755_c41_5d99_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_5a5c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_5a5c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_5a5c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_1fc7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_1fc7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_1fc7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_1fc7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_3c85_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_3c85_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_3c85_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_3c85_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_a1cb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_a1cb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_3c85_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_a1cb_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2756_c41_0d9b_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2756_c41_0d9b_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2756_c41_0d9b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2756_c41_0d9b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2756_c41_0d9b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_1878_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_1878_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_1878_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_4ff3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_4ff3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_4ff3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_4ff3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_d95e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_d95e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_d95e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_d95e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_3c85_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_3c85_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_d95e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_3c85_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2757_c41_b38e_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2757_c41_b38e_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2757_c41_b38e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2757_c41_b38e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2757_c41_b38e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2757_c41_b38e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_65f0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_65f0_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_65f0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_8d5d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_8d5d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_8d5d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_8d5d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1288_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1288_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1288_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1288_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_d95e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_d95e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_1288_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_d95e_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2758_c41_6f6e_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2758_c41_6f6e_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2758_c41_6f6e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2758_c41_6f6e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2758_c41_6f6e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2758_c41_6f6e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_6d13_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_6d13_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_6d13_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_73a4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_73a4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_73a4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_73a4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_79e6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_79e6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_79e6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_79e6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_1288_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_1288_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_79e6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_1288_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2759_c41_a8de_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2759_c41_a8de_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2759_c41_a8de_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2759_c41_a8de_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2759_c41_a8de_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1fde_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1fde_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1fde_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_9ffd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_9ffd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_9ffd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_9ffd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_4431_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_4431_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_4431_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_4431_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_79e6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_79e6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_4431_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_79e6_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2760_c41_fb87_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2760_c41_fb87_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2760_c41_fb87_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2760_c41_fb87_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2760_c41_fb87_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_176d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_176d_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_176d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_0a6c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_0a6c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_0a6c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_0a6c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_e022_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_e022_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_e022_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_e022_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_4431_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_4431_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_e022_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_4431_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2761_c41_8783_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2761_c41_8783_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2761_c41_8783_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2761_c41_8783_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2761_c41_8783_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2761_c41_8783_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2761_c41_8783_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_01d4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_01d4_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_01d4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6150_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6150_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6150_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6150_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_b6e2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_b6e2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_b6e2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_b6e2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_e022_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_e022_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_b6e2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_e022_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2762_c41_c2f9_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2762_c41_c2f9_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2762_c41_c2f9_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2762_c41_c2f9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2762_c41_c2f9_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2762_c41_c2f9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2762_c41_c2f9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_266d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_266d_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_266d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_838b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_838b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_838b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_838b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_5cdd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_5cdd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_5cdd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_5cdd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_b6e2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_b6e2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_5cdd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_b6e2_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2763_c41_015e_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2763_c41_015e_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2763_c41_015e_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2763_c41_015e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2763_c41_015e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2763_c41_015e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_b6b2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_b6b2_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_b6b2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_c8be_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_c8be_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_c8be_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_c8be_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_6ff0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_6ff0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_6ff0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_6ff0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_5cdd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_5cdd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_6ff0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_5cdd_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2764_c41_bb2b_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2764_c41_bb2b_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2764_c41_bb2b_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2764_c41_bb2b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2764_c41_bb2b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2764_c41_bb2b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_a869_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_a869_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_a869_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_32a7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_32a7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_32a7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_32a7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_00d4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_00d4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_00d4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_00d4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_6ff0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_6ff0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_00d4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_6ff0_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2765_c41_31a1_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2765_c41_31a1_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2765_c41_31a1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2765_c41_31a1_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2765_c41_31a1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2765_c41_31a1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_240e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_240e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_240e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_3762_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_3762_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_3762_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_3762_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_8f80_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_8f80_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_8f80_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_8f80_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_00d4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_00d4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_8f80_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_00d4_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2766_c41_cd54_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2766_c41_cd54_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2766_c41_cd54_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2766_c41_cd54_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2766_c41_cd54_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2766_c41_cd54_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_9032_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_9032_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_9032_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_bd7f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_bd7f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_bd7f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_bd7f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_11d7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_11d7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_11d7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_11d7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_8f80_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_8f80_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_11d7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_8f80_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2767_c41_71e6_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2767_c41_71e6_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2767_c41_71e6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2767_c41_71e6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2767_c41_71e6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_f613_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_f613_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_f613_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d8b2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d8b2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d8b2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d8b2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_78bb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_78bb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_78bb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_78bb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_11d7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_11d7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_78bb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_11d7_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2768_c41_4b8d_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2768_c41_4b8d_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2768_c41_4b8d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2768_c41_4b8d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2768_c41_4b8d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_d653_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_d653_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_d653_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7e55_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7e55_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7e55_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7e55_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_7171_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_7171_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_7171_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_7171_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_78bb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_78bb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_7171_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_78bb_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2769_c41_9a0e_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2769_c41_9a0e_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2769_c41_9a0e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2769_c41_9a0e_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2769_c41_9a0e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2769_c41_9a0e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_cba2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_cba2_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_cba2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_994a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_994a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_994a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_994a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_19ef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_19ef_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_19ef_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_19ef_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_7171_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_7171_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_19ef_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_7171_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2770_c41_d02e_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2770_c41_d02e_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2770_c41_d02e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2770_c41_d02e_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2770_c41_d02e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2770_c41_d02e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_3bd7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_3bd7_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_3bd7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_4699_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_4699_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_4699_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_4699_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fbeb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fbeb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fbeb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fbeb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_19ef_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_19ef_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_fbeb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_19ef_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2771_c41_d1c0_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2771_c41_d1c0_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2771_c41_d1c0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2771_c41_d1c0_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2771_c41_d1c0_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2771_c41_d1c0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2771_c41_d1c0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_0dfb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_0dfb_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_0dfb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_0aaa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_0aaa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_0aaa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_0aaa_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_e729_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_e729_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_e729_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_e729_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_fbeb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_fbeb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_e729_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_fbeb_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2772_c41_a1d9_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2772_c41_a1d9_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2772_c41_a1d9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2772_c41_a1d9_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2772_c41_a1d9_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2772_c41_a1d9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2772_c41_a1d9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_5404_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_5404_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_5404_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_fe36_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_fe36_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_fe36_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_fe36_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_0c6e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_0c6e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_0c6e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_0c6e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_e729_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_e729_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_0c6e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_e729_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2773_c41_9472_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2773_c41_9472_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2773_c41_9472_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2773_c41_9472_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2773_c41_9472_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_21d7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_21d7_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_21d7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8e4b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8e4b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8e4b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8e4b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_dfdd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_dfdd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_dfdd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_dfdd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_0c6e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_0c6e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_dfdd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_0c6e_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2774_c41_f0b6_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2774_c41_f0b6_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2774_c41_f0b6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2774_c41_f0b6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2774_c41_f0b6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_a966_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_a966_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_a966_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_eb0a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_eb0a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_eb0a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_eb0a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_86e6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_86e6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_86e6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_86e6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_dfdd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_dfdd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_86e6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_dfdd_cond : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2775_c41_2b09_phase : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2775_c41_2b09_ins : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2775_c41_2b09_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2775_c41_2b09_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2775_c41_2b09_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_fcb1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_fcb1_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_fcb1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fb29_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fb29_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fb29_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fb29_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_e883_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_e883_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_e883_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_e883_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_86e6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_86e6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_e883_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_86e6_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2776_c41_1929_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2776_c41_1929_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2776_c41_1929_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2776_c41_1929_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2776_c41_1929_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_8161_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_8161_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_8161_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_810f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_810f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_810f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_810f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_3cbe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_3cbe_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_3cbe_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_3cbe_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_e883_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_e883_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2778_c7_3cbe_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_e883_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2777_c41_2a47_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2777_c41_2a47_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2777_c41_2a47_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2777_c41_2a47_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2777_c41_2a47_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_0ec5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_0ec5_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_0ec5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_8252_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_8252_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_8252_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_8252_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_4639_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_4639_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_4639_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_4639_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2778_c7_3cbe_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2778_c7_3cbe_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2779_c7_4639_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2778_c7_3cbe_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2778_c41_7a26_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2778_c41_7a26_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2778_c41_7a26_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2778_c41_7a26_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2778_c41_7a26_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2779_c11_396f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2779_c11_396f_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2779_c11_396f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_27d9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_27d9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_27d9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_27d9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_e6c5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_e6c5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_e6c5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_e6c5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2779_c7_4639_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2779_c7_4639_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2780_c7_e6c5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2779_c7_4639_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2779_c41_fa5d_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2779_c41_fa5d_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2779_c41_fa5d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2779_c41_fa5d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2779_c41_fa5d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c11_b1c2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c11_b1c2_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c11_b1c2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_28e3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_28e3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_28e3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_28e3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_8f15_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_8f15_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_8f15_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_8f15_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2780_c7_e6c5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2780_c7_e6c5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2781_c7_8f15_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2780_c7_e6c5_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2780_c41_78b8_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2780_c41_78b8_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2780_c41_78b8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2780_c41_78b8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2780_c41_78b8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_8744_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_8744_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_8744_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_9c00_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_9c00_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_9c00_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_9c00_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c7_1774_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c7_1774_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c7_1774_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c7_1774_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2781_c7_8f15_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2781_c7_8f15_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2782_c7_1774_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2781_c7_8f15_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2781_c41_3c0b_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2781_c41_3c0b_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2781_c41_3c0b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2781_c41_3c0b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2781_c41_3c0b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c11_e346_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c11_e346_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c11_e346_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_0042_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_0042_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_0042_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_0042_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c7_13d7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c7_13d7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c7_13d7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c7_13d7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2782_c7_1774_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2782_c7_1774_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2783_c7_13d7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2782_c7_1774_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2782_c41_2cae_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2782_c41_2cae_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2782_c41_2cae_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2782_c41_2cae_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2782_c41_2cae_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_2563_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_2563_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_2563_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c1_b3f7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c1_b3f7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c1_b3f7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c1_b3f7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c7_4d58_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c7_4d58_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c7_4d58_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c7_4d58_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2783_c7_13d7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2783_c7_13d7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2784_c7_4d58_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2783_c7_13d7_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2783_c41_9203_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2783_c41_9203_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2783_c41_9203_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2783_c41_9203_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2783_c41_9203_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_15d9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_15d9_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_15d9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c1_7d8c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c1_7d8c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c1_7d8c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c1_7d8c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c7_a5f1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c7_a5f1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c7_a5f1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c7_a5f1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2784_c7_4d58_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2784_c7_4d58_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2785_c7_a5f1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2784_c7_4d58_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2784_c41_6380_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2784_c41_6380_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2784_c41_6380_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2784_c41_6380_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2784_c41_6380_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2785_c11_0d8e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2785_c11_0d8e_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2785_c11_0d8e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c1_01b4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c1_01b4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c1_01b4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c1_01b4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c7_bd8a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c7_bd8a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c7_bd8a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c7_bd8a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2785_c7_a5f1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2785_c7_a5f1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2786_c7_bd8a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2785_c7_a5f1_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2785_c41_21f3_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2785_c41_21f3_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2785_c41_21f3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2785_c41_21f3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2785_c41_21f3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_d294_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_d294_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_d294_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c1_bc33_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c1_bc33_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c1_bc33_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c1_bc33_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c7_7515_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c7_7515_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c7_7515_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c7_7515_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2786_c7_bd8a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2786_c7_bd8a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2787_c7_7515_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2786_c7_bd8a_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2786_c41_451a_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2786_c41_451a_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2786_c41_451a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2786_c41_451a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2786_c41_451a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_26d2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_26d2_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_26d2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c1_5847_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c1_5847_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c1_5847_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c1_5847_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c7_9bc2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c7_9bc2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c7_9bc2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c7_9bc2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2787_c7_7515_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2787_c7_7515_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2788_c7_9bc2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2787_c7_7515_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2787_c41_741a_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2787_c41_741a_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2787_c41_741a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2787_c41_741a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2787_c41_741a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2788_c11_ebd0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2788_c11_ebd0_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2788_c11_ebd0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c1_c8ae_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c1_c8ae_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c1_c8ae_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c1_c8ae_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2789_c1_1fe8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2789_c1_1fe8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2789_c1_1fe8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2789_c1_1fe8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2788_c7_9bc2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2788_c7_9bc2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2788_c7_9bc2_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2788_c41_908a_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2788_c41_908a_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2788_c41_908a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2788_c41_908a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2788_c41_908a_return_output : opcode_result_t;
 variable VAR_printf_uxn_opcodes_h_l2789_c9_4682_uxn_opcodes_h_l2789_c9_4682_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2789_c9_4682_uxn_opcodes_h_l2789_c9_4682_arg0 : unsigned(31 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2791_c18_cedb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2791_c18_cedb_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2791_c18_cedb_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2791_c18_bc25_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2791_c18_bc25_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2791_c18_bc25_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2791_c18_7b50_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2791_c18_7b50_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2791_c18_7b50_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2791_c18_cedb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2792_c2_d383_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2792_c17_e455_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2792_c2_d383_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2792_c2_d383_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2794_c6_141d_return_output : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2794_c2_4f32_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2795_c3_3a25_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2794_c2_4f32_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2794_c2_4f32_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2794_c2_4f32_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2794_c2_4f32_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2795_c3_3a25_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2794_c2_4f32_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2794_c2_4f32_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2794_c2_4f32_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2795_c3_3a25_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l2796_c4_258d : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2795_c3_3a25_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2795_c3_3a25_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2795_c3_3a25_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2795_c3_3a25_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l2798_c4_387d : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2795_c3_3a25_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2796_c4_90ce_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2796_c4_90ce_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2796_c4_90ce_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2798_c4_bc13_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2798_c4_bc13_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2798_c4_bc13_return_output : signed(9 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2802_c30_774b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2802_c30_774b_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2802_c30_774b_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2802_c30_774b_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2802_c19_e678_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2802_c19_97c4_left : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2802_c70_70c1_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2802_c59_1782_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2802_c19_97c4_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2802_c19_97c4_return_output : unsigned(11 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l2803_c2_cb66 : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2803_c2_f948_left : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2803_c20_27ed_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2803_c20_27ed_iftrue : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2803_c20_27ed_iffalse : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2803_c20_27ed_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2803_c2_f948_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2803_c2_f948_return_output : unsigned(12 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2805_c21_f7ff_stack_address : unsigned(11 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2805_c21_f7ff_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2805_c21_f7ff_write_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2808_c3_99a7_return_output : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2805_c21_f7ff_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2805_c21_f7ff_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2812_c39_5d10_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2813_c40_b9d2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2814_c34_ecda_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2815_c30_5895_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2816_c33_fd8e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2817_c34_3ef6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2818_c37_0ee7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l2819_c33_6a43_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2821_c32_fc74_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2796_l2798_DUPLICATE_68ae_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2796_l2798_DUPLICATE_3a6d_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2807_l2820_DUPLICATE_88d9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_27e9_uxn_opcodes_h_l2823_l2701_DUPLICATE_d82a_return_output : eval_opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_sp0 : unsigned(7 downto 0);
variable REG_VAR_sp1 : unsigned(7 downto 0);
variable REG_VAR_opc : unsigned(11 downto 0);
variable REG_VAR_stack_index : unsigned(0 downto 0);
variable REG_VAR_is_wait : unsigned(0 downto 0);
variable REG_VAR_stack_address : unsigned(11 downto 0);
variable REG_VAR_stack_read_value : unsigned(7 downto 0);
variable REG_VAR_opc_result : opcode_result_t;
variable REG_VAR_opc_eval_result : eval_opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_sp0 := sp0;
  REG_VAR_sp1 := sp1;
  REG_VAR_opc := opc;
  REG_VAR_stack_index := stack_index;
  REG_VAR_is_wait := is_wait;
  REG_VAR_stack_address := stack_address;
  REG_VAR_stack_read_value := stack_read_value;
  REG_VAR_opc_result := opc_result;
  REG_VAR_opc_eval_result := opc_eval_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_e729_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_0aaa_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_9c00_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c7_1774_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_78a8_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_fcb1_right := to_unsigned(57, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_19ef_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_994a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c7_bd8a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c1_01b4_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_0c31_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_e6ca_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_5f86_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4aae_right := to_unsigned(34, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_a896_right := to_unsigned(41, 6);
     VAR_is_wait_MUX_uxn_opcodes_h_l2719_c2_7623_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_dbbc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_7348_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c7_a5f1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c1_7d8c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_7319_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_105b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_dfdd_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8e4b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c7_13d7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_0042_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_1878_right := to_unsigned(16, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_bf54_right := to_unsigned(45, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_b889_right := to_unsigned(1024, 11);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7149_right := to_unsigned(38, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_b6e2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6150_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ac0e_right := to_unsigned(36, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_9222_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_4713_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_04c1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_a164_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_3bd7_right := to_unsigned(23, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_a0fe_right := to_unsigned(5, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_79e6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_73a4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_0ec5_right := to_unsigned(58, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2789_c1_1fe8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c1_c8ae_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_9913_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_bc11_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_514e_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_b6b2_right := to_unsigned(51, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_d2e2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_5f12_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fbeb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_4699_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_0f21_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_988f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2791_c18_7b50_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_5404_right := to_unsigned(24, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_0609_right := to_unsigned(9, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_0a6c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_e022_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_00f0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_d39b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_199e_right := to_unsigned(2048, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c7_9bc2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c1_5847_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_eb0a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_86e6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c11_e346_right := to_unsigned(60, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_d33a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_14a3_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2803_c20_27ed_iftrue := to_unsigned(256, 9);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_65f0_right := to_unsigned(48, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_3b86_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_509f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6413_right := to_unsigned(40, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_4639_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_8252_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_4ff3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_d95e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_1fc7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_3c85_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_78bb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d8b2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_26d2_right := to_unsigned(31, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_8d5d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1288_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_266d_right := to_unsigned(19, 5);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2715_c41_fc87_right := to_unsigned(63, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5e67_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_d3e4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_5a5c_right := to_unsigned(47, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_8744_right := to_unsigned(28, 5);
     VAR_is_wait_MUX_uxn_opcodes_h_l2719_c2_7623_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_fafe_right := to_unsigned(35, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_e808_right := to_unsigned(4, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_e407_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_373a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2785_c11_0d8e_right := to_unsigned(30, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1fde_right := to_unsigned(49, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_5ef0_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c11_b1c2_right := to_unsigned(59, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_4560_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_019a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_ebac_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_b6fe_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e27e_right := to_unsigned(39, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_f981_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_abc1_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_dbd2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_ee2d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_8161_right := to_unsigned(26, 5);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2715_c10_e480_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_09e7_right := to_unsigned(43, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_e6c5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_27d9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_f6bb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_9bb2_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_c6b9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_a630_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_5637_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_c424_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_73f9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_6263_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2779_c11_396f_right := to_unsigned(27, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_f613_right := to_unsigned(53, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_3037_right := to_unsigned(1536, 11);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_5533_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_84dd_right := to_unsigned(46, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_3d97_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_a1cb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_6de8_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c7_4d58_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c1_b3f7_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_a14c_right := to_unsigned(3072, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_0dfb_right := to_unsigned(55, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_11d7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_bd7f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_d294_right := to_unsigned(62, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_a966_right := to_unsigned(25, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_22ca_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_00db_right := to_unsigned(512, 10);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_c5e6_right := to_unsigned(3584, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_6f4f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_d9d4_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fb29_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_e883_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_a825_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ec20_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_c9d1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_be25_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_cba2_right := to_unsigned(54, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_5c1a_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_15d9_right := to_unsigned(61, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_7171_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7e55_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_2230_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_7af2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ae96_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_c4d4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_176d_right := to_unsigned(18, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_0ad2_right := to_unsigned(33, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2788_c11_ebd0_right := to_unsigned(63, 6);
     VAR_MUX_uxn_opcodes_h_l2791_c18_cedb_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_889b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_a2ba_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_4431_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_9ffd_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_01d4_right := to_unsigned(50, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_7a1b_right := to_unsigned(8, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_f84d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7400_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c6_9c85_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_00d4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_32a7_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_838b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_5cdd_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_f622_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_f293_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_f60b_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_2563_right := to_unsigned(29, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_3762_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_8f80_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_2997_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_5f2f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_c8be_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_6ff0_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_b420_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_7d78_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_a76c_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_a869_right := to_unsigned(20, 5);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2715_c10_1b5d_right := to_unsigned(31, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_6d13_right := to_unsigned(17, 5);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2791_c18_bc25_right := to_unsigned(64, 7);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_5aec_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_4674_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_28e3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_8f15_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_810f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_3cbe_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_473e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_bd9c_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5747_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_ef8c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_1bb8_right := to_unsigned(10, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_fe36_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_0c6e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_6138_right := to_unsigned(42, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_44ba_right := to_unsigned(2560, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_21d7_right := to_unsigned(56, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c7_7515_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c1_bc33_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_55f3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_de36_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2791_c18_cedb_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2803_c20_27ed_iffalse := resize(to_unsigned(0, 1), 9);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_2f39_right := to_unsigned(44, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_240e_right := to_unsigned(52, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_03ea_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_3a5d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_8aa1_right := to_unsigned(37, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_d653_right := to_unsigned(22, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_9032_right := to_unsigned(21, 5);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_e407_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_373a_iftrue := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_opcodes_h_l2717_c2_8fa5_uxn_opcodes_h_l2717_c2_8fa5_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_stack_ram_update_uxn_opcodes_h_l2805_c21_f7ff_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2715_c10_1b5d_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2715_c41_fc87_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2791_c18_bc25_left := VAR_ins;
     VAR_add2_uxn_opcodes_h_l2774_c41_f0b6_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l2773_c41_9472_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l2782_c41_2cae_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l2781_c41_3c0b_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l2770_c41_d02e_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l2769_c41_9a0e_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l2772_c41_a1d9_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l2771_c41_d1c0_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l2780_c41_78b8_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l2779_c41_fa5d_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l2738_c41_aabb_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l2737_c41_3be7_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l2786_c41_451a_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l2785_c41_21f3_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l2742_c41_adc2_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l2741_c41_d8da_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l2746_c41_ee3e_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l2745_c41_19d9_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l2728_c41_e26b_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l2727_c41_8d51_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l2752_c41_f5ce_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l2751_c41_f92d_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l2750_c41_dabe_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l2749_c41_e115_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l2754_c41_daf7_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l2753_c41_be6e_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l2766_c41_cd54_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l2765_c41_31a1_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l2762_c41_c2f9_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l2761_c41_8783_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l2758_c41_6f6e_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l2757_c41_b38e_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l2748_c41_01ea_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l2747_c41_6584_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l2778_c41_7a26_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l2777_c41_2a47_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l2744_c41_585e_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l2743_c41_07e5_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l2732_c41_f77a_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l2731_c41_eb29_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l2784_c41_6380_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l2783_c41_9203_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l2740_c41_b517_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l2739_c41_d2de_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l2730_c41_6214_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l2729_c41_d160_ins := VAR_ins;
     VAR_printf_uxn_opcodes_h_l2717_c2_8fa5_uxn_opcodes_h_l2717_c2_8fa5_arg0 := resize(VAR_ins, 32);
     VAR_rot2_uxn_opcodes_h_l2736_c41_5e8a_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l2735_c41_e9ea_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l2788_c41_908a_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l2787_c41_741a_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l2768_c41_4b8d_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l2767_c41_71e6_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l2756_c41_0d9b_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l2755_c41_5d99_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l2763_c41_015e_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l2764_c41_bb2b_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l2760_c41_fb87_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l2759_c41_a8de_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l2776_c41_1929_ins := VAR_ins;
     VAR_sub_uxn_opcodes_h_l2775_c41_2b09_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l2734_c41_d5f8_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l2733_c41_8d73_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l2788_c7_9bc2_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l2720_c41_46ad_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l2751_c41_f92d_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l2721_c41_8067_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l2749_c41_e115_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l2722_c41_19e6_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l2754_c41_daf7_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l2753_c41_be6e_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l2762_c41_c2f9_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l2761_c41_8783_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2724_c41_0f38_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2726_c41_e80e_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2723_c41_d996_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2725_c41_c710_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l2763_c41_015e_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l2764_c41_bb2b_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l2774_c41_f0b6_phase := VAR_phase;
     VAR_add_uxn_opcodes_h_l2773_c41_9472_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l2782_c41_2cae_phase := VAR_phase;
     VAR_and_uxn_opcodes_h_l2781_c41_3c0b_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2770_c41_d02e_phase := VAR_phase;
     VAR_dei_uxn_opcodes_h_l2769_c41_9a0e_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l2772_c41_a1d9_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l2771_c41_d1c0_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l2780_c41_78b8_phase := VAR_phase;
     VAR_div_uxn_opcodes_h_l2779_c41_fa5d_phase := VAR_phase;
     VAR_dup2_uxn_opcodes_h_l2738_c41_aabb_phase := VAR_phase;
     VAR_dup_uxn_opcodes_h_l2737_c41_3be7_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l2786_c41_451a_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l2785_c41_21f3_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l2742_c41_adc2_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l2741_c41_d8da_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l2746_c41_ee3e_phase := VAR_phase;
     VAR_gth_uxn_opcodes_h_l2745_c41_19d9_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l2728_c41_e26b_phase := VAR_phase;
     VAR_inc_uxn_opcodes_h_l2727_c41_8d51_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l2720_c41_46ad_phase := VAR_phase;
     VAR_jcn2_uxn_opcodes_h_l2752_c41_f5ce_phase := VAR_phase;
     VAR_jcn_uxn_opcodes_h_l2751_c41_f92d_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l2721_c41_8067_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l2750_c41_dabe_phase := VAR_phase;
     VAR_jmp_uxn_opcodes_h_l2749_c41_e115_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l2722_c41_19e6_phase := VAR_phase;
     VAR_jsr2_uxn_opcodes_h_l2754_c41_daf7_phase := VAR_phase;
     VAR_jsr_uxn_opcodes_h_l2753_c41_be6e_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l2766_c41_cd54_phase := VAR_phase;
     VAR_lda_uxn_opcodes_h_l2765_c41_31a1_phase := VAR_phase;
     VAR_ldr2_uxn_opcodes_h_l2762_c41_c2f9_phase := VAR_phase;
     VAR_ldr_uxn_opcodes_h_l2761_c41_8783_phase := VAR_phase;
     VAR_ldz2_uxn_opcodes_h_l2758_c41_6f6e_phase := VAR_phase;
     VAR_ldz_uxn_opcodes_h_l2757_c41_b38e_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2724_c41_0f38_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2726_c41_e80e_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2723_c41_d996_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2725_c41_c710_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l2748_c41_01ea_phase := VAR_phase;
     VAR_lth_uxn_opcodes_h_l2747_c41_6584_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l2778_c41_7a26_phase := VAR_phase;
     VAR_mul_uxn_opcodes_h_l2777_c41_2a47_phase := VAR_phase;
     VAR_neq2_uxn_opcodes_h_l2744_c41_585e_phase := VAR_phase;
     VAR_neq_uxn_opcodes_h_l2743_c41_07e5_phase := VAR_phase;
     VAR_nip2_uxn_opcodes_h_l2732_c41_f77a_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l2731_c41_eb29_phase := VAR_phase;
     VAR_ora2_uxn_opcodes_h_l2784_c41_6380_phase := VAR_phase;
     VAR_ora_uxn_opcodes_h_l2783_c41_9203_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l2740_c41_b517_phase := VAR_phase;
     VAR_ovr_uxn_opcodes_h_l2739_c41_d2de_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l2730_c41_6214_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l2729_c41_d160_phase := VAR_phase;
     VAR_printf_uxn_opcodes_h_l2717_c2_8fa5_uxn_opcodes_h_l2717_c2_8fa5_arg2 := resize(VAR_phase, 32);
     VAR_rot2_uxn_opcodes_h_l2736_c41_5e8a_phase := VAR_phase;
     VAR_rot_uxn_opcodes_h_l2735_c41_e9ea_phase := VAR_phase;
     VAR_sft2_uxn_opcodes_h_l2788_c41_908a_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l2787_c41_741a_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l2768_c41_4b8d_phase := VAR_phase;
     VAR_sta_uxn_opcodes_h_l2767_c41_71e6_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l2756_c41_0d9b_phase := VAR_phase;
     VAR_sth_uxn_opcodes_h_l2755_c41_5d99_phase := VAR_phase;
     VAR_str1_uxn_opcodes_h_l2763_c41_015e_phase := VAR_phase;
     VAR_str2_uxn_opcodes_h_l2764_c41_bb2b_phase := VAR_phase;
     VAR_stz2_uxn_opcodes_h_l2760_c41_fb87_phase := VAR_phase;
     VAR_stz_uxn_opcodes_h_l2759_c41_a8de_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l2776_c41_1929_phase := VAR_phase;
     VAR_sub_uxn_opcodes_h_l2775_c41_2b09_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l2734_c41_d5f8_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l2733_c41_8d73_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2770_c41_d02e_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_dei_uxn_opcodes_h_l2769_c41_9a0e_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2772_c41_a1d9_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo_uxn_opcodes_h_l2771_c41_d1c0_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2772_c41_a1d9_previous_ram_read := VAR_previous_ram_read;
     VAR_deo_uxn_opcodes_h_l2771_c41_d1c0_previous_ram_read := VAR_previous_ram_read;
     VAR_jci_uxn_opcodes_h_l2720_c41_46ad_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l2721_c41_8067_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l2722_c41_19e6_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l2766_c41_cd54_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l2765_c41_31a1_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l2762_c41_c2f9_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l2761_c41_8783_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l2758_c41_6f6e_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l2757_c41_b38e_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2724_c41_0f38_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2726_c41_e80e_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2723_c41_d996_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2725_c41_c710_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2798_c4_bc13_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l2794_c2_4f32_iffalse := sp0;
     VAR_sp0_MUX_uxn_opcodes_h_l2795_c3_3a25_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2796_c4_90ce_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l2794_c2_4f32_iffalse := sp1;
     VAR_sp1_MUX_uxn_opcodes_h_l2795_c3_3a25_iffalse := sp1;
     VAR_add2_uxn_opcodes_h_l2774_c41_f0b6_previous_stack_read := stack_read_value;
     VAR_add_uxn_opcodes_h_l2773_c41_9472_previous_stack_read := stack_read_value;
     VAR_and2_uxn_opcodes_h_l2782_c41_2cae_previous_stack_read := stack_read_value;
     VAR_and_uxn_opcodes_h_l2781_c41_3c0b_previous_stack_read := stack_read_value;
     VAR_dei2_uxn_opcodes_h_l2770_c41_d02e_previous_stack_read := stack_read_value;
     VAR_dei_uxn_opcodes_h_l2769_c41_9a0e_previous_stack_read := stack_read_value;
     VAR_deo2_uxn_opcodes_h_l2772_c41_a1d9_previous_stack_read := stack_read_value;
     VAR_deo_uxn_opcodes_h_l2771_c41_d1c0_previous_stack_read := stack_read_value;
     VAR_div2_uxn_opcodes_h_l2780_c41_78b8_previous_stack_read := stack_read_value;
     VAR_div_uxn_opcodes_h_l2779_c41_fa5d_previous_stack_read := stack_read_value;
     VAR_dup2_uxn_opcodes_h_l2738_c41_aabb_previous_stack_read := stack_read_value;
     VAR_dup_uxn_opcodes_h_l2737_c41_3be7_previous_stack_read := stack_read_value;
     VAR_eor2_uxn_opcodes_h_l2786_c41_451a_previous_stack_read := stack_read_value;
     VAR_eor_uxn_opcodes_h_l2785_c41_21f3_previous_stack_read := stack_read_value;
     VAR_equ2_uxn_opcodes_h_l2742_c41_adc2_previous_stack_read := stack_read_value;
     VAR_equ_uxn_opcodes_h_l2741_c41_d8da_previous_stack_read := stack_read_value;
     VAR_gth2_uxn_opcodes_h_l2746_c41_ee3e_previous_stack_read := stack_read_value;
     VAR_gth_uxn_opcodes_h_l2745_c41_19d9_previous_stack_read := stack_read_value;
     VAR_inc2_uxn_opcodes_h_l2728_c41_e26b_previous_stack_read := stack_read_value;
     VAR_inc_uxn_opcodes_h_l2727_c41_8d51_previous_stack_read := stack_read_value;
     VAR_jci_uxn_opcodes_h_l2720_c41_46ad_previous_stack_read := stack_read_value;
     VAR_jcn2_uxn_opcodes_h_l2752_c41_f5ce_previous_stack_read := stack_read_value;
     VAR_jcn_uxn_opcodes_h_l2751_c41_f92d_previous_stack_read := stack_read_value;
     VAR_jmp2_uxn_opcodes_h_l2750_c41_dabe_previous_stack_read := stack_read_value;
     VAR_jmp_uxn_opcodes_h_l2749_c41_e115_previous_stack_read := stack_read_value;
     VAR_jsr2_uxn_opcodes_h_l2754_c41_daf7_previous_stack_read := stack_read_value;
     VAR_jsr_uxn_opcodes_h_l2753_c41_be6e_previous_stack_read := stack_read_value;
     VAR_lda2_uxn_opcodes_h_l2766_c41_cd54_previous_stack_read := stack_read_value;
     VAR_lda_uxn_opcodes_h_l2765_c41_31a1_previous_stack_read := stack_read_value;
     VAR_ldr2_uxn_opcodes_h_l2762_c41_c2f9_previous_stack_read := stack_read_value;
     VAR_ldr_uxn_opcodes_h_l2761_c41_8783_previous_stack_read := stack_read_value;
     VAR_ldz2_uxn_opcodes_h_l2758_c41_6f6e_previous_stack_read := stack_read_value;
     VAR_ldz_uxn_opcodes_h_l2757_c41_b38e_previous_stack_read := stack_read_value;
     VAR_lth2_uxn_opcodes_h_l2748_c41_01ea_previous_stack_read := stack_read_value;
     VAR_lth_uxn_opcodes_h_l2747_c41_6584_previous_stack_read := stack_read_value;
     VAR_mul2_uxn_opcodes_h_l2778_c41_7a26_previous_stack_read := stack_read_value;
     VAR_mul_uxn_opcodes_h_l2777_c41_2a47_previous_stack_read := stack_read_value;
     VAR_neq2_uxn_opcodes_h_l2744_c41_585e_previous_stack_read := stack_read_value;
     VAR_neq_uxn_opcodes_h_l2743_c41_07e5_previous_stack_read := stack_read_value;
     VAR_nip2_uxn_opcodes_h_l2732_c41_f77a_previous_stack_read := stack_read_value;
     VAR_nip_uxn_opcodes_h_l2731_c41_eb29_previous_stack_read := stack_read_value;
     VAR_ora2_uxn_opcodes_h_l2784_c41_6380_previous_stack_read := stack_read_value;
     VAR_ora_uxn_opcodes_h_l2783_c41_9203_previous_stack_read := stack_read_value;
     VAR_ovr2_uxn_opcodes_h_l2740_c41_b517_previous_stack_read := stack_read_value;
     VAR_ovr_uxn_opcodes_h_l2739_c41_d2de_previous_stack_read := stack_read_value;
     VAR_rot2_uxn_opcodes_h_l2736_c41_5e8a_previous_stack_read := stack_read_value;
     VAR_rot_uxn_opcodes_h_l2735_c41_e9ea_previous_stack_read := stack_read_value;
     VAR_sft2_uxn_opcodes_h_l2788_c41_908a_previous_stack_read := stack_read_value;
     VAR_sft_uxn_opcodes_h_l2787_c41_741a_previous_stack_read := stack_read_value;
     VAR_sta2_uxn_opcodes_h_l2768_c41_4b8d_previous_stack_read := stack_read_value;
     VAR_sta_uxn_opcodes_h_l2767_c41_71e6_previous_stack_read := stack_read_value;
     VAR_sth2_uxn_opcodes_h_l2756_c41_0d9b_previous_stack_read := stack_read_value;
     VAR_sth_uxn_opcodes_h_l2755_c41_5d99_previous_stack_read := stack_read_value;
     VAR_str1_uxn_opcodes_h_l2763_c41_015e_previous_stack_read := stack_read_value;
     VAR_str2_uxn_opcodes_h_l2764_c41_bb2b_previous_stack_read := stack_read_value;
     VAR_stz2_uxn_opcodes_h_l2760_c41_fb87_previous_stack_read := stack_read_value;
     VAR_stz_uxn_opcodes_h_l2759_c41_a8de_previous_stack_read := stack_read_value;
     VAR_sub2_uxn_opcodes_h_l2776_c41_1929_previous_stack_read := stack_read_value;
     VAR_sub_uxn_opcodes_h_l2775_c41_2b09_previous_stack_read := stack_read_value;
     VAR_swp2_uxn_opcodes_h_l2734_c41_d5f8_previous_stack_read := stack_read_value;
     VAR_swp_uxn_opcodes_h_l2733_c41_8d73_previous_stack_read := stack_read_value;
     -- BIN_OP_AND[uxn_opcodes_h_l2715_c41_fc87] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2715_c41_fc87_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2715_c41_fc87_left;
     BIN_OP_AND_uxn_opcodes_h_l2715_c41_fc87_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2715_c41_fc87_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2715_c41_fc87_return_output := BIN_OP_AND_uxn_opcodes_h_l2715_c41_fc87_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2715_c10_1b5d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2715_c10_1b5d_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2715_c10_1b5d_left;
     BIN_OP_AND_uxn_opcodes_h_l2715_c10_1b5d_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2715_c10_1b5d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2715_c10_1b5d_return_output := BIN_OP_AND_uxn_opcodes_h_l2715_c10_1b5d_return_output;

     -- CAST_TO_uint12_t[uxn_opcodes_h_l2715_c57_50fa] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2715_c57_50fa_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_ins);

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2719_c2_7623] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2719_c2_7623_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- BIN_OP_AND[uxn_opcodes_h_l2791_c18_bc25] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2791_c18_bc25_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2791_c18_bc25_left;
     BIN_OP_AND_uxn_opcodes_h_l2791_c18_bc25_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2791_c18_bc25_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2791_c18_bc25_return_output := BIN_OP_AND_uxn_opcodes_h_l2791_c18_bc25_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2715_c10_e480_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2715_c10_1b5d_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2791_c18_7b50_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2791_c18_bc25_return_output;
     VAR_CONST_SL_4_uxn_opcodes_h_l2715_c57_42cc_x := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2715_c57_50fa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2719_c2_7623_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l2791_c18_7b50] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2791_c18_7b50_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2791_c18_7b50_left;
     BIN_OP_GT_uxn_opcodes_h_l2791_c18_7b50_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2791_c18_7b50_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2791_c18_7b50_return_output := BIN_OP_GT_uxn_opcodes_h_l2791_c18_7b50_return_output;

     -- CAST_TO_uint12_t[uxn_opcodes_h_l2715_c30_0ff7] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2715_c30_0ff7_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l2715_c41_fc87_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l2715_c10_e480] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2715_c10_e480_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2715_c10_e480_left;
     BIN_OP_GT_uxn_opcodes_h_l2715_c10_e480_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2715_c10_e480_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2715_c10_e480_return_output := BIN_OP_GT_uxn_opcodes_h_l2715_c10_e480_return_output;

     -- CONST_SL_4[uxn_opcodes_h_l2715_c57_42cc] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_opcodes_h_l2715_c57_42cc_x <= VAR_CONST_SL_4_uxn_opcodes_h_l2715_c57_42cc_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_opcodes_h_l2715_c57_42cc_return_output := CONST_SL_4_uxn_opcodes_h_l2715_c57_42cc_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2715_c10_9a20_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2715_c10_e480_return_output;
     VAR_MUX_uxn_opcodes_h_l2791_c18_cedb_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2791_c18_7b50_return_output;
     VAR_MUX_uxn_opcodes_h_l2715_c10_9a20_iftrue := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2715_c30_0ff7_return_output;
     VAR_MUX_uxn_opcodes_h_l2715_c10_9a20_iffalse := VAR_CONST_SL_4_uxn_opcodes_h_l2715_c57_42cc_return_output;
     -- MUX[uxn_opcodes_h_l2715_c10_9a20] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2715_c10_9a20_cond <= VAR_MUX_uxn_opcodes_h_l2715_c10_9a20_cond;
     MUX_uxn_opcodes_h_l2715_c10_9a20_iftrue <= VAR_MUX_uxn_opcodes_h_l2715_c10_9a20_iftrue;
     MUX_uxn_opcodes_h_l2715_c10_9a20_iffalse <= VAR_MUX_uxn_opcodes_h_l2715_c10_9a20_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2715_c10_9a20_return_output := MUX_uxn_opcodes_h_l2715_c10_9a20_return_output;

     -- MUX[uxn_opcodes_h_l2791_c18_cedb] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2791_c18_cedb_cond <= VAR_MUX_uxn_opcodes_h_l2791_c18_cedb_cond;
     MUX_uxn_opcodes_h_l2791_c18_cedb_iftrue <= VAR_MUX_uxn_opcodes_h_l2791_c18_cedb_iftrue;
     MUX_uxn_opcodes_h_l2791_c18_cedb_iffalse <= VAR_MUX_uxn_opcodes_h_l2791_c18_cedb_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2791_c18_cedb_return_output := MUX_uxn_opcodes_h_l2791_c18_cedb_return_output;

     -- Submodule level 3
     VAR_opc_uxn_opcodes_h_l2715_c2_eaa0 := VAR_MUX_uxn_opcodes_h_l2715_c10_9a20_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2792_c2_d383_left := VAR_MUX_uxn_opcodes_h_l2791_c18_cedb_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c6_9c85_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_00db_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_b889_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_3037_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_199e_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_44ba_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_a14c_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_c5e6_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_5ef0_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_0ad2_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_5533_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4aae_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_6de8_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_fafe_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_e808_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ac0e_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_a0fe_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_8aa1_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_5f86_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7149_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_22ca_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e27e_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_7a1b_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6413_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_0609_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_a896_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_1bb8_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_6138_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_514e_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_09e7_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_f60b_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_2f39_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_a76c_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_bf54_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_78a8_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_84dd_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_5c1a_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_5a5c_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_1878_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_65f0_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_6d13_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1fde_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_176d_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_01d4_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_266d_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_b6b2_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_a869_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_240e_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_9032_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_f613_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_d653_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_cba2_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_3bd7_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_0dfb_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_5404_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_21d7_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_a966_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_fcb1_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_8161_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_0ec5_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2779_c11_396f_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c11_b1c2_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_8744_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c11_e346_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_2563_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_15d9_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2785_c11_0d8e_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_d294_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_26d2_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2788_c11_ebd0_left := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     REG_VAR_opc := VAR_opc_uxn_opcodes_h_l2715_c2_eaa0;
     VAR_printf_uxn_opcodes_h_l2717_c2_8fa5_uxn_opcodes_h_l2717_c2_8fa5_arg1 := resize(VAR_opc_uxn_opcodes_h_l2715_c2_eaa0, 32);
     VAR_printf_uxn_opcodes_h_l2789_c9_4682_uxn_opcodes_h_l2789_c9_4682_arg0 := resize(VAR_opc_uxn_opcodes_h_l2715_c2_eaa0, 32);
     -- BIN_OP_EQ[uxn_opcodes_h_l2720_c11_00db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2720_c11_00db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_00db_left;
     BIN_OP_EQ_uxn_opcodes_h_l2720_c11_00db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_00db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_00db_return_output := BIN_OP_EQ_uxn_opcodes_h_l2720_c11_00db_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2779_c11_396f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2779_c11_396f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2779_c11_396f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2779_c11_396f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2779_c11_396f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2779_c11_396f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2779_c11_396f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2724_c11_44ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2724_c11_44ba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_44ba_left;
     BIN_OP_EQ_uxn_opcodes_h_l2724_c11_44ba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_44ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_44ba_return_output := BIN_OP_EQ_uxn_opcodes_h_l2724_c11_44ba_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2719_c6_9c85] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2719_c6_9c85_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c6_9c85_left;
     BIN_OP_EQ_uxn_opcodes_h_l2719_c6_9c85_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c6_9c85_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c6_9c85_return_output := BIN_OP_EQ_uxn_opcodes_h_l2719_c6_9c85_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2771_c11_3bd7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2771_c11_3bd7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_3bd7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2771_c11_3bd7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_3bd7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_3bd7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2771_c11_3bd7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2764_c11_b6b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2764_c11_b6b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_b6b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2764_c11_b6b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_b6b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_b6b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2764_c11_b6b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2758_c11_65f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2758_c11_65f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_65f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2758_c11_65f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_65f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_65f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2758_c11_65f0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2770_c11_cba2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2770_c11_cba2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_cba2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2770_c11_cba2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_cba2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_cba2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2770_c11_cba2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2739_c11_22ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2739_c11_22ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_22ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l2739_c11_22ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_22ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_22ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l2739_c11_22ca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2737_c11_5f86] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2737_c11_5f86_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_5f86_left;
     BIN_OP_EQ_uxn_opcodes_h_l2737_c11_5f86_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_5f86_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_5f86_return_output := BIN_OP_EQ_uxn_opcodes_h_l2737_c11_5f86_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2733_c11_e808] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2733_c11_e808_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_e808_left;
     BIN_OP_EQ_uxn_opcodes_h_l2733_c11_e808_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_e808_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_e808_return_output := BIN_OP_EQ_uxn_opcodes_h_l2733_c11_e808_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2777_c11_8161] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2777_c11_8161_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_8161_left;
     BIN_OP_EQ_uxn_opcodes_h_l2777_c11_8161_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_8161_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_8161_return_output := BIN_OP_EQ_uxn_opcodes_h_l2777_c11_8161_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2785_c11_0d8e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2785_c11_0d8e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2785_c11_0d8e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2785_c11_0d8e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2785_c11_0d8e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2785_c11_0d8e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2785_c11_0d8e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2773_c11_5404] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2773_c11_5404_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_5404_left;
     BIN_OP_EQ_uxn_opcodes_h_l2773_c11_5404_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_5404_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_5404_return_output := BIN_OP_EQ_uxn_opcodes_h_l2773_c11_5404_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2745_c11_1bb8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2745_c11_1bb8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_1bb8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2745_c11_1bb8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_1bb8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_1bb8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2745_c11_1bb8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2752_c11_bf54] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2752_c11_bf54_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_bf54_left;
     BIN_OP_EQ_uxn_opcodes_h_l2752_c11_bf54_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_bf54_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_bf54_return_output := BIN_OP_EQ_uxn_opcodes_h_l2752_c11_bf54_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2749_c11_f60b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2749_c11_f60b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_f60b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2749_c11_f60b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_f60b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_f60b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2749_c11_f60b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2755_c11_5c1a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2755_c11_5c1a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_5c1a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2755_c11_5c1a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_5c1a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_5c1a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2755_c11_5c1a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2766_c11_240e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2766_c11_240e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_240e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2766_c11_240e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_240e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_240e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2766_c11_240e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2729_c11_5533] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2729_c11_5533_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_5533_left;
     BIN_OP_EQ_uxn_opcodes_h_l2729_c11_5533_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_5533_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_5533_return_output := BIN_OP_EQ_uxn_opcodes_h_l2729_c11_5533_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2774_c11_21d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2774_c11_21d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_21d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2774_c11_21d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_21d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_21d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2774_c11_21d7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2788_c11_ebd0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2788_c11_ebd0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2788_c11_ebd0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2788_c11_ebd0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2788_c11_ebd0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2788_c11_ebd0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2788_c11_ebd0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2783_c11_2563] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2783_c11_2563_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_2563_left;
     BIN_OP_EQ_uxn_opcodes_h_l2783_c11_2563_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_2563_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_2563_return_output := BIN_OP_EQ_uxn_opcodes_h_l2783_c11_2563_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2763_c11_266d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2763_c11_266d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_266d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2763_c11_266d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_266d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_266d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2763_c11_266d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2728_c11_0ad2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2728_c11_0ad2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_0ad2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2728_c11_0ad2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_0ad2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_0ad2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2728_c11_0ad2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2748_c11_09e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2748_c11_09e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_09e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2748_c11_09e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_09e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_09e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2748_c11_09e7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2722_c11_3037] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2722_c11_3037_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_3037_left;
     BIN_OP_EQ_uxn_opcodes_h_l2722_c11_3037_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_3037_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_3037_return_output := BIN_OP_EQ_uxn_opcodes_h_l2722_c11_3037_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2780_c11_b1c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2780_c11_b1c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c11_b1c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2780_c11_b1c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c11_b1c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c11_b1c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2780_c11_b1c2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2731_c11_6de8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2731_c11_6de8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_6de8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2731_c11_6de8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_6de8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_6de8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2731_c11_6de8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2721_c11_b889] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2721_c11_b889_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_b889_left;
     BIN_OP_EQ_uxn_opcodes_h_l2721_c11_b889_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_b889_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_b889_return_output := BIN_OP_EQ_uxn_opcodes_h_l2721_c11_b889_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2740_c11_e27e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e27e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e27e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e27e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e27e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e27e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e27e_return_output;

     -- printf_uxn_opcodes_h_l2717_c2_8fa5[uxn_opcodes_h_l2717_c2_8fa5] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2717_c2_8fa5_uxn_opcodes_h_l2717_c2_8fa5_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2717_c2_8fa5_uxn_opcodes_h_l2717_c2_8fa5_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2717_c2_8fa5_uxn_opcodes_h_l2717_c2_8fa5_arg0 <= VAR_printf_uxn_opcodes_h_l2717_c2_8fa5_uxn_opcodes_h_l2717_c2_8fa5_arg0;
     printf_uxn_opcodes_h_l2717_c2_8fa5_uxn_opcodes_h_l2717_c2_8fa5_arg1 <= VAR_printf_uxn_opcodes_h_l2717_c2_8fa5_uxn_opcodes_h_l2717_c2_8fa5_arg1;
     printf_uxn_opcodes_h_l2717_c2_8fa5_uxn_opcodes_h_l2717_c2_8fa5_arg2 <= VAR_printf_uxn_opcodes_h_l2717_c2_8fa5_uxn_opcodes_h_l2717_c2_8fa5_arg2;
     -- Outputs

     -- BIN_OP_EQ[uxn_opcodes_h_l2769_c11_d653] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2769_c11_d653_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_d653_left;
     BIN_OP_EQ_uxn_opcodes_h_l2769_c11_d653_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_d653_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_d653_return_output := BIN_OP_EQ_uxn_opcodes_h_l2769_c11_d653_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2772_c11_0dfb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2772_c11_0dfb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_0dfb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2772_c11_0dfb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_0dfb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_0dfb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2772_c11_0dfb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2727_c11_5ef0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2727_c11_5ef0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_5ef0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2727_c11_5ef0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_5ef0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_5ef0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2727_c11_5ef0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2757_c11_1878] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2757_c11_1878_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_1878_left;
     BIN_OP_EQ_uxn_opcodes_h_l2757_c11_1878_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_1878_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_1878_return_output := BIN_OP_EQ_uxn_opcodes_h_l2757_c11_1878_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2735_c11_a0fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2735_c11_a0fe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_a0fe_left;
     BIN_OP_EQ_uxn_opcodes_h_l2735_c11_a0fe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_a0fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_a0fe_return_output := BIN_OP_EQ_uxn_opcodes_h_l2735_c11_a0fe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2741_c11_7a1b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2741_c11_7a1b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_7a1b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2741_c11_7a1b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_7a1b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_7a1b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2741_c11_7a1b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2744_c11_a896] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2744_c11_a896_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_a896_left;
     BIN_OP_EQ_uxn_opcodes_h_l2744_c11_a896_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_a896_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_a896_return_output := BIN_OP_EQ_uxn_opcodes_h_l2744_c11_a896_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2746_c11_6138] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2746_c11_6138_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_6138_left;
     BIN_OP_EQ_uxn_opcodes_h_l2746_c11_6138_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_6138_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_6138_return_output := BIN_OP_EQ_uxn_opcodes_h_l2746_c11_6138_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2781_c11_8744] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2781_c11_8744_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_8744_left;
     BIN_OP_EQ_uxn_opcodes_h_l2781_c11_8744_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_8744_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_8744_return_output := BIN_OP_EQ_uxn_opcodes_h_l2781_c11_8744_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2761_c11_176d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2761_c11_176d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_176d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2761_c11_176d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_176d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_176d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2761_c11_176d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2760_c11_1fde] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1fde_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1fde_left;
     BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1fde_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1fde_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1fde_return_output := BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1fde_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2738_c11_7149] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7149_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7149_left;
     BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7149_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7149_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7149_return_output := BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7149_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2775_c11_a966] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2775_c11_a966_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_a966_left;
     BIN_OP_EQ_uxn_opcodes_h_l2775_c11_a966_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_a966_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_a966_return_output := BIN_OP_EQ_uxn_opcodes_h_l2775_c11_a966_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2784_c11_15d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2784_c11_15d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_15d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2784_c11_15d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_15d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_15d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2784_c11_15d9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2787_c11_26d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2787_c11_26d2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_26d2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2787_c11_26d2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_26d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_26d2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2787_c11_26d2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2756_c11_5a5c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2756_c11_5a5c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_5a5c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2756_c11_5a5c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_5a5c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_5a5c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2756_c11_5a5c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2723_c11_199e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2723_c11_199e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_199e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2723_c11_199e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_199e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_199e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2723_c11_199e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2751_c11_a76c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2751_c11_a76c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_a76c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2751_c11_a76c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_a76c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_a76c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2751_c11_a76c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2765_c11_a869] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2765_c11_a869_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_a869_left;
     BIN_OP_EQ_uxn_opcodes_h_l2765_c11_a869_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_a869_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_a869_return_output := BIN_OP_EQ_uxn_opcodes_h_l2765_c11_a869_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2725_c11_a14c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2725_c11_a14c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_a14c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2725_c11_a14c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_a14c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_a14c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2725_c11_a14c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2778_c11_0ec5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2778_c11_0ec5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_0ec5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2778_c11_0ec5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_0ec5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_0ec5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2778_c11_0ec5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_ac0e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ac0e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ac0e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ac0e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ac0e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ac0e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ac0e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2753_c11_78a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2753_c11_78a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_78a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2753_c11_78a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_78a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_78a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2753_c11_78a8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2750_c11_2f39] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2750_c11_2f39_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_2f39_left;
     BIN_OP_EQ_uxn_opcodes_h_l2750_c11_2f39_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_2f39_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_2f39_return_output := BIN_OP_EQ_uxn_opcodes_h_l2750_c11_2f39_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2736_c11_8aa1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2736_c11_8aa1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_8aa1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2736_c11_8aa1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_8aa1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_8aa1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2736_c11_8aa1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2726_c11_c5e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2726_c11_c5e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_c5e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2726_c11_c5e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_c5e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_c5e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2726_c11_c5e6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2762_c11_01d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2762_c11_01d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_01d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2762_c11_01d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_01d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_01d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2762_c11_01d4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2767_c11_9032] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2767_c11_9032_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_9032_left;
     BIN_OP_EQ_uxn_opcodes_h_l2767_c11_9032_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_9032_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_9032_return_output := BIN_OP_EQ_uxn_opcodes_h_l2767_c11_9032_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2782_c11_e346] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2782_c11_e346_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c11_e346_left;
     BIN_OP_EQ_uxn_opcodes_h_l2782_c11_e346_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c11_e346_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c11_e346_return_output := BIN_OP_EQ_uxn_opcodes_h_l2782_c11_e346_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2768_c11_f613] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2768_c11_f613_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_f613_left;
     BIN_OP_EQ_uxn_opcodes_h_l2768_c11_f613_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_f613_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_f613_return_output := BIN_OP_EQ_uxn_opcodes_h_l2768_c11_f613_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2776_c11_fcb1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2776_c11_fcb1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_fcb1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2776_c11_fcb1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_fcb1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_fcb1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2776_c11_fcb1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2759_c11_6d13] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2759_c11_6d13_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_6d13_left;
     BIN_OP_EQ_uxn_opcodes_h_l2759_c11_6d13_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_6d13_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_6d13_return_output := BIN_OP_EQ_uxn_opcodes_h_l2759_c11_6d13_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2732_c11_fafe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2732_c11_fafe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_fafe_left;
     BIN_OP_EQ_uxn_opcodes_h_l2732_c11_fafe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_fafe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_fafe_return_output := BIN_OP_EQ_uxn_opcodes_h_l2732_c11_fafe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2754_c11_84dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2754_c11_84dd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_84dd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2754_c11_84dd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_84dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_84dd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2754_c11_84dd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2743_c11_0609] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2743_c11_0609_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_0609_left;
     BIN_OP_EQ_uxn_opcodes_h_l2743_c11_0609_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_0609_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_0609_return_output := BIN_OP_EQ_uxn_opcodes_h_l2743_c11_0609_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2786_c11_d294] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2786_c11_d294_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_d294_left;
     BIN_OP_EQ_uxn_opcodes_h_l2786_c11_d294_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_d294_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_d294_return_output := BIN_OP_EQ_uxn_opcodes_h_l2786_c11_d294_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2747_c11_514e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2747_c11_514e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_514e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2747_c11_514e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_514e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_514e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2747_c11_514e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2742_c11_6413] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6413_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6413_left;
     BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6413_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6413_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6413_return_output := BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6413_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2730_c11_4aae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4aae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4aae_left;
     BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4aae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4aae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4aae_return_output := BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4aae_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_e407_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c6_9c85_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_373a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c6_9c85_return_output;
     VAR_is_wait_MUX_uxn_opcodes_h_l2719_c2_7623_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c6_9c85_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c6_9c85_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ec20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_00db_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_a825_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_00db_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_e407_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_00db_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_c4d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_b889_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ae96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_b889_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_ec20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_b889_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_00f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_3037_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_d39b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_3037_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_c4d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_3037_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_a630_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_199e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_c6b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_199e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_00f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_199e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_7af2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_44ba_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_2230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_44ba_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_a630_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_44ba_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_3a5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_a14c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_03ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_a14c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_7af2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_a14c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_dbd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_c5e6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_ee2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_c5e6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_3a5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_c5e6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_a2ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_5ef0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_889b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_5ef0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_dbd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_5ef0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_988f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_0ad2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_0f21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_0ad2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_a2ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_0ad2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7400_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_5533_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_f84d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_5533_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_988f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_5533_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_3b86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4aae_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_509f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4aae_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_7400_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_4aae_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_f6bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_6de8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_9bb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_6de8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_3b86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_6de8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_5637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_fafe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_c424_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_fafe_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_f6bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_fafe_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_9913_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_e808_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_bc11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_e808_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_5637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_e808_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_9222_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ac0e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_4713_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ac0e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_9913_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ac0e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_c9d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_a0fe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_be25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_a0fe_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_9222_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_a0fe_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5747_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_8aa1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_ef8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_8aa1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_c9d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_8aa1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_de36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_5f86_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_55f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_5f86_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_5747_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_5f86_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_5f2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7149_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_2997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7149_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_de36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_7149_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_019a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_22ca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_4560_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_22ca_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_5f2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_22ca_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_7319_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e27e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_105b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e27e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_019a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_e27e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5e67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_7a1b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_d3e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_7a1b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_7319_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_7a1b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_e6ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6413_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_0c31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6413_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5e67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_6413_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_a164_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_0609_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_04c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_0609_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_e6ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_0609_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_b420_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_a896_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_7d78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_a896_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_a164_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_a896_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_d2e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_1bb8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_5f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_1bb8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_b420_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_1bb8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_f293_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_6138_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_f622_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_6138_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_d2e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_6138_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_d33a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_514e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_14a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_514e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_f293_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_514e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_6263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_09e7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_73f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_09e7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_d33a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_09e7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_5aec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_f60b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_4674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_f60b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_6263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_f60b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_bd9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_2f39_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_473e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_2f39_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_5aec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_2f39_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_6f4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_a76c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_d9d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_a76c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_bd9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_a76c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_7348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_bf54_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_dbbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_bf54_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_6f4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_bf54_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_b6fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_78a8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_ebac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_78a8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_7348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_78a8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_abc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_84dd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_f981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_84dd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_b6fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_84dd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_a1cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_5c1a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_3d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_5c1a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_abc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_5c1a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_3c85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_5a5c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_1fc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_5a5c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_a1cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_5a5c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_d95e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_1878_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_4ff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_1878_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_3c85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_1878_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1288_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_65f0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_8d5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_65f0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_d95e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_65f0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_79e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_6d13_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_73a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_6d13_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_1288_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_6d13_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_4431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1fde_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_9ffd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1fde_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_79e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1fde_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_e022_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_176d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_0a6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_176d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_4431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_176d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_b6e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_01d4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6150_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_01d4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_e022_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_01d4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_5cdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_266d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_838b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_266d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_b6e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_266d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_6ff0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_b6b2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_c8be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_b6b2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_5cdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_b6b2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_00d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_a869_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_32a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_a869_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_6ff0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_a869_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_8f80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_240e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_3762_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_240e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_00d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_240e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_11d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_9032_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_bd7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_9032_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_8f80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_9032_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_78bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_f613_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d8b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_f613_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_11d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_f613_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_7171_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_d653_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7e55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_d653_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_78bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_d653_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_19ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_cba2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_994a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_cba2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_7171_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_cba2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fbeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_3bd7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_4699_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_3bd7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_19ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_3bd7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_e729_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_0dfb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_0aaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_0dfb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_fbeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_0dfb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_0c6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_5404_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_fe36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_5404_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_e729_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_5404_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_dfdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_21d7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8e4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_21d7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_0c6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2774_c11_21d7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_86e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_a966_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_eb0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_a966_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_dfdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2775_c11_a966_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_e883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_fcb1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fb29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_fcb1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_86e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_fcb1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_3cbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_8161_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_810f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_8161_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_e883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_8161_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_4639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_0ec5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_8252_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_0ec5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2778_c7_3cbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_0ec5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_e6c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2779_c11_396f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_27d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2779_c11_396f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2779_c7_4639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2779_c11_396f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_8f15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c11_b1c2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_28e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c11_b1c2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2780_c7_e6c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c11_b1c2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c7_1774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_8744_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_9c00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_8744_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2781_c7_8f15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_8744_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c7_13d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c11_e346_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_0042_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c11_e346_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2782_c7_1774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c11_e346_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c7_4d58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_2563_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c1_b3f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_2563_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2783_c7_13d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_2563_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c7_a5f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_15d9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c1_7d8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_15d9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2784_c7_4d58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_15d9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c7_bd8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2785_c11_0d8e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c1_01b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2785_c11_0d8e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2785_c7_a5f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2785_c11_0d8e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c7_7515_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_d294_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c1_bc33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_d294_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2786_c7_bd8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_d294_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c7_9bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_26d2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c1_5847_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_26d2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2787_c7_7515_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_26d2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2789_c1_1fe8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2788_c11_ebd0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c1_c8ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2788_c11_ebd0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2788_c7_9bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2788_c11_ebd0_return_output;
     -- is_wait_MUX[uxn_opcodes_h_l2719_c2_7623] LATENCY=0
     -- Inputs
     is_wait_MUX_uxn_opcodes_h_l2719_c2_7623_cond <= VAR_is_wait_MUX_uxn_opcodes_h_l2719_c2_7623_cond;
     is_wait_MUX_uxn_opcodes_h_l2719_c2_7623_iftrue <= VAR_is_wait_MUX_uxn_opcodes_h_l2719_c2_7623_iftrue;
     is_wait_MUX_uxn_opcodes_h_l2719_c2_7623_iffalse <= VAR_is_wait_MUX_uxn_opcodes_h_l2719_c2_7623_iffalse;
     -- Outputs
     VAR_is_wait_MUX_uxn_opcodes_h_l2719_c2_7623_return_output := is_wait_MUX_uxn_opcodes_h_l2719_c2_7623_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2719_c1_373a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_373a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_373a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_373a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_373a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_373a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_373a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_373a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_373a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2720_c7_e407] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_e407_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_e407_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_e407_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_e407_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_e407_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_e407_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_e407_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_e407_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ec20_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_e407_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_a825_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_e407_return_output;
     VAR_printf_uxn_opcodes_h_l2719_c23_84f6_uxn_opcodes_h_l2719_c23_84f6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_373a_return_output;
     REG_VAR_is_wait := VAR_is_wait_MUX_uxn_opcodes_h_l2719_c2_7623_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2721_c7_ec20] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ec20_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ec20_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ec20_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ec20_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ec20_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ec20_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ec20_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ec20_return_output;

     -- printf_uxn_opcodes_h_l2719_c23_84f6[uxn_opcodes_h_l2719_c23_84f6] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2719_c23_84f6_uxn_opcodes_h_l2719_c23_84f6_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2719_c23_84f6_uxn_opcodes_h_l2719_c23_84f6_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2720_c1_a825] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_a825_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_a825_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_a825_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_a825_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_a825_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_a825_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_a825_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_a825_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_c4d4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ec20_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ae96_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_ec20_return_output;
     VAR_jci_uxn_opcodes_h_l2720_c41_46ad_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_a825_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2721_c1_ae96] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ae96_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ae96_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ae96_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ae96_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ae96_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ae96_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ae96_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ae96_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2722_c7_c4d4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_c4d4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_c4d4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_c4d4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_c4d4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_c4d4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_c4d4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_c4d4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_c4d4_return_output;

     -- jci[uxn_opcodes_h_l2720_c41_46ad] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l2720_c41_46ad_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l2720_c41_46ad_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l2720_c41_46ad_phase <= VAR_jci_uxn_opcodes_h_l2720_c41_46ad_phase;
     jci_uxn_opcodes_h_l2720_c41_46ad_pc <= VAR_jci_uxn_opcodes_h_l2720_c41_46ad_pc;
     jci_uxn_opcodes_h_l2720_c41_46ad_previous_stack_read <= VAR_jci_uxn_opcodes_h_l2720_c41_46ad_previous_stack_read;
     jci_uxn_opcodes_h_l2720_c41_46ad_previous_ram_read <= VAR_jci_uxn_opcodes_h_l2720_c41_46ad_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l2720_c41_46ad_return_output := jci_uxn_opcodes_h_l2720_c41_46ad_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_00f0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_c4d4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_d39b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_c4d4_return_output;
     VAR_jmi_uxn_opcodes_h_l2721_c41_8067_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_ae96_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_e407_iftrue := VAR_jci_uxn_opcodes_h_l2720_c41_46ad_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2723_c7_00f0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_00f0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_00f0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_00f0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_00f0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_00f0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_00f0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_00f0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_00f0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2722_c1_d39b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_d39b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_d39b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_d39b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_d39b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_d39b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_d39b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_d39b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_d39b_return_output;

     -- jmi[uxn_opcodes_h_l2721_c41_8067] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l2721_c41_8067_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l2721_c41_8067_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l2721_c41_8067_phase <= VAR_jmi_uxn_opcodes_h_l2721_c41_8067_phase;
     jmi_uxn_opcodes_h_l2721_c41_8067_pc <= VAR_jmi_uxn_opcodes_h_l2721_c41_8067_pc;
     jmi_uxn_opcodes_h_l2721_c41_8067_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l2721_c41_8067_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l2721_c41_8067_return_output := jmi_uxn_opcodes_h_l2721_c41_8067_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_a630_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_00f0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_c6b9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_00f0_return_output;
     VAR_jsi_uxn_opcodes_h_l2722_c41_19e6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_d39b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_ec20_iftrue := VAR_jmi_uxn_opcodes_h_l2721_c41_8067_return_output;
     -- jsi[uxn_opcodes_h_l2722_c41_19e6] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l2722_c41_19e6_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l2722_c41_19e6_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l2722_c41_19e6_phase <= VAR_jsi_uxn_opcodes_h_l2722_c41_19e6_phase;
     jsi_uxn_opcodes_h_l2722_c41_19e6_pc <= VAR_jsi_uxn_opcodes_h_l2722_c41_19e6_pc;
     jsi_uxn_opcodes_h_l2722_c41_19e6_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l2722_c41_19e6_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l2722_c41_19e6_return_output := jsi_uxn_opcodes_h_l2722_c41_19e6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2724_c7_a630] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_a630_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_a630_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_a630_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_a630_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_a630_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_a630_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_a630_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_a630_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2723_c1_c6b9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_c6b9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_c6b9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_c6b9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_c6b9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_c6b9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_c6b9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_c6b9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_c6b9_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_7af2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_a630_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_2230_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_a630_return_output;
     VAR_lit_uxn_opcodes_h_l2723_c41_d996_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_c6b9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_c4d4_iftrue := VAR_jsi_uxn_opcodes_h_l2722_c41_19e6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2724_c1_2230] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_2230_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_2230_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_2230_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_2230_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_2230_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_2230_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_2230_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_2230_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2725_c7_7af2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_7af2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_7af2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_7af2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_7af2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_7af2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_7af2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_7af2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_7af2_return_output;

     -- lit[uxn_opcodes_h_l2723_c41_d996] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2723_c41_d996_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2723_c41_d996_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2723_c41_d996_phase <= VAR_lit_uxn_opcodes_h_l2723_c41_d996_phase;
     lit_uxn_opcodes_h_l2723_c41_d996_pc <= VAR_lit_uxn_opcodes_h_l2723_c41_d996_pc;
     lit_uxn_opcodes_h_l2723_c41_d996_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2723_c41_d996_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2723_c41_d996_return_output := lit_uxn_opcodes_h_l2723_c41_d996_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_3a5d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_7af2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_03ea_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_7af2_return_output;
     VAR_lit2_uxn_opcodes_h_l2724_c41_0f38_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_2230_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_00f0_iftrue := VAR_lit_uxn_opcodes_h_l2723_c41_d996_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2726_c7_3a5d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_3a5d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_3a5d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_3a5d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_3a5d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_3a5d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_3a5d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_3a5d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_3a5d_return_output;

     -- lit2[uxn_opcodes_h_l2724_c41_0f38] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2724_c41_0f38_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2724_c41_0f38_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2724_c41_0f38_phase <= VAR_lit2_uxn_opcodes_h_l2724_c41_0f38_phase;
     lit2_uxn_opcodes_h_l2724_c41_0f38_pc <= VAR_lit2_uxn_opcodes_h_l2724_c41_0f38_pc;
     lit2_uxn_opcodes_h_l2724_c41_0f38_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2724_c41_0f38_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2724_c41_0f38_return_output := lit2_uxn_opcodes_h_l2724_c41_0f38_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2725_c1_03ea] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_03ea_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_03ea_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_03ea_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_03ea_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_03ea_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_03ea_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_03ea_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_03ea_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_dbd2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_3a5d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_ee2d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_3a5d_return_output;
     VAR_lit_uxn_opcodes_h_l2725_c41_c710_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_03ea_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_a630_iftrue := VAR_lit2_uxn_opcodes_h_l2724_c41_0f38_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2726_c1_ee2d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_ee2d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_ee2d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_ee2d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_ee2d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_ee2d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_ee2d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_ee2d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_ee2d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2727_c7_dbd2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_dbd2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_dbd2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_dbd2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_dbd2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_dbd2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_dbd2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_dbd2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_dbd2_return_output;

     -- lit[uxn_opcodes_h_l2725_c41_c710] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2725_c41_c710_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2725_c41_c710_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2725_c41_c710_phase <= VAR_lit_uxn_opcodes_h_l2725_c41_c710_phase;
     lit_uxn_opcodes_h_l2725_c41_c710_pc <= VAR_lit_uxn_opcodes_h_l2725_c41_c710_pc;
     lit_uxn_opcodes_h_l2725_c41_c710_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2725_c41_c710_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2725_c41_c710_return_output := lit_uxn_opcodes_h_l2725_c41_c710_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_a2ba_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_dbd2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_889b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_dbd2_return_output;
     VAR_lit2_uxn_opcodes_h_l2726_c41_e80e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_ee2d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_7af2_iftrue := VAR_lit_uxn_opcodes_h_l2725_c41_c710_return_output;
     -- lit2[uxn_opcodes_h_l2726_c41_e80e] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2726_c41_e80e_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2726_c41_e80e_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2726_c41_e80e_phase <= VAR_lit2_uxn_opcodes_h_l2726_c41_e80e_phase;
     lit2_uxn_opcodes_h_l2726_c41_e80e_pc <= VAR_lit2_uxn_opcodes_h_l2726_c41_e80e_pc;
     lit2_uxn_opcodes_h_l2726_c41_e80e_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2726_c41_e80e_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2726_c41_e80e_return_output := lit2_uxn_opcodes_h_l2726_c41_e80e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2727_c1_889b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_889b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_889b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_889b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_889b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_889b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_889b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_889b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_889b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2728_c7_a2ba] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_a2ba_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_a2ba_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_a2ba_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_a2ba_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_a2ba_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_a2ba_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_a2ba_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_a2ba_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_988f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_a2ba_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_0f21_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_a2ba_return_output;
     VAR_inc_uxn_opcodes_h_l2727_c41_8d51_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_889b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_3a5d_iftrue := VAR_lit2_uxn_opcodes_h_l2726_c41_e80e_return_output;
     -- inc[uxn_opcodes_h_l2727_c41_8d51] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l2727_c41_8d51_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l2727_c41_8d51_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l2727_c41_8d51_phase <= VAR_inc_uxn_opcodes_h_l2727_c41_8d51_phase;
     inc_uxn_opcodes_h_l2727_c41_8d51_ins <= VAR_inc_uxn_opcodes_h_l2727_c41_8d51_ins;
     inc_uxn_opcodes_h_l2727_c41_8d51_previous_stack_read <= VAR_inc_uxn_opcodes_h_l2727_c41_8d51_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l2727_c41_8d51_return_output := inc_uxn_opcodes_h_l2727_c41_8d51_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2728_c1_0f21] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_0f21_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_0f21_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_0f21_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_0f21_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_0f21_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_0f21_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_0f21_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_0f21_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2729_c7_988f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_988f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_988f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_988f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_988f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_988f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_988f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_988f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_988f_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7400_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_988f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_f84d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_988f_return_output;
     VAR_inc2_uxn_opcodes_h_l2728_c41_e26b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_0f21_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_dbd2_iftrue := VAR_inc_uxn_opcodes_h_l2727_c41_8d51_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2730_c7_7400] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7400_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7400_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7400_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7400_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7400_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7400_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7400_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7400_return_output;

     -- inc2[uxn_opcodes_h_l2728_c41_e26b] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l2728_c41_e26b_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l2728_c41_e26b_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l2728_c41_e26b_phase <= VAR_inc2_uxn_opcodes_h_l2728_c41_e26b_phase;
     inc2_uxn_opcodes_h_l2728_c41_e26b_ins <= VAR_inc2_uxn_opcodes_h_l2728_c41_e26b_ins;
     inc2_uxn_opcodes_h_l2728_c41_e26b_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l2728_c41_e26b_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l2728_c41_e26b_return_output := inc2_uxn_opcodes_h_l2728_c41_e26b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2729_c1_f84d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_f84d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_f84d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_f84d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_f84d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_f84d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_f84d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_f84d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_f84d_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_3b86_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7400_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_509f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_7400_return_output;
     VAR_pop_uxn_opcodes_h_l2729_c41_d160_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_f84d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_a2ba_iftrue := VAR_inc2_uxn_opcodes_h_l2728_c41_e26b_return_output;
     -- pop[uxn_opcodes_h_l2729_c41_d160] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l2729_c41_d160_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l2729_c41_d160_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l2729_c41_d160_phase <= VAR_pop_uxn_opcodes_h_l2729_c41_d160_phase;
     pop_uxn_opcodes_h_l2729_c41_d160_ins <= VAR_pop_uxn_opcodes_h_l2729_c41_d160_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l2729_c41_d160_return_output := pop_uxn_opcodes_h_l2729_c41_d160_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2730_c1_509f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_509f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_509f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_509f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_509f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_509f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_509f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_509f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_509f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2731_c7_3b86] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_3b86_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_3b86_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_3b86_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_3b86_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_3b86_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_3b86_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_3b86_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_3b86_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_f6bb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_3b86_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_9bb2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_3b86_return_output;
     VAR_pop2_uxn_opcodes_h_l2730_c41_6214_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_509f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_988f_iftrue := VAR_pop_uxn_opcodes_h_l2729_c41_d160_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2732_c7_f6bb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_f6bb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_f6bb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_f6bb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_f6bb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_f6bb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_f6bb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_f6bb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_f6bb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2731_c1_9bb2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_9bb2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_9bb2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_9bb2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_9bb2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_9bb2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_9bb2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_9bb2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_9bb2_return_output;

     -- pop2[uxn_opcodes_h_l2730_c41_6214] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l2730_c41_6214_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l2730_c41_6214_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l2730_c41_6214_phase <= VAR_pop2_uxn_opcodes_h_l2730_c41_6214_phase;
     pop2_uxn_opcodes_h_l2730_c41_6214_ins <= VAR_pop2_uxn_opcodes_h_l2730_c41_6214_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l2730_c41_6214_return_output := pop2_uxn_opcodes_h_l2730_c41_6214_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_5637_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_f6bb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_c424_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_f6bb_return_output;
     VAR_nip_uxn_opcodes_h_l2731_c41_eb29_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_9bb2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_7400_iftrue := VAR_pop2_uxn_opcodes_h_l2730_c41_6214_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2733_c7_5637] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_5637_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_5637_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_5637_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_5637_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_5637_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_5637_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_5637_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_5637_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2732_c1_c424] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_c424_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_c424_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_c424_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_c424_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_c424_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_c424_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_c424_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_c424_return_output;

     -- nip[uxn_opcodes_h_l2731_c41_eb29] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l2731_c41_eb29_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l2731_c41_eb29_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l2731_c41_eb29_phase <= VAR_nip_uxn_opcodes_h_l2731_c41_eb29_phase;
     nip_uxn_opcodes_h_l2731_c41_eb29_ins <= VAR_nip_uxn_opcodes_h_l2731_c41_eb29_ins;
     nip_uxn_opcodes_h_l2731_c41_eb29_previous_stack_read <= VAR_nip_uxn_opcodes_h_l2731_c41_eb29_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l2731_c41_eb29_return_output := nip_uxn_opcodes_h_l2731_c41_eb29_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_9913_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_5637_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_bc11_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_5637_return_output;
     VAR_nip2_uxn_opcodes_h_l2732_c41_f77a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_c424_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_3b86_iftrue := VAR_nip_uxn_opcodes_h_l2731_c41_eb29_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2733_c1_bc11] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_bc11_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_bc11_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_bc11_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_bc11_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_bc11_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_bc11_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_bc11_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_bc11_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2734_c7_9913] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_9913_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_9913_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_9913_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_9913_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_9913_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_9913_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_9913_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_9913_return_output;

     -- nip2[uxn_opcodes_h_l2732_c41_f77a] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l2732_c41_f77a_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l2732_c41_f77a_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l2732_c41_f77a_phase <= VAR_nip2_uxn_opcodes_h_l2732_c41_f77a_phase;
     nip2_uxn_opcodes_h_l2732_c41_f77a_ins <= VAR_nip2_uxn_opcodes_h_l2732_c41_f77a_ins;
     nip2_uxn_opcodes_h_l2732_c41_f77a_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l2732_c41_f77a_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l2732_c41_f77a_return_output := nip2_uxn_opcodes_h_l2732_c41_f77a_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_9222_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_9913_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_4713_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_9913_return_output;
     VAR_swp_uxn_opcodes_h_l2733_c41_8d73_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_bc11_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_f6bb_iftrue := VAR_nip2_uxn_opcodes_h_l2732_c41_f77a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2735_c7_9222] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_9222_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_9222_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_9222_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_9222_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_9222_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_9222_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_9222_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_9222_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2734_c1_4713] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_4713_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_4713_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_4713_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_4713_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_4713_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_4713_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_4713_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_4713_return_output;

     -- swp[uxn_opcodes_h_l2733_c41_8d73] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l2733_c41_8d73_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l2733_c41_8d73_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l2733_c41_8d73_phase <= VAR_swp_uxn_opcodes_h_l2733_c41_8d73_phase;
     swp_uxn_opcodes_h_l2733_c41_8d73_ins <= VAR_swp_uxn_opcodes_h_l2733_c41_8d73_ins;
     swp_uxn_opcodes_h_l2733_c41_8d73_previous_stack_read <= VAR_swp_uxn_opcodes_h_l2733_c41_8d73_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l2733_c41_8d73_return_output := swp_uxn_opcodes_h_l2733_c41_8d73_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_c9d1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_9222_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_be25_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_9222_return_output;
     VAR_swp2_uxn_opcodes_h_l2734_c41_d5f8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_4713_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_5637_iftrue := VAR_swp_uxn_opcodes_h_l2733_c41_8d73_return_output;
     -- swp2[uxn_opcodes_h_l2734_c41_d5f8] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l2734_c41_d5f8_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l2734_c41_d5f8_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l2734_c41_d5f8_phase <= VAR_swp2_uxn_opcodes_h_l2734_c41_d5f8_phase;
     swp2_uxn_opcodes_h_l2734_c41_d5f8_ins <= VAR_swp2_uxn_opcodes_h_l2734_c41_d5f8_ins;
     swp2_uxn_opcodes_h_l2734_c41_d5f8_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l2734_c41_d5f8_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l2734_c41_d5f8_return_output := swp2_uxn_opcodes_h_l2734_c41_d5f8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2735_c1_be25] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_be25_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_be25_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_be25_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_be25_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_be25_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_be25_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_be25_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_be25_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2736_c7_c9d1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_c9d1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_c9d1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_c9d1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_c9d1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_c9d1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_c9d1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_c9d1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_c9d1_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5747_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_c9d1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_ef8c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_c9d1_return_output;
     VAR_rot_uxn_opcodes_h_l2735_c41_e9ea_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_be25_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_9913_iftrue := VAR_swp2_uxn_opcodes_h_l2734_c41_d5f8_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2736_c1_ef8c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_ef8c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_ef8c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_ef8c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_ef8c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_ef8c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_ef8c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_ef8c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_ef8c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2737_c7_5747] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5747_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5747_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5747_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5747_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5747_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5747_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5747_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5747_return_output;

     -- rot[uxn_opcodes_h_l2735_c41_e9ea] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l2735_c41_e9ea_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l2735_c41_e9ea_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l2735_c41_e9ea_phase <= VAR_rot_uxn_opcodes_h_l2735_c41_e9ea_phase;
     rot_uxn_opcodes_h_l2735_c41_e9ea_ins <= VAR_rot_uxn_opcodes_h_l2735_c41_e9ea_ins;
     rot_uxn_opcodes_h_l2735_c41_e9ea_previous_stack_read <= VAR_rot_uxn_opcodes_h_l2735_c41_e9ea_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l2735_c41_e9ea_return_output := rot_uxn_opcodes_h_l2735_c41_e9ea_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_de36_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5747_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_55f3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_5747_return_output;
     VAR_rot2_uxn_opcodes_h_l2736_c41_5e8a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_ef8c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_9222_iftrue := VAR_rot_uxn_opcodes_h_l2735_c41_e9ea_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2738_c7_de36] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_de36_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_de36_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_de36_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_de36_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_de36_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_de36_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_de36_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_de36_return_output;

     -- rot2[uxn_opcodes_h_l2736_c41_5e8a] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l2736_c41_5e8a_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l2736_c41_5e8a_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l2736_c41_5e8a_phase <= VAR_rot2_uxn_opcodes_h_l2736_c41_5e8a_phase;
     rot2_uxn_opcodes_h_l2736_c41_5e8a_ins <= VAR_rot2_uxn_opcodes_h_l2736_c41_5e8a_ins;
     rot2_uxn_opcodes_h_l2736_c41_5e8a_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l2736_c41_5e8a_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l2736_c41_5e8a_return_output := rot2_uxn_opcodes_h_l2736_c41_5e8a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2737_c1_55f3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_55f3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_55f3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_55f3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_55f3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_55f3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_55f3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_55f3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_55f3_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_5f2f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_de36_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_2997_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_de36_return_output;
     VAR_dup_uxn_opcodes_h_l2737_c41_3be7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_55f3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_c9d1_iftrue := VAR_rot2_uxn_opcodes_h_l2736_c41_5e8a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2738_c1_2997] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_2997_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_2997_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_2997_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_2997_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_2997_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_2997_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_2997_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_2997_return_output;

     -- dup[uxn_opcodes_h_l2737_c41_3be7] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l2737_c41_3be7_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l2737_c41_3be7_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l2737_c41_3be7_phase <= VAR_dup_uxn_opcodes_h_l2737_c41_3be7_phase;
     dup_uxn_opcodes_h_l2737_c41_3be7_ins <= VAR_dup_uxn_opcodes_h_l2737_c41_3be7_ins;
     dup_uxn_opcodes_h_l2737_c41_3be7_previous_stack_read <= VAR_dup_uxn_opcodes_h_l2737_c41_3be7_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l2737_c41_3be7_return_output := dup_uxn_opcodes_h_l2737_c41_3be7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2739_c7_5f2f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_5f2f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_5f2f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_5f2f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_5f2f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_5f2f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_5f2f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_5f2f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_5f2f_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_019a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_5f2f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_4560_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_5f2f_return_output;
     VAR_dup2_uxn_opcodes_h_l2738_c41_aabb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_2997_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_5747_iftrue := VAR_dup_uxn_opcodes_h_l2737_c41_3be7_return_output;
     -- dup2[uxn_opcodes_h_l2738_c41_aabb] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l2738_c41_aabb_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l2738_c41_aabb_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l2738_c41_aabb_phase <= VAR_dup2_uxn_opcodes_h_l2738_c41_aabb_phase;
     dup2_uxn_opcodes_h_l2738_c41_aabb_ins <= VAR_dup2_uxn_opcodes_h_l2738_c41_aabb_ins;
     dup2_uxn_opcodes_h_l2738_c41_aabb_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l2738_c41_aabb_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l2738_c41_aabb_return_output := dup2_uxn_opcodes_h_l2738_c41_aabb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2739_c1_4560] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_4560_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_4560_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_4560_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_4560_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_4560_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_4560_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_4560_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_4560_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2740_c7_019a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_019a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_019a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_019a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_019a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_019a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_019a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_019a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_019a_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_7319_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_019a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_105b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_019a_return_output;
     VAR_ovr_uxn_opcodes_h_l2739_c41_d2de_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_4560_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_de36_iftrue := VAR_dup2_uxn_opcodes_h_l2738_c41_aabb_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2741_c7_7319] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_7319_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_7319_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_7319_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_7319_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_7319_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_7319_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_7319_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_7319_return_output;

     -- ovr[uxn_opcodes_h_l2739_c41_d2de] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l2739_c41_d2de_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l2739_c41_d2de_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l2739_c41_d2de_phase <= VAR_ovr_uxn_opcodes_h_l2739_c41_d2de_phase;
     ovr_uxn_opcodes_h_l2739_c41_d2de_ins <= VAR_ovr_uxn_opcodes_h_l2739_c41_d2de_ins;
     ovr_uxn_opcodes_h_l2739_c41_d2de_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l2739_c41_d2de_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l2739_c41_d2de_return_output := ovr_uxn_opcodes_h_l2739_c41_d2de_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2740_c1_105b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_105b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_105b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_105b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_105b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_105b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_105b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_105b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_105b_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5e67_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_7319_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_d3e4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_7319_return_output;
     VAR_ovr2_uxn_opcodes_h_l2740_c41_b517_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_105b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_5f2f_iftrue := VAR_ovr_uxn_opcodes_h_l2739_c41_d2de_return_output;
     -- ovr2[uxn_opcodes_h_l2740_c41_b517] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l2740_c41_b517_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l2740_c41_b517_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l2740_c41_b517_phase <= VAR_ovr2_uxn_opcodes_h_l2740_c41_b517_phase;
     ovr2_uxn_opcodes_h_l2740_c41_b517_ins <= VAR_ovr2_uxn_opcodes_h_l2740_c41_b517_ins;
     ovr2_uxn_opcodes_h_l2740_c41_b517_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l2740_c41_b517_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l2740_c41_b517_return_output := ovr2_uxn_opcodes_h_l2740_c41_b517_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2742_c7_5e67] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5e67_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5e67_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5e67_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5e67_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5e67_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5e67_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5e67_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5e67_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2741_c1_d3e4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_d3e4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_d3e4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_d3e4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_d3e4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_d3e4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_d3e4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_d3e4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_d3e4_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_e6ca_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5e67_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_0c31_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_5e67_return_output;
     VAR_equ_uxn_opcodes_h_l2741_c41_d8da_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_d3e4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_019a_iftrue := VAR_ovr2_uxn_opcodes_h_l2740_c41_b517_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2743_c7_e6ca] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_e6ca_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_e6ca_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_e6ca_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_e6ca_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_e6ca_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_e6ca_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_e6ca_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_e6ca_return_output;

     -- equ[uxn_opcodes_h_l2741_c41_d8da] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l2741_c41_d8da_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l2741_c41_d8da_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l2741_c41_d8da_phase <= VAR_equ_uxn_opcodes_h_l2741_c41_d8da_phase;
     equ_uxn_opcodes_h_l2741_c41_d8da_ins <= VAR_equ_uxn_opcodes_h_l2741_c41_d8da_ins;
     equ_uxn_opcodes_h_l2741_c41_d8da_previous_stack_read <= VAR_equ_uxn_opcodes_h_l2741_c41_d8da_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l2741_c41_d8da_return_output := equ_uxn_opcodes_h_l2741_c41_d8da_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2742_c1_0c31] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_0c31_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_0c31_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_0c31_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_0c31_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_0c31_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_0c31_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_0c31_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_0c31_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_a164_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_e6ca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_04c1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_e6ca_return_output;
     VAR_equ2_uxn_opcodes_h_l2742_c41_adc2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_0c31_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_7319_iftrue := VAR_equ_uxn_opcodes_h_l2741_c41_d8da_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2743_c1_04c1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_04c1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_04c1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_04c1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_04c1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_04c1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_04c1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_04c1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_04c1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2744_c7_a164] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_a164_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_a164_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_a164_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_a164_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_a164_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_a164_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_a164_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_a164_return_output;

     -- equ2[uxn_opcodes_h_l2742_c41_adc2] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l2742_c41_adc2_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l2742_c41_adc2_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l2742_c41_adc2_phase <= VAR_equ2_uxn_opcodes_h_l2742_c41_adc2_phase;
     equ2_uxn_opcodes_h_l2742_c41_adc2_ins <= VAR_equ2_uxn_opcodes_h_l2742_c41_adc2_ins;
     equ2_uxn_opcodes_h_l2742_c41_adc2_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l2742_c41_adc2_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l2742_c41_adc2_return_output := equ2_uxn_opcodes_h_l2742_c41_adc2_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_b420_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_a164_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_7d78_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_a164_return_output;
     VAR_neq_uxn_opcodes_h_l2743_c41_07e5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_04c1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5e67_iftrue := VAR_equ2_uxn_opcodes_h_l2742_c41_adc2_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2744_c1_7d78] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_7d78_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_7d78_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_7d78_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_7d78_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_7d78_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_7d78_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_7d78_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_7d78_return_output;

     -- neq[uxn_opcodes_h_l2743_c41_07e5] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l2743_c41_07e5_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l2743_c41_07e5_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l2743_c41_07e5_phase <= VAR_neq_uxn_opcodes_h_l2743_c41_07e5_phase;
     neq_uxn_opcodes_h_l2743_c41_07e5_ins <= VAR_neq_uxn_opcodes_h_l2743_c41_07e5_ins;
     neq_uxn_opcodes_h_l2743_c41_07e5_previous_stack_read <= VAR_neq_uxn_opcodes_h_l2743_c41_07e5_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l2743_c41_07e5_return_output := neq_uxn_opcodes_h_l2743_c41_07e5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2745_c7_b420] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_b420_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_b420_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_b420_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_b420_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_b420_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_b420_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_b420_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_b420_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_d2e2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_b420_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_5f12_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_b420_return_output;
     VAR_neq2_uxn_opcodes_h_l2744_c41_585e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_7d78_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_e6ca_iftrue := VAR_neq_uxn_opcodes_h_l2743_c41_07e5_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2745_c1_5f12] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_5f12_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_5f12_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_5f12_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_5f12_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_5f12_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_5f12_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_5f12_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_5f12_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2746_c7_d2e2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_d2e2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_d2e2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_d2e2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_d2e2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_d2e2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_d2e2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_d2e2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_d2e2_return_output;

     -- neq2[uxn_opcodes_h_l2744_c41_585e] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l2744_c41_585e_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l2744_c41_585e_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l2744_c41_585e_phase <= VAR_neq2_uxn_opcodes_h_l2744_c41_585e_phase;
     neq2_uxn_opcodes_h_l2744_c41_585e_ins <= VAR_neq2_uxn_opcodes_h_l2744_c41_585e_ins;
     neq2_uxn_opcodes_h_l2744_c41_585e_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l2744_c41_585e_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l2744_c41_585e_return_output := neq2_uxn_opcodes_h_l2744_c41_585e_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_f293_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_d2e2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_f622_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_d2e2_return_output;
     VAR_gth_uxn_opcodes_h_l2745_c41_19d9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_5f12_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_a164_iftrue := VAR_neq2_uxn_opcodes_h_l2744_c41_585e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2747_c7_f293] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_f293_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_f293_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_f293_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_f293_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_f293_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_f293_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_f293_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_f293_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2746_c1_f622] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_f622_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_f622_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_f622_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_f622_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_f622_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_f622_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_f622_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_f622_return_output;

     -- gth[uxn_opcodes_h_l2745_c41_19d9] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l2745_c41_19d9_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l2745_c41_19d9_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l2745_c41_19d9_phase <= VAR_gth_uxn_opcodes_h_l2745_c41_19d9_phase;
     gth_uxn_opcodes_h_l2745_c41_19d9_ins <= VAR_gth_uxn_opcodes_h_l2745_c41_19d9_ins;
     gth_uxn_opcodes_h_l2745_c41_19d9_previous_stack_read <= VAR_gth_uxn_opcodes_h_l2745_c41_19d9_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l2745_c41_19d9_return_output := gth_uxn_opcodes_h_l2745_c41_19d9_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_d33a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_f293_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_14a3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_f293_return_output;
     VAR_gth2_uxn_opcodes_h_l2746_c41_ee3e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_f622_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_b420_iftrue := VAR_gth_uxn_opcodes_h_l2745_c41_19d9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2747_c1_14a3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_14a3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_14a3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_14a3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_14a3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_14a3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_14a3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_14a3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_14a3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2748_c7_d33a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_d33a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_d33a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_d33a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_d33a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_d33a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_d33a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_d33a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_d33a_return_output;

     -- gth2[uxn_opcodes_h_l2746_c41_ee3e] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l2746_c41_ee3e_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l2746_c41_ee3e_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l2746_c41_ee3e_phase <= VAR_gth2_uxn_opcodes_h_l2746_c41_ee3e_phase;
     gth2_uxn_opcodes_h_l2746_c41_ee3e_ins <= VAR_gth2_uxn_opcodes_h_l2746_c41_ee3e_ins;
     gth2_uxn_opcodes_h_l2746_c41_ee3e_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l2746_c41_ee3e_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l2746_c41_ee3e_return_output := gth2_uxn_opcodes_h_l2746_c41_ee3e_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_6263_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_d33a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_73f9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_d33a_return_output;
     VAR_lth_uxn_opcodes_h_l2747_c41_6584_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_14a3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_d2e2_iftrue := VAR_gth2_uxn_opcodes_h_l2746_c41_ee3e_return_output;
     -- lth[uxn_opcodes_h_l2747_c41_6584] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l2747_c41_6584_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l2747_c41_6584_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l2747_c41_6584_phase <= VAR_lth_uxn_opcodes_h_l2747_c41_6584_phase;
     lth_uxn_opcodes_h_l2747_c41_6584_ins <= VAR_lth_uxn_opcodes_h_l2747_c41_6584_ins;
     lth_uxn_opcodes_h_l2747_c41_6584_previous_stack_read <= VAR_lth_uxn_opcodes_h_l2747_c41_6584_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l2747_c41_6584_return_output := lth_uxn_opcodes_h_l2747_c41_6584_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2748_c1_73f9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_73f9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_73f9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_73f9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_73f9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_73f9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_73f9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_73f9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_73f9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2749_c7_6263] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_6263_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_6263_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_6263_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_6263_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_6263_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_6263_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_6263_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_6263_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_5aec_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_6263_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_4674_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_6263_return_output;
     VAR_lth2_uxn_opcodes_h_l2748_c41_01ea_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_73f9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_f293_iftrue := VAR_lth_uxn_opcodes_h_l2747_c41_6584_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2750_c7_5aec] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_5aec_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_5aec_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_5aec_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_5aec_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_5aec_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_5aec_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_5aec_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_5aec_return_output;

     -- lth2[uxn_opcodes_h_l2748_c41_01ea] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l2748_c41_01ea_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l2748_c41_01ea_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l2748_c41_01ea_phase <= VAR_lth2_uxn_opcodes_h_l2748_c41_01ea_phase;
     lth2_uxn_opcodes_h_l2748_c41_01ea_ins <= VAR_lth2_uxn_opcodes_h_l2748_c41_01ea_ins;
     lth2_uxn_opcodes_h_l2748_c41_01ea_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l2748_c41_01ea_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l2748_c41_01ea_return_output := lth2_uxn_opcodes_h_l2748_c41_01ea_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2749_c1_4674] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_4674_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_4674_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_4674_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_4674_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_4674_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_4674_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_4674_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_4674_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_bd9c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_5aec_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_473e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_5aec_return_output;
     VAR_jmp_uxn_opcodes_h_l2749_c41_e115_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_4674_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_d33a_iftrue := VAR_lth2_uxn_opcodes_h_l2748_c41_01ea_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2751_c7_bd9c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_bd9c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_bd9c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_bd9c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_bd9c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_bd9c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_bd9c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_bd9c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_bd9c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2750_c1_473e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_473e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_473e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_473e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_473e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_473e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_473e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_473e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_473e_return_output;

     -- jmp[uxn_opcodes_h_l2749_c41_e115] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l2749_c41_e115_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l2749_c41_e115_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l2749_c41_e115_phase <= VAR_jmp_uxn_opcodes_h_l2749_c41_e115_phase;
     jmp_uxn_opcodes_h_l2749_c41_e115_ins <= VAR_jmp_uxn_opcodes_h_l2749_c41_e115_ins;
     jmp_uxn_opcodes_h_l2749_c41_e115_pc <= VAR_jmp_uxn_opcodes_h_l2749_c41_e115_pc;
     jmp_uxn_opcodes_h_l2749_c41_e115_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l2749_c41_e115_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l2749_c41_e115_return_output := jmp_uxn_opcodes_h_l2749_c41_e115_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_6f4f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_bd9c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_d9d4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_bd9c_return_output;
     VAR_jmp2_uxn_opcodes_h_l2750_c41_dabe_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_473e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_6263_iftrue := VAR_jmp_uxn_opcodes_h_l2749_c41_e115_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2752_c7_6f4f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_6f4f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_6f4f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_6f4f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_6f4f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_6f4f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_6f4f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_6f4f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_6f4f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2751_c1_d9d4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_d9d4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_d9d4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_d9d4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_d9d4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_d9d4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_d9d4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_d9d4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_d9d4_return_output;

     -- jmp2[uxn_opcodes_h_l2750_c41_dabe] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l2750_c41_dabe_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l2750_c41_dabe_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l2750_c41_dabe_phase <= VAR_jmp2_uxn_opcodes_h_l2750_c41_dabe_phase;
     jmp2_uxn_opcodes_h_l2750_c41_dabe_ins <= VAR_jmp2_uxn_opcodes_h_l2750_c41_dabe_ins;
     jmp2_uxn_opcodes_h_l2750_c41_dabe_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l2750_c41_dabe_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l2750_c41_dabe_return_output := jmp2_uxn_opcodes_h_l2750_c41_dabe_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_7348_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_6f4f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_dbbc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_6f4f_return_output;
     VAR_jcn_uxn_opcodes_h_l2751_c41_f92d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_d9d4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_5aec_iftrue := VAR_jmp2_uxn_opcodes_h_l2750_c41_dabe_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2752_c1_dbbc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_dbbc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_dbbc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_dbbc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_dbbc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_dbbc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_dbbc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_dbbc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_dbbc_return_output;

     -- jcn[uxn_opcodes_h_l2751_c41_f92d] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l2751_c41_f92d_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l2751_c41_f92d_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l2751_c41_f92d_phase <= VAR_jcn_uxn_opcodes_h_l2751_c41_f92d_phase;
     jcn_uxn_opcodes_h_l2751_c41_f92d_ins <= VAR_jcn_uxn_opcodes_h_l2751_c41_f92d_ins;
     jcn_uxn_opcodes_h_l2751_c41_f92d_pc <= VAR_jcn_uxn_opcodes_h_l2751_c41_f92d_pc;
     jcn_uxn_opcodes_h_l2751_c41_f92d_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l2751_c41_f92d_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l2751_c41_f92d_return_output := jcn_uxn_opcodes_h_l2751_c41_f92d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2753_c7_7348] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_7348_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_7348_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_7348_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_7348_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_7348_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_7348_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_7348_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_7348_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_b6fe_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_7348_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_ebac_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_7348_return_output;
     VAR_jcn2_uxn_opcodes_h_l2752_c41_f5ce_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_dbbc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_bd9c_iftrue := VAR_jcn_uxn_opcodes_h_l2751_c41_f92d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2754_c7_b6fe] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_b6fe_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_b6fe_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_b6fe_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_b6fe_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_b6fe_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_b6fe_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_b6fe_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_b6fe_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2753_c1_ebac] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_ebac_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_ebac_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_ebac_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_ebac_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_ebac_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_ebac_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_ebac_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_ebac_return_output;

     -- jcn2[uxn_opcodes_h_l2752_c41_f5ce] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l2752_c41_f5ce_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l2752_c41_f5ce_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l2752_c41_f5ce_phase <= VAR_jcn2_uxn_opcodes_h_l2752_c41_f5ce_phase;
     jcn2_uxn_opcodes_h_l2752_c41_f5ce_ins <= VAR_jcn2_uxn_opcodes_h_l2752_c41_f5ce_ins;
     jcn2_uxn_opcodes_h_l2752_c41_f5ce_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l2752_c41_f5ce_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l2752_c41_f5ce_return_output := jcn2_uxn_opcodes_h_l2752_c41_f5ce_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_abc1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_b6fe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_f981_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_b6fe_return_output;
     VAR_jsr_uxn_opcodes_h_l2753_c41_be6e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_ebac_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_6f4f_iftrue := VAR_jcn2_uxn_opcodes_h_l2752_c41_f5ce_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2755_c7_abc1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_abc1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_abc1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_abc1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_abc1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_abc1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_abc1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_abc1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_abc1_return_output;

     -- jsr[uxn_opcodes_h_l2753_c41_be6e] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l2753_c41_be6e_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l2753_c41_be6e_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l2753_c41_be6e_phase <= VAR_jsr_uxn_opcodes_h_l2753_c41_be6e_phase;
     jsr_uxn_opcodes_h_l2753_c41_be6e_ins <= VAR_jsr_uxn_opcodes_h_l2753_c41_be6e_ins;
     jsr_uxn_opcodes_h_l2753_c41_be6e_pc <= VAR_jsr_uxn_opcodes_h_l2753_c41_be6e_pc;
     jsr_uxn_opcodes_h_l2753_c41_be6e_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l2753_c41_be6e_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l2753_c41_be6e_return_output := jsr_uxn_opcodes_h_l2753_c41_be6e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2754_c1_f981] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_f981_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_f981_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_f981_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_f981_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_f981_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_f981_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_f981_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_f981_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_a1cb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_abc1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_3d97_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_abc1_return_output;
     VAR_jsr2_uxn_opcodes_h_l2754_c41_daf7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_f981_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_7348_iftrue := VAR_jsr_uxn_opcodes_h_l2753_c41_be6e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2755_c1_3d97] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_3d97_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_3d97_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_3d97_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_3d97_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_3d97_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_3d97_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_3d97_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_3d97_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2756_c7_a1cb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_a1cb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_a1cb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_a1cb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_a1cb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_a1cb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_a1cb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_a1cb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_a1cb_return_output;

     -- jsr2[uxn_opcodes_h_l2754_c41_daf7] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l2754_c41_daf7_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l2754_c41_daf7_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l2754_c41_daf7_phase <= VAR_jsr2_uxn_opcodes_h_l2754_c41_daf7_phase;
     jsr2_uxn_opcodes_h_l2754_c41_daf7_ins <= VAR_jsr2_uxn_opcodes_h_l2754_c41_daf7_ins;
     jsr2_uxn_opcodes_h_l2754_c41_daf7_pc <= VAR_jsr2_uxn_opcodes_h_l2754_c41_daf7_pc;
     jsr2_uxn_opcodes_h_l2754_c41_daf7_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l2754_c41_daf7_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l2754_c41_daf7_return_output := jsr2_uxn_opcodes_h_l2754_c41_daf7_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_3c85_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_a1cb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_1fc7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_a1cb_return_output;
     VAR_sth_uxn_opcodes_h_l2755_c41_5d99_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_3d97_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_b6fe_iftrue := VAR_jsr2_uxn_opcodes_h_l2754_c41_daf7_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2756_c1_1fc7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_1fc7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_1fc7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_1fc7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_1fc7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_1fc7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_1fc7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_1fc7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_1fc7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2757_c7_3c85] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_3c85_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_3c85_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_3c85_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_3c85_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_3c85_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_3c85_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_3c85_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_3c85_return_output;

     -- sth[uxn_opcodes_h_l2755_c41_5d99] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l2755_c41_5d99_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l2755_c41_5d99_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l2755_c41_5d99_phase <= VAR_sth_uxn_opcodes_h_l2755_c41_5d99_phase;
     sth_uxn_opcodes_h_l2755_c41_5d99_ins <= VAR_sth_uxn_opcodes_h_l2755_c41_5d99_ins;
     sth_uxn_opcodes_h_l2755_c41_5d99_previous_stack_read <= VAR_sth_uxn_opcodes_h_l2755_c41_5d99_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l2755_c41_5d99_return_output := sth_uxn_opcodes_h_l2755_c41_5d99_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_d95e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_3c85_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_4ff3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_3c85_return_output;
     VAR_sth2_uxn_opcodes_h_l2756_c41_0d9b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_1fc7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_abc1_iftrue := VAR_sth_uxn_opcodes_h_l2755_c41_5d99_return_output;
     -- sth2[uxn_opcodes_h_l2756_c41_0d9b] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l2756_c41_0d9b_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l2756_c41_0d9b_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l2756_c41_0d9b_phase <= VAR_sth2_uxn_opcodes_h_l2756_c41_0d9b_phase;
     sth2_uxn_opcodes_h_l2756_c41_0d9b_ins <= VAR_sth2_uxn_opcodes_h_l2756_c41_0d9b_ins;
     sth2_uxn_opcodes_h_l2756_c41_0d9b_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l2756_c41_0d9b_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l2756_c41_0d9b_return_output := sth2_uxn_opcodes_h_l2756_c41_0d9b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2758_c7_d95e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_d95e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_d95e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_d95e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_d95e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_d95e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_d95e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_d95e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_d95e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2757_c1_4ff3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_4ff3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_4ff3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_4ff3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_4ff3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_4ff3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_4ff3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_4ff3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_4ff3_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1288_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_d95e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_8d5d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_d95e_return_output;
     VAR_ldz_uxn_opcodes_h_l2757_c41_b38e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_4ff3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_a1cb_iftrue := VAR_sth2_uxn_opcodes_h_l2756_c41_0d9b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2759_c7_1288] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1288_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1288_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1288_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1288_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1288_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1288_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1288_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1288_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2758_c1_8d5d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_8d5d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_8d5d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_8d5d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_8d5d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_8d5d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_8d5d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_8d5d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_8d5d_return_output;

     -- ldz[uxn_opcodes_h_l2757_c41_b38e] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l2757_c41_b38e_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l2757_c41_b38e_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l2757_c41_b38e_phase <= VAR_ldz_uxn_opcodes_h_l2757_c41_b38e_phase;
     ldz_uxn_opcodes_h_l2757_c41_b38e_ins <= VAR_ldz_uxn_opcodes_h_l2757_c41_b38e_ins;
     ldz_uxn_opcodes_h_l2757_c41_b38e_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l2757_c41_b38e_previous_stack_read;
     ldz_uxn_opcodes_h_l2757_c41_b38e_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l2757_c41_b38e_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l2757_c41_b38e_return_output := ldz_uxn_opcodes_h_l2757_c41_b38e_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_79e6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1288_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_73a4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_1288_return_output;
     VAR_ldz2_uxn_opcodes_h_l2758_c41_6f6e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_8d5d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_3c85_iftrue := VAR_ldz_uxn_opcodes_h_l2757_c41_b38e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2759_c1_73a4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_73a4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_73a4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_73a4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_73a4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_73a4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_73a4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_73a4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_73a4_return_output;

     -- ldz2[uxn_opcodes_h_l2758_c41_6f6e] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l2758_c41_6f6e_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l2758_c41_6f6e_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l2758_c41_6f6e_phase <= VAR_ldz2_uxn_opcodes_h_l2758_c41_6f6e_phase;
     ldz2_uxn_opcodes_h_l2758_c41_6f6e_ins <= VAR_ldz2_uxn_opcodes_h_l2758_c41_6f6e_ins;
     ldz2_uxn_opcodes_h_l2758_c41_6f6e_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l2758_c41_6f6e_previous_stack_read;
     ldz2_uxn_opcodes_h_l2758_c41_6f6e_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l2758_c41_6f6e_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l2758_c41_6f6e_return_output := ldz2_uxn_opcodes_h_l2758_c41_6f6e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2760_c7_79e6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_79e6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_79e6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_79e6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_79e6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_79e6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_79e6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_79e6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_79e6_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_4431_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_79e6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_9ffd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_79e6_return_output;
     VAR_stz_uxn_opcodes_h_l2759_c41_a8de_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_73a4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_d95e_iftrue := VAR_ldz2_uxn_opcodes_h_l2758_c41_6f6e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2760_c1_9ffd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_9ffd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_9ffd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_9ffd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_9ffd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_9ffd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_9ffd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_9ffd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_9ffd_return_output;

     -- stz[uxn_opcodes_h_l2759_c41_a8de] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l2759_c41_a8de_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l2759_c41_a8de_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l2759_c41_a8de_phase <= VAR_stz_uxn_opcodes_h_l2759_c41_a8de_phase;
     stz_uxn_opcodes_h_l2759_c41_a8de_ins <= VAR_stz_uxn_opcodes_h_l2759_c41_a8de_ins;
     stz_uxn_opcodes_h_l2759_c41_a8de_previous_stack_read <= VAR_stz_uxn_opcodes_h_l2759_c41_a8de_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l2759_c41_a8de_return_output := stz_uxn_opcodes_h_l2759_c41_a8de_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2761_c7_4431] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_4431_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_4431_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_4431_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_4431_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_4431_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_4431_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_4431_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_4431_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_e022_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_4431_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_0a6c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_4431_return_output;
     VAR_stz2_uxn_opcodes_h_l2760_c41_fb87_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_9ffd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_1288_iftrue := VAR_stz_uxn_opcodes_h_l2759_c41_a8de_return_output;
     -- stz2[uxn_opcodes_h_l2760_c41_fb87] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l2760_c41_fb87_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l2760_c41_fb87_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l2760_c41_fb87_phase <= VAR_stz2_uxn_opcodes_h_l2760_c41_fb87_phase;
     stz2_uxn_opcodes_h_l2760_c41_fb87_ins <= VAR_stz2_uxn_opcodes_h_l2760_c41_fb87_ins;
     stz2_uxn_opcodes_h_l2760_c41_fb87_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l2760_c41_fb87_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l2760_c41_fb87_return_output := stz2_uxn_opcodes_h_l2760_c41_fb87_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2761_c1_0a6c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_0a6c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_0a6c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_0a6c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_0a6c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_0a6c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_0a6c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_0a6c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_0a6c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2762_c7_e022] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_e022_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_e022_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_e022_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_e022_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_e022_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_e022_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_e022_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_e022_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_b6e2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_e022_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6150_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_e022_return_output;
     VAR_ldr_uxn_opcodes_h_l2761_c41_8783_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_0a6c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_79e6_iftrue := VAR_stz2_uxn_opcodes_h_l2760_c41_fb87_return_output;
     -- ldr[uxn_opcodes_h_l2761_c41_8783] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l2761_c41_8783_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l2761_c41_8783_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l2761_c41_8783_phase <= VAR_ldr_uxn_opcodes_h_l2761_c41_8783_phase;
     ldr_uxn_opcodes_h_l2761_c41_8783_ins <= VAR_ldr_uxn_opcodes_h_l2761_c41_8783_ins;
     ldr_uxn_opcodes_h_l2761_c41_8783_pc <= VAR_ldr_uxn_opcodes_h_l2761_c41_8783_pc;
     ldr_uxn_opcodes_h_l2761_c41_8783_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l2761_c41_8783_previous_stack_read;
     ldr_uxn_opcodes_h_l2761_c41_8783_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l2761_c41_8783_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l2761_c41_8783_return_output := ldr_uxn_opcodes_h_l2761_c41_8783_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2762_c1_6150] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6150_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6150_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6150_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6150_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6150_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6150_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6150_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6150_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2763_c7_b6e2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_b6e2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_b6e2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_b6e2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_b6e2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_b6e2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_b6e2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_b6e2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_b6e2_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_5cdd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_b6e2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_838b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_b6e2_return_output;
     VAR_ldr2_uxn_opcodes_h_l2762_c41_c2f9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_6150_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_4431_iftrue := VAR_ldr_uxn_opcodes_h_l2761_c41_8783_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2764_c7_5cdd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_5cdd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_5cdd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_5cdd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_5cdd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_5cdd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_5cdd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_5cdd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_5cdd_return_output;

     -- ldr2[uxn_opcodes_h_l2762_c41_c2f9] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l2762_c41_c2f9_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l2762_c41_c2f9_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l2762_c41_c2f9_phase <= VAR_ldr2_uxn_opcodes_h_l2762_c41_c2f9_phase;
     ldr2_uxn_opcodes_h_l2762_c41_c2f9_ins <= VAR_ldr2_uxn_opcodes_h_l2762_c41_c2f9_ins;
     ldr2_uxn_opcodes_h_l2762_c41_c2f9_pc <= VAR_ldr2_uxn_opcodes_h_l2762_c41_c2f9_pc;
     ldr2_uxn_opcodes_h_l2762_c41_c2f9_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l2762_c41_c2f9_previous_stack_read;
     ldr2_uxn_opcodes_h_l2762_c41_c2f9_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l2762_c41_c2f9_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l2762_c41_c2f9_return_output := ldr2_uxn_opcodes_h_l2762_c41_c2f9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2763_c1_838b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_838b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_838b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_838b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_838b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_838b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_838b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_838b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_838b_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_6ff0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_5cdd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_c8be_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_5cdd_return_output;
     VAR_str1_uxn_opcodes_h_l2763_c41_015e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_838b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_e022_iftrue := VAR_ldr2_uxn_opcodes_h_l2762_c41_c2f9_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2765_c7_6ff0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_6ff0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_6ff0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_6ff0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_6ff0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_6ff0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_6ff0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_6ff0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_6ff0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2764_c1_c8be] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_c8be_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_c8be_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_c8be_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_c8be_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_c8be_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_c8be_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_c8be_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_c8be_return_output;

     -- str1[uxn_opcodes_h_l2763_c41_015e] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l2763_c41_015e_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l2763_c41_015e_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l2763_c41_015e_phase <= VAR_str1_uxn_opcodes_h_l2763_c41_015e_phase;
     str1_uxn_opcodes_h_l2763_c41_015e_ins <= VAR_str1_uxn_opcodes_h_l2763_c41_015e_ins;
     str1_uxn_opcodes_h_l2763_c41_015e_pc <= VAR_str1_uxn_opcodes_h_l2763_c41_015e_pc;
     str1_uxn_opcodes_h_l2763_c41_015e_previous_stack_read <= VAR_str1_uxn_opcodes_h_l2763_c41_015e_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l2763_c41_015e_return_output := str1_uxn_opcodes_h_l2763_c41_015e_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_00d4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_6ff0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_32a7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_6ff0_return_output;
     VAR_str2_uxn_opcodes_h_l2764_c41_bb2b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_c8be_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_b6e2_iftrue := VAR_str1_uxn_opcodes_h_l2763_c41_015e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2766_c7_00d4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_00d4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_00d4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_00d4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_00d4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_00d4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_00d4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_00d4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_00d4_return_output;

     -- str2[uxn_opcodes_h_l2764_c41_bb2b] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l2764_c41_bb2b_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l2764_c41_bb2b_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l2764_c41_bb2b_phase <= VAR_str2_uxn_opcodes_h_l2764_c41_bb2b_phase;
     str2_uxn_opcodes_h_l2764_c41_bb2b_ins <= VAR_str2_uxn_opcodes_h_l2764_c41_bb2b_ins;
     str2_uxn_opcodes_h_l2764_c41_bb2b_pc <= VAR_str2_uxn_opcodes_h_l2764_c41_bb2b_pc;
     str2_uxn_opcodes_h_l2764_c41_bb2b_previous_stack_read <= VAR_str2_uxn_opcodes_h_l2764_c41_bb2b_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l2764_c41_bb2b_return_output := str2_uxn_opcodes_h_l2764_c41_bb2b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2765_c1_32a7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_32a7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_32a7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_32a7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_32a7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_32a7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_32a7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_32a7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_32a7_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_8f80_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_00d4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_3762_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_00d4_return_output;
     VAR_lda_uxn_opcodes_h_l2765_c41_31a1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_32a7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_5cdd_iftrue := VAR_str2_uxn_opcodes_h_l2764_c41_bb2b_return_output;
     -- lda[uxn_opcodes_h_l2765_c41_31a1] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l2765_c41_31a1_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l2765_c41_31a1_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l2765_c41_31a1_phase <= VAR_lda_uxn_opcodes_h_l2765_c41_31a1_phase;
     lda_uxn_opcodes_h_l2765_c41_31a1_ins <= VAR_lda_uxn_opcodes_h_l2765_c41_31a1_ins;
     lda_uxn_opcodes_h_l2765_c41_31a1_previous_stack_read <= VAR_lda_uxn_opcodes_h_l2765_c41_31a1_previous_stack_read;
     lda_uxn_opcodes_h_l2765_c41_31a1_previous_ram_read <= VAR_lda_uxn_opcodes_h_l2765_c41_31a1_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l2765_c41_31a1_return_output := lda_uxn_opcodes_h_l2765_c41_31a1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2767_c7_8f80] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_8f80_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_8f80_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_8f80_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_8f80_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_8f80_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_8f80_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_8f80_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_8f80_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2766_c1_3762] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_3762_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_3762_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_3762_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_3762_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_3762_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_3762_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_3762_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_3762_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_11d7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_8f80_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_bd7f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_8f80_return_output;
     VAR_lda2_uxn_opcodes_h_l2766_c41_cd54_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_3762_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_6ff0_iftrue := VAR_lda_uxn_opcodes_h_l2765_c41_31a1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2767_c1_bd7f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_bd7f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_bd7f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_bd7f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_bd7f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_bd7f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_bd7f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_bd7f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_bd7f_return_output;

     -- lda2[uxn_opcodes_h_l2766_c41_cd54] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l2766_c41_cd54_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l2766_c41_cd54_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l2766_c41_cd54_phase <= VAR_lda2_uxn_opcodes_h_l2766_c41_cd54_phase;
     lda2_uxn_opcodes_h_l2766_c41_cd54_ins <= VAR_lda2_uxn_opcodes_h_l2766_c41_cd54_ins;
     lda2_uxn_opcodes_h_l2766_c41_cd54_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l2766_c41_cd54_previous_stack_read;
     lda2_uxn_opcodes_h_l2766_c41_cd54_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l2766_c41_cd54_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l2766_c41_cd54_return_output := lda2_uxn_opcodes_h_l2766_c41_cd54_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2768_c7_11d7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_11d7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_11d7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_11d7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_11d7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_11d7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_11d7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_11d7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_11d7_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_78bb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_11d7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d8b2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_11d7_return_output;
     VAR_sta_uxn_opcodes_h_l2767_c41_71e6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_bd7f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_00d4_iftrue := VAR_lda2_uxn_opcodes_h_l2766_c41_cd54_return_output;
     -- sta[uxn_opcodes_h_l2767_c41_71e6] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l2767_c41_71e6_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l2767_c41_71e6_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l2767_c41_71e6_phase <= VAR_sta_uxn_opcodes_h_l2767_c41_71e6_phase;
     sta_uxn_opcodes_h_l2767_c41_71e6_ins <= VAR_sta_uxn_opcodes_h_l2767_c41_71e6_ins;
     sta_uxn_opcodes_h_l2767_c41_71e6_previous_stack_read <= VAR_sta_uxn_opcodes_h_l2767_c41_71e6_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l2767_c41_71e6_return_output := sta_uxn_opcodes_h_l2767_c41_71e6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2768_c1_d8b2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d8b2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d8b2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d8b2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d8b2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d8b2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d8b2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d8b2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d8b2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2769_c7_78bb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_78bb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_78bb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_78bb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_78bb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_78bb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_78bb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_78bb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_78bb_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_7171_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_78bb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7e55_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_78bb_return_output;
     VAR_sta2_uxn_opcodes_h_l2768_c41_4b8d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d8b2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_8f80_iftrue := VAR_sta_uxn_opcodes_h_l2767_c41_71e6_return_output;
     -- sta2[uxn_opcodes_h_l2768_c41_4b8d] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l2768_c41_4b8d_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l2768_c41_4b8d_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l2768_c41_4b8d_phase <= VAR_sta2_uxn_opcodes_h_l2768_c41_4b8d_phase;
     sta2_uxn_opcodes_h_l2768_c41_4b8d_ins <= VAR_sta2_uxn_opcodes_h_l2768_c41_4b8d_ins;
     sta2_uxn_opcodes_h_l2768_c41_4b8d_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l2768_c41_4b8d_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l2768_c41_4b8d_return_output := sta2_uxn_opcodes_h_l2768_c41_4b8d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2769_c1_7e55] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7e55_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7e55_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7e55_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7e55_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7e55_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7e55_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7e55_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7e55_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2770_c7_7171] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_7171_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_7171_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_7171_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_7171_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_7171_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_7171_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_7171_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_7171_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_19ef_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_7171_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_994a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c7_7171_return_output;
     VAR_dei_uxn_opcodes_h_l2769_c41_9a0e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_7e55_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_11d7_iftrue := VAR_sta2_uxn_opcodes_h_l2768_c41_4b8d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2771_c7_19ef] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_19ef_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_19ef_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_19ef_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_19ef_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_19ef_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_19ef_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_19ef_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_19ef_return_output;

     -- dei[uxn_opcodes_h_l2769_c41_9a0e] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l2769_c41_9a0e_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l2769_c41_9a0e_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l2769_c41_9a0e_phase <= VAR_dei_uxn_opcodes_h_l2769_c41_9a0e_phase;
     dei_uxn_opcodes_h_l2769_c41_9a0e_ins <= VAR_dei_uxn_opcodes_h_l2769_c41_9a0e_ins;
     dei_uxn_opcodes_h_l2769_c41_9a0e_previous_stack_read <= VAR_dei_uxn_opcodes_h_l2769_c41_9a0e_previous_stack_read;
     dei_uxn_opcodes_h_l2769_c41_9a0e_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l2769_c41_9a0e_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l2769_c41_9a0e_return_output := dei_uxn_opcodes_h_l2769_c41_9a0e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2770_c1_994a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_994a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_994a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_994a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_994a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_994a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_994a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_994a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_994a_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fbeb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_19ef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_4699_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c7_19ef_return_output;
     VAR_dei2_uxn_opcodes_h_l2770_c41_d02e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_994a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_78bb_iftrue := VAR_dei_uxn_opcodes_h_l2769_c41_9a0e_return_output;
     -- dei2[uxn_opcodes_h_l2770_c41_d02e] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l2770_c41_d02e_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l2770_c41_d02e_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l2770_c41_d02e_phase <= VAR_dei2_uxn_opcodes_h_l2770_c41_d02e_phase;
     dei2_uxn_opcodes_h_l2770_c41_d02e_ins <= VAR_dei2_uxn_opcodes_h_l2770_c41_d02e_ins;
     dei2_uxn_opcodes_h_l2770_c41_d02e_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l2770_c41_d02e_previous_stack_read;
     dei2_uxn_opcodes_h_l2770_c41_d02e_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l2770_c41_d02e_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l2770_c41_d02e_return_output := dei2_uxn_opcodes_h_l2770_c41_d02e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2771_c1_4699] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_4699_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_4699_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_4699_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_4699_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_4699_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_4699_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_4699_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_4699_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2772_c7_fbeb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fbeb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fbeb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fbeb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fbeb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fbeb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fbeb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fbeb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fbeb_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_e729_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fbeb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_0aaa_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c7_fbeb_return_output;
     VAR_deo_uxn_opcodes_h_l2771_c41_d1c0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2771_c1_4699_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_7171_iftrue := VAR_dei2_uxn_opcodes_h_l2770_c41_d02e_return_output;
     -- deo[uxn_opcodes_h_l2771_c41_d1c0] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l2771_c41_d1c0_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l2771_c41_d1c0_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l2771_c41_d1c0_phase <= VAR_deo_uxn_opcodes_h_l2771_c41_d1c0_phase;
     deo_uxn_opcodes_h_l2771_c41_d1c0_ins <= VAR_deo_uxn_opcodes_h_l2771_c41_d1c0_ins;
     deo_uxn_opcodes_h_l2771_c41_d1c0_previous_stack_read <= VAR_deo_uxn_opcodes_h_l2771_c41_d1c0_previous_stack_read;
     deo_uxn_opcodes_h_l2771_c41_d1c0_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l2771_c41_d1c0_previous_device_ram_read;
     deo_uxn_opcodes_h_l2771_c41_d1c0_previous_ram_read <= VAR_deo_uxn_opcodes_h_l2771_c41_d1c0_previous_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l2771_c41_d1c0_return_output := deo_uxn_opcodes_h_l2771_c41_d1c0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2772_c1_0aaa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_0aaa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_0aaa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_0aaa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_0aaa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_0aaa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_0aaa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_0aaa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_0aaa_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2773_c7_e729] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_e729_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_e729_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_e729_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_e729_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_e729_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_e729_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_e729_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_e729_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_0c6e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_e729_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_fe36_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c7_e729_return_output;
     VAR_deo2_uxn_opcodes_h_l2772_c41_a1d9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2772_c1_0aaa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_19ef_iftrue := VAR_deo_uxn_opcodes_h_l2771_c41_d1c0_return_output;
     -- deo2[uxn_opcodes_h_l2772_c41_a1d9] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l2772_c41_a1d9_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l2772_c41_a1d9_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l2772_c41_a1d9_phase <= VAR_deo2_uxn_opcodes_h_l2772_c41_a1d9_phase;
     deo2_uxn_opcodes_h_l2772_c41_a1d9_ins <= VAR_deo2_uxn_opcodes_h_l2772_c41_a1d9_ins;
     deo2_uxn_opcodes_h_l2772_c41_a1d9_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l2772_c41_a1d9_previous_stack_read;
     deo2_uxn_opcodes_h_l2772_c41_a1d9_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l2772_c41_a1d9_previous_device_ram_read;
     deo2_uxn_opcodes_h_l2772_c41_a1d9_previous_ram_read <= VAR_deo2_uxn_opcodes_h_l2772_c41_a1d9_previous_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l2772_c41_a1d9_return_output := deo2_uxn_opcodes_h_l2772_c41_a1d9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2774_c7_0c6e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_0c6e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_0c6e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_0c6e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_0c6e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_0c6e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_0c6e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_0c6e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_0c6e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2773_c1_fe36] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_fe36_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_fe36_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_fe36_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_fe36_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_fe36_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_fe36_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_fe36_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_fe36_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_dfdd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_0c6e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8e4b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c7_0c6e_return_output;
     VAR_add_uxn_opcodes_h_l2773_c41_9472_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2773_c1_fe36_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_fbeb_iftrue := VAR_deo2_uxn_opcodes_h_l2772_c41_a1d9_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2775_c7_dfdd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_dfdd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_dfdd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_dfdd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_dfdd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_dfdd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_dfdd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_dfdd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_dfdd_return_output;

     -- add[uxn_opcodes_h_l2773_c41_9472] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l2773_c41_9472_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l2773_c41_9472_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l2773_c41_9472_phase <= VAR_add_uxn_opcodes_h_l2773_c41_9472_phase;
     add_uxn_opcodes_h_l2773_c41_9472_ins <= VAR_add_uxn_opcodes_h_l2773_c41_9472_ins;
     add_uxn_opcodes_h_l2773_c41_9472_previous_stack_read <= VAR_add_uxn_opcodes_h_l2773_c41_9472_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l2773_c41_9472_return_output := add_uxn_opcodes_h_l2773_c41_9472_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2774_c1_8e4b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8e4b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8e4b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8e4b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8e4b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8e4b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8e4b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8e4b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8e4b_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_86e6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_dfdd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_eb0a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c7_dfdd_return_output;
     VAR_add2_uxn_opcodes_h_l2774_c41_f0b6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2774_c1_8e4b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_e729_iftrue := VAR_add_uxn_opcodes_h_l2773_c41_9472_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2776_c7_86e6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_86e6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_86e6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_86e6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_86e6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_86e6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_86e6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_86e6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_86e6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2775_c1_eb0a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_eb0a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_eb0a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_eb0a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_eb0a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_eb0a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_eb0a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_eb0a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_eb0a_return_output;

     -- add2[uxn_opcodes_h_l2774_c41_f0b6] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l2774_c41_f0b6_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l2774_c41_f0b6_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l2774_c41_f0b6_phase <= VAR_add2_uxn_opcodes_h_l2774_c41_f0b6_phase;
     add2_uxn_opcodes_h_l2774_c41_f0b6_ins <= VAR_add2_uxn_opcodes_h_l2774_c41_f0b6_ins;
     add2_uxn_opcodes_h_l2774_c41_f0b6_previous_stack_read <= VAR_add2_uxn_opcodes_h_l2774_c41_f0b6_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l2774_c41_f0b6_return_output := add2_uxn_opcodes_h_l2774_c41_f0b6_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_e883_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_86e6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fb29_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c7_86e6_return_output;
     VAR_sub_uxn_opcodes_h_l2775_c41_2b09_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2775_c1_eb0a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_0c6e_iftrue := VAR_add2_uxn_opcodes_h_l2774_c41_f0b6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2776_c1_fb29] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fb29_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fb29_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fb29_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fb29_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fb29_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fb29_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fb29_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fb29_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2777_c7_e883] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_e883_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_e883_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_e883_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_e883_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_e883_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_e883_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_e883_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_e883_return_output;

     -- sub[uxn_opcodes_h_l2775_c41_2b09] LATENCY=0
     -- Clock enable
     sub_uxn_opcodes_h_l2775_c41_2b09_CLOCK_ENABLE <= VAR_sub_uxn_opcodes_h_l2775_c41_2b09_CLOCK_ENABLE;
     -- Inputs
     sub_uxn_opcodes_h_l2775_c41_2b09_phase <= VAR_sub_uxn_opcodes_h_l2775_c41_2b09_phase;
     sub_uxn_opcodes_h_l2775_c41_2b09_ins <= VAR_sub_uxn_opcodes_h_l2775_c41_2b09_ins;
     sub_uxn_opcodes_h_l2775_c41_2b09_previous_stack_read <= VAR_sub_uxn_opcodes_h_l2775_c41_2b09_previous_stack_read;
     -- Outputs
     VAR_sub_uxn_opcodes_h_l2775_c41_2b09_return_output := sub_uxn_opcodes_h_l2775_c41_2b09_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_3cbe_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_e883_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_810f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c7_e883_return_output;
     VAR_sub2_uxn_opcodes_h_l2776_c41_1929_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2776_c1_fb29_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_dfdd_iftrue := VAR_sub_uxn_opcodes_h_l2775_c41_2b09_return_output;
     -- sub2[uxn_opcodes_h_l2776_c41_1929] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l2776_c41_1929_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l2776_c41_1929_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l2776_c41_1929_phase <= VAR_sub2_uxn_opcodes_h_l2776_c41_1929_phase;
     sub2_uxn_opcodes_h_l2776_c41_1929_ins <= VAR_sub2_uxn_opcodes_h_l2776_c41_1929_ins;
     sub2_uxn_opcodes_h_l2776_c41_1929_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l2776_c41_1929_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l2776_c41_1929_return_output := sub2_uxn_opcodes_h_l2776_c41_1929_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2778_c7_3cbe] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_3cbe_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_3cbe_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_3cbe_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_3cbe_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_3cbe_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_3cbe_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_3cbe_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_3cbe_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2777_c1_810f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_810f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_810f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_810f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_810f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_810f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_810f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_810f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_810f_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_4639_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_3cbe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_8252_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c7_3cbe_return_output;
     VAR_mul_uxn_opcodes_h_l2777_c41_2a47_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2777_c1_810f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_86e6_iftrue := VAR_sub2_uxn_opcodes_h_l2776_c41_1929_return_output;
     -- mul[uxn_opcodes_h_l2777_c41_2a47] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l2777_c41_2a47_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l2777_c41_2a47_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l2777_c41_2a47_phase <= VAR_mul_uxn_opcodes_h_l2777_c41_2a47_phase;
     mul_uxn_opcodes_h_l2777_c41_2a47_ins <= VAR_mul_uxn_opcodes_h_l2777_c41_2a47_ins;
     mul_uxn_opcodes_h_l2777_c41_2a47_previous_stack_read <= VAR_mul_uxn_opcodes_h_l2777_c41_2a47_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l2777_c41_2a47_return_output := mul_uxn_opcodes_h_l2777_c41_2a47_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2779_c7_4639] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_4639_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_4639_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_4639_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_4639_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_4639_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_4639_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_4639_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_4639_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2778_c1_8252] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_8252_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_8252_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_8252_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_8252_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_8252_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_8252_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_8252_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_8252_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_e6c5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_4639_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_27d9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c7_4639_return_output;
     VAR_mul2_uxn_opcodes_h_l2778_c41_7a26_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_8252_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_e883_iftrue := VAR_mul_uxn_opcodes_h_l2777_c41_2a47_return_output;
     -- mul2[uxn_opcodes_h_l2778_c41_7a26] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l2778_c41_7a26_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l2778_c41_7a26_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l2778_c41_7a26_phase <= VAR_mul2_uxn_opcodes_h_l2778_c41_7a26_phase;
     mul2_uxn_opcodes_h_l2778_c41_7a26_ins <= VAR_mul2_uxn_opcodes_h_l2778_c41_7a26_ins;
     mul2_uxn_opcodes_h_l2778_c41_7a26_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l2778_c41_7a26_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l2778_c41_7a26_return_output := mul2_uxn_opcodes_h_l2778_c41_7a26_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2779_c1_27d9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_27d9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_27d9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_27d9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_27d9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_27d9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_27d9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_27d9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_27d9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2780_c7_e6c5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_e6c5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_e6c5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_e6c5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_e6c5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_e6c5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_e6c5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_e6c5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_e6c5_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_8f15_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_e6c5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_28e3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c7_e6c5_return_output;
     VAR_div_uxn_opcodes_h_l2779_c41_fa5d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2779_c1_27d9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2778_c7_3cbe_iftrue := VAR_mul2_uxn_opcodes_h_l2778_c41_7a26_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2781_c7_8f15] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_8f15_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_8f15_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_8f15_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_8f15_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_8f15_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_8f15_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_8f15_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_8f15_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2780_c1_28e3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_28e3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_28e3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_28e3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_28e3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_28e3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_28e3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_28e3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_28e3_return_output;

     -- div[uxn_opcodes_h_l2779_c41_fa5d] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l2779_c41_fa5d_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l2779_c41_fa5d_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l2779_c41_fa5d_phase <= VAR_div_uxn_opcodes_h_l2779_c41_fa5d_phase;
     div_uxn_opcodes_h_l2779_c41_fa5d_ins <= VAR_div_uxn_opcodes_h_l2779_c41_fa5d_ins;
     div_uxn_opcodes_h_l2779_c41_fa5d_previous_stack_read <= VAR_div_uxn_opcodes_h_l2779_c41_fa5d_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l2779_c41_fa5d_return_output := div_uxn_opcodes_h_l2779_c41_fa5d_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c7_1774_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_8f15_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_9c00_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c7_8f15_return_output;
     VAR_div2_uxn_opcodes_h_l2780_c41_78b8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2780_c1_28e3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2779_c7_4639_iftrue := VAR_div_uxn_opcodes_h_l2779_c41_fa5d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2781_c1_9c00] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_9c00_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_9c00_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_9c00_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_9c00_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_9c00_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_9c00_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_9c00_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_9c00_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2782_c7_1774] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c7_1774_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c7_1774_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c7_1774_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c7_1774_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c7_1774_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c7_1774_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c7_1774_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c7_1774_return_output;

     -- div2[uxn_opcodes_h_l2780_c41_78b8] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l2780_c41_78b8_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l2780_c41_78b8_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l2780_c41_78b8_phase <= VAR_div2_uxn_opcodes_h_l2780_c41_78b8_phase;
     div2_uxn_opcodes_h_l2780_c41_78b8_ins <= VAR_div2_uxn_opcodes_h_l2780_c41_78b8_ins;
     div2_uxn_opcodes_h_l2780_c41_78b8_previous_stack_read <= VAR_div2_uxn_opcodes_h_l2780_c41_78b8_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l2780_c41_78b8_return_output := div2_uxn_opcodes_h_l2780_c41_78b8_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c7_13d7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c7_1774_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_0042_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c7_1774_return_output;
     VAR_and_uxn_opcodes_h_l2781_c41_3c0b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2781_c1_9c00_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2780_c7_e6c5_iftrue := VAR_div2_uxn_opcodes_h_l2780_c41_78b8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2783_c7_13d7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c7_13d7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c7_13d7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c7_13d7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c7_13d7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c7_13d7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c7_13d7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c7_13d7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c7_13d7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2782_c1_0042] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_0042_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_0042_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_0042_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_0042_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_0042_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_0042_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_0042_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_0042_return_output;

     -- and[uxn_opcodes_h_l2781_c41_3c0b] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l2781_c41_3c0b_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l2781_c41_3c0b_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l2781_c41_3c0b_phase <= VAR_and_uxn_opcodes_h_l2781_c41_3c0b_phase;
     and_uxn_opcodes_h_l2781_c41_3c0b_ins <= VAR_and_uxn_opcodes_h_l2781_c41_3c0b_ins;
     and_uxn_opcodes_h_l2781_c41_3c0b_previous_stack_read <= VAR_and_uxn_opcodes_h_l2781_c41_3c0b_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l2781_c41_3c0b_return_output := and_uxn_opcodes_h_l2781_c41_3c0b_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c7_4d58_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c7_13d7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c1_b3f7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c7_13d7_return_output;
     VAR_and2_uxn_opcodes_h_l2782_c41_2cae_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_0042_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2781_c7_8f15_iftrue := VAR_and_uxn_opcodes_h_l2781_c41_3c0b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2784_c7_4d58] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c7_4d58_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c7_4d58_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c7_4d58_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c7_4d58_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c7_4d58_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c7_4d58_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c7_4d58_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c7_4d58_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2783_c1_b3f7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c1_b3f7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c1_b3f7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c1_b3f7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c1_b3f7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c1_b3f7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c1_b3f7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c1_b3f7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c1_b3f7_return_output;

     -- and2[uxn_opcodes_h_l2782_c41_2cae] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l2782_c41_2cae_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l2782_c41_2cae_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l2782_c41_2cae_phase <= VAR_and2_uxn_opcodes_h_l2782_c41_2cae_phase;
     and2_uxn_opcodes_h_l2782_c41_2cae_ins <= VAR_and2_uxn_opcodes_h_l2782_c41_2cae_ins;
     and2_uxn_opcodes_h_l2782_c41_2cae_previous_stack_read <= VAR_and2_uxn_opcodes_h_l2782_c41_2cae_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l2782_c41_2cae_return_output := and2_uxn_opcodes_h_l2782_c41_2cae_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c7_a5f1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c7_4d58_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c1_7d8c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c7_4d58_return_output;
     VAR_ora_uxn_opcodes_h_l2783_c41_9203_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2783_c1_b3f7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2782_c7_1774_iftrue := VAR_and2_uxn_opcodes_h_l2782_c41_2cae_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2784_c1_7d8c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c1_7d8c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c1_7d8c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c1_7d8c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c1_7d8c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c1_7d8c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c1_7d8c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c1_7d8c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c1_7d8c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2785_c7_a5f1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c7_a5f1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c7_a5f1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c7_a5f1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c7_a5f1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c7_a5f1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c7_a5f1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c7_a5f1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c7_a5f1_return_output;

     -- ora[uxn_opcodes_h_l2783_c41_9203] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l2783_c41_9203_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l2783_c41_9203_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l2783_c41_9203_phase <= VAR_ora_uxn_opcodes_h_l2783_c41_9203_phase;
     ora_uxn_opcodes_h_l2783_c41_9203_ins <= VAR_ora_uxn_opcodes_h_l2783_c41_9203_ins;
     ora_uxn_opcodes_h_l2783_c41_9203_previous_stack_read <= VAR_ora_uxn_opcodes_h_l2783_c41_9203_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l2783_c41_9203_return_output := ora_uxn_opcodes_h_l2783_c41_9203_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c7_bd8a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c7_a5f1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c1_01b4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c7_a5f1_return_output;
     VAR_ora2_uxn_opcodes_h_l2784_c41_6380_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2784_c1_7d8c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2783_c7_13d7_iftrue := VAR_ora_uxn_opcodes_h_l2783_c41_9203_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2786_c7_bd8a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c7_bd8a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c7_bd8a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c7_bd8a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c7_bd8a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c7_bd8a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c7_bd8a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c7_bd8a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c7_bd8a_return_output;

     -- ora2[uxn_opcodes_h_l2784_c41_6380] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l2784_c41_6380_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l2784_c41_6380_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l2784_c41_6380_phase <= VAR_ora2_uxn_opcodes_h_l2784_c41_6380_phase;
     ora2_uxn_opcodes_h_l2784_c41_6380_ins <= VAR_ora2_uxn_opcodes_h_l2784_c41_6380_ins;
     ora2_uxn_opcodes_h_l2784_c41_6380_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l2784_c41_6380_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l2784_c41_6380_return_output := ora2_uxn_opcodes_h_l2784_c41_6380_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2785_c1_01b4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c1_01b4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c1_01b4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c1_01b4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c1_01b4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c1_01b4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c1_01b4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c1_01b4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c1_01b4_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c7_7515_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c7_bd8a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c1_bc33_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c7_bd8a_return_output;
     VAR_eor_uxn_opcodes_h_l2785_c41_21f3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2785_c1_01b4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2784_c7_4d58_iftrue := VAR_ora2_uxn_opcodes_h_l2784_c41_6380_return_output;
     -- eor[uxn_opcodes_h_l2785_c41_21f3] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l2785_c41_21f3_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l2785_c41_21f3_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l2785_c41_21f3_phase <= VAR_eor_uxn_opcodes_h_l2785_c41_21f3_phase;
     eor_uxn_opcodes_h_l2785_c41_21f3_ins <= VAR_eor_uxn_opcodes_h_l2785_c41_21f3_ins;
     eor_uxn_opcodes_h_l2785_c41_21f3_previous_stack_read <= VAR_eor_uxn_opcodes_h_l2785_c41_21f3_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l2785_c41_21f3_return_output := eor_uxn_opcodes_h_l2785_c41_21f3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2786_c1_bc33] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c1_bc33_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c1_bc33_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c1_bc33_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c1_bc33_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c1_bc33_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c1_bc33_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c1_bc33_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c1_bc33_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2787_c7_7515] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c7_7515_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c7_7515_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c7_7515_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c7_7515_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c7_7515_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c7_7515_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c7_7515_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c7_7515_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c7_9bc2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c7_7515_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c1_5847_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c7_7515_return_output;
     VAR_eor2_uxn_opcodes_h_l2786_c41_451a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2786_c1_bc33_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2785_c7_a5f1_iftrue := VAR_eor_uxn_opcodes_h_l2785_c41_21f3_return_output;
     -- eor2[uxn_opcodes_h_l2786_c41_451a] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l2786_c41_451a_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l2786_c41_451a_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l2786_c41_451a_phase <= VAR_eor2_uxn_opcodes_h_l2786_c41_451a_phase;
     eor2_uxn_opcodes_h_l2786_c41_451a_ins <= VAR_eor2_uxn_opcodes_h_l2786_c41_451a_ins;
     eor2_uxn_opcodes_h_l2786_c41_451a_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l2786_c41_451a_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l2786_c41_451a_return_output := eor2_uxn_opcodes_h_l2786_c41_451a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2788_c7_9bc2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c7_9bc2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c7_9bc2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c7_9bc2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c7_9bc2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c7_9bc2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c7_9bc2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c7_9bc2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c7_9bc2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2787_c1_5847] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c1_5847_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c1_5847_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c1_5847_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c1_5847_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c1_5847_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c1_5847_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c1_5847_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c1_5847_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2789_c1_1fe8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c7_9bc2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c1_c8ae_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c7_9bc2_return_output;
     VAR_sft_uxn_opcodes_h_l2787_c41_741a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2787_c1_5847_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2786_c7_bd8a_iftrue := VAR_eor2_uxn_opcodes_h_l2786_c41_451a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2788_c1_c8ae] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c1_c8ae_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c1_c8ae_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c1_c8ae_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c1_c8ae_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c1_c8ae_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c1_c8ae_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c1_c8ae_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c1_c8ae_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2789_c1_1fe8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2789_c1_1fe8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2789_c1_1fe8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2789_c1_1fe8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2789_c1_1fe8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2789_c1_1fe8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2789_c1_1fe8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2789_c1_1fe8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2789_c1_1fe8_return_output;

     -- sft[uxn_opcodes_h_l2787_c41_741a] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l2787_c41_741a_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l2787_c41_741a_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l2787_c41_741a_phase <= VAR_sft_uxn_opcodes_h_l2787_c41_741a_phase;
     sft_uxn_opcodes_h_l2787_c41_741a_ins <= VAR_sft_uxn_opcodes_h_l2787_c41_741a_ins;
     sft_uxn_opcodes_h_l2787_c41_741a_previous_stack_read <= VAR_sft_uxn_opcodes_h_l2787_c41_741a_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l2787_c41_741a_return_output := sft_uxn_opcodes_h_l2787_c41_741a_return_output;

     -- Submodule level 74
     VAR_printf_uxn_opcodes_h_l2789_c9_4682_uxn_opcodes_h_l2789_c9_4682_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2789_c1_1fe8_return_output;
     VAR_sft2_uxn_opcodes_h_l2788_c41_908a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2788_c1_c8ae_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2787_c7_7515_iftrue := VAR_sft_uxn_opcodes_h_l2787_c41_741a_return_output;
     -- printf_uxn_opcodes_h_l2789_c9_4682[uxn_opcodes_h_l2789_c9_4682] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2789_c9_4682_uxn_opcodes_h_l2789_c9_4682_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2789_c9_4682_uxn_opcodes_h_l2789_c9_4682_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2789_c9_4682_uxn_opcodes_h_l2789_c9_4682_arg0 <= VAR_printf_uxn_opcodes_h_l2789_c9_4682_uxn_opcodes_h_l2789_c9_4682_arg0;
     -- Outputs

     -- sft2[uxn_opcodes_h_l2788_c41_908a] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l2788_c41_908a_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l2788_c41_908a_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l2788_c41_908a_phase <= VAR_sft2_uxn_opcodes_h_l2788_c41_908a_phase;
     sft2_uxn_opcodes_h_l2788_c41_908a_ins <= VAR_sft2_uxn_opcodes_h_l2788_c41_908a_ins;
     sft2_uxn_opcodes_h_l2788_c41_908a_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l2788_c41_908a_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l2788_c41_908a_return_output := sft2_uxn_opcodes_h_l2788_c41_908a_return_output;

     -- Submodule level 75
     VAR_opc_result_MUX_uxn_opcodes_h_l2788_c7_9bc2_iftrue := VAR_sft2_uxn_opcodes_h_l2788_c41_908a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2788_c7_9bc2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2788_c7_9bc2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2788_c7_9bc2_cond;
     opc_result_MUX_uxn_opcodes_h_l2788_c7_9bc2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2788_c7_9bc2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2788_c7_9bc2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2788_c7_9bc2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2788_c7_9bc2_return_output := opc_result_MUX_uxn_opcodes_h_l2788_c7_9bc2_return_output;

     -- Submodule level 76
     VAR_opc_result_MUX_uxn_opcodes_h_l2787_c7_7515_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2788_c7_9bc2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2787_c7_7515] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2787_c7_7515_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2787_c7_7515_cond;
     opc_result_MUX_uxn_opcodes_h_l2787_c7_7515_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2787_c7_7515_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2787_c7_7515_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2787_c7_7515_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2787_c7_7515_return_output := opc_result_MUX_uxn_opcodes_h_l2787_c7_7515_return_output;

     -- Submodule level 77
     VAR_opc_result_MUX_uxn_opcodes_h_l2786_c7_bd8a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2787_c7_7515_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2786_c7_bd8a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2786_c7_bd8a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2786_c7_bd8a_cond;
     opc_result_MUX_uxn_opcodes_h_l2786_c7_bd8a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2786_c7_bd8a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2786_c7_bd8a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2786_c7_bd8a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2786_c7_bd8a_return_output := opc_result_MUX_uxn_opcodes_h_l2786_c7_bd8a_return_output;

     -- Submodule level 78
     VAR_opc_result_MUX_uxn_opcodes_h_l2785_c7_a5f1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2786_c7_bd8a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2785_c7_a5f1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2785_c7_a5f1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2785_c7_a5f1_cond;
     opc_result_MUX_uxn_opcodes_h_l2785_c7_a5f1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2785_c7_a5f1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2785_c7_a5f1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2785_c7_a5f1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2785_c7_a5f1_return_output := opc_result_MUX_uxn_opcodes_h_l2785_c7_a5f1_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l2784_c7_4d58_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2785_c7_a5f1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2784_c7_4d58] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2784_c7_4d58_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2784_c7_4d58_cond;
     opc_result_MUX_uxn_opcodes_h_l2784_c7_4d58_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2784_c7_4d58_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2784_c7_4d58_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2784_c7_4d58_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2784_c7_4d58_return_output := opc_result_MUX_uxn_opcodes_h_l2784_c7_4d58_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l2783_c7_13d7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2784_c7_4d58_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2783_c7_13d7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2783_c7_13d7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2783_c7_13d7_cond;
     opc_result_MUX_uxn_opcodes_h_l2783_c7_13d7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2783_c7_13d7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2783_c7_13d7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2783_c7_13d7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2783_c7_13d7_return_output := opc_result_MUX_uxn_opcodes_h_l2783_c7_13d7_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l2782_c7_1774_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2783_c7_13d7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2782_c7_1774] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2782_c7_1774_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2782_c7_1774_cond;
     opc_result_MUX_uxn_opcodes_h_l2782_c7_1774_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2782_c7_1774_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2782_c7_1774_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2782_c7_1774_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2782_c7_1774_return_output := opc_result_MUX_uxn_opcodes_h_l2782_c7_1774_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l2781_c7_8f15_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2782_c7_1774_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2781_c7_8f15] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2781_c7_8f15_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2781_c7_8f15_cond;
     opc_result_MUX_uxn_opcodes_h_l2781_c7_8f15_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2781_c7_8f15_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2781_c7_8f15_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2781_c7_8f15_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2781_c7_8f15_return_output := opc_result_MUX_uxn_opcodes_h_l2781_c7_8f15_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l2780_c7_e6c5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2781_c7_8f15_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2780_c7_e6c5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2780_c7_e6c5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2780_c7_e6c5_cond;
     opc_result_MUX_uxn_opcodes_h_l2780_c7_e6c5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2780_c7_e6c5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2780_c7_e6c5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2780_c7_e6c5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2780_c7_e6c5_return_output := opc_result_MUX_uxn_opcodes_h_l2780_c7_e6c5_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l2779_c7_4639_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2780_c7_e6c5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2779_c7_4639] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2779_c7_4639_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2779_c7_4639_cond;
     opc_result_MUX_uxn_opcodes_h_l2779_c7_4639_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2779_c7_4639_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2779_c7_4639_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2779_c7_4639_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2779_c7_4639_return_output := opc_result_MUX_uxn_opcodes_h_l2779_c7_4639_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l2778_c7_3cbe_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2779_c7_4639_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2778_c7_3cbe] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2778_c7_3cbe_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2778_c7_3cbe_cond;
     opc_result_MUX_uxn_opcodes_h_l2778_c7_3cbe_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2778_c7_3cbe_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2778_c7_3cbe_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2778_c7_3cbe_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2778_c7_3cbe_return_output := opc_result_MUX_uxn_opcodes_h_l2778_c7_3cbe_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_e883_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2778_c7_3cbe_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2777_c7_e883] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2777_c7_e883_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_e883_cond;
     opc_result_MUX_uxn_opcodes_h_l2777_c7_e883_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_e883_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2777_c7_e883_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_e883_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_e883_return_output := opc_result_MUX_uxn_opcodes_h_l2777_c7_e883_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_86e6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2777_c7_e883_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2776_c7_86e6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2776_c7_86e6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_86e6_cond;
     opc_result_MUX_uxn_opcodes_h_l2776_c7_86e6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_86e6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2776_c7_86e6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_86e6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_86e6_return_output := opc_result_MUX_uxn_opcodes_h_l2776_c7_86e6_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_dfdd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2776_c7_86e6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2775_c7_dfdd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2775_c7_dfdd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_dfdd_cond;
     opc_result_MUX_uxn_opcodes_h_l2775_c7_dfdd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_dfdd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2775_c7_dfdd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_dfdd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_dfdd_return_output := opc_result_MUX_uxn_opcodes_h_l2775_c7_dfdd_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_0c6e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2775_c7_dfdd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2774_c7_0c6e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2774_c7_0c6e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_0c6e_cond;
     opc_result_MUX_uxn_opcodes_h_l2774_c7_0c6e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_0c6e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2774_c7_0c6e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_0c6e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_0c6e_return_output := opc_result_MUX_uxn_opcodes_h_l2774_c7_0c6e_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_e729_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2774_c7_0c6e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2773_c7_e729] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2773_c7_e729_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_e729_cond;
     opc_result_MUX_uxn_opcodes_h_l2773_c7_e729_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_e729_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2773_c7_e729_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_e729_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_e729_return_output := opc_result_MUX_uxn_opcodes_h_l2773_c7_e729_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_fbeb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2773_c7_e729_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2772_c7_fbeb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2772_c7_fbeb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_fbeb_cond;
     opc_result_MUX_uxn_opcodes_h_l2772_c7_fbeb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_fbeb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2772_c7_fbeb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_fbeb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_fbeb_return_output := opc_result_MUX_uxn_opcodes_h_l2772_c7_fbeb_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_19ef_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2772_c7_fbeb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2771_c7_19ef] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2771_c7_19ef_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_19ef_cond;
     opc_result_MUX_uxn_opcodes_h_l2771_c7_19ef_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_19ef_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2771_c7_19ef_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_19ef_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_19ef_return_output := opc_result_MUX_uxn_opcodes_h_l2771_c7_19ef_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_7171_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2771_c7_19ef_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2770_c7_7171] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2770_c7_7171_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_7171_cond;
     opc_result_MUX_uxn_opcodes_h_l2770_c7_7171_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_7171_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2770_c7_7171_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_7171_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_7171_return_output := opc_result_MUX_uxn_opcodes_h_l2770_c7_7171_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_78bb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2770_c7_7171_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2769_c7_78bb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2769_c7_78bb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_78bb_cond;
     opc_result_MUX_uxn_opcodes_h_l2769_c7_78bb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_78bb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2769_c7_78bb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_78bb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_78bb_return_output := opc_result_MUX_uxn_opcodes_h_l2769_c7_78bb_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_11d7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_78bb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2768_c7_11d7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2768_c7_11d7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_11d7_cond;
     opc_result_MUX_uxn_opcodes_h_l2768_c7_11d7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_11d7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2768_c7_11d7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_11d7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_11d7_return_output := opc_result_MUX_uxn_opcodes_h_l2768_c7_11d7_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_8f80_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_11d7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2767_c7_8f80] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2767_c7_8f80_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_8f80_cond;
     opc_result_MUX_uxn_opcodes_h_l2767_c7_8f80_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_8f80_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2767_c7_8f80_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_8f80_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_8f80_return_output := opc_result_MUX_uxn_opcodes_h_l2767_c7_8f80_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_00d4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_8f80_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2766_c7_00d4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2766_c7_00d4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_00d4_cond;
     opc_result_MUX_uxn_opcodes_h_l2766_c7_00d4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_00d4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2766_c7_00d4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_00d4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_00d4_return_output := opc_result_MUX_uxn_opcodes_h_l2766_c7_00d4_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_6ff0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_00d4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2765_c7_6ff0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2765_c7_6ff0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_6ff0_cond;
     opc_result_MUX_uxn_opcodes_h_l2765_c7_6ff0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_6ff0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2765_c7_6ff0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_6ff0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_6ff0_return_output := opc_result_MUX_uxn_opcodes_h_l2765_c7_6ff0_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_5cdd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_6ff0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2764_c7_5cdd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2764_c7_5cdd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_5cdd_cond;
     opc_result_MUX_uxn_opcodes_h_l2764_c7_5cdd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_5cdd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2764_c7_5cdd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_5cdd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_5cdd_return_output := opc_result_MUX_uxn_opcodes_h_l2764_c7_5cdd_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_b6e2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_5cdd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2763_c7_b6e2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2763_c7_b6e2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_b6e2_cond;
     opc_result_MUX_uxn_opcodes_h_l2763_c7_b6e2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_b6e2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2763_c7_b6e2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_b6e2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_b6e2_return_output := opc_result_MUX_uxn_opcodes_h_l2763_c7_b6e2_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_e022_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_b6e2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2762_c7_e022] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2762_c7_e022_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_e022_cond;
     opc_result_MUX_uxn_opcodes_h_l2762_c7_e022_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_e022_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2762_c7_e022_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_e022_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_e022_return_output := opc_result_MUX_uxn_opcodes_h_l2762_c7_e022_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_4431_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_e022_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2761_c7_4431] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2761_c7_4431_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_4431_cond;
     opc_result_MUX_uxn_opcodes_h_l2761_c7_4431_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_4431_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2761_c7_4431_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_4431_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_4431_return_output := opc_result_MUX_uxn_opcodes_h_l2761_c7_4431_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_79e6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_4431_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2760_c7_79e6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2760_c7_79e6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_79e6_cond;
     opc_result_MUX_uxn_opcodes_h_l2760_c7_79e6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_79e6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2760_c7_79e6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_79e6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_79e6_return_output := opc_result_MUX_uxn_opcodes_h_l2760_c7_79e6_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_1288_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_79e6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2759_c7_1288] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2759_c7_1288_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_1288_cond;
     opc_result_MUX_uxn_opcodes_h_l2759_c7_1288_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_1288_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2759_c7_1288_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_1288_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_1288_return_output := opc_result_MUX_uxn_opcodes_h_l2759_c7_1288_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_d95e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_1288_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2758_c7_d95e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2758_c7_d95e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_d95e_cond;
     opc_result_MUX_uxn_opcodes_h_l2758_c7_d95e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_d95e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2758_c7_d95e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_d95e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_d95e_return_output := opc_result_MUX_uxn_opcodes_h_l2758_c7_d95e_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_3c85_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_d95e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2757_c7_3c85] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2757_c7_3c85_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_3c85_cond;
     opc_result_MUX_uxn_opcodes_h_l2757_c7_3c85_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_3c85_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2757_c7_3c85_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_3c85_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_3c85_return_output := opc_result_MUX_uxn_opcodes_h_l2757_c7_3c85_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_a1cb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_3c85_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2756_c7_a1cb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2756_c7_a1cb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_a1cb_cond;
     opc_result_MUX_uxn_opcodes_h_l2756_c7_a1cb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_a1cb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2756_c7_a1cb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_a1cb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_a1cb_return_output := opc_result_MUX_uxn_opcodes_h_l2756_c7_a1cb_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_abc1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_a1cb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2755_c7_abc1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2755_c7_abc1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_abc1_cond;
     opc_result_MUX_uxn_opcodes_h_l2755_c7_abc1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_abc1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2755_c7_abc1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_abc1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_abc1_return_output := opc_result_MUX_uxn_opcodes_h_l2755_c7_abc1_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_b6fe_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_abc1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2754_c7_b6fe] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2754_c7_b6fe_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_b6fe_cond;
     opc_result_MUX_uxn_opcodes_h_l2754_c7_b6fe_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_b6fe_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2754_c7_b6fe_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_b6fe_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_b6fe_return_output := opc_result_MUX_uxn_opcodes_h_l2754_c7_b6fe_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_7348_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_b6fe_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2753_c7_7348] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2753_c7_7348_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_7348_cond;
     opc_result_MUX_uxn_opcodes_h_l2753_c7_7348_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_7348_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2753_c7_7348_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_7348_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_7348_return_output := opc_result_MUX_uxn_opcodes_h_l2753_c7_7348_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_6f4f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_7348_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2752_c7_6f4f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2752_c7_6f4f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_6f4f_cond;
     opc_result_MUX_uxn_opcodes_h_l2752_c7_6f4f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_6f4f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2752_c7_6f4f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_6f4f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_6f4f_return_output := opc_result_MUX_uxn_opcodes_h_l2752_c7_6f4f_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_bd9c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_6f4f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2751_c7_bd9c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2751_c7_bd9c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_bd9c_cond;
     opc_result_MUX_uxn_opcodes_h_l2751_c7_bd9c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_bd9c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2751_c7_bd9c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_bd9c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_bd9c_return_output := opc_result_MUX_uxn_opcodes_h_l2751_c7_bd9c_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_5aec_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_bd9c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2750_c7_5aec] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2750_c7_5aec_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_5aec_cond;
     opc_result_MUX_uxn_opcodes_h_l2750_c7_5aec_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_5aec_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2750_c7_5aec_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_5aec_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_5aec_return_output := opc_result_MUX_uxn_opcodes_h_l2750_c7_5aec_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_6263_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_5aec_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2749_c7_6263] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2749_c7_6263_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_6263_cond;
     opc_result_MUX_uxn_opcodes_h_l2749_c7_6263_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_6263_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2749_c7_6263_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_6263_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_6263_return_output := opc_result_MUX_uxn_opcodes_h_l2749_c7_6263_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_d33a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_6263_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2748_c7_d33a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2748_c7_d33a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_d33a_cond;
     opc_result_MUX_uxn_opcodes_h_l2748_c7_d33a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_d33a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2748_c7_d33a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_d33a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_d33a_return_output := opc_result_MUX_uxn_opcodes_h_l2748_c7_d33a_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_f293_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_d33a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2747_c7_f293] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2747_c7_f293_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_f293_cond;
     opc_result_MUX_uxn_opcodes_h_l2747_c7_f293_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_f293_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2747_c7_f293_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_f293_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_f293_return_output := opc_result_MUX_uxn_opcodes_h_l2747_c7_f293_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_d2e2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_f293_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2746_c7_d2e2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2746_c7_d2e2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_d2e2_cond;
     opc_result_MUX_uxn_opcodes_h_l2746_c7_d2e2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_d2e2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2746_c7_d2e2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_d2e2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_d2e2_return_output := opc_result_MUX_uxn_opcodes_h_l2746_c7_d2e2_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_b420_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_d2e2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2745_c7_b420] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2745_c7_b420_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_b420_cond;
     opc_result_MUX_uxn_opcodes_h_l2745_c7_b420_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_b420_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2745_c7_b420_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_b420_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_b420_return_output := opc_result_MUX_uxn_opcodes_h_l2745_c7_b420_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_a164_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_b420_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2744_c7_a164] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2744_c7_a164_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_a164_cond;
     opc_result_MUX_uxn_opcodes_h_l2744_c7_a164_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_a164_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2744_c7_a164_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_a164_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_a164_return_output := opc_result_MUX_uxn_opcodes_h_l2744_c7_a164_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_e6ca_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_a164_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2743_c7_e6ca] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2743_c7_e6ca_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_e6ca_cond;
     opc_result_MUX_uxn_opcodes_h_l2743_c7_e6ca_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_e6ca_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2743_c7_e6ca_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_e6ca_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_e6ca_return_output := opc_result_MUX_uxn_opcodes_h_l2743_c7_e6ca_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5e67_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_e6ca_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2742_c7_5e67] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2742_c7_5e67_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5e67_cond;
     opc_result_MUX_uxn_opcodes_h_l2742_c7_5e67_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5e67_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2742_c7_5e67_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5e67_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5e67_return_output := opc_result_MUX_uxn_opcodes_h_l2742_c7_5e67_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_7319_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_5e67_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2741_c7_7319] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2741_c7_7319_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_7319_cond;
     opc_result_MUX_uxn_opcodes_h_l2741_c7_7319_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_7319_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2741_c7_7319_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_7319_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_7319_return_output := opc_result_MUX_uxn_opcodes_h_l2741_c7_7319_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_019a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_7319_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2740_c7_019a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2740_c7_019a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_019a_cond;
     opc_result_MUX_uxn_opcodes_h_l2740_c7_019a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_019a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2740_c7_019a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_019a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_019a_return_output := opc_result_MUX_uxn_opcodes_h_l2740_c7_019a_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_5f2f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_019a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2739_c7_5f2f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2739_c7_5f2f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_5f2f_cond;
     opc_result_MUX_uxn_opcodes_h_l2739_c7_5f2f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_5f2f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2739_c7_5f2f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_5f2f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_5f2f_return_output := opc_result_MUX_uxn_opcodes_h_l2739_c7_5f2f_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_de36_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_5f2f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2738_c7_de36] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2738_c7_de36_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_de36_cond;
     opc_result_MUX_uxn_opcodes_h_l2738_c7_de36_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_de36_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2738_c7_de36_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_de36_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_de36_return_output := opc_result_MUX_uxn_opcodes_h_l2738_c7_de36_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_5747_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_de36_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2737_c7_5747] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2737_c7_5747_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_5747_cond;
     opc_result_MUX_uxn_opcodes_h_l2737_c7_5747_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_5747_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2737_c7_5747_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_5747_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_5747_return_output := opc_result_MUX_uxn_opcodes_h_l2737_c7_5747_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_c9d1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_5747_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2736_c7_c9d1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2736_c7_c9d1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_c9d1_cond;
     opc_result_MUX_uxn_opcodes_h_l2736_c7_c9d1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_c9d1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2736_c7_c9d1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_c9d1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_c9d1_return_output := opc_result_MUX_uxn_opcodes_h_l2736_c7_c9d1_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_9222_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_c9d1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2735_c7_9222] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2735_c7_9222_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_9222_cond;
     opc_result_MUX_uxn_opcodes_h_l2735_c7_9222_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_9222_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2735_c7_9222_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_9222_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_9222_return_output := opc_result_MUX_uxn_opcodes_h_l2735_c7_9222_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_9913_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_9222_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2734_c7_9913] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2734_c7_9913_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_9913_cond;
     opc_result_MUX_uxn_opcodes_h_l2734_c7_9913_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_9913_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2734_c7_9913_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_9913_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_9913_return_output := opc_result_MUX_uxn_opcodes_h_l2734_c7_9913_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_5637_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_9913_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2733_c7_5637] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2733_c7_5637_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_5637_cond;
     opc_result_MUX_uxn_opcodes_h_l2733_c7_5637_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_5637_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2733_c7_5637_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_5637_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_5637_return_output := opc_result_MUX_uxn_opcodes_h_l2733_c7_5637_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_f6bb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_5637_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2732_c7_f6bb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2732_c7_f6bb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_f6bb_cond;
     opc_result_MUX_uxn_opcodes_h_l2732_c7_f6bb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_f6bb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2732_c7_f6bb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_f6bb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_f6bb_return_output := opc_result_MUX_uxn_opcodes_h_l2732_c7_f6bb_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_3b86_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_f6bb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2731_c7_3b86] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2731_c7_3b86_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_3b86_cond;
     opc_result_MUX_uxn_opcodes_h_l2731_c7_3b86_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_3b86_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2731_c7_3b86_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_3b86_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_3b86_return_output := opc_result_MUX_uxn_opcodes_h_l2731_c7_3b86_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_7400_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_3b86_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2730_c7_7400] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2730_c7_7400_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_7400_cond;
     opc_result_MUX_uxn_opcodes_h_l2730_c7_7400_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_7400_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2730_c7_7400_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_7400_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_7400_return_output := opc_result_MUX_uxn_opcodes_h_l2730_c7_7400_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_988f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_7400_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2729_c7_988f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2729_c7_988f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_988f_cond;
     opc_result_MUX_uxn_opcodes_h_l2729_c7_988f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_988f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2729_c7_988f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_988f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_988f_return_output := opc_result_MUX_uxn_opcodes_h_l2729_c7_988f_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_a2ba_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_988f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2728_c7_a2ba] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2728_c7_a2ba_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_a2ba_cond;
     opc_result_MUX_uxn_opcodes_h_l2728_c7_a2ba_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_a2ba_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2728_c7_a2ba_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_a2ba_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_a2ba_return_output := opc_result_MUX_uxn_opcodes_h_l2728_c7_a2ba_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_dbd2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_a2ba_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2727_c7_dbd2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2727_c7_dbd2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_dbd2_cond;
     opc_result_MUX_uxn_opcodes_h_l2727_c7_dbd2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_dbd2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2727_c7_dbd2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_dbd2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_dbd2_return_output := opc_result_MUX_uxn_opcodes_h_l2727_c7_dbd2_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_3a5d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_dbd2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2726_c7_3a5d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2726_c7_3a5d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_3a5d_cond;
     opc_result_MUX_uxn_opcodes_h_l2726_c7_3a5d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_3a5d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2726_c7_3a5d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_3a5d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_3a5d_return_output := opc_result_MUX_uxn_opcodes_h_l2726_c7_3a5d_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_7af2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_3a5d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2725_c7_7af2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2725_c7_7af2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_7af2_cond;
     opc_result_MUX_uxn_opcodes_h_l2725_c7_7af2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_7af2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2725_c7_7af2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_7af2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_7af2_return_output := opc_result_MUX_uxn_opcodes_h_l2725_c7_7af2_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_a630_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_7af2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2724_c7_a630] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2724_c7_a630_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_a630_cond;
     opc_result_MUX_uxn_opcodes_h_l2724_c7_a630_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_a630_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2724_c7_a630_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_a630_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_a630_return_output := opc_result_MUX_uxn_opcodes_h_l2724_c7_a630_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_00f0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_a630_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2723_c7_00f0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2723_c7_00f0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_00f0_cond;
     opc_result_MUX_uxn_opcodes_h_l2723_c7_00f0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_00f0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2723_c7_00f0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_00f0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_00f0_return_output := opc_result_MUX_uxn_opcodes_h_l2723_c7_00f0_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_c4d4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_00f0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2722_c7_c4d4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2722_c7_c4d4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_c4d4_cond;
     opc_result_MUX_uxn_opcodes_h_l2722_c7_c4d4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_c4d4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2722_c7_c4d4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_c4d4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_c4d4_return_output := opc_result_MUX_uxn_opcodes_h_l2722_c7_c4d4_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_ec20_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_c4d4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2721_c7_ec20] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2721_c7_ec20_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_ec20_cond;
     opc_result_MUX_uxn_opcodes_h_l2721_c7_ec20_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_ec20_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2721_c7_ec20_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_ec20_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_ec20_return_output := opc_result_MUX_uxn_opcodes_h_l2721_c7_ec20_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_e407_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_ec20_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2720_c7_e407] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2720_c7_e407_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_e407_cond;
     opc_result_MUX_uxn_opcodes_h_l2720_c7_e407_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_e407_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2720_c7_e407_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_e407_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_e407_return_output := opc_result_MUX_uxn_opcodes_h_l2720_c7_e407_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_e407_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2719_c2_7623] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_cond;
     opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_return_output := opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_return_output;

     -- Submodule level 145
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_return_output;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2796_l2798_DUPLICATE_68ae LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2796_l2798_DUPLICATE_68ae_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2792_c17_e455] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2792_c17_e455_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2817_c34_3ef6] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2817_c34_3ef6_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d[uxn_opcodes_h_l2818_c37_0ee7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2818_c37_0ee7_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2808_c3_99a7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2808_c3_99a7_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_return_output.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d[uxn_opcodes_h_l2812_c39_5d10] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2812_c39_5d10_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l2794_c6_141d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2794_c6_141d_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_return_output.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l2813_c40_b9d2] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2813_c40_b9d2_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2802_c70_70c1] LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2802_c70_70c1_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2814_c34_ecda] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2814_c34_ecda_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_return_output.is_pc_updated;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2807_l2820_DUPLICATE_88d9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2807_l2820_DUPLICATE_88d9_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l2821_c32_fc74] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2821_c32_fc74_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_return_output.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l2815_c30_5895] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2815_c30_5895_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_return_output.u16_value;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d[uxn_opcodes_h_l2819_c33_6a43] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l2819_c33_6a43_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2816_c33_fd8e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2816_c33_fd8e_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2719_c2_7623_return_output.is_ram_write;

     -- Submodule level 146
     VAR_sp0_MUX_uxn_opcodes_h_l2794_c2_4f32_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2794_c6_141d_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2794_c2_4f32_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2794_c6_141d_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2792_c2_d383_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2792_c17_e455_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2805_c21_f7ff_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2808_c3_99a7_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2805_c21_f7ff_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2807_l2820_DUPLICATE_88d9_return_output;
     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_27e9_uxn_opcodes_h_l2823_l2701_DUPLICATE_d82a LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_27e9_uxn_opcodes_h_l2823_l2701_DUPLICATE_d82a_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_27e9(
     VAR_is_wait_MUX_uxn_opcodes_h_l2719_c2_7623_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2812_c39_5d10_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2813_c40_b9d2_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2814_c34_ecda_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2815_c30_5895_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2816_c33_fd8e_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2817_c34_3ef6_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2818_c37_0ee7_return_output,
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l2819_c33_6a43_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2807_l2820_DUPLICATE_88d9_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2821_c32_fc74_return_output);

     -- BIN_OP_XOR[uxn_opcodes_h_l2792_c2_d383] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2792_c2_d383_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2792_c2_d383_left;
     BIN_OP_XOR_uxn_opcodes_h_l2792_c2_d383_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2792_c2_d383_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2792_c2_d383_return_output := BIN_OP_XOR_uxn_opcodes_h_l2792_c2_d383_return_output;

     -- CAST_TO_uint12_t[uxn_opcodes_h_l2802_c59_1782] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2802_c59_1782_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2802_c70_70c1_return_output);

     -- CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2796_l2798_DUPLICATE_3a6d LATENCY=0
     VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2796_l2798_DUPLICATE_3a6d_return_output := CAST_TO_int8_t_int4_t(
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2796_l2798_DUPLICATE_68ae_return_output);

     -- Submodule level 147
     VAR_MUX_uxn_opcodes_h_l2802_c30_774b_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2792_c2_d383_return_output;
     VAR_MUX_uxn_opcodes_h_l2803_c20_27ed_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2792_c2_d383_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2795_c3_3a25_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2792_c2_d383_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2795_c3_3a25_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2792_c2_d383_return_output;
     REG_VAR_stack_index := VAR_BIN_OP_XOR_uxn_opcodes_h_l2792_c2_d383_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2796_c4_90ce_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2796_l2798_DUPLICATE_3a6d_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2798_c4_bc13_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2796_l2798_DUPLICATE_3a6d_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2802_c19_97c4_right := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2802_c59_1782_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_27e9_uxn_opcodes_h_l2823_l2701_DUPLICATE_d82a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_27e9_uxn_opcodes_h_l2823_l2701_DUPLICATE_d82a_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2798_c4_bc13] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2798_c4_bc13_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2798_c4_bc13_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2798_c4_bc13_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2798_c4_bc13_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2798_c4_bc13_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2798_c4_bc13_return_output;

     -- MUX[uxn_opcodes_h_l2803_c20_27ed] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2803_c20_27ed_cond <= VAR_MUX_uxn_opcodes_h_l2803_c20_27ed_cond;
     MUX_uxn_opcodes_h_l2803_c20_27ed_iftrue <= VAR_MUX_uxn_opcodes_h_l2803_c20_27ed_iftrue;
     MUX_uxn_opcodes_h_l2803_c20_27ed_iffalse <= VAR_MUX_uxn_opcodes_h_l2803_c20_27ed_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2803_c20_27ed_return_output := MUX_uxn_opcodes_h_l2803_c20_27ed_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2796_c4_90ce] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2796_c4_90ce_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2796_c4_90ce_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2796_c4_90ce_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2796_c4_90ce_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2796_c4_90ce_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2796_c4_90ce_return_output;

     -- Submodule level 148
     VAR_sp1_uxn_opcodes_h_l2796_c4_258d := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2796_c4_90ce_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l2798_c4_387d := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2798_c4_bc13_return_output)),8);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2803_c2_f948_right := VAR_MUX_uxn_opcodes_h_l2803_c20_27ed_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2795_c3_3a25_iffalse := VAR_sp0_uxn_opcodes_h_l2798_c4_387d;
     VAR_sp1_MUX_uxn_opcodes_h_l2795_c3_3a25_iftrue := VAR_sp1_uxn_opcodes_h_l2796_c4_258d;
     -- sp0_MUX[uxn_opcodes_h_l2795_c3_3a25] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2795_c3_3a25_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2795_c3_3a25_cond;
     sp0_MUX_uxn_opcodes_h_l2795_c3_3a25_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2795_c3_3a25_iftrue;
     sp0_MUX_uxn_opcodes_h_l2795_c3_3a25_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2795_c3_3a25_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2795_c3_3a25_return_output := sp0_MUX_uxn_opcodes_h_l2795_c3_3a25_return_output;

     -- sp1_MUX[uxn_opcodes_h_l2795_c3_3a25] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2795_c3_3a25_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2795_c3_3a25_cond;
     sp1_MUX_uxn_opcodes_h_l2795_c3_3a25_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2795_c3_3a25_iftrue;
     sp1_MUX_uxn_opcodes_h_l2795_c3_3a25_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2795_c3_3a25_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2795_c3_3a25_return_output := sp1_MUX_uxn_opcodes_h_l2795_c3_3a25_return_output;

     -- Submodule level 149
     VAR_sp0_MUX_uxn_opcodes_h_l2794_c2_4f32_iftrue := VAR_sp0_MUX_uxn_opcodes_h_l2795_c3_3a25_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2794_c2_4f32_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2795_c3_3a25_return_output;
     -- sp1_MUX[uxn_opcodes_h_l2794_c2_4f32] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2794_c2_4f32_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2794_c2_4f32_cond;
     sp1_MUX_uxn_opcodes_h_l2794_c2_4f32_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2794_c2_4f32_iftrue;
     sp1_MUX_uxn_opcodes_h_l2794_c2_4f32_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2794_c2_4f32_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2794_c2_4f32_return_output := sp1_MUX_uxn_opcodes_h_l2794_c2_4f32_return_output;

     -- sp0_MUX[uxn_opcodes_h_l2794_c2_4f32] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2794_c2_4f32_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2794_c2_4f32_cond;
     sp0_MUX_uxn_opcodes_h_l2794_c2_4f32_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2794_c2_4f32_iftrue;
     sp0_MUX_uxn_opcodes_h_l2794_c2_4f32_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2794_c2_4f32_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2794_c2_4f32_return_output := sp0_MUX_uxn_opcodes_h_l2794_c2_4f32_return_output;

     -- Submodule level 150
     VAR_MUX_uxn_opcodes_h_l2802_c30_774b_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l2794_c2_4f32_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l2794_c2_4f32_return_output;
     VAR_MUX_uxn_opcodes_h_l2802_c30_774b_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2794_c2_4f32_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l2794_c2_4f32_return_output;
     -- MUX[uxn_opcodes_h_l2802_c30_774b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2802_c30_774b_cond <= VAR_MUX_uxn_opcodes_h_l2802_c30_774b_cond;
     MUX_uxn_opcodes_h_l2802_c30_774b_iftrue <= VAR_MUX_uxn_opcodes_h_l2802_c30_774b_iftrue;
     MUX_uxn_opcodes_h_l2802_c30_774b_iffalse <= VAR_MUX_uxn_opcodes_h_l2802_c30_774b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2802_c30_774b_return_output := MUX_uxn_opcodes_h_l2802_c30_774b_return_output;

     -- Submodule level 151
     -- CAST_TO_uint12_t[uxn_opcodes_h_l2802_c19_e678] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2802_c19_e678_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_MUX_uxn_opcodes_h_l2802_c30_774b_return_output);

     -- Submodule level 152
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2802_c19_97c4_left := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2802_c19_e678_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l2802_c19_97c4] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2802_c19_97c4_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2802_c19_97c4_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2802_c19_97c4_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2802_c19_97c4_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2802_c19_97c4_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2802_c19_97c4_return_output;

     -- Submodule level 153
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2803_c2_f948_left := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2802_c19_97c4_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2803_c2_f948] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2803_c2_f948_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2803_c2_f948_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2803_c2_f948_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2803_c2_f948_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2803_c2_f948_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2803_c2_f948_return_output;

     -- Submodule level 154
     VAR_stack_address_uxn_opcodes_h_l2803_c2_cb66 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2803_c2_f948_return_output, 12);
     REG_VAR_stack_address := VAR_stack_address_uxn_opcodes_h_l2803_c2_cb66;
     VAR_stack_ram_update_uxn_opcodes_h_l2805_c21_f7ff_stack_address := VAR_stack_address_uxn_opcodes_h_l2803_c2_cb66;
     -- stack_ram_update[uxn_opcodes_h_l2805_c21_f7ff] LATENCY=0
     -- Clock enable
     stack_ram_update_uxn_opcodes_h_l2805_c21_f7ff_CLOCK_ENABLE <= VAR_stack_ram_update_uxn_opcodes_h_l2805_c21_f7ff_CLOCK_ENABLE;
     -- Inputs
     stack_ram_update_uxn_opcodes_h_l2805_c21_f7ff_stack_address <= VAR_stack_ram_update_uxn_opcodes_h_l2805_c21_f7ff_stack_address;
     stack_ram_update_uxn_opcodes_h_l2805_c21_f7ff_value <= VAR_stack_ram_update_uxn_opcodes_h_l2805_c21_f7ff_value;
     stack_ram_update_uxn_opcodes_h_l2805_c21_f7ff_write_enable <= VAR_stack_ram_update_uxn_opcodes_h_l2805_c21_f7ff_write_enable;
     -- Outputs
     VAR_stack_ram_update_uxn_opcodes_h_l2805_c21_f7ff_return_output := stack_ram_update_uxn_opcodes_h_l2805_c21_f7ff_return_output;

     -- Submodule level 155
     REG_VAR_stack_read_value := VAR_stack_ram_update_uxn_opcodes_h_l2805_c21_f7ff_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_sp0 <= REG_VAR_sp0;
REG_COMB_sp1 <= REG_VAR_sp1;
REG_COMB_opc <= REG_VAR_opc;
REG_COMB_stack_index <= REG_VAR_stack_index;
REG_COMB_is_wait <= REG_VAR_is_wait;
REG_COMB_stack_address <= REG_VAR_stack_address;
REG_COMB_stack_read_value <= REG_VAR_stack_read_value;
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
     opc <= REG_COMB_opc;
     stack_index <= REG_COMB_stack_index;
     is_wait <= REG_COMB_is_wait;
     stack_address <= REG_COMB_stack_address;
     stack_read_value <= REG_COMB_stack_read_value;
     opc_result <= REG_COMB_opc_result;
     opc_eval_result <= REG_COMB_opc_eval_result;
 end if;
 end if;
end process;

end arch;
