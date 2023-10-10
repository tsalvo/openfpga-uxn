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
-- Submodules: 66
entity div_0CLK_f6fa2c7d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end div_0CLK_f6fa2c7d;
architecture arch of div_0CLK_f6fa2c7d is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2324_c6_52c8]
signal BIN_OP_EQ_uxn_opcodes_h_l2324_c6_52c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2324_c6_52c8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2324_c6_52c8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2324_c1_3b49]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2324_c1_3b49_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2324_c1_3b49_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2324_c1_3b49_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2324_c1_3b49_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2324_c2_f7b7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2324_c2_f7b7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2324_c2_f7b7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2324_c2_f7b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2324_c2_f7b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2324_c2_f7b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2324_c2_f7b7]
signal result_stack_value_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2324_c2_f7b7]
signal t8_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2324_c2_f7b7]
signal n8_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2325_c3_7928[uxn_opcodes_h_l2325_c3_7928]
signal printf_uxn_opcodes_h_l2325_c3_7928_uxn_opcodes_h_l2325_c3_7928_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2330_c11_ad30]
signal BIN_OP_EQ_uxn_opcodes_h_l2330_c11_ad30_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2330_c11_ad30_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2330_c11_ad30_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2330_c7_8a83]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2330_c7_8a83]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2330_c7_8a83_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2330_c7_8a83]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2330_c7_8a83]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2330_c7_8a83_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2330_c7_8a83]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2330_c7_8a83_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2330_c7_8a83]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2330_c7_8a83_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2330_c7_8a83]
signal result_stack_value_MUX_uxn_opcodes_h_l2330_c7_8a83_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2330_c7_8a83]
signal t8_MUX_uxn_opcodes_h_l2330_c7_8a83_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2330_c7_8a83]
signal n8_MUX_uxn_opcodes_h_l2330_c7_8a83_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2333_c11_3b79]
signal BIN_OP_EQ_uxn_opcodes_h_l2333_c11_3b79_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2333_c11_3b79_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2333_c11_3b79_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2333_c7_984d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2333_c7_984d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2333_c7_984d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2333_c7_984d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2333_c7_984d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2333_c7_984d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2333_c7_984d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2333_c7_984d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2333_c7_984d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2333_c7_984d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2333_c7_984d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2333_c7_984d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2333_c7_984d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2333_c7_984d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2333_c7_984d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2333_c7_984d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_984d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_984d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2333_c7_984d]
signal result_stack_value_MUX_uxn_opcodes_h_l2333_c7_984d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2333_c7_984d_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2333_c7_984d]
signal t8_MUX_uxn_opcodes_h_l2333_c7_984d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2333_c7_984d_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2333_c7_984d]
signal n8_MUX_uxn_opcodes_h_l2333_c7_984d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2333_c7_984d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2337_c11_d8e9]
signal BIN_OP_EQ_uxn_opcodes_h_l2337_c11_d8e9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2337_c11_d8e9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2337_c11_d8e9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2337_c7_3426]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2337_c7_3426_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2337_c7_3426_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2337_c7_3426]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2337_c7_3426_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2337_c7_3426_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2337_c7_3426]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2337_c7_3426_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2337_c7_3426_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2337_c7_3426]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2337_c7_3426_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2337_c7_3426_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2337_c7_3426]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2337_c7_3426_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2337_c7_3426_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2337_c7_3426]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2337_c7_3426_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2337_c7_3426_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2337_c7_3426]
signal result_stack_value_MUX_uxn_opcodes_h_l2337_c7_3426_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2337_c7_3426_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2337_c7_3426]
signal n8_MUX_uxn_opcodes_h_l2337_c7_3426_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2337_c7_3426_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2340_c11_35c9]
signal BIN_OP_EQ_uxn_opcodes_h_l2340_c11_35c9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2340_c11_35c9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2340_c11_35c9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2340_c7_1eaa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2340_c7_1eaa]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2340_c7_1eaa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2340_c7_1eaa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2340_c7_1eaa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2340_c7_1eaa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2340_c7_1eaa]
signal result_stack_value_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2340_c7_1eaa]
signal n8_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2344_c32_f08c]
signal BIN_OP_AND_uxn_opcodes_h_l2344_c32_f08c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2344_c32_f08c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2344_c32_f08c_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2344_c32_dff2]
signal BIN_OP_GT_uxn_opcodes_h_l2344_c32_dff2_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2344_c32_dff2_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2344_c32_dff2_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2344_c32_a475]
signal MUX_uxn_opcodes_h_l2344_c32_a475_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2344_c32_a475_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2344_c32_a475_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2344_c32_a475_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2346_c11_494a]
signal BIN_OP_EQ_uxn_opcodes_h_l2346_c11_494a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2346_c11_494a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2346_c11_494a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2346_c7_a441]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_a441_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_a441_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_a441_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_a441_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2346_c7_a441]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_a441_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_a441_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_a441_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_a441_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2346_c7_a441]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_a441_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_a441_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_a441_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_a441_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2346_c7_a441]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_a441_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_a441_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_a441_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_a441_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2346_c7_a441]
signal result_stack_value_MUX_uxn_opcodes_h_l2346_c7_a441_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2346_c7_a441_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2346_c7_a441_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2346_c7_a441_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2350_c24_ba49]
signal BIN_OP_EQ_uxn_opcodes_h_l2350_c24_ba49_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2350_c24_ba49_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2350_c24_ba49_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2350_c38_ffb0]
signal BIN_OP_DIV_uxn_opcodes_h_l2350_c38_ffb0_left : unsigned(7 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2350_c38_ffb0_right : unsigned(7 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2350_c38_ffb0_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l2350_c24_a0a0]
signal MUX_uxn_opcodes_h_l2350_c24_a0a0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2350_c24_a0a0_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2350_c24_a0a0_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2350_c24_a0a0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2352_c11_e5cc]
signal BIN_OP_EQ_uxn_opcodes_h_l2352_c11_e5cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2352_c11_e5cc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2352_c11_e5cc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2352_c7_e8c0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2352_c7_e8c0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2352_c7_e8c0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2352_c7_e8c0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2352_c7_e8c0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2352_c7_e8c0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_e8c0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_e8c0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_e8c0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_e8c0_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_1ade( ref_toks_0 : opcode_result_t;
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
      base.is_sp_shift := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2324_c6_52c8
BIN_OP_EQ_uxn_opcodes_h_l2324_c6_52c8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2324_c6_52c8_left,
BIN_OP_EQ_uxn_opcodes_h_l2324_c6_52c8_right,
BIN_OP_EQ_uxn_opcodes_h_l2324_c6_52c8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2324_c1_3b49
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2324_c1_3b49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2324_c1_3b49_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2324_c1_3b49_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2324_c1_3b49_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2324_c1_3b49_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7
result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2324_c2_f7b7
result_is_stack_read_MUX_uxn_opcodes_h_l2324_c2_f7b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2324_c2_f7b7
result_is_stack_write_MUX_uxn_opcodes_h_l2324_c2_f7b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c2_f7b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c2_f7b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2324_c2_f7b7
result_is_opc_done_MUX_uxn_opcodes_h_l2324_c2_f7b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2324_c2_f7b7
result_stack_value_MUX_uxn_opcodes_h_l2324_c2_f7b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond,
result_stack_value_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output);

