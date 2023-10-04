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
-- BIN_OP_EQ[uxn_opcodes_h_l561_c6_af81]
signal BIN_OP_EQ_uxn_opcodes_h_l561_c6_af81_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l561_c6_af81_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l561_c6_af81_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l561_c1_1289]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_1289_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_1289_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_1289_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_1289_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l561_c2_156c]
signal t8_MUX_uxn_opcodes_h_l561_c2_156c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l561_c2_156c_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l561_c2_156c_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l561_c2_156c_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l561_c2_156c]
signal result_pc_MUX_uxn_opcodes_h_l561_c2_156c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l561_c2_156c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l561_c2_156c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l561_c2_156c_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l561_c2_156c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_156c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_156c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_156c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_156c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l561_c2_156c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_156c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_156c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_156c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_156c_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l561_c2_156c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_156c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_156c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_156c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_156c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l561_c2_156c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_156c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_156c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_156c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_156c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l561_c2_156c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_156c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_156c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_156c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_156c_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l561_c2_156c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_156c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_156c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_156c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_156c_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l562_c3_ff0c[uxn_opcodes_h_l562_c3_ff0c]
signal printf_uxn_opcodes_h_l562_c3_ff0c_uxn_opcodes_h_l562_c3_ff0c_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l567_c11_fc7c]
signal BIN_OP_EQ_uxn_opcodes_h_l567_c11_fc7c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l567_c11_fc7c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l567_c11_fc7c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l567_c7_1688]
signal t8_MUX_uxn_opcodes_h_l567_c7_1688_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l567_c7_1688_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l567_c7_1688_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l567_c7_1688_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l567_c7_1688]
signal result_pc_MUX_uxn_opcodes_h_l567_c7_1688_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l567_c7_1688_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l567_c7_1688_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l567_c7_1688_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l567_c7_1688]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_1688_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_1688_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_1688_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_1688_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l567_c7_1688]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_1688_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_1688_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_1688_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_1688_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l567_c7_1688]
signal result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_1688_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_1688_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_1688_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_1688_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l567_c7_1688]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_1688_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_1688_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_1688_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_1688_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l567_c7_1688]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_1688_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_1688_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_1688_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_1688_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l567_c7_1688]
signal result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_1688_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_1688_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_1688_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_1688_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l570_c11_4d28]
signal BIN_OP_EQ_uxn_opcodes_h_l570_c11_4d28_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l570_c11_4d28_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l570_c11_4d28_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l570_c7_fa55]
signal t8_MUX_uxn_opcodes_h_l570_c7_fa55_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l570_c7_fa55_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l570_c7_fa55]
signal result_pc_MUX_uxn_opcodes_h_l570_c7_fa55_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l570_c7_fa55_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l570_c7_fa55]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_fa55_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_fa55_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l570_c7_fa55]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_fa55_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_fa55_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l570_c7_fa55]
signal result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_fa55_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_fa55_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l570_c7_fa55]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_fa55_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_fa55_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l570_c7_fa55]
signal result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_fa55_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_fa55_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l574_c32_bb9e]
signal BIN_OP_AND_uxn_opcodes_h_l574_c32_bb9e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l574_c32_bb9e_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l574_c32_bb9e_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l574_c32_89a8]
signal BIN_OP_GT_uxn_opcodes_h_l574_c32_89a8_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l574_c32_89a8_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l574_c32_89a8_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l574_c32_da1f]
signal MUX_uxn_opcodes_h_l574_c32_da1f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l574_c32_da1f_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l574_c32_da1f_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l574_c32_da1f_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l576_c11_c489]
signal BIN_OP_EQ_uxn_opcodes_h_l576_c11_c489_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l576_c11_c489_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l576_c11_c489_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l576_c7_098b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_098b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_098b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_098b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_098b_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l576_c7_098b]
signal result_pc_MUX_uxn_opcodes_h_l576_c7_098b_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l576_c7_098b_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l576_c7_098b_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l576_c7_098b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l576_c7_098b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_098b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_098b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_098b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_098b_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l576_c7_098b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_098b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_098b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_098b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_098b_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l579_c15_ce34]
signal BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ce34_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ce34_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ce34_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l581_c11_2172]
signal BIN_OP_EQ_uxn_opcodes_h_l581_c11_2172_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l581_c11_2172_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l581_c11_2172_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l581_c7_d837]
signal result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d837_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d837_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d837_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d837_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l581_c7_d837]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_d837_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_d837_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_d837_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_d837_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_a4db( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.pc := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_pc_updated := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l561_c6_af81
BIN_OP_EQ_uxn_opcodes_h_l561_c6_af81 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l561_c6_af81_left,
BIN_OP_EQ_uxn_opcodes_h_l561_c6_af81_right,
BIN_OP_EQ_uxn_opcodes_h_l561_c6_af81_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_1289
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_1289 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_1289_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_1289_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_1289_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_1289_return_output);

