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
-- Submodules: 42
entity jmp_0CLK_6481cb28 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmp_0CLK_6481cb28;
architecture arch of jmp_0CLK_6481cb28 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : signed(7 downto 0) := to_signed(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : signed(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l561_c6_67cc]
signal BIN_OP_EQ_uxn_opcodes_h_l561_c6_67cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l561_c6_67cc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l561_c6_67cc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l561_c1_ea53]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_ea53_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_ea53_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_ea53_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_ea53_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l561_c2_3fe0]
signal t8_MUX_uxn_opcodes_h_l561_c2_3fe0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l561_c2_3fe0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_3fe0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l561_c2_3fe0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_3fe0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l561_c2_3fe0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l561_c2_3fe0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_3fe0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l561_c2_3fe0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l561_c2_3fe0]
signal result_pc_MUX_uxn_opcodes_h_l561_c2_3fe0_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l561_c2_3fe0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_3fe0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l562_c3_aa43[uxn_opcodes_h_l562_c3_aa43]
signal printf_uxn_opcodes_h_l562_c3_aa43_uxn_opcodes_h_l562_c3_aa43_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l567_c11_b273]
signal BIN_OP_EQ_uxn_opcodes_h_l567_c11_b273_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l567_c11_b273_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l567_c11_b273_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l567_c7_d5a2]
signal t8_MUX_uxn_opcodes_h_l567_c7_d5a2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l567_c7_d5a2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_d5a2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l567_c7_d5a2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_d5a2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l567_c7_d5a2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l567_c7_d5a2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_d5a2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l567_c7_d5a2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l567_c7_d5a2]
signal result_pc_MUX_uxn_opcodes_h_l567_c7_d5a2_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l567_c7_d5a2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_d5a2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l570_c11_715d]
signal BIN_OP_EQ_uxn_opcodes_h_l570_c11_715d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l570_c11_715d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l570_c11_715d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l570_c7_73d4]
signal t8_MUX_uxn_opcodes_h_l570_c7_73d4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l570_c7_73d4_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l570_c7_73d4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_73d4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_73d4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l570_c7_73d4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_73d4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_73d4_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l570_c7_73d4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_73d4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_73d4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l570_c7_73d4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_73d4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_73d4_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l570_c7_73d4]
signal result_pc_MUX_uxn_opcodes_h_l570_c7_73d4_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l570_c7_73d4_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l570_c7_73d4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_73d4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_73d4_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l574_c32_c689]
signal BIN_OP_AND_uxn_opcodes_h_l574_c32_c689_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l574_c32_c689_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l574_c32_c689_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l574_c32_1d0b]
signal BIN_OP_GT_uxn_opcodes_h_l574_c32_1d0b_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l574_c32_1d0b_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l574_c32_1d0b_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l574_c32_d1a3]
signal MUX_uxn_opcodes_h_l574_c32_d1a3_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l574_c32_d1a3_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l574_c32_d1a3_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l574_c32_d1a3_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l576_c11_a4a3]
signal BIN_OP_EQ_uxn_opcodes_h_l576_c11_a4a3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l576_c11_a4a3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l576_c11_a4a3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l576_c7_c45f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_c45f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_c45f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_c45f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_c45f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l576_c7_c45f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_c45f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_c45f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_c45f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_c45f_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l576_c7_c45f]
signal result_pc_MUX_uxn_opcodes_h_l576_c7_c45f_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l576_c7_c45f_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l576_c7_c45f_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l576_c7_c45f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l576_c7_c45f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_c45f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_c45f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_c45f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_c45f_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l579_c15_ba6a]
signal BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ba6a_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ba6a_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ba6a_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l581_c11_c00c]
signal BIN_OP_EQ_uxn_opcodes_h_l581_c11_c00c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l581_c11_c00c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l581_c11_c00c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l581_c7_4ccc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_4ccc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_4ccc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_4ccc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_4ccc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l581_c7_4ccc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_4ccc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_4ccc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_4ccc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_4ccc_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_babf( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.pc := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l561_c6_67cc
BIN_OP_EQ_uxn_opcodes_h_l561_c6_67cc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l561_c6_67cc_left,
BIN_OP_EQ_uxn_opcodes_h_l561_c6_67cc_right,
BIN_OP_EQ_uxn_opcodes_h_l561_c6_67cc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_ea53
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_ea53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_ea53_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_ea53_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_ea53_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_ea53_return_output);

