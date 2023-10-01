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
-- Submodules: 95
entity sth2_0CLK_9c3c4e32 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sth2_0CLK_9c3c4e32;
architecture arch of sth2_0CLK_9c3c4e32 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1556_c6_072c]
signal BIN_OP_EQ_uxn_opcodes_h_l1556_c6_072c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1556_c6_072c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1556_c6_072c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1556_c1_2837]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_2837_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_2837_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_2837_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_2837_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1556_c2_6eba]
signal t16_MUX_uxn_opcodes_h_l1556_c2_6eba_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1556_c2_6eba]
signal result_stack_value_MUX_uxn_opcodes_h_l1556_c2_6eba_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1556_c2_6eba]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_6eba_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1556_c2_6eba]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_6eba_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1556_c2_6eba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_6eba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1556_c2_6eba]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1556_c2_6eba]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_6eba_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1556_c2_6eba]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_6eba_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1556_c2_6eba]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output : signed(7 downto 0);

-- printf_uxn_opcodes_h_l1557_c3_63a4[uxn_opcodes_h_l1557_c3_63a4]
signal printf_uxn_opcodes_h_l1557_c3_63a4_uxn_opcodes_h_l1557_c3_63a4_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1564_c11_3c0f]
signal BIN_OP_EQ_uxn_opcodes_h_l1564_c11_3c0f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1564_c11_3c0f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1564_c11_3c0f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1564_c7_7982]
signal t16_MUX_uxn_opcodes_h_l1564_c7_7982_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1564_c7_7982_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1564_c7_7982]
signal result_stack_value_MUX_uxn_opcodes_h_l1564_c7_7982_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1564_c7_7982_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1564_c7_7982]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_7982_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_7982_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1564_c7_7982]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_7982_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_7982_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1564_c7_7982]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_7982_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_7982_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1564_c7_7982]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_7982_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_7982_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1564_c7_7982]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_7982_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_7982_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1564_c7_7982]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_7982_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_7982_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1564_c7_7982]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_7982_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_7982_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1568_c11_7cc3]
signal BIN_OP_EQ_uxn_opcodes_h_l1568_c11_7cc3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1568_c11_7cc3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1568_c11_7cc3_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1568_c7_587f]
signal t16_MUX_uxn_opcodes_h_l1568_c7_587f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1568_c7_587f_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1568_c7_587f]
signal result_stack_value_MUX_uxn_opcodes_h_l1568_c7_587f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1568_c7_587f_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1568_c7_587f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_587f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_587f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1568_c7_587f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_587f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_587f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1568_c7_587f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_587f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_587f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1568_c7_587f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_587f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_587f_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1568_c7_587f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_587f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_587f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1568_c7_587f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_587f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_587f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1568_c7_587f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_587f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_587f_return_output : signed(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1570_c3_56f8]
signal CONST_SL_8_uxn_opcodes_h_l1570_c3_56f8_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1570_c3_56f8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1574_c11_7f9b]
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7f9b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7f9b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7f9b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1574_c7_e286]
signal t16_MUX_uxn_opcodes_h_l1574_c7_e286_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1574_c7_e286_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1574_c7_e286]
signal result_stack_value_MUX_uxn_opcodes_h_l1574_c7_e286_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1574_c7_e286_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1574_c7_e286]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_e286_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_e286_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1574_c7_e286]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_e286_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_e286_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1574_c7_e286]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_e286_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_e286_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1574_c7_e286]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_e286_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_e286_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1574_c7_e286]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_e286_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_e286_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1574_c7_e286]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_e286_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_e286_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1574_c7_e286]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_e286_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_e286_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1578_c11_89b1]
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_89b1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_89b1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_89b1_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1578_c7_b488]
signal t16_MUX_uxn_opcodes_h_l1578_c7_b488_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1578_c7_b488_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1578_c7_b488]
signal result_stack_value_MUX_uxn_opcodes_h_l1578_c7_b488_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1578_c7_b488_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1578_c7_b488]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_b488_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_b488_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1578_c7_b488]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_b488_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_b488_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1578_c7_b488]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_b488_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_b488_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1578_c7_b488]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_b488_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_b488_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1578_c7_b488]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_b488_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_b488_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1578_c7_b488]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_b488_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_b488_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1578_c7_b488]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_b488_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_b488_return_output : signed(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1579_c3_f534]
signal BIN_OP_OR_uxn_opcodes_h_l1579_c3_f534_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1579_c3_f534_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1579_c3_f534_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1582_c11_3636]
signal BIN_OP_EQ_uxn_opcodes_h_l1582_c11_3636_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1582_c11_3636_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1582_c11_3636_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1582_c7_ceb3]
signal result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1582_c7_ceb3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1582_c7_ceb3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1582_c7_ceb3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1582_c7_ceb3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1582_c7_ceb3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1582_c7_ceb3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output : signed(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1584_c32_d21c]
signal BIN_OP_AND_uxn_opcodes_h_l1584_c32_d21c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1584_c32_d21c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1584_c32_d21c_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1584_c32_4675]
signal BIN_OP_GT_uxn_opcodes_h_l1584_c32_4675_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1584_c32_4675_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1584_c32_4675_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1584_c32_6287]
signal MUX_uxn_opcodes_h_l1584_c32_6287_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1584_c32_6287_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1584_c32_6287_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1584_c32_6287_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1586_c11_41b7]
signal BIN_OP_EQ_uxn_opcodes_h_l1586_c11_41b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1586_c11_41b7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1586_c11_41b7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1586_c7_8ea1]
signal result_stack_value_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1586_c7_8ea1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1586_c7_8ea1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1586_c7_8ea1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1586_c7_8ea1]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1586_c7_8ea1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1586_c7_8ea1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1591_c11_ce16]
signal BIN_OP_EQ_uxn_opcodes_h_l1591_c11_ce16_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1591_c11_ce16_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1591_c11_ce16_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1591_c7_86a4]
signal result_stack_value_MUX_uxn_opcodes_h_l1591_c7_86a4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1591_c7_86a4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_86a4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1591_c7_86a4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_86a4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1591_c7_86a4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_86a4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1591_c7_86a4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_86a4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1591_c7_86a4]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_86a4_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1597_c11_ea4b]
signal BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ea4b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ea4b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ea4b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1597_c7_ac93]
signal result_stack_value_MUX_uxn_opcodes_h_l1597_c7_ac93_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1597_c7_ac93_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1597_c7_ac93_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1597_c7_ac93]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_ac93_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_ac93_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_ac93_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1597_c7_ac93]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_ac93_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_ac93_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_ac93_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1597_c7_ac93]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_ac93_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_ac93_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_ac93_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1597_c7_ac93]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_ac93_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_ac93_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_ac93_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1600_c34_8e35]
signal CONST_SR_8_uxn_opcodes_h_l1600_c34_8e35_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1600_c34_8e35_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1602_c11_0e25]
signal BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0e25_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0e25_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0e25_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1602_c7_0750]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_0750_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_0750_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_0750_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_0750_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1602_c7_0750]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_0750_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_0750_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_0750_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_0750_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1602_c7_0750]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_0750_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_0750_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_0750_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_0750_return_output : unsigned(0 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_1dd0( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1556_c6_072c
BIN_OP_EQ_uxn_opcodes_h_l1556_c6_072c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1556_c6_072c_left,
BIN_OP_EQ_uxn_opcodes_h_l1556_c6_072c_right,
BIN_OP_EQ_uxn_opcodes_h_l1556_c6_072c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_2837
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_2837 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_2837_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_2837_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_2837_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_2837_return_output);

-- t16_MUX_uxn_opcodes_h_l1556_c2_6eba
t16_MUX_uxn_opcodes_h_l1556_c2_6eba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1556_c2_6eba_cond,
t16_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue,
t16_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse,
t16_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1556_c2_6eba
result_stack_value_MUX_uxn_opcodes_h_l1556_c2_6eba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1556_c2_6eba_cond,
result_stack_value_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_6eba
result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_6eba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_6eba_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_6eba
result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_6eba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_6eba_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_6eba
result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_6eba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_6eba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_6eba
result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_6eba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_6eba
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_6eba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_6eba_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_6eba
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_6eba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_6eba_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_6eba
result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_6eba : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output);

