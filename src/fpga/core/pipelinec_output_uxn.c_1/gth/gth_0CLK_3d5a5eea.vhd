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
entity gth_0CLK_3d5a5eea is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth_0CLK_3d5a5eea;
architecture arch of gth_0CLK_3d5a5eea is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1955_c6_681e]
signal BIN_OP_EQ_uxn_opcodes_h_l1955_c6_681e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1955_c6_681e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1955_c6_681e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1955_c2_d307]
signal n8_MUX_uxn_opcodes_h_l1955_c2_d307_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1955_c2_d307_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1955_c2_d307]
signal t8_MUX_uxn_opcodes_h_l1955_c2_d307_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1955_c2_d307_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1955_c2_d307]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_d307_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_d307_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1955_c2_d307]
signal result_stack_value_MUX_uxn_opcodes_h_l1955_c2_d307_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1955_c2_d307_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1955_c2_d307]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_d307_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_d307_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1955_c2_d307]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_d307_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_d307_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1955_c2_d307]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_d307_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_d307_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1955_c2_d307]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_d307_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_d307_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1960_c11_dfd8]
signal BIN_OP_EQ_uxn_opcodes_h_l1960_c11_dfd8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1960_c11_dfd8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1960_c11_dfd8_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1960_c7_547a]
signal n8_MUX_uxn_opcodes_h_l1960_c7_547a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1960_c7_547a_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1960_c7_547a]
signal t8_MUX_uxn_opcodes_h_l1960_c7_547a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1960_c7_547a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1960_c7_547a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_547a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_547a_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1960_c7_547a]
signal result_stack_value_MUX_uxn_opcodes_h_l1960_c7_547a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1960_c7_547a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1960_c7_547a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_547a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_547a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1960_c7_547a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_547a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_547a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1960_c7_547a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_547a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_547a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1960_c7_547a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_547a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_547a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1963_c11_a3fc]
signal BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3fc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3fc_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1963_c7_ad64]
signal n8_MUX_uxn_opcodes_h_l1963_c7_ad64_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1963_c7_ad64]
signal t8_MUX_uxn_opcodes_h_l1963_c7_ad64_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1963_c7_ad64]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1963_c7_ad64]
signal result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad64_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1963_c7_ad64]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad64_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1963_c7_ad64]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1963_c7_ad64]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad64_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1963_c7_ad64]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad64_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1967_c11_e574]
signal BIN_OP_EQ_uxn_opcodes_h_l1967_c11_e574_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1967_c11_e574_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1967_c11_e574_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1967_c7_e7ad]
signal n8_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1967_c7_e7ad]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1967_c7_e7ad]
signal result_stack_value_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1967_c7_e7ad]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1967_c7_e7ad]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1967_c7_e7ad]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1967_c7_e7ad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1970_c11_afbb]
signal BIN_OP_EQ_uxn_opcodes_h_l1970_c11_afbb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1970_c11_afbb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1970_c11_afbb_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1970_c7_f531]
signal n8_MUX_uxn_opcodes_h_l1970_c7_f531_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1970_c7_f531_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1970_c7_f531]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_f531_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_f531_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1970_c7_f531]
signal result_stack_value_MUX_uxn_opcodes_h_l1970_c7_f531_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1970_c7_f531_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1970_c7_f531]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_f531_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_f531_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1970_c7_f531]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_f531_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_f531_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1970_c7_f531]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_f531_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_f531_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1970_c7_f531]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_f531_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_f531_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1973_c32_faf2]
signal BIN_OP_AND_uxn_opcodes_h_l1973_c32_faf2_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1973_c32_faf2_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1973_c32_faf2_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1973_c32_f9e3]
signal BIN_OP_GT_uxn_opcodes_h_l1973_c32_f9e3_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1973_c32_f9e3_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1973_c32_f9e3_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1973_c32_d4b5]
signal MUX_uxn_opcodes_h_l1973_c32_d4b5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1973_c32_d4b5_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1973_c32_d4b5_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1973_c32_d4b5_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1975_c11_f784]
signal BIN_OP_EQ_uxn_opcodes_h_l1975_c11_f784_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1975_c11_f784_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1975_c11_f784_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1975_c7_8591]
signal result_stack_value_MUX_uxn_opcodes_h_l1975_c7_8591_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1975_c7_8591_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1975_c7_8591_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1975_c7_8591_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1975_c7_8591]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_8591_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_8591_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_8591_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_8591_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1975_c7_8591]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_8591_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_8591_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_8591_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_8591_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1975_c7_8591]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_8591_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_8591_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_8591_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_8591_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1975_c7_8591]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_8591_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_8591_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_8591_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_8591_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1979_c24_d1f5]
signal BIN_OP_GT_uxn_opcodes_h_l1979_c24_d1f5_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1979_c24_d1f5_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1979_c24_d1f5_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1979_c24_3737]
signal MUX_uxn_opcodes_h_l1979_c24_3737_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1979_c24_3737_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1979_c24_3737_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1979_c24_3737_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1981_c11_81f1]
signal BIN_OP_EQ_uxn_opcodes_h_l1981_c11_81f1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1981_c11_81f1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1981_c11_81f1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1981_c7_ac6b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_ac6b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_ac6b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_ac6b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_ac6b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1981_c7_ac6b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_ac6b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_ac6b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_ac6b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_ac6b_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1955_c6_681e
BIN_OP_EQ_uxn_opcodes_h_l1955_c6_681e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1955_c6_681e_left,
BIN_OP_EQ_uxn_opcodes_h_l1955_c6_681e_right,
BIN_OP_EQ_uxn_opcodes_h_l1955_c6_681e_return_output);

