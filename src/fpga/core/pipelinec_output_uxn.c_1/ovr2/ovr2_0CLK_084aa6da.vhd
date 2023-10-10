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
-- Submodules: 136
entity ovr2_0CLK_084aa6da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ovr2_0CLK_084aa6da;
architecture arch of ovr2_0CLK_084aa6da is
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
-- BIN_OP_EQ[uxn_opcodes_h_l352_c6_6311]
signal BIN_OP_EQ_uxn_opcodes_h_l352_c6_6311_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c6_6311_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c6_6311_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l352_c1_5138]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l352_c1_5138_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l352_c1_5138_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l352_c1_5138_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l352_c1_5138_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l352_c2_4477]
signal n16_MUX_uxn_opcodes_h_l352_c2_4477_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l352_c2_4477_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l352_c2_4477_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l352_c2_4477_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l352_c2_4477]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l352_c2_4477_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l352_c2_4477_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l352_c2_4477_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l352_c2_4477_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l352_c2_4477]
signal result_is_stack_read_MUX_uxn_opcodes_h_l352_c2_4477_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l352_c2_4477_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l352_c2_4477_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l352_c2_4477_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l352_c2_4477]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c2_4477_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c2_4477_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c2_4477_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c2_4477_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l352_c2_4477]
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c2_4477_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c2_4477_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c2_4477_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c2_4477_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c2_4477]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c2_4477_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c2_4477_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c2_4477_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c2_4477_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l352_c2_4477]
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c2_4477_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c2_4477_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c2_4477_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c2_4477_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l352_c2_4477]
signal result_stack_value_MUX_uxn_opcodes_h_l352_c2_4477_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l352_c2_4477_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l352_c2_4477_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l352_c2_4477_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l352_c2_4477]
signal t16_MUX_uxn_opcodes_h_l352_c2_4477_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l352_c2_4477_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l352_c2_4477_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l352_c2_4477_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l353_c3_b219[uxn_opcodes_h_l353_c3_b219]
signal printf_uxn_opcodes_h_l353_c3_b219_uxn_opcodes_h_l353_c3_b219_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l358_c11_0f5d]
signal BIN_OP_EQ_uxn_opcodes_h_l358_c11_0f5d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l358_c11_0f5d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l358_c11_0f5d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l358_c7_b137]
signal n16_MUX_uxn_opcodes_h_l358_c7_b137_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l358_c7_b137_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l358_c7_b137_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l358_c7_b137_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l358_c7_b137]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_b137_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_b137_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_b137_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_b137_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l358_c7_b137]
signal result_is_stack_read_MUX_uxn_opcodes_h_l358_c7_b137_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l358_c7_b137_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l358_c7_b137_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l358_c7_b137_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l358_c7_b137]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_b137_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_b137_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_b137_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_b137_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l358_c7_b137]
signal result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_b137_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_b137_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_b137_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_b137_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l358_c7_b137]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_b137_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_b137_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_b137_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_b137_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l358_c7_b137]
signal result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_b137_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_b137_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_b137_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_b137_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l358_c7_b137]
signal result_stack_value_MUX_uxn_opcodes_h_l358_c7_b137_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l358_c7_b137_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l358_c7_b137_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l358_c7_b137_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l358_c7_b137]
signal t16_MUX_uxn_opcodes_h_l358_c7_b137_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l358_c7_b137_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l358_c7_b137_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l358_c7_b137_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l361_c11_8836]
signal BIN_OP_EQ_uxn_opcodes_h_l361_c11_8836_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l361_c11_8836_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l361_c11_8836_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l361_c7_2b9e]
signal n16_MUX_uxn_opcodes_h_l361_c7_2b9e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l361_c7_2b9e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l361_c7_2b9e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l361_c7_2b9e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l361_c7_2b9e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l361_c7_2b9e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_2b9e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l361_c7_2b9e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_2b9e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l361_c7_2b9e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_2b9e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l361_c7_2b9e]
signal result_stack_value_MUX_uxn_opcodes_h_l361_c7_2b9e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l361_c7_2b9e]
signal t16_MUX_uxn_opcodes_h_l361_c7_2b9e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l366_c11_65bd]
signal BIN_OP_EQ_uxn_opcodes_h_l366_c11_65bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l366_c11_65bd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l366_c11_65bd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l366_c7_87a6]
signal n16_MUX_uxn_opcodes_h_l366_c7_87a6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l366_c7_87a6_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l366_c7_87a6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_87a6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_87a6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l366_c7_87a6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l366_c7_87a6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l366_c7_87a6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l366_c7_87a6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_87a6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_87a6_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l366_c7_87a6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_87a6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_87a6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l366_c7_87a6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_87a6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_87a6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l366_c7_87a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_87a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_87a6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l366_c7_87a6]
signal result_stack_value_MUX_uxn_opcodes_h_l366_c7_87a6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l366_c7_87a6_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l366_c7_87a6]
signal t16_MUX_uxn_opcodes_h_l366_c7_87a6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l366_c7_87a6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l369_c11_9033]
signal BIN_OP_EQ_uxn_opcodes_h_l369_c11_9033_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l369_c11_9033_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l369_c11_9033_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l369_c7_63aa]
signal n16_MUX_uxn_opcodes_h_l369_c7_63aa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l369_c7_63aa_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l369_c7_63aa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_63aa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_63aa_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l369_c7_63aa]
signal result_is_stack_read_MUX_uxn_opcodes_h_l369_c7_63aa_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l369_c7_63aa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l369_c7_63aa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_63aa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_63aa_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l369_c7_63aa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_63aa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_63aa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l369_c7_63aa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_63aa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_63aa_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l369_c7_63aa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_63aa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_63aa_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l369_c7_63aa]
signal result_stack_value_MUX_uxn_opcodes_h_l369_c7_63aa_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l369_c7_63aa_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l369_c7_63aa]
signal t16_MUX_uxn_opcodes_h_l369_c7_63aa_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l369_c7_63aa_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l370_c3_2164]
signal BIN_OP_OR_uxn_opcodes_h_l370_c3_2164_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l370_c3_2164_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l370_c3_2164_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l373_c11_42c2]
signal BIN_OP_EQ_uxn_opcodes_h_l373_c11_42c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l373_c11_42c2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l373_c11_42c2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l373_c7_3a0a]
signal n16_MUX_uxn_opcodes_h_l373_c7_3a0a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l373_c7_3a0a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l373_c7_3a0a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_3a0a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l373_c7_3a0a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l373_c7_3a0a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_3a0a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l373_c7_3a0a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_3a0a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l373_c7_3a0a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_3a0a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l373_c7_3a0a]
signal result_stack_value_MUX_uxn_opcodes_h_l373_c7_3a0a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l376_c11_d919]
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_d919_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_d919_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_d919_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l376_c7_1768]
signal n16_MUX_uxn_opcodes_h_l376_c7_1768_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l376_c7_1768_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l376_c7_1768_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l376_c7_1768_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l376_c7_1768]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1768_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1768_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1768_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1768_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l376_c7_1768]
signal result_is_stack_read_MUX_uxn_opcodes_h_l376_c7_1768_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l376_c7_1768_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l376_c7_1768_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l376_c7_1768_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l376_c7_1768]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1768_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1768_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1768_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1768_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l376_c7_1768]
signal result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1768_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1768_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1768_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1768_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_1768]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1768_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1768_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1768_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1768_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_1768]
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1768_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1768_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1768_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1768_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l376_c7_1768]
signal result_stack_value_MUX_uxn_opcodes_h_l376_c7_1768_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l376_c7_1768_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l376_c7_1768_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l376_c7_1768_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l381_c11_048d]
signal BIN_OP_EQ_uxn_opcodes_h_l381_c11_048d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l381_c11_048d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l381_c11_048d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l381_c7_2b07]
signal n16_MUX_uxn_opcodes_h_l381_c7_2b07_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l381_c7_2b07_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l381_c7_2b07]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_2b07_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_2b07_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l381_c7_2b07]
signal result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_2b07_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_2b07_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l381_c7_2b07]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_2b07_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_2b07_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l381_c7_2b07]
signal result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_2b07_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_2b07_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l381_c7_2b07]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_2b07_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_2b07_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l381_c7_2b07]
signal result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_2b07_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_2b07_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l381_c7_2b07]
signal result_stack_value_MUX_uxn_opcodes_h_l381_c7_2b07_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l381_c7_2b07_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l384_c11_7376]
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_7376_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_7376_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_7376_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l384_c7_85ab]
signal n16_MUX_uxn_opcodes_h_l384_c7_85ab_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l384_c7_85ab_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l384_c7_85ab]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_85ab_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_85ab_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l384_c7_85ab]
signal result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_85ab_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_85ab_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l384_c7_85ab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_85ab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_85ab_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l384_c7_85ab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_85ab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_85ab_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_85ab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_85ab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_85ab_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_85ab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_85ab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_85ab_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l384_c7_85ab]
signal result_stack_value_MUX_uxn_opcodes_h_l384_c7_85ab_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l384_c7_85ab_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l385_c3_f8a8]
signal BIN_OP_OR_uxn_opcodes_h_l385_c3_f8a8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l385_c3_f8a8_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l385_c3_f8a8_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l388_c32_73d9]
signal BIN_OP_AND_uxn_opcodes_h_l388_c32_73d9_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l388_c32_73d9_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l388_c32_73d9_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l388_c32_b18b]
signal BIN_OP_GT_uxn_opcodes_h_l388_c32_b18b_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l388_c32_b18b_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l388_c32_b18b_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l388_c32_ee55]
signal MUX_uxn_opcodes_h_l388_c32_ee55_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l388_c32_ee55_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l388_c32_ee55_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l388_c32_ee55_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l390_c11_ab35]
signal BIN_OP_EQ_uxn_opcodes_h_l390_c11_ab35_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l390_c11_ab35_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l390_c11_ab35_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l390_c7_9cfd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l390_c7_9cfd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l390_c7_9cfd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l390_c7_9cfd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l390_c7_9cfd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9cfd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9cfd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9cfd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l390_c7_9cfd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9cfd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9cfd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9cfd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l390_c7_9cfd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9cfd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9cfd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9cfd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l390_c7_9cfd]
signal result_stack_value_MUX_uxn_opcodes_h_l390_c7_9cfd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l390_c7_9cfd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l390_c7_9cfd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l396_c11_2907]
signal BIN_OP_EQ_uxn_opcodes_h_l396_c11_2907_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l396_c11_2907_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l396_c11_2907_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l396_c7_22a9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_22a9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_22a9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_22a9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_22a9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l396_c7_22a9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_22a9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_22a9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_22a9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_22a9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l396_c7_22a9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_22a9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_22a9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_22a9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_22a9_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l396_c7_22a9]
signal result_stack_value_MUX_uxn_opcodes_h_l396_c7_22a9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l396_c7_22a9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l396_c7_22a9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l396_c7_22a9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l400_c11_f53d]
signal BIN_OP_EQ_uxn_opcodes_h_l400_c11_f53d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l400_c11_f53d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l400_c11_f53d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l400_c7_3b8d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_3b8d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_3b8d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_3b8d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_3b8d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l400_c7_3b8d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_3b8d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_3b8d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_3b8d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_3b8d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l400_c7_3b8d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_3b8d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_3b8d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_3b8d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_3b8d_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l400_c7_3b8d]
signal result_stack_value_MUX_uxn_opcodes_h_l400_c7_3b8d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l400_c7_3b8d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l400_c7_3b8d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l400_c7_3b8d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l404_c11_8213]
signal BIN_OP_EQ_uxn_opcodes_h_l404_c11_8213_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l404_c11_8213_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l404_c11_8213_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l404_c7_1bb8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1bb8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1bb8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1bb8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1bb8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l404_c7_1bb8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1bb8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1bb8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1bb8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1bb8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l404_c7_1bb8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1bb8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1bb8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1bb8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1bb8_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l404_c7_1bb8]
signal result_stack_value_MUX_uxn_opcodes_h_l404_c7_1bb8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l404_c7_1bb8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l404_c7_1bb8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l404_c7_1bb8_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l406_c34_b53e]
signal CONST_SR_8_uxn_opcodes_h_l406_c34_b53e_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l406_c34_b53e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l408_c11_bbb2]
signal BIN_OP_EQ_uxn_opcodes_h_l408_c11_bbb2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l408_c11_bbb2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l408_c11_bbb2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l408_c7_a97f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_a97f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_a97f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_a97f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_a97f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l408_c7_a97f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_a97f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_a97f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_a97f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_a97f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l408_c7_a97f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_a97f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_a97f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_a97f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_a97f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l408_c7_a97f]
signal result_stack_value_MUX_uxn_opcodes_h_l408_c7_a97f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l408_c7_a97f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l408_c7_a97f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l408_c7_a97f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l412_c11_39d2]
signal BIN_OP_EQ_uxn_opcodes_h_l412_c11_39d2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l412_c11_39d2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l412_c11_39d2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l412_c7_1791]
signal result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_1791_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_1791_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_1791_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_1791_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l412_c7_1791]
signal result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_1791_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_1791_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_1791_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_1791_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l412_c7_1791]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_1791_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_1791_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_1791_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_1791_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l412_c7_1791]
signal result_stack_value_MUX_uxn_opcodes_h_l412_c7_1791_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l412_c7_1791_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l412_c7_1791_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l412_c7_1791_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l416_c11_624b]
signal BIN_OP_EQ_uxn_opcodes_h_l416_c11_624b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l416_c11_624b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l416_c11_624b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l416_c7_7638]
signal result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7638_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7638_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7638_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7638_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l416_c7_7638]
signal result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7638_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7638_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7638_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7638_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l363_l378_DUPLICATE_2257
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l363_l378_DUPLICATE_2257_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l363_l378_DUPLICATE_2257_return_output : unsigned(15 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l398_l414_DUPLICATE_c0c3
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l398_l414_DUPLICATE_c0c3_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l398_l414_DUPLICATE_c0c3_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l352_c6_6311
BIN_OP_EQ_uxn_opcodes_h_l352_c6_6311 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l352_c6_6311_left,
BIN_OP_EQ_uxn_opcodes_h_l352_c6_6311_right,
BIN_OP_EQ_uxn_opcodes_h_l352_c6_6311_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l352_c1_5138
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l352_c1_5138 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l352_c1_5138_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l352_c1_5138_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l352_c1_5138_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l352_c1_5138_return_output);

