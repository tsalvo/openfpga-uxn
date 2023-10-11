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
-- Submodules: 58
entity stz_0CLK_3220bbf1 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz_0CLK_3220bbf1;
architecture arch of stz_0CLK_3220bbf1 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1638_c6_c8c7]
signal BIN_OP_EQ_uxn_opcodes_h_l1638_c6_c8c7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1638_c6_c8c7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1638_c6_c8c7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1638_c1_e0cd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1638_c1_e0cd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1638_c1_e0cd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1638_c1_e0cd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1638_c1_e0cd_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1638_c2_3c95]
signal t8_MUX_uxn_opcodes_h_l1638_c2_3c95_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1638_c2_3c95]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_3c95_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1638_c2_3c95]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1638_c2_3c95]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_3c95_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1638_c2_3c95]
signal result_ram_addr_MUX_uxn_opcodes_h_l1638_c2_3c95_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1638_c2_3c95]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1638_c2_3c95]
signal result_ram_value_MUX_uxn_opcodes_h_l1638_c2_3c95_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1638_c2_3c95]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_3c95_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1638_c2_3c95]
signal n8_MUX_uxn_opcodes_h_l1638_c2_3c95_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1639_c3_94cf[uxn_opcodes_h_l1639_c3_94cf]
signal printf_uxn_opcodes_h_l1639_c3_94cf_uxn_opcodes_h_l1639_c3_94cf_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1643_c11_e08f]
signal BIN_OP_EQ_uxn_opcodes_h_l1643_c11_e08f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1643_c11_e08f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1643_c11_e08f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1643_c7_fceb]
signal t8_MUX_uxn_opcodes_h_l1643_c7_fceb_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1643_c7_fceb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_fceb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1643_c7_fceb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1643_c7_fceb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_fceb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1643_c7_fceb]
signal result_ram_addr_MUX_uxn_opcodes_h_l1643_c7_fceb_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1643_c7_fceb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1643_c7_fceb]
signal result_ram_value_MUX_uxn_opcodes_h_l1643_c7_fceb_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1643_c7_fceb]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1643_c7_fceb_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1643_c7_fceb]
signal n8_MUX_uxn_opcodes_h_l1643_c7_fceb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1646_c11_041d]
signal BIN_OP_EQ_uxn_opcodes_h_l1646_c11_041d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1646_c11_041d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1646_c11_041d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1646_c7_965d]
signal t8_MUX_uxn_opcodes_h_l1646_c7_965d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1646_c7_965d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1646_c7_965d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_965d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_965d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1646_c7_965d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_965d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_965d_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1646_c7_965d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_965d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_965d_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1646_c7_965d]
signal result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_965d_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_965d_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1646_c7_965d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_965d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_965d_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1646_c7_965d]
signal result_ram_value_MUX_uxn_opcodes_h_l1646_c7_965d_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1646_c7_965d_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1646_c7_965d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_965d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_965d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1646_c7_965d]
signal n8_MUX_uxn_opcodes_h_l1646_c7_965d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1646_c7_965d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1650_c11_14a7]
signal BIN_OP_EQ_uxn_opcodes_h_l1650_c11_14a7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1650_c11_14a7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1650_c11_14a7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1650_c7_2d0f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1650_c7_2d0f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1650_c7_2d0f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1650_c7_2d0f]
signal result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1650_c7_2d0f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1650_c7_2d0f]
signal result_ram_value_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1650_c7_2d0f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1650_c7_2d0f]
signal n8_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1653_c11_c29f]
signal BIN_OP_EQ_uxn_opcodes_h_l1653_c11_c29f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1653_c11_c29f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1653_c11_c29f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1653_c7_b99e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1653_c7_b99e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_b99e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1653_c7_b99e]
signal result_ram_addr_MUX_uxn_opcodes_h_l1653_c7_b99e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1653_c7_b99e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1653_c7_b99e]
signal result_ram_value_MUX_uxn_opcodes_h_l1653_c7_b99e_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1653_c7_b99e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_b99e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1653_c7_b99e]
signal n8_MUX_uxn_opcodes_h_l1653_c7_b99e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1656_c32_cff6]
signal BIN_OP_AND_uxn_opcodes_h_l1656_c32_cff6_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1656_c32_cff6_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1656_c32_cff6_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1656_c32_f0f9]
signal BIN_OP_GT_uxn_opcodes_h_l1656_c32_f0f9_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1656_c32_f0f9_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1656_c32_f0f9_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1656_c32_b65d]
signal MUX_uxn_opcodes_h_l1656_c32_b65d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1656_c32_b65d_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1656_c32_b65d_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1656_c32_b65d_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1661_c11_c0dd]
signal BIN_OP_EQ_uxn_opcodes_h_l1661_c11_c0dd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1661_c11_c0dd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1661_c11_c0dd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1661_c7_6587]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_6587_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_6587_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_6587_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_6587_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1661_c7_6587]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_6587_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_6587_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_6587_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_6587_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1661_c7_6587]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_6587_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_6587_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_6587_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_6587_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.ram_addr := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.ram_value := ref_toks_6;
      base.is_ram_write := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1638_c6_c8c7