-- t8_MUX_uxn_opcodes_h_l561_c2_3fe0
t8_MUX_uxn_opcodes_h_l561_c2_3fe0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l561_c2_3fe0_cond,
t8_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue,
t8_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse,
t8_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_3fe0
result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_3fe0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_3fe0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_3fe0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_3fe0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_3fe0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_3fe0
result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_3fe0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_3fe0
result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_3fe0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_3fe0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_3fe0
result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_3fe0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output);

-- result_pc_MUX_uxn_opcodes_h_l561_c2_3fe0
result_pc_MUX_uxn_opcodes_h_l561_c2_3fe0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l561_c2_3fe0_cond,
result_pc_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue,
result_pc_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse,
result_pc_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_3fe0
result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_3fe0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_3fe0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output);

-- printf_uxn_opcodes_h_l562_c3_aa43_uxn_opcodes_h_l562_c3_aa43
printf_uxn_opcodes_h_l562_c3_aa43_uxn_opcodes_h_l562_c3_aa43 : entity work.printf_uxn_opcodes_h_l562_c3_aa43_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l562_c3_aa43_uxn_opcodes_h_l562_c3_aa43_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l567_c11_b273
BIN_OP_EQ_uxn_opcodes_h_l567_c11_b273 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l567_c11_b273_left,
BIN_OP_EQ_uxn_opcodes_h_l567_c11_b273_right,
BIN_OP_EQ_uxn_opcodes_h_l567_c11_b273_return_output);

-- t8_MUX_uxn_opcodes_h_l567_c7_d5a2
t8_MUX_uxn_opcodes_h_l567_c7_d5a2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l567_c7_d5a2_cond,
t8_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue,
t8_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse,
t8_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_d5a2
result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_d5a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_d5a2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_d5a2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_d5a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_d5a2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_d5a2
result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_d5a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_d5a2
result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_d5a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_d5a2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_d5a2
result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_d5a2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output);

-- result_pc_MUX_uxn_opcodes_h_l567_c7_d5a2
result_pc_MUX_uxn_opcodes_h_l567_c7_d5a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l567_c7_d5a2_cond,
result_pc_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue,
result_pc_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse,
result_pc_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_d5a2
result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_d5a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_d5a2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l570_c11_715d
BIN_OP_EQ_uxn_opcodes_h_l570_c11_715d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l570_c11_715d_left,
BIN_OP_EQ_uxn_opcodes_h_l570_c11_715d_right,
BIN_OP_EQ_uxn_opcodes_h_l570_c11_715d_return_output);

-- t8_MUX_uxn_opcodes_h_l570_c7_73d4
t8_MUX_uxn_opcodes_h_l570_c7_73d4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l570_c7_73d4_cond,
t8_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue,
t8_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse,
t8_MUX_uxn_opcodes_h_l570_c7_73d4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_73d4
result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_73d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_73d4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_73d4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_73d4
result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_73d4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_73d4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_73d4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_73d4
result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_73d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_73d4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_73d4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_73d4
result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_73d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_73d4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_73d4_return_output);

-- result_pc_MUX_uxn_opcodes_h_l570_c7_73d4
result_pc_MUX_uxn_opcodes_h_l570_c7_73d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l570_c7_73d4_cond,
result_pc_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue,
result_pc_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse,
result_pc_MUX_uxn_opcodes_h_l570_c7_73d4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_73d4
result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_73d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_73d4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_73d4_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l574_c32_c689
BIN_OP_AND_uxn_opcodes_h_l574_c32_c689 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l574_c32_c689_left,
BIN_OP_AND_uxn_opcodes_h_l574_c32_c689_right,
BIN_OP_AND_uxn_opcodes_h_l574_c32_c689_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l574_c32_1d0b
BIN_OP_GT_uxn_opcodes_h_l574_c32_1d0b : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l574_c32_1d0b_left,
BIN_OP_GT_uxn_opcodes_h_l574_c32_1d0b_right,
BIN_OP_GT_uxn_opcodes_h_l574_c32_1d0b_return_output);