-- printf_uxn_opcodes_h_l1557_c3_63a4_uxn_opcodes_h_l1557_c3_63a4
printf_uxn_opcodes_h_l1557_c3_63a4_uxn_opcodes_h_l1557_c3_63a4 : entity work.printf_uxn_opcodes_h_l1557_c3_63a4_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1557_c3_63a4_uxn_opcodes_h_l1557_c3_63a4_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1564_c11_3c0f
BIN_OP_EQ_uxn_opcodes_h_l1564_c11_3c0f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1564_c11_3c0f_left,
BIN_OP_EQ_uxn_opcodes_h_l1564_c11_3c0f_right,
BIN_OP_EQ_uxn_opcodes_h_l1564_c11_3c0f_return_output);

-- t16_MUX_uxn_opcodes_h_l1564_c7_7982
t16_MUX_uxn_opcodes_h_l1564_c7_7982 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1564_c7_7982_cond,
t16_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue,
t16_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse,
t16_MUX_uxn_opcodes_h_l1564_c7_7982_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1564_c7_7982
result_stack_value_MUX_uxn_opcodes_h_l1564_c7_7982 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1564_c7_7982_cond,
result_stack_value_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1564_c7_7982_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_7982
result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_7982 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_7982_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_7982_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_7982
result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_7982 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_7982_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_7982_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_7982
result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_7982 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_7982_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_7982_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_7982
result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_7982 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_7982_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_7982_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_7982
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_7982 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_7982_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_7982_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_7982
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_7982 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_7982_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_7982_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_7982
result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_7982 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_7982_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_7982_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1568_c11_7cc3
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_7cc3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_7cc3_left,
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_7cc3_right,
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_7cc3_return_output);

-- t16_MUX_uxn_opcodes_h_l1568_c7_587f
t16_MUX_uxn_opcodes_h_l1568_c7_587f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1568_c7_587f_cond,
t16_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue,
t16_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse,
t16_MUX_uxn_opcodes_h_l1568_c7_587f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1568_c7_587f
result_stack_value_MUX_uxn_opcodes_h_l1568_c7_587f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1568_c7_587f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1568_c7_587f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_587f
result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_587f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_587f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_587f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_587f
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_587f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_587f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_587f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_587f
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_587f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_587f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_587f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_587f
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_587f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_587f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_587f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_587f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_587f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_587f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_587f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_587f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_587f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_587f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_587f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_587f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_587f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_587f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_587f_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1570_c3_56f8
CONST_SL_8_uxn_opcodes_h_l1570_c3_56f8 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1570_c3_56f8_x,
CONST_SL_8_uxn_opcodes_h_l1570_c3_56f8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7f9b
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7f9b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7f9b_left,
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7f9b_right,
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7f9b_return_output);