-- n8_MUX_uxn_opcodes_h_l1955_c2_d307
n8_MUX_uxn_opcodes_h_l1955_c2_d307 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1955_c2_d307_cond,
n8_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue,
n8_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse,
n8_MUX_uxn_opcodes_h_l1955_c2_d307_return_output);

-- t8_MUX_uxn_opcodes_h_l1955_c2_d307
t8_MUX_uxn_opcodes_h_l1955_c2_d307 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1955_c2_d307_cond,
t8_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue,
t8_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse,
t8_MUX_uxn_opcodes_h_l1955_c2_d307_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_d307
result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_d307 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_d307_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_d307_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1955_c2_d307
result_stack_value_MUX_uxn_opcodes_h_l1955_c2_d307 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1955_c2_d307_cond,
result_stack_value_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1955_c2_d307_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_d307
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_d307 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_d307_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_d307_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_d307
result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_d307 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_d307_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_d307_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_d307
result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_d307 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_d307_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_d307_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_d307
result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_d307 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_d307_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_d307_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1960_c11_dfd8
BIN_OP_EQ_uxn_opcodes_h_l1960_c11_dfd8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1960_c11_dfd8_left,
BIN_OP_EQ_uxn_opcodes_h_l1960_c11_dfd8_right,
BIN_OP_EQ_uxn_opcodes_h_l1960_c11_dfd8_return_output);

-- n8_MUX_uxn_opcodes_h_l1960_c7_547a
n8_MUX_uxn_opcodes_h_l1960_c7_547a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1960_c7_547a_cond,
n8_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue,
n8_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse,
n8_MUX_uxn_opcodes_h_l1960_c7_547a_return_output);

-- t8_MUX_uxn_opcodes_h_l1960_c7_547a
t8_MUX_uxn_opcodes_h_l1960_c7_547a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1960_c7_547a_cond,
t8_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue,
t8_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse,
t8_MUX_uxn_opcodes_h_l1960_c7_547a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_547a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_547a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_547a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_547a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1960_c7_547a
result_stack_value_MUX_uxn_opcodes_h_l1960_c7_547a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1960_c7_547a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1960_c7_547a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_547a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_547a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_547a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_547a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_547a
result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_547a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_547a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_547a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_547a
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_547a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_547a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_547a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_547a
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_547a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_547a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_547a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3fc
BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3fc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3fc_left,
BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3fc_right,
BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3fc_return_output);

-- n8_MUX_uxn_opcodes_h_l1963_c7_ad64
n8_MUX_uxn_opcodes_h_l1963_c7_ad64 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1963_c7_ad64_cond,
n8_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue,
n8_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse,
n8_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output);

