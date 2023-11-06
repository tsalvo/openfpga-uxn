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
-- Submodules: 59
entity sta_0CLK_03a72d0b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta_0CLK_03a72d0b;
architecture arch of sta_0CLK_03a72d0b is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2176_c6_6669]
signal BIN_OP_EQ_uxn_opcodes_h_l2176_c6_6669_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2176_c6_6669_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2176_c6_6669_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2176_c1_b954]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_b954_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_b954_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_b954_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_b954_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2176_c2_c315]
signal n8_MUX_uxn_opcodes_h_l2176_c2_c315_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2176_c2_c315_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2176_c2_c315]
signal result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c315_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c315_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2176_c2_c315]
signal result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c315_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c315_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2176_c2_c315]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c315_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c315_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2176_c2_c315]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c315_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c315_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2176_c2_c315]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c315_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c315_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2176_c2_c315]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c315_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c315_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2176_c2_c315]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c315_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c315_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2176_c2_c315]
signal t16_MUX_uxn_opcodes_h_l2176_c2_c315_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2176_c2_c315_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2177_c3_424a[uxn_opcodes_h_l2177_c3_424a]
signal printf_uxn_opcodes_h_l2177_c3_424a_uxn_opcodes_h_l2177_c3_424a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2181_c11_5ab2]
signal BIN_OP_EQ_uxn_opcodes_h_l2181_c11_5ab2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2181_c11_5ab2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2181_c11_5ab2_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2181_c7_b177]
signal n8_MUX_uxn_opcodes_h_l2181_c7_b177_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2181_c7_b177_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2181_c7_b177]
signal result_u16_value_MUX_uxn_opcodes_h_l2181_c7_b177_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2181_c7_b177_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2181_c7_b177]
signal result_u8_value_MUX_uxn_opcodes_h_l2181_c7_b177_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2181_c7_b177_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2181_c7_b177]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_b177_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_b177_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2181_c7_b177]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_b177_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_b177_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2181_c7_b177]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_b177_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_b177_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2181_c7_b177]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_b177_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_b177_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2181_c7_b177]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_b177_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_b177_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2181_c7_b177]
signal t16_MUX_uxn_opcodes_h_l2181_c7_b177_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2181_c7_b177_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2184_c11_d526]
signal BIN_OP_EQ_uxn_opcodes_h_l2184_c11_d526_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2184_c11_d526_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2184_c11_d526_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2184_c7_789c]
signal n8_MUX_uxn_opcodes_h_l2184_c7_789c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2184_c7_789c_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2184_c7_789c]
signal result_u16_value_MUX_uxn_opcodes_h_l2184_c7_789c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2184_c7_789c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2184_c7_789c]
signal result_u8_value_MUX_uxn_opcodes_h_l2184_c7_789c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2184_c7_789c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2184_c7_789c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_789c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_789c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2184_c7_789c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_789c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_789c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2184_c7_789c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_789c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_789c_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2184_c7_789c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_789c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_789c_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2184_c7_789c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_789c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_789c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2184_c7_789c]
signal t16_MUX_uxn_opcodes_h_l2184_c7_789c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2184_c7_789c_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2186_c3_cc26]
signal CONST_SL_8_uxn_opcodes_h_l2186_c3_cc26_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2186_c3_cc26_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2189_c11_62ca]
signal BIN_OP_EQ_uxn_opcodes_h_l2189_c11_62ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2189_c11_62ca_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2189_c11_62ca_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2189_c7_9637]
signal n8_MUX_uxn_opcodes_h_l2189_c7_9637_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2189_c7_9637_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2189_c7_9637]
signal result_u16_value_MUX_uxn_opcodes_h_l2189_c7_9637_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2189_c7_9637_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2189_c7_9637]
signal result_u8_value_MUX_uxn_opcodes_h_l2189_c7_9637_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2189_c7_9637_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2189_c7_9637]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_9637_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_9637_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2189_c7_9637]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_9637_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_9637_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2189_c7_9637]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_9637_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_9637_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2189_c7_9637]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_9637_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_9637_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2189_c7_9637]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_9637_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_9637_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2189_c7_9637]
signal t16_MUX_uxn_opcodes_h_l2189_c7_9637_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2189_c7_9637_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2190_c3_7926]
signal BIN_OP_OR_uxn_opcodes_h_l2190_c3_7926_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2190_c3_7926_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2190_c3_7926_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2193_c11_1265]
signal BIN_OP_EQ_uxn_opcodes_h_l2193_c11_1265_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2193_c11_1265_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2193_c11_1265_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2193_c7_adfb]
signal n8_MUX_uxn_opcodes_h_l2193_c7_adfb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2193_c7_adfb]
signal result_u16_value_MUX_uxn_opcodes_h_l2193_c7_adfb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2193_c7_adfb]
signal result_u8_value_MUX_uxn_opcodes_h_l2193_c7_adfb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2193_c7_adfb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2193_c7_adfb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_adfb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2193_c7_adfb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2193_c7_adfb]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2193_c7_adfb_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2196_c30_4e9e]
signal sp_relative_shift_uxn_opcodes_h_l2196_c30_4e9e_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2196_c30_4e9e_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2196_c30_4e9e_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2196_c30_4e9e_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2201_c11_ec82]
signal BIN_OP_EQ_uxn_opcodes_h_l2201_c11_ec82_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2201_c11_ec82_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2201_c11_ec82_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2201_c7_a4b4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2201_c7_a4b4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2201_c7_a4b4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2201_c7_a4b4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2201_c7_a4b4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2201_c7_a4b4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_a4b4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_a4b4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_a4b4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_a4b4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2201_c7_a4b4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_a4b4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_a4b4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_a4b4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_a4b4_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_c878( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_ram_write := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2176_c6_6669
BIN_OP_EQ_uxn_opcodes_h_l2176_c6_6669 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2176_c6_6669_left,
BIN_OP_EQ_uxn_opcodes_h_l2176_c6_6669_right,
BIN_OP_EQ_uxn_opcodes_h_l2176_c6_6669_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_b954
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_b954 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_b954_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_b954_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_b954_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_b954_return_output);