-- t16_MUX_uxn_opcodes_h_l1574_c7_e286
t16_MUX_uxn_opcodes_h_l1574_c7_e286 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1574_c7_e286_cond,
t16_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue,
t16_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse,
t16_MUX_uxn_opcodes_h_l1574_c7_e286_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1574_c7_e286
result_stack_value_MUX_uxn_opcodes_h_l1574_c7_e286 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1574_c7_e286_cond,
result_stack_value_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1574_c7_e286_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_e286
result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_e286 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_e286_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_e286_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_e286
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_e286 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_e286_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_e286_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_e286
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_e286 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_e286_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_e286_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_e286
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_e286 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_e286_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_e286_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_e286
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_e286 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_e286_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_e286_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_e286
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_e286 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_e286_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_e286_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_e286
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_e286 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_e286_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_e286_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1578_c11_89b1
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_89b1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_89b1_left,
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_89b1_right,
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_89b1_return_output);

-- t16_MUX_uxn_opcodes_h_l1578_c7_b488
t16_MUX_uxn_opcodes_h_l1578_c7_b488 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1578_c7_b488_cond,
t16_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue,
t16_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse,
t16_MUX_uxn_opcodes_h_l1578_c7_b488_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1578_c7_b488
result_stack_value_MUX_uxn_opcodes_h_l1578_c7_b488 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1578_c7_b488_cond,
result_stack_value_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1578_c7_b488_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_b488
result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_b488 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_b488_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_b488_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_b488
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_b488 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_b488_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_b488_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_b488
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_b488 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_b488_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_b488_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_b488
result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_b488 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_b488_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_b488_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_b488
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_b488 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_b488_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_b488_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_b488
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_b488 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_b488_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_b488_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_b488
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_b488 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_b488_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_b488_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1579_c3_f534
BIN_OP_OR_uxn_opcodes_h_l1579_c3_f534 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1579_c3_f534_left,
BIN_OP_OR_uxn_opcodes_h_l1579_c3_f534_right,
BIN_OP_OR_uxn_opcodes_h_l1579_c3_f534_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1582_c11_3636
BIN_OP_EQ_uxn_opcodes_h_l1582_c11_3636 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1582_c11_3636_left,
BIN_OP_EQ_uxn_opcodes_h_l1582_c11_3636_right,
BIN_OP_EQ_uxn_opcodes_h_l1582_c11_3636_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ceb3
result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ceb3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond,
result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ceb3
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ceb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3
result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ceb3
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ceb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ceb3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ceb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ceb3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ceb3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1584_c32_d21c
BIN_OP_AND_uxn_opcodes_h_l1584_c32_d21c : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1584_c32_d21c_left,
BIN_OP_AND_uxn_opcodes_h_l1584_c32_d21c_right,
BIN_OP_AND_uxn_opcodes_h_l1584_c32_d21c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1584_c32_4675
BIN_OP_GT_uxn_opcodes_h_l1584_c32_4675 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1584_c32_4675_left,
BIN_OP_GT_uxn_opcodes_h_l1584_c32_4675_right,
BIN_OP_GT_uxn_opcodes_h_l1584_c32_4675_return_output);

