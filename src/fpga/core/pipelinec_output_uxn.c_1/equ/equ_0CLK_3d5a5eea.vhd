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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 58
entity equ_0CLK_3d5a5eea is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ_0CLK_3d5a5eea;
architecture arch of equ_0CLK_3d5a5eea is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1253_c6_e7a7]
signal BIN_OP_EQ_uxn_opcodes_h_l1253_c6_e7a7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1253_c6_e7a7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1253_c6_e7a7_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1253_c2_5dc3]
signal n8_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1253_c2_5dc3]
signal t8_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1253_c2_5dc3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1253_c2_5dc3]
signal result_stack_value_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1253_c2_5dc3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1253_c2_5dc3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1253_c2_5dc3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1253_c2_5dc3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1258_c11_3ed0]
signal BIN_OP_EQ_uxn_opcodes_h_l1258_c11_3ed0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1258_c11_3ed0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1258_c11_3ed0_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1258_c7_ee59]
signal n8_MUX_uxn_opcodes_h_l1258_c7_ee59_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1258_c7_ee59]
signal t8_MUX_uxn_opcodes_h_l1258_c7_ee59_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1258_c7_ee59]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1258_c7_ee59]
signal result_stack_value_MUX_uxn_opcodes_h_l1258_c7_ee59_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1258_c7_ee59]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_ee59_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1258_c7_ee59]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1258_c7_ee59]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_ee59_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1258_c7_ee59]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_ee59_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1261_c11_a710]
signal BIN_OP_EQ_uxn_opcodes_h_l1261_c11_a710_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1261_c11_a710_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1261_c11_a710_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1261_c7_4b68]
signal n8_MUX_uxn_opcodes_h_l1261_c7_4b68_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1261_c7_4b68]
signal t8_MUX_uxn_opcodes_h_l1261_c7_4b68_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1261_c7_4b68]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1261_c7_4b68]
signal result_stack_value_MUX_uxn_opcodes_h_l1261_c7_4b68_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1261_c7_4b68]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_4b68_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1261_c7_4b68]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1261_c7_4b68]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_4b68_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1261_c7_4b68]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_4b68_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1265_c11_db57]
signal BIN_OP_EQ_uxn_opcodes_h_l1265_c11_db57_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1265_c11_db57_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1265_c11_db57_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1265_c7_f605]
signal n8_MUX_uxn_opcodes_h_l1265_c7_f605_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1265_c7_f605_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1265_c7_f605]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_f605_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_f605_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1265_c7_f605]
signal result_stack_value_MUX_uxn_opcodes_h_l1265_c7_f605_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1265_c7_f605_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1265_c7_f605]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_f605_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_f605_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1265_c7_f605]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_f605_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_f605_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1265_c7_f605]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_f605_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_f605_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1265_c7_f605]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_f605_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_f605_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1268_c11_7ede]
signal BIN_OP_EQ_uxn_opcodes_h_l1268_c11_7ede_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1268_c11_7ede_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1268_c11_7ede_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1268_c7_fefd]
signal n8_MUX_uxn_opcodes_h_l1268_c7_fefd_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1268_c7_fefd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1268_c7_fefd]
signal result_stack_value_MUX_uxn_opcodes_h_l1268_c7_fefd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1268_c7_fefd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_fefd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1268_c7_fefd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1268_c7_fefd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_fefd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1268_c7_fefd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_fefd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1271_c32_a1ec]
signal BIN_OP_AND_uxn_opcodes_h_l1271_c32_a1ec_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1271_c32_a1ec_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1271_c32_a1ec_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1271_c32_780b]
signal BIN_OP_GT_uxn_opcodes_h_l1271_c32_780b_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1271_c32_780b_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1271_c32_780b_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1271_c32_5441]
signal MUX_uxn_opcodes_h_l1271_c32_5441_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1271_c32_5441_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1271_c32_5441_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1271_c32_5441_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1273_c11_2a9b]
signal BIN_OP_EQ_uxn_opcodes_h_l1273_c11_2a9b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1273_c11_2a9b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1273_c11_2a9b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1273_c7_4e76]
signal result_stack_value_MUX_uxn_opcodes_h_l1273_c7_4e76_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1273_c7_4e76_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1273_c7_4e76_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1273_c7_4e76]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_4e76_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_4e76_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_4e76_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1273_c7_4e76]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_4e76_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_4e76_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_4e76_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1273_c7_4e76]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_4e76_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_4e76_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_4e76_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1273_c7_4e76]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_4e76_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_4e76_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_4e76_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1277_c24_2be2]
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c24_2be2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c24_2be2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c24_2be2_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1277_c24_0e7a]
signal MUX_uxn_opcodes_h_l1277_c24_0e7a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1277_c24_0e7a_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1277_c24_0e7a_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1277_c24_0e7a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1279_c11_7857]
signal BIN_OP_EQ_uxn_opcodes_h_l1279_c11_7857_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1279_c11_7857_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1279_c11_7857_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1279_c7_0d2f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_0d2f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_0d2f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_0d2f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_0d2f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1279_c7_0d2f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_0d2f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_0d2f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_0d2f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_0d2f_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1253_c6_e7a7
BIN_OP_EQ_uxn_opcodes_h_l1253_c6_e7a7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1253_c6_e7a7_left,
BIN_OP_EQ_uxn_opcodes_h_l1253_c6_e7a7_right,
BIN_OP_EQ_uxn_opcodes_h_l1253_c6_e7a7_return_output);