BIN_OP_EQ_uxn_opcodes_h_l1638_c6_c8c7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1638_c6_c8c7_left,
BIN_OP_EQ_uxn_opcodes_h_l1638_c6_c8c7_right,
BIN_OP_EQ_uxn_opcodes_h_l1638_c6_c8c7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1638_c1_e0cd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1638_c1_e0cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1638_c1_e0cd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1638_c1_e0cd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1638_c1_e0cd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1638_c1_e0cd_return_output);

-- t8_MUX_uxn_opcodes_h_l1638_c2_3c95
t8_MUX_uxn_opcodes_h_l1638_c2_3c95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1638_c2_3c95_cond,
t8_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue,
t8_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse,
t8_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_3c95
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_3c95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_3c95_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_3c95
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_3c95 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_3c95
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_3c95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_3c95_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1638_c2_3c95
result_ram_addr_MUX_uxn_opcodes_h_l1638_c2_3c95 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1638_c2_3c95_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c2_3c95
result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c2_3c95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1638_c2_3c95
result_ram_value_MUX_uxn_opcodes_h_l1638_c2_3c95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1638_c2_3c95_cond,
result_ram_value_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_3c95
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_3c95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_3c95_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output);

-- n8_MUX_uxn_opcodes_h_l1638_c2_3c95
n8_MUX_uxn_opcodes_h_l1638_c2_3c95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1638_c2_3c95_cond,
n8_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue,
n8_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse,
n8_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output);

-- printf_uxn_opcodes_h_l1639_c3_94cf_uxn_opcodes_h_l1639_c3_94cf
printf_uxn_opcodes_h_l1639_c3_94cf_uxn_opcodes_h_l1639_c3_94cf : entity work.printf_uxn_opcodes_h_l1639_c3_94cf_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1639_c3_94cf_uxn_opcodes_h_l1639_c3_94cf_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1643_c11_e08f
BIN_OP_EQ_uxn_opcodes_h_l1643_c11_e08f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1643_c11_e08f_left,
BIN_OP_EQ_uxn_opcodes_h_l1643_c11_e08f_right,
BIN_OP_EQ_uxn_opcodes_h_l1643_c11_e08f_return_output);

-- t8_MUX_uxn_opcodes_h_l1643_c7_fceb
t8_MUX_uxn_opcodes_h_l1643_c7_fceb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1643_c7_fceb_cond,
t8_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue,
t8_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse,
t8_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_fceb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_fceb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_fceb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c7_fceb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c7_fceb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_fceb
result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_fceb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_fceb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1643_c7_fceb
result_ram_addr_MUX_uxn_opcodes_h_l1643_c7_fceb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1643_c7_fceb_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_fceb
result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_fceb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1643_c7_fceb
result_ram_value_MUX_uxn_opcodes_h_l1643_c7_fceb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1643_c7_fceb_cond,
result_ram_value_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1643_c7_fceb
result_is_ram_write_MUX_uxn_opcodes_h_l1643_c7_fceb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1643_c7_fceb_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output);

-- n8_MUX_uxn_opcodes_h_l1643_c7_fceb
n8_MUX_uxn_opcodes_h_l1643_c7_fceb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1643_c7_fceb_cond,
n8_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue,
n8_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse,
n8_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1646_c11_041d
BIN_OP_EQ_uxn_opcodes_h_l1646_c11_041d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1646_c11_041d_left,
BIN_OP_EQ_uxn_opcodes_h_l1646_c11_041d_right,
BIN_OP_EQ_uxn_opcodes_h_l1646_c11_041d_return_output);