-- MUX_uxn_opcodes_h_l1584_c32_6287
MUX_uxn_opcodes_h_l1584_c32_6287 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1584_c32_6287_cond,
MUX_uxn_opcodes_h_l1584_c32_6287_iftrue,
MUX_uxn_opcodes_h_l1584_c32_6287_iffalse,
MUX_uxn_opcodes_h_l1584_c32_6287_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1586_c11_41b7
BIN_OP_EQ_uxn_opcodes_h_l1586_c11_41b7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1586_c11_41b7_left,
BIN_OP_EQ_uxn_opcodes_h_l1586_c11_41b7_right,
BIN_OP_EQ_uxn_opcodes_h_l1586_c11_41b7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1586_c7_8ea1
result_stack_value_MUX_uxn_opcodes_h_l1586_c7_8ea1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_8ea1
result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_8ea1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1
result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_8ea1
result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_8ea1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_8ea1
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_8ea1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_8ea1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_8ea1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1591_c11_ce16
BIN_OP_EQ_uxn_opcodes_h_l1591_c11_ce16 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1591_c11_ce16_left,
BIN_OP_EQ_uxn_opcodes_h_l1591_c11_ce16_right,
BIN_OP_EQ_uxn_opcodes_h_l1591_c11_ce16_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1591_c7_86a4
result_stack_value_MUX_uxn_opcodes_h_l1591_c7_86a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1591_c7_86a4_cond,
result_stack_value_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_86a4
result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_86a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_86a4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_86a4
result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_86a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_86a4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_86a4
result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_86a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_86a4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_86a4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_86a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_86a4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_86a4
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_86a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_86a4_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ea4b
BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ea4b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ea4b_left,
BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ea4b_right,
BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ea4b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1597_c7_ac93
result_stack_value_MUX_uxn_opcodes_h_l1597_c7_ac93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1597_c7_ac93_cond,
result_stack_value_MUX_uxn_opcodes_h_l1597_c7_ac93_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1597_c7_ac93_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_ac93
result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_ac93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_ac93_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_ac93_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_ac93_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_ac93
result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_ac93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_ac93_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_ac93_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_ac93_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_ac93
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_ac93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_ac93_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_ac93_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_ac93_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_ac93
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_ac93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_ac93_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_ac93_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_ac93_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1600_c34_8e35
CONST_SR_8_uxn_opcodes_h_l1600_c34_8e35 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1600_c34_8e35_x,
CONST_SR_8_uxn_opcodes_h_l1600_c34_8e35_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0e25
BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0e25 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0e25_left,
BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0e25_right,
BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0e25_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_0750
result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_0750 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_0750_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_0750_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_0750_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_0750_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_0750
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_0750 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_0750_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_0750_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_0750_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_0750_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_0750
result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_0750 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_0750_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_0750_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_0750_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_0750_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1556_c6_072c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_2837_return_output,
 t16_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1564_c11_3c0f_return_output,
 t16_MUX_uxn_opcodes_h_l1564_c7_7982_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1564_c7_7982_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_7982_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_7982_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_7982_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_7982_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_7982_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_7982_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_7982_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1568_c11_7cc3_return_output,
 t16_MUX_uxn_opcodes_h_l1568_c7_587f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1568_c7_587f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_587f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_587f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_587f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_587f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_587f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_587f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_587f_return_output,
 CONST_SL_8_uxn_opcodes_h_l1570_c3_56f8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7f9b_return_output,
 t16_MUX_uxn_opcodes_h_l1574_c7_e286_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1574_c7_e286_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_e286_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_e286_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_e286_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_e286_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_e286_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_e286_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_e286_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1578_c11_89b1_return_output,
 t16_MUX_uxn_opcodes_h_l1578_c7_b488_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1578_c7_b488_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_b488_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_b488_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_b488_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_b488_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_b488_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_b488_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_b488_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1579_c3_f534_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1582_c11_3636_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1584_c32_d21c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1584_c32_4675_return_output,
 MUX_uxn_opcodes_h_l1584_c32_6287_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1586_c11_41b7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1591_c11_ce16_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ea4b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output,
 CONST_SR_8_uxn_opcodes_h_l1600_c34_8e35_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0e25_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_0750_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_0750_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_0750_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_072c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_072c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_072c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_2837_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_2837_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_2837_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_2837_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1564_c7_7982_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1556_c2_6eba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_7982_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_6eba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_7982_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_6eba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_7982_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_6eba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_7982_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_6eba_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_7982_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_7982_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_6eba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1560_c3_6d6f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_7982_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_6eba_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_7982_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1557_c3_63a4_uxn_opcodes_h_l1557_c3_63a4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_3c0f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_3c0f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_3c0f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1568_c7_587f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1564_c7_7982_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_587f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_7982_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_587f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_7982_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_587f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_7982_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_587f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_7982_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_587f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_7982_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_587f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_7982_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1566_c3_f520 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_587f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_7982_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_587f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_7982_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_7cc3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_7cc3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_7cc3_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1574_c7_e286_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1568_c7_587f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_e286_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_587f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_e286_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_587f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_e286_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_587f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_e286_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_587f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_e286_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_587f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_e286_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_587f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1572_c3_0a1b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_e286_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_587f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_e286_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_587f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1570_c3_56f8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1570_c3_56f8_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7f9b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7f9b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7f9b_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1578_c7_b488_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1574_c7_e286_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_b488_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_e286_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_b488_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_e286_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_b488_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_e286_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_b488_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_e286_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_b488_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_e286_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_b488_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_e286_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1576_c3_0bae : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_b488_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_e286_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_b488_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_e286_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_89b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_89b1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_89b1_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1578_c7_b488_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_b488_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1578_c7_b488_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_b488_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_b488_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_b488_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_b488_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_b488_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_b488_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_b488_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1579_c3_f534_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1579_c3_f534_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1579_c3_f534_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_3636_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_3636_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_3636_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1584_c32_6287_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1584_c32_6287_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1584_c32_6287_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1584_c32_d21c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1584_c32_d21c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1584_c32_d21c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1584_c32_4675_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1584_c32_4675_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1584_c32_4675_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1584_c32_6287_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_41b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_41b7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_41b7_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1589_c3_3e79 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_ce16_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_ce16_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_ce16_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_86a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_86a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_86a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_86a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1594_c3_d3f2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_86a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_86a4_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1595_c24_3225_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ea4b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ea4b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ea4b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_ac93_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_ac93_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_ac93_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_ac93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_ac93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_0750_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_ac93_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_ac93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_ac93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_0750_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_ac93_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_ac93_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1599_c3_1d23 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_ac93_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_ac93_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_ac93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_ac93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_0750_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_ac93_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1600_c34_8e35_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1600_c34_8e35_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1600_c24_446f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0e25_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0e25_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0e25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_0750_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_0750_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_0750_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_0750_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_0750_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_0750_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_0750_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_0750_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_0750_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1574_l1568_l1597_l1564_l1556_l1586_l1582_l1578_DUPLICATE_1d47_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1574_l1568_l1564_l1591_l1556_l1578_DUPLICATE_1bc8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1574_l1568_l1564_l1556_l1586_l1578_DUPLICATE_1269_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1602_l1568_l1564_l1586_l1582_l1578_DUPLICATE_1733_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1568_l1597_l1564_l1591_l1586_l1582_l1578_DUPLICATE_ac82_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_l1602_l1568_l1597_l1564_l1591_l1582_l1578_DUPLICATE_b66c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1569_l1579_DUPLICATE_4150_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1582_l1597_l1586_l1578_DUPLICATE_82dd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1dd0_uxn_opcodes_h_l1608_l1552_DUPLICATE_bc13_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_0750_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1594_c3_d3f2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1594_c3_d3f2;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1584_c32_4675_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1589_c3_3e79 := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1589_c3_3e79;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1560_c3_6d6f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1560_c3_6d6f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_41b7_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0e25_right := to_unsigned(9, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_ac93_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1599_c3_1d23 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_ac93_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1599_c3_1d23;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_3c0f_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1584_c32_d21c_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l1584_c32_6287_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_7cc3_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_0750_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_ce16_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1572_c3_0a1b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1572_c3_0a1b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_89b1_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l1584_c32_6287_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ea4b_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1566_c3_f520 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1566_c3_f520;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1576_c3_0bae := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1576_c3_0bae;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7f9b_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_2837_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_0750_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_3636_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_072c_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue := to_unsigned(1, 1);

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_2837_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1584_c32_d21c_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_072c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_3c0f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_7cc3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7f9b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_89b1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_3636_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_41b7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_ce16_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ea4b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0e25_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1579_c3_f534_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1600_c34_8e35_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1602_c11_0e25] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0e25_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0e25_left;
     BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0e25_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0e25_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0e25_return_output := BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0e25_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1578_c7_b488] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1578_c7_b488_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1586_c11_41b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1586_c11_41b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_41b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1586_c11_41b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_41b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_41b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1586_c11_41b7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1574_l1568_l1564_l1591_l1556_l1578_DUPLICATE_1bc8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1574_l1568_l1564_l1591_l1556_l1578_DUPLICATE_1bc8_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_l1602_l1568_l1597_l1564_l1591_l1582_l1578_DUPLICATE_b66c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_l1602_l1568_l1597_l1564_l1591_l1582_l1578_DUPLICATE_b66c_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1602_l1568_l1564_l1586_l1582_l1578_DUPLICATE_1733 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1602_l1568_l1564_l1586_l1582_l1578_DUPLICATE_1733_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1568_l1597_l1564_l1591_l1586_l1582_l1578_DUPLICATE_ac82 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1568_l1597_l1564_l1591_l1586_l1582_l1578_DUPLICATE_ac82_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1582_c11_3636] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1582_c11_3636_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_3636_left;
     BIN_OP_EQ_uxn_opcodes_h_l1582_c11_3636_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_3636_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_3636_return_output := BIN_OP_EQ_uxn_opcodes_h_l1582_c11_3636_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1584_c32_d21c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1584_c32_d21c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1584_c32_d21c_left;
     BIN_OP_AND_uxn_opcodes_h_l1584_c32_d21c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1584_c32_d21c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1584_c32_d21c_return_output := BIN_OP_AND_uxn_opcodes_h_l1584_c32_d21c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1578_c11_89b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1578_c11_89b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_89b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1578_c11_89b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_89b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_89b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1578_c11_89b1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1564_c11_3c0f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1564_c11_3c0f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_3c0f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1564_c11_3c0f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_3c0f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_3c0f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1564_c11_3c0f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1568_c11_7cc3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1568_c11_7cc3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_7cc3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1568_c11_7cc3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_7cc3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_7cc3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1568_c11_7cc3_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1600_c34_8e35] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1600_c34_8e35_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1600_c34_8e35_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1600_c34_8e35_return_output := CONST_SR_8_uxn_opcodes_h_l1600_c34_8e35_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1574_l1568_l1597_l1564_l1556_l1586_l1582_l1578_DUPLICATE_1d47 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1574_l1568_l1597_l1564_l1556_l1586_l1582_l1578_DUPLICATE_1d47_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1591_c11_ce16] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1591_c11_ce16_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_ce16_left;
     BIN_OP_EQ_uxn_opcodes_h_l1591_c11_ce16_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_ce16_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_ce16_return_output := BIN_OP_EQ_uxn_opcodes_h_l1591_c11_ce16_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1556_c6_072c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1556_c6_072c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_072c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1556_c6_072c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_072c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_072c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1556_c6_072c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1574_c11_7f9b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7f9b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7f9b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7f9b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7f9b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7f9b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7f9b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1582_l1597_l1586_l1578_DUPLICATE_82dd LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1582_l1597_l1586_l1578_DUPLICATE_82dd_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1574_l1568_l1564_l1556_l1586_l1578_DUPLICATE_1269 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1574_l1568_l1564_l1556_l1586_l1578_DUPLICATE_1269_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1569_l1579_DUPLICATE_4150 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1569_l1579_DUPLICATE_4150_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1597_c11_ea4b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ea4b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ea4b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ea4b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ea4b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ea4b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ea4b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1595_c24_3225] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1595_c24_3225_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1584_c32_4675_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1584_c32_d21c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_2837_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_072c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_6eba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_072c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_072c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_6eba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_072c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_6eba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_072c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_6eba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_072c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_072c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_6eba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_072c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_6eba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_072c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1556_c2_6eba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_072c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_7982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_3c0f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_7982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_3c0f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_7982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_3c0f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_7982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_3c0f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_7982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_3c0f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_7982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_3c0f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_7982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_3c0f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_7982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_3c0f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1564_c7_7982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_3c0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_587f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_7cc3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_587f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_7cc3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_587f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_7cc3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_587f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_7cc3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_587f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_7cc3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_587f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_7cc3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_587f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_7cc3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_587f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_7cc3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1568_c7_587f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_7cc3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_e286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7f9b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_e286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7f9b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_e286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7f9b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_e286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7f9b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_e286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7f9b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_e286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7f9b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_e286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7f9b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_e286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7f9b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1574_c7_e286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7f9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_b488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_89b1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_b488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_89b1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_b488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_89b1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_b488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_89b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_b488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_89b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_b488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_89b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_b488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_89b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_b488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_89b1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1578_c7_b488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_89b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_3636_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_3636_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_3636_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_3636_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_3636_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_3636_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_3636_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_41b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_41b7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_41b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_41b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_41b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_41b7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_41b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_86a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_ce16_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_86a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_ce16_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_86a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_ce16_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_86a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_ce16_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_86a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_ce16_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_86a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_ce16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_ac93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ea4b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_ac93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ea4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_ac93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ea4b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_ac93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ea4b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_ac93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ea4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_0750_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0e25_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_0750_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0e25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_0750_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0e25_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1579_c3_f534_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1569_l1579_DUPLICATE_4150_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1570_c3_56f8_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1569_l1579_DUPLICATE_4150_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1595_c24_3225_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1574_l1568_l1564_l1556_l1586_l1578_DUPLICATE_1269_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1574_l1568_l1564_l1556_l1586_l1578_DUPLICATE_1269_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1574_l1568_l1564_l1556_l1586_l1578_DUPLICATE_1269_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1574_l1568_l1564_l1556_l1586_l1578_DUPLICATE_1269_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1574_l1568_l1564_l1556_l1586_l1578_DUPLICATE_1269_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1574_l1568_l1564_l1556_l1586_l1578_DUPLICATE_1269_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1568_l1597_l1564_l1591_l1586_l1582_l1578_DUPLICATE_ac82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1568_l1597_l1564_l1591_l1586_l1582_l1578_DUPLICATE_ac82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1568_l1597_l1564_l1591_l1586_l1582_l1578_DUPLICATE_ac82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1568_l1597_l1564_l1591_l1586_l1582_l1578_DUPLICATE_ac82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1568_l1597_l1564_l1591_l1586_l1582_l1578_DUPLICATE_ac82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1568_l1597_l1564_l1591_l1586_l1582_l1578_DUPLICATE_ac82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1568_l1597_l1564_l1591_l1586_l1582_l1578_DUPLICATE_ac82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_ac93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1568_l1597_l1564_l1591_l1586_l1582_l1578_DUPLICATE_ac82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_0750_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1568_l1597_l1564_l1591_l1586_l1582_l1578_DUPLICATE_ac82_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1574_l1568_l1564_l1591_l1556_l1578_DUPLICATE_1bc8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1574_l1568_l1564_l1591_l1556_l1578_DUPLICATE_1bc8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1574_l1568_l1564_l1591_l1556_l1578_DUPLICATE_1bc8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1574_l1568_l1564_l1591_l1556_l1578_DUPLICATE_1bc8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1574_l1568_l1564_l1591_l1556_l1578_DUPLICATE_1bc8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1574_l1568_l1564_l1591_l1556_l1578_DUPLICATE_1bc8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_l1602_l1568_l1597_l1564_l1591_l1582_l1578_DUPLICATE_b66c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_l1602_l1568_l1597_l1564_l1591_l1582_l1578_DUPLICATE_b66c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_l1602_l1568_l1597_l1564_l1591_l1582_l1578_DUPLICATE_b66c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_l1602_l1568_l1597_l1564_l1591_l1582_l1578_DUPLICATE_b66c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_l1602_l1568_l1597_l1564_l1591_l1582_l1578_DUPLICATE_b66c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_l1602_l1568_l1597_l1564_l1591_l1582_l1578_DUPLICATE_b66c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_ac93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_l1602_l1568_l1597_l1564_l1591_l1582_l1578_DUPLICATE_b66c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_0750_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_l1602_l1568_l1597_l1564_l1591_l1582_l1578_DUPLICATE_b66c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1602_l1568_l1564_l1586_l1582_l1578_DUPLICATE_1733_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1602_l1568_l1564_l1586_l1582_l1578_DUPLICATE_1733_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1602_l1568_l1564_l1586_l1582_l1578_DUPLICATE_1733_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1602_l1568_l1564_l1586_l1582_l1578_DUPLICATE_1733_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1602_l1568_l1564_l1586_l1582_l1578_DUPLICATE_1733_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1602_l1568_l1564_l1586_l1582_l1578_DUPLICATE_1733_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_0750_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1602_l1568_l1564_l1586_l1582_l1578_DUPLICATE_1733_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1582_l1597_l1586_l1578_DUPLICATE_82dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1582_l1597_l1586_l1578_DUPLICATE_82dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1582_l1597_l1586_l1578_DUPLICATE_82dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_ac93_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1582_l1597_l1586_l1578_DUPLICATE_82dd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1574_l1568_l1597_l1564_l1556_l1586_l1582_l1578_DUPLICATE_1d47_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1574_l1568_l1597_l1564_l1556_l1586_l1582_l1578_DUPLICATE_1d47_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1574_l1568_l1597_l1564_l1556_l1586_l1582_l1578_DUPLICATE_1d47_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1574_l1568_l1597_l1564_l1556_l1586_l1582_l1578_DUPLICATE_1d47_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1574_l1568_l1597_l1564_l1556_l1586_l1582_l1578_DUPLICATE_1d47_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1574_l1568_l1597_l1564_l1556_l1586_l1582_l1578_DUPLICATE_1d47_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1574_l1568_l1597_l1564_l1556_l1586_l1582_l1578_DUPLICATE_1d47_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_ac93_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1574_l1568_l1597_l1564_l1556_l1586_l1582_l1578_DUPLICATE_1d47_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1578_c7_b488_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1597_c7_ac93] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_ac93_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_ac93_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_ac93_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_ac93_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_ac93_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_ac93_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1591_c7_86a4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_86a4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_86a4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1602_c7_0750] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_0750_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_0750_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_0750_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_0750_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_0750_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_0750_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_0750_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_0750_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1578_c7_b488] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_b488_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_b488_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_b488_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_b488_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1602_c7_0750] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_0750_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_0750_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_0750_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_0750_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_0750_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_0750_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_0750_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_0750_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1600_c24_446f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1600_c24_446f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1600_c34_8e35_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l1579_c3_f534] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1579_c3_f534_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1579_c3_f534_left;
     BIN_OP_OR_uxn_opcodes_h_l1579_c3_f534_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1579_c3_f534_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1579_c3_f534_return_output := BIN_OP_OR_uxn_opcodes_h_l1579_c3_f534_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1570_c3_56f8] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1570_c3_56f8_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1570_c3_56f8_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1570_c3_56f8_return_output := CONST_SL_8_uxn_opcodes_h_l1570_c3_56f8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1556_c1_2837] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_2837_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_2837_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_2837_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_2837_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_2837_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_2837_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_2837_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_2837_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1602_c7_0750] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_0750_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_0750_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_0750_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_0750_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_0750_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_0750_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_0750_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_0750_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1586_c7_8ea1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1584_c32_4675] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1584_c32_4675_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1584_c32_4675_left;
     BIN_OP_GT_uxn_opcodes_h_l1584_c32_4675_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1584_c32_4675_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1584_c32_4675_return_output := BIN_OP_GT_uxn_opcodes_h_l1584_c32_4675_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1584_c32_6287_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1584_c32_4675_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1579_c3_f534_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_ac93_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1600_c24_446f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1570_c3_56f8_return_output;
     VAR_printf_uxn_opcodes_h_l1557_c3_63a4_uxn_opcodes_h_l1557_c3_63a4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_2837_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_ac93_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_0750_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_ac93_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_0750_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_b488_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_ac93_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_0750_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1586_c7_8ea1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1597_c7_ac93] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1597_c7_ac93_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_ac93_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1597_c7_ac93_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_ac93_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1597_c7_ac93_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_ac93_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output := result_stack_value_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1597_c7_ac93] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_ac93_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_ac93_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_ac93_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_ac93_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_ac93_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_ac93_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1597_c7_ac93] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_ac93_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_ac93_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_ac93_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_ac93_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_ac93_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_ac93_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output;

     -- MUX[uxn_opcodes_h_l1584_c32_6287] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1584_c32_6287_cond <= VAR_MUX_uxn_opcodes_h_l1584_c32_6287_cond;
     MUX_uxn_opcodes_h_l1584_c32_6287_iftrue <= VAR_MUX_uxn_opcodes_h_l1584_c32_6287_iftrue;
     MUX_uxn_opcodes_h_l1584_c32_6287_iffalse <= VAR_MUX_uxn_opcodes_h_l1584_c32_6287_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1584_c32_6287_return_output := MUX_uxn_opcodes_h_l1584_c32_6287_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1597_c7_ac93] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_ac93_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_ac93_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_ac93_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_ac93_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_ac93_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_ac93_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output;

     -- t16_MUX[uxn_opcodes_h_l1578_c7_b488] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1578_c7_b488_cond <= VAR_t16_MUX_uxn_opcodes_h_l1578_c7_b488_cond;
     t16_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue;
     t16_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1578_c7_b488_return_output := t16_MUX_uxn_opcodes_h_l1578_c7_b488_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1574_c7_e286] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_e286_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_e286_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_e286_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_e286_return_output;

     -- printf_uxn_opcodes_h_l1557_c3_63a4[uxn_opcodes_h_l1557_c3_63a4] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1557_c3_63a4_uxn_opcodes_h_l1557_c3_63a4_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1557_c3_63a4_uxn_opcodes_h_l1557_c3_63a4_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1591_c7_86a4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_86a4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_86a4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue := VAR_MUX_uxn_opcodes_h_l1584_c32_6287_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_e286_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_ac93_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1578_c7_b488_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1591_c7_86a4] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_86a4_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_86a4_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1591_c7_86a4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1591_c7_86a4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_86a4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output := result_stack_value_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1586_c7_8ea1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1568_c7_587f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_587f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_587f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_587f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_587f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1582_c7_ceb3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1574_c7_e286] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1574_c7_e286_cond <= VAR_t16_MUX_uxn_opcodes_h_l1574_c7_e286_cond;
     t16_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue;
     t16_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1574_c7_e286_return_output := t16_MUX_uxn_opcodes_h_l1574_c7_e286_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1582_c7_ceb3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1591_c7_86a4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_86a4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_86a4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1591_c7_86a4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_86a4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_86a4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_86a4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_86a4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_587f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_86a4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1574_c7_e286_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1578_c7_b488] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_b488_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_b488_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_b488_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_b488_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1578_c7_b488] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_b488_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_b488_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_b488_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_b488_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1586_c7_8ea1] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1582_c7_ceb3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1568_c7_587f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1568_c7_587f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1568_c7_587f_cond;
     t16_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue;
     t16_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1568_c7_587f_return_output := t16_MUX_uxn_opcodes_h_l1568_c7_587f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1586_c7_8ea1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1564_c7_7982] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_7982_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_7982_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_7982_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_7982_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1586_c7_8ea1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1586_c7_8ea1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_8ea1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_8ea1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_8ea1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_b488_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_7982_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_b488_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_8ea1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1568_c7_587f_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1574_c7_e286] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_e286_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_e286_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_e286_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_e286_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1574_c7_e286] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_e286_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_e286_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_e286_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_e286_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1578_c7_b488] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_b488_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_b488_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_b488_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_b488_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1582_c7_ceb3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1582_c7_ceb3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1564_c7_7982] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1564_c7_7982_cond <= VAR_t16_MUX_uxn_opcodes_h_l1564_c7_7982_cond;
     t16_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue;
     t16_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1564_c7_7982_return_output := t16_MUX_uxn_opcodes_h_l1564_c7_7982_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1556_c2_6eba] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_6eba_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_6eba_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1582_c7_ceb3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1582_c7_ceb3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ceb3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ceb3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ceb3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output := result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_e286_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_e286_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_b488_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ceb3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1564_c7_7982_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1578_c7_b488] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1578_c7_b488_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_b488_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_b488_return_output := result_stack_value_MUX_uxn_opcodes_h_l1578_c7_b488_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1578_c7_b488] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_b488_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_b488_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_b488_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_b488_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1568_c7_587f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_587f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_587f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_587f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_587f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1578_c7_b488] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_b488_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_b488_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_b488_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_b488_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1574_c7_e286] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_e286_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_e286_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_e286_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_e286_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1568_c7_587f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_587f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_587f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_587f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_587f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1578_c7_b488] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_b488_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_b488_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_b488_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_b488_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_b488_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_b488_return_output;

     -- t16_MUX[uxn_opcodes_h_l1556_c2_6eba] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1556_c2_6eba_cond <= VAR_t16_MUX_uxn_opcodes_h_l1556_c2_6eba_cond;
     t16_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue;
     t16_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output := t16_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_b488_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_587f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_b488_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_b488_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_587f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_e286_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_b488_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1574_c7_e286] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1574_c7_e286_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_e286_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_e286_return_output := result_stack_value_MUX_uxn_opcodes_h_l1574_c7_e286_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1574_c7_e286] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_e286_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_e286_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_e286_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_e286_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1564_c7_7982] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_7982_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_7982_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_7982_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_7982_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1574_c7_e286] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_e286_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_e286_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_e286_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_e286_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1568_c7_587f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_587f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_587f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_587f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_587f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1574_c7_e286] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_e286_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_e286_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_e286_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_e286_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_e286_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_e286_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1564_c7_7982] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_7982_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_7982_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_7982_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_7982_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_e286_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_7982_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_e286_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_e286_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_7982_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_587f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_e286_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1556_c2_6eba] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1568_c7_587f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_587f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_587f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_587f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_587f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1568_c7_587f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_587f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_587f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_587f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_587f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1568_c7_587f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1568_c7_587f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_587f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_587f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1568_c7_587f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1568_c7_587f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_587f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_587f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_587f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_587f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_587f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_587f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1564_c7_7982] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_7982_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_7982_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_7982_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_7982_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1556_c2_6eba] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_587f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_587f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_587f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_7982_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_587f_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1564_c7_7982] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1564_c7_7982_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_7982_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_7982_return_output := result_stack_value_MUX_uxn_opcodes_h_l1564_c7_7982_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1564_c7_7982] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_7982_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_7982_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_7982_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_7982_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1556_c2_6eba] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_6eba_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_6eba_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1564_c7_7982] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_7982_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_7982_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_7982_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_7982_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1564_c7_7982] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_7982_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_7982_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_7982_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_7982_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_7982_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_7982_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_7982_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_7982_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_7982_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_7982_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1556_c2_6eba] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_6eba_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_6eba_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1556_c2_6eba] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1556_c2_6eba_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_6eba_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output := result_stack_value_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1556_c2_6eba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_6eba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_6eba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1556_c2_6eba] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_6eba_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_6eba_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_6eba_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_6eba_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1dd0_uxn_opcodes_h_l1608_l1552_DUPLICATE_bc13 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1dd0_uxn_opcodes_h_l1608_l1552_DUPLICATE_bc13_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1dd0(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_6eba_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1dd0_uxn_opcodes_h_l1608_l1552_DUPLICATE_bc13_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1dd0_uxn_opcodes_h_l1608_l1552_DUPLICATE_bc13_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
