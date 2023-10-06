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
-- Submodules: 100
entity ldr2_0CLK_05af43a3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldr2_0CLK_05af43a3;
architecture arch of ldr2_0CLK_05af43a3 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1891_c6_0077]
signal BIN_OP_EQ_uxn_opcodes_h_l1891_c6_0077_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1891_c6_0077_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1891_c6_0077_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1891_c1_d542]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d542_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d542_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d542_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d542_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1891_c2_5cc9]
signal t8_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1891_c2_5cc9]
signal tmp16_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1891_c2_5cc9]
signal result_stack_value_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1891_c2_5cc9]
signal result_ram_addr_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1891_c2_5cc9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1891_c2_5cc9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1891_c2_5cc9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1891_c2_5cc9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1891_c2_5cc9]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1891_c2_5cc9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1891_c2_5cc9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1892_c3_a31d[uxn_opcodes_h_l1892_c3_a31d]
signal printf_uxn_opcodes_h_l1892_c3_a31d_uxn_opcodes_h_l1892_c3_a31d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1897_c11_8b32]
signal BIN_OP_EQ_uxn_opcodes_h_l1897_c11_8b32_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1897_c11_8b32_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1897_c11_8b32_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1897_c7_2761]
signal t8_MUX_uxn_opcodes_h_l1897_c7_2761_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1897_c7_2761_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1897_c7_2761]
signal tmp16_MUX_uxn_opcodes_h_l1897_c7_2761_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1897_c7_2761_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1897_c7_2761]
signal result_stack_value_MUX_uxn_opcodes_h_l1897_c7_2761_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1897_c7_2761_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1897_c7_2761]
signal result_ram_addr_MUX_uxn_opcodes_h_l1897_c7_2761_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1897_c7_2761_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1897_c7_2761]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_2761_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_2761_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1897_c7_2761]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1897_c7_2761_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1897_c7_2761_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1897_c7_2761]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_2761_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_2761_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1897_c7_2761]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1897_c7_2761_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1897_c7_2761_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1897_c7_2761]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1897_c7_2761_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1897_c7_2761_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1897_c7_2761]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_2761_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_2761_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1897_c7_2761]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1897_c7_2761_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1897_c7_2761_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1900_c11_75c2]
signal BIN_OP_EQ_uxn_opcodes_h_l1900_c11_75c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1900_c11_75c2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1900_c11_75c2_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1900_c7_b8ec]
signal t8_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1900_c7_b8ec]
signal tmp16_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1900_c7_b8ec]
signal result_stack_value_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1900_c7_b8ec]
signal result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1900_c7_b8ec]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1900_c7_b8ec]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1900_c7_b8ec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1900_c7_b8ec]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1900_c7_b8ec]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1900_c7_b8ec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1900_c7_b8ec]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1904_c32_beba]
signal BIN_OP_AND_uxn_opcodes_h_l1904_c32_beba_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1904_c32_beba_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1904_c32_beba_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1904_c32_48e2]
signal BIN_OP_GT_uxn_opcodes_h_l1904_c32_48e2_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1904_c32_48e2_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1904_c32_48e2_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1904_c32_c82f]
signal MUX_uxn_opcodes_h_l1904_c32_c82f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1904_c32_c82f_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1904_c32_c82f_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1904_c32_c82f_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1906_c11_df96]
signal BIN_OP_EQ_uxn_opcodes_h_l1906_c11_df96_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1906_c11_df96_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1906_c11_df96_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1906_c7_121a]
signal tmp16_MUX_uxn_opcodes_h_l1906_c7_121a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1906_c7_121a_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1906_c7_121a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_121a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_121a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1906_c7_121a]
signal result_stack_value_MUX_uxn_opcodes_h_l1906_c7_121a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1906_c7_121a_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1906_c7_121a]
signal result_ram_addr_MUX_uxn_opcodes_h_l1906_c7_121a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1906_c7_121a_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1906_c7_121a]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1906_c7_121a_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1906_c7_121a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1906_c7_121a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_121a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_121a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1906_c7_121a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_121a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_121a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1906_c7_121a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_121a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_121a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1911_c11_517b]
signal BIN_OP_EQ_uxn_opcodes_h_l1911_c11_517b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1911_c11_517b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1911_c11_517b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1911_c7_50c8]
signal tmp16_MUX_uxn_opcodes_h_l1911_c7_50c8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1911_c7_50c8]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1911_c7_50c8_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1911_c7_50c8]
signal result_stack_value_MUX_uxn_opcodes_h_l1911_c7_50c8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1911_c7_50c8]
signal result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_50c8_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1911_c7_50c8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_50c8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1911_c7_50c8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_50c8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1911_c7_50c8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_50c8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1914_c11_795f]
signal BIN_OP_EQ_uxn_opcodes_h_l1914_c11_795f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1914_c11_795f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1914_c11_795f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1914_c7_010e]
signal tmp16_MUX_uxn_opcodes_h_l1914_c7_010e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1914_c7_010e_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1914_c7_010e]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1914_c7_010e_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1914_c7_010e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1914_c7_010e]
signal result_stack_value_MUX_uxn_opcodes_h_l1914_c7_010e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1914_c7_010e_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1914_c7_010e]
signal result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_010e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_010e_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1914_c7_010e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_010e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_010e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1914_c7_010e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_010e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_010e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1914_c7_010e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_010e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_010e_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1916_c3_f9af]
signal CONST_SL_8_uxn_opcodes_h_l1916_c3_f9af_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1916_c3_f9af_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1917_c21_f005]
signal BIN_OP_PLUS_uxn_opcodes_h_l1917_c21_f005_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1917_c21_f005_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1917_c21_f005_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1919_c11_5cd5]
signal BIN_OP_EQ_uxn_opcodes_h_l1919_c11_5cd5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1919_c11_5cd5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1919_c11_5cd5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1919_c7_f350]
signal tmp16_MUX_uxn_opcodes_h_l1919_c7_f350_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1919_c7_f350_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1919_c7_f350]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1919_c7_f350_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1919_c7_f350_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1919_c7_f350]
signal result_stack_value_MUX_uxn_opcodes_h_l1919_c7_f350_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1919_c7_f350_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1919_c7_f350]
signal result_ram_addr_MUX_uxn_opcodes_h_l1919_c7_f350_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1919_c7_f350_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1919_c7_f350]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_f350_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_f350_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1919_c7_f350]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_f350_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_f350_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1919_c7_f350]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_f350_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_f350_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1920_c21_3869]
signal BIN_OP_PLUS_uxn_opcodes_h_l1920_c21_3869_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1920_c21_3869_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1920_c21_3869_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1922_c11_a8bd]
signal BIN_OP_EQ_uxn_opcodes_h_l1922_c11_a8bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1922_c11_a8bd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1922_c11_a8bd_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1922_c7_e843]
signal tmp16_MUX_uxn_opcodes_h_l1922_c7_e843_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1922_c7_e843_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1922_c7_e843]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1922_c7_e843_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1922_c7_e843_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1922_c7_e843]
signal result_stack_value_MUX_uxn_opcodes_h_l1922_c7_e843_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1922_c7_e843_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1922_c7_e843]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1922_c7_e843_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1922_c7_e843_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1922_c7_e843]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1922_c7_e843_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1922_c7_e843_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1922_c7_e843]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1922_c7_e843_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1922_c7_e843_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1923_c3_1e41]
signal BIN_OP_OR_uxn_opcodes_h_l1923_c3_1e41_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1923_c3_1e41_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1923_c3_1e41_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1929_c11_61ce]
signal BIN_OP_EQ_uxn_opcodes_h_l1929_c11_61ce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1929_c11_61ce_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1929_c11_61ce_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1929_c7_a512]
signal result_stack_value_MUX_uxn_opcodes_h_l1929_c7_a512_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1929_c7_a512_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1929_c7_a512_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1929_c7_a512_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1929_c7_a512]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_a512_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_a512_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_a512_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_a512_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1929_c7_a512]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_a512_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_a512_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_a512_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_a512_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1929_c7_a512]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_a512_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_a512_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_a512_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_a512_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1931_c34_d09b]
signal CONST_SR_8_uxn_opcodes_h_l1931_c34_d09b_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1931_c34_d09b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1933_c11_15d5]
signal BIN_OP_EQ_uxn_opcodes_h_l1933_c11_15d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1933_c11_15d5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1933_c11_15d5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1933_c7_3f9b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_3f9b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_3f9b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_3f9b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_3f9b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1933_c7_3f9b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_3f9b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_3f9b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_3f9b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_3f9b_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1909_l1920_l1917_l1912_DUPLICATE_4eeb
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1909_l1920_l1917_l1912_DUPLICATE_4eeb_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1909_l1920_l1917_l1912_DUPLICATE_4eeb_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1909_l1920_l1917_l1912_DUPLICATE_4eeb_return_output : signed(17 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.ram_addr := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.is_ram_read := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.is_stack_read := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1891_c6_0077
BIN_OP_EQ_uxn_opcodes_h_l1891_c6_0077 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1891_c6_0077_left,
BIN_OP_EQ_uxn_opcodes_h_l1891_c6_0077_right,
BIN_OP_EQ_uxn_opcodes_h_l1891_c6_0077_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d542
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d542 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d542_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d542_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d542_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d542_return_output);

