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
-- Submodules: 60
entity gth_0CLK_1c7b7172 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth_0CLK_1c7b7172;
architecture arch of gth_0CLK_1c7b7172 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1951_c6_29ac]
signal BIN_OP_EQ_uxn_opcodes_h_l1951_c6_29ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1951_c6_29ac_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1951_c6_29ac_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1951_c1_b53a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1951_c1_b53a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1951_c1_b53a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1951_c1_b53a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1951_c1_b53a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1951_c2_8586]
signal t8_MUX_uxn_opcodes_h_l1951_c2_8586_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1951_c2_8586_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1951_c2_8586]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1951_c2_8586_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1951_c2_8586_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1951_c2_8586]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c2_8586_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c2_8586_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1951_c2_8586]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c2_8586_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c2_8586_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1951_c2_8586]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1951_c2_8586_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1951_c2_8586_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1951_c2_8586]
signal result_stack_value_MUX_uxn_opcodes_h_l1951_c2_8586_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1951_c2_8586_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1951_c2_8586]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c2_8586_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c2_8586_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1951_c2_8586]
signal n8_MUX_uxn_opcodes_h_l1951_c2_8586_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1951_c2_8586_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1952_c3_624b[uxn_opcodes_h_l1952_c3_624b]
signal printf_uxn_opcodes_h_l1952_c3_624b_uxn_opcodes_h_l1952_c3_624b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1956_c11_63b2]
signal BIN_OP_EQ_uxn_opcodes_h_l1956_c11_63b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1956_c11_63b2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1956_c11_63b2_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1956_c7_c974]
signal t8_MUX_uxn_opcodes_h_l1956_c7_c974_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1956_c7_c974_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1956_c7_c974]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1956_c7_c974_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1956_c7_c974_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1956_c7_c974]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1956_c7_c974_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1956_c7_c974_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1956_c7_c974]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1956_c7_c974_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1956_c7_c974_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1956_c7_c974]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_c974_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_c974_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1956_c7_c974]
signal result_stack_value_MUX_uxn_opcodes_h_l1956_c7_c974_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1956_c7_c974_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1956_c7_c974]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_c974_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_c974_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1956_c7_c974]
signal n8_MUX_uxn_opcodes_h_l1956_c7_c974_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1956_c7_c974_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1959_c11_d81d]
signal BIN_OP_EQ_uxn_opcodes_h_l1959_c11_d81d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1959_c11_d81d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1959_c11_d81d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1959_c7_a041]
signal t8_MUX_uxn_opcodes_h_l1959_c7_a041_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1959_c7_a041_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1959_c7_a041]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1959_c7_a041_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1959_c7_a041_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1959_c7_a041]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1959_c7_a041_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1959_c7_a041_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1959_c7_a041]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1959_c7_a041_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1959_c7_a041_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1959_c7_a041]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1959_c7_a041_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1959_c7_a041_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1959_c7_a041]
signal result_stack_value_MUX_uxn_opcodes_h_l1959_c7_a041_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1959_c7_a041_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1959_c7_a041]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1959_c7_a041_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1959_c7_a041_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1959_c7_a041]
signal n8_MUX_uxn_opcodes_h_l1959_c7_a041_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1959_c7_a041_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1963_c11_5071]
signal BIN_OP_EQ_uxn_opcodes_h_l1963_c11_5071_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1963_c11_5071_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1963_c11_5071_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1963_c7_ad49]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad49_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1963_c7_ad49]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad49_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1963_c7_ad49]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1963_c7_ad49]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad49_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1963_c7_ad49]
signal result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad49_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1963_c7_ad49]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1963_c7_ad49]
signal n8_MUX_uxn_opcodes_h_l1963_c7_ad49_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1966_c11_0ee1]
signal BIN_OP_EQ_uxn_opcodes_h_l1966_c11_0ee1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1966_c11_0ee1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1966_c11_0ee1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1966_c7_4b69]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4b69_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1966_c7_4b69]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4b69_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1966_c7_4b69]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1966_c7_4b69]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4b69_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1966_c7_4b69]
signal result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4b69_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1966_c7_4b69]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1966_c7_4b69]
signal n8_MUX_uxn_opcodes_h_l1966_c7_4b69_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1969_c32_5cf6]
signal BIN_OP_AND_uxn_opcodes_h_l1969_c32_5cf6_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1969_c32_5cf6_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1969_c32_5cf6_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1969_c32_1646]
signal BIN_OP_GT_uxn_opcodes_h_l1969_c32_1646_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1969_c32_1646_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1969_c32_1646_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1969_c32_4856]
signal MUX_uxn_opcodes_h_l1969_c32_4856_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1969_c32_4856_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1969_c32_4856_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1969_c32_4856_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1971_c11_4ee7]
signal BIN_OP_EQ_uxn_opcodes_h_l1971_c11_4ee7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1971_c11_4ee7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1971_c11_4ee7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1971_c7_4c69]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_4c69_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_4c69_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_4c69_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1971_c7_4c69]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_4c69_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_4c69_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_4c69_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1971_c7_4c69]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_4c69_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_4c69_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_4c69_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1971_c7_4c69]
signal result_stack_value_MUX_uxn_opcodes_h_l1971_c7_4c69_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1971_c7_4c69_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1971_c7_4c69_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1971_c7_4c69]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_4c69_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_4c69_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_4c69_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1975_c24_a58e]
signal BIN_OP_GT_uxn_opcodes_h_l1975_c24_a58e_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1975_c24_a58e_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1975_c24_a58e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1975_c24_0c6f]
signal MUX_uxn_opcodes_h_l1975_c24_0c6f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1975_c24_0c6f_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1975_c24_0c6f_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1975_c24_0c6f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1977_c11_19d8]
signal BIN_OP_EQ_uxn_opcodes_h_l1977_c11_19d8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1977_c11_19d8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1977_c11_19d8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1977_c7_2cb9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_2cb9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_2cb9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_2cb9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_2cb9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1977_c7_2cb9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_2cb9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_2cb9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_2cb9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_2cb9_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_53ff( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1951_c6_29ac
BIN_OP_EQ_uxn_opcodes_h_l1951_c6_29ac : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1951_c6_29ac_left,
BIN_OP_EQ_uxn_opcodes_h_l1951_c6_29ac_right,
BIN_OP_EQ_uxn_opcodes_h_l1951_c6_29ac_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1951_c1_b53a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1951_c1_b53a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1951_c1_b53a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1951_c1_b53a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1951_c1_b53a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1951_c1_b53a_return_output);