-- t8_MUX_uxn_opcodes_h_l1963_c7_ad64
t8_MUX_uxn_opcodes_h_l1963_c7_ad64 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1963_c7_ad64_cond,
t8_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue,
t8_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse,
t8_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad64
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad64 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad64
result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad64 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad64_cond,
result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad64
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad64 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad64_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad64
result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad64
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad64_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad64
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad64_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1967_c11_e574
BIN_OP_EQ_uxn_opcodes_h_l1967_c11_e574 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1967_c11_e574_left,
BIN_OP_EQ_uxn_opcodes_h_l1967_c11_e574_right,
BIN_OP_EQ_uxn_opcodes_h_l1967_c11_e574_return_output);

-- n8_MUX_uxn_opcodes_h_l1967_c7_e7ad
n8_MUX_uxn_opcodes_h_l1967_c7_e7ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond,
n8_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue,
n8_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse,
n8_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad
result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1967_c7_e7ad
result_stack_value_MUX_uxn_opcodes_h_l1967_c7_e7ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond,
result_stack_value_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_e7ad
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_e7ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad
result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_e7ad
result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_e7ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_e7ad
result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_e7ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1970_c11_afbb
BIN_OP_EQ_uxn_opcodes_h_l1970_c11_afbb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1970_c11_afbb_left,
BIN_OP_EQ_uxn_opcodes_h_l1970_c11_afbb_right,
BIN_OP_EQ_uxn_opcodes_h_l1970_c11_afbb_return_output);

-- n8_MUX_uxn_opcodes_h_l1970_c7_f531
n8_MUX_uxn_opcodes_h_l1970_c7_f531 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1970_c7_f531_cond,
n8_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue,
n8_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse,
n8_MUX_uxn_opcodes_h_l1970_c7_f531_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_f531
result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_f531 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_f531_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_f531_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1970_c7_f531
result_stack_value_MUX_uxn_opcodes_h_l1970_c7_f531 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1970_c7_f531_cond,
result_stack_value_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1970_c7_f531_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_f531
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_f531 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_f531_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_f531_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_f531
result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_f531 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_f531_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_f531_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_f531
result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_f531 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_f531_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_f531_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_f531
result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_f531 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_f531_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_f531_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1973_c32_faf2
BIN_OP_AND_uxn_opcodes_h_l1973_c32_faf2 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1973_c32_faf2_left,
BIN_OP_AND_uxn_opcodes_h_l1973_c32_faf2_right,
BIN_OP_AND_uxn_opcodes_h_l1973_c32_faf2_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1973_c32_f9e3
BIN_OP_GT_uxn_opcodes_h_l1973_c32_f9e3 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1973_c32_f9e3_left,
BIN_OP_GT_uxn_opcodes_h_l1973_c32_f9e3_right,
BIN_OP_GT_uxn_opcodes_h_l1973_c32_f9e3_return_output);

-- MUX_uxn_opcodes_h_l1973_c32_d4b5
MUX_uxn_opcodes_h_l1973_c32_d4b5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1973_c32_d4b5_cond,
MUX_uxn_opcodes_h_l1973_c32_d4b5_iftrue,
MUX_uxn_opcodes_h_l1973_c32_d4b5_iffalse,
MUX_uxn_opcodes_h_l1973_c32_d4b5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1975_c11_f784
BIN_OP_EQ_uxn_opcodes_h_l1975_c11_f784 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1975_c11_f784_left,
BIN_OP_EQ_uxn_opcodes_h_l1975_c11_f784_right,
BIN_OP_EQ_uxn_opcodes_h_l1975_c11_f784_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1975_c7_8591
result_stack_value_MUX_uxn_opcodes_h_l1975_c7_8591 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1975_c7_8591_cond,
result_stack_value_MUX_uxn_opcodes_h_l1975_c7_8591_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1975_c7_8591_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1975_c7_8591_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_8591
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_8591 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_8591_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_8591_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_8591_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_8591_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_8591
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_8591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_8591_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_8591_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_8591_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_8591_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_8591
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_8591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_8591_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_8591_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_8591_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_8591_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_8591
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_8591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_8591_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_8591_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_8591_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_8591_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1979_c24_d1f5
BIN_OP_GT_uxn_opcodes_h_l1979_c24_d1f5 : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1979_c24_d1f5_left,
BIN_OP_GT_uxn_opcodes_h_l1979_c24_d1f5_right,
BIN_OP_GT_uxn_opcodes_h_l1979_c24_d1f5_return_output);