-- t8_MUX_uxn_opcodes_h_l1891_c2_5cc9
t8_MUX_uxn_opcodes_h_l1891_c2_5cc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond,
t8_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue,
t8_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse,
t8_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1891_c2_5cc9
tmp16_MUX_uxn_opcodes_h_l1891_c2_5cc9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond,
tmp16_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue,
tmp16_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse,
tmp16_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1891_c2_5cc9
result_stack_value_MUX_uxn_opcodes_h_l1891_c2_5cc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond,
result_stack_value_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1891_c2_5cc9
result_ram_addr_MUX_uxn_opcodes_h_l1891_c2_5cc9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1891_c2_5cc9
result_is_stack_write_MUX_uxn_opcodes_h_l1891_c2_5cc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c2_5cc9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c2_5cc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9
result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1891_c2_5cc9
result_is_ram_read_MUX_uxn_opcodes_h_l1891_c2_5cc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1891_c2_5cc9
result_is_opc_done_MUX_uxn_opcodes_h_l1891_c2_5cc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1891_c2_5cc9
result_is_stack_read_MUX_uxn_opcodes_h_l1891_c2_5cc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output);

-- printf_uxn_opcodes_h_l1892_c3_a31d_uxn_opcodes_h_l1892_c3_a31d
printf_uxn_opcodes_h_l1892_c3_a31d_uxn_opcodes_h_l1892_c3_a31d : entity work.printf_uxn_opcodes_h_l1892_c3_a31d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1892_c3_a31d_uxn_opcodes_h_l1892_c3_a31d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1897_c11_8b32
BIN_OP_EQ_uxn_opcodes_h_l1897_c11_8b32 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1897_c11_8b32_left,
BIN_OP_EQ_uxn_opcodes_h_l1897_c11_8b32_right,
BIN_OP_EQ_uxn_opcodes_h_l1897_c11_8b32_return_output);

-- t8_MUX_uxn_opcodes_h_l1897_c7_2761
t8_MUX_uxn_opcodes_h_l1897_c7_2761 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1897_c7_2761_cond,
t8_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue,
t8_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse,
t8_MUX_uxn_opcodes_h_l1897_c7_2761_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1897_c7_2761
tmp16_MUX_uxn_opcodes_h_l1897_c7_2761 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1897_c7_2761_cond,
tmp16_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue,
tmp16_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse,
tmp16_MUX_uxn_opcodes_h_l1897_c7_2761_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1897_c7_2761
result_stack_value_MUX_uxn_opcodes_h_l1897_c7_2761 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1897_c7_2761_cond,
result_stack_value_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1897_c7_2761_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1897_c7_2761
result_ram_addr_MUX_uxn_opcodes_h_l1897_c7_2761 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1897_c7_2761_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1897_c7_2761_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_2761
result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_2761 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_2761_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_2761_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1897_c7_2761
result_sp_relative_shift_MUX_uxn_opcodes_h_l1897_c7_2761 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1897_c7_2761_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1897_c7_2761_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_2761
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_2761 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_2761_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_2761_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1897_c7_2761
result_is_sp_shift_MUX_uxn_opcodes_h_l1897_c7_2761 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1897_c7_2761_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1897_c7_2761_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1897_c7_2761
result_is_ram_read_MUX_uxn_opcodes_h_l1897_c7_2761 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1897_c7_2761_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1897_c7_2761_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_2761
result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_2761 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_2761_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_2761_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1897_c7_2761
result_is_stack_read_MUX_uxn_opcodes_h_l1897_c7_2761 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1897_c7_2761_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1897_c7_2761_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1900_c11_75c2
BIN_OP_EQ_uxn_opcodes_h_l1900_c11_75c2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1900_c11_75c2_left,
BIN_OP_EQ_uxn_opcodes_h_l1900_c11_75c2_right,
BIN_OP_EQ_uxn_opcodes_h_l1900_c11_75c2_return_output);