-- MUX_uxn_opcodes_h_l574_c32_d1a3
MUX_uxn_opcodes_h_l574_c32_d1a3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l574_c32_d1a3_cond,
MUX_uxn_opcodes_h_l574_c32_d1a3_iftrue,
MUX_uxn_opcodes_h_l574_c32_d1a3_iffalse,
MUX_uxn_opcodes_h_l574_c32_d1a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l576_c11_a4a3
BIN_OP_EQ_uxn_opcodes_h_l576_c11_a4a3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l576_c11_a4a3_left,
BIN_OP_EQ_uxn_opcodes_h_l576_c11_a4a3_right,
BIN_OP_EQ_uxn_opcodes_h_l576_c11_a4a3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_c45f
result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_c45f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_c45f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_c45f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_c45f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_c45f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_c45f
result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_c45f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_c45f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_c45f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_c45f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_c45f_return_output);

-- result_pc_MUX_uxn_opcodes_h_l576_c7_c45f
result_pc_MUX_uxn_opcodes_h_l576_c7_c45f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l576_c7_c45f_cond,
result_pc_MUX_uxn_opcodes_h_l576_c7_c45f_iftrue,
result_pc_MUX_uxn_opcodes_h_l576_c7_c45f_iffalse,
result_pc_MUX_uxn_opcodes_h_l576_c7_c45f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_c45f
result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_c45f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_c45f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_c45f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_c45f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_c45f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ba6a
BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ba6a : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ba6a_left,
BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ba6a_right,
BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ba6a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l581_c11_c00c
BIN_OP_EQ_uxn_opcodes_h_l581_c11_c00c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l581_c11_c00c_left,
BIN_OP_EQ_uxn_opcodes_h_l581_c11_c00c_right,
BIN_OP_EQ_uxn_opcodes_h_l581_c11_c00c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_4ccc
result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_4ccc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_4ccc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_4ccc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_4ccc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_4ccc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_4ccc
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_4ccc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_4ccc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_4ccc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_4ccc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_4ccc_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l561_c6_67cc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_ea53_return_output,
 t8_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output,
 result_pc_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l567_c11_b273_return_output,
 t8_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output,
 result_pc_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l570_c11_715d_return_output,
 t8_MUX_uxn_opcodes_h_l570_c7_73d4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_73d4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_73d4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_73d4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_73d4_return_output,
 result_pc_MUX_uxn_opcodes_h_l570_c7_73d4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_73d4_return_output,
 BIN_OP_AND_uxn_opcodes_h_l574_c32_c689_return_output,
 BIN_OP_GT_uxn_opcodes_h_l574_c32_1d0b_return_output,
 MUX_uxn_opcodes_h_l574_c32_d1a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l576_c11_a4a3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_c45f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_c45f_return_output,
 result_pc_MUX_uxn_opcodes_h_l576_c7_c45f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_c45f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ba6a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l581_c11_c00c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_4ccc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_4ccc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_67cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_67cc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_67cc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_ea53_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_ea53_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_ea53_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_ea53_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l561_c2_3fe0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_3fe0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l564_c3_6301 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_3fe0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_3fe0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l561_c2_3fe0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_3fe0_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l562_c3_aa43_uxn_opcodes_h_l562_c3_aa43_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_b273_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_b273_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_b273_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l570_c7_73d4_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l567_c7_d5a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_73d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_d5a2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l568_c3_cdcf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l567_c7_d5a2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_d5a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_73d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_73d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_d5a2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_73d4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l570_c7_73d4_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l567_c7_d5a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_73d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_d5a2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c11_715d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c11_715d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c11_715d_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l570_c7_73d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_c45f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_73d4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_73d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_c45f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_73d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_73d4_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l576_c7_c45f_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l570_c7_73d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_c45f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_73d4_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l571_c8_ee38_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l574_c32_d1a3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l574_c32_d1a3_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l574_c32_d1a3_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l574_c32_c689_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l574_c32_c689_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l574_c32_c689_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l574_c32_1d0b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l574_c32_1d0b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l574_c32_1d0b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l574_c32_d1a3_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_a4a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_a4a3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_a4a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_c45f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_c45f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_c45f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_c45f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_c45f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_4ccc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_c45f_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l576_c7_c45f_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l579_c3_5494 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l576_c7_c45f_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l576_c7_c45f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_c45f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_c45f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_4ccc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_c45f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ba6a_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ba6a_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ba6a_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c00c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c00c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c00c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_4ccc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_4ccc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_4ccc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_4ccc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_4ccc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_4ccc_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l561_l567_l581_l570_DUPLICATE_8af7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l561_l567_l576_DUPLICATE_84d6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l561_l567_l570_DUPLICATE_08e3_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l561_l567_l570_l576_DUPLICATE_7e92_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l567_l570_DUPLICATE_0063_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l567_l581_l570_l576_DUPLICATE_28af_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_babf_uxn_opcodes_h_l586_l557_DUPLICATE_45fa_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : signed(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_c45f_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_ea53_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l574_c32_d1a3_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_67cc_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_4ccc_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_b273_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l574_c32_d1a3_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_4ccc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c00c_right := to_unsigned(4, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_c45f_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c11_715d_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_a4a3_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l564_c3_6301 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l564_c3_6301;
     VAR_BIN_OP_GT_uxn_opcodes_h_l574_c32_1d0b_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l574_c32_c689_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l568_c3_cdcf := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l568_c3_cdcf;

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
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_ea53_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l574_c32_c689_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ba6a_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_67cc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_b273_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c11_715d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_a4a3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c00c_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ba6a_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse := t8;
     -- BIN_OP_PLUS[uxn_opcodes_h_l579_c15_ba6a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ba6a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ba6a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ba6a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ba6a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ba6a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ba6a_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l567_c7_d5a2] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l567_c7_d5a2_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l567_l581_l570_l576_DUPLICATE_28af LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l567_l581_l570_l576_DUPLICATE_28af_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l570_c11_715d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l570_c11_715d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c11_715d_left;
     BIN_OP_EQ_uxn_opcodes_h_l570_c11_715d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c11_715d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c11_715d_return_output := BIN_OP_EQ_uxn_opcodes_h_l570_c11_715d_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l574_c32_c689] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l574_c32_c689_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l574_c32_c689_left;
     BIN_OP_AND_uxn_opcodes_h_l574_c32_c689_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l574_c32_c689_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l574_c32_c689_return_output := BIN_OP_AND_uxn_opcodes_h_l574_c32_c689_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l571_c8_ee38] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l571_c8_ee38_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l561_l567_l570_l576_DUPLICATE_7e92 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l561_l567_l570_l576_DUPLICATE_7e92_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l561_c6_67cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l561_c6_67cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_67cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l561_c6_67cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_67cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_67cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l561_c6_67cc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l567_l570_DUPLICATE_0063 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l567_l570_DUPLICATE_0063_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l561_l567_l576_DUPLICATE_84d6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l561_l567_l576_DUPLICATE_84d6_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l567_c11_b273] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l567_c11_b273_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_b273_left;
     BIN_OP_EQ_uxn_opcodes_h_l567_c11_b273_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_b273_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_b273_return_output := BIN_OP_EQ_uxn_opcodes_h_l567_c11_b273_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l576_c11_a4a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l576_c11_a4a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_a4a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l576_c11_a4a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_a4a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_a4a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l576_c11_a4a3_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l561_l567_l570_DUPLICATE_08e3 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l561_l567_l570_DUPLICATE_08e3_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l581_c11_c00c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l581_c11_c00c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c00c_left;
     BIN_OP_EQ_uxn_opcodes_h_l581_c11_c00c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c00c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c00c_return_output := BIN_OP_EQ_uxn_opcodes_h_l581_c11_c00c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l561_l567_l581_l570_DUPLICATE_8af7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l561_l567_l581_l570_DUPLICATE_8af7_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l574_c32_1d0b_left := VAR_BIN_OP_AND_uxn_opcodes_h_l574_c32_c689_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_ea53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_67cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_3fe0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_67cc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_3fe0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_67cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_67cc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_3fe0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_67cc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l561_c2_3fe0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_67cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_67cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_3fe0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_67cc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l561_c2_3fe0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_67cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_d5a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_b273_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_d5a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_b273_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_b273_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_d5a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_b273_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l567_c7_d5a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_b273_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_b273_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_d5a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_b273_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l567_c7_d5a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_b273_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_73d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c11_715d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_73d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c11_715d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_73d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c11_715d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_73d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c11_715d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l570_c7_73d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c11_715d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_73d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c11_715d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l570_c7_73d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c11_715d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_c45f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_a4a3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_c45f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_a4a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_c45f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_a4a3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l576_c7_c45f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_a4a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_4ccc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c00c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_4ccc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c00c_return_output;
     VAR_result_pc_uxn_opcodes_h_l579_c3_5494 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ba6a_return_output)),16);
     VAR_t8_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue := VAR_CAST_TO_int8_t_uxn_opcodes_h_l571_c8_ee38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l561_l567_l570_DUPLICATE_08e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l561_l567_l570_DUPLICATE_08e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l561_l567_l570_DUPLICATE_08e3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l561_l567_l570_l576_DUPLICATE_7e92_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l561_l567_l570_l576_DUPLICATE_7e92_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l561_l567_l570_l576_DUPLICATE_7e92_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l576_c7_c45f_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l561_l567_l570_l576_DUPLICATE_7e92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l567_l581_l570_l576_DUPLICATE_28af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l567_l581_l570_l576_DUPLICATE_28af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_c45f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l567_l581_l570_l576_DUPLICATE_28af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_4ccc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l567_l581_l570_l576_DUPLICATE_28af_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l561_l567_l581_l570_DUPLICATE_8af7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l561_l567_l581_l570_DUPLICATE_8af7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l561_l567_l581_l570_DUPLICATE_8af7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_4ccc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l561_l567_l581_l570_DUPLICATE_8af7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l561_l567_l576_DUPLICATE_84d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l561_l567_l576_DUPLICATE_84d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_c45f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l561_l567_l576_DUPLICATE_84d6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l567_l570_DUPLICATE_0063_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l567_l570_DUPLICATE_0063_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l567_c7_d5a2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l576_c7_c45f_iftrue := VAR_result_pc_uxn_opcodes_h_l579_c3_5494;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l567_c7_d5a2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_d5a2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_d5a2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l581_c7_4ccc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_4ccc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_4ccc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_4ccc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_4ccc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_4ccc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_4ccc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_4ccc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_4ccc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l581_c7_4ccc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_4ccc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_4ccc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_4ccc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_4ccc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_4ccc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_4ccc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_4ccc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_4ccc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l561_c1_ea53] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_ea53_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_ea53_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_ea53_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_ea53_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_ea53_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_ea53_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_ea53_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_ea53_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l574_c32_1d0b] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l574_c32_1d0b_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l574_c32_1d0b_left;
     BIN_OP_GT_uxn_opcodes_h_l574_c32_1d0b_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l574_c32_1d0b_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l574_c32_1d0b_return_output := BIN_OP_GT_uxn_opcodes_h_l574_c32_1d0b_return_output;

     -- t8_MUX[uxn_opcodes_h_l570_c7_73d4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l570_c7_73d4_cond <= VAR_t8_MUX_uxn_opcodes_h_l570_c7_73d4_cond;
     t8_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue;
     t8_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l570_c7_73d4_return_output := t8_MUX_uxn_opcodes_h_l570_c7_73d4_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l576_c7_c45f] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l576_c7_c45f_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l576_c7_c45f_cond;
     result_pc_MUX_uxn_opcodes_h_l576_c7_c45f_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l576_c7_c45f_iftrue;
     result_pc_MUX_uxn_opcodes_h_l576_c7_c45f_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l576_c7_c45f_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l576_c7_c45f_return_output := result_pc_MUX_uxn_opcodes_h_l576_c7_c45f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l570_c7_73d4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_73d4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_73d4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_73d4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_73d4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l576_c7_c45f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_c45f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_c45f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_c45f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_c45f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_c45f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_c45f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_c45f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_c45f_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l574_c32_d1a3_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l574_c32_1d0b_return_output;
     VAR_printf_uxn_opcodes_h_l562_c3_aa43_uxn_opcodes_h_l562_c3_aa43_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_ea53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_c45f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_4ccc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_c45f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_4ccc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_c45f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_73d4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l576_c7_c45f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse := VAR_t8_MUX_uxn_opcodes_h_l570_c7_73d4_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l570_c7_73d4] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l570_c7_73d4_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l570_c7_73d4_cond;
     result_pc_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue;
     result_pc_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l570_c7_73d4_return_output := result_pc_MUX_uxn_opcodes_h_l570_c7_73d4_return_output;

     -- MUX[uxn_opcodes_h_l574_c32_d1a3] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l574_c32_d1a3_cond <= VAR_MUX_uxn_opcodes_h_l574_c32_d1a3_cond;
     MUX_uxn_opcodes_h_l574_c32_d1a3_iftrue <= VAR_MUX_uxn_opcodes_h_l574_c32_d1a3_iftrue;
     MUX_uxn_opcodes_h_l574_c32_d1a3_iffalse <= VAR_MUX_uxn_opcodes_h_l574_c32_d1a3_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l574_c32_d1a3_return_output := MUX_uxn_opcodes_h_l574_c32_d1a3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l570_c7_73d4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_73d4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_73d4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_73d4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_73d4_return_output;

     -- printf_uxn_opcodes_h_l562_c3_aa43[uxn_opcodes_h_l562_c3_aa43] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l562_c3_aa43_uxn_opcodes_h_l562_c3_aa43_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l562_c3_aa43_uxn_opcodes_h_l562_c3_aa43_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l567_c7_d5a2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_d5a2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_d5a2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l576_c7_c45f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_c45f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_c45f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_c45f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_c45f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_c45f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_c45f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_c45f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_c45f_return_output;

     -- t8_MUX[uxn_opcodes_h_l567_c7_d5a2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l567_c7_d5a2_cond <= VAR_t8_MUX_uxn_opcodes_h_l567_c7_d5a2_cond;
     t8_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue;
     t8_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output := t8_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l561_c2_3fe0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_3fe0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_3fe0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l576_c7_c45f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_c45f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_c45f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_c45f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_c45f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_c45f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_c45f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_c45f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_c45f_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue := VAR_MUX_uxn_opcodes_h_l574_c32_d1a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_c45f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_c45f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_73d4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l570_c7_73d4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse := VAR_t8_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l570_c7_73d4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_73d4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_73d4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_73d4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_73d4_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l567_c7_d5a2] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l567_c7_d5a2_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l567_c7_d5a2_cond;
     result_pc_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue;
     result_pc_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output := result_pc_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l561_c2_3fe0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_3fe0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_3fe0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output;

     -- t8_MUX[uxn_opcodes_h_l561_c2_3fe0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l561_c2_3fe0_cond <= VAR_t8_MUX_uxn_opcodes_h_l561_c2_3fe0_cond;
     t8_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue;
     t8_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output := t8_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l567_c7_d5a2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l570_c7_73d4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_73d4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_73d4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_73d4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_73d4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l570_c7_73d4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_73d4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_73d4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_73d4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_73d4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_73d4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_73d4_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_73d4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_73d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_73d4_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l567_c7_d5a2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_d5a2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_d5a2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l561_c2_3fe0] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l561_c2_3fe0_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l561_c2_3fe0_cond;
     result_pc_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue;
     result_pc_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output := result_pc_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l567_c7_d5a2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l567_c7_d5a2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_d5a2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_d5a2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_d5a2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_d5a2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l561_c2_3fe0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_d5a2_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l561_c2_3fe0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l561_c2_3fe0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_3fe0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_3fe0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l561_c2_3fe0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_3fe0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_3fe0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_3fe0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_3fe0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output;

     -- Submodule level 6
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_babf_uxn_opcodes_h_l586_l557_DUPLICATE_45fa LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_babf_uxn_opcodes_h_l586_l557_DUPLICATE_45fa_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_babf(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_3fe0_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_babf_uxn_opcodes_h_l586_l557_DUPLICATE_45fa_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_babf_uxn_opcodes_h_l586_l557_DUPLICATE_45fa_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