-- n8_MUX_uxn_opcodes_h_l1253_c2_5dc3
n8_MUX_uxn_opcodes_h_l1253_c2_5dc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond,
n8_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue,
n8_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse,
n8_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output);

-- t8_MUX_uxn_opcodes_h_l1253_c2_5dc3
t8_MUX_uxn_opcodes_h_l1253_c2_5dc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond,
t8_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue,
t8_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse,
t8_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1253_c2_5dc3
result_stack_value_MUX_uxn_opcodes_h_l1253_c2_5dc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond,
result_stack_value_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_5dc3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_5dc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3
result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_5dc3
result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_5dc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_5dc3
result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_5dc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1258_c11_3ed0
BIN_OP_EQ_uxn_opcodes_h_l1258_c11_3ed0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1258_c11_3ed0_left,
BIN_OP_EQ_uxn_opcodes_h_l1258_c11_3ed0_right,
BIN_OP_EQ_uxn_opcodes_h_l1258_c11_3ed0_return_output);

-- n8_MUX_uxn_opcodes_h_l1258_c7_ee59
n8_MUX_uxn_opcodes_h_l1258_c7_ee59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1258_c7_ee59_cond,
n8_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue,
n8_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse,
n8_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output);

-- t8_MUX_uxn_opcodes_h_l1258_c7_ee59
t8_MUX_uxn_opcodes_h_l1258_c7_ee59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1258_c7_ee59_cond,
t8_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue,
t8_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse,
t8_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_ee59
result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_ee59 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1258_c7_ee59
result_stack_value_MUX_uxn_opcodes_h_l1258_c7_ee59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1258_c7_ee59_cond,
result_stack_value_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_ee59
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_ee59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_ee59_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_ee59
result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_ee59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_ee59
result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_ee59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_ee59_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_ee59
result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_ee59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_ee59_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1261_c11_a710
BIN_OP_EQ_uxn_opcodes_h_l1261_c11_a710 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1261_c11_a710_left,
BIN_OP_EQ_uxn_opcodes_h_l1261_c11_a710_right,
BIN_OP_EQ_uxn_opcodes_h_l1261_c11_a710_return_output);

-- n8_MUX_uxn_opcodes_h_l1261_c7_4b68
n8_MUX_uxn_opcodes_h_l1261_c7_4b68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1261_c7_4b68_cond,
n8_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue,
n8_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse,
n8_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output);

-- t8_MUX_uxn_opcodes_h_l1261_c7_4b68
t8_MUX_uxn_opcodes_h_l1261_c7_4b68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1261_c7_4b68_cond,
t8_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue,
t8_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse,
t8_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_4b68
result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_4b68 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1261_c7_4b68
result_stack_value_MUX_uxn_opcodes_h_l1261_c7_4b68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1261_c7_4b68_cond,
result_stack_value_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_4b68
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_4b68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_4b68_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_4b68
result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_4b68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_4b68
result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_4b68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_4b68_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_4b68
result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_4b68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_4b68_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1265_c11_db57
BIN_OP_EQ_uxn_opcodes_h_l1265_c11_db57 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1265_c11_db57_left,
BIN_OP_EQ_uxn_opcodes_h_l1265_c11_db57_right,
BIN_OP_EQ_uxn_opcodes_h_l1265_c11_db57_return_output);