-- t8_MUX_uxn_opcodes_h_l1646_c7_965d
t8_MUX_uxn_opcodes_h_l1646_c7_965d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1646_c7_965d_cond,
t8_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue,
t8_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse,
t8_MUX_uxn_opcodes_h_l1646_c7_965d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_965d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_965d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_965d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_965d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_965d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_965d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_965d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_965d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_965d
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_965d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_965d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_965d_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_965d
result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_965d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_965d_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_965d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_965d
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_965d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_965d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_965d_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1646_c7_965d
result_ram_value_MUX_uxn_opcodes_h_l1646_c7_965d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1646_c7_965d_cond,
result_ram_value_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1646_c7_965d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_965d
result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_965d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_965d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_965d_return_output);

-- n8_MUX_uxn_opcodes_h_l1646_c7_965d
n8_MUX_uxn_opcodes_h_l1646_c7_965d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1646_c7_965d_cond,
n8_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue,
n8_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse,
n8_MUX_uxn_opcodes_h_l1646_c7_965d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1650_c11_14a7
BIN_OP_EQ_uxn_opcodes_h_l1650_c11_14a7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1650_c11_14a7_left,
BIN_OP_EQ_uxn_opcodes_h_l1650_c11_14a7_right,
BIN_OP_EQ_uxn_opcodes_h_l1650_c11_14a7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_2d0f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_2d0f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_2d0f
result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_2d0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_2d0f
result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_2d0f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f
result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1650_c7_2d0f
result_ram_value_MUX_uxn_opcodes_h_l1650_c7_2d0f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond,
result_ram_value_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_2d0f
result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_2d0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output);

-- n8_MUX_uxn_opcodes_h_l1650_c7_2d0f
n8_MUX_uxn_opcodes_h_l1650_c7_2d0f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond,
n8_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue,
n8_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse,
n8_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1653_c11_c29f
BIN_OP_EQ_uxn_opcodes_h_l1653_c11_c29f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1653_c11_c29f_left,
BIN_OP_EQ_uxn_opcodes_h_l1653_c11_c29f_right,
BIN_OP_EQ_uxn_opcodes_h_l1653_c11_c29f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_b99e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_b99e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_b99e
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_b99e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_b99e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1653_c7_b99e
result_ram_addr_MUX_uxn_opcodes_h_l1653_c7_b99e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1653_c7_b99e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_b99e
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_b99e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1653_c7_b99e
result_ram_value_MUX_uxn_opcodes_h_l1653_c7_b99e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1653_c7_b99e_cond,
result_ram_value_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_b99e
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_b99e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_b99e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output);

-- n8_MUX_uxn_opcodes_h_l1653_c7_b99e
n8_MUX_uxn_opcodes_h_l1653_c7_b99e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1653_c7_b99e_cond,
n8_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue,
n8_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse,
n8_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1656_c32_cff6
BIN_OP_AND_uxn_opcodes_h_l1656_c32_cff6 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1656_c32_cff6_left,
BIN_OP_AND_uxn_opcodes_h_l1656_c32_cff6_right,
BIN_OP_AND_uxn_opcodes_h_l1656_c32_cff6_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1656_c32_f0f9
BIN_OP_GT_uxn_opcodes_h_l1656_c32_f0f9 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1656_c32_f0f9_left,
BIN_OP_GT_uxn_opcodes_h_l1656_c32_f0f9_right,
BIN_OP_GT_uxn_opcodes_h_l1656_c32_f0f9_return_output);

