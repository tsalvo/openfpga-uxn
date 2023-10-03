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
-- Submodules: 107
entity neq2_0CLK_3a9c1537 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end neq2_0CLK_3a9c1537;
architecture arch of neq2_0CLK_3a9c1537 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l974_c6_dc81]
signal BIN_OP_EQ_uxn_opcodes_h_l974_c6_dc81_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l974_c6_dc81_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l974_c6_dc81_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l974_c1_fda8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l974_c1_fda8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l974_c1_fda8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l974_c1_fda8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l974_c1_fda8_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l974_c2_227a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l974_c2_227a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l974_c2_227a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l974_c2_227a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l974_c2_227a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l974_c2_227a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_227a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_227a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_227a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_227a_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l974_c2_227a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_227a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_227a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_227a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_227a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l974_c2_227a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_227a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_227a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_227a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_227a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l974_c2_227a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l974_c2_227a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l974_c2_227a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l974_c2_227a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l974_c2_227a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l974_c2_227a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_227a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_227a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_227a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_227a_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l974_c2_227a]
signal result_stack_value_MUX_uxn_opcodes_h_l974_c2_227a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l974_c2_227a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l974_c2_227a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l974_c2_227a_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l974_c2_227a]
signal t16_MUX_uxn_opcodes_h_l974_c2_227a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l974_c2_227a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l974_c2_227a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l974_c2_227a_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l974_c2_227a]
signal n16_MUX_uxn_opcodes_h_l974_c2_227a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l974_c2_227a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l974_c2_227a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l974_c2_227a_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l975_c3_f149[uxn_opcodes_h_l975_c3_f149]
signal printf_uxn_opcodes_h_l975_c3_f149_uxn_opcodes_h_l975_c3_f149_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l980_c11_9602]
signal BIN_OP_EQ_uxn_opcodes_h_l980_c11_9602_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l980_c11_9602_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l980_c11_9602_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l980_c7_b3ff]
signal result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_b3ff_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l980_c7_b3ff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l980_c7_b3ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_b3ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l980_c7_b3ff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_b3ff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l980_c7_b3ff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l980_c7_b3ff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_b3ff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l980_c7_b3ff]
signal result_stack_value_MUX_uxn_opcodes_h_l980_c7_b3ff_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l980_c7_b3ff]
signal t16_MUX_uxn_opcodes_h_l980_c7_b3ff_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l980_c7_b3ff]
signal n16_MUX_uxn_opcodes_h_l980_c7_b3ff_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l983_c11_34d0]
signal BIN_OP_EQ_uxn_opcodes_h_l983_c11_34d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l983_c11_34d0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l983_c11_34d0_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l983_c7_68cf]
signal result_is_stack_read_MUX_uxn_opcodes_h_l983_c7_68cf_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l983_c7_68cf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l983_c7_68cf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_68cf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_68cf_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l983_c7_68cf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_68cf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_68cf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l983_c7_68cf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_68cf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_68cf_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l983_c7_68cf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l983_c7_68cf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l983_c7_68cf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l983_c7_68cf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_68cf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_68cf_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l983_c7_68cf]
signal result_stack_value_MUX_uxn_opcodes_h_l983_c7_68cf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l983_c7_68cf_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l983_c7_68cf]
signal t16_MUX_uxn_opcodes_h_l983_c7_68cf_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l983_c7_68cf_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l983_c7_68cf]
signal n16_MUX_uxn_opcodes_h_l983_c7_68cf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l983_c7_68cf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l988_c11_8685]
signal BIN_OP_EQ_uxn_opcodes_h_l988_c11_8685_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l988_c11_8685_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l988_c11_8685_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l988_c7_7f64]
signal result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_7f64_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_7f64_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l988_c7_7f64]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_7f64_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_7f64_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l988_c7_7f64]
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_7f64_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_7f64_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l988_c7_7f64]
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_7f64_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_7f64_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l988_c7_7f64]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_7f64_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_7f64_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l988_c7_7f64]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_7f64_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_7f64_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l988_c7_7f64]
signal result_stack_value_MUX_uxn_opcodes_h_l988_c7_7f64_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l988_c7_7f64_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l988_c7_7f64]
signal t16_MUX_uxn_opcodes_h_l988_c7_7f64_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l988_c7_7f64_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l988_c7_7f64]
signal n16_MUX_uxn_opcodes_h_l988_c7_7f64_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l988_c7_7f64_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l991_c11_b2d0]
signal BIN_OP_EQ_uxn_opcodes_h_l991_c11_b2d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l991_c11_b2d0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l991_c11_b2d0_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l991_c7_15d1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_15d1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_15d1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l991_c7_15d1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_15d1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_15d1_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l991_c7_15d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_15d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_15d1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l991_c7_15d1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_15d1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_15d1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l991_c7_15d1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_15d1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_15d1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l991_c7_15d1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_15d1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_15d1_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l991_c7_15d1]
signal result_stack_value_MUX_uxn_opcodes_h_l991_c7_15d1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l991_c7_15d1_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l991_c7_15d1]
signal t16_MUX_uxn_opcodes_h_l991_c7_15d1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l991_c7_15d1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l991_c7_15d1]
signal n16_MUX_uxn_opcodes_h_l991_c7_15d1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l991_c7_15d1_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l992_c3_f0ee]
signal BIN_OP_OR_uxn_opcodes_h_l992_c3_f0ee_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l992_c3_f0ee_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l992_c3_f0ee_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l995_c11_8a77]
signal BIN_OP_EQ_uxn_opcodes_h_l995_c11_8a77_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l995_c11_8a77_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l995_c11_8a77_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l995_c7_9c21]
signal result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_9c21_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_9c21_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l995_c7_9c21]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_9c21_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_9c21_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l995_c7_9c21]
signal result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_9c21_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_9c21_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l995_c7_9c21]
signal result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_9c21_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_9c21_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l995_c7_9c21]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_9c21_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_9c21_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l995_c7_9c21]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_9c21_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_9c21_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l995_c7_9c21]
signal result_stack_value_MUX_uxn_opcodes_h_l995_c7_9c21_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l995_c7_9c21_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l995_c7_9c21]
signal n16_MUX_uxn_opcodes_h_l995_c7_9c21_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l995_c7_9c21_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l998_c11_b15a]
signal BIN_OP_EQ_uxn_opcodes_h_l998_c11_b15a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l998_c11_b15a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l998_c11_b15a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l998_c7_11d9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l998_c7_11d9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l998_c7_11d9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l998_c7_11d9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_11d9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_11d9_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l998_c7_11d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_11d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_11d9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l998_c7_11d9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_11d9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_11d9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l998_c7_11d9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_11d9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_11d9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l998_c7_11d9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_11d9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_11d9_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l998_c7_11d9]
signal result_stack_value_MUX_uxn_opcodes_h_l998_c7_11d9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l998_c7_11d9_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l998_c7_11d9]
signal n16_MUX_uxn_opcodes_h_l998_c7_11d9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l998_c7_11d9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_6a1c]
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_6a1c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_6a1c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_6a1c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1003_c7_c209]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_c209_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_c209_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1003_c7_c209]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_c209_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_c209_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1003_c7_c209]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c209_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c209_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1003_c7_c209]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c209_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c209_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1003_c7_c209]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_c209_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_c209_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1003_c7_c209]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_c209_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_c209_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1003_c7_c209]
signal result_stack_value_MUX_uxn_opcodes_h_l1003_c7_c209_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1003_c7_c209_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1003_c7_c209]
signal n16_MUX_uxn_opcodes_h_l1003_c7_c209_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1003_c7_c209_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1006_c11_5cf6]
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5cf6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5cf6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5cf6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1006_c7_b970]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1006_c7_b970_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1006_c7_b970_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1006_c7_b970]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_b970_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_b970_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1006_c7_b970]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_b970_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_b970_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1006_c7_b970]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_b970_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_b970_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1006_c7_b970]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_b970_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_b970_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1006_c7_b970]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_b970_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_b970_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1006_c7_b970]
signal result_stack_value_MUX_uxn_opcodes_h_l1006_c7_b970_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1006_c7_b970_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1006_c7_b970]
signal n16_MUX_uxn_opcodes_h_l1006_c7_b970_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1006_c7_b970_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1007_c3_dc01]
signal BIN_OP_OR_uxn_opcodes_h_l1007_c3_dc01_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1007_c3_dc01_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1007_c3_dc01_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1010_c32_cff5]
signal BIN_OP_AND_uxn_opcodes_h_l1010_c32_cff5_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1010_c32_cff5_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1010_c32_cff5_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1010_c32_0ab5]
signal BIN_OP_GT_uxn_opcodes_h_l1010_c32_0ab5_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1010_c32_0ab5_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1010_c32_0ab5_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1010_c32_940b]
signal MUX_uxn_opcodes_h_l1010_c32_940b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1010_c32_940b_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1010_c32_940b_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1010_c32_940b_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1012_c11_6aa5]
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_6aa5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_6aa5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_6aa5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1012_c7_e7cc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_e7cc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_e7cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_e7cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1012_c7_e7cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_e7cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_e7cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_e7cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1012_c7_e7cc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_e7cc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_e7cc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_e7cc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1012_c7_e7cc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_e7cc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_e7cc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_e7cc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1012_c7_e7cc]
signal result_stack_value_MUX_uxn_opcodes_h_l1012_c7_e7cc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1012_c7_e7cc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1012_c7_e7cc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1016_c24_c9de]
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c24_c9de_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c24_c9de_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c24_c9de_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1016_c24_ba93]
signal MUX_uxn_opcodes_h_l1016_c24_ba93_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1016_c24_ba93_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1016_c24_ba93_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1016_c24_ba93_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1018_c11_a37d]
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_a37d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_a37d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_a37d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1018_c7_d97f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_d97f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_d97f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_d97f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_d97f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1018_c7_d97f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_d97f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_d97f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_d97f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_d97f_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1000_l985_DUPLICATE_05fc
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1000_l985_DUPLICATE_05fc_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1000_l985_DUPLICATE_05fc_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_28d7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l974_c6_dc81
BIN_OP_EQ_uxn_opcodes_h_l974_c6_dc81 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l974_c6_dc81_left,
BIN_OP_EQ_uxn_opcodes_h_l974_c6_dc81_right,
BIN_OP_EQ_uxn_opcodes_h_l974_c6_dc81_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l974_c1_fda8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l974_c1_fda8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l974_c1_fda8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l974_c1_fda8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l974_c1_fda8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l974_c1_fda8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l974_c2_227a
result_is_stack_read_MUX_uxn_opcodes_h_l974_c2_227a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l974_c2_227a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l974_c2_227a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l974_c2_227a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l974_c2_227a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_227a
result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_227a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_227a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_227a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_227a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_227a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_227a
result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_227a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_227a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_227a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_227a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_227a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_227a
result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_227a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_227a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_227a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_227a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_227a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l974_c2_227a
result_is_sp_shift_MUX_uxn_opcodes_h_l974_c2_227a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l974_c2_227a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l974_c2_227a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l974_c2_227a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l974_c2_227a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_227a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_227a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_227a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_227a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_227a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_227a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l974_c2_227a
result_stack_value_MUX_uxn_opcodes_h_l974_c2_227a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l974_c2_227a_cond,
result_stack_value_MUX_uxn_opcodes_h_l974_c2_227a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l974_c2_227a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l974_c2_227a_return_output);