-- n16_MUX_uxn_opcodes_h_l352_c2_4477
n16_MUX_uxn_opcodes_h_l352_c2_4477 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l352_c2_4477_cond,
n16_MUX_uxn_opcodes_h_l352_c2_4477_iftrue,
n16_MUX_uxn_opcodes_h_l352_c2_4477_iffalse,
n16_MUX_uxn_opcodes_h_l352_c2_4477_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l352_c2_4477
result_is_sp_shift_MUX_uxn_opcodes_h_l352_c2_4477 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l352_c2_4477_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l352_c2_4477_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l352_c2_4477_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l352_c2_4477_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l352_c2_4477
result_is_stack_read_MUX_uxn_opcodes_h_l352_c2_4477 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l352_c2_4477_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l352_c2_4477_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l352_c2_4477_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l352_c2_4477_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c2_4477
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c2_4477 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c2_4477_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c2_4477_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c2_4477_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c2_4477_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l352_c2_4477
result_is_stack_write_MUX_uxn_opcodes_h_l352_c2_4477 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l352_c2_4477_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c2_4477_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c2_4477_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c2_4477_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c2_4477
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c2_4477 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c2_4477_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c2_4477_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c2_4477_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c2_4477_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l352_c2_4477
result_is_opc_done_MUX_uxn_opcodes_h_l352_c2_4477 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l352_c2_4477_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c2_4477_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c2_4477_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c2_4477_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l352_c2_4477
result_stack_value_MUX_uxn_opcodes_h_l352_c2_4477 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l352_c2_4477_cond,
result_stack_value_MUX_uxn_opcodes_h_l352_c2_4477_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l352_c2_4477_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l352_c2_4477_return_output);

-- t16_MUX_uxn_opcodes_h_l352_c2_4477
t16_MUX_uxn_opcodes_h_l352_c2_4477 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l352_c2_4477_cond,
t16_MUX_uxn_opcodes_h_l352_c2_4477_iftrue,
t16_MUX_uxn_opcodes_h_l352_c2_4477_iffalse,
t16_MUX_uxn_opcodes_h_l352_c2_4477_return_output);

-- printf_uxn_opcodes_h_l353_c3_b219_uxn_opcodes_h_l353_c3_b219
printf_uxn_opcodes_h_l353_c3_b219_uxn_opcodes_h_l353_c3_b219 : entity work.printf_uxn_opcodes_h_l353_c3_b219_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l353_c3_b219_uxn_opcodes_h_l353_c3_b219_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l358_c11_0f5d
BIN_OP_EQ_uxn_opcodes_h_l358_c11_0f5d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l358_c11_0f5d_left,
BIN_OP_EQ_uxn_opcodes_h_l358_c11_0f5d_right,
BIN_OP_EQ_uxn_opcodes_h_l358_c11_0f5d_return_output);

-- n16_MUX_uxn_opcodes_h_l358_c7_b137
n16_MUX_uxn_opcodes_h_l358_c7_b137 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l358_c7_b137_cond,
n16_MUX_uxn_opcodes_h_l358_c7_b137_iftrue,
n16_MUX_uxn_opcodes_h_l358_c7_b137_iffalse,
n16_MUX_uxn_opcodes_h_l358_c7_b137_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_b137
result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_b137 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_b137_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_b137_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_b137_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_b137_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l358_c7_b137
result_is_stack_read_MUX_uxn_opcodes_h_l358_c7_b137 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l358_c7_b137_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l358_c7_b137_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l358_c7_b137_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l358_c7_b137_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_b137
result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_b137 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_b137_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_b137_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_b137_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_b137_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_b137
result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_b137 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_b137_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_b137_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_b137_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_b137_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_b137
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_b137 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_b137_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_b137_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_b137_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_b137_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_b137
result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_b137 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_b137_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_b137_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_b137_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_b137_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l358_c7_b137
result_stack_value_MUX_uxn_opcodes_h_l358_c7_b137 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l358_c7_b137_cond,
result_stack_value_MUX_uxn_opcodes_h_l358_c7_b137_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l358_c7_b137_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l358_c7_b137_return_output);

-- t16_MUX_uxn_opcodes_h_l358_c7_b137
t16_MUX_uxn_opcodes_h_l358_c7_b137 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l358_c7_b137_cond,
t16_MUX_uxn_opcodes_h_l358_c7_b137_iftrue,
t16_MUX_uxn_opcodes_h_l358_c7_b137_iffalse,
t16_MUX_uxn_opcodes_h_l358_c7_b137_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l361_c11_8836
BIN_OP_EQ_uxn_opcodes_h_l361_c11_8836 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l361_c11_8836_left,
BIN_OP_EQ_uxn_opcodes_h_l361_c11_8836_right,
BIN_OP_EQ_uxn_opcodes_h_l361_c11_8836_return_output);

-- n16_MUX_uxn_opcodes_h_l361_c7_2b9e
n16_MUX_uxn_opcodes_h_l361_c7_2b9e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l361_c7_2b9e_cond,
n16_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue,
n16_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse,
n16_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_2b9e
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_2b9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l361_c7_2b9e
result_is_stack_read_MUX_uxn_opcodes_h_l361_c7_2b9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l361_c7_2b9e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_2b9e
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_2b9e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_2b9e
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_2b9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_2b9e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_2b9e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_2b9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_2b9e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_2b9e
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_2b9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_2b9e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l361_c7_2b9e
result_stack_value_MUX_uxn_opcodes_h_l361_c7_2b9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l361_c7_2b9e_cond,
result_stack_value_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output);

-- t16_MUX_uxn_opcodes_h_l361_c7_2b9e
t16_MUX_uxn_opcodes_h_l361_c7_2b9e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l361_c7_2b9e_cond,
t16_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue,
t16_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse,
t16_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l366_c11_65bd
BIN_OP_EQ_uxn_opcodes_h_l366_c11_65bd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l366_c11_65bd_left,
BIN_OP_EQ_uxn_opcodes_h_l366_c11_65bd_right,
BIN_OP_EQ_uxn_opcodes_h_l366_c11_65bd_return_output);

-- n16_MUX_uxn_opcodes_h_l366_c7_87a6
n16_MUX_uxn_opcodes_h_l366_c7_87a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l366_c7_87a6_cond,
n16_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue,
n16_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse,
n16_MUX_uxn_opcodes_h_l366_c7_87a6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_87a6
result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_87a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_87a6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_87a6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l366_c7_87a6
result_is_stack_read_MUX_uxn_opcodes_h_l366_c7_87a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l366_c7_87a6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l366_c7_87a6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_87a6
result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_87a6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_87a6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_87a6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_87a6
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_87a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_87a6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_87a6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_87a6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_87a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_87a6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_87a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_87a6
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_87a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_87a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_87a6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l366_c7_87a6
result_stack_value_MUX_uxn_opcodes_h_l366_c7_87a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l366_c7_87a6_cond,
result_stack_value_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l366_c7_87a6_return_output);

-- t16_MUX_uxn_opcodes_h_l366_c7_87a6
t16_MUX_uxn_opcodes_h_l366_c7_87a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l366_c7_87a6_cond,
t16_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue,
t16_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse,
t16_MUX_uxn_opcodes_h_l366_c7_87a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l369_c11_9033
BIN_OP_EQ_uxn_opcodes_h_l369_c11_9033 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l369_c11_9033_left,
BIN_OP_EQ_uxn_opcodes_h_l369_c11_9033_right,
BIN_OP_EQ_uxn_opcodes_h_l369_c11_9033_return_output);

