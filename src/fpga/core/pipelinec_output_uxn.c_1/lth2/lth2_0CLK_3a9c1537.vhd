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
entity lth2_0CLK_3a9c1537 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth2_0CLK_3a9c1537;
architecture arch of lth2_0CLK_3a9c1537 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2236_c6_7386]
signal BIN_OP_EQ_uxn_opcodes_h_l2236_c6_7386_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2236_c6_7386_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2236_c6_7386_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2236_c1_4bbe]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_4bbe_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_4bbe_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_4bbe_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_4bbe_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2236_c2_5ae3]
signal n16_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2236_c2_5ae3]
signal t16_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2236_c2_5ae3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2236_c2_5ae3]
signal result_stack_value_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2236_c2_5ae3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2236_c2_5ae3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2236_c2_5ae3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2236_c2_5ae3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2236_c2_5ae3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2237_c3_8629[uxn_opcodes_h_l2237_c3_8629]
signal printf_uxn_opcodes_h_l2237_c3_8629_uxn_opcodes_h_l2237_c3_8629_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2242_c11_568d]
signal BIN_OP_EQ_uxn_opcodes_h_l2242_c11_568d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2242_c11_568d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2242_c11_568d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2242_c7_9660]
signal n16_MUX_uxn_opcodes_h_l2242_c7_9660_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2242_c7_9660_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2242_c7_9660]
signal t16_MUX_uxn_opcodes_h_l2242_c7_9660_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2242_c7_9660_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2242_c7_9660]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_9660_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_9660_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2242_c7_9660]
signal result_stack_value_MUX_uxn_opcodes_h_l2242_c7_9660_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2242_c7_9660_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2242_c7_9660]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_9660_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_9660_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2242_c7_9660]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_9660_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_9660_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2242_c7_9660]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_9660_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_9660_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2242_c7_9660]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_9660_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_9660_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2242_c7_9660]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2242_c7_9660_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2242_c7_9660_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2245_c11_f6fa]
signal BIN_OP_EQ_uxn_opcodes_h_l2245_c11_f6fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2245_c11_f6fa_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2245_c11_f6fa_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2245_c7_fdef]
signal n16_MUX_uxn_opcodes_h_l2245_c7_fdef_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2245_c7_fdef]
signal t16_MUX_uxn_opcodes_h_l2245_c7_fdef_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2245_c7_fdef]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2245_c7_fdef]
signal result_stack_value_MUX_uxn_opcodes_h_l2245_c7_fdef_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2245_c7_fdef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_fdef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2245_c7_fdef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2245_c7_fdef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_fdef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2245_c7_fdef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_fdef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2245_c7_fdef]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2245_c7_fdef_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2250_c11_16a8]
signal BIN_OP_EQ_uxn_opcodes_h_l2250_c11_16a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2250_c11_16a8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2250_c11_16a8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2250_c7_7ca2]
signal n16_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2250_c7_7ca2]
signal t16_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2250_c7_7ca2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2250_c7_7ca2]
signal result_stack_value_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2250_c7_7ca2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2250_c7_7ca2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2250_c7_7ca2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2250_c7_7ca2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2250_c7_7ca2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2253_c11_a78c]
signal BIN_OP_EQ_uxn_opcodes_h_l2253_c11_a78c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2253_c11_a78c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2253_c11_a78c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2253_c7_648e]
signal n16_MUX_uxn_opcodes_h_l2253_c7_648e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2253_c7_648e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2253_c7_648e]
signal t16_MUX_uxn_opcodes_h_l2253_c7_648e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2253_c7_648e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2253_c7_648e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_648e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_648e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2253_c7_648e]
signal result_stack_value_MUX_uxn_opcodes_h_l2253_c7_648e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2253_c7_648e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2253_c7_648e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_648e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_648e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2253_c7_648e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_648e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_648e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2253_c7_648e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_648e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_648e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2253_c7_648e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_648e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_648e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2253_c7_648e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_648e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_648e_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2254_c3_3f87]
signal BIN_OP_OR_uxn_opcodes_h_l2254_c3_3f87_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2254_c3_3f87_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2254_c3_3f87_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2257_c11_c1e6]
signal BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c1e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c1e6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c1e6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2257_c7_f42b]
signal n16_MUX_uxn_opcodes_h_l2257_c7_f42b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2257_c7_f42b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2257_c7_f42b]
signal result_stack_value_MUX_uxn_opcodes_h_l2257_c7_f42b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2257_c7_f42b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_f42b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2257_c7_f42b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2257_c7_f42b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_f42b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2257_c7_f42b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_f42b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2257_c7_f42b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2257_c7_f42b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2260_c11_ef4e]
signal BIN_OP_EQ_uxn_opcodes_h_l2260_c11_ef4e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2260_c11_ef4e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2260_c11_ef4e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2260_c7_f327]
signal n16_MUX_uxn_opcodes_h_l2260_c7_f327_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2260_c7_f327_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2260_c7_f327]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_f327_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_f327_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2260_c7_f327]
signal result_stack_value_MUX_uxn_opcodes_h_l2260_c7_f327_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2260_c7_f327_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2260_c7_f327]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_f327_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_f327_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2260_c7_f327]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_f327_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_f327_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2260_c7_f327]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_f327_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_f327_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2260_c7_f327]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_f327_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_f327_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2260_c7_f327]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_f327_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_f327_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2265_c11_d872]
signal BIN_OP_EQ_uxn_opcodes_h_l2265_c11_d872_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2265_c11_d872_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2265_c11_d872_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2265_c7_5449]
signal n16_MUX_uxn_opcodes_h_l2265_c7_5449_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2265_c7_5449_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2265_c7_5449]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2265_c7_5449_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2265_c7_5449_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2265_c7_5449]
signal result_stack_value_MUX_uxn_opcodes_h_l2265_c7_5449_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2265_c7_5449_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2265_c7_5449]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_5449_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_5449_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2265_c7_5449]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_5449_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_5449_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2265_c7_5449]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_5449_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_5449_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2265_c7_5449]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_5449_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_5449_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2265_c7_5449]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2265_c7_5449_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2265_c7_5449_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2268_c11_0026]
signal BIN_OP_EQ_uxn_opcodes_h_l2268_c11_0026_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2268_c11_0026_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2268_c11_0026_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2268_c7_4e06]
signal n16_MUX_uxn_opcodes_h_l2268_c7_4e06_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2268_c7_4e06]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2268_c7_4e06]
signal result_stack_value_MUX_uxn_opcodes_h_l2268_c7_4e06_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2268_c7_4e06]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_4e06_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2268_c7_4e06]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2268_c7_4e06]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_4e06_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2268_c7_4e06]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_4e06_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2268_c7_4e06]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2268_c7_4e06_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2269_c3_20da]
signal BIN_OP_OR_uxn_opcodes_h_l2269_c3_20da_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2269_c3_20da_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2269_c3_20da_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2272_c32_fdd1]
signal BIN_OP_AND_uxn_opcodes_h_l2272_c32_fdd1_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2272_c32_fdd1_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2272_c32_fdd1_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2272_c32_6626]
signal BIN_OP_GT_uxn_opcodes_h_l2272_c32_6626_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2272_c32_6626_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2272_c32_6626_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2272_c32_6823]
signal MUX_uxn_opcodes_h_l2272_c32_6823_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2272_c32_6823_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2272_c32_6823_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2272_c32_6823_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2274_c11_e389]
signal BIN_OP_EQ_uxn_opcodes_h_l2274_c11_e389_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2274_c11_e389_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2274_c11_e389_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2274_c7_7c0d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c7_7c0d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c7_7c0d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c7_7c0d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2274_c7_7c0d]
signal result_stack_value_MUX_uxn_opcodes_h_l2274_c7_7c0d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2274_c7_7c0d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2274_c7_7c0d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2274_c7_7c0d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2274_c7_7c0d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2274_c7_7c0d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2274_c7_7c0d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2274_c7_7c0d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c7_7c0d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c7_7c0d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c7_7c0d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2274_c7_7c0d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2274_c7_7c0d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2274_c7_7c0d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2274_c7_7c0d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l2278_c24_35e9]
signal BIN_OP_LT_uxn_opcodes_h_l2278_c24_35e9_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l2278_c24_35e9_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l2278_c24_35e9_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2278_c24_bdbe]
signal MUX_uxn_opcodes_h_l2278_c24_bdbe_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2278_c24_bdbe_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2278_c24_bdbe_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2278_c24_bdbe_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2280_c11_0ec6]
signal BIN_OP_EQ_uxn_opcodes_h_l2280_c11_0ec6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2280_c11_0ec6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2280_c11_0ec6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2280_c7_635c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_635c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_635c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_635c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_635c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2280_c7_635c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_635c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_635c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_635c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_635c_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2262_l2247_DUPLICATE_171f
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2262_l2247_DUPLICATE_171f_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2262_l2247_DUPLICATE_171f_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_287e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2236_c6_7386
BIN_OP_EQ_uxn_opcodes_h_l2236_c6_7386 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2236_c6_7386_left,
BIN_OP_EQ_uxn_opcodes_h_l2236_c6_7386_right,
BIN_OP_EQ_uxn_opcodes_h_l2236_c6_7386_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_4bbe
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_4bbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_4bbe_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_4bbe_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_4bbe_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_4bbe_return_output);