-- t16_MUX_uxn_opcodes_h_l974_c2_227a
t16_MUX_uxn_opcodes_h_l974_c2_227a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l974_c2_227a_cond,
t16_MUX_uxn_opcodes_h_l974_c2_227a_iftrue,
t16_MUX_uxn_opcodes_h_l974_c2_227a_iffalse,
t16_MUX_uxn_opcodes_h_l974_c2_227a_return_output);

-- n16_MUX_uxn_opcodes_h_l974_c2_227a
n16_MUX_uxn_opcodes_h_l974_c2_227a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l974_c2_227a_cond,
n16_MUX_uxn_opcodes_h_l974_c2_227a_iftrue,
n16_MUX_uxn_opcodes_h_l974_c2_227a_iffalse,
n16_MUX_uxn_opcodes_h_l974_c2_227a_return_output);

-- printf_uxn_opcodes_h_l975_c3_f149_uxn_opcodes_h_l975_c3_f149
printf_uxn_opcodes_h_l975_c3_f149_uxn_opcodes_h_l975_c3_f149 : entity work.printf_uxn_opcodes_h_l975_c3_f149_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l975_c3_f149_uxn_opcodes_h_l975_c3_f149_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l980_c11_9602
BIN_OP_EQ_uxn_opcodes_h_l980_c11_9602 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l980_c11_9602_left,
BIN_OP_EQ_uxn_opcodes_h_l980_c11_9602_right,
BIN_OP_EQ_uxn_opcodes_h_l980_c11_9602_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_b3ff
result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_b3ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_b3ff_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_b3ff
result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_b3ff : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_b3ff
result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_b3ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_b3ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_b3ff
result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_b3ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_b3ff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_b3ff
result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_b3ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_b3ff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_b3ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_b3ff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l980_c7_b3ff
result_stack_value_MUX_uxn_opcodes_h_l980_c7_b3ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l980_c7_b3ff_cond,
result_stack_value_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output);

-- t16_MUX_uxn_opcodes_h_l980_c7_b3ff
t16_MUX_uxn_opcodes_h_l980_c7_b3ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l980_c7_b3ff_cond,
t16_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue,
t16_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse,
t16_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output);

-- n16_MUX_uxn_opcodes_h_l980_c7_b3ff
n16_MUX_uxn_opcodes_h_l980_c7_b3ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l980_c7_b3ff_cond,
n16_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue,
n16_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse,
n16_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l983_c11_34d0
BIN_OP_EQ_uxn_opcodes_h_l983_c11_34d0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l983_c11_34d0_left,
BIN_OP_EQ_uxn_opcodes_h_l983_c11_34d0_right,
BIN_OP_EQ_uxn_opcodes_h_l983_c11_34d0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l983_c7_68cf
result_is_stack_read_MUX_uxn_opcodes_h_l983_c7_68cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l983_c7_68cf_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l983_c7_68cf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_68cf
result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_68cf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_68cf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_68cf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_68cf
result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_68cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_68cf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_68cf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_68cf
result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_68cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_68cf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_68cf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l983_c7_68cf
result_is_sp_shift_MUX_uxn_opcodes_h_l983_c7_68cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l983_c7_68cf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l983_c7_68cf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_68cf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_68cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_68cf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_68cf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l983_c7_68cf
result_stack_value_MUX_uxn_opcodes_h_l983_c7_68cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l983_c7_68cf_cond,
result_stack_value_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l983_c7_68cf_return_output);

-- t16_MUX_uxn_opcodes_h_l983_c7_68cf
t16_MUX_uxn_opcodes_h_l983_c7_68cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l983_c7_68cf_cond,
t16_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue,
t16_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse,
t16_MUX_uxn_opcodes_h_l983_c7_68cf_return_output);

-- n16_MUX_uxn_opcodes_h_l983_c7_68cf
n16_MUX_uxn_opcodes_h_l983_c7_68cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l983_c7_68cf_cond,
n16_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue,
n16_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse,
n16_MUX_uxn_opcodes_h_l983_c7_68cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l988_c11_8685
BIN_OP_EQ_uxn_opcodes_h_l988_c11_8685 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l988_c11_8685_left,
BIN_OP_EQ_uxn_opcodes_h_l988_c11_8685_right,
BIN_OP_EQ_uxn_opcodes_h_l988_c11_8685_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_7f64
result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_7f64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_7f64_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_7f64_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_7f64
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_7f64 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_7f64_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_7f64_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_7f64
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_7f64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_7f64_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_7f64_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_7f64
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_7f64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_7f64_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_7f64_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_7f64
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_7f64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_7f64_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_7f64_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_7f64
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_7f64 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_7f64_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_7f64_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l988_c7_7f64
result_stack_value_MUX_uxn_opcodes_h_l988_c7_7f64 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l988_c7_7f64_cond,
result_stack_value_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l988_c7_7f64_return_output);

-- t16_MUX_uxn_opcodes_h_l988_c7_7f64
t16_MUX_uxn_opcodes_h_l988_c7_7f64 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l988_c7_7f64_cond,
t16_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue,
t16_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse,
t16_MUX_uxn_opcodes_h_l988_c7_7f64_return_output);