-- t8_MUX_uxn_opcodes_h_l1900_c7_b8ec
t8_MUX_uxn_opcodes_h_l1900_c7_b8ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond,
t8_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue,
t8_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse,
t8_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1900_c7_b8ec
tmp16_MUX_uxn_opcodes_h_l1900_c7_b8ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond,
tmp16_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue,
tmp16_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse,
tmp16_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1900_c7_b8ec
result_stack_value_MUX_uxn_opcodes_h_l1900_c7_b8ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond,
result_stack_value_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_b8ec
result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_b8ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_b8ec
result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_b8ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec
result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_b8ec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_b8ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec
result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1900_c7_b8ec
result_is_ram_read_MUX_uxn_opcodes_h_l1900_c7_b8ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_b8ec
result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_b8ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1900_c7_b8ec
result_is_stack_read_MUX_uxn_opcodes_h_l1900_c7_b8ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1904_c32_beba
BIN_OP_AND_uxn_opcodes_h_l1904_c32_beba : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1904_c32_beba_left,
BIN_OP_AND_uxn_opcodes_h_l1904_c32_beba_right,
BIN_OP_AND_uxn_opcodes_h_l1904_c32_beba_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1904_c32_48e2
BIN_OP_GT_uxn_opcodes_h_l1904_c32_48e2 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1904_c32_48e2_left,
BIN_OP_GT_uxn_opcodes_h_l1904_c32_48e2_right,
BIN_OP_GT_uxn_opcodes_h_l1904_c32_48e2_return_output);