-- n16_MUX_uxn_opcodes_h_l2236_c2_5ae3
n16_MUX_uxn_opcodes_h_l2236_c2_5ae3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond,
n16_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue,
n16_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse,
n16_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output);

-- t16_MUX_uxn_opcodes_h_l2236_c2_5ae3
t16_MUX_uxn_opcodes_h_l2236_c2_5ae3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond,
t16_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue,
t16_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse,
t16_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3
result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2236_c2_5ae3
result_stack_value_MUX_uxn_opcodes_h_l2236_c2_5ae3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond,
result_stack_value_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_5ae3
result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_5ae3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_5ae3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_5ae3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_5ae3
result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_5ae3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2236_c2_5ae3
result_is_stack_read_MUX_uxn_opcodes_h_l2236_c2_5ae3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output);

-- printf_uxn_opcodes_h_l2237_c3_8629_uxn_opcodes_h_l2237_c3_8629
printf_uxn_opcodes_h_l2237_c3_8629_uxn_opcodes_h_l2237_c3_8629 : entity work.printf_uxn_opcodes_h_l2237_c3_8629_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2237_c3_8629_uxn_opcodes_h_l2237_c3_8629_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2242_c11_568d
BIN_OP_EQ_uxn_opcodes_h_l2242_c11_568d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2242_c11_568d_left,
BIN_OP_EQ_uxn_opcodes_h_l2242_c11_568d_right,
BIN_OP_EQ_uxn_opcodes_h_l2242_c11_568d_return_output);

-- n16_MUX_uxn_opcodes_h_l2242_c7_9660
n16_MUX_uxn_opcodes_h_l2242_c7_9660 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2242_c7_9660_cond,
n16_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue,
n16_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse,
n16_MUX_uxn_opcodes_h_l2242_c7_9660_return_output);

-- t16_MUX_uxn_opcodes_h_l2242_c7_9660
t16_MUX_uxn_opcodes_h_l2242_c7_9660 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2242_c7_9660_cond,
t16_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue,
t16_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse,
t16_MUX_uxn_opcodes_h_l2242_c7_9660_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_9660
result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_9660 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_9660_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_9660_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2242_c7_9660
result_stack_value_MUX_uxn_opcodes_h_l2242_c7_9660 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2242_c7_9660_cond,
result_stack_value_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2242_c7_9660_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_9660
result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_9660 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_9660_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_9660_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_9660
result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_9660 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_9660_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_9660_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_9660
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_9660 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_9660_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_9660_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_9660
result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_9660 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_9660_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_9660_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2242_c7_9660
result_is_stack_read_MUX_uxn_opcodes_h_l2242_c7_9660 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2242_c7_9660_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2242_c7_9660_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2245_c11_f6fa
BIN_OP_EQ_uxn_opcodes_h_l2245_c11_f6fa : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2245_c11_f6fa_left,
BIN_OP_EQ_uxn_opcodes_h_l2245_c11_f6fa_right,
BIN_OP_EQ_uxn_opcodes_h_l2245_c11_f6fa_return_output);

-- n16_MUX_uxn_opcodes_h_l2245_c7_fdef
n16_MUX_uxn_opcodes_h_l2245_c7_fdef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2245_c7_fdef_cond,
n16_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue,
n16_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse,
n16_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output);

-- t16_MUX_uxn_opcodes_h_l2245_c7_fdef
t16_MUX_uxn_opcodes_h_l2245_c7_fdef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2245_c7_fdef_cond,
t16_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue,
t16_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse,
t16_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_fdef
result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_fdef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2245_c7_fdef
result_stack_value_MUX_uxn_opcodes_h_l2245_c7_fdef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2245_c7_fdef_cond,
result_stack_value_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_fdef
result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_fdef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_fdef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2245_c7_fdef
result_sp_relative_shift_MUX_uxn_opcodes_h_l2245_c7_fdef : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_fdef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_fdef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_fdef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_fdef
result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_fdef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_fdef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2245_c7_fdef
result_is_stack_read_MUX_uxn_opcodes_h_l2245_c7_fdef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2245_c7_fdef_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2250_c11_16a8
BIN_OP_EQ_uxn_opcodes_h_l2250_c11_16a8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2250_c11_16a8_left,
BIN_OP_EQ_uxn_opcodes_h_l2250_c11_16a8_right,
BIN_OP_EQ_uxn_opcodes_h_l2250_c11_16a8_return_output);

-- n16_MUX_uxn_opcodes_h_l2250_c7_7ca2
n16_MUX_uxn_opcodes_h_l2250_c7_7ca2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond,
n16_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue,
n16_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse,
n16_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output);