-- n16_MUX_uxn_opcodes_h_l988_c7_7f64
n16_MUX_uxn_opcodes_h_l988_c7_7f64 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l988_c7_7f64_cond,
n16_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue,
n16_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse,
n16_MUX_uxn_opcodes_h_l988_c7_7f64_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l991_c11_b2d0
BIN_OP_EQ_uxn_opcodes_h_l991_c11_b2d0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l991_c11_b2d0_left,
BIN_OP_EQ_uxn_opcodes_h_l991_c11_b2d0_right,
BIN_OP_EQ_uxn_opcodes_h_l991_c11_b2d0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_15d1
result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_15d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_15d1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_15d1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_15d1
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_15d1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_15d1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_15d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_15d1
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_15d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_15d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_15d1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_15d1
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_15d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_15d1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_15d1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_15d1
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_15d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_15d1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_15d1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_15d1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_15d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_15d1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_15d1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l991_c7_15d1
result_stack_value_MUX_uxn_opcodes_h_l991_c7_15d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l991_c7_15d1_cond,
result_stack_value_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l991_c7_15d1_return_output);

-- t16_MUX_uxn_opcodes_h_l991_c7_15d1
t16_MUX_uxn_opcodes_h_l991_c7_15d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l991_c7_15d1_cond,
t16_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue,
t16_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse,
t16_MUX_uxn_opcodes_h_l991_c7_15d1_return_output);

-- n16_MUX_uxn_opcodes_h_l991_c7_15d1
n16_MUX_uxn_opcodes_h_l991_c7_15d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l991_c7_15d1_cond,
n16_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue,
n16_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse,
n16_MUX_uxn_opcodes_h_l991_c7_15d1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l992_c3_f0ee
BIN_OP_OR_uxn_opcodes_h_l992_c3_f0ee : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l992_c3_f0ee_left,
BIN_OP_OR_uxn_opcodes_h_l992_c3_f0ee_right,
BIN_OP_OR_uxn_opcodes_h_l992_c3_f0ee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l995_c11_8a77
BIN_OP_EQ_uxn_opcodes_h_l995_c11_8a77 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l995_c11_8a77_left,
BIN_OP_EQ_uxn_opcodes_h_l995_c11_8a77_right,
BIN_OP_EQ_uxn_opcodes_h_l995_c11_8a77_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_9c21
result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_9c21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_9c21_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_9c21_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_9c21
result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_9c21 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_9c21_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_9c21_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_9c21
result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_9c21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_9c21_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_9c21_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_9c21
result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_9c21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_9c21_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_9c21_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_9c21
result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_9c21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_9c21_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_9c21_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_9c21
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_9c21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_9c21_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_9c21_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l995_c7_9c21
result_stack_value_MUX_uxn_opcodes_h_l995_c7_9c21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l995_c7_9c21_cond,
result_stack_value_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l995_c7_9c21_return_output);

-- n16_MUX_uxn_opcodes_h_l995_c7_9c21
n16_MUX_uxn_opcodes_h_l995_c7_9c21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l995_c7_9c21_cond,
n16_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue,
n16_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse,
n16_MUX_uxn_opcodes_h_l995_c7_9c21_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l998_c11_b15a
BIN_OP_EQ_uxn_opcodes_h_l998_c11_b15a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l998_c11_b15a_left,
BIN_OP_EQ_uxn_opcodes_h_l998_c11_b15a_right,
BIN_OP_EQ_uxn_opcodes_h_l998_c11_b15a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l998_c7_11d9
result_is_stack_read_MUX_uxn_opcodes_h_l998_c7_11d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l998_c7_11d9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l998_c7_11d9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_11d9
result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_11d9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_11d9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_11d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_11d9
result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_11d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_11d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_11d9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_11d9
result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_11d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_11d9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_11d9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_11d9
result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_11d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_11d9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_11d9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_11d9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_11d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_11d9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_11d9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l998_c7_11d9
result_stack_value_MUX_uxn_opcodes_h_l998_c7_11d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l998_c7_11d9_cond,
result_stack_value_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l998_c7_11d9_return_output);

-- n16_MUX_uxn_opcodes_h_l998_c7_11d9
n16_MUX_uxn_opcodes_h_l998_c7_11d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l998_c7_11d9_cond,
n16_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue,
n16_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse,
n16_MUX_uxn_opcodes_h_l998_c7_11d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1003_c11_6a1c
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_6a1c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_6a1c_left,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_6a1c_right,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_6a1c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_c209
result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_c209 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_c209_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_c209_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_c209
result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_c209 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_c209_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_c209_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c209
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c209 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c209_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c209_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c209
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c209 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c209_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c209_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_c209
result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_c209 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_c209_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_c209_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_c209
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_c209 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_c209_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_c209_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1003_c7_c209
result_stack_value_MUX_uxn_opcodes_h_l1003_c7_c209 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1003_c7_c209_cond,
result_stack_value_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1003_c7_c209_return_output);

-- n16_MUX_uxn_opcodes_h_l1003_c7_c209
n16_MUX_uxn_opcodes_h_l1003_c7_c209 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1003_c7_c209_cond,
n16_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue,
n16_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse,
n16_MUX_uxn_opcodes_h_l1003_c7_c209_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5cf6
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5cf6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5cf6_left,
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5cf6_right,
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5cf6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1006_c7_b970
result_is_stack_read_MUX_uxn_opcodes_h_l1006_c7_b970 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1006_c7_b970_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1006_c7_b970_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_b970
result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_b970 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_b970_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_b970_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_b970
result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_b970 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_b970_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_b970_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_b970
result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_b970 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_b970_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_b970_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_b970
result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_b970 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_b970_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_b970_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_b970
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_b970 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_b970_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_b970_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1006_c7_b970
result_stack_value_MUX_uxn_opcodes_h_l1006_c7_b970 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1006_c7_b970_cond,
result_stack_value_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1006_c7_b970_return_output);

-- n16_MUX_uxn_opcodes_h_l1006_c7_b970
n16_MUX_uxn_opcodes_h_l1006_c7_b970 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1006_c7_b970_cond,
n16_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue,
n16_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse,
n16_MUX_uxn_opcodes_h_l1006_c7_b970_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1007_c3_dc01
BIN_OP_OR_uxn_opcodes_h_l1007_c3_dc01 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1007_c3_dc01_left,
BIN_OP_OR_uxn_opcodes_h_l1007_c3_dc01_right,
BIN_OP_OR_uxn_opcodes_h_l1007_c3_dc01_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1010_c32_cff5
BIN_OP_AND_uxn_opcodes_h_l1010_c32_cff5 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1010_c32_cff5_left,
BIN_OP_AND_uxn_opcodes_h_l1010_c32_cff5_right,
BIN_OP_AND_uxn_opcodes_h_l1010_c32_cff5_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1010_c32_0ab5
BIN_OP_GT_uxn_opcodes_h_l1010_c32_0ab5 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1010_c32_0ab5_left,
BIN_OP_GT_uxn_opcodes_h_l1010_c32_0ab5_right,
BIN_OP_GT_uxn_opcodes_h_l1010_c32_0ab5_return_output);

-- MUX_uxn_opcodes_h_l1010_c32_940b
MUX_uxn_opcodes_h_l1010_c32_940b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1010_c32_940b_cond,
MUX_uxn_opcodes_h_l1010_c32_940b_iftrue,
MUX_uxn_opcodes_h_l1010_c32_940b_iffalse,
MUX_uxn_opcodes_h_l1010_c32_940b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1012_c11_6aa5
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_6aa5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_6aa5_left,
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_6aa5_right,
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_6aa5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_e7cc
result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_e7cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_e7cc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_e7cc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_e7cc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_e7cc
result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_e7cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_e7cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_e7cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_e7cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_e7cc
result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_e7cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_e7cc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_e7cc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_e7cc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_e7cc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_e7cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_e7cc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_e7cc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_e7cc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1012_c7_e7cc
result_stack_value_MUX_uxn_opcodes_h_l1012_c7_e7cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1012_c7_e7cc_cond,
result_stack_value_MUX_uxn_opcodes_h_l1012_c7_e7cc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1012_c7_e7cc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1016_c24_c9de
BIN_OP_EQ_uxn_opcodes_h_l1016_c24_c9de : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1016_c24_c9de_left,
BIN_OP_EQ_uxn_opcodes_h_l1016_c24_c9de_right,
BIN_OP_EQ_uxn_opcodes_h_l1016_c24_c9de_return_output);