-- n8_MUX_uxn_opcodes_h_l2176_c2_c315
n8_MUX_uxn_opcodes_h_l2176_c2_c315 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2176_c2_c315_cond,
n8_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue,
n8_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse,
n8_MUX_uxn_opcodes_h_l2176_c2_c315_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c315
result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c315 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c315_cond,
result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c315_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c315
result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c315 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c315_cond,
result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c315_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c315
result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c315 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c315_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c315_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c315
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c315 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c315_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c315_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c315
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c315 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c315_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c315_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c315
result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c315 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c315_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c315_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c315
result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c315 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c315_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c315_return_output);

-- t16_MUX_uxn_opcodes_h_l2176_c2_c315
t16_MUX_uxn_opcodes_h_l2176_c2_c315 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2176_c2_c315_cond,
t16_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue,
t16_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse,
t16_MUX_uxn_opcodes_h_l2176_c2_c315_return_output);

-- printf_uxn_opcodes_h_l2177_c3_424a_uxn_opcodes_h_l2177_c3_424a
printf_uxn_opcodes_h_l2177_c3_424a_uxn_opcodes_h_l2177_c3_424a : entity work.printf_uxn_opcodes_h_l2177_c3_424a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2177_c3_424a_uxn_opcodes_h_l2177_c3_424a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2181_c11_5ab2
BIN_OP_EQ_uxn_opcodes_h_l2181_c11_5ab2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2181_c11_5ab2_left,
BIN_OP_EQ_uxn_opcodes_h_l2181_c11_5ab2_right,
BIN_OP_EQ_uxn_opcodes_h_l2181_c11_5ab2_return_output);

-- n8_MUX_uxn_opcodes_h_l2181_c7_b177
n8_MUX_uxn_opcodes_h_l2181_c7_b177 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2181_c7_b177_cond,
n8_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue,
n8_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse,
n8_MUX_uxn_opcodes_h_l2181_c7_b177_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2181_c7_b177
result_u16_value_MUX_uxn_opcodes_h_l2181_c7_b177 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2181_c7_b177_cond,
result_u16_value_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2181_c7_b177_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2181_c7_b177
result_u8_value_MUX_uxn_opcodes_h_l2181_c7_b177 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2181_c7_b177_cond,
result_u8_value_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2181_c7_b177_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_b177
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_b177 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_b177_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_b177_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_b177
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_b177 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_b177_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_b177_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_b177
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_b177 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_b177_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_b177_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_b177
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_b177 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_b177_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_b177_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_b177
result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_b177 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_b177_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_b177_return_output);