-- t8_MUX_uxn_opcodes_h_l561_c2_156c
t8_MUX_uxn_opcodes_h_l561_c2_156c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l561_c2_156c_cond,
t8_MUX_uxn_opcodes_h_l561_c2_156c_iftrue,
t8_MUX_uxn_opcodes_h_l561_c2_156c_iffalse,
t8_MUX_uxn_opcodes_h_l561_c2_156c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l561_c2_156c
result_pc_MUX_uxn_opcodes_h_l561_c2_156c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l561_c2_156c_cond,
result_pc_MUX_uxn_opcodes_h_l561_c2_156c_iftrue,
result_pc_MUX_uxn_opcodes_h_l561_c2_156c_iffalse,
result_pc_MUX_uxn_opcodes_h_l561_c2_156c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_156c
result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_156c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_156c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_156c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_156c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_156c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_156c
result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_156c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_156c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_156c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_156c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_156c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_156c
result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_156c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_156c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_156c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_156c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_156c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_156c
result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_156c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_156c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_156c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_156c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_156c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_156c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_156c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_156c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_156c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_156c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_156c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_156c
result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_156c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_156c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_156c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_156c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_156c_return_output);

-- printf_uxn_opcodes_h_l562_c3_ff0c_uxn_opcodes_h_l562_c3_ff0c
printf_uxn_opcodes_h_l562_c3_ff0c_uxn_opcodes_h_l562_c3_ff0c : entity work.printf_uxn_opcodes_h_l562_c3_ff0c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l562_c3_ff0c_uxn_opcodes_h_l562_c3_ff0c_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l567_c11_fc7c
BIN_OP_EQ_uxn_opcodes_h_l567_c11_fc7c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l567_c11_fc7c_left,
BIN_OP_EQ_uxn_opcodes_h_l567_c11_fc7c_right,
BIN_OP_EQ_uxn_opcodes_h_l567_c11_fc7c_return_output);

-- t8_MUX_uxn_opcodes_h_l567_c7_1688
t8_MUX_uxn_opcodes_h_l567_c7_1688 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l567_c7_1688_cond,
t8_MUX_uxn_opcodes_h_l567_c7_1688_iftrue,
t8_MUX_uxn_opcodes_h_l567_c7_1688_iffalse,
t8_MUX_uxn_opcodes_h_l567_c7_1688_return_output);

-- result_pc_MUX_uxn_opcodes_h_l567_c7_1688
result_pc_MUX_uxn_opcodes_h_l567_c7_1688 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l567_c7_1688_cond,
result_pc_MUX_uxn_opcodes_h_l567_c7_1688_iftrue,
result_pc_MUX_uxn_opcodes_h_l567_c7_1688_iffalse,
result_pc_MUX_uxn_opcodes_h_l567_c7_1688_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_1688
result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_1688 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_1688_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_1688_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_1688_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_1688_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_1688
result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_1688 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_1688_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_1688_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_1688_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_1688_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_1688
result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_1688 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_1688_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_1688_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_1688_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_1688_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_1688
result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_1688 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_1688_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_1688_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_1688_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_1688_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_1688
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_1688 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_1688_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_1688_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_1688_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_1688_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_1688
result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_1688 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_1688_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_1688_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_1688_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_1688_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l570_c11_4d28
BIN_OP_EQ_uxn_opcodes_h_l570_c11_4d28 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l570_c11_4d28_left,
BIN_OP_EQ_uxn_opcodes_h_l570_c11_4d28_right,
BIN_OP_EQ_uxn_opcodes_h_l570_c11_4d28_return_output);