-- n16_MUX_uxn_opcodes_h_l369_c7_63aa
n16_MUX_uxn_opcodes_h_l369_c7_63aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l369_c7_63aa_cond,
n16_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue,
n16_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse,
n16_MUX_uxn_opcodes_h_l369_c7_63aa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_63aa
result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_63aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_63aa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_63aa_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l369_c7_63aa
result_is_stack_read_MUX_uxn_opcodes_h_l369_c7_63aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l369_c7_63aa_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l369_c7_63aa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_63aa
result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_63aa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_63aa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_63aa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_63aa
result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_63aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_63aa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_63aa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_63aa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_63aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_63aa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_63aa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_63aa
result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_63aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_63aa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_63aa_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l369_c7_63aa
result_stack_value_MUX_uxn_opcodes_h_l369_c7_63aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l369_c7_63aa_cond,
result_stack_value_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l369_c7_63aa_return_output);

-- t16_MUX_uxn_opcodes_h_l369_c7_63aa
t16_MUX_uxn_opcodes_h_l369_c7_63aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l369_c7_63aa_cond,
t16_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue,
t16_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse,
t16_MUX_uxn_opcodes_h_l369_c7_63aa_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l370_c3_2164
BIN_OP_OR_uxn_opcodes_h_l370_c3_2164 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l370_c3_2164_left,
BIN_OP_OR_uxn_opcodes_h_l370_c3_2164_right,
BIN_OP_OR_uxn_opcodes_h_l370_c3_2164_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l373_c11_42c2
BIN_OP_EQ_uxn_opcodes_h_l373_c11_42c2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l373_c11_42c2_left,
BIN_OP_EQ_uxn_opcodes_h_l373_c11_42c2_right,
BIN_OP_EQ_uxn_opcodes_h_l373_c11_42c2_return_output);

-- n16_MUX_uxn_opcodes_h_l373_c7_3a0a
n16_MUX_uxn_opcodes_h_l373_c7_3a0a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l373_c7_3a0a_cond,
n16_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue,
n16_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse,
n16_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_3a0a
result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_3a0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_3a0a
result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_3a0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_3a0a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_3a0a
result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_3a0a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_3a0a
result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_3a0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_3a0a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_3a0a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_3a0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_3a0a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_3a0a
result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_3a0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_3a0a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l373_c7_3a0a
result_stack_value_MUX_uxn_opcodes_h_l373_c7_3a0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l373_c7_3a0a_cond,
result_stack_value_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l376_c11_d919
BIN_OP_EQ_uxn_opcodes_h_l376_c11_d919 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l376_c11_d919_left,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_d919_right,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_d919_return_output);

-- n16_MUX_uxn_opcodes_h_l376_c7_1768
n16_MUX_uxn_opcodes_h_l376_c7_1768 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l376_c7_1768_cond,
n16_MUX_uxn_opcodes_h_l376_c7_1768_iftrue,
n16_MUX_uxn_opcodes_h_l376_c7_1768_iffalse,
n16_MUX_uxn_opcodes_h_l376_c7_1768_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1768
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1768 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1768_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1768_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1768_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1768_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l376_c7_1768
result_is_stack_read_MUX_uxn_opcodes_h_l376_c7_1768 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l376_c7_1768_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l376_c7_1768_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l376_c7_1768_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l376_c7_1768_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1768
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1768 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1768_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1768_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1768_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1768_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1768
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1768 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1768_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1768_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1768_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1768_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1768
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1768 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1768_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1768_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1768_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1768_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1768
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1768 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1768_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1768_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1768_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1768_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l376_c7_1768
result_stack_value_MUX_uxn_opcodes_h_l376_c7_1768 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l376_c7_1768_cond,
result_stack_value_MUX_uxn_opcodes_h_l376_c7_1768_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l376_c7_1768_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l376_c7_1768_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l381_c11_048d
BIN_OP_EQ_uxn_opcodes_h_l381_c11_048d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l381_c11_048d_left,
BIN_OP_EQ_uxn_opcodes_h_l381_c11_048d_right,
BIN_OP_EQ_uxn_opcodes_h_l381_c11_048d_return_output);

-- n16_MUX_uxn_opcodes_h_l381_c7_2b07
n16_MUX_uxn_opcodes_h_l381_c7_2b07 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l381_c7_2b07_cond,
n16_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue,
n16_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse,
n16_MUX_uxn_opcodes_h_l381_c7_2b07_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_2b07
result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_2b07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_2b07_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_2b07_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_2b07
result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_2b07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_2b07_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_2b07_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_2b07
result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_2b07 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_2b07_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_2b07_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_2b07
result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_2b07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_2b07_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_2b07_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_2b07
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_2b07 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_2b07_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_2b07_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_2b07
result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_2b07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_2b07_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_2b07_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l381_c7_2b07
result_stack_value_MUX_uxn_opcodes_h_l381_c7_2b07 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l381_c7_2b07_cond,
result_stack_value_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l381_c7_2b07_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l384_c11_7376
BIN_OP_EQ_uxn_opcodes_h_l384_c11_7376 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l384_c11_7376_left,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_7376_right,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_7376_return_output);

-- n16_MUX_uxn_opcodes_h_l384_c7_85ab
n16_MUX_uxn_opcodes_h_l384_c7_85ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l384_c7_85ab_cond,
n16_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue,
n16_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse,
n16_MUX_uxn_opcodes_h_l384_c7_85ab_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_85ab
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_85ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_85ab_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_85ab_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_85ab
result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_85ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_85ab_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_85ab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_85ab
result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_85ab : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_85ab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_85ab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_85ab
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_85ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_85ab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_85ab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_85ab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_85ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_85ab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_85ab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_85ab
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_85ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_85ab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_85ab_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l384_c7_85ab
result_stack_value_MUX_uxn_opcodes_h_l384_c7_85ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l384_c7_85ab_cond,
result_stack_value_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l384_c7_85ab_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l385_c3_f8a8
BIN_OP_OR_uxn_opcodes_h_l385_c3_f8a8 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l385_c3_f8a8_left,
BIN_OP_OR_uxn_opcodes_h_l385_c3_f8a8_right,
BIN_OP_OR_uxn_opcodes_h_l385_c3_f8a8_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l388_c32_73d9
BIN_OP_AND_uxn_opcodes_h_l388_c32_73d9 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l388_c32_73d9_left,
BIN_OP_AND_uxn_opcodes_h_l388_c32_73d9_right,
BIN_OP_AND_uxn_opcodes_h_l388_c32_73d9_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l388_c32_b18b
BIN_OP_GT_uxn_opcodes_h_l388_c32_b18b : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l388_c32_b18b_left,
BIN_OP_GT_uxn_opcodes_h_l388_c32_b18b_right,
BIN_OP_GT_uxn_opcodes_h_l388_c32_b18b_return_output);