-- MUX_uxn_opcodes_h_l1904_c32_c82f
MUX_uxn_opcodes_h_l1904_c32_c82f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1904_c32_c82f_cond,
MUX_uxn_opcodes_h_l1904_c32_c82f_iftrue,
MUX_uxn_opcodes_h_l1904_c32_c82f_iffalse,
MUX_uxn_opcodes_h_l1904_c32_c82f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1906_c11_df96
BIN_OP_EQ_uxn_opcodes_h_l1906_c11_df96 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1906_c11_df96_left,
BIN_OP_EQ_uxn_opcodes_h_l1906_c11_df96_right,
BIN_OP_EQ_uxn_opcodes_h_l1906_c11_df96_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1906_c7_121a
tmp16_MUX_uxn_opcodes_h_l1906_c7_121a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1906_c7_121a_cond,
tmp16_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1906_c7_121a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_121a
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_121a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_121a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_121a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1906_c7_121a
result_stack_value_MUX_uxn_opcodes_h_l1906_c7_121a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1906_c7_121a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1906_c7_121a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1906_c7_121a
result_ram_addr_MUX_uxn_opcodes_h_l1906_c7_121a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1906_c7_121a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1906_c7_121a_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1906_c7_121a
result_is_ram_read_MUX_uxn_opcodes_h_l1906_c7_121a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1906_c7_121a_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1906_c7_121a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_121a
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_121a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_121a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_121a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_121a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_121a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_121a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_121a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_121a
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_121a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_121a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_121a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1911_c11_517b
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_517b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_517b_left,
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_517b_right,
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_517b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1911_c7_50c8
tmp16_MUX_uxn_opcodes_h_l1911_c7_50c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1911_c7_50c8_cond,
tmp16_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue,
tmp16_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse,
tmp16_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1911_c7_50c8
result_is_ram_read_MUX_uxn_opcodes_h_l1911_c7_50c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1911_c7_50c8_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1911_c7_50c8
result_stack_value_MUX_uxn_opcodes_h_l1911_c7_50c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1911_c7_50c8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_50c8
result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_50c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_50c8_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_50c8
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_50c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_50c8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_50c8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_50c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_50c8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_50c8
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_50c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_50c8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1914_c11_795f
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_795f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_795f_left,
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_795f_right,
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_795f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1914_c7_010e
tmp16_MUX_uxn_opcodes_h_l1914_c7_010e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1914_c7_010e_cond,
tmp16_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1914_c7_010e_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1914_c7_010e
result_is_ram_read_MUX_uxn_opcodes_h_l1914_c7_010e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1914_c7_010e_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1914_c7_010e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1914_c7_010e
result_stack_value_MUX_uxn_opcodes_h_l1914_c7_010e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1914_c7_010e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1914_c7_010e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_010e
result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_010e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_010e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_010e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_010e
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_010e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_010e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_010e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_010e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_010e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_010e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_010e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_010e
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_010e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_010e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_010e_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1916_c3_f9af
CONST_SL_8_uxn_opcodes_h_l1916_c3_f9af : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1916_c3_f9af_x,
CONST_SL_8_uxn_opcodes_h_l1916_c3_f9af_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1917_c21_f005
BIN_OP_PLUS_uxn_opcodes_h_l1917_c21_f005 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1917_c21_f005_left,
BIN_OP_PLUS_uxn_opcodes_h_l1917_c21_f005_right,
BIN_OP_PLUS_uxn_opcodes_h_l1917_c21_f005_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1919_c11_5cd5
BIN_OP_EQ_uxn_opcodes_h_l1919_c11_5cd5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1919_c11_5cd5_left,
BIN_OP_EQ_uxn_opcodes_h_l1919_c11_5cd5_right,
BIN_OP_EQ_uxn_opcodes_h_l1919_c11_5cd5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1919_c7_f350
tmp16_MUX_uxn_opcodes_h_l1919_c7_f350 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1919_c7_f350_cond,
tmp16_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue,
tmp16_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse,
tmp16_MUX_uxn_opcodes_h_l1919_c7_f350_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1919_c7_f350
result_is_ram_read_MUX_uxn_opcodes_h_l1919_c7_f350 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1919_c7_f350_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1919_c7_f350_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1919_c7_f350
result_stack_value_MUX_uxn_opcodes_h_l1919_c7_f350 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1919_c7_f350_cond,
result_stack_value_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1919_c7_f350_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1919_c7_f350
result_ram_addr_MUX_uxn_opcodes_h_l1919_c7_f350 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1919_c7_f350_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1919_c7_f350_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_f350
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_f350 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_f350_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_f350_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_f350
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_f350 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_f350_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_f350_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_f350
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_f350 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_f350_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_f350_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1920_c21_3869
BIN_OP_PLUS_uxn_opcodes_h_l1920_c21_3869 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1920_c21_3869_left,
BIN_OP_PLUS_uxn_opcodes_h_l1920_c21_3869_right,
BIN_OP_PLUS_uxn_opcodes_h_l1920_c21_3869_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1922_c11_a8bd
BIN_OP_EQ_uxn_opcodes_h_l1922_c11_a8bd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1922_c11_a8bd_left,
BIN_OP_EQ_uxn_opcodes_h_l1922_c11_a8bd_right,
BIN_OP_EQ_uxn_opcodes_h_l1922_c11_a8bd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1922_c7_e843
tmp16_MUX_uxn_opcodes_h_l1922_c7_e843 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1922_c7_e843_cond,
tmp16_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue,
tmp16_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse,
tmp16_MUX_uxn_opcodes_h_l1922_c7_e843_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1922_c7_e843
result_is_ram_read_MUX_uxn_opcodes_h_l1922_c7_e843 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1922_c7_e843_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1922_c7_e843_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1922_c7_e843
result_stack_value_MUX_uxn_opcodes_h_l1922_c7_e843 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1922_c7_e843_cond,
result_stack_value_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1922_c7_e843_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1922_c7_e843
result_is_stack_write_MUX_uxn_opcodes_h_l1922_c7_e843 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1922_c7_e843_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1922_c7_e843_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1922_c7_e843
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1922_c7_e843 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1922_c7_e843_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1922_c7_e843_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1922_c7_e843
result_is_opc_done_MUX_uxn_opcodes_h_l1922_c7_e843 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1922_c7_e843_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1922_c7_e843_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1923_c3_1e41
BIN_OP_OR_uxn_opcodes_h_l1923_c3_1e41 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1923_c3_1e41_left,
BIN_OP_OR_uxn_opcodes_h_l1923_c3_1e41_right,
BIN_OP_OR_uxn_opcodes_h_l1923_c3_1e41_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1929_c11_61ce
BIN_OP_EQ_uxn_opcodes_h_l1929_c11_61ce : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1929_c11_61ce_left,
BIN_OP_EQ_uxn_opcodes_h_l1929_c11_61ce_right,
BIN_OP_EQ_uxn_opcodes_h_l1929_c11_61ce_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1929_c7_a512
result_stack_value_MUX_uxn_opcodes_h_l1929_c7_a512 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1929_c7_a512_cond,
result_stack_value_MUX_uxn_opcodes_h_l1929_c7_a512_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1929_c7_a512_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1929_c7_a512_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_a512
result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_a512 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_a512_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_a512_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_a512_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_a512_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_a512
result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_a512 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_a512_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_a512_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_a512_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_a512_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_a512
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_a512 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_a512_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_a512_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_a512_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_a512_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1931_c34_d09b
CONST_SR_8_uxn_opcodes_h_l1931_c34_d09b : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1931_c34_d09b_x,
CONST_SR_8_uxn_opcodes_h_l1931_c34_d09b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1933_c11_15d5
BIN_OP_EQ_uxn_opcodes_h_l1933_c11_15d5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1933_c11_15d5_left,
BIN_OP_EQ_uxn_opcodes_h_l1933_c11_15d5_right,
BIN_OP_EQ_uxn_opcodes_h_l1933_c11_15d5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_3f9b
result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_3f9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_3f9b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_3f9b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_3f9b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_3f9b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_3f9b
result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_3f9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_3f9b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_3f9b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_3f9b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_3f9b_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1909_l1920_l1917_l1912_DUPLICATE_4eeb
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1909_l1920_l1917_l1912_DUPLICATE_4eeb : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1909_l1920_l1917_l1912_DUPLICATE_4eeb_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1909_l1920_l1917_l1912_DUPLICATE_4eeb_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1909_l1920_l1917_l1912_DUPLICATE_4eeb_return_output);



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
 t8,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1891_c6_0077_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d542_return_output,
 t8_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output,
 tmp16_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1897_c11_8b32_return_output,
 t8_MUX_uxn_opcodes_h_l1897_c7_2761_return_output,
 tmp16_MUX_uxn_opcodes_h_l1897_c7_2761_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1897_c7_2761_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1897_c7_2761_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_2761_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1897_c7_2761_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_2761_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1897_c7_2761_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1897_c7_2761_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_2761_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1897_c7_2761_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1900_c11_75c2_return_output,
 t8_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output,
 tmp16_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1904_c32_beba_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1904_c32_48e2_return_output,
 MUX_uxn_opcodes_h_l1904_c32_c82f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1906_c11_df96_return_output,
 tmp16_MUX_uxn_opcodes_h_l1906_c7_121a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_121a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1906_c7_121a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1906_c7_121a_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1906_c7_121a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_121a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_121a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_121a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1911_c11_517b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1914_c11_795f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1914_c7_010e_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1914_c7_010e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1914_c7_010e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_010e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_010e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_010e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_010e_return_output,
 CONST_SL_8_uxn_opcodes_h_l1916_c3_f9af_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1917_c21_f005_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1919_c11_5cd5_return_output,
 tmp16_MUX_uxn_opcodes_h_l1919_c7_f350_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1919_c7_f350_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1919_c7_f350_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1919_c7_f350_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_f350_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_f350_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_f350_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1920_c21_3869_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1922_c11_a8bd_return_output,
 tmp16_MUX_uxn_opcodes_h_l1922_c7_e843_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1922_c7_e843_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1922_c7_e843_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1922_c7_e843_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1922_c7_e843_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1922_c7_e843_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1923_c3_1e41_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1929_c11_61ce_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1929_c7_a512_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_a512_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_a512_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_a512_return_output,
 CONST_SR_8_uxn_opcodes_h_l1931_c34_d09b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1933_c11_15d5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_3f9b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_3f9b_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1909_l1920_l1917_l1912_DUPLICATE_4eeb_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c6_0077_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c6_0077_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c6_0077_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d542_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d542_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d542_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d542_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1897_c7_2761_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1897_c7_2761_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1897_c7_2761_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1897_c7_2761_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_2761_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1897_c7_2761_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1894_c3_4903 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_2761_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1897_c7_2761_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1897_c7_2761_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_2761_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1897_c7_2761_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1892_c3_a31d_uxn_opcodes_h_l1892_c3_a31d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_8b32_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_8b32_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_8b32_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1897_c7_2761_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1897_c7_2761_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1897_c7_2761_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1897_c7_2761_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_2761_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1897_c7_2761_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1898_c3_535c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_2761_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1897_c7_2761_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1897_c7_2761_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_2761_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1897_c7_2761_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_75c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_75c2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_75c2_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1906_c7_121a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1906_c7_121a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1906_c7_121a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_121a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_121a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_121a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1906_c7_121a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_121a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1904_c32_c82f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1904_c32_c82f_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1904_c32_c82f_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1904_c32_beba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1904_c32_beba_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1904_c32_beba_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1904_c32_48e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1904_c32_48e2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1904_c32_48e2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1904_c32_c82f_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_df96_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_df96_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_df96_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1906_c7_121a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_121a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1906_c7_121a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1909_c3_d49c : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1906_c7_121a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1906_c7_121a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_121a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_121a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_121a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_517b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_517b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_517b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_010e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_50c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1914_c7_010e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1911_c7_50c8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c7_010e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_50c8_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1912_c3_1606 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_010e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_50c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_010e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_50c8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_010e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_50c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_010e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_50c8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_795f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_795f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_795f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_f350_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_010e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1919_c7_f350_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1914_c7_010e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1919_c7_f350_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c7_010e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1917_c3_1589 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1919_c7_f350_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_010e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_f350_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_010e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_f350_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_010e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_f350_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_010e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1916_c3_f9af_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1916_c3_f9af_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1917_c21_f005_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1917_c21_f005_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1917_c21_f005_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_5cd5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_5cd5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_5cd5_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1922_c7_e843_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_f350_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1922_c7_e843_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1919_c7_f350_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1922_c7_e843_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1919_c7_f350_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1920_c3_3174 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1919_c7_f350_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1922_c7_e843_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_f350_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1922_c7_e843_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_f350_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1922_c7_e843_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_f350_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1920_c21_3869_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1920_c21_3869_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1920_c21_3869_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1922_c11_a8bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1922_c11_a8bd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1922_c11_a8bd_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1922_c7_e843_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1922_c7_e843_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1929_c7_a512_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1922_c7_e843_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_a512_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1922_c7_e843_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1926_c3_b627 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_a512_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1922_c7_e843_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_a512_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1922_c7_e843_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1923_c3_1e41_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1923_c3_1e41_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1923_c3_1e41_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1927_c24_4a28_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_61ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_61ce_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_61ce_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1929_c7_a512_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1929_c7_a512_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1929_c7_a512_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_a512_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_a512_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_3f9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_a512_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_a512_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_a512_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_3f9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_a512_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_a512_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1930_c3_202e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_a512_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_a512_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1931_c34_d09b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1931_c34_d09b_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1931_c24_969f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_15d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_15d5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_15d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_3f9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_3f9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_3f9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_3f9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_3f9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_3f9b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1906_l1900_l1929_l1897_l1891_l1919_l1914_l1911_DUPLICATE_cad9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1919_l1897_l1900_l1891_DUPLICATE_4668_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1906_l1933_l1900_l1929_l1897_l1891_l1919_l1914_l1911_DUPLICATE_0343_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1897_l1900_l1891_DUPLICATE_65ba_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1906_l1897_l1891_DUPLICATE_ea8b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1900_l1897_l1922_l1891_l1919_l1914_l1911_DUPLICATE_bb61_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1906_l1933_l1900_l1929_l1897_l1922_l1919_l1914_l1911_DUPLICATE_0f90_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1897_l1900_DUPLICATE_73c0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1906_l1900_l1929_l1919_l1914_l1911_DUPLICATE_40ef_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1912_l1920_l1917_l1909_DUPLICATE_5c97_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1909_l1920_l1917_l1912_DUPLICATE_4eeb_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1909_l1920_l1917_l1912_DUPLICATE_4eeb_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1909_l1920_l1917_l1912_DUPLICATE_4eeb_return_output : signed(17 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1915_l1923_DUPLICATE_63bd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2_uxn_opcodes_h_l1938_l1886_DUPLICATE_8a4d_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_3f9b_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1904_c32_48e2_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1904_c32_c82f_iffalse := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1917_c21_f005_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d542_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1922_c11_a8bd_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_75c2_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_5cd5_right := to_unsigned(6, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1904_c32_beba_right := to_unsigned(128, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_795f_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_61ce_right := to_unsigned(8, 4);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1904_c32_c82f_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1898_c3_535c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1898_c3_535c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_8b32_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1920_c21_3869_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1894_c3_4903 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1894_c3_4903;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_517b_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c6_0077_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_df96_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_15d5_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1926_c3_b627 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1926_c3_b627;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1930_c3_202e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_a512_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1930_c3_202e;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_3f9b_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d542_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1904_c32_beba_left := VAR_ins;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1909_l1920_l1917_l1912_DUPLICATE_4eeb_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c6_0077_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_8b32_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_75c2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_df96_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_517b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_795f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_5cd5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1922_c11_a8bd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_61ce_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_15d5_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1923_c3_1e41_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1931_c34_d09b_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1906_l1897_l1891_DUPLICATE_ea8b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1906_l1897_l1891_DUPLICATE_ea8b_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1922_c11_a8bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1922_c11_a8bd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1922_c11_a8bd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1922_c11_a8bd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1922_c11_a8bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1922_c11_a8bd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1922_c11_a8bd_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1904_c32_beba] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1904_c32_beba_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1904_c32_beba_left;
     BIN_OP_AND_uxn_opcodes_h_l1904_c32_beba_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1904_c32_beba_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1904_c32_beba_return_output := BIN_OP_AND_uxn_opcodes_h_l1904_c32_beba_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1906_l1900_l1929_l1897_l1891_l1919_l1914_l1911_DUPLICATE_cad9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1906_l1900_l1929_l1897_l1891_l1919_l1914_l1911_DUPLICATE_cad9_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1900_c11_75c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1900_c11_75c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_75c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1900_c11_75c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_75c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_75c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1900_c11_75c2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1919_c11_5cd5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1919_c11_5cd5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_5cd5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1919_c11_5cd5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_5cd5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_5cd5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1919_c11_5cd5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1906_c11_df96] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1906_c11_df96_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_df96_left;
     BIN_OP_EQ_uxn_opcodes_h_l1906_c11_df96_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_df96_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_df96_return_output := BIN_OP_EQ_uxn_opcodes_h_l1906_c11_df96_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1919_l1897_l1900_l1891_DUPLICATE_4668 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1919_l1897_l1900_l1891_DUPLICATE_4668_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l1929_c11_61ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1929_c11_61ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_61ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l1929_c11_61ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_61ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_61ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l1929_c11_61ce_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1906_l1933_l1900_l1929_l1897_l1891_l1919_l1914_l1911_DUPLICATE_0343 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1906_l1933_l1900_l1929_l1897_l1891_l1919_l1914_l1911_DUPLICATE_0343_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1897_l1900_DUPLICATE_73c0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1897_l1900_DUPLICATE_73c0_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1897_c11_8b32] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1897_c11_8b32_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_8b32_left;
     BIN_OP_EQ_uxn_opcodes_h_l1897_c11_8b32_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_8b32_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_8b32_return_output := BIN_OP_EQ_uxn_opcodes_h_l1897_c11_8b32_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1891_c6_0077] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1891_c6_0077_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c6_0077_left;
     BIN_OP_EQ_uxn_opcodes_h_l1891_c6_0077_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c6_0077_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c6_0077_return_output := BIN_OP_EQ_uxn_opcodes_h_l1891_c6_0077_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1914_c11_795f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1914_c11_795f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_795f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1914_c11_795f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_795f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_795f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1914_c11_795f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1933_c11_15d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1933_c11_15d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_15d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1933_c11_15d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_15d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_15d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1933_c11_15d5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1911_c11_517b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1911_c11_517b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_517b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1911_c11_517b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_517b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_517b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1911_c11_517b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1906_l1933_l1900_l1929_l1897_l1922_l1919_l1914_l1911_DUPLICATE_0f90 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1906_l1933_l1900_l1929_l1897_l1922_l1919_l1914_l1911_DUPLICATE_0f90_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1915_l1923_DUPLICATE_63bd LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1915_l1923_DUPLICATE_63bd_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1906_l1900_l1929_l1919_l1914_l1911_DUPLICATE_40ef LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1906_l1900_l1929_l1919_l1914_l1911_DUPLICATE_40ef_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1897_l1900_l1891_DUPLICATE_65ba LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1897_l1900_l1891_DUPLICATE_65ba_return_output := result.sp_relative_shift;

     -- CONST_SR_8[uxn_opcodes_h_l1931_c34_d09b] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1931_c34_d09b_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1931_c34_d09b_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1931_c34_d09b_return_output := CONST_SR_8_uxn_opcodes_h_l1931_c34_d09b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1900_l1897_l1922_l1891_l1919_l1914_l1911_DUPLICATE_bb61 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1900_l1897_l1922_l1891_l1919_l1914_l1911_DUPLICATE_bb61_return_output := result.is_ram_read;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1912_l1920_l1917_l1909_DUPLICATE_5c97 LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1912_l1920_l1917_l1909_DUPLICATE_5c97_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1904_c32_48e2_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1904_c32_beba_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d542_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c6_0077_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c6_0077_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c6_0077_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c6_0077_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c6_0077_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c6_0077_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c6_0077_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c6_0077_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c6_0077_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c6_0077_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c6_0077_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c6_0077_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_2761_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_8b32_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1897_c7_2761_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_8b32_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1897_c7_2761_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_8b32_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1897_c7_2761_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_8b32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_2761_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_8b32_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1897_c7_2761_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_8b32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1897_c7_2761_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_8b32_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_2761_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_8b32_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1897_c7_2761_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_8b32_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1897_c7_2761_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_8b32_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1897_c7_2761_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_8b32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_75c2_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_75c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_75c2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_75c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_75c2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_75c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_75c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_75c2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_75c2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_75c2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_75c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_121a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_df96_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1906_c7_121a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_df96_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_121a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_df96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_121a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_df96_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1906_c7_121a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_df96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_121a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_df96_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1906_c7_121a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_df96_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1906_c7_121a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_df96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_50c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_517b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1911_c7_50c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_517b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_50c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_517b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_50c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_517b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_50c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_517b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_50c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_517b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_50c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_517b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_010e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_795f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1914_c7_010e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_795f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_010e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_795f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_010e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_795f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_010e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_795f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c7_010e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_795f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_010e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_795f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_f350_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_5cd5_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1919_c7_f350_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_5cd5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_f350_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_5cd5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1919_c7_f350_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_5cd5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_f350_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_5cd5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1919_c7_f350_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_5cd5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_f350_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_5cd5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1922_c7_e843_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1922_c11_a8bd_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1922_c7_e843_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1922_c11_a8bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1922_c7_e843_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1922_c11_a8bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1922_c7_e843_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1922_c11_a8bd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1922_c7_e843_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1922_c11_a8bd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1922_c7_e843_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1922_c11_a8bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_a512_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_61ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_a512_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_61ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_a512_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_61ce_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1929_c7_a512_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_61ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_3f9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_15d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_3f9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_15d5_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1909_l1920_l1917_l1912_DUPLICATE_4eeb_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1912_l1920_l1917_l1909_DUPLICATE_5c97_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1923_c3_1e41_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1915_l1923_DUPLICATE_63bd_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1916_c3_f9af_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1915_l1923_DUPLICATE_63bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1897_l1900_l1891_DUPLICATE_65ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1897_l1900_l1891_DUPLICATE_65ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1897_l1900_l1891_DUPLICATE_65ba_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1919_l1897_l1900_l1891_DUPLICATE_4668_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1919_l1897_l1900_l1891_DUPLICATE_4668_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1919_l1897_l1900_l1891_DUPLICATE_4668_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1919_l1897_l1900_l1891_DUPLICATE_4668_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1906_l1933_l1900_l1929_l1897_l1922_l1919_l1914_l1911_DUPLICATE_0f90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1906_l1933_l1900_l1929_l1897_l1922_l1919_l1914_l1911_DUPLICATE_0f90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1906_l1933_l1900_l1929_l1897_l1922_l1919_l1914_l1911_DUPLICATE_0f90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1906_l1933_l1900_l1929_l1897_l1922_l1919_l1914_l1911_DUPLICATE_0f90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1906_l1933_l1900_l1929_l1897_l1922_l1919_l1914_l1911_DUPLICATE_0f90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1906_l1933_l1900_l1929_l1897_l1922_l1919_l1914_l1911_DUPLICATE_0f90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1906_l1933_l1900_l1929_l1897_l1922_l1919_l1914_l1911_DUPLICATE_0f90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_a512_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1906_l1933_l1900_l1929_l1897_l1922_l1919_l1914_l1911_DUPLICATE_0f90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_3f9b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1906_l1933_l1900_l1929_l1897_l1922_l1919_l1914_l1911_DUPLICATE_0f90_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1900_l1897_l1922_l1891_l1919_l1914_l1911_DUPLICATE_bb61_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1900_l1897_l1922_l1891_l1919_l1914_l1911_DUPLICATE_bb61_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1900_l1897_l1922_l1891_l1919_l1914_l1911_DUPLICATE_bb61_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1900_l1897_l1922_l1891_l1919_l1914_l1911_DUPLICATE_bb61_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1900_l1897_l1922_l1891_l1919_l1914_l1911_DUPLICATE_bb61_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1900_l1897_l1922_l1891_l1919_l1914_l1911_DUPLICATE_bb61_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1900_l1897_l1922_l1891_l1919_l1914_l1911_DUPLICATE_bb61_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1906_l1897_l1891_DUPLICATE_ea8b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1906_l1897_l1891_DUPLICATE_ea8b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1906_l1897_l1891_DUPLICATE_ea8b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1897_l1900_DUPLICATE_73c0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1897_l1900_DUPLICATE_73c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1906_l1933_l1900_l1929_l1897_l1891_l1919_l1914_l1911_DUPLICATE_0343_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1906_l1933_l1900_l1929_l1897_l1891_l1919_l1914_l1911_DUPLICATE_0343_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1906_l1933_l1900_l1929_l1897_l1891_l1919_l1914_l1911_DUPLICATE_0343_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1906_l1933_l1900_l1929_l1897_l1891_l1919_l1914_l1911_DUPLICATE_0343_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1906_l1933_l1900_l1929_l1897_l1891_l1919_l1914_l1911_DUPLICATE_0343_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1906_l1933_l1900_l1929_l1897_l1891_l1919_l1914_l1911_DUPLICATE_0343_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1906_l1933_l1900_l1929_l1897_l1891_l1919_l1914_l1911_DUPLICATE_0343_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_a512_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1906_l1933_l1900_l1929_l1897_l1891_l1919_l1914_l1911_DUPLICATE_0343_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_3f9b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1906_l1933_l1900_l1929_l1897_l1891_l1919_l1914_l1911_DUPLICATE_0343_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1906_l1900_l1929_l1919_l1914_l1911_DUPLICATE_40ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1906_l1900_l1929_l1919_l1914_l1911_DUPLICATE_40ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1906_l1900_l1929_l1919_l1914_l1911_DUPLICATE_40ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1906_l1900_l1929_l1919_l1914_l1911_DUPLICATE_40ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1906_l1900_l1929_l1919_l1914_l1911_DUPLICATE_40ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_a512_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1906_l1900_l1929_l1919_l1914_l1911_DUPLICATE_40ef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1906_l1900_l1929_l1897_l1891_l1919_l1914_l1911_DUPLICATE_cad9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1906_l1900_l1929_l1897_l1891_l1919_l1914_l1911_DUPLICATE_cad9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1906_l1900_l1929_l1897_l1891_l1919_l1914_l1911_DUPLICATE_cad9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1906_l1900_l1929_l1897_l1891_l1919_l1914_l1911_DUPLICATE_cad9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1906_l1900_l1929_l1897_l1891_l1919_l1914_l1911_DUPLICATE_cad9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1906_l1900_l1929_l1897_l1891_l1919_l1914_l1911_DUPLICATE_cad9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1906_l1900_l1929_l1897_l1891_l1919_l1914_l1911_DUPLICATE_cad9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1929_c7_a512_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1906_l1900_l1929_l1897_l1891_l1919_l1914_l1911_DUPLICATE_cad9_return_output;
     -- t8_MUX[uxn_opcodes_h_l1900_c7_b8ec] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond <= VAR_t8_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond;
     t8_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue;
     t8_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output := t8_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1933_c7_3f9b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_3f9b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_3f9b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_3f9b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_3f9b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_3f9b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_3f9b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_3f9b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_3f9b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1900_c7_b8ec] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1929_c7_a512] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_a512_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_a512_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_a512_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_a512_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_a512_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_a512_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_a512_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_a512_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1923_c3_1e41] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1923_c3_1e41_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1923_c3_1e41_left;
     BIN_OP_OR_uxn_opcodes_h_l1923_c3_1e41_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1923_c3_1e41_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1923_c3_1e41_return_output := BIN_OP_OR_uxn_opcodes_h_l1923_c3_1e41_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1906_c7_121a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_121a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_121a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_121a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_121a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1931_c24_969f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1931_c24_969f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1931_c34_d09b_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1933_c7_3f9b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_3f9b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_3f9b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_3f9b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_3f9b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_3f9b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_3f9b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_3f9b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_3f9b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1891_c1_d542] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d542_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d542_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d542_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d542_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d542_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d542_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d542_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d542_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1922_c7_e843] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1922_c7_e843_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1922_c7_e843_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1922_c7_e843_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1922_c7_e843_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1909_l1920_l1917_l1912_DUPLICATE_4eeb LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1909_l1920_l1917_l1912_DUPLICATE_4eeb_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1909_l1920_l1917_l1912_DUPLICATE_4eeb_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1909_l1920_l1917_l1912_DUPLICATE_4eeb_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1909_l1920_l1917_l1912_DUPLICATE_4eeb_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1909_l1920_l1917_l1912_DUPLICATE_4eeb_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1909_l1920_l1917_l1912_DUPLICATE_4eeb_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1904_c32_48e2] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1904_c32_48e2_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1904_c32_48e2_left;
     BIN_OP_GT_uxn_opcodes_h_l1904_c32_48e2_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1904_c32_48e2_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1904_c32_48e2_return_output := BIN_OP_GT_uxn_opcodes_h_l1904_c32_48e2_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1916_c3_f9af] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1916_c3_f9af_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1916_c3_f9af_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1916_c3_f9af_return_output := CONST_SL_8_uxn_opcodes_h_l1916_c3_f9af_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1904_c32_c82f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1904_c32_48e2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1923_c3_1e41_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1917_c21_f005_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1909_l1920_l1917_l1912_DUPLICATE_4eeb_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1920_c21_3869_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1909_l1920_l1917_l1912_DUPLICATE_4eeb_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1909_c3_d49c := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1909_l1920_l1917_l1912_DUPLICATE_4eeb_return_output)),16);
     VAR_result_ram_addr_uxn_opcodes_h_l1912_c3_1606 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1909_l1920_l1917_l1912_DUPLICATE_4eeb_return_output)),16);
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1929_c7_a512_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1931_c24_969f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1916_c3_f9af_return_output;
     VAR_printf_uxn_opcodes_h_l1892_c3_a31d_uxn_opcodes_h_l1892_c3_a31d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1891_c1_d542_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_a512_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_3f9b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1922_c7_e843_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_121a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_a512_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_3f9b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_a512_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1909_c3_d49c;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1912_c3_1606;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1929_c7_a512] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_a512_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_a512_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_a512_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_a512_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_a512_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_a512_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_a512_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_a512_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1897_c7_2761] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1897_c7_2761_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1897_c7_2761_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1897_c7_2761_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1897_c7_2761_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1917_c21_f005] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1917_c21_f005_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1917_c21_f005_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1917_c21_f005_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1917_c21_f005_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1917_c21_f005_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1917_c21_f005_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1927_c24_4a28] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1927_c24_4a28_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1923_c3_1e41_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1900_c7_b8ec] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1922_c7_e843] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1922_c7_e843_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1922_c7_e843_cond;
     tmp16_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1922_c7_e843_return_output := tmp16_MUX_uxn_opcodes_h_l1922_c7_e843_return_output;

     -- t8_MUX[uxn_opcodes_h_l1897_c7_2761] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1897_c7_2761_cond <= VAR_t8_MUX_uxn_opcodes_h_l1897_c7_2761_cond;
     t8_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue;
     t8_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1897_c7_2761_return_output := t8_MUX_uxn_opcodes_h_l1897_c7_2761_return_output;

     -- printf_uxn_opcodes_h_l1892_c3_a31d[uxn_opcodes_h_l1892_c3_a31d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1892_c3_a31d_uxn_opcodes_h_l1892_c3_a31d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1892_c3_a31d_uxn_opcodes_h_l1892_c3_a31d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1929_c7_a512] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_a512_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_a512_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_a512_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_a512_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_a512_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_a512_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_a512_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_a512_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1920_c21_3869] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1920_c21_3869_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1920_c21_3869_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1920_c21_3869_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1920_c21_3869_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1920_c21_3869_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1920_c21_3869_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1929_c7_a512] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1929_c7_a512_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1929_c7_a512_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1929_c7_a512_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1929_c7_a512_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1929_c7_a512_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1929_c7_a512_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1929_c7_a512_return_output := result_stack_value_MUX_uxn_opcodes_h_l1929_c7_a512_return_output;

     -- MUX[uxn_opcodes_h_l1904_c32_c82f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1904_c32_c82f_cond <= VAR_MUX_uxn_opcodes_h_l1904_c32_c82f_cond;
     MUX_uxn_opcodes_h_l1904_c32_c82f_iftrue <= VAR_MUX_uxn_opcodes_h_l1904_c32_c82f_iftrue;
     MUX_uxn_opcodes_h_l1904_c32_c82f_iffalse <= VAR_MUX_uxn_opcodes_h_l1904_c32_c82f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1904_c32_c82f_return_output := MUX_uxn_opcodes_h_l1904_c32_c82f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1922_c7_e843] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1922_c7_e843_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1922_c7_e843_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1922_c7_e843_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1922_c7_e843_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1919_c7_f350] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1919_c7_f350_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1919_c7_f350_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1919_c7_f350_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1919_c7_f350_return_output;

     -- Submodule level 3
     VAR_result_ram_addr_uxn_opcodes_h_l1917_c3_1589 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1917_c21_f005_return_output)),16);
     VAR_result_ram_addr_uxn_opcodes_h_l1920_c3_3174 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1920_c21_3869_return_output)),16);
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1927_c24_4a28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue := VAR_MUX_uxn_opcodes_h_l1904_c32_c82f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_a512_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1919_c7_f350_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1897_c7_2761_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_a512_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1922_c7_e843_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1929_c7_a512_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1897_c7_2761_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1922_c7_e843_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1917_c3_1589;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1920_c3_3174;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1919_c7_f350] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1919_c7_f350_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1919_c7_f350_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1919_c7_f350_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1919_c7_f350_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1897_c7_2761] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1897_c7_2761_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1897_c7_2761_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1897_c7_2761_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1897_c7_2761_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1891_c2_5cc9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1922_c7_e843] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1922_c7_e843_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1922_c7_e843_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1922_c7_e843_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1922_c7_e843_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1922_c7_e843] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1922_c7_e843_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1922_c7_e843_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1922_c7_e843_return_output := result_stack_value_MUX_uxn_opcodes_h_l1922_c7_e843_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1900_c7_b8ec] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1922_c7_e843] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1922_c7_e843_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1922_c7_e843_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1922_c7_e843_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1922_c7_e843_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1922_c7_e843_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1922_c7_e843_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1919_c7_f350] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_f350_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_f350_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_f350_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_f350_return_output;

     -- t8_MUX[uxn_opcodes_h_l1891_c2_5cc9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond <= VAR_t8_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond;
     t8_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue;
     t8_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output := t8_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1914_c7_010e] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1914_c7_010e_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1914_c7_010e_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1914_c7_010e_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1914_c7_010e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1919_c7_f350] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1919_c7_f350_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_f350_cond;
     tmp16_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_f350_return_output := tmp16_MUX_uxn_opcodes_h_l1919_c7_f350_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1922_c7_e843_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1914_c7_010e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1897_c7_2761_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1922_c7_e843_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1919_c7_f350_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_f350_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1922_c7_e843_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_f350_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1914_c7_010e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1914_c7_010e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_010e_cond;
     tmp16_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_010e_return_output := tmp16_MUX_uxn_opcodes_h_l1914_c7_010e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1891_c2_5cc9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1919_c7_f350] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_f350_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_f350_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_f350_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_f350_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1914_c7_010e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_010e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_010e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_010e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_010e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1919_c7_f350] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_f350_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_f350_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_f350_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_f350_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1914_c7_010e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_010e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_010e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_010e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_010e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1919_c7_f350] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1919_c7_f350_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1919_c7_f350_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1919_c7_f350_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1919_c7_f350_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1919_c7_f350_return_output := result_stack_value_MUX_uxn_opcodes_h_l1919_c7_f350_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1897_c7_2761] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1897_c7_2761_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1897_c7_2761_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1897_c7_2761_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1897_c7_2761_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1911_c7_50c8] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1911_c7_50c8_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1911_c7_50c8_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_f350_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_f350_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_010e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1897_c7_2761_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_010e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1919_c7_f350_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_010e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1914_c7_010e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_010e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_010e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_010e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_010e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1911_c7_50c8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1911_c7_50c8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_50c8_cond;
     tmp16_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output := tmp16_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1906_c7_121a] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1906_c7_121a_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1906_c7_121a_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1906_c7_121a_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1906_c7_121a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1911_c7_50c8] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_50c8_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_50c8_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1914_c7_010e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_010e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_010e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_010e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_010e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1891_c2_5cc9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1914_c7_010e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1914_c7_010e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c7_010e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c7_010e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c7_010e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c7_010e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1914_c7_010e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1911_c7_50c8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_50c8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_50c8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_010e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1906_c7_121a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_010e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c7_010e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1906_c7_121a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1906_c7_121a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1906_c7_121a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1906_c7_121a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1906_c7_121a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1906_c7_121a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_121a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_121a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_121a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_121a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1911_c7_50c8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_50c8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_50c8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1911_c7_50c8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_50c8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_50c8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1911_c7_50c8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1911_c7_50c8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_50c8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_50c8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_50c8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1900_c7_b8ec] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1906_c7_121a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1906_c7_121a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1906_c7_121a_cond;
     tmp16_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1906_c7_121a_return_output := tmp16_MUX_uxn_opcodes_h_l1906_c7_121a_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1906_c7_121a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_121a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_50c8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1906_c7_121a_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1906_c7_121a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1906_c7_121a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1906_c7_121a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1906_c7_121a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1906_c7_121a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1900_c7_b8ec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1900_c7_b8ec] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond;
     tmp16_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output := tmp16_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1900_c7_b8ec] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1897_c7_2761] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1897_c7_2761_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1897_c7_2761_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1897_c7_2761_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1897_c7_2761_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1906_c7_121a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_121a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_121a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_121a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_121a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1906_c7_121a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_121a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_121a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_121a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_121a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_121a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_121a_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_121a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1897_c7_2761_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_121a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1906_c7_121a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l1891_c2_5cc9] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1900_c7_b8ec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1897_c7_2761] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1897_c7_2761_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1897_c7_2761_cond;
     tmp16_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1897_c7_2761_return_output := tmp16_MUX_uxn_opcodes_h_l1897_c7_2761_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1897_c7_2761] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1897_c7_2761_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1897_c7_2761_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1897_c7_2761_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1897_c7_2761_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1897_c7_2761] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_2761_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_2761_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_2761_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_2761_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1900_c7_b8ec] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1900_c7_b8ec] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1900_c7_b8ec_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1900_c7_b8ec_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1900_c7_b8ec_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output := result_stack_value_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1897_c7_2761_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_2761_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1900_c7_b8ec_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1897_c7_2761_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1897_c7_2761] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_2761_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_2761_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_2761_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_2761_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1891_c2_5cc9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond;
     tmp16_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output := tmp16_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1891_c2_5cc9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1897_c7_2761] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_2761_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_2761_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_2761_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_2761_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1891_c2_5cc9] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1897_c7_2761] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1897_c7_2761_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1897_c7_2761_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1897_c7_2761_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1897_c7_2761_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1897_c7_2761_return_output := result_stack_value_MUX_uxn_opcodes_h_l1897_c7_2761_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_2761_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_2761_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1897_c7_2761_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1891_c2_5cc9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1891_c2_5cc9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1891_c2_5cc9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1891_c2_5cc9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1891_c2_5cc9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1891_c2_5cc9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output := result_stack_value_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2_uxn_opcodes_h_l1938_l1886_DUPLICATE_8a4d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2_uxn_opcodes_h_l1938_l1886_DUPLICATE_8a4d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1891_c2_5cc9_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2_uxn_opcodes_h_l1938_l1886_DUPLICATE_8a4d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2_uxn_opcodes_h_l1938_l1886_DUPLICATE_8a4d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