-- t16_MUX_uxn_opcodes_h_l2181_c7_b177
t16_MUX_uxn_opcodes_h_l2181_c7_b177 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2181_c7_b177_cond,
t16_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue,
t16_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse,
t16_MUX_uxn_opcodes_h_l2181_c7_b177_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2184_c11_d526
BIN_OP_EQ_uxn_opcodes_h_l2184_c11_d526 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2184_c11_d526_left,
BIN_OP_EQ_uxn_opcodes_h_l2184_c11_d526_right,
BIN_OP_EQ_uxn_opcodes_h_l2184_c11_d526_return_output);

-- n8_MUX_uxn_opcodes_h_l2184_c7_789c
n8_MUX_uxn_opcodes_h_l2184_c7_789c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2184_c7_789c_cond,
n8_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue,
n8_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse,
n8_MUX_uxn_opcodes_h_l2184_c7_789c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2184_c7_789c
result_u16_value_MUX_uxn_opcodes_h_l2184_c7_789c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2184_c7_789c_cond,
result_u16_value_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2184_c7_789c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2184_c7_789c
result_u8_value_MUX_uxn_opcodes_h_l2184_c7_789c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2184_c7_789c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2184_c7_789c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_789c
result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_789c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_789c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_789c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_789c
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_789c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_789c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_789c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_789c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_789c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_789c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_789c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_789c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_789c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_789c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_789c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_789c
result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_789c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_789c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_789c_return_output);

-- t16_MUX_uxn_opcodes_h_l2184_c7_789c
t16_MUX_uxn_opcodes_h_l2184_c7_789c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2184_c7_789c_cond,
t16_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue,
t16_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse,
t16_MUX_uxn_opcodes_h_l2184_c7_789c_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2186_c3_cc26
CONST_SL_8_uxn_opcodes_h_l2186_c3_cc26 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2186_c3_cc26_x,
CONST_SL_8_uxn_opcodes_h_l2186_c3_cc26_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2189_c11_62ca
BIN_OP_EQ_uxn_opcodes_h_l2189_c11_62ca : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2189_c11_62ca_left,
BIN_OP_EQ_uxn_opcodes_h_l2189_c11_62ca_right,
BIN_OP_EQ_uxn_opcodes_h_l2189_c11_62ca_return_output);

-- n8_MUX_uxn_opcodes_h_l2189_c7_9637
n8_MUX_uxn_opcodes_h_l2189_c7_9637 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2189_c7_9637_cond,
n8_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue,
n8_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse,
n8_MUX_uxn_opcodes_h_l2189_c7_9637_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2189_c7_9637
result_u16_value_MUX_uxn_opcodes_h_l2189_c7_9637 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2189_c7_9637_cond,
result_u16_value_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2189_c7_9637_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2189_c7_9637
result_u8_value_MUX_uxn_opcodes_h_l2189_c7_9637 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2189_c7_9637_cond,
result_u8_value_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2189_c7_9637_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_9637
result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_9637 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_9637_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_9637_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_9637
result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_9637 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_9637_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_9637_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_9637
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_9637 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_9637_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_9637_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_9637
result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_9637 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_9637_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_9637_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_9637
result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_9637 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_9637_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_9637_return_output);

-- t16_MUX_uxn_opcodes_h_l2189_c7_9637
t16_MUX_uxn_opcodes_h_l2189_c7_9637 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2189_c7_9637_cond,
t16_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue,
t16_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse,
t16_MUX_uxn_opcodes_h_l2189_c7_9637_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2190_c3_7926
BIN_OP_OR_uxn_opcodes_h_l2190_c3_7926 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2190_c3_7926_left,
BIN_OP_OR_uxn_opcodes_h_l2190_c3_7926_right,
BIN_OP_OR_uxn_opcodes_h_l2190_c3_7926_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2193_c11_1265
BIN_OP_EQ_uxn_opcodes_h_l2193_c11_1265 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2193_c11_1265_left,
BIN_OP_EQ_uxn_opcodes_h_l2193_c11_1265_right,
BIN_OP_EQ_uxn_opcodes_h_l2193_c11_1265_return_output);