-- t8_MUX_uxn_opcodes_h_l570_c7_fa55
t8_MUX_uxn_opcodes_h_l570_c7_fa55 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l570_c7_fa55_cond,
t8_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue,
t8_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse,
t8_MUX_uxn_opcodes_h_l570_c7_fa55_return_output);

-- result_pc_MUX_uxn_opcodes_h_l570_c7_fa55
result_pc_MUX_uxn_opcodes_h_l570_c7_fa55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l570_c7_fa55_cond,
result_pc_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue,
result_pc_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse,
result_pc_MUX_uxn_opcodes_h_l570_c7_fa55_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_fa55
result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_fa55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_fa55_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_fa55_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_fa55
result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_fa55 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_fa55_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_fa55_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_fa55
result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_fa55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_fa55_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_fa55_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_fa55
result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_fa55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_fa55_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_fa55_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_fa55
result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_fa55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_fa55_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_fa55_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l574_c32_bb9e
BIN_OP_AND_uxn_opcodes_h_l574_c32_bb9e : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l574_c32_bb9e_left,
BIN_OP_AND_uxn_opcodes_h_l574_c32_bb9e_right,
BIN_OP_AND_uxn_opcodes_h_l574_c32_bb9e_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l574_c32_89a8
BIN_OP_GT_uxn_opcodes_h_l574_c32_89a8 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l574_c32_89a8_left,
BIN_OP_GT_uxn_opcodes_h_l574_c32_89a8_right,
BIN_OP_GT_uxn_opcodes_h_l574_c32_89a8_return_output);

-- MUX_uxn_opcodes_h_l574_c32_da1f
MUX_uxn_opcodes_h_l574_c32_da1f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l574_c32_da1f_cond,
MUX_uxn_opcodes_h_l574_c32_da1f_iftrue,
MUX_uxn_opcodes_h_l574_c32_da1f_iffalse,
MUX_uxn_opcodes_h_l574_c32_da1f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l576_c11_c489
BIN_OP_EQ_uxn_opcodes_h_l576_c11_c489 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l576_c11_c489_left,
BIN_OP_EQ_uxn_opcodes_h_l576_c11_c489_right,
BIN_OP_EQ_uxn_opcodes_h_l576_c11_c489_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_098b
result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_098b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_098b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_098b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_098b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_098b_return_output);