-- t16_MUX_uxn_opcodes_h_l2250_c7_7ca2
t16_MUX_uxn_opcodes_h_l2250_c7_7ca2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond,
t16_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue,
t16_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse,
t16_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2
result_is_sp_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2250_c7_7ca2
result_stack_value_MUX_uxn_opcodes_h_l2250_c7_7ca2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2250_c7_7ca2
result_is_stack_write_MUX_uxn_opcodes_h_l2250_c7_7ca2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2250_c7_7ca2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2250_c7_7ca2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2250_c7_7ca2
result_is_opc_done_MUX_uxn_opcodes_h_l2250_c7_7ca2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2250_c7_7ca2
result_is_stack_read_MUX_uxn_opcodes_h_l2250_c7_7ca2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2253_c11_a78c
BIN_OP_EQ_uxn_opcodes_h_l2253_c11_a78c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2253_c11_a78c_left,
BIN_OP_EQ_uxn_opcodes_h_l2253_c11_a78c_right,
BIN_OP_EQ_uxn_opcodes_h_l2253_c11_a78c_return_output);

-- n16_MUX_uxn_opcodes_h_l2253_c7_648e
n16_MUX_uxn_opcodes_h_l2253_c7_648e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2253_c7_648e_cond,
n16_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue,
n16_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse,
n16_MUX_uxn_opcodes_h_l2253_c7_648e_return_output);

-- t16_MUX_uxn_opcodes_h_l2253_c7_648e
t16_MUX_uxn_opcodes_h_l2253_c7_648e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2253_c7_648e_cond,
t16_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue,
t16_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse,
t16_MUX_uxn_opcodes_h_l2253_c7_648e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_648e
result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_648e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_648e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_648e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2253_c7_648e
result_stack_value_MUX_uxn_opcodes_h_l2253_c7_648e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2253_c7_648e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2253_c7_648e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_648e
result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_648e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_648e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_648e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_648e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_648e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_648e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_648e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_648e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_648e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_648e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_648e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_648e
result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_648e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_648e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_648e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_648e
result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_648e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_648e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_648e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2254_c3_3f87
BIN_OP_OR_uxn_opcodes_h_l2254_c3_3f87 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2254_c3_3f87_left,
BIN_OP_OR_uxn_opcodes_h_l2254_c3_3f87_right,
BIN_OP_OR_uxn_opcodes_h_l2254_c3_3f87_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c1e6
BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c1e6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c1e6_left,
BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c1e6_right,
BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c1e6_return_output);

-- n16_MUX_uxn_opcodes_h_l2257_c7_f42b
n16_MUX_uxn_opcodes_h_l2257_c7_f42b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2257_c7_f42b_cond,
n16_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue,
n16_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse,
n16_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_f42b
result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_f42b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2257_c7_f42b
result_stack_value_MUX_uxn_opcodes_h_l2257_c7_f42b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2257_c7_f42b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_f42b
result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_f42b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_f42b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_f42b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_f42b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_f42b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_f42b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_f42b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_f42b
result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_f42b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_f42b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2257_c7_f42b
result_is_stack_read_MUX_uxn_opcodes_h_l2257_c7_f42b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2257_c7_f42b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2260_c11_ef4e
BIN_OP_EQ_uxn_opcodes_h_l2260_c11_ef4e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2260_c11_ef4e_left,
BIN_OP_EQ_uxn_opcodes_h_l2260_c11_ef4e_right,
BIN_OP_EQ_uxn_opcodes_h_l2260_c11_ef4e_return_output);

-- n16_MUX_uxn_opcodes_h_l2260_c7_f327
n16_MUX_uxn_opcodes_h_l2260_c7_f327 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2260_c7_f327_cond,
n16_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue,
n16_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse,
n16_MUX_uxn_opcodes_h_l2260_c7_f327_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_f327
result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_f327 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_f327_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_f327_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2260_c7_f327
result_stack_value_MUX_uxn_opcodes_h_l2260_c7_f327 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2260_c7_f327_cond,
result_stack_value_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2260_c7_f327_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_f327
result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_f327 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_f327_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_f327_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_f327
result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_f327 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_f327_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_f327_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_f327
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_f327 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_f327_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_f327_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_f327
result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_f327 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_f327_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_f327_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_f327
result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_f327 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_f327_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_f327_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2265_c11_d872
BIN_OP_EQ_uxn_opcodes_h_l2265_c11_d872 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2265_c11_d872_left,
BIN_OP_EQ_uxn_opcodes_h_l2265_c11_d872_right,
BIN_OP_EQ_uxn_opcodes_h_l2265_c11_d872_return_output);

-- n16_MUX_uxn_opcodes_h_l2265_c7_5449
n16_MUX_uxn_opcodes_h_l2265_c7_5449 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2265_c7_5449_cond,
n16_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue,
n16_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse,
n16_MUX_uxn_opcodes_h_l2265_c7_5449_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2265_c7_5449
result_is_sp_shift_MUX_uxn_opcodes_h_l2265_c7_5449 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2265_c7_5449_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2265_c7_5449_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2265_c7_5449
result_stack_value_MUX_uxn_opcodes_h_l2265_c7_5449 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2265_c7_5449_cond,
result_stack_value_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2265_c7_5449_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_5449
result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_5449 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_5449_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_5449_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_5449
result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_5449 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_5449_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_5449_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_5449
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_5449 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_5449_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_5449_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_5449
result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_5449 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_5449_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_5449_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2265_c7_5449
result_is_stack_read_MUX_uxn_opcodes_h_l2265_c7_5449 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2265_c7_5449_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2265_c7_5449_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2268_c11_0026
BIN_OP_EQ_uxn_opcodes_h_l2268_c11_0026 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2268_c11_0026_left,
BIN_OP_EQ_uxn_opcodes_h_l2268_c11_0026_right,
BIN_OP_EQ_uxn_opcodes_h_l2268_c11_0026_return_output);

-- n16_MUX_uxn_opcodes_h_l2268_c7_4e06
n16_MUX_uxn_opcodes_h_l2268_c7_4e06 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2268_c7_4e06_cond,
n16_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue,
n16_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse,
n16_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2268_c7_4e06
result_is_sp_shift_MUX_uxn_opcodes_h_l2268_c7_4e06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2268_c7_4e06
result_stack_value_MUX_uxn_opcodes_h_l2268_c7_4e06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2268_c7_4e06_cond,
result_stack_value_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_4e06
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_4e06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_4e06_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_4e06
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_4e06 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_4e06
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_4e06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_4e06_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_4e06
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_4e06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_4e06_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2268_c7_4e06
result_is_stack_read_MUX_uxn_opcodes_h_l2268_c7_4e06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2268_c7_4e06_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2269_c3_20da
BIN_OP_OR_uxn_opcodes_h_l2269_c3_20da : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2269_c3_20da_left,
BIN_OP_OR_uxn_opcodes_h_l2269_c3_20da_right,
BIN_OP_OR_uxn_opcodes_h_l2269_c3_20da_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2272_c32_fdd1
BIN_OP_AND_uxn_opcodes_h_l2272_c32_fdd1 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2272_c32_fdd1_left,
BIN_OP_AND_uxn_opcodes_h_l2272_c32_fdd1_right,
BIN_OP_AND_uxn_opcodes_h_l2272_c32_fdd1_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2272_c32_6626
BIN_OP_GT_uxn_opcodes_h_l2272_c32_6626 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2272_c32_6626_left,
BIN_OP_GT_uxn_opcodes_h_l2272_c32_6626_right,
BIN_OP_GT_uxn_opcodes_h_l2272_c32_6626_return_output);