-- n8_MUX_uxn_opcodes_h_l1265_c7_f605
n8_MUX_uxn_opcodes_h_l1265_c7_f605 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1265_c7_f605_cond,
n8_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue,
n8_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse,
n8_MUX_uxn_opcodes_h_l1265_c7_f605_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_f605
result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_f605 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_f605_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_f605_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1265_c7_f605
result_stack_value_MUX_uxn_opcodes_h_l1265_c7_f605 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1265_c7_f605_cond,
result_stack_value_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1265_c7_f605_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_f605
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_f605 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_f605_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_f605_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_f605
result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_f605 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_f605_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_f605_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_f605
result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_f605 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_f605_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_f605_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_f605
result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_f605 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_f605_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_f605_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1268_c11_7ede
BIN_OP_EQ_uxn_opcodes_h_l1268_c11_7ede : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1268_c11_7ede_left,
BIN_OP_EQ_uxn_opcodes_h_l1268_c11_7ede_right,
BIN_OP_EQ_uxn_opcodes_h_l1268_c11_7ede_return_output);

-- n8_MUX_uxn_opcodes_h_l1268_c7_fefd
n8_MUX_uxn_opcodes_h_l1268_c7_fefd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1268_c7_fefd_cond,
n8_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue,
n8_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse,
n8_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_fefd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_fefd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1268_c7_fefd
result_stack_value_MUX_uxn_opcodes_h_l1268_c7_fefd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1268_c7_fefd_cond,
result_stack_value_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_fefd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_fefd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_fefd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_fefd
result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_fefd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_fefd
result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_fefd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_fefd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_fefd
result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_fefd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_fefd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1271_c32_a1ec
BIN_OP_AND_uxn_opcodes_h_l1271_c32_a1ec : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1271_c32_a1ec_left,
BIN_OP_AND_uxn_opcodes_h_l1271_c32_a1ec_right,
BIN_OP_AND_uxn_opcodes_h_l1271_c32_a1ec_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1271_c32_780b
BIN_OP_GT_uxn_opcodes_h_l1271_c32_780b : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1271_c32_780b_left,
BIN_OP_GT_uxn_opcodes_h_l1271_c32_780b_right,
BIN_OP_GT_uxn_opcodes_h_l1271_c32_780b_return_output);

-- MUX_uxn_opcodes_h_l1271_c32_5441
MUX_uxn_opcodes_h_l1271_c32_5441 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1271_c32_5441_cond,
MUX_uxn_opcodes_h_l1271_c32_5441_iftrue,
MUX_uxn_opcodes_h_l1271_c32_5441_iffalse,
MUX_uxn_opcodes_h_l1271_c32_5441_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1273_c11_2a9b
BIN_OP_EQ_uxn_opcodes_h_l1273_c11_2a9b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1273_c11_2a9b_left,
BIN_OP_EQ_uxn_opcodes_h_l1273_c11_2a9b_right,
BIN_OP_EQ_uxn_opcodes_h_l1273_c11_2a9b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1273_c7_4e76
result_stack_value_MUX_uxn_opcodes_h_l1273_c7_4e76 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1273_c7_4e76_cond,
result_stack_value_MUX_uxn_opcodes_h_l1273_c7_4e76_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1273_c7_4e76_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_4e76
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_4e76 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_4e76_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_4e76_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_4e76_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_4e76
result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_4e76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_4e76_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_4e76_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_4e76_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_4e76
result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_4e76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_4e76_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_4e76_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_4e76_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_4e76
result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_4e76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_4e76_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_4e76_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_4e76_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1277_c24_2be2
BIN_OP_EQ_uxn_opcodes_h_l1277_c24_2be2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1277_c24_2be2_left,
BIN_OP_EQ_uxn_opcodes_h_l1277_c24_2be2_right,
BIN_OP_EQ_uxn_opcodes_h_l1277_c24_2be2_return_output);