-- MUX_uxn_opcodes_h_l388_c32_ee55
MUX_uxn_opcodes_h_l388_c32_ee55 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l388_c32_ee55_cond,
MUX_uxn_opcodes_h_l388_c32_ee55_iftrue,
MUX_uxn_opcodes_h_l388_c32_ee55_iffalse,
MUX_uxn_opcodes_h_l388_c32_ee55_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l390_c11_ab35
BIN_OP_EQ_uxn_opcodes_h_l390_c11_ab35 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l390_c11_ab35_left,
BIN_OP_EQ_uxn_opcodes_h_l390_c11_ab35_right,
BIN_OP_EQ_uxn_opcodes_h_l390_c11_ab35_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l390_c7_9cfd
result_is_sp_shift_MUX_uxn_opcodes_h_l390_c7_9cfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l390_c7_9cfd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l390_c7_9cfd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l390_c7_9cfd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9cfd
result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9cfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9cfd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9cfd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9cfd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9cfd
result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9cfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9cfd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9cfd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9cfd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9cfd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9cfd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9cfd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9cfd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9cfd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l390_c7_9cfd
result_stack_value_MUX_uxn_opcodes_h_l390_c7_9cfd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l390_c7_9cfd_cond,
result_stack_value_MUX_uxn_opcodes_h_l390_c7_9cfd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l390_c7_9cfd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l396_c11_2907
BIN_OP_EQ_uxn_opcodes_h_l396_c11_2907 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l396_c11_2907_left,
BIN_OP_EQ_uxn_opcodes_h_l396_c11_2907_right,
BIN_OP_EQ_uxn_opcodes_h_l396_c11_2907_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_22a9
result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_22a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_22a9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_22a9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_22a9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_22a9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_22a9
result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_22a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_22a9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_22a9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_22a9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_22a9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_22a9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_22a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_22a9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_22a9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_22a9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_22a9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l396_c7_22a9
result_stack_value_MUX_uxn_opcodes_h_l396_c7_22a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l396_c7_22a9_cond,
result_stack_value_MUX_uxn_opcodes_h_l396_c7_22a9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l396_c7_22a9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l396_c7_22a9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l400_c11_f53d
BIN_OP_EQ_uxn_opcodes_h_l400_c11_f53d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l400_c11_f53d_left,
BIN_OP_EQ_uxn_opcodes_h_l400_c11_f53d_right,
BIN_OP_EQ_uxn_opcodes_h_l400_c11_f53d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_3b8d
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_3b8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_3b8d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_3b8d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_3b8d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_3b8d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_3b8d
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_3b8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_3b8d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_3b8d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_3b8d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_3b8d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_3b8d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_3b8d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_3b8d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_3b8d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_3b8d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_3b8d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l400_c7_3b8d
result_stack_value_MUX_uxn_opcodes_h_l400_c7_3b8d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l400_c7_3b8d_cond,
result_stack_value_MUX_uxn_opcodes_h_l400_c7_3b8d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l400_c7_3b8d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l400_c7_3b8d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l404_c11_8213
BIN_OP_EQ_uxn_opcodes_h_l404_c11_8213 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l404_c11_8213_left,
BIN_OP_EQ_uxn_opcodes_h_l404_c11_8213_right,
BIN_OP_EQ_uxn_opcodes_h_l404_c11_8213_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1bb8
result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1bb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1bb8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1bb8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1bb8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1bb8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1bb8
result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1bb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1bb8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1bb8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1bb8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1bb8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1bb8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1bb8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1bb8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1bb8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1bb8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1bb8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l404_c7_1bb8
result_stack_value_MUX_uxn_opcodes_h_l404_c7_1bb8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l404_c7_1bb8_cond,
result_stack_value_MUX_uxn_opcodes_h_l404_c7_1bb8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l404_c7_1bb8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l404_c7_1bb8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l406_c34_b53e
CONST_SR_8_uxn_opcodes_h_l406_c34_b53e : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l406_c34_b53e_x,
CONST_SR_8_uxn_opcodes_h_l406_c34_b53e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l408_c11_bbb2
BIN_OP_EQ_uxn_opcodes_h_l408_c11_bbb2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l408_c11_bbb2_left,
BIN_OP_EQ_uxn_opcodes_h_l408_c11_bbb2_right,
BIN_OP_EQ_uxn_opcodes_h_l408_c11_bbb2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_a97f
result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_a97f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_a97f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_a97f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_a97f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_a97f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_a97f
result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_a97f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_a97f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_a97f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_a97f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_a97f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_a97f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_a97f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_a97f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_a97f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_a97f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_a97f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l408_c7_a97f
result_stack_value_MUX_uxn_opcodes_h_l408_c7_a97f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l408_c7_a97f_cond,
result_stack_value_MUX_uxn_opcodes_h_l408_c7_a97f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l408_c7_a97f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l408_c7_a97f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l412_c11_39d2
BIN_OP_EQ_uxn_opcodes_h_l412_c11_39d2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l412_c11_39d2_left,
BIN_OP_EQ_uxn_opcodes_h_l412_c11_39d2_right,
BIN_OP_EQ_uxn_opcodes_h_l412_c11_39d2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_1791
result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_1791 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_1791_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_1791_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_1791_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_1791_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_1791
result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_1791 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_1791_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_1791_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_1791_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_1791_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_1791
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_1791 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_1791_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_1791_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_1791_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_1791_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l412_c7_1791
result_stack_value_MUX_uxn_opcodes_h_l412_c7_1791 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l412_c7_1791_cond,
result_stack_value_MUX_uxn_opcodes_h_l412_c7_1791_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l412_c7_1791_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l412_c7_1791_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l416_c11_624b
BIN_OP_EQ_uxn_opcodes_h_l416_c11_624b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l416_c11_624b_left,
BIN_OP_EQ_uxn_opcodes_h_l416_c11_624b_right,
BIN_OP_EQ_uxn_opcodes_h_l416_c11_624b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7638
result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7638 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7638_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7638_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7638_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7638_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7638
result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7638 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7638_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7638_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7638_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7638_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l363_l378_DUPLICATE_2257
CONST_SL_8_uint16_t_uxn_opcodes_h_l363_l378_DUPLICATE_2257 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l363_l378_DUPLICATE_2257_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l363_l378_DUPLICATE_2257_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l398_l414_DUPLICATE_c0c3
CONST_SR_8_uint16_t_uxn_opcodes_h_l398_l414_DUPLICATE_c0c3 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l398_l414_DUPLICATE_c0c3_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l398_l414_DUPLICATE_c0c3_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l352_c6_6311_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l352_c1_5138_return_output,
 n16_MUX_uxn_opcodes_h_l352_c2_4477_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l352_c2_4477_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l352_c2_4477_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c2_4477_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l352_c2_4477_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c2_4477_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l352_c2_4477_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l352_c2_4477_return_output,
 t16_MUX_uxn_opcodes_h_l352_c2_4477_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l358_c11_0f5d_return_output,
 n16_MUX_uxn_opcodes_h_l358_c7_b137_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_b137_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l358_c7_b137_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_b137_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_b137_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_b137_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_b137_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l358_c7_b137_return_output,
 t16_MUX_uxn_opcodes_h_l358_c7_b137_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l361_c11_8836_return_output,
 n16_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output,
 t16_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l366_c11_65bd_return_output,
 n16_MUX_uxn_opcodes_h_l366_c7_87a6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_87a6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l366_c7_87a6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_87a6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_87a6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_87a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_87a6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l366_c7_87a6_return_output,
 t16_MUX_uxn_opcodes_h_l366_c7_87a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l369_c11_9033_return_output,
 n16_MUX_uxn_opcodes_h_l369_c7_63aa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_63aa_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l369_c7_63aa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_63aa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_63aa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_63aa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_63aa_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l369_c7_63aa_return_output,
 t16_MUX_uxn_opcodes_h_l369_c7_63aa_return_output,
 BIN_OP_OR_uxn_opcodes_h_l370_c3_2164_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l373_c11_42c2_return_output,
 n16_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l376_c11_d919_return_output,
 n16_MUX_uxn_opcodes_h_l376_c7_1768_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1768_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l376_c7_1768_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1768_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1768_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1768_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1768_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l376_c7_1768_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l381_c11_048d_return_output,
 n16_MUX_uxn_opcodes_h_l381_c7_2b07_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_2b07_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_2b07_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_2b07_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_2b07_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_2b07_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_2b07_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l381_c7_2b07_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l384_c11_7376_return_output,
 n16_MUX_uxn_opcodes_h_l384_c7_85ab_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_85ab_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_85ab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_85ab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_85ab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_85ab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_85ab_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l384_c7_85ab_return_output,
 BIN_OP_OR_uxn_opcodes_h_l385_c3_f8a8_return_output,
 BIN_OP_AND_uxn_opcodes_h_l388_c32_73d9_return_output,
 BIN_OP_GT_uxn_opcodes_h_l388_c32_b18b_return_output,
 MUX_uxn_opcodes_h_l388_c32_ee55_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l390_c11_ab35_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l396_c11_2907_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_22a9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_22a9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_22a9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l396_c7_22a9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l400_c11_f53d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_3b8d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_3b8d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_3b8d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l400_c7_3b8d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l404_c11_8213_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1bb8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1bb8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1bb8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l404_c7_1bb8_return_output,
 CONST_SR_8_uxn_opcodes_h_l406_c34_b53e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l408_c11_bbb2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_a97f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_a97f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_a97f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l408_c7_a97f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l412_c11_39d2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_1791_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_1791_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_1791_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l412_c7_1791_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l416_c11_624b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7638_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7638_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l363_l378_DUPLICATE_2257_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l398_l414_DUPLICATE_c0c3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c6_6311_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c6_6311_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c6_6311_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l352_c1_5138_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l352_c1_5138_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l352_c1_5138_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l352_c1_5138_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l352_c2_4477_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l352_c2_4477_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l358_c7_b137_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l352_c2_4477_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l352_c2_4477_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c2_4477_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c2_4477_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_b137_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c2_4477_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c2_4477_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l352_c2_4477_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l352_c2_4477_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l358_c7_b137_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l352_c2_4477_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l352_c2_4477_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c2_4477_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c2_4477_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_b137_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c2_4477_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c2_4477_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c2_4477_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c2_4477_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_b137_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c2_4477_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c2_4477_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c2_4477_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l355_c3_e5ae : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c2_4477_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_b137_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c2_4477_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c2_4477_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c2_4477_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c2_4477_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_b137_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c2_4477_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c2_4477_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c2_4477_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c2_4477_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_b137_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c2_4477_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c2_4477_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l352_c2_4477_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l352_c2_4477_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l358_c7_b137_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l352_c2_4477_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l352_c2_4477_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l353_c3_b219_uxn_opcodes_h_l353_c3_b219_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_0f5d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_0f5d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_0f5d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l358_c7_b137_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l358_c7_b137_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l358_c7_b137_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_b137_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_b137_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_b137_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l358_c7_b137_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l358_c7_b137_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l358_c7_b137_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_b137_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_b137_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_b137_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_b137_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_b137_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_b137_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_b137_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_1215 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_b137_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_b137_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_b137_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_b137_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_b137_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_b137_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_b137_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_b137_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l358_c7_b137_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l358_c7_b137_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l358_c7_b137_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_8836_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_8836_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_8836_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l366_c7_87a6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l361_c7_2b9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_87a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l366_c7_87a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l361_c7_2b9e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_87a6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_87a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_2b9e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l364_c3_a176 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_87a6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_2b9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_87a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_2b9e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l366_c7_87a6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_2b9e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l366_c7_87a6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l361_c7_2b9e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_65bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_65bd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_65bd_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l369_c7_63aa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l366_c7_87a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_63aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_87a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l369_c7_63aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l366_c7_87a6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_63aa_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_87a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_63aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_87a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_ce35 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_63aa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_87a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_63aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_87a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l369_c7_63aa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l366_c7_87a6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l369_c7_63aa_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l366_c7_87a6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l369_c11_9033_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l369_c11_9033_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l369_c11_9033_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l369_c7_63aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_63aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l369_c7_63aa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_63aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_63aa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l371_c3_6a8c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_63aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_63aa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l369_c7_63aa_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l369_c7_63aa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l370_c3_2164_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l370_c3_2164_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l370_c3_2164_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_42c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_42c2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_42c2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l376_c7_1768_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l373_c7_3a0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1768_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l376_c7_1768_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_3a0a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1768_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1768_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_3a0a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l374_c3_1f4f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1768_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_3a0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1768_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_3a0a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_1768_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_3a0a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_d919_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_d919_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_d919_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l376_c7_1768_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l376_c7_1768_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l381_c7_2b07_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l376_c7_1768_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1768_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1768_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_2b07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1768_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l376_c7_1768_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l376_c7_1768_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_2b07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l376_c7_1768_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1768_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1768_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_2b07_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1768_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1768_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1768_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_2b07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1768_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1768_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l379_c3_85ce : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1768_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_2b07_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1768_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1768_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1768_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_2b07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1768_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_1768_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_1768_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l381_c7_2b07_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_1768_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_048d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_048d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_048d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l384_c7_85ab_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l381_c7_2b07_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_85ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_2b07_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_85ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_2b07_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_85ab_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_2b07_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_85ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_2b07_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l382_c3_1b88 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_85ab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_2b07_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_85ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_2b07_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_85ab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l381_c7_2b07_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7376_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7376_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7376_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l384_c7_85ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_85ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_85ab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_85ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_85ab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_85ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_85ab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_85ab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l385_c3_f8a8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l385_c3_f8a8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l385_c3_f8a8_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l388_c32_ee55_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l388_c32_ee55_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l388_c32_ee55_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l388_c32_73d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l388_c32_73d9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l388_c32_73d9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l388_c32_b18b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l388_c32_b18b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l388_c32_b18b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l388_c32_ee55_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_ab35_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_ab35_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_ab35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l390_c7_9cfd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l390_c7_9cfd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l390_c7_9cfd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9cfd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9cfd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_22a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9cfd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9cfd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9cfd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_22a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9cfd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9cfd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l393_c3_ab8c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9cfd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_22a9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9cfd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_9cfd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_9cfd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_22a9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_9cfd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_2907_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_2907_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_2907_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_22a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_22a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_3b8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_22a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_22a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_22a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_3b8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_22a9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_22a9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l397_c3_9a75 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_22a9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_3b8d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_22a9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_22a9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_22a9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l400_c7_3b8d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_22a9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_f53d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_f53d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_f53d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_3b8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_3b8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1bb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_3b8d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_3b8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_3b8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1bb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_3b8d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_3b8d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l401_c3_c48e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_3b8d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1bb8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_3b8d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l400_c7_3b8d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l400_c7_3b8d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l404_c7_1bb8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l400_c7_3b8d_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l402_c24_2069_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_8213_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_8213_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_8213_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1bb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1bb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_a97f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1bb8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1bb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1bb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_a97f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1bb8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1bb8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l405_c3_ca1d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1bb8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_a97f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1bb8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l404_c7_1bb8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l404_c7_1bb8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l408_c7_a97f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l404_c7_1bb8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l406_c34_b53e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l406_c34_b53e_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l406_c24_bca5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_bbb2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_bbb2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_bbb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_a97f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_a97f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_1791_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_a97f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_a97f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_a97f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_1791_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_a97f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_a97f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l409_c3_6a79 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_a97f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_1791_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_a97f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l408_c7_a97f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l408_c7_a97f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l412_c7_1791_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l408_c7_a97f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l412_c11_39d2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l412_c11_39d2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l412_c11_39d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_1791_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_1791_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7638_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_1791_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_1791_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_1791_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7638_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_1791_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_1791_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l413_c3_228c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_1791_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_1791_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l412_c7_1791_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l412_c7_1791_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l412_c7_1791_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_624b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_624b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_624b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7638_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7638_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7638_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7638_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7638_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7638_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l352_l376_l366_l373_l369_l358_l381_l361_l390_DUPLICATE_3088_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l376_l366_l373_l369_l358_l381_l384_l361_DUPLICATE_6b3e_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l376_l396_l366_l373_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_DUPLICATE_0800_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l352_l376_l366_l373_l412_l369_l358_l381_l384_l361_DUPLICATE_6d21_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l376_l373_l366_l369_l358_l381_l384_l361_DUPLICATE_c4d6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l396_l373_l366_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_l390_DUPLICATE_d619_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l362_l385_l370_l377_DUPLICATE_cde5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l363_l378_DUPLICATE_2257_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l363_l378_DUPLICATE_2257_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l384_l412_DUPLICATE_cc1f_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l394_l410_DUPLICATE_5c45_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l398_l414_DUPLICATE_c0c3_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l398_l414_DUPLICATE_c0c3_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l398_l414_DUPLICATE_6721_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l421_l348_DUPLICATE_64fe_return_output : opcode_result_t;
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l352_c1_5138_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l352_c2_4477_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l388_c32_73d9_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_0f5d_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_bbb2_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_048d_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_8213_right := to_unsigned(12, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_1215 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_b137_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_1215;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l388_c32_ee55_iffalse := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l364_c3_a176 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l364_c3_a176;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l401_c3_c48e := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_3b8d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l401_c3_c48e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l397_c3_9a75 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_22a9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l397_c3_9a75;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_2907_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l393_c3_ab8c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9cfd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l393_c3_ab8c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_ce35 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_ce35;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l355_c3_e5ae := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c2_4477_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l355_c3_e5ae;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c2_4477_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l382_c3_1b88 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l382_c3_1b88;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l413_c3_228c := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_1791_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l413_c3_228c;
     VAR_MUX_uxn_opcodes_h_l388_c32_ee55_iftrue := signed(std_logic_vector(resize(to_unsigned(6, 3), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_d919_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_624b_right := to_unsigned(15, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l371_c3_6a8c := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l371_c3_6a8c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l379_c3_85ce := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1768_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l379_c3_85ce;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7638_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l388_c32_b18b_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l412_c11_39d2_right := to_unsigned(14, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9cfd_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_f53d_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l409_c3_6a79 := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_a97f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l409_c3_6a79;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_8836_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_ab35_right := to_unsigned(9, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l390_c7_9cfd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_65bd_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7376_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l374_c3_1f4f := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l374_c3_1f4f;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7638_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l405_c3_ca1d := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1bb8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l405_c3_ca1d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c6_6311_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l369_c11_9033_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_42c2_right := to_unsigned(5, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l352_c1_5138_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l388_c32_73d9_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l385_c3_f8a8_left := n16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l398_l414_DUPLICATE_c0c3_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l352_c2_4477_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l358_c7_b137_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c6_6311_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_0f5d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_8836_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_65bd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l369_c11_9033_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_42c2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_d919_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_048d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7376_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_ab35_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_2907_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_f53d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_8213_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_bbb2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l412_c11_39d2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_624b_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l370_c3_2164_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l406_c34_b53e_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l352_c2_4477_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l358_c7_b137_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse := t16;
     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l376_l366_l373_l369_l358_l381_l384_l361_DUPLICATE_6b3e LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l376_l366_l373_l369_l358_l381_l384_l361_DUPLICATE_6b3e_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l384_l412_DUPLICATE_cc1f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l384_l412_DUPLICATE_cc1f_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l396_c11_2907] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l396_c11_2907_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_2907_left;
     BIN_OP_EQ_uxn_opcodes_h_l396_c11_2907_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_2907_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_2907_return_output := BIN_OP_EQ_uxn_opcodes_h_l396_c11_2907_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l406_c34_b53e] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l406_c34_b53e_x <= VAR_CONST_SR_8_uxn_opcodes_h_l406_c34_b53e_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l406_c34_b53e_return_output := CONST_SR_8_uxn_opcodes_h_l406_c34_b53e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l369_c11_9033] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l369_c11_9033_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l369_c11_9033_left;
     BIN_OP_EQ_uxn_opcodes_h_l369_c11_9033_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l369_c11_9033_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l369_c11_9033_return_output := BIN_OP_EQ_uxn_opcodes_h_l369_c11_9033_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l352_l376_l366_l373_l412_l369_l358_l381_l384_l361_DUPLICATE_6d21 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l352_l376_l366_l373_l412_l369_l358_l381_l384_l361_DUPLICATE_6d21_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l376_l396_l366_l373_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_DUPLICATE_0800 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l376_l396_l366_l373_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_DUPLICATE_0800_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l361_c11_8836] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l361_c11_8836_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_8836_left;
     BIN_OP_EQ_uxn_opcodes_h_l361_c11_8836_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_8836_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_8836_return_output := BIN_OP_EQ_uxn_opcodes_h_l361_c11_8836_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l366_c11_65bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l366_c11_65bd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_65bd_left;
     BIN_OP_EQ_uxn_opcodes_h_l366_c11_65bd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_65bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_65bd_return_output := BIN_OP_EQ_uxn_opcodes_h_l366_c11_65bd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l358_c11_0f5d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l358_c11_0f5d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_0f5d_left;
     BIN_OP_EQ_uxn_opcodes_h_l358_c11_0f5d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_0f5d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_0f5d_return_output := BIN_OP_EQ_uxn_opcodes_h_l358_c11_0f5d_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l388_c32_73d9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l388_c32_73d9_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l388_c32_73d9_left;
     BIN_OP_AND_uxn_opcodes_h_l388_c32_73d9_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l388_c32_73d9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l388_c32_73d9_return_output := BIN_OP_AND_uxn_opcodes_h_l388_c32_73d9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l390_c11_ab35] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l390_c11_ab35_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_ab35_left;
     BIN_OP_EQ_uxn_opcodes_h_l390_c11_ab35_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_ab35_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_ab35_return_output := BIN_OP_EQ_uxn_opcodes_h_l390_c11_ab35_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l396_l373_l366_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_l390_DUPLICATE_d619 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l396_l373_l366_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_l390_DUPLICATE_d619_return_output := result.is_opc_done;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l394_l410_DUPLICATE_5c45 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l394_l410_DUPLICATE_5c45_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l362_l385_l370_l377_DUPLICATE_cde5 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l362_l385_l370_l377_DUPLICATE_cde5_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l376_c11_d919] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_d919_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_d919_left;
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_d919_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_d919_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_d919_return_output := BIN_OP_EQ_uxn_opcodes_h_l376_c11_d919_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l384_c11_7376] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_7376_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7376_left;
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_7376_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7376_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7376_return_output := BIN_OP_EQ_uxn_opcodes_h_l384_c11_7376_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l412_c11_39d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l412_c11_39d2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l412_c11_39d2_left;
     BIN_OP_EQ_uxn_opcodes_h_l412_c11_39d2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l412_c11_39d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l412_c11_39d2_return_output := BIN_OP_EQ_uxn_opcodes_h_l412_c11_39d2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l352_l376_l366_l373_l369_l358_l381_l361_l390_DUPLICATE_3088 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l352_l376_l366_l373_l369_l358_l381_l361_l390_DUPLICATE_3088_return_output := result.is_sp_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l402_c24_2069] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l402_c24_2069_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l352_c6_6311] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l352_c6_6311_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c6_6311_left;
     BIN_OP_EQ_uxn_opcodes_h_l352_c6_6311_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c6_6311_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c6_6311_return_output := BIN_OP_EQ_uxn_opcodes_h_l352_c6_6311_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l416_c11_624b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l416_c11_624b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_624b_left;
     BIN_OP_EQ_uxn_opcodes_h_l416_c11_624b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_624b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_624b_return_output := BIN_OP_EQ_uxn_opcodes_h_l416_c11_624b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l408_c11_bbb2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l408_c11_bbb2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_bbb2_left;
     BIN_OP_EQ_uxn_opcodes_h_l408_c11_bbb2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_bbb2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_bbb2_return_output := BIN_OP_EQ_uxn_opcodes_h_l408_c11_bbb2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l373_c11_42c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l373_c11_42c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_42c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l373_c11_42c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_42c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_42c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l373_c11_42c2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l381_c11_048d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l381_c11_048d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_048d_left;
     BIN_OP_EQ_uxn_opcodes_h_l381_c11_048d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_048d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_048d_return_output := BIN_OP_EQ_uxn_opcodes_h_l381_c11_048d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l400_c11_f53d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l400_c11_f53d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_f53d_left;
     BIN_OP_EQ_uxn_opcodes_h_l400_c11_f53d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_f53d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_f53d_return_output := BIN_OP_EQ_uxn_opcodes_h_l400_c11_f53d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l376_l373_l366_l369_l358_l381_l384_l361_DUPLICATE_c4d6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l376_l373_l366_l369_l358_l381_l384_l361_DUPLICATE_c4d6_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l404_c11_8213] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l404_c11_8213_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_8213_left;
     BIN_OP_EQ_uxn_opcodes_h_l404_c11_8213_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_8213_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_8213_return_output := BIN_OP_EQ_uxn_opcodes_h_l404_c11_8213_return_output;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l398_l414_DUPLICATE_c0c3 LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l398_l414_DUPLICATE_c0c3_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l398_l414_DUPLICATE_c0c3_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l398_l414_DUPLICATE_c0c3_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l398_l414_DUPLICATE_c0c3_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l388_c32_b18b_left := VAR_BIN_OP_AND_uxn_opcodes_h_l388_c32_73d9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l352_c1_5138_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c6_6311_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l352_c2_4477_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c6_6311_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c2_4477_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c6_6311_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c2_4477_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c6_6311_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l352_c2_4477_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c6_6311_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c2_4477_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c6_6311_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c2_4477_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c6_6311_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c2_4477_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c6_6311_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c2_4477_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c6_6311_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l352_c2_4477_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c6_6311_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l358_c7_b137_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_0f5d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_b137_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_0f5d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_b137_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_0f5d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l358_c7_b137_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_0f5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_b137_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_0f5d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_b137_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_0f5d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_b137_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_0f5d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_b137_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_0f5d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l358_c7_b137_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_0f5d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l361_c7_2b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_8836_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_2b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_8836_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_8836_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l361_c7_2b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_8836_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_2b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_8836_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_8836_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_2b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_8836_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_2b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_8836_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l361_c7_2b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_8836_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l366_c7_87a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_65bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_87a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_65bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_87a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_65bd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l366_c7_87a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_65bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_87a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_65bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_87a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_65bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_87a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_65bd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l366_c7_87a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_65bd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l366_c7_87a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_65bd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l369_c7_63aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l369_c11_9033_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_63aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l369_c11_9033_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_63aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l369_c11_9033_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l369_c7_63aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l369_c11_9033_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_63aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l369_c11_9033_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_63aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l369_c11_9033_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_63aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l369_c11_9033_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l369_c7_63aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l369_c11_9033_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l369_c7_63aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l369_c11_9033_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l373_c7_3a0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_42c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_3a0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_42c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_42c2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_3a0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_42c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_3a0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_42c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_42c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_3a0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_42c2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_3a0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_42c2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l376_c7_1768_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_d919_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1768_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_d919_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1768_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_d919_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l376_c7_1768_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_d919_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1768_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_d919_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1768_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_d919_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1768_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_d919_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_1768_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_d919_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l381_c7_2b07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_048d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_2b07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_048d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_2b07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_048d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_2b07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_048d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_2b07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_048d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_2b07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_048d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_2b07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_048d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l381_c7_2b07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_048d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l384_c7_85ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7376_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_85ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7376_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_85ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7376_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_85ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7376_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_85ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7376_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_85ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7376_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_85ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7376_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_85ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7376_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9cfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_ab35_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l390_c7_9cfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_ab35_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9cfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_ab35_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9cfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_ab35_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_9cfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_ab35_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_22a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_2907_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_22a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_2907_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_22a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_2907_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_22a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_2907_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_3b8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_f53d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_3b8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_f53d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_3b8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_f53d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l400_c7_3b8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l400_c11_f53d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1bb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_8213_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1bb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_8213_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1bb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_8213_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l404_c7_1bb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l404_c11_8213_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_a97f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_bbb2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_a97f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_bbb2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_a97f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_bbb2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l408_c7_a97f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_bbb2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_1791_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l412_c11_39d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_1791_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l412_c11_39d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_1791_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l412_c11_39d2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l412_c7_1791_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l412_c11_39d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7638_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_624b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7638_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_624b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l370_c3_2164_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l362_l385_l370_l377_DUPLICATE_cde5_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l385_c3_f8a8_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l362_l385_l370_l377_DUPLICATE_cde5_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l363_l378_DUPLICATE_2257_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l362_l385_l370_l377_DUPLICATE_cde5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l400_c7_3b8d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l402_c24_2069_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_9cfd_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l394_l410_DUPLICATE_5c45_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l408_c7_a97f_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l394_l410_DUPLICATE_5c45_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c2_4477_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l376_l366_l373_l369_l358_l381_l384_l361_DUPLICATE_6b3e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_b137_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l376_l366_l373_l369_l358_l381_l384_l361_DUPLICATE_6b3e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l376_l366_l373_l369_l358_l381_l384_l361_DUPLICATE_6b3e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l376_l366_l373_l369_l358_l381_l384_l361_DUPLICATE_6b3e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l376_l366_l373_l369_l358_l381_l384_l361_DUPLICATE_6b3e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l376_l366_l373_l369_l358_l381_l384_l361_DUPLICATE_6b3e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1768_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l376_l366_l373_l369_l358_l381_l384_l361_DUPLICATE_6b3e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l376_l366_l373_l369_l358_l381_l384_l361_DUPLICATE_6b3e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l376_l366_l373_l369_l358_l381_l384_l361_DUPLICATE_6b3e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_b137_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l396_l373_l366_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_l390_DUPLICATE_d619_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l396_l373_l366_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_l390_DUPLICATE_d619_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l396_l373_l366_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_l390_DUPLICATE_d619_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l396_l373_l366_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_l390_DUPLICATE_d619_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l396_l373_l366_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_l390_DUPLICATE_d619_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1768_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l396_l373_l366_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_l390_DUPLICATE_d619_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l396_l373_l366_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_l390_DUPLICATE_d619_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l396_l373_l366_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_l390_DUPLICATE_d619_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9cfd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l396_l373_l366_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_l390_DUPLICATE_d619_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_22a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l396_l373_l366_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_l390_DUPLICATE_d619_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_3b8d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l396_l373_l366_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_l390_DUPLICATE_d619_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1bb8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l396_l373_l366_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_l390_DUPLICATE_d619_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_a97f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l396_l373_l366_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_l390_DUPLICATE_d619_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_1791_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l396_l373_l366_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_l390_DUPLICATE_d619_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7638_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l396_l373_l366_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_l390_DUPLICATE_d619_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c2_4477_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l352_l376_l366_l373_l369_l358_l381_l361_l390_DUPLICATE_3088_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_b137_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l352_l376_l366_l373_l369_l358_l381_l361_l390_DUPLICATE_3088_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l352_l376_l366_l373_l369_l358_l381_l361_l390_DUPLICATE_3088_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l352_l376_l366_l373_l369_l358_l381_l361_l390_DUPLICATE_3088_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l352_l376_l366_l373_l369_l358_l381_l361_l390_DUPLICATE_3088_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l352_l376_l366_l373_l369_l358_l381_l361_l390_DUPLICATE_3088_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1768_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l352_l376_l366_l373_l369_l358_l381_l361_l390_DUPLICATE_3088_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l352_l376_l366_l373_l369_l358_l381_l361_l390_DUPLICATE_3088_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l390_c7_9cfd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l352_l376_l366_l373_l369_l358_l381_l361_l390_DUPLICATE_3088_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l358_c7_b137_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l376_l373_l366_l369_l358_l381_l384_l361_DUPLICATE_c4d6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l376_l373_l366_l369_l358_l381_l384_l361_DUPLICATE_c4d6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l376_l373_l366_l369_l358_l381_l384_l361_DUPLICATE_c4d6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l376_l373_l366_l369_l358_l381_l384_l361_DUPLICATE_c4d6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l376_l373_l366_l369_l358_l381_l384_l361_DUPLICATE_c4d6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l376_c7_1768_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l376_l373_l366_l369_l358_l381_l384_l361_DUPLICATE_c4d6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l376_l373_l366_l369_l358_l381_l384_l361_DUPLICATE_c4d6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l376_l373_l366_l369_l358_l381_l384_l361_DUPLICATE_c4d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c2_4477_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l376_l396_l366_l373_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_DUPLICATE_0800_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_b137_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l376_l396_l366_l373_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_DUPLICATE_0800_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l376_l396_l366_l373_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_DUPLICATE_0800_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l376_l396_l366_l373_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_DUPLICATE_0800_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l376_l396_l366_l373_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_DUPLICATE_0800_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l376_l396_l366_l373_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_DUPLICATE_0800_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1768_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l376_l396_l366_l373_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_DUPLICATE_0800_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l376_l396_l366_l373_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_DUPLICATE_0800_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l376_l396_l366_l373_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_DUPLICATE_0800_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_22a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l376_l396_l366_l373_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_DUPLICATE_0800_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_3b8d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l376_l396_l366_l373_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_DUPLICATE_0800_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1bb8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l376_l396_l366_l373_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_DUPLICATE_0800_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_a97f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l376_l396_l366_l373_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_DUPLICATE_0800_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_1791_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l376_l396_l366_l373_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_DUPLICATE_0800_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7638_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l376_l396_l366_l373_l412_l400_l369_l416_l358_l404_l381_l384_l408_l361_DUPLICATE_0800_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l384_l412_DUPLICATE_cc1f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_1791_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l384_l412_DUPLICATE_cc1f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c2_4477_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l352_l376_l366_l373_l412_l369_l358_l381_l384_l361_DUPLICATE_6d21_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_b137_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l352_l376_l366_l373_l412_l369_l358_l381_l384_l361_DUPLICATE_6d21_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l352_l376_l366_l373_l412_l369_l358_l381_l384_l361_DUPLICATE_6d21_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l352_l376_l366_l373_l412_l369_l358_l381_l384_l361_DUPLICATE_6d21_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l352_l376_l366_l373_l412_l369_l358_l381_l384_l361_DUPLICATE_6d21_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l352_l376_l366_l373_l412_l369_l358_l381_l384_l361_DUPLICATE_6d21_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_1768_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l352_l376_l366_l373_l412_l369_l358_l381_l384_l361_DUPLICATE_6d21_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l352_l376_l366_l373_l412_l369_l358_l381_l384_l361_DUPLICATE_6d21_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l352_l376_l366_l373_l412_l369_l358_l381_l384_l361_DUPLICATE_6d21_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l412_c7_1791_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l352_l376_l366_l373_l412_l369_l358_l381_l384_l361_DUPLICATE_6d21_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l390_c7_9cfd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l390_c7_9cfd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l390_c7_9cfd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l390_c7_9cfd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l390_c7_9cfd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l390_c7_9cfd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l390_c7_9cfd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l363_l378_DUPLICATE_2257 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l363_l378_DUPLICATE_2257_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l363_l378_DUPLICATE_2257_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l363_l378_DUPLICATE_2257_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l363_l378_DUPLICATE_2257_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l370_c3_2164] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l370_c3_2164_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l370_c3_2164_left;
     BIN_OP_OR_uxn_opcodes_h_l370_c3_2164_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l370_c3_2164_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l370_c3_2164_return_output := BIN_OP_OR_uxn_opcodes_h_l370_c3_2164_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l398_l414_DUPLICATE_6721 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l398_l414_DUPLICATE_6721_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l398_l414_DUPLICATE_c0c3_return_output);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l406_c24_bca5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l406_c24_bca5_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l406_c34_b53e_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l412_c7_1791] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_1791_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_1791_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_1791_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_1791_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_1791_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_1791_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_1791_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_1791_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l416_c7_7638] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7638_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7638_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7638_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7638_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7638_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7638_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7638_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7638_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l416_c7_7638] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7638_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7638_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7638_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7638_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7638_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7638_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7638_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7638_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l384_c7_85ab] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_85ab_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_85ab_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_85ab_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_85ab_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l352_c1_5138] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l352_c1_5138_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l352_c1_5138_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l352_c1_5138_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l352_c1_5138_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l352_c1_5138_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l352_c1_5138_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l352_c1_5138_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l352_c1_5138_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l385_c3_f8a8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l385_c3_f8a8_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l385_c3_f8a8_left;
     BIN_OP_OR_uxn_opcodes_h_l385_c3_f8a8_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l385_c3_f8a8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l385_c3_f8a8_return_output := BIN_OP_OR_uxn_opcodes_h_l385_c3_f8a8_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l388_c32_b18b] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l388_c32_b18b_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l388_c32_b18b_left;
     BIN_OP_GT_uxn_opcodes_h_l388_c32_b18b_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l388_c32_b18b_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l388_c32_b18b_return_output := BIN_OP_GT_uxn_opcodes_h_l388_c32_b18b_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l388_c32_ee55_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l388_c32_b18b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l370_c3_2164_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l385_c3_f8a8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l404_c7_1bb8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l406_c24_bca5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_22a9_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l398_l414_DUPLICATE_6721_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l412_c7_1791_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l398_l414_DUPLICATE_6721_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l376_c7_1768_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l363_l378_DUPLICATE_2257_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l363_l378_DUPLICATE_2257_return_output;
     VAR_printf_uxn_opcodes_h_l353_c3_b219_uxn_opcodes_h_l353_c3_b219_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l352_c1_5138_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_1791_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_7638_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l384_c7_85ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_1791_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_7638_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_a97f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_1791_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l412_c7_1791] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_1791_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_1791_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_1791_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_1791_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_1791_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_1791_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_1791_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_1791_return_output;

     -- printf_uxn_opcodes_h_l353_c3_b219[uxn_opcodes_h_l353_c3_b219] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l353_c3_b219_uxn_opcodes_h_l353_c3_b219_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l353_c3_b219_uxn_opcodes_h_l353_c3_b219_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n16_MUX[uxn_opcodes_h_l384_c7_85ab] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l384_c7_85ab_cond <= VAR_n16_MUX_uxn_opcodes_h_l384_c7_85ab_cond;
     n16_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue;
     n16_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l384_c7_85ab_return_output := n16_MUX_uxn_opcodes_h_l384_c7_85ab_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l412_c7_1791] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l412_c7_1791_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l412_c7_1791_cond;
     result_stack_value_MUX_uxn_opcodes_h_l412_c7_1791_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l412_c7_1791_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l412_c7_1791_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l412_c7_1791_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l412_c7_1791_return_output := result_stack_value_MUX_uxn_opcodes_h_l412_c7_1791_return_output;

     -- MUX[uxn_opcodes_h_l388_c32_ee55] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l388_c32_ee55_cond <= VAR_MUX_uxn_opcodes_h_l388_c32_ee55_cond;
     MUX_uxn_opcodes_h_l388_c32_ee55_iftrue <= VAR_MUX_uxn_opcodes_h_l388_c32_ee55_iftrue;
     MUX_uxn_opcodes_h_l388_c32_ee55_iffalse <= VAR_MUX_uxn_opcodes_h_l388_c32_ee55_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l388_c32_ee55_return_output := MUX_uxn_opcodes_h_l388_c32_ee55_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l384_c7_85ab] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_85ab_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_85ab_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_85ab_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_85ab_return_output;

     -- t16_MUX[uxn_opcodes_h_l369_c7_63aa] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l369_c7_63aa_cond <= VAR_t16_MUX_uxn_opcodes_h_l369_c7_63aa_cond;
     t16_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue;
     t16_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l369_c7_63aa_return_output := t16_MUX_uxn_opcodes_h_l369_c7_63aa_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l381_c7_2b07] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_2b07_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_2b07_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_2b07_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_2b07_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l408_c7_a97f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_a97f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_a97f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_a97f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_a97f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_a97f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_a97f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_a97f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_a97f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l412_c7_1791] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_1791_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_1791_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_1791_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_1791_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_1791_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_1791_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_1791_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_1791_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue := VAR_MUX_uxn_opcodes_h_l388_c32_ee55_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse := VAR_n16_MUX_uxn_opcodes_h_l384_c7_85ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_a97f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_1791_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_85ab_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l376_c7_1768_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_2b07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_a97f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_1791_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1bb8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_a97f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l408_c7_a97f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l412_c7_1791_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l369_c7_63aa_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l376_c7_1768] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l376_c7_1768_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l376_c7_1768_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l376_c7_1768_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l376_c7_1768_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l376_c7_1768_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l376_c7_1768_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l376_c7_1768_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l376_c7_1768_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l408_c7_a97f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_a97f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_a97f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_a97f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_a97f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_a97f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_a97f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_a97f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_a97f_return_output;

     -- n16_MUX[uxn_opcodes_h_l381_c7_2b07] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l381_c7_2b07_cond <= VAR_n16_MUX_uxn_opcodes_h_l381_c7_2b07_cond;
     n16_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue;
     n16_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l381_c7_2b07_return_output := n16_MUX_uxn_opcodes_h_l381_c7_2b07_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l404_c7_1bb8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1bb8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1bb8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1bb8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1bb8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1bb8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1bb8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1bb8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1bb8_return_output;

     -- t16_MUX[uxn_opcodes_h_l366_c7_87a6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l366_c7_87a6_cond <= VAR_t16_MUX_uxn_opcodes_h_l366_c7_87a6_cond;
     t16_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue;
     t16_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l366_c7_87a6_return_output := t16_MUX_uxn_opcodes_h_l366_c7_87a6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l384_c7_85ab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_85ab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_85ab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_85ab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_85ab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l408_c7_a97f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_a97f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_a97f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_a97f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_a97f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_a97f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_a97f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_a97f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_a97f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l381_c7_2b07] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_2b07_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_2b07_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_2b07_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_2b07_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l408_c7_a97f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l408_c7_a97f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l408_c7_a97f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l408_c7_a97f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l408_c7_a97f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l408_c7_a97f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l408_c7_a97f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l408_c7_a97f_return_output := result_stack_value_MUX_uxn_opcodes_h_l408_c7_a97f_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l376_c7_1768_iffalse := VAR_n16_MUX_uxn_opcodes_h_l381_c7_2b07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1bb8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_a97f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1768_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_2b07_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l376_c7_1768_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1bb8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_a97f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l384_c7_85ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_3b8d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l404_c7_1bb8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l404_c7_1bb8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l408_c7_a97f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l366_c7_87a6_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l400_c7_3b8d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_3b8d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_3b8d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_3b8d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_3b8d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_3b8d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_3b8d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_3b8d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_3b8d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l373_c7_3a0a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_3a0a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_3a0a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l404_c7_1bb8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l404_c7_1bb8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l404_c7_1bb8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l404_c7_1bb8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l404_c7_1bb8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l404_c7_1bb8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l404_c7_1bb8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l404_c7_1bb8_return_output := result_stack_value_MUX_uxn_opcodes_h_l404_c7_1bb8_return_output;

     -- n16_MUX[uxn_opcodes_h_l376_c7_1768] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l376_c7_1768_cond <= VAR_n16_MUX_uxn_opcodes_h_l376_c7_1768_cond;
     n16_MUX_uxn_opcodes_h_l376_c7_1768_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l376_c7_1768_iftrue;
     n16_MUX_uxn_opcodes_h_l376_c7_1768_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l376_c7_1768_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l376_c7_1768_return_output := n16_MUX_uxn_opcodes_h_l376_c7_1768_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l404_c7_1bb8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1bb8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1bb8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1bb8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1bb8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1bb8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1bb8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1bb8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1bb8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l376_c7_1768] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1768_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1768_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1768_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1768_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1768_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1768_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1768_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1768_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l381_c7_2b07] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_2b07_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_2b07_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_2b07_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_2b07_return_output;

     -- t16_MUX[uxn_opcodes_h_l361_c7_2b9e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l361_c7_2b9e_cond <= VAR_t16_MUX_uxn_opcodes_h_l361_c7_2b9e_cond;
     t16_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue;
     t16_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output := t16_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l404_c7_1bb8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1bb8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1bb8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1bb8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1bb8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1bb8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1bb8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1bb8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1bb8_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l376_c7_1768_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_3b8d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l404_c7_1bb8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_1768_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_3b8d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l404_c7_1bb8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1768_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_2b07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_22a9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l400_c7_3b8d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l400_c7_3b8d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l404_c7_1bb8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l358_c7_b137_iffalse := VAR_t16_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l400_c7_3b8d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_3b8d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_3b8d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_3b8d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_3b8d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_3b8d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_3b8d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_3b8d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_3b8d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l369_c7_63aa] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l369_c7_63aa_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l369_c7_63aa_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l369_c7_63aa_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l369_c7_63aa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l376_c7_1768] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1768_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1768_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1768_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1768_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1768_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1768_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1768_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1768_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l396_c7_22a9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_22a9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_22a9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_22a9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_22a9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_22a9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_22a9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_22a9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_22a9_return_output;

     -- n16_MUX[uxn_opcodes_h_l373_c7_3a0a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l373_c7_3a0a_cond <= VAR_n16_MUX_uxn_opcodes_h_l373_c7_3a0a_cond;
     n16_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue;
     n16_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output := n16_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l373_c7_3a0a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l400_c7_3b8d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l400_c7_3b8d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l400_c7_3b8d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l400_c7_3b8d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l400_c7_3b8d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l400_c7_3b8d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l400_c7_3b8d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l400_c7_3b8d_return_output := result_stack_value_MUX_uxn_opcodes_h_l400_c7_3b8d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l400_c7_3b8d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_3b8d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_3b8d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_3b8d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_3b8d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_3b8d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_3b8d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_3b8d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_3b8d_return_output;

     -- t16_MUX[uxn_opcodes_h_l358_c7_b137] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l358_c7_b137_cond <= VAR_t16_MUX_uxn_opcodes_h_l358_c7_b137_cond;
     t16_MUX_uxn_opcodes_h_l358_c7_b137_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l358_c7_b137_iftrue;
     t16_MUX_uxn_opcodes_h_l358_c7_b137_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l358_c7_b137_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l358_c7_b137_return_output := t16_MUX_uxn_opcodes_h_l358_c7_b137_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse := VAR_n16_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_22a9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l400_c7_3b8d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l369_c7_63aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_22a9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l400_c7_3b8d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_1768_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9cfd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_22a9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_22a9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l400_c7_3b8d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l352_c2_4477_iffalse := VAR_t16_MUX_uxn_opcodes_h_l358_c7_b137_return_output;
     -- t16_MUX[uxn_opcodes_h_l352_c2_4477] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l352_c2_4477_cond <= VAR_t16_MUX_uxn_opcodes_h_l352_c2_4477_cond;
     t16_MUX_uxn_opcodes_h_l352_c2_4477_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l352_c2_4477_iftrue;
     t16_MUX_uxn_opcodes_h_l352_c2_4477_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l352_c2_4477_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l352_c2_4477_return_output := t16_MUX_uxn_opcodes_h_l352_c2_4477_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l396_c7_22a9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_22a9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_22a9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_22a9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_22a9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_22a9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_22a9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_22a9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_22a9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l369_c7_63aa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_63aa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_63aa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_63aa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_63aa_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l396_c7_22a9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l396_c7_22a9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_22a9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l396_c7_22a9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_22a9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l396_c7_22a9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_22a9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_22a9_return_output := result_stack_value_MUX_uxn_opcodes_h_l396_c7_22a9_return_output;

     -- n16_MUX[uxn_opcodes_h_l369_c7_63aa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l369_c7_63aa_cond <= VAR_n16_MUX_uxn_opcodes_h_l369_c7_63aa_cond;
     n16_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue;
     n16_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l369_c7_63aa_return_output := n16_MUX_uxn_opcodes_h_l369_c7_63aa_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l366_c7_87a6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l366_c7_87a6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l366_c7_87a6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l366_c7_87a6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l366_c7_87a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l390_c7_9cfd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9cfd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9cfd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9cfd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9cfd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9cfd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9cfd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l396_c7_22a9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_22a9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_22a9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_22a9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_22a9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_22a9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_22a9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_22a9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_22a9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l373_c7_3a0a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l369_c7_63aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9cfd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_22a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l369_c7_63aa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l366_c7_87a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9cfd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_22a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_9cfd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_22a9_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l352_c2_4477_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l390_c7_9cfd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9cfd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9cfd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9cfd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9cfd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9cfd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9cfd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l390_c7_9cfd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9cfd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9cfd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9cfd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9cfd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9cfd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9cfd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l390_c7_9cfd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l390_c7_9cfd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_9cfd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l390_c7_9cfd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_9cfd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l390_c7_9cfd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_9cfd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output := result_stack_value_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output;

     -- n16_MUX[uxn_opcodes_h_l366_c7_87a6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l366_c7_87a6_cond <= VAR_n16_MUX_uxn_opcodes_h_l366_c7_87a6_cond;
     n16_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue;
     n16_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l366_c7_87a6_return_output := n16_MUX_uxn_opcodes_h_l366_c7_87a6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l361_c7_2b9e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l361_c7_2b9e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l361_c7_2b9e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_85ab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_85ab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_85ab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_85ab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_85ab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l369_c7_63aa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_63aa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_63aa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_63aa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_63aa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l366_c7_87a6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_87a6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_87a6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_87a6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_87a6_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l366_c7_87a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l366_c7_87a6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l358_c7_b137_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l369_c7_63aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_85ab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_9cfd_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l384_c7_85ab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_85ab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_85ab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_85ab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_85ab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l366_c7_87a6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_87a6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_87a6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_87a6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_87a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l381_c7_2b07] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_2b07_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_2b07_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_2b07_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_2b07_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l361_c7_2b9e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output;

     -- n16_MUX[uxn_opcodes_h_l361_c7_2b9e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l361_c7_2b9e_cond <= VAR_n16_MUX_uxn_opcodes_h_l361_c7_2b9e_cond;
     n16_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue;
     n16_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output := n16_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l384_c7_85ab] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l384_c7_85ab_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_85ab_cond;
     result_stack_value_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_85ab_return_output := result_stack_value_MUX_uxn_opcodes_h_l384_c7_85ab_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l358_c7_b137] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l358_c7_b137_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l358_c7_b137_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l358_c7_b137_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l358_c7_b137_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l358_c7_b137_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l358_c7_b137_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l358_c7_b137_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l358_c7_b137_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_85ab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_85ab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_85ab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_85ab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_85ab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_85ab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_85ab_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l358_c7_b137_iffalse := VAR_n16_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_85ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_b137_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l352_c2_4477_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l358_c7_b137_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_85ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l366_c7_87a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1768_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_2b07_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_85ab_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l381_c7_2b07] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_2b07_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_2b07_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_2b07_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_2b07_return_output;

     -- n16_MUX[uxn_opcodes_h_l358_c7_b137] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l358_c7_b137_cond <= VAR_n16_MUX_uxn_opcodes_h_l358_c7_b137_cond;
     n16_MUX_uxn_opcodes_h_l358_c7_b137_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l358_c7_b137_iftrue;
     n16_MUX_uxn_opcodes_h_l358_c7_b137_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l358_c7_b137_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l358_c7_b137_return_output := n16_MUX_uxn_opcodes_h_l358_c7_b137_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l358_c7_b137] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_b137_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_b137_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_b137_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_b137_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_b137_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_b137_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_b137_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_b137_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l381_c7_2b07] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l381_c7_2b07_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l381_c7_2b07_cond;
     result_stack_value_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l381_c7_2b07_return_output := result_stack_value_MUX_uxn_opcodes_h_l381_c7_2b07_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_1768] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1768_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1768_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1768_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1768_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1768_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1768_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1768_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1768_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l361_c7_2b9e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l352_c2_4477] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l352_c2_4477_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l352_c2_4477_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l352_c2_4477_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l352_c2_4477_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l352_c2_4477_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l352_c2_4477_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l352_c2_4477_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l352_c2_4477_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l381_c7_2b07] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_2b07_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_2b07_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_2b07_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_2b07_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_2b07_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_2b07_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l352_c2_4477_iffalse := VAR_n16_MUX_uxn_opcodes_h_l358_c7_b137_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1768_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_2b07_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c2_4477_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l358_c7_b137_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1768_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_2b07_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_b137_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_1768_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_1768_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l381_c7_2b07_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l352_c2_4477] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l352_c2_4477_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c2_4477_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l352_c2_4477_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c2_4477_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l352_c2_4477_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c2_4477_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c2_4477_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l352_c2_4477_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l376_c7_1768] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l376_c7_1768_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_1768_cond;
     result_stack_value_MUX_uxn_opcodes_h_l376_c7_1768_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_1768_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l376_c7_1768_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_1768_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_1768_return_output := result_stack_value_MUX_uxn_opcodes_h_l376_c7_1768_return_output;

     -- n16_MUX[uxn_opcodes_h_l352_c2_4477] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l352_c2_4477_cond <= VAR_n16_MUX_uxn_opcodes_h_l352_c2_4477_cond;
     n16_MUX_uxn_opcodes_h_l352_c2_4477_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l352_c2_4477_iftrue;
     n16_MUX_uxn_opcodes_h_l352_c2_4477_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l352_c2_4477_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l352_c2_4477_return_output := n16_MUX_uxn_opcodes_h_l352_c2_4477_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l376_c7_1768] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1768_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1768_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1768_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1768_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1768_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1768_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1768_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1768_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l358_c7_b137] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_b137_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_b137_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_b137_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_b137_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_b137_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_b137_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_b137_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_b137_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_1768] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1768_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1768_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1768_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1768_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1768_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1768_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1768_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1768_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l373_c7_3a0a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_3a0a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_3a0a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l352_c2_4477_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_1768_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_1768_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c2_4477_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l358_c7_b137_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_1768_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l352_c2_4477] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c2_4477_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c2_4477_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c2_4477_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c2_4477_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c2_4477_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c2_4477_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c2_4477_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c2_4477_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l373_c7_3a0a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_3a0a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_3a0a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l373_c7_3a0a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_3a0a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_3a0a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l369_c7_63aa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_63aa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_63aa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_63aa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_63aa_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l373_c7_3a0a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l373_c7_3a0a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_3a0a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_3a0a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_3a0a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output := result_stack_value_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l369_c7_63aa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_3a0a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l369_c7_63aa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_63aa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_63aa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_63aa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_63aa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l369_c7_63aa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_63aa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_63aa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_63aa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_63aa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l366_c7_87a6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_87a6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_87a6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_87a6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_87a6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l369_c7_63aa] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l369_c7_63aa_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l369_c7_63aa_cond;
     result_stack_value_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l369_c7_63aa_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l369_c7_63aa_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l369_c7_63aa_return_output := result_stack_value_MUX_uxn_opcodes_h_l369_c7_63aa_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l369_c7_63aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l369_c7_63aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l366_c7_87a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l369_c7_63aa_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l366_c7_87a6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_87a6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_87a6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_87a6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_87a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l366_c7_87a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_87a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_87a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_87a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_87a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l361_c7_2b9e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_2b9e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_2b9e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l366_c7_87a6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l366_c7_87a6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l366_c7_87a6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l366_c7_87a6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l366_c7_87a6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l366_c7_87a6_return_output := result_stack_value_MUX_uxn_opcodes_h_l366_c7_87a6_return_output;

     -- Submodule level 14
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_87a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_87a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_b137_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l366_c7_87a6_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l358_c7_b137] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_b137_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_b137_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_b137_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_b137_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_b137_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_b137_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_b137_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_b137_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l361_c7_2b9e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_2b9e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_2b9e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l361_c7_2b9e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_2b9e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_2b9e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l361_c7_2b9e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l361_c7_2b9e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_2b9e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_2b9e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_2b9e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output := result_stack_value_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output;

     -- Submodule level 15
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_b137_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_b137_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c2_4477_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_b137_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_b137_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_2b9e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c2_4477] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c2_4477_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c2_4477_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c2_4477_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c2_4477_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c2_4477_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c2_4477_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c2_4477_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c2_4477_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l358_c7_b137] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l358_c7_b137_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_b137_cond;
     result_stack_value_MUX_uxn_opcodes_h_l358_c7_b137_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_b137_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l358_c7_b137_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_b137_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_b137_return_output := result_stack_value_MUX_uxn_opcodes_h_l358_c7_b137_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l358_c7_b137] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_b137_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_b137_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_b137_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_b137_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_b137_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_b137_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_b137_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_b137_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l358_c7_b137] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_b137_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_b137_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_b137_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_b137_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_b137_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_b137_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_b137_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_b137_return_output;

     -- Submodule level 16
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c2_4477_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_b137_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c2_4477_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_b137_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c2_4477_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_b137_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l352_c2_4477] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l352_c2_4477_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c2_4477_cond;
     result_stack_value_MUX_uxn_opcodes_h_l352_c2_4477_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c2_4477_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l352_c2_4477_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c2_4477_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c2_4477_return_output := result_stack_value_MUX_uxn_opcodes_h_l352_c2_4477_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l352_c2_4477] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c2_4477_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c2_4477_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c2_4477_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c2_4477_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c2_4477_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c2_4477_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c2_4477_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l352_c2_4477_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l352_c2_4477] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c2_4477_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c2_4477_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c2_4477_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c2_4477_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c2_4477_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c2_4477_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c2_4477_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l352_c2_4477_return_output;

     -- Submodule level 17
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l421_l348_DUPLICATE_64fe LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l421_l348_DUPLICATE_64fe_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ade(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c2_4477_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l352_c2_4477_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c2_4477_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c2_4477_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c2_4477_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c2_4477_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c2_4477_return_output);

     -- Submodule level 18
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l421_l348_DUPLICATE_64fe_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l421_l348_DUPLICATE_64fe_return_output;
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