-- t8_MUX_uxn_opcodes_h_l1951_c2_8586
t8_MUX_uxn_opcodes_h_l1951_c2_8586 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1951_c2_8586_cond,
t8_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue,
t8_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse,
t8_MUX_uxn_opcodes_h_l1951_c2_8586_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1951_c2_8586
result_is_stack_write_MUX_uxn_opcodes_h_l1951_c2_8586 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1951_c2_8586_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1951_c2_8586_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c2_8586
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c2_8586 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c2_8586_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c2_8586_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c2_8586
result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c2_8586 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c2_8586_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c2_8586_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1951_c2_8586
result_is_opc_done_MUX_uxn_opcodes_h_l1951_c2_8586 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1951_c2_8586_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1951_c2_8586_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1951_c2_8586
result_stack_value_MUX_uxn_opcodes_h_l1951_c2_8586 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1951_c2_8586_cond,
result_stack_value_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1951_c2_8586_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c2_8586
result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c2_8586 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c2_8586_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c2_8586_return_output);

-- n8_MUX_uxn_opcodes_h_l1951_c2_8586
n8_MUX_uxn_opcodes_h_l1951_c2_8586 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1951_c2_8586_cond,
n8_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue,
n8_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse,
n8_MUX_uxn_opcodes_h_l1951_c2_8586_return_output);

-- printf_uxn_opcodes_h_l1952_c3_624b_uxn_opcodes_h_l1952_c3_624b
printf_uxn_opcodes_h_l1952_c3_624b_uxn_opcodes_h_l1952_c3_624b : entity work.printf_uxn_opcodes_h_l1952_c3_624b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1952_c3_624b_uxn_opcodes_h_l1952_c3_624b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1956_c11_63b2
BIN_OP_EQ_uxn_opcodes_h_l1956_c11_63b2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1956_c11_63b2_left,
BIN_OP_EQ_uxn_opcodes_h_l1956_c11_63b2_right,
BIN_OP_EQ_uxn_opcodes_h_l1956_c11_63b2_return_output);

-- t8_MUX_uxn_opcodes_h_l1956_c7_c974
t8_MUX_uxn_opcodes_h_l1956_c7_c974 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1956_c7_c974_cond,
t8_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue,
t8_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse,
t8_MUX_uxn_opcodes_h_l1956_c7_c974_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1956_c7_c974
result_is_stack_write_MUX_uxn_opcodes_h_l1956_c7_c974 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1956_c7_c974_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1956_c7_c974_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1956_c7_c974
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1956_c7_c974 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1956_c7_c974_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1956_c7_c974_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1956_c7_c974
result_sp_relative_shift_MUX_uxn_opcodes_h_l1956_c7_c974 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1956_c7_c974_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1956_c7_c974_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_c974
result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_c974 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_c974_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_c974_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1956_c7_c974
result_stack_value_MUX_uxn_opcodes_h_l1956_c7_c974 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1956_c7_c974_cond,
result_stack_value_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1956_c7_c974_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_c974
result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_c974 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_c974_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_c974_return_output);