-- MUX_uxn_opcodes_h_l1277_c24_0e7a
MUX_uxn_opcodes_h_l1277_c24_0e7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1277_c24_0e7a_cond,
MUX_uxn_opcodes_h_l1277_c24_0e7a_iftrue,
MUX_uxn_opcodes_h_l1277_c24_0e7a_iffalse,
MUX_uxn_opcodes_h_l1277_c24_0e7a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1279_c11_7857
BIN_OP_EQ_uxn_opcodes_h_l1279_c11_7857 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1279_c11_7857_left,
BIN_OP_EQ_uxn_opcodes_h_l1279_c11_7857_right,
BIN_OP_EQ_uxn_opcodes_h_l1279_c11_7857_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_0d2f
result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_0d2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_0d2f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_0d2f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_0d2f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_0d2f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_0d2f
result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_0d2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_0d2f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_0d2f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_0d2f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_0d2f_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1253_c6_e7a7_return_output,
 n8_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output,
 t8_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1258_c11_3ed0_return_output,
 n8_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output,
 t8_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1261_c11_a710_return_output,
 n8_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output,
 t8_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1265_c11_db57_return_output,
 n8_MUX_uxn_opcodes_h_l1265_c7_f605_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_f605_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1265_c7_f605_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_f605_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_f605_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_f605_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_f605_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1268_c11_7ede_return_output,
 n8_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1271_c32_a1ec_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1271_c32_780b_return_output,
 MUX_uxn_opcodes_h_l1271_c32_5441_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1273_c11_2a9b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1277_c24_2be2_return_output,
 MUX_uxn_opcodes_h_l1277_c24_0e7a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1279_c11_7857_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_0d2f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_0d2f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c6_e7a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c6_e7a7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c6_e7a7_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1255_c3_2e8d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_3ed0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_3ed0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_3ed0_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1258_c7_ee59_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1258_c7_ee59_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_ee59_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1259_c3_e186 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_ee59_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_ee59_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_ee59_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_a710_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_a710_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_a710_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1265_c7_f605_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1261_c7_4b68_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1261_c7_4b68_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_f605_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_f605_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_4b68_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1263_c3_f023 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_f605_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_4b68_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_f605_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_f605_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_4b68_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_f605_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_4b68_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_db57_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_db57_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_db57_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1265_c7_f605_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_f605_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_f605_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1266_c3_1516 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_f605_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_f605_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_f605_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_f605_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_7ede_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_7ede_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_7ede_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1268_c7_fefd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_fefd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_fefd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_fefd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_fefd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1271_c32_5441_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1271_c32_5441_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1271_c32_5441_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1271_c32_a1ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1271_c32_a1ec_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1271_c32_a1ec_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1271_c32_780b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1271_c32_780b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1271_c32_780b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1271_c32_5441_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_2a9b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_2a9b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_2a9b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1273_c7_4e76_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1273_c7_4e76_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1273_c7_4e76_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_4e76_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1276_c3_e982 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_4e76_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_4e76_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_4e76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_4e76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_4e76_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_4e76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_4e76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_0d2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_4e76_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_4e76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_4e76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_0d2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_4e76_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1277_c24_0e7a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1277_c24_0e7a_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1277_c24_0e7a_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c24_2be2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c24_2be2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c24_2be2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1277_c24_0e7a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1279_c11_7857_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1279_c11_7857_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1279_c11_7857_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_0d2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_0d2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_0d2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_0d2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_0d2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_0d2f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1253_DUPLICATE_5de8_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1253_l1273_DUPLICATE_ca41_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1265_l1261_l1258_l1253_l1273_DUPLICATE_9b5e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1253_l1279_DUPLICATE_5dc0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1279_l1273_DUPLICATE_5e54_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1268_l1273_DUPLICATE_1846_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1249_l1284_DUPLICATE_1d98_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_7ede_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_3ed0_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c6_e7a7_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1263_c3_f023 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1263_c3_f023;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1271_c32_780b_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1276_c3_e982 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_4e76_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1276_c3_e982;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_a710_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_0d2f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1271_c32_a1ec_right := to_unsigned(128, 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_4e76_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1271_c32_5441_iffalse := resize(to_signed(-1, 2), 8);
     VAR_MUX_uxn_opcodes_h_l1271_c32_5441_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_0d2f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_db57_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1255_c3_2e8d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1255_c3_2e8d;
     VAR_MUX_uxn_opcodes_h_l1277_c24_0e7a_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_2a9b_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1266_c3_1516 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1266_c3_1516;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_4e76_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1279_c11_7857_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1259_c3_e186 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1259_c3_e186;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1277_c24_0e7a_iffalse := resize(to_unsigned(0, 1), 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_opcodes_h_l1271_c32_a1ec_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c24_2be2_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c6_e7a7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_3ed0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_a710_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_db57_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_7ede_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_2a9b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1279_c11_7857_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c24_2be2_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse := t8;
     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1253_DUPLICATE_5de8 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1253_DUPLICATE_5de8_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1261_c11_a710] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1261_c11_a710_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_a710_left;
     BIN_OP_EQ_uxn_opcodes_h_l1261_c11_a710_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_a710_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_a710_return_output := BIN_OP_EQ_uxn_opcodes_h_l1261_c11_a710_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1268_c11_7ede] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1268_c11_7ede_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_7ede_left;
     BIN_OP_EQ_uxn_opcodes_h_l1268_c11_7ede_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_7ede_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_7ede_return_output := BIN_OP_EQ_uxn_opcodes_h_l1268_c11_7ede_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1253_c6_e7a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1253_c6_e7a7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c6_e7a7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1253_c6_e7a7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c6_e7a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c6_e7a7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1253_c6_e7a7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1277_c24_2be2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1277_c24_2be2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c24_2be2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1277_c24_2be2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c24_2be2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c24_2be2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1277_c24_2be2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1279_l1273_DUPLICATE_5e54 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1279_l1273_DUPLICATE_5e54_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1265_c11_db57] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1265_c11_db57_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_db57_left;
     BIN_OP_EQ_uxn_opcodes_h_l1265_c11_db57_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_db57_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_db57_return_output := BIN_OP_EQ_uxn_opcodes_h_l1265_c11_db57_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1253_l1279_DUPLICATE_5dc0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1253_l1279_DUPLICATE_5dc0_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1279_c11_7857] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1279_c11_7857_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1279_c11_7857_left;
     BIN_OP_EQ_uxn_opcodes_h_l1279_c11_7857_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1279_c11_7857_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1279_c11_7857_return_output := BIN_OP_EQ_uxn_opcodes_h_l1279_c11_7857_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1253_l1273_DUPLICATE_ca41 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1253_l1273_DUPLICATE_ca41_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1258_c11_3ed0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1258_c11_3ed0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_3ed0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1258_c11_3ed0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_3ed0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_3ed0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1258_c11_3ed0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1273_c11_2a9b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1273_c11_2a9b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_2a9b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1273_c11_2a9b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_2a9b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_2a9b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1273_c11_2a9b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1265_l1261_l1258_l1253_l1273_DUPLICATE_9b5e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1265_l1261_l1258_l1253_l1273_DUPLICATE_9b5e_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l1271_c32_a1ec] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1271_c32_a1ec_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1271_c32_a1ec_left;
     BIN_OP_AND_uxn_opcodes_h_l1271_c32_a1ec_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1271_c32_a1ec_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1271_c32_a1ec_return_output := BIN_OP_AND_uxn_opcodes_h_l1271_c32_a1ec_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1268_l1273_DUPLICATE_1846 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1268_l1273_DUPLICATE_1846_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1271_c32_780b_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1271_c32_a1ec_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c6_e7a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c6_e7a7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c6_e7a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c6_e7a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c6_e7a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c6_e7a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c6_e7a7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c6_e7a7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1258_c7_ee59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_3ed0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_ee59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_3ed0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_3ed0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_ee59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_3ed0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_3ed0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_ee59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_3ed0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_ee59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_3ed0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1258_c7_ee59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_3ed0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1261_c7_4b68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_a710_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_4b68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_a710_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_a710_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_4b68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_a710_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_a710_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_4b68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_a710_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_4b68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_a710_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1261_c7_4b68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_a710_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1265_c7_f605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_db57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_f605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_db57_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_f605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_db57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_f605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_db57_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_f605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_db57_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_f605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_db57_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_f605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_db57_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1268_c7_fefd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_7ede_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_fefd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_7ede_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_7ede_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_fefd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_7ede_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_7ede_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_fefd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_7ede_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_fefd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_7ede_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_4e76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_2a9b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_4e76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_2a9b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_4e76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_2a9b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_4e76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_2a9b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1273_c7_4e76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_2a9b_return_output;
     VAR_MUX_uxn_opcodes_h_l1277_c24_0e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c24_2be2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_0d2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1279_c11_7857_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_0d2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1279_c11_7857_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1253_DUPLICATE_5de8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1253_DUPLICATE_5de8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1253_DUPLICATE_5de8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1253_DUPLICATE_5de8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1253_DUPLICATE_5de8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1279_l1273_DUPLICATE_5e54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1279_l1273_DUPLICATE_5e54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1279_l1273_DUPLICATE_5e54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1279_l1273_DUPLICATE_5e54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_4e76_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1279_l1273_DUPLICATE_5e54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_0d2f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1279_l1273_DUPLICATE_5e54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1265_l1261_l1258_l1253_l1273_DUPLICATE_9b5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1265_l1261_l1258_l1253_l1273_DUPLICATE_9b5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1265_l1261_l1258_l1253_l1273_DUPLICATE_9b5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1265_l1261_l1258_l1253_l1273_DUPLICATE_9b5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_4e76_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1265_l1261_l1258_l1253_l1273_DUPLICATE_9b5e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1253_l1279_DUPLICATE_5dc0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1253_l1279_DUPLICATE_5dc0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1253_l1279_DUPLICATE_5dc0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1253_l1279_DUPLICATE_5dc0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1253_l1279_DUPLICATE_5dc0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_0d2f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1253_l1279_DUPLICATE_5dc0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1268_l1273_DUPLICATE_1846_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_4e76_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1268_l1273_DUPLICATE_1846_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1253_l1273_DUPLICATE_ca41_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1253_l1273_DUPLICATE_ca41_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1253_l1273_DUPLICATE_ca41_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1253_l1273_DUPLICATE_ca41_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1253_l1273_DUPLICATE_ca41_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1273_c7_4e76_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1268_l1265_l1261_l1258_l1253_l1273_DUPLICATE_ca41_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l1271_c32_780b] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1271_c32_780b_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1271_c32_780b_left;
     BIN_OP_GT_uxn_opcodes_h_l1271_c32_780b_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1271_c32_780b_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1271_c32_780b_return_output := BIN_OP_GT_uxn_opcodes_h_l1271_c32_780b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1279_c7_0d2f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_0d2f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_0d2f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_0d2f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_0d2f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_0d2f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_0d2f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_0d2f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_0d2f_return_output;

     -- MUX[uxn_opcodes_h_l1277_c24_0e7a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1277_c24_0e7a_cond <= VAR_MUX_uxn_opcodes_h_l1277_c24_0e7a_cond;
     MUX_uxn_opcodes_h_l1277_c24_0e7a_iftrue <= VAR_MUX_uxn_opcodes_h_l1277_c24_0e7a_iftrue;
     MUX_uxn_opcodes_h_l1277_c24_0e7a_iffalse <= VAR_MUX_uxn_opcodes_h_l1277_c24_0e7a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1277_c24_0e7a_return_output := MUX_uxn_opcodes_h_l1277_c24_0e7a_return_output;

     -- t8_MUX[uxn_opcodes_h_l1261_c7_4b68] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1261_c7_4b68_cond <= VAR_t8_MUX_uxn_opcodes_h_l1261_c7_4b68_cond;
     t8_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue;
     t8_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output := t8_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1273_c7_4e76] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_4e76_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_4e76_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_4e76_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_4e76_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_4e76_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_4e76_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output;

     -- n8_MUX[uxn_opcodes_h_l1268_c7_fefd] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1268_c7_fefd_cond <= VAR_n8_MUX_uxn_opcodes_h_l1268_c7_fefd_cond;
     n8_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue;
     n8_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output := n8_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1273_c7_4e76] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_4e76_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_4e76_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_4e76_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_4e76_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_4e76_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_4e76_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1279_c7_0d2f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_0d2f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_0d2f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_0d2f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_0d2f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_0d2f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_0d2f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_0d2f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_0d2f_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1271_c32_5441_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1271_c32_780b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1273_c7_4e76_iftrue := VAR_MUX_uxn_opcodes_h_l1277_c24_0e7a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_4e76_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1279_c7_0d2f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_4e76_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1279_c7_0d2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output;
     -- MUX[uxn_opcodes_h_l1271_c32_5441] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1271_c32_5441_cond <= VAR_MUX_uxn_opcodes_h_l1271_c32_5441_cond;
     MUX_uxn_opcodes_h_l1271_c32_5441_iftrue <= VAR_MUX_uxn_opcodes_h_l1271_c32_5441_iftrue;
     MUX_uxn_opcodes_h_l1271_c32_5441_iffalse <= VAR_MUX_uxn_opcodes_h_l1271_c32_5441_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1271_c32_5441_return_output := MUX_uxn_opcodes_h_l1271_c32_5441_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1273_c7_4e76] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_4e76_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_4e76_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_4e76_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_4e76_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_4e76_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_4e76_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1273_c7_4e76] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_4e76_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_4e76_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_4e76_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_4e76_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_4e76_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_4e76_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1268_c7_fefd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_fefd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_fefd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output;

     -- t8_MUX[uxn_opcodes_h_l1258_c7_ee59] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1258_c7_ee59_cond <= VAR_t8_MUX_uxn_opcodes_h_l1258_c7_ee59_cond;
     t8_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue;
     t8_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output := t8_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1273_c7_4e76] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1273_c7_4e76_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1273_c7_4e76_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1273_c7_4e76_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1273_c7_4e76_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1273_c7_4e76_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1273_c7_4e76_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output := result_stack_value_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output;

     -- n8_MUX[uxn_opcodes_h_l1265_c7_f605] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1265_c7_f605_cond <= VAR_n8_MUX_uxn_opcodes_h_l1265_c7_f605_cond;
     n8_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue;
     n8_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1265_c7_f605_return_output := n8_MUX_uxn_opcodes_h_l1265_c7_f605_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1268_c7_fefd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue := VAR_MUX_uxn_opcodes_h_l1271_c32_5441_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1265_c7_f605_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1273_c7_4e76_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1268_c7_fefd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1268_c7_fefd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_fefd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output := result_stack_value_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1268_c7_fefd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1268_c7_fefd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_fefd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_fefd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1265_c7_f605] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_f605_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_f605_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_f605_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_f605_return_output;

     -- t8_MUX[uxn_opcodes_h_l1253_c2_5dc3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond <= VAR_t8_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond;
     t8_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue;
     t8_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output := t8_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1268_c7_fefd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_fefd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_fefd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_fefd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_fefd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1265_c7_f605] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_f605_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_f605_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_f605_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_f605_return_output;

     -- n8_MUX[uxn_opcodes_h_l1261_c7_4b68] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1261_c7_4b68_cond <= VAR_n8_MUX_uxn_opcodes_h_l1261_c7_4b68_cond;
     n8_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue;
     n8_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output := n8_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_f605_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_f605_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_fefd_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1265_c7_f605] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_f605_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_f605_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_f605_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_f605_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1261_c7_4b68] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_4b68_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_4b68_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1265_c7_f605] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_f605_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_f605_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_f605_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_f605_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1265_c7_f605] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1265_c7_f605_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_f605_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_f605_return_output := result_stack_value_MUX_uxn_opcodes_h_l1265_c7_f605_return_output;

     -- n8_MUX[uxn_opcodes_h_l1258_c7_ee59] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1258_c7_ee59_cond <= VAR_n8_MUX_uxn_opcodes_h_l1258_c7_ee59_cond;
     n8_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue;
     n8_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output := n8_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1265_c7_f605] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_f605_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_f605_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_f605_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_f605_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_f605_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_f605_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1261_c7_4b68] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_f605_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_f605_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_f605_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_f605_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1261_c7_4b68] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1261_c7_4b68_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_4b68_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output := result_stack_value_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output;

     -- n8_MUX[uxn_opcodes_h_l1253_c2_5dc3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond <= VAR_n8_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond;
     n8_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue;
     n8_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output := n8_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1258_c7_ee59] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1261_c7_4b68] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1258_c7_ee59] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_ee59_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_ee59_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1261_c7_4b68] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_4b68_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_4b68_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1261_c7_4b68] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_4b68_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_4b68_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_4b68_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_4b68_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_4b68_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1258_c7_ee59] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1258_c7_ee59] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_ee59_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_ee59_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1258_c7_ee59] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_ee59_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_ee59_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1253_c2_5dc3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1253_c2_5dc3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1258_c7_ee59] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1258_c7_ee59_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_ee59_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_ee59_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_ee59_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output := result_stack_value_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_ee59_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1253_c2_5dc3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output := result_stack_value_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1253_c2_5dc3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1253_c2_5dc3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1253_c2_5dc3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_5dc3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_5dc3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_5dc3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1249_l1284_DUPLICATE_1d98 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1249_l1284_DUPLICATE_1d98_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c2_5dc3_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1249_l1284_DUPLICATE_1d98_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1249_l1284_DUPLICATE_1d98_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