-- MUX_uxn_opcodes_h_l2272_c32_6823
MUX_uxn_opcodes_h_l2272_c32_6823 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2272_c32_6823_cond,
MUX_uxn_opcodes_h_l2272_c32_6823_iftrue,
MUX_uxn_opcodes_h_l2272_c32_6823_iffalse,
MUX_uxn_opcodes_h_l2272_c32_6823_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2274_c11_e389
BIN_OP_EQ_uxn_opcodes_h_l2274_c11_e389 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2274_c11_e389_left,
BIN_OP_EQ_uxn_opcodes_h_l2274_c11_e389_right,
BIN_OP_EQ_uxn_opcodes_h_l2274_c11_e389_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c7_7c0d
result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c7_7c0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c7_7c0d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c7_7c0d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c7_7c0d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2274_c7_7c0d
result_stack_value_MUX_uxn_opcodes_h_l2274_c7_7c0d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2274_c7_7c0d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2274_c7_7c0d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2274_c7_7c0d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2274_c7_7c0d
result_is_stack_write_MUX_uxn_opcodes_h_l2274_c7_7c0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2274_c7_7c0d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2274_c7_7c0d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2274_c7_7c0d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c7_7c0d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c7_7c0d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c7_7c0d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c7_7c0d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c7_7c0d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2274_c7_7c0d
result_is_opc_done_MUX_uxn_opcodes_h_l2274_c7_7c0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2274_c7_7c0d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2274_c7_7c0d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2274_c7_7c0d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l2278_c24_35e9
BIN_OP_LT_uxn_opcodes_h_l2278_c24_35e9 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l2278_c24_35e9_left,
BIN_OP_LT_uxn_opcodes_h_l2278_c24_35e9_right,
BIN_OP_LT_uxn_opcodes_h_l2278_c24_35e9_return_output);