-- n8_MUX_uxn_opcodes_h_l1956_c7_c974
n8_MUX_uxn_opcodes_h_l1956_c7_c974 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1956_c7_c974_cond,
n8_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue,
n8_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse,
n8_MUX_uxn_opcodes_h_l1956_c7_c974_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1959_c11_d81d
BIN_OP_EQ_uxn_opcodes_h_l1959_c11_d81d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1959_c11_d81d_left,
BIN_OP_EQ_uxn_opcodes_h_l1959_c11_d81d_right,
BIN_OP_EQ_uxn_opcodes_h_l1959_c11_d81d_return_output);

-- t8_MUX_uxn_opcodes_h_l1959_c7_a041
t8_MUX_uxn_opcodes_h_l1959_c7_a041 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1959_c7_a041_cond,
t8_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue,
t8_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse,
t8_MUX_uxn_opcodes_h_l1959_c7_a041_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1959_c7_a041
result_is_stack_write_MUX_uxn_opcodes_h_l1959_c7_a041 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1959_c7_a041_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1959_c7_a041_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1959_c7_a041
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1959_c7_a041 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1959_c7_a041_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1959_c7_a041_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1959_c7_a041
result_sp_relative_shift_MUX_uxn_opcodes_h_l1959_c7_a041 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1959_c7_a041_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1959_c7_a041_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1959_c7_a041
result_is_opc_done_MUX_uxn_opcodes_h_l1959_c7_a041 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1959_c7_a041_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1959_c7_a041_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1959_c7_a041
result_stack_value_MUX_uxn_opcodes_h_l1959_c7_a041 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1959_c7_a041_cond,
result_stack_value_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1959_c7_a041_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1959_c7_a041
result_is_sp_shift_MUX_uxn_opcodes_h_l1959_c7_a041 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1959_c7_a041_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1959_c7_a041_return_output);

-- n8_MUX_uxn_opcodes_h_l1959_c7_a041
n8_MUX_uxn_opcodes_h_l1959_c7_a041 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1959_c7_a041_cond,
n8_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue,
n8_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse,
n8_MUX_uxn_opcodes_h_l1959_c7_a041_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1963_c11_5071
BIN_OP_EQ_uxn_opcodes_h_l1963_c11_5071 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1963_c11_5071_left,
BIN_OP_EQ_uxn_opcodes_h_l1963_c11_5071_right,
BIN_OP_EQ_uxn_opcodes_h_l1963_c11_5071_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad49
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad49_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad49
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad49 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad49_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad49
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad49 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad49
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad49_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad49
result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad49 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad49_cond,
result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad49
result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output);

-- n8_MUX_uxn_opcodes_h_l1963_c7_ad49
n8_MUX_uxn_opcodes_h_l1963_c7_ad49 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1963_c7_ad49_cond,
n8_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue,
n8_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse,
n8_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1966_c11_0ee1
BIN_OP_EQ_uxn_opcodes_h_l1966_c11_0ee1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1966_c11_0ee1_left,
BIN_OP_EQ_uxn_opcodes_h_l1966_c11_0ee1_right,
BIN_OP_EQ_uxn_opcodes_h_l1966_c11_0ee1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4b69
result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4b69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4b69_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4b69
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4b69 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4b69_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_4b69
result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_4b69 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4b69
result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4b69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4b69_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4b69
result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4b69 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4b69_cond,
result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4b69
result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4b69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output);

-- n8_MUX_uxn_opcodes_h_l1966_c7_4b69
n8_MUX_uxn_opcodes_h_l1966_c7_4b69 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1966_c7_4b69_cond,
n8_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue,
n8_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse,
n8_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1969_c32_5cf6
BIN_OP_AND_uxn_opcodes_h_l1969_c32_5cf6 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1969_c32_5cf6_left,
BIN_OP_AND_uxn_opcodes_h_l1969_c32_5cf6_right,
BIN_OP_AND_uxn_opcodes_h_l1969_c32_5cf6_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1969_c32_1646
BIN_OP_GT_uxn_opcodes_h_l1969_c32_1646 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1969_c32_1646_left,
BIN_OP_GT_uxn_opcodes_h_l1969_c32_1646_right,
BIN_OP_GT_uxn_opcodes_h_l1969_c32_1646_return_output);