-- MUX_uxn_opcodes_h_l1016_c24_ba93
MUX_uxn_opcodes_h_l1016_c24_ba93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1016_c24_ba93_cond,
MUX_uxn_opcodes_h_l1016_c24_ba93_iftrue,
MUX_uxn_opcodes_h_l1016_c24_ba93_iffalse,
MUX_uxn_opcodes_h_l1016_c24_ba93_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1018_c11_a37d
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_a37d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_a37d_left,
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_a37d_right,
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_a37d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_d97f
result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_d97f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_d97f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_d97f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_d97f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_d97f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_d97f
result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_d97f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_d97f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_d97f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_d97f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_d97f_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1000_l985_DUPLICATE_05fc
CONST_SL_8_uint16_t_uxn_opcodes_h_l1000_l985_DUPLICATE_05fc : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1000_l985_DUPLICATE_05fc_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1000_l985_DUPLICATE_05fc_return_output);



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
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l974_c6_dc81_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l974_c1_fda8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l974_c2_227a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_227a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_227a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_227a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l974_c2_227a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_227a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l974_c2_227a_return_output,
 t16_MUX_uxn_opcodes_h_l974_c2_227a_return_output,
 n16_MUX_uxn_opcodes_h_l974_c2_227a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l980_c11_9602_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output,
 t16_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output,
 n16_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l983_c11_34d0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l983_c7_68cf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_68cf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_68cf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_68cf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l983_c7_68cf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_68cf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l983_c7_68cf_return_output,
 t16_MUX_uxn_opcodes_h_l983_c7_68cf_return_output,
 n16_MUX_uxn_opcodes_h_l983_c7_68cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l988_c11_8685_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_7f64_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_7f64_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_7f64_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_7f64_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_7f64_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_7f64_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l988_c7_7f64_return_output,
 t16_MUX_uxn_opcodes_h_l988_c7_7f64_return_output,
 n16_MUX_uxn_opcodes_h_l988_c7_7f64_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l991_c11_b2d0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_15d1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_15d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_15d1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_15d1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_15d1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_15d1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l991_c7_15d1_return_output,
 t16_MUX_uxn_opcodes_h_l991_c7_15d1_return_output,
 n16_MUX_uxn_opcodes_h_l991_c7_15d1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l992_c3_f0ee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l995_c11_8a77_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_9c21_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_9c21_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_9c21_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_9c21_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_9c21_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_9c21_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l995_c7_9c21_return_output,
 n16_MUX_uxn_opcodes_h_l995_c7_9c21_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l998_c11_b15a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l998_c7_11d9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_11d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_11d9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_11d9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_11d9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_11d9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l998_c7_11d9_return_output,
 n16_MUX_uxn_opcodes_h_l998_c7_11d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1003_c11_6a1c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_c209_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_c209_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c209_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c209_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_c209_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_c209_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1003_c7_c209_return_output,
 n16_MUX_uxn_opcodes_h_l1003_c7_c209_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5cf6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1006_c7_b970_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_b970_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_b970_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_b970_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_b970_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_b970_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1006_c7_b970_return_output,
 n16_MUX_uxn_opcodes_h_l1006_c7_b970_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1007_c3_dc01_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1010_c32_cff5_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1010_c32_0ab5_return_output,
 MUX_uxn_opcodes_h_l1010_c32_940b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1012_c11_6aa5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1016_c24_c9de_return_output,
 MUX_uxn_opcodes_h_l1016_c24_ba93_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1018_c11_a37d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_d97f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_d97f_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1000_l985_DUPLICATE_05fc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c6_dc81_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c6_dc81_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c6_dc81_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l974_c1_fda8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l974_c1_fda8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l974_c1_fda8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l974_c1_fda8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l974_c2_227a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l974_c2_227a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l974_c2_227a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l974_c2_227a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_227a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_227a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_227a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_227a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_227a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_227a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_227a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_227a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_227a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_227a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_227a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_227a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c2_227a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c2_227a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c2_227a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c2_227a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_227a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l977_c3_6fdd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_227a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_227a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_227a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c2_227a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c2_227a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c2_227a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c2_227a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l974_c2_227a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l974_c2_227a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l974_c2_227a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l974_c2_227a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l974_c2_227a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l974_c2_227a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l974_c2_227a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l974_c2_227a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l975_c3_f149_uxn_opcodes_h_l975_c3_f149_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_9602_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_9602_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_9602_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l983_c7_68cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_b3ff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_68cf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_68cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_b3ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_68cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_b3ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c7_68cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l981_c3_ccd3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_68cf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_b3ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l983_c7_68cf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l980_c7_b3ff_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l983_c7_68cf_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l980_c7_b3ff_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l983_c7_68cf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l980_c7_b3ff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_34d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_34d0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_34d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_7f64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l983_c7_68cf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_7f64_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_68cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_7f64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_68cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_7f64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_68cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_7f64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c7_68cf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l986_c3_9fce : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_7f64_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_68cf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l988_c7_7f64_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l983_c7_68cf_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c7_7f64_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l983_c7_68cf_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c7_7f64_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l983_c7_68cf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_8685_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_8685_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_8685_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_15d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_7f64_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_15d1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_7f64_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_15d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_7f64_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_15d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_7f64_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_15d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_7f64_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l989_c3_e32e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_15d1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_7f64_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_15d1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l988_c7_7f64_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l991_c7_15d1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c7_7f64_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_15d1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c7_7f64_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_b2d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_b2d0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_b2d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_9c21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_15d1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_9c21_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_15d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_9c21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_15d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_9c21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_15d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_9c21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_15d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l993_c3_c513 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_9c21_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_15d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_9c21_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_15d1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l991_c7_15d1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l995_c7_9c21_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_15d1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_f0ee_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_f0ee_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_f0ee_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_8a77_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_8a77_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_8a77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l998_c7_11d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_9c21_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_11d9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_9c21_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_11d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_9c21_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_11d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_9c21_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_11d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_9c21_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l996_c3_8466 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_11d9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_9c21_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l998_c7_11d9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_9c21_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l998_c7_11d9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l995_c7_9c21_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l998_c11_b15a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l998_c11_b15a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l998_c11_b15a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_c209_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l998_c7_11d9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_c209_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_11d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c209_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_11d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c209_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_11d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_c209_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_11d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1001_c3_9797 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_c209_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_11d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_c209_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l998_c7_11d9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1003_c7_c209_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l998_c7_11d9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_6a1c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_6a1c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_6a1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1006_c7_b970_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_c209_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_b970_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_c209_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_b970_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c209_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_b970_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c209_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_b970_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_c209_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1004_c3_175a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_b970_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_c209_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1006_c7_b970_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_c209_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1006_c7_b970_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1003_c7_c209_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5cf6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5cf6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5cf6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1006_c7_b970_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_b970_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_b970_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_b970_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_b970_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_b970_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1006_c7_b970_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1006_c7_b970_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1007_c3_dc01_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1007_c3_dc01_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1007_c3_dc01_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1010_c32_940b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1010_c32_940b_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1010_c32_940b_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1010_c32_cff5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1010_c32_cff5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1010_c32_cff5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1010_c32_0ab5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1010_c32_0ab5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1010_c32_0ab5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1010_c32_940b_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_6aa5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_6aa5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_6aa5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_e7cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_e7cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_d97f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_e7cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_e7cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_e7cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_d97f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_e7cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_e7cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_e7cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_e7cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_e7cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1015_c3_02f0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_e7cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_e7cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_e7cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_e7cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_e7cc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1016_c24_ba93_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1016_c24_ba93_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1016_c24_ba93_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c24_c9de_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c24_c9de_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c24_c9de_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1016_c24_ba93_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_a37d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_a37d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_a37d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_d97f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_d97f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_d97f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_d97f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_d97f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_d97f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l995_l991_l988_l983_l1006_l980_l1003_l974_l998_DUPLICATE_c849_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l995_l991_l1018_l988_l983_l1006_l980_l1003_l974_l998_DUPLICATE_e6f4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l995_l991_l988_l1012_l983_l980_l1003_l974_l998_DUPLICATE_1865_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l995_l991_l988_l1012_l983_l1006_l980_l1003_l974_l998_DUPLICATE_37e7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l995_l991_l988_l983_l1006_l980_l1003_l998_DUPLICATE_9136_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l995_l991_l1018_l988_l1012_l983_l1006_l980_l1003_l998_DUPLICATE_4c0f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l992_l999_l984_l1007_DUPLICATE_1a65_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1000_l985_DUPLICATE_05fc_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1000_l985_DUPLICATE_05fc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1006_l1012_DUPLICATE_76c7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1023_l970_DUPLICATE_6cd1_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l996_c3_8466 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l996_c3_8466;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_227a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_34d0_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1004_c3_175a := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1004_c3_175a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l977_c3_6fdd := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_227a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l977_c3_6fdd;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l993_c3_c513 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l993_c3_c513;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l989_c3_e32e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l989_c3_e32e;
     VAR_MUX_uxn_opcodes_h_l1010_c32_940b_iffalse := resize(to_signed(-3, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c6_dc81_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_e7cc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1010_c32_cff5_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l1016_c24_ba93_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1010_c32_0ab5_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_6a1c_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l981_c3_ccd3 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l981_c3_ccd3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_a37d_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_6aa5_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_8a77_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l974_c2_227a_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1010_c32_940b_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1001_c3_9797 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1001_c3_9797;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_d97f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l998_c11_b15a_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l974_c1_fda8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5cf6_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_b2d0_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l986_c3_9fce := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l986_c3_9fce;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_9602_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1016_c24_ba93_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_8685_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_d97f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_e7cc_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1015_c3_02f0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_e7cc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1015_c3_02f0;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l974_c1_fda8_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1010_c32_cff5_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c24_c9de_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1007_c3_dc01_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse := n16;
     VAR_n16_MUX_uxn_opcodes_h_l974_c2_227a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_6a1c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5cf6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_6aa5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_a37d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c6_dc81_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_9602_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_34d0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_8685_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_b2d0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_8a77_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l998_c11_b15a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c24_c9de_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_f0ee_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l974_c2_227a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l988_c11_8685] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l988_c11_8685_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_8685_left;
     BIN_OP_EQ_uxn_opcodes_h_l988_c11_8685_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_8685_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_8685_return_output := BIN_OP_EQ_uxn_opcodes_h_l988_c11_8685_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l995_l991_l988_l983_l1006_l980_l1003_l974_l998_DUPLICATE_c849 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l995_l991_l988_l983_l1006_l980_l1003_l974_l998_DUPLICATE_c849_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l995_l991_l1018_l988_l1012_l983_l1006_l980_l1003_l998_DUPLICATE_4c0f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l995_l991_l1018_l988_l1012_l983_l1006_l980_l1003_l998_DUPLICATE_4c0f_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l974_c6_dc81] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l974_c6_dc81_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c6_dc81_left;
     BIN_OP_EQ_uxn_opcodes_h_l974_c6_dc81_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c6_dc81_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c6_dc81_return_output := BIN_OP_EQ_uxn_opcodes_h_l974_c6_dc81_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l995_c11_8a77] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l995_c11_8a77_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_8a77_left;
     BIN_OP_EQ_uxn_opcodes_h_l995_c11_8a77_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_8a77_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_8a77_return_output := BIN_OP_EQ_uxn_opcodes_h_l995_c11_8a77_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l995_l991_l988_l1012_l983_l980_l1003_l974_l998_DUPLICATE_1865 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l995_l991_l988_l1012_l983_l980_l1003_l974_l998_DUPLICATE_1865_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l995_l991_l1018_l988_l983_l1006_l980_l1003_l974_l998_DUPLICATE_e6f4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l995_l991_l1018_l988_l983_l1006_l980_l1003_l974_l998_DUPLICATE_e6f4_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l992_l999_l984_l1007_DUPLICATE_1a65 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l992_l999_l984_l1007_DUPLICATE_1a65_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_6a1c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_6a1c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_6a1c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_6a1c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_6a1c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_6a1c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1003_c11_6a1c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1012_c11_6aa5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1012_c11_6aa5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_6aa5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1012_c11_6aa5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_6aa5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_6aa5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1012_c11_6aa5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l983_c11_34d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l983_c11_34d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_34d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l983_c11_34d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_34d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_34d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l983_c11_34d0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l995_l991_l988_l983_l1006_l980_l1003_l998_DUPLICATE_9136 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l995_l991_l988_l983_l1006_l980_l1003_l998_DUPLICATE_9136_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l998_c11_b15a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l998_c11_b15a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l998_c11_b15a_left;
     BIN_OP_EQ_uxn_opcodes_h_l998_c11_b15a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l998_c11_b15a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l998_c11_b15a_return_output := BIN_OP_EQ_uxn_opcodes_h_l998_c11_b15a_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1010_c32_cff5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1010_c32_cff5_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1010_c32_cff5_left;
     BIN_OP_AND_uxn_opcodes_h_l1010_c32_cff5_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1010_c32_cff5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1010_c32_cff5_return_output := BIN_OP_AND_uxn_opcodes_h_l1010_c32_cff5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l991_c11_b2d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l991_c11_b2d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_b2d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l991_c11_b2d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_b2d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_b2d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l991_c11_b2d0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1018_c11_a37d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1018_c11_a37d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_a37d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1018_c11_a37d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_a37d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_a37d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1018_c11_a37d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l995_l991_l988_l1012_l983_l1006_l980_l1003_l974_l998_DUPLICATE_37e7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l995_l991_l988_l1012_l983_l1006_l980_l1003_l974_l998_DUPLICATE_37e7_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1016_c24_c9de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1016_c24_c9de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c24_c9de_left;
     BIN_OP_EQ_uxn_opcodes_h_l1016_c24_c9de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c24_c9de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c24_c9de_return_output := BIN_OP_EQ_uxn_opcodes_h_l1016_c24_c9de_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1006_c11_5cf6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5cf6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5cf6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5cf6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5cf6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5cf6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5cf6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l980_c11_9602] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l980_c11_9602_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_9602_left;
     BIN_OP_EQ_uxn_opcodes_h_l980_c11_9602_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_9602_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_9602_return_output := BIN_OP_EQ_uxn_opcodes_h_l980_c11_9602_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1006_l1012_DUPLICATE_76c7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1006_l1012_DUPLICATE_76c7_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1010_c32_0ab5_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1010_c32_cff5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1003_c7_c209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_6a1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_6a1c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_c209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_6a1c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_c209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_6a1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_6a1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_c209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_6a1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_c209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_6a1c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_c209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_6a1c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1006_c7_b970_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5cf6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_b970_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5cf6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_b970_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5cf6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1006_c7_b970_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5cf6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_b970_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5cf6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_b970_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5cf6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_b970_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5cf6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1006_c7_b970_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5cf6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_e7cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_6aa5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_e7cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_6aa5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_e7cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_6aa5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_e7cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_6aa5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_e7cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_6aa5_return_output;
     VAR_MUX_uxn_opcodes_h_l1016_c24_ba93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c24_c9de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_d97f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_a37d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_d97f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_a37d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l974_c1_fda8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c6_dc81_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l974_c2_227a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c6_dc81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_227a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c6_dc81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c2_227a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c6_dc81_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l974_c2_227a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c6_dc81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_227a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c6_dc81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_227a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c6_dc81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_227a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c6_dc81_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c2_227a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c6_dc81_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l974_c2_227a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c6_dc81_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l980_c7_b3ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_9602_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_b3ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_9602_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_9602_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_b3ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_9602_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_b3ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_9602_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_9602_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_b3ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_9602_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l980_c7_b3ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_9602_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l980_c7_b3ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_9602_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l983_c7_68cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_34d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_68cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_34d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c7_68cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_34d0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l983_c7_68cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_34d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_68cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_34d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_68cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_34d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_68cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_34d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l983_c7_68cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_34d0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l983_c7_68cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c11_34d0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l988_c7_7f64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_8685_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_7f64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_8685_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_7f64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_8685_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_7f64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_8685_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_7f64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_8685_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_7f64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_8685_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_7f64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_8685_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l988_c7_7f64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_8685_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l988_c7_7f64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_8685_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_15d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_b2d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_15d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_b2d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_15d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_b2d0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_15d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_b2d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_15d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_b2d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_15d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_b2d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_15d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_b2d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_15d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_b2d0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l991_c7_15d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_b2d0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l995_c7_9c21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_8a77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_9c21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_8a77_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_9c21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_8a77_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_9c21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_8a77_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_9c21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_8a77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_9c21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_8a77_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_9c21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_8a77_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_9c21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_8a77_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l998_c7_11d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l998_c11_b15a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_11d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l998_c11_b15a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_11d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l998_c11_b15a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l998_c7_11d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l998_c11_b15a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_11d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l998_c11_b15a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_11d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l998_c11_b15a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_11d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l998_c11_b15a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l998_c7_11d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l998_c11_b15a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1007_c3_dc01_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l992_l999_l984_l1007_DUPLICATE_1a65_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_f0ee_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l992_l999_l984_l1007_DUPLICATE_1a65_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1000_l985_DUPLICATE_05fc_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l992_l999_l984_l1007_DUPLICATE_1a65_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l995_l991_l988_l983_l1006_l980_l1003_l974_l998_DUPLICATE_c849_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l995_l991_l988_l983_l1006_l980_l1003_l974_l998_DUPLICATE_c849_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_227a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l995_l991_l988_l983_l1006_l980_l1003_l974_l998_DUPLICATE_c849_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l995_l991_l988_l983_l1006_l980_l1003_l974_l998_DUPLICATE_c849_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l995_l991_l988_l983_l1006_l980_l1003_l974_l998_DUPLICATE_c849_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l995_l991_l988_l983_l1006_l980_l1003_l974_l998_DUPLICATE_c849_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l995_l991_l988_l983_l1006_l980_l1003_l974_l998_DUPLICATE_c849_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l995_l991_l988_l983_l1006_l980_l1003_l974_l998_DUPLICATE_c849_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l995_l991_l988_l983_l1006_l980_l1003_l974_l998_DUPLICATE_c849_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l995_l991_l1018_l988_l1012_l983_l1006_l980_l1003_l998_DUPLICATE_4c0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l995_l991_l1018_l988_l1012_l983_l1006_l980_l1003_l998_DUPLICATE_4c0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_e7cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l995_l991_l1018_l988_l1012_l983_l1006_l980_l1003_l998_DUPLICATE_4c0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_d97f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l995_l991_l1018_l988_l1012_l983_l1006_l980_l1003_l998_DUPLICATE_4c0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l995_l991_l1018_l988_l1012_l983_l1006_l980_l1003_l998_DUPLICATE_4c0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l995_l991_l1018_l988_l1012_l983_l1006_l980_l1003_l998_DUPLICATE_4c0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l995_l991_l1018_l988_l1012_l983_l1006_l980_l1003_l998_DUPLICATE_4c0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l995_l991_l1018_l988_l1012_l983_l1006_l980_l1003_l998_DUPLICATE_4c0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l995_l991_l1018_l988_l1012_l983_l1006_l980_l1003_l998_DUPLICATE_4c0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l995_l991_l1018_l988_l1012_l983_l1006_l980_l1003_l998_DUPLICATE_4c0f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l995_l991_l988_l1012_l983_l980_l1003_l974_l998_DUPLICATE_1865_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_e7cc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l995_l991_l988_l1012_l983_l980_l1003_l974_l998_DUPLICATE_1865_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c2_227a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l995_l991_l988_l1012_l983_l980_l1003_l974_l998_DUPLICATE_1865_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l995_l991_l988_l1012_l983_l980_l1003_l974_l998_DUPLICATE_1865_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l995_l991_l988_l1012_l983_l980_l1003_l974_l998_DUPLICATE_1865_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l995_l991_l988_l1012_l983_l980_l1003_l974_l998_DUPLICATE_1865_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l995_l991_l988_l1012_l983_l980_l1003_l974_l998_DUPLICATE_1865_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l995_l991_l988_l1012_l983_l980_l1003_l974_l998_DUPLICATE_1865_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l995_l991_l988_l1012_l983_l980_l1003_l974_l998_DUPLICATE_1865_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l995_l991_l988_l983_l1006_l980_l1003_l998_DUPLICATE_9136_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l995_l991_l988_l983_l1006_l980_l1003_l998_DUPLICATE_9136_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l995_l991_l988_l983_l1006_l980_l1003_l998_DUPLICATE_9136_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l995_l991_l988_l983_l1006_l980_l1003_l998_DUPLICATE_9136_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l995_l991_l988_l983_l1006_l980_l1003_l998_DUPLICATE_9136_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l995_l991_l988_l983_l1006_l980_l1003_l998_DUPLICATE_9136_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l995_l991_l988_l983_l1006_l980_l1003_l998_DUPLICATE_9136_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l995_l991_l988_l983_l1006_l980_l1003_l998_DUPLICATE_9136_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l995_l991_l1018_l988_l983_l1006_l980_l1003_l974_l998_DUPLICATE_e6f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l995_l991_l1018_l988_l983_l1006_l980_l1003_l974_l998_DUPLICATE_e6f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_d97f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l995_l991_l1018_l988_l983_l1006_l980_l1003_l974_l998_DUPLICATE_e6f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_227a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l995_l991_l1018_l988_l983_l1006_l980_l1003_l974_l998_DUPLICATE_e6f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l995_l991_l1018_l988_l983_l1006_l980_l1003_l974_l998_DUPLICATE_e6f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l995_l991_l1018_l988_l983_l1006_l980_l1003_l974_l998_DUPLICATE_e6f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l995_l991_l1018_l988_l983_l1006_l980_l1003_l974_l998_DUPLICATE_e6f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l995_l991_l1018_l988_l983_l1006_l980_l1003_l974_l998_DUPLICATE_e6f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l995_l991_l1018_l988_l983_l1006_l980_l1003_l974_l998_DUPLICATE_e6f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l995_l991_l1018_l988_l983_l1006_l980_l1003_l974_l998_DUPLICATE_e6f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1006_l1012_DUPLICATE_76c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_e7cc_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1006_l1012_DUPLICATE_76c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l995_l991_l988_l1012_l983_l1006_l980_l1003_l974_l998_DUPLICATE_37e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l995_l991_l988_l1012_l983_l1006_l980_l1003_l974_l998_DUPLICATE_37e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_e7cc_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l995_l991_l988_l1012_l983_l1006_l980_l1003_l974_l998_DUPLICATE_37e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c2_227a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l995_l991_l988_l1012_l983_l1006_l980_l1003_l974_l998_DUPLICATE_37e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l995_l991_l988_l1012_l983_l1006_l980_l1003_l974_l998_DUPLICATE_37e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l995_l991_l988_l1012_l983_l1006_l980_l1003_l974_l998_DUPLICATE_37e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l995_l991_l988_l1012_l983_l1006_l980_l1003_l974_l998_DUPLICATE_37e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l995_l991_l988_l1012_l983_l1006_l980_l1003_l974_l998_DUPLICATE_37e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l995_l991_l988_l1012_l983_l1006_l980_l1003_l974_l998_DUPLICATE_37e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l995_l991_l988_l1012_l983_l1006_l980_l1003_l974_l998_DUPLICATE_37e7_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l992_c3_f0ee] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l992_c3_f0ee_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_f0ee_left;
     BIN_OP_OR_uxn_opcodes_h_l992_c3_f0ee_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_f0ee_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_f0ee_return_output := BIN_OP_OR_uxn_opcodes_h_l992_c3_f0ee_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1000_l985_DUPLICATE_05fc LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1000_l985_DUPLICATE_05fc_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1000_l985_DUPLICATE_05fc_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1000_l985_DUPLICATE_05fc_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1000_l985_DUPLICATE_05fc_return_output;

     -- MUX[uxn_opcodes_h_l1016_c24_ba93] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1016_c24_ba93_cond <= VAR_MUX_uxn_opcodes_h_l1016_c24_ba93_cond;
     MUX_uxn_opcodes_h_l1016_c24_ba93_iftrue <= VAR_MUX_uxn_opcodes_h_l1016_c24_ba93_iftrue;
     MUX_uxn_opcodes_h_l1016_c24_ba93_iffalse <= VAR_MUX_uxn_opcodes_h_l1016_c24_ba93_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1016_c24_ba93_return_output := MUX_uxn_opcodes_h_l1016_c24_ba93_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1012_c7_e7cc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_e7cc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_e7cc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_e7cc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_e7cc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_e7cc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_e7cc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1012_c7_e7cc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_e7cc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_e7cc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_e7cc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_e7cc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_e7cc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_e7cc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l974_c1_fda8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l974_c1_fda8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l974_c1_fda8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l974_c1_fda8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l974_c1_fda8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l974_c1_fda8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l974_c1_fda8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l974_c1_fda8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l974_c1_fda8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1018_c7_d97f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_d97f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_d97f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_d97f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_d97f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_d97f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_d97f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_d97f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_d97f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1018_c7_d97f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_d97f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_d97f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_d97f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_d97f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_d97f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_d97f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_d97f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_d97f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1006_c7_b970] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1006_c7_b970_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1006_c7_b970_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1006_c7_b970_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1006_c7_b970_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1007_c3_dc01] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1007_c3_dc01_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1007_c3_dc01_left;
     BIN_OP_OR_uxn_opcodes_h_l1007_c3_dc01_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1007_c3_dc01_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1007_c3_dc01_return_output := BIN_OP_OR_uxn_opcodes_h_l1007_c3_dc01_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1010_c32_0ab5] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1010_c32_0ab5_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1010_c32_0ab5_left;
     BIN_OP_GT_uxn_opcodes_h_l1010_c32_0ab5_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1010_c32_0ab5_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1010_c32_0ab5_return_output := BIN_OP_GT_uxn_opcodes_h_l1010_c32_0ab5_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1010_c32_940b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1010_c32_0ab5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1007_c3_dc01_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_f0ee_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1000_l985_DUPLICATE_05fc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1000_l985_DUPLICATE_05fc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_e7cc_iftrue := VAR_MUX_uxn_opcodes_h_l1016_c24_ba93_return_output;
     VAR_printf_uxn_opcodes_h_l975_c3_f149_uxn_opcodes_h_l975_c3_f149_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l974_c1_fda8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_e7cc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_d97f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1006_c7_b970_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_e7cc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_d97f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1003_c7_c209] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_c209_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_c209_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_c209_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_c209_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1012_c7_e7cc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_e7cc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_e7cc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_e7cc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_e7cc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_e7cc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_e7cc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1006_c7_b970] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_b970_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_b970_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_b970_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_b970_return_output;

     -- MUX[uxn_opcodes_h_l1010_c32_940b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1010_c32_940b_cond <= VAR_MUX_uxn_opcodes_h_l1010_c32_940b_cond;
     MUX_uxn_opcodes_h_l1010_c32_940b_iftrue <= VAR_MUX_uxn_opcodes_h_l1010_c32_940b_iftrue;
     MUX_uxn_opcodes_h_l1010_c32_940b_iffalse <= VAR_MUX_uxn_opcodes_h_l1010_c32_940b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1010_c32_940b_return_output := MUX_uxn_opcodes_h_l1010_c32_940b_return_output;

     -- printf_uxn_opcodes_h_l975_c3_f149[uxn_opcodes_h_l975_c3_f149] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l975_c3_f149_uxn_opcodes_h_l975_c3_f149_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l975_c3_f149_uxn_opcodes_h_l975_c3_f149_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t16_MUX[uxn_opcodes_h_l991_c7_15d1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l991_c7_15d1_cond <= VAR_t16_MUX_uxn_opcodes_h_l991_c7_15d1_cond;
     t16_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue;
     t16_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l991_c7_15d1_return_output := t16_MUX_uxn_opcodes_h_l991_c7_15d1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1006_c7_b970] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_b970_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_b970_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_b970_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_b970_return_output;

     -- n16_MUX[uxn_opcodes_h_l1006_c7_b970] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1006_c7_b970_cond <= VAR_n16_MUX_uxn_opcodes_h_l1006_c7_b970_cond;
     n16_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue;
     n16_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1006_c7_b970_return_output := n16_MUX_uxn_opcodes_h_l1006_c7_b970_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1012_c7_e7cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_e7cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_e7cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_e7cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_e7cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_e7cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_e7cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1012_c7_e7cc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1012_c7_e7cc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_e7cc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1012_c7_e7cc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_e7cc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1012_c7_e7cc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_e7cc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output := result_stack_value_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue := VAR_MUX_uxn_opcodes_h_l1010_c32_940b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1006_c7_b970_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_b970_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_c209_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_b970_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1012_c7_e7cc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse := VAR_t16_MUX_uxn_opcodes_h_l991_c7_15d1_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1003_c7_c209] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_c209_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_c209_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_c209_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_c209_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1006_c7_b970] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1006_c7_b970_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1006_c7_b970_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1006_c7_b970_return_output := result_stack_value_MUX_uxn_opcodes_h_l1006_c7_b970_return_output;

     -- n16_MUX[uxn_opcodes_h_l1003_c7_c209] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1003_c7_c209_cond <= VAR_n16_MUX_uxn_opcodes_h_l1003_c7_c209_cond;
     n16_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue;
     n16_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1003_c7_c209_return_output := n16_MUX_uxn_opcodes_h_l1003_c7_c209_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1003_c7_c209] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_c209_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_c209_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_c209_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_c209_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1006_c7_b970] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_b970_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_b970_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_b970_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_b970_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1006_c7_b970] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_b970_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_b970_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_b970_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_b970_return_output;

     -- t16_MUX[uxn_opcodes_h_l988_c7_7f64] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l988_c7_7f64_cond <= VAR_t16_MUX_uxn_opcodes_h_l988_c7_7f64_cond;
     t16_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue;
     t16_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l988_c7_7f64_return_output := t16_MUX_uxn_opcodes_h_l988_c7_7f64_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l998_c7_11d9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l998_c7_11d9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l998_c7_11d9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l998_c7_11d9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l998_c7_11d9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1006_c7_b970] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_b970_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_b970_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_b970_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_b970_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_b970_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_b970_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1003_c7_c209_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_b970_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_c209_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l998_c7_11d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_b970_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_b970_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_c209_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1006_c7_b970_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse := VAR_t16_MUX_uxn_opcodes_h_l988_c7_7f64_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1003_c7_c209] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_c209_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_c209_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_c209_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_c209_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1003_c7_c209] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c209_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c209_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c209_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c209_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l998_c7_11d9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_11d9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_11d9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_11d9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_11d9_return_output;

     -- n16_MUX[uxn_opcodes_h_l998_c7_11d9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l998_c7_11d9_cond <= VAR_n16_MUX_uxn_opcodes_h_l998_c7_11d9_cond;
     n16_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue;
     n16_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l998_c7_11d9_return_output := n16_MUX_uxn_opcodes_h_l998_c7_11d9_return_output;

     -- t16_MUX[uxn_opcodes_h_l983_c7_68cf] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l983_c7_68cf_cond <= VAR_t16_MUX_uxn_opcodes_h_l983_c7_68cf_cond;
     t16_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue;
     t16_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l983_c7_68cf_return_output := t16_MUX_uxn_opcodes_h_l983_c7_68cf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1003_c7_c209] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1003_c7_c209_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_c209_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_c209_return_output := result_stack_value_MUX_uxn_opcodes_h_l1003_c7_c209_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l995_c7_9c21] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_9c21_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_9c21_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_9c21_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_9c21_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1003_c7_c209] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c209_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c209_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c209_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c209_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c209_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c209_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l998_c7_11d9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_11d9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_11d9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_11d9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_11d9_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse := VAR_n16_MUX_uxn_opcodes_h_l998_c7_11d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c209_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l998_c7_11d9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_9c21_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c209_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_c209_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l998_c7_11d9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_c209_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse := VAR_t16_MUX_uxn_opcodes_h_l983_c7_68cf_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l998_c7_11d9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_11d9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_11d9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_11d9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_11d9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l995_c7_9c21] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_9c21_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_9c21_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_9c21_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_9c21_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l991_c7_15d1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_15d1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_15d1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_15d1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_15d1_return_output;

     -- t16_MUX[uxn_opcodes_h_l980_c7_b3ff] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l980_c7_b3ff_cond <= VAR_t16_MUX_uxn_opcodes_h_l980_c7_b3ff_cond;
     t16_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue;
     t16_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output := t16_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l995_c7_9c21] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_9c21_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_9c21_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_9c21_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_9c21_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l998_c7_11d9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l998_c7_11d9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l998_c7_11d9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l998_c7_11d9_return_output := result_stack_value_MUX_uxn_opcodes_h_l998_c7_11d9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l998_c7_11d9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_11d9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_11d9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_11d9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_11d9_return_output;

     -- n16_MUX[uxn_opcodes_h_l995_c7_9c21] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l995_c7_9c21_cond <= VAR_n16_MUX_uxn_opcodes_h_l995_c7_9c21_cond;
     n16_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue;
     n16_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l995_c7_9c21_return_output := n16_MUX_uxn_opcodes_h_l995_c7_9c21_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l998_c7_11d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_11d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_11d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_11d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_11d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_11d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_11d9_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l995_c7_9c21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l998_c7_11d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_9c21_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_15d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l998_c7_11d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l998_c7_11d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_9c21_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l998_c7_11d9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l974_c2_227a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l991_c7_15d1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_15d1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_15d1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_15d1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_15d1_return_output;

     -- t16_MUX[uxn_opcodes_h_l974_c2_227a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l974_c2_227a_cond <= VAR_t16_MUX_uxn_opcodes_h_l974_c2_227a_cond;
     t16_MUX_uxn_opcodes_h_l974_c2_227a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l974_c2_227a_iftrue;
     t16_MUX_uxn_opcodes_h_l974_c2_227a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l974_c2_227a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l974_c2_227a_return_output := t16_MUX_uxn_opcodes_h_l974_c2_227a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l995_c7_9c21] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_9c21_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_9c21_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_9c21_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_9c21_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l988_c7_7f64] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_7f64_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_7f64_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_7f64_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_7f64_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l995_c7_9c21] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_9c21_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_9c21_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_9c21_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_9c21_return_output;

     -- n16_MUX[uxn_opcodes_h_l991_c7_15d1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l991_c7_15d1_cond <= VAR_n16_MUX_uxn_opcodes_h_l991_c7_15d1_cond;
     n16_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue;
     n16_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_15d1_return_output := n16_MUX_uxn_opcodes_h_l991_c7_15d1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l991_c7_15d1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_15d1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_15d1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_15d1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_15d1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l995_c7_9c21] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l995_c7_9c21_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_9c21_cond;
     result_stack_value_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_9c21_return_output := result_stack_value_MUX_uxn_opcodes_h_l995_c7_9c21_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l995_c7_9c21] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_9c21_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_9c21_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_9c21_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_9c21_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_9c21_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_9c21_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse := VAR_n16_MUX_uxn_opcodes_h_l991_c7_15d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_9c21_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_15d1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_7f64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_9c21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_9c21_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_15d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_9c21_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l974_c2_227a_return_output;
     -- n16_MUX[uxn_opcodes_h_l988_c7_7f64] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l988_c7_7f64_cond <= VAR_n16_MUX_uxn_opcodes_h_l988_c7_7f64_cond;
     n16_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue;
     n16_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l988_c7_7f64_return_output := n16_MUX_uxn_opcodes_h_l988_c7_7f64_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l991_c7_15d1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_15d1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_15d1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_15d1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_15d1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l991_c7_15d1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_15d1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_15d1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_15d1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_15d1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l983_c7_68cf] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l983_c7_68cf_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l983_c7_68cf_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l983_c7_68cf_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l983_c7_68cf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l988_c7_7f64] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_7f64_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_7f64_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_7f64_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_7f64_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l991_c7_15d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_15d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_15d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_15d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_15d1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l991_c7_15d1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l991_c7_15d1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_15d1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_15d1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_15d1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_15d1_return_output := result_stack_value_MUX_uxn_opcodes_h_l991_c7_15d1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l988_c7_7f64] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_7f64_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_7f64_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_7f64_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_7f64_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse := VAR_n16_MUX_uxn_opcodes_h_l988_c7_7f64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_15d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_7f64_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l983_c7_68cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_15d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_15d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_7f64_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_15d1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l988_c7_7f64] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_7f64_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_7f64_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_7f64_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_7f64_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l983_c7_68cf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_68cf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_68cf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_68cf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_68cf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l988_c7_7f64] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_7f64_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_7f64_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_7f64_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_7f64_return_output;

     -- n16_MUX[uxn_opcodes_h_l983_c7_68cf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l983_c7_68cf_cond <= VAR_n16_MUX_uxn_opcodes_h_l983_c7_68cf_cond;
     n16_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue;
     n16_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l983_c7_68cf_return_output := n16_MUX_uxn_opcodes_h_l983_c7_68cf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l988_c7_7f64] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_7f64_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_7f64_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_7f64_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_7f64_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l983_c7_68cf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l983_c7_68cf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c7_68cf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c7_68cf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l983_c7_68cf_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l980_c7_b3ff] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_b3ff_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_b3ff_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l988_c7_7f64] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l988_c7_7f64_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l988_c7_7f64_cond;
     result_stack_value_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l988_c7_7f64_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l988_c7_7f64_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l988_c7_7f64_return_output := result_stack_value_MUX_uxn_opcodes_h_l988_c7_7f64_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse := VAR_n16_MUX_uxn_opcodes_h_l983_c7_68cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_7f64_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c7_68cf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l974_c2_227a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_7f64_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_7f64_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c7_68cf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l988_c7_7f64_return_output;
     -- n16_MUX[uxn_opcodes_h_l980_c7_b3ff] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l980_c7_b3ff_cond <= VAR_n16_MUX_uxn_opcodes_h_l980_c7_b3ff_cond;
     n16_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue;
     n16_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output := n16_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l974_c2_227a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l974_c2_227a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l974_c2_227a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l974_c2_227a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l974_c2_227a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l974_c2_227a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l974_c2_227a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l974_c2_227a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l974_c2_227a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l980_c7_b3ff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l983_c7_68cf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_68cf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_68cf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_68cf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_68cf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l983_c7_68cf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_68cf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_68cf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_68cf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_68cf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l980_c7_b3ff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_b3ff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_b3ff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l983_c7_68cf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l983_c7_68cf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l983_c7_68cf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l983_c7_68cf_return_output := result_stack_value_MUX_uxn_opcodes_h_l983_c7_68cf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l983_c7_68cf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_68cf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_68cf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_68cf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_68cf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_68cf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_68cf_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l974_c2_227a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c7_68cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c2_227a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c7_68cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c7_68cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_227a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l983_c7_68cf_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l980_c7_b3ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_b3ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_b3ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output;

     -- n16_MUX[uxn_opcodes_h_l974_c2_227a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l974_c2_227a_cond <= VAR_n16_MUX_uxn_opcodes_h_l974_c2_227a_cond;
     n16_MUX_uxn_opcodes_h_l974_c2_227a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l974_c2_227a_iftrue;
     n16_MUX_uxn_opcodes_h_l974_c2_227a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l974_c2_227a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l974_c2_227a_return_output := n16_MUX_uxn_opcodes_h_l974_c2_227a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l980_c7_b3ff] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l980_c7_b3ff_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l980_c7_b3ff_cond;
     result_stack_value_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output := result_stack_value_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l974_c2_227a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_227a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_227a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_227a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_227a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_227a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_227a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_227a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_227a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l980_c7_b3ff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_b3ff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_b3ff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l974_c2_227a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l974_c2_227a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c2_227a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l974_c2_227a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c2_227a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l974_c2_227a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c2_227a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c2_227a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l974_c2_227a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l980_c7_b3ff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l974_c2_227a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_227a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_227a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_227a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c2_227a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l980_c7_b3ff_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l974_c2_227a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_227a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_227a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_227a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_227a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_227a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_227a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_227a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_227a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l974_c2_227a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l974_c2_227a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c2_227a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l974_c2_227a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c2_227a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l974_c2_227a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c2_227a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c2_227a_return_output := result_stack_value_MUX_uxn_opcodes_h_l974_c2_227a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l974_c2_227a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_227a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_227a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_227a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_227a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_227a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_227a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_227a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_227a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l974_c2_227a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_227a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_227a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_227a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_227a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_227a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_227a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_227a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_227a_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1023_l970_DUPLICATE_6cd1 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1023_l970_DUPLICATE_6cd1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_28d7(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l974_c2_227a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_227a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_227a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_227a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c2_227a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_227a_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c2_227a_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1023_l970_DUPLICATE_6cd1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1023_l970_DUPLICATE_6cd1_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