-- t8_MUX_uxn_opcodes_h_l2324_c2_f7b7
t8_MUX_uxn_opcodes_h_l2324_c2_f7b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond,
t8_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue,
t8_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse,
t8_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output);

-- n8_MUX_uxn_opcodes_h_l2324_c2_f7b7
n8_MUX_uxn_opcodes_h_l2324_c2_f7b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond,
n8_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue,
n8_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse,
n8_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output);

-- printf_uxn_opcodes_h_l2325_c3_7928_uxn_opcodes_h_l2325_c3_7928
printf_uxn_opcodes_h_l2325_c3_7928_uxn_opcodes_h_l2325_c3_7928 : entity work.printf_uxn_opcodes_h_l2325_c3_7928_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2325_c3_7928_uxn_opcodes_h_l2325_c3_7928_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2330_c11_ad30
BIN_OP_EQ_uxn_opcodes_h_l2330_c11_ad30 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2330_c11_ad30_left,
BIN_OP_EQ_uxn_opcodes_h_l2330_c11_ad30_right,
BIN_OP_EQ_uxn_opcodes_h_l2330_c11_ad30_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2330_c7_8a83
result_is_sp_shift_MUX_uxn_opcodes_h_l2330_c7_8a83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2330_c7_8a83
result_is_stack_read_MUX_uxn_opcodes_h_l2330_c7_8a83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2330_c7_8a83_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2330_c7_8a83
result_sp_relative_shift_MUX_uxn_opcodes_h_l2330_c7_8a83 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2330_c7_8a83
result_is_stack_write_MUX_uxn_opcodes_h_l2330_c7_8a83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2330_c7_8a83_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2330_c7_8a83
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2330_c7_8a83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2330_c7_8a83_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2330_c7_8a83
result_is_opc_done_MUX_uxn_opcodes_h_l2330_c7_8a83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2330_c7_8a83_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2330_c7_8a83
result_stack_value_MUX_uxn_opcodes_h_l2330_c7_8a83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2330_c7_8a83_cond,
result_stack_value_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output);

-- t8_MUX_uxn_opcodes_h_l2330_c7_8a83
t8_MUX_uxn_opcodes_h_l2330_c7_8a83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2330_c7_8a83_cond,
t8_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue,
t8_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse,
t8_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output);

-- n8_MUX_uxn_opcodes_h_l2330_c7_8a83
n8_MUX_uxn_opcodes_h_l2330_c7_8a83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2330_c7_8a83_cond,
n8_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue,
n8_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse,
n8_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2333_c11_3b79
BIN_OP_EQ_uxn_opcodes_h_l2333_c11_3b79 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2333_c11_3b79_left,
BIN_OP_EQ_uxn_opcodes_h_l2333_c11_3b79_right,
BIN_OP_EQ_uxn_opcodes_h_l2333_c11_3b79_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2333_c7_984d
result_is_sp_shift_MUX_uxn_opcodes_h_l2333_c7_984d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2333_c7_984d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2333_c7_984d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2333_c7_984d
result_is_stack_read_MUX_uxn_opcodes_h_l2333_c7_984d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2333_c7_984d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2333_c7_984d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2333_c7_984d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2333_c7_984d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2333_c7_984d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2333_c7_984d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2333_c7_984d
result_is_stack_write_MUX_uxn_opcodes_h_l2333_c7_984d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2333_c7_984d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2333_c7_984d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2333_c7_984d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2333_c7_984d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2333_c7_984d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2333_c7_984d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_984d
result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_984d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_984d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_984d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2333_c7_984d
result_stack_value_MUX_uxn_opcodes_h_l2333_c7_984d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2333_c7_984d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2333_c7_984d_return_output);