-- MUX_uxn_opcodes_h_l1969_c32_4856
MUX_uxn_opcodes_h_l1969_c32_4856 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1969_c32_4856_cond,
MUX_uxn_opcodes_h_l1969_c32_4856_iftrue,
MUX_uxn_opcodes_h_l1969_c32_4856_iffalse,
MUX_uxn_opcodes_h_l1969_c32_4856_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1971_c11_4ee7
BIN_OP_EQ_uxn_opcodes_h_l1971_c11_4ee7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1971_c11_4ee7_left,
BIN_OP_EQ_uxn_opcodes_h_l1971_c11_4ee7_right,
BIN_OP_EQ_uxn_opcodes_h_l1971_c11_4ee7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_4c69
result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_4c69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_4c69_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_4c69_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_4c69_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_4c69
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_4c69 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_4c69_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_4c69_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_4c69_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_4c69
result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_4c69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_4c69_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_4c69_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_4c69_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1971_c7_4c69
result_stack_value_MUX_uxn_opcodes_h_l1971_c7_4c69 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1971_c7_4c69_cond,
result_stack_value_MUX_uxn_opcodes_h_l1971_c7_4c69_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1971_c7_4c69_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_4c69
result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_4c69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_4c69_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_4c69_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_4c69_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1975_c24_a58e
BIN_OP_GT_uxn_opcodes_h_l1975_c24_a58e : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1975_c24_a58e_left,
BIN_OP_GT_uxn_opcodes_h_l1975_c24_a58e_right,
BIN_OP_GT_uxn_opcodes_h_l1975_c24_a58e_return_output);