-- MUX_uxn_opcodes_h_l2278_c24_bdbe
MUX_uxn_opcodes_h_l2278_c24_bdbe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2278_c24_bdbe_cond,
MUX_uxn_opcodes_h_l2278_c24_bdbe_iftrue,
MUX_uxn_opcodes_h_l2278_c24_bdbe_iffalse,
MUX_uxn_opcodes_h_l2278_c24_bdbe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2280_c11_0ec6
BIN_OP_EQ_uxn_opcodes_h_l2280_c11_0ec6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2280_c11_0ec6_left,
BIN_OP_EQ_uxn_opcodes_h_l2280_c11_0ec6_right,
BIN_OP_EQ_uxn_opcodes_h_l2280_c11_0ec6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_635c
result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_635c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_635c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_635c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_635c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_635c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_635c
result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_635c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_635c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_635c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_635c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_635c_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2262_l2247_DUPLICATE_171f
CONST_SL_8_uint16_t_uxn_opcodes_h_l2262_l2247_DUPLICATE_171f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2262_l2247_DUPLICATE_171f_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2262_l2247_DUPLICATE_171f_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2236_c6_7386_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_4bbe_return_output,
 n16_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output,
 t16_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2242_c11_568d_return_output,
 n16_MUX_uxn_opcodes_h_l2242_c7_9660_return_output,
 t16_MUX_uxn_opcodes_h_l2242_c7_9660_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_9660_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2242_c7_9660_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_9660_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_9660_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_9660_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_9660_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2242_c7_9660_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2245_c11_f6fa_return_output,
 n16_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output,
 t16_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2250_c11_16a8_return_output,
 n16_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output,
 t16_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2253_c11_a78c_return_output,
 n16_MUX_uxn_opcodes_h_l2253_c7_648e_return_output,
 t16_MUX_uxn_opcodes_h_l2253_c7_648e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_648e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2253_c7_648e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_648e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_648e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_648e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_648e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_648e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2254_c3_3f87_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c1e6_return_output,
 n16_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2260_c11_ef4e_return_output,
 n16_MUX_uxn_opcodes_h_l2260_c7_f327_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_f327_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2260_c7_f327_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_f327_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_f327_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_f327_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_f327_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_f327_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2265_c11_d872_return_output,
 n16_MUX_uxn_opcodes_h_l2265_c7_5449_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2265_c7_5449_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2265_c7_5449_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_5449_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_5449_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_5449_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_5449_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2265_c7_5449_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2268_c11_0026_return_output,
 n16_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2269_c3_20da_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2272_c32_fdd1_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2272_c32_6626_return_output,
 MUX_uxn_opcodes_h_l2272_c32_6823_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2274_c11_e389_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output,
 BIN_OP_LT_uxn_opcodes_h_l2278_c24_35e9_return_output,
 MUX_uxn_opcodes_h_l2278_c24_bdbe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2280_c11_0ec6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_635c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_635c_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2262_l2247_DUPLICATE_171f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_7386_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_7386_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_7386_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_4bbe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_4bbe_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_4bbe_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_4bbe_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2242_c7_9660_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2242_c7_9660_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_9660_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2242_c7_9660_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_9660_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_9660_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2239_c3_9fff : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_9660_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_9660_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2242_c7_9660_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2237_c3_8629_uxn_opcodes_h_l2237_c3_8629_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_568d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_568d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_568d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2242_c7_9660_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2242_c7_9660_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_9660_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2242_c7_9660_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_9660_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_9660_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2243_c3_de83 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_9660_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_9660_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2242_c7_9660_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_f6fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_f6fa_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_f6fa_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2245_c7_fdef_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2245_c7_fdef_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2245_c7_fdef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_fdef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2248_c3_48aa : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_fdef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_fdef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2245_c7_fdef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2250_c11_16a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2250_c11_16a8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2250_c11_16a8_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2253_c7_648e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2253_c7_648e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_648e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2253_c7_648e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_648e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_648e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2251_c3_98d0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_648e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_648e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_648e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_a78c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_a78c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_a78c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2253_c7_648e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2253_c7_648e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_648e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2253_c7_648e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_648e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_648e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2255_c3_2398 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_648e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_648e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_648e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2254_c3_3f87_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2254_c3_3f87_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2254_c3_3f87_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c1e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c1e6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c1e6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2260_c7_f327_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2257_c7_f42b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_f327_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_f327_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2257_c7_f42b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_f327_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_f42b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_f327_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2258_c3_d0c0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_f327_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_f42b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_f327_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_f42b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_f327_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2257_c7_f42b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_ef4e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_ef4e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_ef4e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2265_c7_5449_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2260_c7_f327_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2265_c7_5449_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_f327_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2265_c7_5449_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_f327_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_5449_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_f327_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_5449_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_f327_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2263_c3_b003 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_5449_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_f327_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_5449_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_f327_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2265_c7_5449_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_f327_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_d872_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_d872_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_d872_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2265_c7_5449_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2265_c7_5449_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2265_c7_5449_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_5449_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_5449_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2266_c3_2316 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_5449_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_5449_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2265_c7_5449_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_0026_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_0026_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_0026_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2268_c7_4e06_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2268_c7_4e06_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_4e06_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_4e06_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_4e06_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2268_c7_4e06_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2269_c3_20da_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2269_c3_20da_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2269_c3_20da_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2272_c32_6823_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2272_c32_6823_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2272_c32_6823_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2272_c32_fdd1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2272_c32_fdd1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2272_c32_fdd1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2272_c32_6626_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2272_c32_6626_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2272_c32_6626_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2272_c32_6823_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c11_e389_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c11_e389_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c11_e389_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c7_7c0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c7_7c0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c7_7c0d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c7_7c0d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c7_7c0d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c7_7c0d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c7_7c0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c7_7c0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_635c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c7_7c0d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c7_7c0d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2277_c3_d9fa : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c7_7c0d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c7_7c0d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c7_7c0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c7_7c0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_635c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c7_7c0d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2278_c24_bdbe_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2278_c24_bdbe_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2278_c24_bdbe_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2278_c24_35e9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2278_c24_35e9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2278_c24_35e9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2278_c24_bdbe_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2280_c11_0ec6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2280_c11_0ec6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2280_c11_0ec6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_635c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_635c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_635c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_635c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_635c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_635c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2253_l2250_l2274_l2245_l2242_l2265_l2236_l2260_l2257_DUPLICATE_2f5e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2253_l2250_l2274_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_963c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2253_l2280_l2250_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_eea9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2253_l2250_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_d20e_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2253_l2280_l2250_l2274_l2245_l2268_l2242_l2265_l2260_l2257_DUPLICATE_bba9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2253_l2250_l2245_l2268_l2242_l2265_l2260_l2257_DUPLICATE_8aa6_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2254_l2269_l2246_l2261_DUPLICATE_f09e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2262_l2247_DUPLICATE_171f_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2262_l2247_DUPLICATE_171f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2274_l2268_DUPLICATE_c1c0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2285_l2232_DUPLICATE_0611_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2250_c11_16a8_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l2278_c24_bdbe_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c7_7c0d_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c7_7c0d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2258_c3_d0c0 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2258_c3_d0c0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_568d_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2272_c32_6626_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_ef4e_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_635c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_0026_right := to_unsigned(8, 4);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2272_c32_fdd1_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_7386_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c1e6_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2266_c3_2316 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2266_c3_2316;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2248_c3_48aa := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2248_c3_48aa;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2239_c3_9fff := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2239_c3_9fff;
     VAR_MUX_uxn_opcodes_h_l2278_c24_bdbe_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2280_c11_0ec6_right := to_unsigned(10, 4);
     VAR_MUX_uxn_opcodes_h_l2272_c32_6823_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2263_c3_b003 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2263_c3_b003;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2243_c3_de83 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2243_c3_de83;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_d872_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_a78c_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_f6fa_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c11_e389_right := to_unsigned(9, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_635c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2277_c3_d9fa := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c7_7c0d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2277_c3_d9fa;
     VAR_MUX_uxn_opcodes_h_l2272_c32_6823_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_4bbe_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2251_c3_98d0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2251_c3_98d0;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2255_c3_2398 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2255_c3_2398;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_4bbe_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2272_c32_fdd1_left := VAR_ins;
     VAR_BIN_OP_LT_uxn_opcodes_h_l2278_c24_35e9_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2269_c3_20da_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_7386_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_568d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_f6fa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2250_c11_16a8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_a78c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c1e6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_ef4e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_d872_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_0026_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c11_e389_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2280_c11_0ec6_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l2278_c24_35e9_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2254_c3_3f87_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse := t16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2254_l2269_l2246_l2261_DUPLICATE_f09e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2254_l2269_l2246_l2261_DUPLICATE_f09e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2260_c11_ef4e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2260_c11_ef4e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_ef4e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2260_c11_ef4e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_ef4e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_ef4e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2260_c11_ef4e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2280_c11_0ec6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2280_c11_0ec6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2280_c11_0ec6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2280_c11_0ec6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2280_c11_0ec6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2280_c11_0ec6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2280_c11_0ec6_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2272_c32_fdd1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2272_c32_fdd1_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2272_c32_fdd1_left;
     BIN_OP_AND_uxn_opcodes_h_l2272_c32_fdd1_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2272_c32_fdd1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2272_c32_fdd1_return_output := BIN_OP_AND_uxn_opcodes_h_l2272_c32_fdd1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2245_c11_f6fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2245_c11_f6fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_f6fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2245_c11_f6fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_f6fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_f6fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2245_c11_f6fa_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2253_l2250_l2245_l2268_l2242_l2265_l2260_l2257_DUPLICATE_8aa6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2253_l2250_l2245_l2268_l2242_l2265_l2260_l2257_DUPLICATE_8aa6_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2242_c11_568d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2242_c11_568d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_568d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2242_c11_568d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_568d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_568d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2242_c11_568d_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2253_l2250_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_d20e LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2253_l2250_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_d20e_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2253_l2250_l2274_l2245_l2242_l2265_l2236_l2260_l2257_DUPLICATE_2f5e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2253_l2250_l2274_l2245_l2242_l2265_l2236_l2260_l2257_DUPLICATE_2f5e_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2274_l2268_DUPLICATE_c1c0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2274_l2268_DUPLICATE_c1c0_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2250_c11_16a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2250_c11_16a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2250_c11_16a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2250_c11_16a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2250_c11_16a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2250_c11_16a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2250_c11_16a8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2236_c6_7386] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2236_c6_7386_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_7386_left;
     BIN_OP_EQ_uxn_opcodes_h_l2236_c6_7386_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_7386_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_7386_return_output := BIN_OP_EQ_uxn_opcodes_h_l2236_c6_7386_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2265_c11_d872] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2265_c11_d872_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_d872_left;
     BIN_OP_EQ_uxn_opcodes_h_l2265_c11_d872_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_d872_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_d872_return_output := BIN_OP_EQ_uxn_opcodes_h_l2265_c11_d872_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2268_c11_0026] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2268_c11_0026_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_0026_left;
     BIN_OP_EQ_uxn_opcodes_h_l2268_c11_0026_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_0026_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_0026_return_output := BIN_OP_EQ_uxn_opcodes_h_l2268_c11_0026_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2253_l2280_l2250_l2274_l2245_l2268_l2242_l2265_l2260_l2257_DUPLICATE_bba9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2253_l2280_l2250_l2274_l2245_l2268_l2242_l2265_l2260_l2257_DUPLICATE_bba9_return_output := result.is_opc_done;

     -- BIN_OP_LT[uxn_opcodes_h_l2278_c24_35e9] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l2278_c24_35e9_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l2278_c24_35e9_left;
     BIN_OP_LT_uxn_opcodes_h_l2278_c24_35e9_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l2278_c24_35e9_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l2278_c24_35e9_return_output := BIN_OP_LT_uxn_opcodes_h_l2278_c24_35e9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2257_c11_c1e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c1e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c1e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c1e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c1e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c1e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c1e6_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2253_l2250_l2274_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_963c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2253_l2250_l2274_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_963c_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2274_c11_e389] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2274_c11_e389_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c11_e389_left;
     BIN_OP_EQ_uxn_opcodes_h_l2274_c11_e389_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c11_e389_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c11_e389_return_output := BIN_OP_EQ_uxn_opcodes_h_l2274_c11_e389_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2253_c11_a78c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2253_c11_a78c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_a78c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2253_c11_a78c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_a78c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_a78c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2253_c11_a78c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2253_l2280_l2250_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_eea9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2253_l2280_l2250_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_eea9_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2272_c32_6626_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2272_c32_fdd1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_4bbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_7386_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_7386_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_7386_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_7386_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_7386_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_7386_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_7386_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_7386_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_7386_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_7386_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2242_c7_9660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_568d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_9660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_568d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_9660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_568d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2242_c7_9660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_568d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_9660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_568d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_9660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_568d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_9660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_568d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2242_c7_9660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_568d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2242_c7_9660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_568d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2245_c7_fdef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_f6fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_fdef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_f6fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_f6fa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2245_c7_fdef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_f6fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_fdef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_f6fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_f6fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_fdef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_f6fa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2245_c7_fdef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_f6fa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2245_c7_fdef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_f6fa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2250_c11_16a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2250_c11_16a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2250_c11_16a8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2250_c11_16a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2250_c11_16a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2250_c11_16a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2250_c11_16a8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2250_c11_16a8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2250_c11_16a8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2253_c7_648e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_a78c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_648e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_a78c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_648e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_a78c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_648e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_a78c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_648e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_a78c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_648e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_a78c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_648e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_a78c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2253_c7_648e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_a78c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2253_c7_648e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_a78c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2257_c7_f42b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c1e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_f42b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c1e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c1e6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2257_c7_f42b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c1e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_f42b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c1e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c1e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_f42b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c1e6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2257_c7_f42b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2257_c11_c1e6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2260_c7_f327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_ef4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_f327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_ef4e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_f327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_ef4e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_f327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_ef4e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_f327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_ef4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_f327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_ef4e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_f327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_ef4e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_f327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_ef4e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2265_c7_5449_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_d872_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_5449_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_d872_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2265_c7_5449_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_d872_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2265_c7_5449_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_d872_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_5449_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_d872_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_5449_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_d872_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_5449_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_d872_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2265_c7_5449_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_d872_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2268_c7_4e06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_0026_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_4e06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_0026_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_0026_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2268_c7_4e06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_0026_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_4e06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_0026_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_0026_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_4e06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_0026_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2268_c7_4e06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_0026_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c7_7c0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c11_e389_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c7_7c0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c11_e389_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c7_7c0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c11_e389_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c7_7c0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c11_e389_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c7_7c0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c11_e389_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_635c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2280_c11_0ec6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_635c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2280_c11_0ec6_return_output;
     VAR_MUX_uxn_opcodes_h_l2278_c24_bdbe_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l2278_c24_35e9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2254_c3_3f87_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2254_l2269_l2246_l2261_DUPLICATE_f09e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2269_c3_20da_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2254_l2269_l2246_l2261_DUPLICATE_f09e_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2262_l2247_DUPLICATE_171f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2254_l2269_l2246_l2261_DUPLICATE_f09e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2253_l2250_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_d20e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2253_l2250_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_d20e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2253_l2250_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_d20e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2253_l2250_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_d20e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2253_l2250_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_d20e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2253_l2250_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_d20e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2253_l2250_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_d20e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2253_l2250_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_d20e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2253_l2250_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_d20e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2253_l2280_l2250_l2274_l2245_l2268_l2242_l2265_l2260_l2257_DUPLICATE_bba9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2253_l2280_l2250_l2274_l2245_l2268_l2242_l2265_l2260_l2257_DUPLICATE_bba9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2253_l2280_l2250_l2274_l2245_l2268_l2242_l2265_l2260_l2257_DUPLICATE_bba9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2253_l2280_l2250_l2274_l2245_l2268_l2242_l2265_l2260_l2257_DUPLICATE_bba9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2253_l2280_l2250_l2274_l2245_l2268_l2242_l2265_l2260_l2257_DUPLICATE_bba9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2253_l2280_l2250_l2274_l2245_l2268_l2242_l2265_l2260_l2257_DUPLICATE_bba9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2253_l2280_l2250_l2274_l2245_l2268_l2242_l2265_l2260_l2257_DUPLICATE_bba9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2253_l2280_l2250_l2274_l2245_l2268_l2242_l2265_l2260_l2257_DUPLICATE_bba9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c7_7c0d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2253_l2280_l2250_l2274_l2245_l2268_l2242_l2265_l2260_l2257_DUPLICATE_bba9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_635c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2253_l2280_l2250_l2274_l2245_l2268_l2242_l2265_l2260_l2257_DUPLICATE_bba9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2253_l2250_l2274_l2245_l2242_l2265_l2236_l2260_l2257_DUPLICATE_2f5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2253_l2250_l2274_l2245_l2242_l2265_l2236_l2260_l2257_DUPLICATE_2f5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2253_l2250_l2274_l2245_l2242_l2265_l2236_l2260_l2257_DUPLICATE_2f5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2253_l2250_l2274_l2245_l2242_l2265_l2236_l2260_l2257_DUPLICATE_2f5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2253_l2250_l2274_l2245_l2242_l2265_l2236_l2260_l2257_DUPLICATE_2f5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2253_l2250_l2274_l2245_l2242_l2265_l2236_l2260_l2257_DUPLICATE_2f5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2253_l2250_l2274_l2245_l2242_l2265_l2236_l2260_l2257_DUPLICATE_2f5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2253_l2250_l2274_l2245_l2242_l2265_l2236_l2260_l2257_DUPLICATE_2f5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c7_7c0d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2253_l2250_l2274_l2245_l2242_l2265_l2236_l2260_l2257_DUPLICATE_2f5e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2253_l2250_l2245_l2268_l2242_l2265_l2260_l2257_DUPLICATE_8aa6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2253_l2250_l2245_l2268_l2242_l2265_l2260_l2257_DUPLICATE_8aa6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2253_l2250_l2245_l2268_l2242_l2265_l2260_l2257_DUPLICATE_8aa6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2253_l2250_l2245_l2268_l2242_l2265_l2260_l2257_DUPLICATE_8aa6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2253_l2250_l2245_l2268_l2242_l2265_l2260_l2257_DUPLICATE_8aa6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2253_l2250_l2245_l2268_l2242_l2265_l2260_l2257_DUPLICATE_8aa6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2253_l2250_l2245_l2268_l2242_l2265_l2260_l2257_DUPLICATE_8aa6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2253_l2250_l2245_l2268_l2242_l2265_l2260_l2257_DUPLICATE_8aa6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2253_l2280_l2250_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_eea9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2253_l2280_l2250_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_eea9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2253_l2280_l2250_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_eea9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2253_l2280_l2250_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_eea9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2253_l2280_l2250_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_eea9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2253_l2280_l2250_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_eea9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2253_l2280_l2250_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_eea9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2253_l2280_l2250_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_eea9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2253_l2280_l2250_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_eea9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_635c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2253_l2280_l2250_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_eea9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2274_l2268_DUPLICATE_c1c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c7_7c0d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2274_l2268_DUPLICATE_c1c0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2253_l2250_l2274_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_963c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2253_l2250_l2274_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_963c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2253_l2250_l2274_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_963c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2253_l2250_l2274_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_963c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2253_l2250_l2274_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_963c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2253_l2250_l2274_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_963c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2253_l2250_l2274_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_963c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2253_l2250_l2274_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_963c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2253_l2250_l2274_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_963c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c7_7c0d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2253_l2250_l2274_l2245_l2268_l2242_l2265_l2236_l2260_l2257_DUPLICATE_963c_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2268_c7_4e06] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2268_c7_4e06_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2268_c7_4e06_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2274_c7_7c0d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c7_7c0d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c7_7c0d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c7_7c0d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c7_7c0d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c7_7c0d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c7_7c0d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2269_c3_20da] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2269_c3_20da_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2269_c3_20da_left;
     BIN_OP_OR_uxn_opcodes_h_l2269_c3_20da_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2269_c3_20da_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2269_c3_20da_return_output := BIN_OP_OR_uxn_opcodes_h_l2269_c3_20da_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2254_c3_3f87] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2254_c3_3f87_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2254_c3_3f87_left;
     BIN_OP_OR_uxn_opcodes_h_l2254_c3_3f87_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2254_c3_3f87_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2254_c3_3f87_return_output := BIN_OP_OR_uxn_opcodes_h_l2254_c3_3f87_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2280_c7_635c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_635c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_635c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_635c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_635c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_635c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_635c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_635c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_635c_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2272_c32_6626] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2272_c32_6626_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2272_c32_6626_left;
     BIN_OP_GT_uxn_opcodes_h_l2272_c32_6626_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2272_c32_6626_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2272_c32_6626_return_output := BIN_OP_GT_uxn_opcodes_h_l2272_c32_6626_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2236_c1_4bbe] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_4bbe_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_4bbe_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_4bbe_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_4bbe_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_4bbe_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_4bbe_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_4bbe_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_4bbe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2280_c7_635c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_635c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_635c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_635c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_635c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_635c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_635c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_635c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_635c_return_output;

     -- MUX[uxn_opcodes_h_l2278_c24_bdbe] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2278_c24_bdbe_cond <= VAR_MUX_uxn_opcodes_h_l2278_c24_bdbe_cond;
     MUX_uxn_opcodes_h_l2278_c24_bdbe_iftrue <= VAR_MUX_uxn_opcodes_h_l2278_c24_bdbe_iftrue;
     MUX_uxn_opcodes_h_l2278_c24_bdbe_iffalse <= VAR_MUX_uxn_opcodes_h_l2278_c24_bdbe_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2278_c24_bdbe_return_output := MUX_uxn_opcodes_h_l2278_c24_bdbe_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2274_c7_7c0d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c7_7c0d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c7_7c0d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c7_7c0d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c7_7c0d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c7_7c0d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c7_7c0d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2262_l2247_DUPLICATE_171f LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2262_l2247_DUPLICATE_171f_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2262_l2247_DUPLICATE_171f_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2262_l2247_DUPLICATE_171f_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2262_l2247_DUPLICATE_171f_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2272_c32_6823_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2272_c32_6626_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2254_c3_3f87_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2269_c3_20da_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2262_l2247_DUPLICATE_171f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2262_l2247_DUPLICATE_171f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c7_7c0d_iftrue := VAR_MUX_uxn_opcodes_h_l2278_c24_bdbe_return_output;
     VAR_printf_uxn_opcodes_h_l2237_c3_8629_uxn_opcodes_h_l2237_c3_8629_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_4bbe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c7_7c0d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2280_c7_635c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c7_7c0d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2280_c7_635c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output;
     -- n16_MUX[uxn_opcodes_h_l2268_c7_4e06] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2268_c7_4e06_cond <= VAR_n16_MUX_uxn_opcodes_h_l2268_c7_4e06_cond;
     n16_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue;
     n16_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output := n16_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2274_c7_7c0d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2274_c7_7c0d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c7_7c0d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2274_c7_7c0d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c7_7c0d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2274_c7_7c0d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c7_7c0d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2265_c7_5449] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2265_c7_5449_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2265_c7_5449_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2265_c7_5449_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2265_c7_5449_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2274_c7_7c0d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2274_c7_7c0d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c7_7c0d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2274_c7_7c0d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c7_7c0d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2274_c7_7c0d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c7_7c0d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output;

     -- MUX[uxn_opcodes_h_l2272_c32_6823] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2272_c32_6823_cond <= VAR_MUX_uxn_opcodes_h_l2272_c32_6823_cond;
     MUX_uxn_opcodes_h_l2272_c32_6823_iftrue <= VAR_MUX_uxn_opcodes_h_l2272_c32_6823_iftrue;
     MUX_uxn_opcodes_h_l2272_c32_6823_iffalse <= VAR_MUX_uxn_opcodes_h_l2272_c32_6823_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2272_c32_6823_return_output := MUX_uxn_opcodes_h_l2272_c32_6823_return_output;

     -- t16_MUX[uxn_opcodes_h_l2253_c7_648e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2253_c7_648e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2253_c7_648e_cond;
     t16_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue;
     t16_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2253_c7_648e_return_output := t16_MUX_uxn_opcodes_h_l2253_c7_648e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2268_c7_4e06] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2268_c7_4e06] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_4e06_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_4e06_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2274_c7_7c0d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2274_c7_7c0d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c7_7c0d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2274_c7_7c0d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c7_7c0d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2274_c7_7c0d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c7_7c0d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output;

     -- printf_uxn_opcodes_h_l2237_c3_8629[uxn_opcodes_h_l2237_c3_8629] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2237_c3_8629_uxn_opcodes_h_l2237_c3_8629_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2237_c3_8629_uxn_opcodes_h_l2237_c3_8629_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue := VAR_MUX_uxn_opcodes_h_l2272_c32_6823_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2265_c7_5449_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c7_7c0d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2253_c7_648e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2265_c7_5449] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_5449_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_5449_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_5449_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_5449_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2268_c7_4e06] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2268_c7_4e06_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2268_c7_4e06_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output := result_stack_value_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2268_c7_4e06] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2265_c7_5449] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2265_c7_5449_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2265_c7_5449_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2265_c7_5449_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2265_c7_5449_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2268_c7_4e06] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_4e06_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_4e06_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2268_c7_4e06] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_4e06_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_4e06_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_4e06_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_4e06_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output;

     -- n16_MUX[uxn_opcodes_h_l2265_c7_5449] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2265_c7_5449_cond <= VAR_n16_MUX_uxn_opcodes_h_l2265_c7_5449_cond;
     n16_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue;
     n16_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2265_c7_5449_return_output := n16_MUX_uxn_opcodes_h_l2265_c7_5449_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2260_c7_f327] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_f327_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_f327_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_f327_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_f327_return_output;

     -- t16_MUX[uxn_opcodes_h_l2250_c7_7ca2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond <= VAR_t16_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond;
     t16_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue;
     t16_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output := t16_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2265_c7_5449_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2265_c7_5449_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_f327_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_5449_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2268_c7_4e06_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2265_c7_5449] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2265_c7_5449_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2265_c7_5449_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2265_c7_5449_return_output := result_stack_value_MUX_uxn_opcodes_h_l2265_c7_5449_return_output;

     -- n16_MUX[uxn_opcodes_h_l2260_c7_f327] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2260_c7_f327_cond <= VAR_n16_MUX_uxn_opcodes_h_l2260_c7_f327_cond;
     n16_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue;
     n16_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2260_c7_f327_return_output := n16_MUX_uxn_opcodes_h_l2260_c7_f327_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2260_c7_f327] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_f327_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_f327_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_f327_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_f327_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2260_c7_f327] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_f327_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_f327_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_f327_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_f327_return_output;

     -- t16_MUX[uxn_opcodes_h_l2245_c7_fdef] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2245_c7_fdef_cond <= VAR_t16_MUX_uxn_opcodes_h_l2245_c7_fdef_cond;
     t16_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue;
     t16_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output := t16_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2265_c7_5449] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_5449_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_5449_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_5449_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_5449_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2265_c7_5449] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_5449_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_5449_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_5449_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_5449_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2257_c7_f42b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2257_c7_f42b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2257_c7_f42b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2265_c7_5449] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_5449_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_5449_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_5449_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_5449_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_5449_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_5449_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2260_c7_f327_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_5449_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_f327_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_5449_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_5449_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_f327_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2265_c7_5449_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2260_c7_f327] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_f327_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_f327_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_f327_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_f327_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2253_c7_648e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_648e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_648e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_648e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_648e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2260_c7_f327] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_f327_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_f327_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_f327_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_f327_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2257_c7_f42b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_f42b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_f42b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2257_c7_f42b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2257_c7_f42b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2257_c7_f42b_cond;
     n16_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue;
     n16_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output := n16_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2260_c7_f327] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2260_c7_f327_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_f327_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_f327_return_output := result_stack_value_MUX_uxn_opcodes_h_l2260_c7_f327_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2260_c7_f327] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_f327_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_f327_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_f327_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_f327_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_f327_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_f327_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2257_c7_f42b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output;

     -- t16_MUX[uxn_opcodes_h_l2242_c7_9660] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2242_c7_9660_cond <= VAR_t16_MUX_uxn_opcodes_h_l2242_c7_9660_cond;
     t16_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue;
     t16_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2242_c7_9660_return_output := t16_MUX_uxn_opcodes_h_l2242_c7_9660_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_f327_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_648e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_f327_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_f327_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_f327_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2242_c7_9660_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2253_c7_648e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_648e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_648e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_648e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_648e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2257_c7_f42b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_f42b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_f42b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2257_c7_f42b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_f42b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_f42b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2253_c7_648e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_648e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_648e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_648e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_648e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2257_c7_f42b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2257_c7_f42b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2257_c7_f42b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output;

     -- t16_MUX[uxn_opcodes_h_l2236_c2_5ae3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond <= VAR_t16_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond;
     t16_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue;
     t16_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output := t16_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2257_c7_f42b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2250_c7_7ca2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2253_c7_648e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2253_c7_648e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2253_c7_648e_cond;
     n16_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue;
     n16_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2253_c7_648e_return_output := n16_MUX_uxn_opcodes_h_l2253_c7_648e_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2253_c7_648e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_648e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_648e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2257_c7_f42b_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2253_c7_648e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_648e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_648e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_648e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_648e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2250_c7_7ca2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2253_c7_648e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_648e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_648e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_648e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_648e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2253_c7_648e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_648e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_648e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_648e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_648e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2250_c7_7ca2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond;
     n16_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue;
     n16_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output := n16_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2245_c7_fdef] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2245_c7_fdef_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2245_c7_fdef_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2250_c7_7ca2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2253_c7_648e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2253_c7_648e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2253_c7_648e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2253_c7_648e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2253_c7_648e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2253_c7_648e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2253_c7_648e_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_648e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_648e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_648e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2253_c7_648e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2250_c7_7ca2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2250_c7_7ca2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2245_c7_fdef] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2245_c7_fdef_cond <= VAR_n16_MUX_uxn_opcodes_h_l2245_c7_fdef_cond;
     n16_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue;
     n16_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output := n16_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2250_c7_7ca2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2242_c7_9660] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2242_c7_9660_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2242_c7_9660_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2242_c7_9660_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2242_c7_9660_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2245_c7_fdef] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2245_c7_fdef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_fdef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_fdef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2250_c7_7ca2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2250_c7_7ca2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2250_c7_7ca2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2250_c7_7ca2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2242_c7_9660_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2250_c7_7ca2_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2242_c7_9660] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_9660_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_9660_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_9660_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_9660_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2245_c7_fdef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_fdef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_fdef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2242_c7_9660] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_9660_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_9660_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_9660_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_9660_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2245_c7_fdef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2245_c7_fdef] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2245_c7_fdef_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2245_c7_fdef_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output := result_stack_value_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2245_c7_fdef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_fdef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_fdef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_fdef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_fdef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2236_c2_5ae3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2242_c7_9660] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2242_c7_9660_cond <= VAR_n16_MUX_uxn_opcodes_h_l2242_c7_9660_cond;
     n16_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue;
     n16_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2242_c7_9660_return_output := n16_MUX_uxn_opcodes_h_l2242_c7_9660_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2242_c7_9660_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_9660_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2242_c7_9660_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2245_c7_fdef_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2242_c7_9660] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_9660_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_9660_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_9660_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_9660_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2242_c7_9660] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2242_c7_9660_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2242_c7_9660_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2242_c7_9660_return_output := result_stack_value_MUX_uxn_opcodes_h_l2242_c7_9660_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2236_c2_5ae3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2236_c2_5ae3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond <= VAR_n16_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond;
     n16_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue;
     n16_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output := n16_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2242_c7_9660] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_9660_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_9660_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_9660_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_9660_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2236_c2_5ae3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2242_c7_9660] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_9660_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_9660_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_9660_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_9660_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_9660_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_9660_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_9660_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2242_c7_9660_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2242_c7_9660_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2242_c7_9660_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2236_c2_5ae3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2236_c2_5ae3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2236_c2_5ae3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2236_c2_5ae3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_5ae3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_5ae3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_5ae3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output := result_stack_value_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2285_l2232_DUPLICATE_0611 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2285_l2232_DUPLICATE_0611_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_287e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2236_c2_5ae3_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2285_l2232_DUPLICATE_0611_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2285_l2232_DUPLICATE_0611_return_output;
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