-- MUX_uxn_opcodes_h_l1656_c32_b65d
MUX_uxn_opcodes_h_l1656_c32_b65d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1656_c32_b65d_cond,
MUX_uxn_opcodes_h_l1656_c32_b65d_iftrue,
MUX_uxn_opcodes_h_l1656_c32_b65d_iffalse,
MUX_uxn_opcodes_h_l1656_c32_b65d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1661_c11_c0dd
BIN_OP_EQ_uxn_opcodes_h_l1661_c11_c0dd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1661_c11_c0dd_left,
BIN_OP_EQ_uxn_opcodes_h_l1661_c11_c0dd_right,
BIN_OP_EQ_uxn_opcodes_h_l1661_c11_c0dd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_6587
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_6587 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_6587_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_6587_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_6587_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_6587_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_6587
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_6587 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_6587_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_6587_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_6587_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_6587_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_6587
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_6587 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_6587_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_6587_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_6587_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_6587_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1638_c6_c8c7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1638_c1_e0cd_return_output,
 t8_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output,
 n8_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1643_c11_e08f_return_output,
 t8_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output,
 n8_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1646_c11_041d_return_output,
 t8_MUX_uxn_opcodes_h_l1646_c7_965d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_965d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_965d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_965d_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_965d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_965d_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1646_c7_965d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_965d_return_output,
 n8_MUX_uxn_opcodes_h_l1646_c7_965d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1650_c11_14a7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output,
 n8_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1653_c11_c29f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output,
 n8_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1656_c32_cff6_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1656_c32_f0f9_return_output,
 MUX_uxn_opcodes_h_l1656_c32_b65d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1661_c11_c0dd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_6587_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_6587_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_6587_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_c8c7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_c8c7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_c8c7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1638_c1_e0cd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1638_c1_e0cd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1638_c1_e0cd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1638_c1_e0cd_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1638_c2_3c95_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1640_c3_d8f5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_3c95_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_3c95_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1638_c2_3c95_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1638_c2_3c95_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_3c95_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1638_c2_3c95_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1639_c3_94cf_uxn_opcodes_h_l1639_c3_94cf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c11_e08f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c11_e08f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c11_e08f_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1646_c7_965d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1643_c7_fceb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1644_c3_3ef3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_965d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_fceb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_965d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_965d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_fceb_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_965d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1643_c7_fceb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_965d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1646_c7_965d_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1643_c7_fceb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_965d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1643_c7_fceb_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1646_c7_965d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1643_c7_fceb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_041d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_041d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_041d_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1646_c7_965d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1648_c3_0ab2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_965d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_965d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_965d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_965d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_965d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1646_c7_965d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_965d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1646_c7_965d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_14a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_14a7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_14a7_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1651_c3_3591 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1650_c7_2d0f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_c29f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_c29f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_c29f_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_6587_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_b99e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1653_c7_b99e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_6587_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1653_c7_b99e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_6587_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_b99e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1653_c7_b99e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1656_c32_b65d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1656_c32_b65d_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1656_c32_b65d_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1656_c32_cff6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1656_c32_cff6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1656_c32_cff6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1656_c32_f0f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1656_c32_f0f9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1656_c32_f0f9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1656_c32_b65d_return_output : signed(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1658_c21_6760_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_c0dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_c0dd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_c0dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_6587_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_6587_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_6587_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_6587_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_6587_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_6587_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_6587_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_6587_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_6587_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1650_l1646_l1643_l1638_DUPLICATE_2d09_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1653_l1650_l1646_l1643_l1638_DUPLICATE_aeac_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1650_l1646_l1643_l1638_l1661_DUPLICATE_31f3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1653_l1650_l1646_l1643_l1638_DUPLICATE_044c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1650_l1646_l1643_l1638_l1661_DUPLICATE_e708_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1653_l1650_l1646_l1643_l1661_DUPLICATE_fed4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5_uxn_opcodes_h_l1667_l1634_DUPLICATE_5a65_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1640_c3_d8f5 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1640_c3_d8f5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c11_e08f_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1656_c32_b65d_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_c29f_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_c8c7_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_041d_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_14a7_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1644_c3_3ef3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1644_c3_3ef3;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_6587_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1656_c32_b65d_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1651_c3_3591 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1651_c3_3591;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_6587_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1648_c3_0ab2 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1648_c3_0ab2;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_6587_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1638_c1_e0cd_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_c0dd_right := to_unsigned(5, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1656_c32_cff6_right := to_unsigned(128, 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1656_c32_f0f9_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1638_c1_e0cd_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1656_c32_cff6_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_c8c7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c11_e08f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_041d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_14a7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_c29f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_c0dd_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue := VAR_previous_stack_read;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1638_c6_c8c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1638_c6_c8c7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_c8c7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1638_c6_c8c7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_c8c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_c8c7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1638_c6_c8c7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1650_l1646_l1643_l1638_l1661_DUPLICATE_31f3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1650_l1646_l1643_l1638_l1661_DUPLICATE_31f3_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1661_c11_c0dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1661_c11_c0dd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_c0dd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1661_c11_c0dd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_c0dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_c0dd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1661_c11_c0dd_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1650_l1646_l1643_l1638_DUPLICATE_2d09 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1650_l1646_l1643_l1638_DUPLICATE_2d09_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1653_l1650_l1646_l1643_l1638_DUPLICATE_aeac LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1653_l1650_l1646_l1643_l1638_DUPLICATE_aeac_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l1653_c11_c29f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1653_c11_c29f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_c29f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1653_c11_c29f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_c29f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_c29f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1653_c11_c29f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1653_l1650_l1646_l1643_l1661_DUPLICATE_fed4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1653_l1650_l1646_l1643_l1661_DUPLICATE_fed4_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1658_c21_6760] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1658_c21_6760_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1646_c11_041d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1646_c11_041d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_041d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1646_c11_041d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_041d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_041d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1646_c11_041d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1643_c11_e08f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1643_c11_e08f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c11_e08f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1643_c11_e08f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c11_e08f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c11_e08f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1643_c11_e08f_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1650_c7_2d0f] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1650_c7_2d0f_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1650_c11_14a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1650_c11_14a7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_14a7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1650_c11_14a7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_14a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_14a7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1650_c11_14a7_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1653_l1650_l1646_l1643_l1638_DUPLICATE_044c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1653_l1650_l1646_l1643_l1638_DUPLICATE_044c_return_output := result.ram_value;

     -- BIN_OP_AND[uxn_opcodes_h_l1656_c32_cff6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1656_c32_cff6_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1656_c32_cff6_left;
     BIN_OP_AND_uxn_opcodes_h_l1656_c32_cff6_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1656_c32_cff6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1656_c32_cff6_return_output := BIN_OP_AND_uxn_opcodes_h_l1656_c32_cff6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1650_l1646_l1643_l1638_l1661_DUPLICATE_e708 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1650_l1646_l1643_l1638_l1661_DUPLICATE_e708_return_output := result.is_ram_write;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1656_c32_f0f9_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1656_c32_cff6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1638_c1_e0cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_c8c7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1638_c2_3c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_c8c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_3c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_c8c7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_3c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_c8c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_c8c7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1638_c2_3c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_c8c7_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1638_c2_3c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_c8c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_c8c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_3c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_c8c7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1638_c2_3c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_c8c7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1643_c7_fceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c11_e08f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_fceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c11_e08f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1643_c7_fceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c11_e08f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c11_e08f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1643_c7_fceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c11_e08f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1643_c7_fceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c11_e08f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c11_e08f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_fceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c11_e08f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1643_c7_fceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c11_e08f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1646_c7_965d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_041d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_965d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_041d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_965d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_041d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_965d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_041d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_965d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_041d_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1646_c7_965d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_041d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_965d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_041d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_965d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_041d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1646_c7_965d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_041d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_14a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_14a7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_14a7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_14a7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_14a7_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_14a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_14a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_14a7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1653_c7_b99e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_c29f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_b99e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_c29f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_b99e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_c29f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_c29f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1653_c7_b99e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_c29f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1653_c7_b99e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_c29f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_c29f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_6587_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_c0dd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_6587_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_c0dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_6587_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_c0dd_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1658_c21_6760_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1650_l1646_l1643_l1638_DUPLICATE_2d09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1650_l1646_l1643_l1638_DUPLICATE_2d09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1650_l1646_l1643_l1638_DUPLICATE_2d09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1650_l1646_l1643_l1638_DUPLICATE_2d09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1650_l1646_l1643_l1638_DUPLICATE_2d09_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1653_l1650_l1646_l1643_l1638_DUPLICATE_aeac_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1653_l1650_l1646_l1643_l1638_DUPLICATE_aeac_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1653_l1650_l1646_l1643_l1638_DUPLICATE_aeac_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1653_l1650_l1646_l1643_l1638_DUPLICATE_aeac_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1653_l1650_l1646_l1643_l1638_DUPLICATE_aeac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1653_l1650_l1646_l1643_l1661_DUPLICATE_fed4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1653_l1650_l1646_l1643_l1661_DUPLICATE_fed4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1653_l1650_l1646_l1643_l1661_DUPLICATE_fed4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1653_l1650_l1646_l1643_l1661_DUPLICATE_fed4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_6587_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1653_l1650_l1646_l1643_l1661_DUPLICATE_fed4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1650_l1646_l1643_l1638_l1661_DUPLICATE_e708_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1650_l1646_l1643_l1638_l1661_DUPLICATE_e708_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1650_l1646_l1643_l1638_l1661_DUPLICATE_e708_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1650_l1646_l1643_l1638_l1661_DUPLICATE_e708_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_6587_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1650_l1646_l1643_l1638_l1661_DUPLICATE_e708_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1650_l1646_l1643_l1638_l1661_DUPLICATE_31f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1650_l1646_l1643_l1638_l1661_DUPLICATE_31f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1650_l1646_l1643_l1638_l1661_DUPLICATE_31f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1650_l1646_l1643_l1638_l1661_DUPLICATE_31f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_6587_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1650_l1646_l1643_l1638_l1661_DUPLICATE_31f3_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1653_l1650_l1646_l1643_l1638_DUPLICATE_044c_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1653_l1650_l1646_l1643_l1638_DUPLICATE_044c_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1653_l1650_l1646_l1643_l1638_DUPLICATE_044c_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1653_l1650_l1646_l1643_l1638_DUPLICATE_044c_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1653_l1650_l1646_l1643_l1638_DUPLICATE_044c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1650_c7_2d0f_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l1656_c32_f0f9] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1656_c32_f0f9_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1656_c32_f0f9_left;
     BIN_OP_GT_uxn_opcodes_h_l1656_c32_f0f9_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1656_c32_f0f9_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1656_c32_f0f9_return_output := BIN_OP_GT_uxn_opcodes_h_l1656_c32_f0f9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1650_c7_2d0f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1661_c7_6587] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_6587_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_6587_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_6587_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_6587_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_6587_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_6587_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_6587_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_6587_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1661_c7_6587] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_6587_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_6587_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_6587_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_6587_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_6587_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_6587_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_6587_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_6587_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1653_c7_b99e] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1653_c7_b99e_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1653_c7_b99e_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output := result_ram_value_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output;

     -- t8_MUX[uxn_opcodes_h_l1646_c7_965d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1646_c7_965d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1646_c7_965d_cond;
     t8_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue;
     t8_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1646_c7_965d_return_output := t8_MUX_uxn_opcodes_h_l1646_c7_965d_return_output;

     -- n8_MUX[uxn_opcodes_h_l1653_c7_b99e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1653_c7_b99e_cond <= VAR_n8_MUX_uxn_opcodes_h_l1653_c7_b99e_cond;
     n8_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue;
     n8_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output := n8_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1653_c7_b99e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1653_c7_b99e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1653_c7_b99e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1661_c7_6587] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_6587_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_6587_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_6587_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_6587_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_6587_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_6587_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_6587_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_6587_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1638_c1_e0cd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1638_c1_e0cd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1638_c1_e0cd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1638_c1_e0cd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1638_c1_e0cd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1638_c1_e0cd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1638_c1_e0cd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1638_c1_e0cd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1638_c1_e0cd_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1656_c32_b65d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1656_c32_f0f9_return_output;
     VAR_printf_uxn_opcodes_h_l1639_c3_94cf_uxn_opcodes_h_l1639_c3_94cf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1638_c1_e0cd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_6587_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_6587_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_6587_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1646_c7_965d_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1650_c7_2d0f] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1653_c7_b99e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1653_c7_b99e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_b99e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_b99e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output;

     -- MUX[uxn_opcodes_h_l1656_c32_b65d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1656_c32_b65d_cond <= VAR_MUX_uxn_opcodes_h_l1656_c32_b65d_cond;
     MUX_uxn_opcodes_h_l1656_c32_b65d_iftrue <= VAR_MUX_uxn_opcodes_h_l1656_c32_b65d_iftrue;
     MUX_uxn_opcodes_h_l1656_c32_b65d_iffalse <= VAR_MUX_uxn_opcodes_h_l1656_c32_b65d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1656_c32_b65d_return_output := MUX_uxn_opcodes_h_l1656_c32_b65d_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1650_c7_2d0f] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output := result_ram_value_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1653_c7_b99e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_b99e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_b99e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output;

     -- n8_MUX[uxn_opcodes_h_l1650_c7_2d0f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond <= VAR_n8_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond;
     n8_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue;
     n8_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output := n8_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output;

     -- t8_MUX[uxn_opcodes_h_l1643_c7_fceb] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1643_c7_fceb_cond <= VAR_t8_MUX_uxn_opcodes_h_l1643_c7_fceb_cond;
     t8_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue;
     t8_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output := t8_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1646_c7_965d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_965d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_965d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_965d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_965d_return_output;

     -- printf_uxn_opcodes_h_l1639_c3_94cf[uxn_opcodes_h_l1639_c3_94cf] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1639_c3_94cf_uxn_opcodes_h_l1639_c3_94cf_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1639_c3_94cf_uxn_opcodes_h_l1639_c3_94cf_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue := VAR_MUX_uxn_opcodes_h_l1656_c32_b65d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_965d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1643_c7_fceb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_fceb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_fceb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1650_c7_2d0f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1650_c7_2d0f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output;

     -- t8_MUX[uxn_opcodes_h_l1638_c2_3c95] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1638_c2_3c95_cond <= VAR_t8_MUX_uxn_opcodes_h_l1638_c2_3c95_cond;
     t8_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue;
     t8_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output := t8_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output;

     -- n8_MUX[uxn_opcodes_h_l1646_c7_965d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1646_c7_965d_cond <= VAR_n8_MUX_uxn_opcodes_h_l1646_c7_965d_cond;
     n8_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue;
     n8_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1646_c7_965d_return_output := n8_MUX_uxn_opcodes_h_l1646_c7_965d_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1646_c7_965d] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1646_c7_965d_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1646_c7_965d_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1646_c7_965d_return_output := result_ram_value_MUX_uxn_opcodes_h_l1646_c7_965d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1650_c7_2d0f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1646_c7_965d] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_965d_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_965d_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_965d_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_965d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1653_c7_b99e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1646_c7_965d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_965d_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1646_c7_965d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_b99e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1638_c2_3c95] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_3c95_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_3c95_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1646_c7_965d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_965d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_965d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_965d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_965d_return_output;

     -- n8_MUX[uxn_opcodes_h_l1643_c7_fceb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1643_c7_fceb_cond <= VAR_n8_MUX_uxn_opcodes_h_l1643_c7_fceb_cond;
     n8_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue;
     n8_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output := n8_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1643_c7_fceb] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1643_c7_fceb_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1643_c7_fceb_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1650_c7_2d0f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1643_c7_fceb] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1643_c7_fceb_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1643_c7_fceb_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output := result_ram_value_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1646_c7_965d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_965d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_965d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_965d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_965d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1646_c7_965d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_965d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_965d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_965d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_965d_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_965d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_965d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_965d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_2d0f_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1646_c7_965d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_965d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_965d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_965d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_965d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_965d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_965d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1643_c7_fceb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output;

     -- n8_MUX[uxn_opcodes_h_l1638_c2_3c95] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1638_c2_3c95_cond <= VAR_n8_MUX_uxn_opcodes_h_l1638_c2_3c95_cond;
     n8_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue;
     n8_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output := n8_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1638_c2_3c95] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1638_c2_3c95_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1638_c2_3c95_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output := result_ram_value_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1638_c2_3c95] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1638_c2_3c95_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1638_c2_3c95_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1643_c7_fceb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_fceb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_fceb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1643_c7_fceb] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1643_c7_fceb_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1643_c7_fceb_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_965d_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1638_c2_3c95] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_3c95_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_3c95_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1638_c2_3c95] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1638_c2_3c95] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_3c95_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_3c95_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1643_c7_fceb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output;

     -- Submodule level 7
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c7_fceb_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1638_c2_3c95] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5_uxn_opcodes_h_l1667_l1634_DUPLICATE_5a65 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5_uxn_opcodes_h_l1667_l1634_DUPLICATE_5a65_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_3c95_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5_uxn_opcodes_h_l1667_l1634_DUPLICATE_5a65_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5_uxn_opcodes_h_l1667_l1634_DUPLICATE_5a65_return_output;
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