-- t8_MUX_uxn_opcodes_h_l2333_c7_984d
t8_MUX_uxn_opcodes_h_l2333_c7_984d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2333_c7_984d_cond,
t8_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue,
t8_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse,
t8_MUX_uxn_opcodes_h_l2333_c7_984d_return_output);

-- n8_MUX_uxn_opcodes_h_l2333_c7_984d
n8_MUX_uxn_opcodes_h_l2333_c7_984d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2333_c7_984d_cond,
n8_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue,
n8_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse,
n8_MUX_uxn_opcodes_h_l2333_c7_984d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2337_c11_d8e9
BIN_OP_EQ_uxn_opcodes_h_l2337_c11_d8e9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2337_c11_d8e9_left,
BIN_OP_EQ_uxn_opcodes_h_l2337_c11_d8e9_right,
BIN_OP_EQ_uxn_opcodes_h_l2337_c11_d8e9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2337_c7_3426
result_is_sp_shift_MUX_uxn_opcodes_h_l2337_c7_3426 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2337_c7_3426_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2337_c7_3426_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2337_c7_3426
result_is_stack_read_MUX_uxn_opcodes_h_l2337_c7_3426 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2337_c7_3426_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2337_c7_3426_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2337_c7_3426
result_sp_relative_shift_MUX_uxn_opcodes_h_l2337_c7_3426 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2337_c7_3426_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2337_c7_3426_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2337_c7_3426
result_is_stack_write_MUX_uxn_opcodes_h_l2337_c7_3426 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2337_c7_3426_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2337_c7_3426_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2337_c7_3426
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2337_c7_3426 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2337_c7_3426_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2337_c7_3426_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2337_c7_3426
result_is_opc_done_MUX_uxn_opcodes_h_l2337_c7_3426 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2337_c7_3426_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2337_c7_3426_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2337_c7_3426
result_stack_value_MUX_uxn_opcodes_h_l2337_c7_3426 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2337_c7_3426_cond,
result_stack_value_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2337_c7_3426_return_output);

-- n8_MUX_uxn_opcodes_h_l2337_c7_3426
n8_MUX_uxn_opcodes_h_l2337_c7_3426 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2337_c7_3426_cond,
n8_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue,
n8_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse,
n8_MUX_uxn_opcodes_h_l2337_c7_3426_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2340_c11_35c9
BIN_OP_EQ_uxn_opcodes_h_l2340_c11_35c9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2340_c11_35c9_left,
BIN_OP_EQ_uxn_opcodes_h_l2340_c11_35c9_right,
BIN_OP_EQ_uxn_opcodes_h_l2340_c11_35c9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa
result_is_sp_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2340_c7_1eaa
result_is_stack_read_MUX_uxn_opcodes_h_l2340_c7_1eaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa
result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2340_c7_1eaa
result_is_stack_write_MUX_uxn_opcodes_h_l2340_c7_1eaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c7_1eaa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c7_1eaa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2340_c7_1eaa
result_is_opc_done_MUX_uxn_opcodes_h_l2340_c7_1eaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2340_c7_1eaa
result_stack_value_MUX_uxn_opcodes_h_l2340_c7_1eaa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond,
result_stack_value_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output);

-- n8_MUX_uxn_opcodes_h_l2340_c7_1eaa
n8_MUX_uxn_opcodes_h_l2340_c7_1eaa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond,
n8_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue,
n8_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse,
n8_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2344_c32_f08c
BIN_OP_AND_uxn_opcodes_h_l2344_c32_f08c : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2344_c32_f08c_left,
BIN_OP_AND_uxn_opcodes_h_l2344_c32_f08c_right,
BIN_OP_AND_uxn_opcodes_h_l2344_c32_f08c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2344_c32_dff2
BIN_OP_GT_uxn_opcodes_h_l2344_c32_dff2 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2344_c32_dff2_left,
BIN_OP_GT_uxn_opcodes_h_l2344_c32_dff2_right,
BIN_OP_GT_uxn_opcodes_h_l2344_c32_dff2_return_output);