-- result_pc_MUX_uxn_opcodes_h_l576_c7_098b
result_pc_MUX_uxn_opcodes_h_l576_c7_098b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l576_c7_098b_cond,
result_pc_MUX_uxn_opcodes_h_l576_c7_098b_iftrue,
result_pc_MUX_uxn_opcodes_h_l576_c7_098b_iffalse,
result_pc_MUX_uxn_opcodes_h_l576_c7_098b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_098b
result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_098b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_098b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_098b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_098b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_098b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_098b
result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_098b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_098b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_098b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_098b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_098b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ce34
BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ce34 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ce34_left,
BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ce34_right,
BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ce34_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l581_c11_2172
BIN_OP_EQ_uxn_opcodes_h_l581_c11_2172 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l581_c11_2172_left,
BIN_OP_EQ_uxn_opcodes_h_l581_c11_2172_right,
BIN_OP_EQ_uxn_opcodes_h_l581_c11_2172_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d837
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d837 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d837_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d837_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d837_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d837_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_d837
result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_d837 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_d837_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_d837_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_d837_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_d837_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l561_c6_af81_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_1289_return_output,
 t8_MUX_uxn_opcodes_h_l561_c2_156c_return_output,
 result_pc_MUX_uxn_opcodes_h_l561_c2_156c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_156c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_156c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_156c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_156c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_156c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_156c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l567_c11_fc7c_return_output,
 t8_MUX_uxn_opcodes_h_l567_c7_1688_return_output,
 result_pc_MUX_uxn_opcodes_h_l567_c7_1688_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_1688_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_1688_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_1688_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_1688_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_1688_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_1688_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l570_c11_4d28_return_output,
 t8_MUX_uxn_opcodes_h_l570_c7_fa55_return_output,
 result_pc_MUX_uxn_opcodes_h_l570_c7_fa55_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_fa55_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_fa55_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_fa55_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_fa55_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_fa55_return_output,
 BIN_OP_AND_uxn_opcodes_h_l574_c32_bb9e_return_output,
 BIN_OP_GT_uxn_opcodes_h_l574_c32_89a8_return_output,
 MUX_uxn_opcodes_h_l574_c32_da1f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l576_c11_c489_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_098b_return_output,
 result_pc_MUX_uxn_opcodes_h_l576_c7_098b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_098b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_098b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ce34_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l581_c11_2172_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d837_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_d837_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_af81_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_af81_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_af81_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_1289_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_1289_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_1289_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_1289_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l561_c2_156c_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l561_c2_156c_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l567_c7_1688_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l561_c2_156c_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l561_c2_156c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l561_c2_156c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l561_c2_156c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l567_c7_1688_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l561_c2_156c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l561_c2_156c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_156c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_156c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_1688_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_156c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_156c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_156c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_156c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_1688_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_156c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_156c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_156c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_156c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_1688_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_156c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_156c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_156c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_156c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_1688_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_156c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_156c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_156c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l564_c3_efd4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_156c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_1688_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_156c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_156c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_156c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_156c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_1688_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_156c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_156c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l562_c3_ff0c_uxn_opcodes_h_l562_c3_ff0c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_fc7c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_fc7c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_fc7c_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l567_c7_1688_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l567_c7_1688_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l570_c7_fa55_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l567_c7_1688_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l567_c7_1688_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l567_c7_1688_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l570_c7_fa55_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l567_c7_1688_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_1688_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_1688_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_fa55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_1688_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_1688_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_1688_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_fa55_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_1688_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_1688_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_1688_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_fa55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_1688_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_1688_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_1688_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_fa55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_1688_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_1688_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l568_c3_c359 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_1688_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l567_c7_1688_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_1688_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_1688_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_1688_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_fa55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_1688_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c11_4d28_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c11_4d28_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c11_4d28_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l570_c7_fa55_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l576_c7_098b_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l570_c7_fa55_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_098b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_fa55_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_fa55_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_098b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_fa55_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_098b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_fa55_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_fa55_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l571_c8_569a_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l574_c32_da1f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l574_c32_da1f_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l574_c32_da1f_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l574_c32_bb9e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l574_c32_bb9e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l574_c32_bb9e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l574_c32_89a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l574_c32_89a8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l574_c32_89a8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l574_c32_da1f_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c489_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c489_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c489_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_098b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_098b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_098b_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l576_c7_098b_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l579_c3_7f81 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l576_c7_098b_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l576_c7_098b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_098b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_098b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d837_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_098b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_098b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_098b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_d837_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_098b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ce34_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ce34_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ce34_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_2172_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_2172_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_2172_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d837_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d837_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d837_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_d837_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_d837_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_d837_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l567_l570_l561_l576_DUPLICATE_26fc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l567_l561_l576_DUPLICATE_f8b4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l567_l570_l561_DUPLICATE_e6ba_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l567_l581_l570_l561_DUPLICATE_df49_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l567_l581_l570_l576_DUPLICATE_7411_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l567_l570_DUPLICATE_dba5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a4db_uxn_opcodes_h_l586_l557_DUPLICATE_a7b2_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_fc7c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c489_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l568_c3_c359 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_1688_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l568_c3_c359;
     VAR_BIN_OP_GT_uxn_opcodes_h_l574_c32_89a8_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l564_c3_efd4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_156c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l564_c3_efd4;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_d837_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_156c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l574_c32_bb9e_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_2172_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l574_c32_da1f_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_098b_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_156c_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l574_c32_da1f_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c11_4d28_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d837_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_af81_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_098b_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_1289_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_1289_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l574_c32_bb9e_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ce34_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_af81_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_fc7c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c11_4d28_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c489_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_2172_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ce34_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l561_c2_156c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l567_c7_1688_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l570_c11_4d28] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l570_c11_4d28_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c11_4d28_left;
     BIN_OP_EQ_uxn_opcodes_h_l570_c11_4d28_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c11_4d28_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c11_4d28_return_output := BIN_OP_EQ_uxn_opcodes_h_l570_c11_4d28_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l574_c32_bb9e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l574_c32_bb9e_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l574_c32_bb9e_left;
     BIN_OP_AND_uxn_opcodes_h_l574_c32_bb9e_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l574_c32_bb9e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l574_c32_bb9e_return_output := BIN_OP_AND_uxn_opcodes_h_l574_c32_bb9e_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l567_c7_1688] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l567_c7_1688_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l567_l570_l561_l576_DUPLICATE_26fc LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l567_l570_l561_l576_DUPLICATE_26fc_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l576_c11_c489] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l576_c11_c489_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c489_left;
     BIN_OP_EQ_uxn_opcodes_h_l576_c11_c489_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c489_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c489_return_output := BIN_OP_EQ_uxn_opcodes_h_l576_c11_c489_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l571_c8_569a] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l571_c8_569a_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l567_l570_DUPLICATE_dba5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l567_l570_DUPLICATE_dba5_return_output := result.is_stack_read;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l567_l570_l561_DUPLICATE_e6ba LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l567_l570_l561_DUPLICATE_e6ba_return_output := result.sp_relative_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l579_c15_ce34] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ce34_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ce34_left;
     BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ce34_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ce34_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ce34_return_output := BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ce34_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l567_l561_l576_DUPLICATE_f8b4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l567_l561_l576_DUPLICATE_f8b4_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l567_l581_l570_l576_DUPLICATE_7411 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l567_l581_l570_l576_DUPLICATE_7411_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l561_c6_af81] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l561_c6_af81_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_af81_left;
     BIN_OP_EQ_uxn_opcodes_h_l561_c6_af81_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_af81_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_af81_return_output := BIN_OP_EQ_uxn_opcodes_h_l561_c6_af81_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l567_c11_fc7c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l567_c11_fc7c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_fc7c_left;
     BIN_OP_EQ_uxn_opcodes_h_l567_c11_fc7c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_fc7c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_fc7c_return_output := BIN_OP_EQ_uxn_opcodes_h_l567_c11_fc7c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l567_l581_l570_l561_DUPLICATE_df49 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l567_l581_l570_l561_DUPLICATE_df49_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l581_c11_2172] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l581_c11_2172_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_2172_left;
     BIN_OP_EQ_uxn_opcodes_h_l581_c11_2172_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_2172_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_2172_return_output := BIN_OP_EQ_uxn_opcodes_h_l581_c11_2172_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l574_c32_89a8_left := VAR_BIN_OP_AND_uxn_opcodes_h_l574_c32_bb9e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_1289_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_af81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_156c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_af81_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_156c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_af81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_156c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_af81_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_156c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_af81_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l561_c2_156c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_af81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_156c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_af81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_156c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_af81_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l561_c2_156c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_af81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_1688_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_fc7c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_1688_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_fc7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_1688_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_fc7c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_1688_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_fc7c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l567_c7_1688_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_fc7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_1688_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_fc7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_1688_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_fc7c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l567_c7_1688_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_fc7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_fa55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c11_4d28_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_fa55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c11_4d28_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_fa55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c11_4d28_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_fa55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c11_4d28_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l570_c7_fa55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c11_4d28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_fa55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c11_4d28_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l570_c7_fa55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c11_4d28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_098b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c489_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_098b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c489_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_098b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c489_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l576_c7_098b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c489_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d837_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_2172_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_d837_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_2172_return_output;
     VAR_result_pc_uxn_opcodes_h_l579_c3_7f81 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l579_c15_ce34_return_output)),16);
     VAR_t8_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue := VAR_CAST_TO_int8_t_uxn_opcodes_h_l571_c8_569a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_156c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l567_l570_l561_DUPLICATE_e6ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_1688_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l567_l570_l561_DUPLICATE_e6ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l567_l570_l561_DUPLICATE_e6ba_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l561_c2_156c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l567_l570_l561_l576_DUPLICATE_26fc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l567_c7_1688_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l567_l570_l561_l576_DUPLICATE_26fc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l567_l570_l561_l576_DUPLICATE_26fc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l576_c7_098b_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l567_l570_l561_l576_DUPLICATE_26fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_1688_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l567_l581_l570_l576_DUPLICATE_7411_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l567_l581_l570_l576_DUPLICATE_7411_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_098b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l567_l581_l570_l576_DUPLICATE_7411_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d837_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l567_l581_l570_l576_DUPLICATE_7411_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_156c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l567_l581_l570_l561_DUPLICATE_df49_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_1688_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l567_l581_l570_l561_DUPLICATE_df49_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l567_l581_l570_l561_DUPLICATE_df49_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_d837_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l567_l581_l570_l561_DUPLICATE_df49_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_156c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l567_l561_l576_DUPLICATE_f8b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_1688_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l567_l561_l576_DUPLICATE_f8b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_098b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l567_l561_l576_DUPLICATE_f8b4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_1688_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l567_l570_DUPLICATE_dba5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l567_l570_DUPLICATE_dba5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_1688_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l567_c7_1688_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l576_c7_098b_iftrue := VAR_result_pc_uxn_opcodes_h_l579_c3_7f81;
     -- result_pc_MUX[uxn_opcodes_h_l576_c7_098b] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l576_c7_098b_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l576_c7_098b_cond;
     result_pc_MUX_uxn_opcodes_h_l576_c7_098b_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l576_c7_098b_iftrue;
     result_pc_MUX_uxn_opcodes_h_l576_c7_098b_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l576_c7_098b_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l576_c7_098b_return_output := result_pc_MUX_uxn_opcodes_h_l576_c7_098b_return_output;

     -- t8_MUX[uxn_opcodes_h_l570_c7_fa55] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l570_c7_fa55_cond <= VAR_t8_MUX_uxn_opcodes_h_l570_c7_fa55_cond;
     t8_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue;
     t8_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l570_c7_fa55_return_output := t8_MUX_uxn_opcodes_h_l570_c7_fa55_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l576_c7_098b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_098b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_098b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_098b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_098b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_098b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_098b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_098b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_098b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l570_c7_fa55] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_fa55_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_fa55_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_fa55_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_fa55_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l567_c7_1688] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_1688_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_1688_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_1688_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_1688_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_1688_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_1688_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_1688_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_1688_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l581_c7_d837] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d837_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d837_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d837_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d837_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d837_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d837_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d837_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d837_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l561_c1_1289] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_1289_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_1289_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_1289_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_1289_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_1289_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_1289_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_1289_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_1289_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l581_c7_d837] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_d837_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_d837_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_d837_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_d837_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_d837_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_d837_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_d837_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_d837_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l574_c32_89a8] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l574_c32_89a8_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l574_c32_89a8_left;
     BIN_OP_GT_uxn_opcodes_h_l574_c32_89a8_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l574_c32_89a8_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l574_c32_89a8_return_output := BIN_OP_GT_uxn_opcodes_h_l574_c32_89a8_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l574_c32_da1f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l574_c32_89a8_return_output;
     VAR_printf_uxn_opcodes_h_l562_c3_ff0c_uxn_opcodes_h_l562_c3_ff0c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_1289_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_098b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d837_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_098b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l581_c7_d837_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l576_c7_098b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_1688_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l570_c7_fa55_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l576_c7_098b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_156c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c7_1688_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l567_c7_1688_iffalse := VAR_t8_MUX_uxn_opcodes_h_l570_c7_fa55_return_output;
     -- printf_uxn_opcodes_h_l562_c3_ff0c[uxn_opcodes_h_l562_c3_ff0c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l562_c3_ff0c_uxn_opcodes_h_l562_c3_ff0c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l562_c3_ff0c_uxn_opcodes_h_l562_c3_ff0c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l567_c7_1688] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l567_c7_1688_cond <= VAR_t8_MUX_uxn_opcodes_h_l567_c7_1688_cond;
     t8_MUX_uxn_opcodes_h_l567_c7_1688_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l567_c7_1688_iftrue;
     t8_MUX_uxn_opcodes_h_l567_c7_1688_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l567_c7_1688_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l567_c7_1688_return_output := t8_MUX_uxn_opcodes_h_l567_c7_1688_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l570_c7_fa55] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_fa55_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_fa55_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_fa55_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_fa55_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l576_c7_098b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_098b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_098b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_098b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_098b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_098b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_098b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_098b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_098b_return_output;

     -- MUX[uxn_opcodes_h_l574_c32_da1f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l574_c32_da1f_cond <= VAR_MUX_uxn_opcodes_h_l574_c32_da1f_cond;
     MUX_uxn_opcodes_h_l574_c32_da1f_iftrue <= VAR_MUX_uxn_opcodes_h_l574_c32_da1f_iftrue;
     MUX_uxn_opcodes_h_l574_c32_da1f_iffalse <= VAR_MUX_uxn_opcodes_h_l574_c32_da1f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l574_c32_da1f_return_output := MUX_uxn_opcodes_h_l574_c32_da1f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l561_c2_156c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_156c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_156c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_156c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_156c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_156c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_156c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_156c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_156c_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l570_c7_fa55] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l570_c7_fa55_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l570_c7_fa55_cond;
     result_pc_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue;
     result_pc_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l570_c7_fa55_return_output := result_pc_MUX_uxn_opcodes_h_l570_c7_fa55_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l567_c7_1688] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_1688_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_1688_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_1688_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_1688_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_1688_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_1688_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_1688_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_1688_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l576_c7_098b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_098b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_098b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_098b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_098b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_098b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_098b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_098b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_098b_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue := VAR_MUX_uxn_opcodes_h_l574_c32_da1f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_098b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l576_c7_098b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_1688_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c7_fa55_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_156c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_1688_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l567_c7_1688_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l570_c7_fa55_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l561_c2_156c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l567_c7_1688_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l567_c7_1688] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_1688_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_1688_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_1688_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_1688_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_1688_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_1688_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_1688_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_1688_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l567_c7_1688] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l567_c7_1688_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l567_c7_1688_cond;
     result_pc_MUX_uxn_opcodes_h_l567_c7_1688_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l567_c7_1688_iftrue;
     result_pc_MUX_uxn_opcodes_h_l567_c7_1688_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l567_c7_1688_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l567_c7_1688_return_output := result_pc_MUX_uxn_opcodes_h_l567_c7_1688_return_output;

     -- t8_MUX[uxn_opcodes_h_l561_c2_156c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l561_c2_156c_cond <= VAR_t8_MUX_uxn_opcodes_h_l561_c2_156c_cond;
     t8_MUX_uxn_opcodes_h_l561_c2_156c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l561_c2_156c_iftrue;
     t8_MUX_uxn_opcodes_h_l561_c2_156c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l561_c2_156c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l561_c2_156c_return_output := t8_MUX_uxn_opcodes_h_l561_c2_156c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l570_c7_fa55] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_fa55_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_fa55_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_fa55_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_fa55_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l561_c2_156c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_156c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_156c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_156c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_156c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_156c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_156c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_156c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_156c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l570_c7_fa55] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_fa55_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_fa55_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_fa55_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_fa55_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l570_c7_fa55] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_fa55_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_fa55_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_fa55_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_fa55_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_fa55_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_fa55_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_1688_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c7_fa55_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_1688_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l570_c7_fa55_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_156c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_1688_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l561_c2_156c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l567_c7_1688_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_1688_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c7_fa55_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l561_c2_156c_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l561_c2_156c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l561_c2_156c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l561_c2_156c_cond;
     result_pc_MUX_uxn_opcodes_h_l561_c2_156c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l561_c2_156c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l561_c2_156c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l561_c2_156c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l561_c2_156c_return_output := result_pc_MUX_uxn_opcodes_h_l561_c2_156c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l567_c7_1688] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_1688_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_1688_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_1688_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_1688_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_1688_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_1688_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_1688_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_1688_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l567_c7_1688] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_1688_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_1688_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_1688_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_1688_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_1688_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_1688_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_1688_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_1688_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l567_c7_1688] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_1688_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_1688_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_1688_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_1688_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_1688_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_1688_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_1688_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_1688_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l561_c2_156c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_156c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_156c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_156c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_156c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_156c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_156c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_156c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_156c_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_156c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_1688_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_156c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l567_c7_1688_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_156c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_1688_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l561_c2_156c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_156c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_156c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_156c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_156c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_156c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_156c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_156c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_156c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l561_c2_156c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_156c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_156c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_156c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_156c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_156c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_156c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_156c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_156c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l561_c2_156c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_156c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_156c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_156c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_156c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_156c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_156c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_156c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_156c_return_output;

     -- Submodule level 6
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a4db_uxn_opcodes_h_l586_l557_DUPLICATE_a7b2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a4db_uxn_opcodes_h_l586_l557_DUPLICATE_a7b2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a4db(
     result,
     VAR_result_pc_MUX_uxn_opcodes_h_l561_c2_156c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c2_156c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c2_156c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c2_156c_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l561_c2_156c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c2_156c_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c2_156c_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a4db_uxn_opcodes_h_l586_l557_DUPLICATE_a7b2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a4db_uxn_opcodes_h_l586_l557_DUPLICATE_a7b2_return_output;
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