-- n8_MUX_uxn_opcodes_h_l2193_c7_adfb
n8_MUX_uxn_opcodes_h_l2193_c7_adfb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2193_c7_adfb_cond,
n8_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue,
n8_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse,
n8_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2193_c7_adfb
result_u16_value_MUX_uxn_opcodes_h_l2193_c7_adfb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2193_c7_adfb_cond,
result_u16_value_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2193_c7_adfb
result_u8_value_MUX_uxn_opcodes_h_l2193_c7_adfb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2193_c7_adfb_cond,
result_u8_value_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_adfb
result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_adfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_adfb
result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_adfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_adfb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_adfb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_adfb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2193_c7_adfb
result_is_ram_write_MUX_uxn_opcodes_h_l2193_c7_adfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2193_c7_adfb_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2196_c30_4e9e
sp_relative_shift_uxn_opcodes_h_l2196_c30_4e9e : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2196_c30_4e9e_ins,
sp_relative_shift_uxn_opcodes_h_l2196_c30_4e9e_x,
sp_relative_shift_uxn_opcodes_h_l2196_c30_4e9e_y,
sp_relative_shift_uxn_opcodes_h_l2196_c30_4e9e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2201_c11_ec82
BIN_OP_EQ_uxn_opcodes_h_l2201_c11_ec82 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2201_c11_ec82_left,
BIN_OP_EQ_uxn_opcodes_h_l2201_c11_ec82_right,
BIN_OP_EQ_uxn_opcodes_h_l2201_c11_ec82_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2201_c7_a4b4
result_is_ram_write_MUX_uxn_opcodes_h_l2201_c7_a4b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2201_c7_a4b4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2201_c7_a4b4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2201_c7_a4b4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2201_c7_a4b4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_a4b4
result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_a4b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_a4b4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_a4b4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_a4b4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_a4b4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_a4b4
result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_a4b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_a4b4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_a4b4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_a4b4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_a4b4_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2176_c6_6669_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_b954_return_output,
 n8_MUX_uxn_opcodes_h_l2176_c2_c315_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c315_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c315_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c315_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c315_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c315_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c315_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c315_return_output,
 t16_MUX_uxn_opcodes_h_l2176_c2_c315_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2181_c11_5ab2_return_output,
 n8_MUX_uxn_opcodes_h_l2181_c7_b177_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2181_c7_b177_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2181_c7_b177_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_b177_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_b177_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_b177_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_b177_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_b177_return_output,
 t16_MUX_uxn_opcodes_h_l2181_c7_b177_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2184_c11_d526_return_output,
 n8_MUX_uxn_opcodes_h_l2184_c7_789c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2184_c7_789c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2184_c7_789c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_789c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_789c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_789c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_789c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_789c_return_output,
 t16_MUX_uxn_opcodes_h_l2184_c7_789c_return_output,
 CONST_SL_8_uxn_opcodes_h_l2186_c3_cc26_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2189_c11_62ca_return_output,
 n8_MUX_uxn_opcodes_h_l2189_c7_9637_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2189_c7_9637_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2189_c7_9637_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_9637_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_9637_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_9637_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_9637_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_9637_return_output,
 t16_MUX_uxn_opcodes_h_l2189_c7_9637_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2190_c3_7926_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2193_c11_1265_return_output,
 n8_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output,
 sp_relative_shift_uxn_opcodes_h_l2196_c30_4e9e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2201_c11_ec82_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2201_c7_a4b4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_a4b4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_a4b4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_6669_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_6669_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_6669_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_b954_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_b954_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_b954_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_b954_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2181_c7_b177_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2176_c2_c315_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2176_c2_c315_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_b177_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c315_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c315_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_b177_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c315_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c315_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_b177_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c315_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c315_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_b177_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c315_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c315_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2178_c3_17de : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_b177_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c315_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c315_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_b177_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c315_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c315_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_b177_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c315_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c315_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2181_c7_b177_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2176_c2_c315_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2176_c2_c315_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2177_c3_424a_uxn_opcodes_h_l2177_c3_424a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_5ab2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_5ab2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_5ab2_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2184_c7_789c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2181_c7_b177_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_789c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_b177_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_789c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_b177_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_789c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_b177_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_789c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_b177_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2182_c3_bb9b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_789c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_b177_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_789c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_b177_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_789c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_b177_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2184_c7_789c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2181_c7_b177_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_d526_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_d526_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_d526_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2189_c7_9637_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2184_c7_789c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_9637_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_789c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_9637_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_789c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_9637_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_789c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_9637_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_789c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2187_c3_ca54 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_9637_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_789c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_9637_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_789c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_9637_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_789c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2189_c7_9637_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2184_c7_789c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2186_c3_cc26_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2186_c3_cc26_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_62ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_62ca_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_62ca_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2189_c7_9637_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_9637_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_9637_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_9637_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_9637_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2191_c3_e8b2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2189_c7_9637_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_9637_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_9637_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_9637_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2189_c7_9637_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_7926_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_7926_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_7926_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_1265_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_1265_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_1265_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2193_c7_adfb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2193_c7_adfb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2193_c7_adfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_a4b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_a4b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_adfb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2201_c7_a4b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2193_c7_adfb_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2196_c30_4e9e_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2196_c30_4e9e_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2196_c30_4e9e_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2196_c30_4e9e_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2201_c11_ec82_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2201_c11_ec82_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2201_c11_ec82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2201_c7_a4b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2201_c7_a4b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2201_c7_a4b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_a4b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_a4b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_a4b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_a4b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_a4b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_a4b4_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2193_l2189_l2184_l2181_l2176_DUPLICATE_c478_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2193_l2189_l2184_l2181_l2176_DUPLICATE_d5ea_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2189_l2184_l2181_l2176_l2201_DUPLICATE_6e40_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2193_l2189_l2184_l2181_l2176_DUPLICATE_dc0d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2189_l2184_l2181_l2176_l2201_DUPLICATE_18b3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2193_l2189_l2184_l2181_l2201_DUPLICATE_fee1_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2190_l2185_DUPLICATE_afa9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c878_uxn_opcodes_h_l2171_l2207_DUPLICATE_29ed_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_62ca_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2187_c3_ca54 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2187_c3_ca54;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2178_c3_17de := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2178_c3_17de;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_a4b4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2191_c3_e8b2 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2191_c3_e8b2;
     VAR_sp_relative_shift_uxn_opcodes_h_l2196_c30_4e9e_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_1265_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2201_c11_ec82_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2196_c30_4e9e_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2182_c3_bb9b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2182_c3_bb9b;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_a4b4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_d526_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2201_c7_a4b4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_5ab2_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_6669_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_b954_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_b954_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2196_c30_4e9e_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_6669_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_5ab2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_d526_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_62ca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_1265_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2201_c11_ec82_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_7926_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse := t16;
     -- sp_relative_shift[uxn_opcodes_h_l2196_c30_4e9e] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2196_c30_4e9e_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2196_c30_4e9e_ins;
     sp_relative_shift_uxn_opcodes_h_l2196_c30_4e9e_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2196_c30_4e9e_x;
     sp_relative_shift_uxn_opcodes_h_l2196_c30_4e9e_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2196_c30_4e9e_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2196_c30_4e9e_return_output := sp_relative_shift_uxn_opcodes_h_l2196_c30_4e9e_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2190_l2185_DUPLICATE_afa9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2190_l2185_DUPLICATE_afa9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2193_l2189_l2184_l2181_l2176_DUPLICATE_dc0d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2193_l2189_l2184_l2181_l2176_DUPLICATE_dc0d_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2193_l2189_l2184_l2181_l2201_DUPLICATE_fee1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2193_l2189_l2184_l2181_l2201_DUPLICATE_fee1_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2189_l2184_l2181_l2176_l2201_DUPLICATE_18b3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2189_l2184_l2181_l2176_l2201_DUPLICATE_18b3_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2176_c6_6669] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2176_c6_6669_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_6669_left;
     BIN_OP_EQ_uxn_opcodes_h_l2176_c6_6669_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_6669_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_6669_return_output := BIN_OP_EQ_uxn_opcodes_h_l2176_c6_6669_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2189_c7_9637] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2189_c7_9637_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2181_c11_5ab2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2181_c11_5ab2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_5ab2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2181_c11_5ab2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_5ab2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_5ab2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2181_c11_5ab2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2184_c11_d526] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2184_c11_d526_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_d526_left;
     BIN_OP_EQ_uxn_opcodes_h_l2184_c11_d526_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_d526_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_d526_return_output := BIN_OP_EQ_uxn_opcodes_h_l2184_c11_d526_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2193_l2189_l2184_l2181_l2176_DUPLICATE_c478 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2193_l2189_l2184_l2181_l2176_DUPLICATE_c478_return_output := result.u16_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2193_l2189_l2184_l2181_l2176_DUPLICATE_d5ea LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2193_l2189_l2184_l2181_l2176_DUPLICATE_d5ea_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2201_c11_ec82] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2201_c11_ec82_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2201_c11_ec82_left;
     BIN_OP_EQ_uxn_opcodes_h_l2201_c11_ec82_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2201_c11_ec82_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2201_c11_ec82_return_output := BIN_OP_EQ_uxn_opcodes_h_l2201_c11_ec82_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2193_c11_1265] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2193_c11_1265_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_1265_left;
     BIN_OP_EQ_uxn_opcodes_h_l2193_c11_1265_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_1265_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_1265_return_output := BIN_OP_EQ_uxn_opcodes_h_l2193_c11_1265_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2189_l2184_l2181_l2176_l2201_DUPLICATE_6e40 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2189_l2184_l2181_l2176_l2201_DUPLICATE_6e40_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2189_c11_62ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2189_c11_62ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_62ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l2189_c11_62ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_62ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_62ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l2189_c11_62ca_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_b954_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_6669_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2176_c2_c315_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_6669_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c315_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_6669_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c315_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_6669_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c315_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_6669_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c315_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_6669_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c315_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_6669_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c315_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_6669_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c315_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_6669_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2176_c2_c315_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c6_6669_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2181_c7_b177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_5ab2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_b177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_5ab2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_b177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_5ab2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_b177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_5ab2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_b177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_5ab2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_b177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_5ab2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_b177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_5ab2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_b177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_5ab2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2181_c7_b177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_5ab2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2184_c7_789c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_d526_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_789c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_d526_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_789c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_d526_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_789c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_d526_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_789c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_d526_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_789c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_d526_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_789c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_d526_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_789c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_d526_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2184_c7_789c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_d526_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2189_c7_9637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_62ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_9637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_62ca_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_9637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_62ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_9637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_62ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_9637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_62ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_9637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_62ca_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_9637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_62ca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_9637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_62ca_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2189_c7_9637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2189_c11_62ca_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2193_c7_adfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_1265_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_adfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_1265_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2193_c7_adfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_1265_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_1265_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_1265_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2193_c7_adfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_1265_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2193_c7_adfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_1265_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_a4b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2201_c11_ec82_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2201_c7_a4b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2201_c11_ec82_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_a4b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2201_c11_ec82_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_7926_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2190_l2185_DUPLICATE_afa9_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2186_c3_cc26_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2190_l2185_DUPLICATE_afa9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2193_l2189_l2184_l2181_l2176_DUPLICATE_dc0d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2193_l2189_l2184_l2181_l2176_DUPLICATE_dc0d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2193_l2189_l2184_l2181_l2176_DUPLICATE_dc0d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2193_l2189_l2184_l2181_l2176_DUPLICATE_dc0d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2193_l2189_l2184_l2181_l2176_DUPLICATE_dc0d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2193_l2189_l2184_l2181_l2176_DUPLICATE_c478_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2193_l2189_l2184_l2181_l2176_DUPLICATE_c478_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2193_l2189_l2184_l2181_l2176_DUPLICATE_c478_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2193_l2189_l2184_l2181_l2176_DUPLICATE_c478_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2193_l2189_l2184_l2181_l2176_DUPLICATE_c478_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2193_l2189_l2184_l2181_l2201_DUPLICATE_fee1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2193_l2189_l2184_l2181_l2201_DUPLICATE_fee1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2193_l2189_l2184_l2181_l2201_DUPLICATE_fee1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2193_l2189_l2184_l2181_l2201_DUPLICATE_fee1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_a4b4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2193_l2189_l2184_l2181_l2201_DUPLICATE_fee1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2189_l2184_l2181_l2176_l2201_DUPLICATE_18b3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2189_l2184_l2181_l2176_l2201_DUPLICATE_18b3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2189_l2184_l2181_l2176_l2201_DUPLICATE_18b3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2189_l2184_l2181_l2176_l2201_DUPLICATE_18b3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2201_c7_a4b4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2189_l2184_l2181_l2176_l2201_DUPLICATE_18b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2189_l2184_l2181_l2176_l2201_DUPLICATE_6e40_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2189_l2184_l2181_l2176_l2201_DUPLICATE_6e40_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2189_l2184_l2181_l2176_l2201_DUPLICATE_6e40_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2189_l2184_l2181_l2176_l2201_DUPLICATE_6e40_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_a4b4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2189_l2184_l2181_l2176_l2201_DUPLICATE_6e40_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2193_l2189_l2184_l2181_l2176_DUPLICATE_d5ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2193_l2189_l2184_l2181_l2176_DUPLICATE_d5ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2193_l2189_l2184_l2181_l2176_DUPLICATE_d5ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2193_l2189_l2184_l2181_l2176_DUPLICATE_d5ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2193_l2189_l2184_l2181_l2176_DUPLICATE_d5ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2189_c7_9637_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2196_c30_4e9e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2189_c7_9637] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_9637_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_9637_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_9637_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_9637_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2201_c7_a4b4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2201_c7_a4b4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2201_c7_a4b4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2201_c7_a4b4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2201_c7_a4b4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2201_c7_a4b4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2201_c7_a4b4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2201_c7_a4b4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2201_c7_a4b4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2193_c7_adfb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2193_c7_adfb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2193_c7_adfb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output := result_u8_value_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2176_c1_b954] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_b954_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_b954_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_b954_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_b954_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_b954_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_b954_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_b954_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_b954_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2201_c7_a4b4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_a4b4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_a4b4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_a4b4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_a4b4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_a4b4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_a4b4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_a4b4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_a4b4_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2186_c3_cc26] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2186_c3_cc26_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2186_c3_cc26_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2186_c3_cc26_return_output := CONST_SL_8_uxn_opcodes_h_l2186_c3_cc26_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2190_c3_7926] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2190_c3_7926_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_7926_left;
     BIN_OP_OR_uxn_opcodes_h_l2190_c3_7926_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_7926_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_7926_return_output := BIN_OP_OR_uxn_opcodes_h_l2190_c3_7926_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2201_c7_a4b4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_a4b4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_a4b4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_a4b4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_a4b4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_a4b4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_a4b4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_a4b4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_a4b4_return_output;

     -- n8_MUX[uxn_opcodes_h_l2193_c7_adfb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2193_c7_adfb_cond <= VAR_n8_MUX_uxn_opcodes_h_l2193_c7_adfb_cond;
     n8_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue;
     n8_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output := n8_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2193_c7_adfb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2193_c7_adfb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2193_c7_adfb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output := result_u16_value_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2193_c7_adfb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2190_c3_7926_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2186_c3_cc26_return_output;
     VAR_printf_uxn_opcodes_h_l2177_c3_424a_uxn_opcodes_h_l2177_c3_424a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2176_c1_b954_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2201_c7_a4b4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2201_c7_a4b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2201_c7_a4b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2189_c7_9637_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output;
     -- t16_MUX[uxn_opcodes_h_l2189_c7_9637] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2189_c7_9637_cond <= VAR_t16_MUX_uxn_opcodes_h_l2189_c7_9637_cond;
     t16_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue;
     t16_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2189_c7_9637_return_output := t16_MUX_uxn_opcodes_h_l2189_c7_9637_return_output;

     -- printf_uxn_opcodes_h_l2177_c3_424a[uxn_opcodes_h_l2177_c3_424a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2177_c3_424a_uxn_opcodes_h_l2177_c3_424a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2177_c3_424a_uxn_opcodes_h_l2177_c3_424a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_u8_value_MUX[uxn_opcodes_h_l2189_c7_9637] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2189_c7_9637_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_9637_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_9637_return_output := result_u8_value_MUX_uxn_opcodes_h_l2189_c7_9637_return_output;

     -- n8_MUX[uxn_opcodes_h_l2189_c7_9637] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2189_c7_9637_cond <= VAR_n8_MUX_uxn_opcodes_h_l2189_c7_9637_cond;
     n8_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue;
     n8_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2189_c7_9637_return_output := n8_MUX_uxn_opcodes_h_l2189_c7_9637_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2189_c7_9637] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_9637_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_9637_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_9637_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_9637_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2193_c7_adfb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_adfb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_adfb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2184_c7_789c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_789c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_789c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_789c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_789c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2189_c7_9637] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2189_c7_9637_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_9637_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_9637_return_output := result_u16_value_MUX_uxn_opcodes_h_l2189_c7_9637_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2193_c7_adfb] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2193_c7_adfb_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2193_c7_adfb_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2193_c7_adfb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2189_c7_9637_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_adfb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2189_c7_9637_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_789c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2189_c7_9637_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2189_c7_9637_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2189_c7_9637_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2184_c7_789c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_789c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_789c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_789c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_789c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2184_c7_789c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2184_c7_789c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_789c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_789c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2184_c7_789c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2181_c7_b177] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_b177_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_b177_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_b177_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_b177_return_output;

     -- t16_MUX[uxn_opcodes_h_l2184_c7_789c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2184_c7_789c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2184_c7_789c_cond;
     t16_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue;
     t16_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2184_c7_789c_return_output := t16_MUX_uxn_opcodes_h_l2184_c7_789c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2189_c7_9637] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_9637_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_9637_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_9637_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_9637_return_output;

     -- n8_MUX[uxn_opcodes_h_l2184_c7_789c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2184_c7_789c_cond <= VAR_n8_MUX_uxn_opcodes_h_l2184_c7_789c_cond;
     n8_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue;
     n8_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2184_c7_789c_return_output := n8_MUX_uxn_opcodes_h_l2184_c7_789c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2189_c7_9637] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_9637_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_9637_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_9637_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_9637_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2184_c7_789c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2184_c7_789c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_789c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_789c_return_output := result_u16_value_MUX_uxn_opcodes_h_l2184_c7_789c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2189_c7_9637] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_9637_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_9637_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_9637_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_9637_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_9637_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_9637_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2184_c7_789c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2189_c7_9637_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2189_c7_9637_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2189_c7_9637_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_789c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_b177_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_789c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_789c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2184_c7_789c_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2184_c7_789c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_789c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_789c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_789c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_789c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2181_c7_b177] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_b177_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_b177_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_b177_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_b177_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2184_c7_789c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_789c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_789c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_789c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_789c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2181_c7_b177] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2181_c7_b177_cond <= VAR_t16_MUX_uxn_opcodes_h_l2181_c7_b177_cond;
     t16_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue;
     t16_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2181_c7_b177_return_output := t16_MUX_uxn_opcodes_h_l2181_c7_b177_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2181_c7_b177] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2181_c7_b177_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_b177_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_b177_return_output := result_u8_value_MUX_uxn_opcodes_h_l2181_c7_b177_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2184_c7_789c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_789c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_789c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_789c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_789c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_789c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_789c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2181_c7_b177] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2181_c7_b177_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_b177_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_b177_return_output := result_u16_value_MUX_uxn_opcodes_h_l2181_c7_b177_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2176_c2_c315] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c315_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c315_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c315_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c315_return_output;

     -- n8_MUX[uxn_opcodes_h_l2181_c7_b177] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2181_c7_b177_cond <= VAR_n8_MUX_uxn_opcodes_h_l2181_c7_b177_cond;
     n8_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue;
     n8_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2181_c7_b177_return_output := n8_MUX_uxn_opcodes_h_l2181_c7_b177_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2181_c7_b177_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_789c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_789c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_789c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_b177_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_b177_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_b177_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2181_c7_b177_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2181_c7_b177] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_b177_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_b177_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_b177_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_b177_return_output;

     -- t16_MUX[uxn_opcodes_h_l2176_c2_c315] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2176_c2_c315_cond <= VAR_t16_MUX_uxn_opcodes_h_l2176_c2_c315_cond;
     t16_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue;
     t16_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2176_c2_c315_return_output := t16_MUX_uxn_opcodes_h_l2176_c2_c315_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2176_c2_c315] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c315_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c315_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c315_return_output := result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c315_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2176_c2_c315] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c315_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c315_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c315_return_output := result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c315_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2181_c7_b177] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_b177_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_b177_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_b177_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_b177_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2181_c7_b177] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_b177_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_b177_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_b177_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_b177_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_b177_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_b177_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2176_c2_c315] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c315_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c315_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c315_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c315_return_output;

     -- n8_MUX[uxn_opcodes_h_l2176_c2_c315] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2176_c2_c315_cond <= VAR_n8_MUX_uxn_opcodes_h_l2176_c2_c315_cond;
     n8_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue;
     n8_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2176_c2_c315_return_output := n8_MUX_uxn_opcodes_h_l2176_c2_c315_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2176_c2_c315_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_b177_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_b177_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_b177_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2176_c2_c315_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2176_c2_c315] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c315_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c315_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c315_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c315_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2176_c2_c315] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c315_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c315_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c315_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c315_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2176_c2_c315] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c315_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c315_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c315_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c315_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c315_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c315_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c878_uxn_opcodes_h_l2171_l2207_DUPLICATE_29ed LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c878_uxn_opcodes_h_l2171_l2207_DUPLICATE_29ed_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c878(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c2_c315_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c2_c315_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c2_c315_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c2_c315_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c2_c315_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c2_c315_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c2_c315_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c878_uxn_opcodes_h_l2171_l2207_DUPLICATE_29ed_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c878_uxn_opcodes_h_l2171_l2207_DUPLICATE_29ed_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