-- MUX_uxn_opcodes_h_l2344_c32_a475
MUX_uxn_opcodes_h_l2344_c32_a475 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2344_c32_a475_cond,
MUX_uxn_opcodes_h_l2344_c32_a475_iftrue,
MUX_uxn_opcodes_h_l2344_c32_a475_iffalse,
MUX_uxn_opcodes_h_l2344_c32_a475_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2346_c11_494a
BIN_OP_EQ_uxn_opcodes_h_l2346_c11_494a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2346_c11_494a_left,
BIN_OP_EQ_uxn_opcodes_h_l2346_c11_494a_right,
BIN_OP_EQ_uxn_opcodes_h_l2346_c11_494a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_a441
result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_a441 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_a441_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_a441_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_a441_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_a441_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_a441
result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_a441 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_a441_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_a441_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_a441_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_a441_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_a441
result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_a441 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_a441_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_a441_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_a441_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_a441_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_a441
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_a441 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_a441_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_a441_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_a441_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_a441_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2346_c7_a441
result_stack_value_MUX_uxn_opcodes_h_l2346_c7_a441 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2346_c7_a441_cond,
result_stack_value_MUX_uxn_opcodes_h_l2346_c7_a441_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2346_c7_a441_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2346_c7_a441_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2350_c24_ba49
BIN_OP_EQ_uxn_opcodes_h_l2350_c24_ba49 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2350_c24_ba49_left,
BIN_OP_EQ_uxn_opcodes_h_l2350_c24_ba49_right,
BIN_OP_EQ_uxn_opcodes_h_l2350_c24_ba49_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2350_c38_ffb0
BIN_OP_DIV_uxn_opcodes_h_l2350_c38_ffb0 : entity work.BIN_OP_DIV_uint8_t_uint8_t_0CLK_a148083c port map (
BIN_OP_DIV_uxn_opcodes_h_l2350_c38_ffb0_left,
BIN_OP_DIV_uxn_opcodes_h_l2350_c38_ffb0_right,
BIN_OP_DIV_uxn_opcodes_h_l2350_c38_ffb0_return_output);