-- MUX_uxn_opcodes_h_l1975_c24_0c6f
MUX_uxn_opcodes_h_l1975_c24_0c6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1975_c24_0c6f_cond,
MUX_uxn_opcodes_h_l1975_c24_0c6f_iftrue,
MUX_uxn_opcodes_h_l1975_c24_0c6f_iffalse,
MUX_uxn_opcodes_h_l1975_c24_0c6f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1977_c11_19d8
BIN_OP_EQ_uxn_opcodes_h_l1977_c11_19d8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1977_c11_19d8_left,
BIN_OP_EQ_uxn_opcodes_h_l1977_c11_19d8_right,
BIN_OP_EQ_uxn_opcodes_h_l1977_c11_19d8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_2cb9
result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_2cb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_2cb9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_2cb9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_2cb9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_2cb9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_2cb9
result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_2cb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_2cb9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_2cb9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_2cb9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_2cb9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1951_c6_29ac_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1951_c1_b53a_return_output,
 t8_MUX_uxn_opcodes_h_l1951_c2_8586_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1951_c2_8586_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c2_8586_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c2_8586_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1951_c2_8586_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1951_c2_8586_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c2_8586_return_output,
 n8_MUX_uxn_opcodes_h_l1951_c2_8586_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1956_c11_63b2_return_output,
 t8_MUX_uxn_opcodes_h_l1956_c7_c974_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1956_c7_c974_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1956_c7_c974_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1956_c7_c974_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_c974_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1956_c7_c974_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_c974_return_output,
 n8_MUX_uxn_opcodes_h_l1956_c7_c974_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1959_c11_d81d_return_output,
 t8_MUX_uxn_opcodes_h_l1959_c7_a041_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1959_c7_a041_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1959_c7_a041_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1959_c7_a041_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1959_c7_a041_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1959_c7_a041_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1959_c7_a041_return_output,
 n8_MUX_uxn_opcodes_h_l1959_c7_a041_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1963_c11_5071_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output,
 n8_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1966_c11_0ee1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output,
 n8_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1969_c32_5cf6_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1969_c32_1646_return_output,
 MUX_uxn_opcodes_h_l1969_c32_4856_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1971_c11_4ee7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1975_c24_a58e_return_output,
 MUX_uxn_opcodes_h_l1975_c24_0c6f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1977_c11_19d8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_2cb9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_2cb9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c6_29ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c6_29ac_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c6_29ac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1951_c1_b53a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1951_c1_b53a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1951_c1_b53a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1951_c1_b53a_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1956_c7_c974_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1951_c2_8586_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1951_c2_8586_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1956_c7_c974_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1951_c2_8586_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1951_c2_8586_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1953_c3_80ca : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1956_c7_c974_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c2_8586_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c2_8586_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1956_c7_c974_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c2_8586_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c2_8586_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_c974_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c2_8586_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c2_8586_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1956_c7_c974_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1951_c2_8586_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1951_c2_8586_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_c974_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c2_8586_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c2_8586_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1956_c7_c974_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1951_c2_8586_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1951_c2_8586_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1952_c3_624b_uxn_opcodes_h_l1952_c3_624b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1956_c11_63b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1956_c11_63b2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1956_c11_63b2_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1959_c7_a041_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1956_c7_c974_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1959_c7_a041_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1956_c7_c974_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_9ac8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1959_c7_a041_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1956_c7_c974_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1959_c7_a041_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1956_c7_c974_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1959_c7_a041_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_c974_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1959_c7_a041_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1956_c7_c974_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1959_c7_a041_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_c974_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1959_c7_a041_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1956_c7_c974_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1959_c11_d81d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1959_c11_d81d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1959_c11_d81d_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1959_c7_a041_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1959_c7_a041_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1961_c3_ff79 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1959_c7_a041_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1959_c7_a041_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1959_c7_a041_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1959_c7_a041_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1959_c7_a041_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1959_c7_a041_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_5071_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_5071_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_5071_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad49_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1964_c3_a320 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad49_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad49_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad49_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1963_c7_ad49_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_0ee1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_0ee1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_0ee1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4b69_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4b69_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4b69_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4b69_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1966_c7_4b69_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1969_c32_4856_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1969_c32_4856_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1969_c32_4856_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1969_c32_5cf6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1969_c32_5cf6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1969_c32_5cf6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1969_c32_1646_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1969_c32_1646_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1969_c32_1646_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1969_c32_4856_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_4ee7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_4ee7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_4ee7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_4c69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_4c69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_2cb9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_4c69_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_4c69_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1974_c3_cf05 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_4c69_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_4c69_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_4c69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_4c69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_2cb9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_4c69_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_4c69_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_4c69_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_4c69_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_4c69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_4c69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_4c69_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1975_c24_0c6f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1975_c24_0c6f_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1975_c24_0c6f_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1975_c24_a58e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1975_c24_a58e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1975_c24_a58e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1975_c24_0c6f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_19d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_19d8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_19d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_2cb9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_2cb9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_2cb9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_2cb9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_2cb9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_2cb9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1951_l1977_l1966_l1963_l1959_l1956_DUPLICATE_da1d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1951_l1966_l1963_l1959_l1956_DUPLICATE_27a2_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1951_l1971_l1966_l1963_l1959_l1956_DUPLICATE_6161_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1951_l1971_l1963_l1959_l1956_DUPLICATE_27eb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1977_l1971_l1966_l1963_l1959_l1956_DUPLICATE_0b79_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1971_l1966_DUPLICATE_e54f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1982_l1947_DUPLICATE_6a32_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l1975_c24_0c6f_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_4c69_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_4ee7_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1974_c3_cf05 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_4c69_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1974_c3_cf05;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1961_c3_ff79 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1961_c3_ff79;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1964_c3_a320 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1964_c3_a320;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_5071_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_19d8_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_2cb9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_0ee1_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1951_c1_b53a_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_2cb9_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1975_c24_0c6f_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_4c69_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1969_c32_4856_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1969_c32_1646_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1959_c11_d81d_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1956_c11_63b2_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c6_29ac_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1969_c32_5cf6_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l1969_c32_4856_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1953_c3_80ca := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1953_c3_80ca;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_9ac8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_9ac8;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1951_c1_b53a_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1969_c32_5cf6_left := VAR_ins;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1975_c24_a58e_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c6_29ac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1956_c11_63b2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1959_c11_d81d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_5071_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_0ee1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_4ee7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_19d8_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1975_c24_a58e_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse := t8;
     -- BIN_OP_AND[uxn_opcodes_h_l1969_c32_5cf6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1969_c32_5cf6_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1969_c32_5cf6_left;
     BIN_OP_AND_uxn_opcodes_h_l1969_c32_5cf6_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1969_c32_5cf6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1969_c32_5cf6_return_output := BIN_OP_AND_uxn_opcodes_h_l1969_c32_5cf6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1956_c11_63b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1956_c11_63b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1956_c11_63b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1956_c11_63b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1956_c11_63b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1956_c11_63b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1956_c11_63b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1977_c11_19d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1977_c11_19d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_19d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1977_c11_19d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_19d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_19d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1977_c11_19d8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1971_c11_4ee7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1971_c11_4ee7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_4ee7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1971_c11_4ee7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_4ee7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_4ee7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1971_c11_4ee7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1963_c11_5071] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1963_c11_5071_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_5071_left;
     BIN_OP_EQ_uxn_opcodes_h_l1963_c11_5071_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_5071_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_5071_return_output := BIN_OP_EQ_uxn_opcodes_h_l1963_c11_5071_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1951_c6_29ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1951_c6_29ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c6_29ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l1951_c6_29ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c6_29ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c6_29ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l1951_c6_29ac_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1951_l1971_l1966_l1963_l1959_l1956_DUPLICATE_6161 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1951_l1971_l1966_l1963_l1959_l1956_DUPLICATE_6161_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1966_c11_0ee1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1966_c11_0ee1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_0ee1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1966_c11_0ee1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_0ee1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_0ee1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1966_c11_0ee1_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1951_l1966_l1963_l1959_l1956_DUPLICATE_27a2 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1951_l1966_l1963_l1959_l1956_DUPLICATE_27a2_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1951_l1971_l1963_l1959_l1956_DUPLICATE_27eb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1951_l1971_l1963_l1959_l1956_DUPLICATE_27eb_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1959_c11_d81d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1959_c11_d81d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1959_c11_d81d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1959_c11_d81d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1959_c11_d81d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1959_c11_d81d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1959_c11_d81d_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1975_c24_a58e] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1975_c24_a58e_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1975_c24_a58e_left;
     BIN_OP_GT_uxn_opcodes_h_l1975_c24_a58e_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1975_c24_a58e_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1975_c24_a58e_return_output := BIN_OP_GT_uxn_opcodes_h_l1975_c24_a58e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1977_l1971_l1966_l1963_l1959_l1956_DUPLICATE_0b79 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1977_l1971_l1966_l1963_l1959_l1956_DUPLICATE_0b79_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1971_l1966_DUPLICATE_e54f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1971_l1966_DUPLICATE_e54f_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1951_l1977_l1966_l1963_l1959_l1956_DUPLICATE_da1d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1951_l1977_l1966_l1963_l1959_l1956_DUPLICATE_da1d_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1969_c32_1646_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1969_c32_5cf6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1951_c1_b53a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c6_29ac_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1951_c2_8586_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c6_29ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c2_8586_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c6_29ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c2_8586_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c6_29ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1951_c2_8586_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c6_29ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c2_8586_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c6_29ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c2_8586_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c6_29ac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1951_c2_8586_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c6_29ac_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1951_c2_8586_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c6_29ac_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1956_c7_c974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1956_c11_63b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_c974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1956_c11_63b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_c974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1956_c11_63b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1956_c7_c974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1956_c11_63b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1956_c7_c974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1956_c11_63b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1956_c7_c974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1956_c11_63b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1956_c7_c974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1956_c11_63b2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1956_c7_c974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1956_c11_63b2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1959_c7_a041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1959_c11_d81d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1959_c7_a041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1959_c11_d81d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1959_c7_a041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1959_c11_d81d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1959_c7_a041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1959_c11_d81d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1959_c7_a041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1959_c11_d81d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1959_c7_a041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1959_c11_d81d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1959_c7_a041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1959_c11_d81d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1959_c7_a041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1959_c11_d81d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1963_c7_ad49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_5071_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_5071_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_5071_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_5071_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_5071_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_5071_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_5071_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1966_c7_4b69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_0ee1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4b69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_0ee1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_0ee1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4b69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_0ee1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_0ee1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4b69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_0ee1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4b69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_0ee1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_4c69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_4ee7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_4c69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_4ee7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_4c69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_4ee7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_4c69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_4ee7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_4c69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_4ee7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_2cb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_19d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_2cb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_19d8_return_output;
     VAR_MUX_uxn_opcodes_h_l1975_c24_0c6f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1975_c24_a58e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1951_l1966_l1963_l1959_l1956_DUPLICATE_27a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1951_l1966_l1963_l1959_l1956_DUPLICATE_27a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1951_l1966_l1963_l1959_l1956_DUPLICATE_27a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1951_l1966_l1963_l1959_l1956_DUPLICATE_27a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1951_l1966_l1963_l1959_l1956_DUPLICATE_27a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1977_l1971_l1966_l1963_l1959_l1956_DUPLICATE_0b79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1977_l1971_l1966_l1963_l1959_l1956_DUPLICATE_0b79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1977_l1971_l1966_l1963_l1959_l1956_DUPLICATE_0b79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1977_l1971_l1966_l1963_l1959_l1956_DUPLICATE_0b79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_4c69_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1977_l1971_l1966_l1963_l1959_l1956_DUPLICATE_0b79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_2cb9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1977_l1971_l1966_l1963_l1959_l1956_DUPLICATE_0b79_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1951_l1971_l1963_l1959_l1956_DUPLICATE_27eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1951_l1971_l1963_l1959_l1956_DUPLICATE_27eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1951_l1971_l1963_l1959_l1956_DUPLICATE_27eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1951_l1971_l1963_l1959_l1956_DUPLICATE_27eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_4c69_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1951_l1971_l1963_l1959_l1956_DUPLICATE_27eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1951_l1977_l1966_l1963_l1959_l1956_DUPLICATE_da1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1951_l1977_l1966_l1963_l1959_l1956_DUPLICATE_da1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1951_l1977_l1966_l1963_l1959_l1956_DUPLICATE_da1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1951_l1977_l1966_l1963_l1959_l1956_DUPLICATE_da1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1951_l1977_l1966_l1963_l1959_l1956_DUPLICATE_da1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_2cb9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1951_l1977_l1966_l1963_l1959_l1956_DUPLICATE_da1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1971_l1966_DUPLICATE_e54f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_4c69_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1971_l1966_DUPLICATE_e54f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1951_l1971_l1966_l1963_l1959_l1956_DUPLICATE_6161_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1951_l1971_l1966_l1963_l1959_l1956_DUPLICATE_6161_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1951_l1971_l1966_l1963_l1959_l1956_DUPLICATE_6161_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1951_l1971_l1966_l1963_l1959_l1956_DUPLICATE_6161_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1951_l1971_l1966_l1963_l1959_l1956_DUPLICATE_6161_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_4c69_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1951_l1971_l1966_l1963_l1959_l1956_DUPLICATE_6161_return_output;
     -- n8_MUX[uxn_opcodes_h_l1966_c7_4b69] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1966_c7_4b69_cond <= VAR_n8_MUX_uxn_opcodes_h_l1966_c7_4b69_cond;
     n8_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue;
     n8_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output := n8_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1977_c7_2cb9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_2cb9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_2cb9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_2cb9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_2cb9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_2cb9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_2cb9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_2cb9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_2cb9_return_output;

     -- t8_MUX[uxn_opcodes_h_l1959_c7_a041] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1959_c7_a041_cond <= VAR_t8_MUX_uxn_opcodes_h_l1959_c7_a041_cond;
     t8_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue;
     t8_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1959_c7_a041_return_output := t8_MUX_uxn_opcodes_h_l1959_c7_a041_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1951_c1_b53a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1951_c1_b53a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1951_c1_b53a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1951_c1_b53a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1951_c1_b53a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1951_c1_b53a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1951_c1_b53a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1951_c1_b53a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1951_c1_b53a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1971_c7_4c69] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_4c69_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_4c69_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_4c69_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_4c69_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_4c69_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_4c69_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output;

     -- MUX[uxn_opcodes_h_l1975_c24_0c6f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1975_c24_0c6f_cond <= VAR_MUX_uxn_opcodes_h_l1975_c24_0c6f_cond;
     MUX_uxn_opcodes_h_l1975_c24_0c6f_iftrue <= VAR_MUX_uxn_opcodes_h_l1975_c24_0c6f_iftrue;
     MUX_uxn_opcodes_h_l1975_c24_0c6f_iffalse <= VAR_MUX_uxn_opcodes_h_l1975_c24_0c6f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1975_c24_0c6f_return_output := MUX_uxn_opcodes_h_l1975_c24_0c6f_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1969_c32_1646] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1969_c32_1646_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1969_c32_1646_left;
     BIN_OP_GT_uxn_opcodes_h_l1969_c32_1646_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1969_c32_1646_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1969_c32_1646_return_output := BIN_OP_GT_uxn_opcodes_h_l1969_c32_1646_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1971_c7_4c69] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_4c69_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_4c69_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_4c69_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_4c69_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_4c69_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_4c69_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1977_c7_2cb9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_2cb9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_2cb9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_2cb9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_2cb9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_2cb9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_2cb9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_2cb9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_2cb9_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1969_c32_4856_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1969_c32_1646_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_4c69_iftrue := VAR_MUX_uxn_opcodes_h_l1975_c24_0c6f_return_output;
     VAR_printf_uxn_opcodes_h_l1952_c3_624b_uxn_opcodes_h_l1952_c3_624b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1951_c1_b53a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_4c69_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_2cb9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_4c69_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_2cb9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1959_c7_a041_return_output;
     -- printf_uxn_opcodes_h_l1952_c3_624b[uxn_opcodes_h_l1952_c3_624b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1952_c3_624b_uxn_opcodes_h_l1952_c3_624b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1952_c3_624b_uxn_opcodes_h_l1952_c3_624b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1966_c7_4b69] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4b69_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4b69_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output;

     -- n8_MUX[uxn_opcodes_h_l1963_c7_ad49] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1963_c7_ad49_cond <= VAR_n8_MUX_uxn_opcodes_h_l1963_c7_ad49_cond;
     n8_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue;
     n8_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output := n8_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output;

     -- MUX[uxn_opcodes_h_l1969_c32_4856] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1969_c32_4856_cond <= VAR_MUX_uxn_opcodes_h_l1969_c32_4856_cond;
     MUX_uxn_opcodes_h_l1969_c32_4856_iftrue <= VAR_MUX_uxn_opcodes_h_l1969_c32_4856_iftrue;
     MUX_uxn_opcodes_h_l1969_c32_4856_iffalse <= VAR_MUX_uxn_opcodes_h_l1969_c32_4856_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1969_c32_4856_return_output := MUX_uxn_opcodes_h_l1969_c32_4856_return_output;

     -- t8_MUX[uxn_opcodes_h_l1956_c7_c974] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1956_c7_c974_cond <= VAR_t8_MUX_uxn_opcodes_h_l1956_c7_c974_cond;
     t8_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue;
     t8_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1956_c7_c974_return_output := t8_MUX_uxn_opcodes_h_l1956_c7_c974_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1971_c7_4c69] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1971_c7_4c69_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_4c69_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1971_c7_4c69_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_4c69_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1971_c7_4c69_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_4c69_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output := result_stack_value_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1966_c7_4b69] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1971_c7_4c69] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_4c69_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_4c69_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_4c69_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_4c69_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_4c69_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_4c69_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1971_c7_4c69] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_4c69_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_4c69_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_4c69_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_4c69_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_4c69_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_4c69_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue := VAR_MUX_uxn_opcodes_h_l1969_c32_4856_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1971_c7_4c69_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1956_c7_c974_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1963_c7_ad49] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1963_c7_ad49] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad49_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad49_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1966_c7_4b69] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1966_c7_4b69] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4b69_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4b69_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output;

     -- n8_MUX[uxn_opcodes_h_l1959_c7_a041] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1959_c7_a041_cond <= VAR_n8_MUX_uxn_opcodes_h_l1959_c7_a041_cond;
     n8_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue;
     n8_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1959_c7_a041_return_output := n8_MUX_uxn_opcodes_h_l1959_c7_a041_return_output;

     -- t8_MUX[uxn_opcodes_h_l1951_c2_8586] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1951_c2_8586_cond <= VAR_t8_MUX_uxn_opcodes_h_l1951_c2_8586_cond;
     t8_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue;
     t8_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1951_c2_8586_return_output := t8_MUX_uxn_opcodes_h_l1951_c2_8586_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1966_c7_4b69] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4b69_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4b69_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output := result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1966_c7_4b69] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4b69_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4b69_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4b69_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4b69_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1959_c7_a041_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4b69_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1951_c2_8586_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1963_c7_ad49] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad49_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad49_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1963_c7_ad49] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad49_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad49_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1963_c7_ad49] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad49_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad49_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output := result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output;

     -- n8_MUX[uxn_opcodes_h_l1956_c7_c974] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1956_c7_c974_cond <= VAR_n8_MUX_uxn_opcodes_h_l1956_c7_c974_cond;
     n8_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue;
     n8_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1956_c7_c974_return_output := n8_MUX_uxn_opcodes_h_l1956_c7_c974_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1959_c7_a041] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1959_c7_a041_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1959_c7_a041_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1959_c7_a041_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1959_c7_a041_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1963_c7_ad49] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1959_c7_a041] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1959_c7_a041_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1959_c7_a041_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1959_c7_a041_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1959_c7_a041_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1956_c7_c974_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1959_c7_a041_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1959_c7_a041_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad49_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1959_c7_a041] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1959_c7_a041_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1959_c7_a041_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1959_c7_a041_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1959_c7_a041_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1959_c7_a041] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1959_c7_a041_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1959_c7_a041_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1959_c7_a041_return_output := result_stack_value_MUX_uxn_opcodes_h_l1959_c7_a041_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1956_c7_c974] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_c974_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_c974_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_c974_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_c974_return_output;

     -- n8_MUX[uxn_opcodes_h_l1951_c2_8586] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1951_c2_8586_cond <= VAR_n8_MUX_uxn_opcodes_h_l1951_c2_8586_cond;
     n8_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue;
     n8_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1951_c2_8586_return_output := n8_MUX_uxn_opcodes_h_l1951_c2_8586_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1959_c7_a041] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1959_c7_a041_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1959_c7_a041_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1959_c7_a041_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1959_c7_a041_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1959_c7_a041] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1959_c7_a041_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1959_c7_a041_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1959_c7_a041_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1959_c7_a041_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1959_c7_a041_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1959_c7_a041_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1956_c7_c974] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1956_c7_c974_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1956_c7_c974_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1956_c7_c974_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1956_c7_c974_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1951_c2_8586_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1959_c7_a041_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_c974_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1959_c7_a041_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1959_c7_a041_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1956_c7_c974_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1959_c7_a041_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1956_c7_c974] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1956_c7_c974_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1956_c7_c974_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1956_c7_c974_return_output := result_stack_value_MUX_uxn_opcodes_h_l1956_c7_c974_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1956_c7_c974] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1956_c7_c974_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1956_c7_c974_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1956_c7_c974_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1956_c7_c974_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1951_c2_8586] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c2_8586_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c2_8586_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c2_8586_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c2_8586_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1951_c2_8586] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c2_8586_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c2_8586_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c2_8586_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c2_8586_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1956_c7_c974] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1956_c7_c974_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1956_c7_c974_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1956_c7_c974_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1956_c7_c974_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1956_c7_c974] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_c974_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_c974_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_c974_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_c974_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_c974_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_c974_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_c974_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1956_c7_c974_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1956_c7_c974_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1956_c7_c974_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1951_c2_8586] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1951_c2_8586_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c2_8586_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c2_8586_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1951_c2_8586_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1951_c2_8586] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c2_8586_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c2_8586_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c2_8586_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c2_8586_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1951_c2_8586] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1951_c2_8586_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1951_c2_8586_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1951_c2_8586_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1951_c2_8586_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1951_c2_8586] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1951_c2_8586_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1951_c2_8586_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1951_c2_8586_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1951_c2_8586_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1951_c2_8586_return_output := result_stack_value_MUX_uxn_opcodes_h_l1951_c2_8586_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1982_l1947_DUPLICATE_6a32 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1982_l1947_DUPLICATE_6a32_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_53ff(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1951_c2_8586_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c2_8586_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c2_8586_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c2_8586_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1951_c2_8586_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c2_8586_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1982_l1947_DUPLICATE_6a32_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1982_l1947_DUPLICATE_6a32_return_output;
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