-- MUX_uxn_opcodes_h_l1979_c24_3737
MUX_uxn_opcodes_h_l1979_c24_3737 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1979_c24_3737_cond,
MUX_uxn_opcodes_h_l1979_c24_3737_iftrue,
MUX_uxn_opcodes_h_l1979_c24_3737_iffalse,
MUX_uxn_opcodes_h_l1979_c24_3737_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1981_c11_81f1
BIN_OP_EQ_uxn_opcodes_h_l1981_c11_81f1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1981_c11_81f1_left,
BIN_OP_EQ_uxn_opcodes_h_l1981_c11_81f1_right,
BIN_OP_EQ_uxn_opcodes_h_l1981_c11_81f1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_ac6b
result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_ac6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_ac6b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_ac6b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_ac6b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_ac6b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_ac6b
result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_ac6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_ac6b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_ac6b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_ac6b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_ac6b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1955_c6_681e_return_output,
 n8_MUX_uxn_opcodes_h_l1955_c2_d307_return_output,
 t8_MUX_uxn_opcodes_h_l1955_c2_d307_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_d307_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1955_c2_d307_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_d307_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_d307_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_d307_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_d307_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1960_c11_dfd8_return_output,
 n8_MUX_uxn_opcodes_h_l1960_c7_547a_return_output,
 t8_MUX_uxn_opcodes_h_l1960_c7_547a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_547a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1960_c7_547a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_547a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_547a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_547a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_547a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3fc_return_output,
 n8_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output,
 t8_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1967_c11_e574_return_output,
 n8_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1970_c11_afbb_return_output,
 n8_MUX_uxn_opcodes_h_l1970_c7_f531_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_f531_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1970_c7_f531_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_f531_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_f531_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_f531_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_f531_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1973_c32_faf2_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1973_c32_f9e3_return_output,
 MUX_uxn_opcodes_h_l1973_c32_d4b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1975_c11_f784_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1975_c7_8591_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_8591_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_8591_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_8591_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_8591_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1979_c24_d1f5_return_output,
 MUX_uxn_opcodes_h_l1979_c24_3737_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1981_c11_81f1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_ac6b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_ac6b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_681e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_681e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_681e_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1960_c7_547a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1955_c2_d307_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1955_c2_d307_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1960_c7_547a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1955_c2_d307_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1955_c2_d307_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_547a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_d307_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_d307_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_547a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c2_d307_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c2_d307_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_2ec0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_547a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_d307_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_d307_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_547a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_d307_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_d307_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_547a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_d307_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_d307_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_547a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_d307_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_d307_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_dfd8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_dfd8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_dfd8_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1960_c7_547a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1960_c7_547a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_547a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_547a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1961_c3_869a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_547a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_547a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_547a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_547a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3fc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3fc_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1963_c7_ad64_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1963_c7_ad64_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad64_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1965_c3_e82b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad64_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad64_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad64_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_e574_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_e574_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_e574_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1970_c7_f531_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_f531_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1970_c7_f531_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1968_c3_a64c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_f531_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_f531_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_f531_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_f531_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_afbb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_afbb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_afbb_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1970_c7_f531_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_f531_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_8591_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1970_c7_f531_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_8591_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_f531_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_8591_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_f531_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_8591_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_f531_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_8591_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_f531_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1973_c32_d4b5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1973_c32_d4b5_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1973_c32_d4b5_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1973_c32_faf2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1973_c32_faf2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1973_c32_faf2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1973_c32_f9e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1973_c32_f9e3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1973_c32_f9e3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1973_c32_d4b5_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_f784_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_f784_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_f784_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_8591_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_8591_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_8591_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_8591_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1978_c3_cc16 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_8591_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_8591_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_8591_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_8591_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_8591_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_8591_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_8591_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_ac6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_8591_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_8591_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_8591_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_ac6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_8591_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1979_c24_3737_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1979_c24_3737_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1979_c24_3737_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1979_c24_d1f5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1979_c24_d1f5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1979_c24_d1f5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1979_c24_3737_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_81f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_81f1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_81f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_ac6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_ac6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_ac6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_ac6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_ac6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_ac6b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1960_l1955_l1970_l1967_l1963_DUPLICATE_2f09_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1960_l1955_l1975_l1970_l1967_l1963_DUPLICATE_0fd1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1960_l1955_l1975_l1967_l1963_DUPLICATE_4576_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1960_l1955_l1981_l1970_l1967_l1963_DUPLICATE_b8ed_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1960_l1981_l1975_l1970_l1967_l1963_DUPLICATE_70b5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1970_l1975_DUPLICATE_d9a9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1986_l1951_DUPLICATE_6069_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3fc_right := to_unsigned(2, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1973_c32_faf2_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_dfd8_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1973_c32_d4b5_iffalse := resize(to_signed(-1, 2), 8);
     VAR_MUX_uxn_opcodes_h_l1979_c24_3737_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1965_c3_e82b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1965_c3_e82b;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_ac6b_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_ac6b_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1973_c32_d4b5_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_8591_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1978_c3_cc16 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_8591_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1978_c3_cc16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_81f1_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1961_c3_869a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1961_c3_869a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_2ec0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_2ec0;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_8591_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_f784_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_afbb_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_681e_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1968_c3_a64c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1968_c3_a64c;
     VAR_MUX_uxn_opcodes_h_l1979_c24_3737_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1973_c32_f9e3_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_e574_right := to_unsigned(3, 2);

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l1973_c32_faf2_left := VAR_ins;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1979_c24_d1f5_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_681e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_dfd8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3fc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_e574_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_afbb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_f784_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_81f1_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1979_c24_d1f5_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1960_l1955_l1981_l1970_l1967_l1963_DUPLICATE_b8ed LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1960_l1955_l1981_l1970_l1967_l1963_DUPLICATE_b8ed_return_output := result.is_stack_write;

     -- BIN_OP_GT[uxn_opcodes_h_l1979_c24_d1f5] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1979_c24_d1f5_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1979_c24_d1f5_left;
     BIN_OP_GT_uxn_opcodes_h_l1979_c24_d1f5_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1979_c24_d1f5_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1979_c24_d1f5_return_output := BIN_OP_GT_uxn_opcodes_h_l1979_c24_d1f5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1967_c11_e574] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1967_c11_e574_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_e574_left;
     BIN_OP_EQ_uxn_opcodes_h_l1967_c11_e574_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_e574_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_e574_return_output := BIN_OP_EQ_uxn_opcodes_h_l1967_c11_e574_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1975_c11_f784] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1975_c11_f784_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_f784_left;
     BIN_OP_EQ_uxn_opcodes_h_l1975_c11_f784_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_f784_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_f784_return_output := BIN_OP_EQ_uxn_opcodes_h_l1975_c11_f784_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1960_l1955_l1970_l1967_l1963_DUPLICATE_2f09 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1960_l1955_l1970_l1967_l1963_DUPLICATE_2f09_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1970_c11_afbb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1970_c11_afbb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_afbb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1970_c11_afbb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_afbb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_afbb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1970_c11_afbb_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1970_l1975_DUPLICATE_d9a9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1970_l1975_DUPLICATE_d9a9_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1981_c11_81f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1981_c11_81f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_81f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1981_c11_81f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_81f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_81f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1981_c11_81f1_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1973_c32_faf2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1973_c32_faf2_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1973_c32_faf2_left;
     BIN_OP_AND_uxn_opcodes_h_l1973_c32_faf2_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1973_c32_faf2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1973_c32_faf2_return_output := BIN_OP_AND_uxn_opcodes_h_l1973_c32_faf2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1960_c11_dfd8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1960_c11_dfd8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_dfd8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1960_c11_dfd8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_dfd8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_dfd8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1960_c11_dfd8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1955_c6_681e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1955_c6_681e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_681e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1955_c6_681e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_681e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_681e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1955_c6_681e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1960_l1981_l1975_l1970_l1967_l1963_DUPLICATE_70b5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1960_l1981_l1975_l1970_l1967_l1963_DUPLICATE_70b5_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1960_l1955_l1975_l1967_l1963_DUPLICATE_4576 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1960_l1955_l1975_l1967_l1963_DUPLICATE_4576_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1960_l1955_l1975_l1970_l1967_l1963_DUPLICATE_0fd1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1960_l1955_l1975_l1970_l1967_l1963_DUPLICATE_0fd1_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1963_c11_a3fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3fc_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1973_c32_f9e3_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1973_c32_faf2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1955_c2_d307_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_681e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_d307_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_681e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_d307_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_681e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_d307_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_681e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_d307_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_681e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_d307_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_681e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c2_d307_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_681e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1955_c2_d307_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_681e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1960_c7_547a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_dfd8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_547a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_dfd8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_547a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_dfd8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_547a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_dfd8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_547a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_dfd8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_547a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_dfd8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_547a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_dfd8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1960_c7_547a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_dfd8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1963_c7_ad64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3fc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3fc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1963_c7_ad64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3fc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_e574_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_e574_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_e574_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_e574_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_e574_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_e574_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_e574_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1970_c7_f531_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_afbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_f531_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_afbb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_f531_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_afbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_f531_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_afbb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_f531_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_afbb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_f531_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_afbb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1970_c7_f531_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_afbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_8591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_f784_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_8591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_f784_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_8591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_f784_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_8591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_f784_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_8591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_f784_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_ac6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_81f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_ac6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_81f1_return_output;
     VAR_MUX_uxn_opcodes_h_l1979_c24_3737_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1979_c24_d1f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1960_l1955_l1970_l1967_l1963_DUPLICATE_2f09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1960_l1955_l1970_l1967_l1963_DUPLICATE_2f09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1960_l1955_l1970_l1967_l1963_DUPLICATE_2f09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1960_l1955_l1970_l1967_l1963_DUPLICATE_2f09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1960_l1955_l1970_l1967_l1963_DUPLICATE_2f09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1960_l1981_l1975_l1970_l1967_l1963_DUPLICATE_70b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1960_l1981_l1975_l1970_l1967_l1963_DUPLICATE_70b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1960_l1981_l1975_l1970_l1967_l1963_DUPLICATE_70b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1960_l1981_l1975_l1970_l1967_l1963_DUPLICATE_70b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_8591_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1960_l1981_l1975_l1970_l1967_l1963_DUPLICATE_70b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_ac6b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1960_l1981_l1975_l1970_l1967_l1963_DUPLICATE_70b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1960_l1955_l1975_l1967_l1963_DUPLICATE_4576_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1960_l1955_l1975_l1967_l1963_DUPLICATE_4576_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1960_l1955_l1975_l1967_l1963_DUPLICATE_4576_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1960_l1955_l1975_l1967_l1963_DUPLICATE_4576_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_8591_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1960_l1955_l1975_l1967_l1963_DUPLICATE_4576_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1960_l1955_l1981_l1970_l1967_l1963_DUPLICATE_b8ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1960_l1955_l1981_l1970_l1967_l1963_DUPLICATE_b8ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1960_l1955_l1981_l1970_l1967_l1963_DUPLICATE_b8ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1960_l1955_l1981_l1970_l1967_l1963_DUPLICATE_b8ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1960_l1955_l1981_l1970_l1967_l1963_DUPLICATE_b8ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_ac6b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1960_l1955_l1981_l1970_l1967_l1963_DUPLICATE_b8ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1970_l1975_DUPLICATE_d9a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_8591_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1970_l1975_DUPLICATE_d9a9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1960_l1955_l1975_l1970_l1967_l1963_DUPLICATE_0fd1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1960_l1955_l1975_l1970_l1967_l1963_DUPLICATE_0fd1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1960_l1955_l1975_l1970_l1967_l1963_DUPLICATE_0fd1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1960_l1955_l1975_l1970_l1967_l1963_DUPLICATE_0fd1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1960_l1955_l1975_l1970_l1967_l1963_DUPLICATE_0fd1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_8591_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1960_l1955_l1975_l1970_l1967_l1963_DUPLICATE_0fd1_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l1973_c32_f9e3] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1973_c32_f9e3_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1973_c32_f9e3_left;
     BIN_OP_GT_uxn_opcodes_h_l1973_c32_f9e3_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1973_c32_f9e3_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1973_c32_f9e3_return_output := BIN_OP_GT_uxn_opcodes_h_l1973_c32_f9e3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1975_c7_8591] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_8591_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_8591_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_8591_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_8591_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_8591_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_8591_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_8591_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_8591_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1981_c7_ac6b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_ac6b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_ac6b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_ac6b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_ac6b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_ac6b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_ac6b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_ac6b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_ac6b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1975_c7_8591] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_8591_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_8591_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_8591_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_8591_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_8591_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_8591_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_8591_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_8591_return_output;

     -- MUX[uxn_opcodes_h_l1979_c24_3737] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1979_c24_3737_cond <= VAR_MUX_uxn_opcodes_h_l1979_c24_3737_cond;
     MUX_uxn_opcodes_h_l1979_c24_3737_iftrue <= VAR_MUX_uxn_opcodes_h_l1979_c24_3737_iftrue;
     MUX_uxn_opcodes_h_l1979_c24_3737_iffalse <= VAR_MUX_uxn_opcodes_h_l1979_c24_3737_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1979_c24_3737_return_output := MUX_uxn_opcodes_h_l1979_c24_3737_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1981_c7_ac6b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_ac6b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_ac6b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_ac6b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_ac6b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_ac6b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_ac6b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_ac6b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_ac6b_return_output;

     -- n8_MUX[uxn_opcodes_h_l1970_c7_f531] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1970_c7_f531_cond <= VAR_n8_MUX_uxn_opcodes_h_l1970_c7_f531_cond;
     n8_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue;
     n8_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1970_c7_f531_return_output := n8_MUX_uxn_opcodes_h_l1970_c7_f531_return_output;

     -- t8_MUX[uxn_opcodes_h_l1963_c7_ad64] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1963_c7_ad64_cond <= VAR_t8_MUX_uxn_opcodes_h_l1963_c7_ad64_cond;
     t8_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue;
     t8_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output := t8_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1973_c32_d4b5_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1973_c32_f9e3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_8591_iftrue := VAR_MUX_uxn_opcodes_h_l1979_c24_3737_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1970_c7_f531_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_8591_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_ac6b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_8591_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_8591_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_ac6b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_8591_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1975_c7_8591] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_8591_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_8591_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_8591_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_8591_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_8591_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_8591_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_8591_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_8591_return_output;

     -- t8_MUX[uxn_opcodes_h_l1960_c7_547a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1960_c7_547a_cond <= VAR_t8_MUX_uxn_opcodes_h_l1960_c7_547a_cond;
     t8_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue;
     t8_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1960_c7_547a_return_output := t8_MUX_uxn_opcodes_h_l1960_c7_547a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1975_c7_8591] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_8591_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_8591_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_8591_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_8591_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_8591_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_8591_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_8591_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_8591_return_output;

     -- n8_MUX[uxn_opcodes_h_l1967_c7_e7ad] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond <= VAR_n8_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond;
     n8_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue;
     n8_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output := n8_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output;

     -- MUX[uxn_opcodes_h_l1973_c32_d4b5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1973_c32_d4b5_cond <= VAR_MUX_uxn_opcodes_h_l1973_c32_d4b5_cond;
     MUX_uxn_opcodes_h_l1973_c32_d4b5_iftrue <= VAR_MUX_uxn_opcodes_h_l1973_c32_d4b5_iftrue;
     MUX_uxn_opcodes_h_l1973_c32_d4b5_iffalse <= VAR_MUX_uxn_opcodes_h_l1973_c32_d4b5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1973_c32_d4b5_return_output := MUX_uxn_opcodes_h_l1973_c32_d4b5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1970_c7_f531] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_f531_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_f531_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_f531_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_f531_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1975_c7_8591] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1975_c7_8591_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_8591_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1975_c7_8591_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_8591_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1975_c7_8591_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_8591_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_8591_return_output := result_stack_value_MUX_uxn_opcodes_h_l1975_c7_8591_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1970_c7_f531] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_f531_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_f531_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_f531_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_f531_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue := VAR_MUX_uxn_opcodes_h_l1973_c32_d4b5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_8591_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_f531_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_8591_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_f531_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_8591_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1960_c7_547a_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1967_c7_e7ad] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output;

     -- n8_MUX[uxn_opcodes_h_l1963_c7_ad64] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1963_c7_ad64_cond <= VAR_n8_MUX_uxn_opcodes_h_l1963_c7_ad64_cond;
     n8_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue;
     n8_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output := n8_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1970_c7_f531] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_f531_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_f531_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_f531_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_f531_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1970_c7_f531] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1970_c7_f531_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1970_c7_f531_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1970_c7_f531_return_output := result_stack_value_MUX_uxn_opcodes_h_l1970_c7_f531_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1970_c7_f531] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_f531_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_f531_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_f531_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_f531_return_output;

     -- t8_MUX[uxn_opcodes_h_l1955_c2_d307] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1955_c2_d307_cond <= VAR_t8_MUX_uxn_opcodes_h_l1955_c2_d307_cond;
     t8_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue;
     t8_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1955_c2_d307_return_output := t8_MUX_uxn_opcodes_h_l1955_c2_d307_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1970_c7_f531] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_f531_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_f531_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_f531_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_f531_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_f531_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_f531_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1967_c7_e7ad] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_f531_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_f531_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_f531_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1970_c7_f531_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1955_c2_d307_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1967_c7_e7ad] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output;

     -- n8_MUX[uxn_opcodes_h_l1960_c7_547a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1960_c7_547a_cond <= VAR_n8_MUX_uxn_opcodes_h_l1960_c7_547a_cond;
     n8_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue;
     n8_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1960_c7_547a_return_output := n8_MUX_uxn_opcodes_h_l1960_c7_547a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1967_c7_e7ad] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1967_c7_e7ad] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output := result_stack_value_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1963_c7_ad64] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1967_c7_e7ad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_e7ad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_e7ad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_e7ad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1963_c7_ad64] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad64_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad64_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1960_c7_547a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_e7ad_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1963_c7_ad64] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1963_c7_ad64] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad64_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad64_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output := result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1963_c7_ad64] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad64_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad64_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1960_c7_547a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_547a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_547a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_547a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_547a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1960_c7_547a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_547a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_547a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_547a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_547a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1963_c7_ad64] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad64_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad64_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad64_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad64_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output;

     -- n8_MUX[uxn_opcodes_h_l1955_c2_d307] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1955_c2_d307_cond <= VAR_n8_MUX_uxn_opcodes_h_l1955_c2_d307_cond;
     n8_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue;
     n8_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1955_c2_d307_return_output := n8_MUX_uxn_opcodes_h_l1955_c2_d307_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1955_c2_d307_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_547a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_547a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_ad64_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1955_c2_d307] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_d307_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_d307_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_d307_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_d307_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1960_c7_547a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_547a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_547a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_547a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_547a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1960_c7_547a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1960_c7_547a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_547a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_547a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1960_c7_547a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1955_c2_d307] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_d307_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_d307_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_d307_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_d307_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1960_c7_547a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_547a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_547a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_547a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_547a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1960_c7_547a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_547a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_547a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_547a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_547a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_547a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_547a_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_547a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_547a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_547a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_547a_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1955_c2_d307] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1955_c2_d307_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c2_d307_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c2_d307_return_output := result_stack_value_MUX_uxn_opcodes_h_l1955_c2_d307_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1955_c2_d307] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_d307_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_d307_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_d307_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_d307_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1955_c2_d307] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_d307_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_d307_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_d307_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_d307_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1955_c2_d307] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_d307_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_d307_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_d307_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_d307_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_d307_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_d307_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1986_l1951_DUPLICATE_6069 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1986_l1951_DUPLICATE_6069_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_d307_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c2_d307_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_d307_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_d307_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_d307_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_d307_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1986_l1951_DUPLICATE_6069_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1986_l1951_DUPLICATE_6069_return_output;
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