-- MUX_uxn_opcodes_h_l2350_c24_a0a0
MUX_uxn_opcodes_h_l2350_c24_a0a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2350_c24_a0a0_cond,
MUX_uxn_opcodes_h_l2350_c24_a0a0_iftrue,
MUX_uxn_opcodes_h_l2350_c24_a0a0_iffalse,
MUX_uxn_opcodes_h_l2350_c24_a0a0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2352_c11_e5cc
BIN_OP_EQ_uxn_opcodes_h_l2352_c11_e5cc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2352_c11_e5cc_left,
BIN_OP_EQ_uxn_opcodes_h_l2352_c11_e5cc_right,
BIN_OP_EQ_uxn_opcodes_h_l2352_c11_e5cc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2352_c7_e8c0
result_is_stack_write_MUX_uxn_opcodes_h_l2352_c7_e8c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2352_c7_e8c0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2352_c7_e8c0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2352_c7_e8c0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2352_c7_e8c0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_e8c0
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_e8c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_e8c0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_e8c0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_e8c0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_e8c0_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2324_c6_52c8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2324_c1_3b49_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output,
 t8_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output,
 n8_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2330_c11_ad30_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output,
 t8_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output,
 n8_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2333_c11_3b79_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2333_c7_984d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2333_c7_984d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2333_c7_984d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2333_c7_984d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2333_c7_984d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_984d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2333_c7_984d_return_output,
 t8_MUX_uxn_opcodes_h_l2333_c7_984d_return_output,
 n8_MUX_uxn_opcodes_h_l2333_c7_984d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2337_c11_d8e9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2337_c7_3426_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2337_c7_3426_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2337_c7_3426_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2337_c7_3426_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2337_c7_3426_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2337_c7_3426_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2337_c7_3426_return_output,
 n8_MUX_uxn_opcodes_h_l2337_c7_3426_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2340_c11_35c9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output,
 n8_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2344_c32_f08c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2344_c32_dff2_return_output,
 MUX_uxn_opcodes_h_l2344_c32_a475_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2346_c11_494a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_a441_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_a441_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_a441_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_a441_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2346_c7_a441_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2350_c24_ba49_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2350_c38_ffb0_return_output,
 MUX_uxn_opcodes_h_l2350_c24_a0a0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2352_c11_e5cc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2352_c7_e8c0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_e8c0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2324_c6_52c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2324_c6_52c8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2324_c6_52c8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2324_c1_3b49_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2324_c1_3b49_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2324_c1_3b49_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2324_c1_3b49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2327_c3_37b7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2325_c3_7928_uxn_opcodes_h_l2325_c3_7928_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2330_c11_ad30_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2330_c11_ad30_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2330_c11_ad30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2333_c7_984d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2333_c7_984d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2330_c7_8a83_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2333_c7_984d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2333_c7_984d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2330_c7_8a83_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2331_c3_a9d0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2333_c7_984d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2330_c7_8a83_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_984d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2330_c7_8a83_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2333_c7_984d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2330_c7_8a83_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2333_c7_984d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2330_c7_8a83_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2333_c7_984d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2330_c7_8a83_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2333_c11_3b79_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2333_c11_3b79_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2333_c11_3b79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2337_c7_3426_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2333_c7_984d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2337_c7_3426_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2333_c7_984d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2337_c7_3426_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2333_c7_984d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2337_c7_3426_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2333_c7_984d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2335_c3_cd44 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2337_c7_3426_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2333_c7_984d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2337_c7_3426_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_984d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2337_c7_3426_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2333_c7_984d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2333_c7_984d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2337_c7_3426_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2333_c7_984d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2337_c11_d8e9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2337_c11_d8e9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2337_c11_d8e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2337_c7_3426_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2337_c7_3426_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2337_c7_3426_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2337_c7_3426_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2338_c3_bb56 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2337_c7_3426_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2337_c7_3426_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2337_c7_3426_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2337_c7_3426_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c11_35c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c11_35c9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c11_35c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_a441_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_a441_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_a441_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_a441_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2346_c7_a441_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2344_c32_a475_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2344_c32_a475_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2344_c32_a475_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2344_c32_f08c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2344_c32_f08c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2344_c32_f08c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2344_c32_dff2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2344_c32_dff2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2344_c32_dff2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2344_c32_a475_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2346_c11_494a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2346_c11_494a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2346_c11_494a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_a441_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_a441_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_a441_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_a441_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_a441_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2352_c7_e8c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_a441_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_a441_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_a441_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_e8c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_a441_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_a441_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2349_c3_6f4e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_a441_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_a441_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2346_c7_a441_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2346_c7_a441_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2346_c7_a441_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2350_c24_a0a0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2350_c24_a0a0_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2350_c24_a0a0_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2350_c24_ba49_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2350_c24_ba49_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2350_c24_ba49_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2350_c38_ffb0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2350_c38_ffb0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2350_c38_ffb0_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2350_c24_a0a0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_e5cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_e5cc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_e5cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2352_c7_e8c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2352_c7_e8c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2352_c7_e8c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_e8c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_e8c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_e8c0_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2324_l2346_l2337_l2333_l2330_DUPLICATE_e731_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2324_l2340_l2337_l2333_l2330_DUPLICATE_492a_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2324_l2352_l2340_l2337_l2333_l2330_DUPLICATE_0c5a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2324_l2346_l2340_l2337_l2333_l2330_DUPLICATE_ae53_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2333_l2337_l2330_l2340_DUPLICATE_831d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2352_l2346_l2340_l2337_l2333_l2330_DUPLICATE_99c9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2346_l2340_DUPLICATE_2995_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2357_l2320_DUPLICATE_e74f_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2349_c3_6f4e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_a441_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2349_c3_6f4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2330_c11_ad30_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2344_c32_f08c_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2350_c24_ba49_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_a441_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2350_c24_a0a0_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_a441_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2344_c32_a475_iffalse := resize(to_signed(-1, 2), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2324_c1_3b49_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2324_c6_52c8_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2327_c3_37b7 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2327_c3_37b7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2331_c3_a9d0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2331_c3_a9d0;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2337_c11_d8e9_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2352_c7_e8c0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2346_c11_494a_right := to_unsigned(5, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2344_c32_dff2_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2344_c32_a475_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2333_c11_3b79_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_e5cc_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_e8c0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c11_35c9_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2335_c3_cd44 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2335_c3_cd44;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2338_c3_bb56 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2338_c3_bb56;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2324_c1_3b49_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2344_c32_f08c_left := VAR_ins;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2350_c38_ffb0_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2324_c6_52c8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2330_c11_ad30_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2333_c11_3b79_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2337_c11_d8e9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c11_35c9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2346_c11_494a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_e5cc_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2350_c38_ffb0_right := t8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2350_c24_ba49_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse := t8;
     -- BIN_OP_DIV[uxn_opcodes_h_l2350_c38_ffb0] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2350_c38_ffb0_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2350_c38_ffb0_left;
     BIN_OP_DIV_uxn_opcodes_h_l2350_c38_ffb0_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2350_c38_ffb0_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2350_c38_ffb0_return_output := BIN_OP_DIV_uxn_opcodes_h_l2350_c38_ffb0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2352_l2346_l2340_l2337_l2333_l2330_DUPLICATE_99c9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2352_l2346_l2340_l2337_l2333_l2330_DUPLICATE_99c9_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2324_l2346_l2340_l2337_l2333_l2330_DUPLICATE_ae53 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2324_l2346_l2340_l2337_l2333_l2330_DUPLICATE_ae53_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2352_c11_e5cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2352_c11_e5cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_e5cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2352_c11_e5cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_e5cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_e5cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2352_c11_e5cc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2324_c6_52c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2324_c6_52c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2324_c6_52c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2324_c6_52c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2324_c6_52c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2324_c6_52c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2324_c6_52c8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2337_c11_d8e9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2337_c11_d8e9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2337_c11_d8e9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2337_c11_d8e9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2337_c11_d8e9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2337_c11_d8e9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2337_c11_d8e9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2340_c11_35c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2340_c11_35c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c11_35c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2340_c11_35c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c11_35c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c11_35c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2340_c11_35c9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2346_c11_494a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2346_c11_494a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2346_c11_494a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2346_c11_494a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2346_c11_494a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2346_c11_494a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2346_c11_494a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2324_l2346_l2337_l2333_l2330_DUPLICATE_e731 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2324_l2346_l2337_l2333_l2330_DUPLICATE_e731_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2346_l2340_DUPLICATE_2995 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2346_l2340_DUPLICATE_2995_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2324_l2352_l2340_l2337_l2333_l2330_DUPLICATE_0c5a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2324_l2352_l2340_l2337_l2333_l2330_DUPLICATE_0c5a_return_output := result.is_stack_write;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2324_l2340_l2337_l2333_l2330_DUPLICATE_492a LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2324_l2340_l2337_l2333_l2330_DUPLICATE_492a_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2333_l2337_l2330_l2340_DUPLICATE_831d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2333_l2337_l2330_l2340_DUPLICATE_831d_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2330_c11_ad30] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2330_c11_ad30_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2330_c11_ad30_left;
     BIN_OP_EQ_uxn_opcodes_h_l2330_c11_ad30_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2330_c11_ad30_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2330_c11_ad30_return_output := BIN_OP_EQ_uxn_opcodes_h_l2330_c11_ad30_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2333_c11_3b79] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2333_c11_3b79_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2333_c11_3b79_left;
     BIN_OP_EQ_uxn_opcodes_h_l2333_c11_3b79_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2333_c11_3b79_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2333_c11_3b79_return_output := BIN_OP_EQ_uxn_opcodes_h_l2333_c11_3b79_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2344_c32_f08c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2344_c32_f08c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2344_c32_f08c_left;
     BIN_OP_AND_uxn_opcodes_h_l2344_c32_f08c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2344_c32_f08c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2344_c32_f08c_return_output := BIN_OP_AND_uxn_opcodes_h_l2344_c32_f08c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2350_c24_ba49] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2350_c24_ba49_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2350_c24_ba49_left;
     BIN_OP_EQ_uxn_opcodes_h_l2350_c24_ba49_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2350_c24_ba49_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2350_c24_ba49_return_output := BIN_OP_EQ_uxn_opcodes_h_l2350_c24_ba49_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2344_c32_dff2_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2344_c32_f08c_return_output;
     VAR_MUX_uxn_opcodes_h_l2350_c24_a0a0_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2350_c38_ffb0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2324_c1_3b49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2324_c6_52c8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2324_c6_52c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2324_c6_52c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2324_c6_52c8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2324_c6_52c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2324_c6_52c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2324_c6_52c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2324_c6_52c8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2324_c6_52c8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2324_c6_52c8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2330_c7_8a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2330_c11_ad30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2330_c7_8a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2330_c11_ad30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2330_c11_ad30_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2330_c7_8a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2330_c11_ad30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2330_c7_8a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2330_c11_ad30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2330_c11_ad30_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2330_c7_8a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2330_c11_ad30_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2330_c7_8a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2330_c11_ad30_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2330_c7_8a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2330_c11_ad30_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2333_c7_984d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2333_c11_3b79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_984d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2333_c11_3b79_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2333_c7_984d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2333_c11_3b79_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2333_c7_984d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2333_c11_3b79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2333_c7_984d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2333_c11_3b79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2333_c7_984d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2333_c11_3b79_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2333_c7_984d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2333_c11_3b79_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2333_c7_984d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2333_c11_3b79_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2333_c7_984d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2333_c11_3b79_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2337_c7_3426_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2337_c11_d8e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2337_c7_3426_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2337_c11_d8e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2337_c7_3426_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2337_c11_d8e9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2337_c7_3426_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2337_c11_d8e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2337_c7_3426_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2337_c11_d8e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2337_c7_3426_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2337_c11_d8e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2337_c7_3426_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2337_c11_d8e9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2337_c7_3426_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2337_c11_d8e9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c11_35c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c11_35c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c11_35c9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c11_35c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c11_35c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c11_35c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c11_35c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c11_35c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_a441_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2346_c11_494a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_a441_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2346_c11_494a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_a441_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2346_c11_494a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_a441_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2346_c11_494a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2346_c7_a441_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2346_c11_494a_return_output;
     VAR_MUX_uxn_opcodes_h_l2350_c24_a0a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2350_c24_ba49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_e8c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_e5cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2352_c7_e8c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_e5cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2324_l2340_l2337_l2333_l2330_DUPLICATE_492a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2324_l2340_l2337_l2333_l2330_DUPLICATE_492a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2324_l2340_l2337_l2333_l2330_DUPLICATE_492a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2324_l2340_l2337_l2333_l2330_DUPLICATE_492a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2324_l2340_l2337_l2333_l2330_DUPLICATE_492a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2352_l2346_l2340_l2337_l2333_l2330_DUPLICATE_99c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2352_l2346_l2340_l2337_l2333_l2330_DUPLICATE_99c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2352_l2346_l2340_l2337_l2333_l2330_DUPLICATE_99c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2352_l2346_l2340_l2337_l2333_l2330_DUPLICATE_99c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_a441_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2352_l2346_l2340_l2337_l2333_l2330_DUPLICATE_99c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_e8c0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2352_l2346_l2340_l2337_l2333_l2330_DUPLICATE_99c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2324_l2346_l2337_l2333_l2330_DUPLICATE_e731_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2324_l2346_l2337_l2333_l2330_DUPLICATE_e731_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2324_l2346_l2337_l2333_l2330_DUPLICATE_e731_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2324_l2346_l2337_l2333_l2330_DUPLICATE_e731_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_a441_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2324_l2346_l2337_l2333_l2330_DUPLICATE_e731_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2333_l2337_l2330_l2340_DUPLICATE_831d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2333_l2337_l2330_l2340_DUPLICATE_831d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2333_l2337_l2330_l2340_DUPLICATE_831d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2333_l2337_l2330_l2340_DUPLICATE_831d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2324_l2352_l2340_l2337_l2333_l2330_DUPLICATE_0c5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2324_l2352_l2340_l2337_l2333_l2330_DUPLICATE_0c5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2324_l2352_l2340_l2337_l2333_l2330_DUPLICATE_0c5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2324_l2352_l2340_l2337_l2333_l2330_DUPLICATE_0c5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2324_l2352_l2340_l2337_l2333_l2330_DUPLICATE_0c5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2352_c7_e8c0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2324_l2352_l2340_l2337_l2333_l2330_DUPLICATE_0c5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2346_l2340_DUPLICATE_2995_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_a441_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2346_l2340_DUPLICATE_2995_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2324_l2346_l2340_l2337_l2333_l2330_DUPLICATE_ae53_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2324_l2346_l2340_l2337_l2333_l2330_DUPLICATE_ae53_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2324_l2346_l2340_l2337_l2333_l2330_DUPLICATE_ae53_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2324_l2346_l2340_l2337_l2333_l2330_DUPLICATE_ae53_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2324_l2346_l2340_l2337_l2333_l2330_DUPLICATE_ae53_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2346_c7_a441_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2324_l2346_l2340_l2337_l2333_l2330_DUPLICATE_ae53_return_output;
     -- MUX[uxn_opcodes_h_l2350_c24_a0a0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2350_c24_a0a0_cond <= VAR_MUX_uxn_opcodes_h_l2350_c24_a0a0_cond;
     MUX_uxn_opcodes_h_l2350_c24_a0a0_iftrue <= VAR_MUX_uxn_opcodes_h_l2350_c24_a0a0_iftrue;
     MUX_uxn_opcodes_h_l2350_c24_a0a0_iffalse <= VAR_MUX_uxn_opcodes_h_l2350_c24_a0a0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2350_c24_a0a0_return_output := MUX_uxn_opcodes_h_l2350_c24_a0a0_return_output;

     -- t8_MUX[uxn_opcodes_h_l2333_c7_984d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2333_c7_984d_cond <= VAR_t8_MUX_uxn_opcodes_h_l2333_c7_984d_cond;
     t8_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue;
     t8_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2333_c7_984d_return_output := t8_MUX_uxn_opcodes_h_l2333_c7_984d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2352_c7_e8c0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_e8c0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_e8c0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_e8c0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_e8c0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_e8c0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_e8c0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_e8c0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_e8c0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2340_c7_1eaa] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output;

     -- n8_MUX[uxn_opcodes_h_l2340_c7_1eaa] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond <= VAR_n8_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond;
     n8_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue;
     n8_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output := n8_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2324_c1_3b49] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2324_c1_3b49_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2324_c1_3b49_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2324_c1_3b49_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2324_c1_3b49_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2324_c1_3b49_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2324_c1_3b49_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2324_c1_3b49_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2324_c1_3b49_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2344_c32_dff2] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2344_c32_dff2_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2344_c32_dff2_left;
     BIN_OP_GT_uxn_opcodes_h_l2344_c32_dff2_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2344_c32_dff2_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2344_c32_dff2_return_output := BIN_OP_GT_uxn_opcodes_h_l2344_c32_dff2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2352_c7_e8c0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2352_c7_e8c0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2352_c7_e8c0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2352_c7_e8c0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2352_c7_e8c0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2352_c7_e8c0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2352_c7_e8c0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2352_c7_e8c0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2352_c7_e8c0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2346_c7_a441] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_a441_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_a441_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_a441_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_a441_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_a441_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_a441_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_a441_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_a441_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2346_c7_a441] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_a441_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_a441_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_a441_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_a441_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_a441_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_a441_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_a441_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_a441_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2344_c32_a475_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2344_c32_dff2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2346_c7_a441_iftrue := VAR_MUX_uxn_opcodes_h_l2350_c24_a0a0_return_output;
     VAR_printf_uxn_opcodes_h_l2325_c3_7928_uxn_opcodes_h_l2325_c3_7928_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2324_c1_3b49_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_a441_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_e8c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2346_c7_a441_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_a441_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2352_c7_e8c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2346_c7_a441_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2333_c7_984d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2340_c7_1eaa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2346_c7_a441] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_a441_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_a441_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_a441_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_a441_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_a441_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_a441_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_a441_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_a441_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2340_c7_1eaa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2337_c7_3426] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2337_c7_3426_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2337_c7_3426_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2337_c7_3426_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2337_c7_3426_return_output;

     -- n8_MUX[uxn_opcodes_h_l2337_c7_3426] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2337_c7_3426_cond <= VAR_n8_MUX_uxn_opcodes_h_l2337_c7_3426_cond;
     n8_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue;
     n8_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2337_c7_3426_return_output := n8_MUX_uxn_opcodes_h_l2337_c7_3426_return_output;

     -- printf_uxn_opcodes_h_l2325_c3_7928[uxn_opcodes_h_l2325_c3_7928] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2325_c3_7928_uxn_opcodes_h_l2325_c3_7928_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2325_c3_7928_uxn_opcodes_h_l2325_c3_7928_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l2330_c7_8a83] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2330_c7_8a83_cond <= VAR_t8_MUX_uxn_opcodes_h_l2330_c7_8a83_cond;
     t8_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue;
     t8_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output := t8_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output;

     -- MUX[uxn_opcodes_h_l2344_c32_a475] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2344_c32_a475_cond <= VAR_MUX_uxn_opcodes_h_l2344_c32_a475_cond;
     MUX_uxn_opcodes_h_l2344_c32_a475_iftrue <= VAR_MUX_uxn_opcodes_h_l2344_c32_a475_iftrue;
     MUX_uxn_opcodes_h_l2344_c32_a475_iffalse <= VAR_MUX_uxn_opcodes_h_l2344_c32_a475_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2344_c32_a475_return_output := MUX_uxn_opcodes_h_l2344_c32_a475_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2346_c7_a441] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_a441_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_a441_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_a441_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_a441_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_a441_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_a441_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_a441_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_a441_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2346_c7_a441] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2346_c7_a441_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2346_c7_a441_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2346_c7_a441_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2346_c7_a441_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2346_c7_a441_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2346_c7_a441_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2346_c7_a441_return_output := result_stack_value_MUX_uxn_opcodes_h_l2346_c7_a441_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue := VAR_MUX_uxn_opcodes_h_l2344_c32_a475_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2337_c7_3426_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2346_c7_a441_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2337_c7_3426_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2346_c7_a441_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2346_c7_a441_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2337_c7_3426] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2337_c7_3426_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2337_c7_3426_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2337_c7_3426_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2337_c7_3426_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2340_c7_1eaa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output;

     -- t8_MUX[uxn_opcodes_h_l2324_c2_f7b7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond <= VAR_t8_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond;
     t8_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue;
     t8_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output := t8_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2340_c7_1eaa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2340_c7_1eaa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2340_c7_1eaa] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2340_c7_1eaa_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2340_c7_1eaa_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2340_c7_1eaa_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output := result_stack_value_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2333_c7_984d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2333_c7_984d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2333_c7_984d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2333_c7_984d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2333_c7_984d_return_output;

     -- n8_MUX[uxn_opcodes_h_l2333_c7_984d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2333_c7_984d_cond <= VAR_n8_MUX_uxn_opcodes_h_l2333_c7_984d_cond;
     n8_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue;
     n8_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2333_c7_984d_return_output := n8_MUX_uxn_opcodes_h_l2333_c7_984d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2337_c7_3426] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2337_c7_3426_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2337_c7_3426_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2337_c7_3426_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2337_c7_3426_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2333_c7_984d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2337_c7_3426_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2333_c7_984d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2337_c7_3426_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2340_c7_1eaa_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2337_c7_3426] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2337_c7_3426_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2337_c7_3426_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2337_c7_3426_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2337_c7_3426_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2337_c7_3426] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2337_c7_3426_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2337_c7_3426_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2337_c7_3426_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2337_c7_3426_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2330_c7_8a83] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2330_c7_8a83_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2330_c7_8a83_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output;

     -- n8_MUX[uxn_opcodes_h_l2330_c7_8a83] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2330_c7_8a83_cond <= VAR_n8_MUX_uxn_opcodes_h_l2330_c7_8a83_cond;
     n8_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue;
     n8_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output := n8_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2337_c7_3426] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2337_c7_3426_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2337_c7_3426_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2337_c7_3426_return_output := result_stack_value_MUX_uxn_opcodes_h_l2337_c7_3426_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2337_c7_3426] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2337_c7_3426_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2337_c7_3426_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2337_c7_3426_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2337_c7_3426_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2337_c7_3426_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2337_c7_3426_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2333_c7_984d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2333_c7_984d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2333_c7_984d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2333_c7_984d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2333_c7_984d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2333_c7_984d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2333_c7_984d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2333_c7_984d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2333_c7_984d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2333_c7_984d_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2337_c7_3426_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2333_c7_984d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2337_c7_3426_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2337_c7_3426_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2333_c7_984d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2337_c7_3426_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2330_c7_8a83] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2324_c2_f7b7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2333_c7_984d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2333_c7_984d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2333_c7_984d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2333_c7_984d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2333_c7_984d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2333_c7_984d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2333_c7_984d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2333_c7_984d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2333_c7_984d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2333_c7_984d_return_output;

     -- n8_MUX[uxn_opcodes_h_l2324_c2_f7b7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond <= VAR_n8_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond;
     n8_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue;
     n8_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output := n8_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2330_c7_8a83] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2330_c7_8a83_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2330_c7_8a83_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2333_c7_984d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2333_c7_984d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2333_c7_984d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2333_c7_984d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2333_c7_984d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2333_c7_984d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_984d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_984d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_984d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_984d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_984d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_984d_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_984d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2333_c7_984d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2333_c7_984d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2333_c7_984d_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2330_c7_8a83] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2330_c7_8a83_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2330_c7_8a83_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output := result_stack_value_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2324_c2_f7b7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2330_c7_8a83] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2330_c7_8a83] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2330_c7_8a83_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2330_c7_8a83_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2324_c2_f7b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2330_c7_8a83] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2330_c7_8a83_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2330_c7_8a83_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2330_c7_8a83_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2330_c7_8a83_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2330_c7_8a83_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2324_c2_f7b7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output := result_stack_value_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2324_c2_f7b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2324_c2_f7b7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2324_c2_f7b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2324_c2_f7b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2324_c2_f7b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2324_c2_f7b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2357_l2320_DUPLICATE_e74f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2357_l2320_DUPLICATE_e74f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ade(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2324_c2_f7b7_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2357_l2320_DUPLICATE_e74f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2357_l2320_DUPLICATE_e74f_return_output;
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
