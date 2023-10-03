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
-- Submodules: 122
entity sta2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta2_0CLK_201aeef3;
architecture arch of sta2_0CLK_201aeef3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1580_c6_f6ad]
signal BIN_OP_EQ_uxn_opcodes_h_l1580_c6_f6ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1580_c6_f6ad_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1580_c6_f6ad_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1580_c1_16c9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1580_c1_16c9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1580_c1_16c9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1580_c1_16c9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1580_c1_16c9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1580_c2_764a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_764a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_764a_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1580_c2_764a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1580_c2_764a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1580_c2_764a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1580_c2_764a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_764a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_764a_return_output : unsigned(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1580_c2_764a]
signal result_ram_value_MUX_uxn_opcodes_h_l1580_c2_764a_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1580_c2_764a_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1580_c2_764a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_764a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_764a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1580_c2_764a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1580_c2_764a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1580_c2_764a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1580_c2_764a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_764a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_764a_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1580_c2_764a]
signal result_ram_addr_MUX_uxn_opcodes_h_l1580_c2_764a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1580_c2_764a_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1580_c2_764a]
signal t16_MUX_uxn_opcodes_h_l1580_c2_764a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1580_c2_764a_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1580_c2_764a]
signal n16_MUX_uxn_opcodes_h_l1580_c2_764a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1580_c2_764a_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1581_c3_68bd[uxn_opcodes_h_l1581_c3_68bd]
signal printf_uxn_opcodes_h_l1581_c3_68bd_uxn_opcodes_h_l1581_c3_68bd_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1586_c11_d428]
signal BIN_OP_EQ_uxn_opcodes_h_l1586_c11_d428_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1586_c11_d428_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1586_c11_d428_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1586_c7_1b92]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1586_c7_1b92]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1586_c7_1b92]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_1b92_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output : unsigned(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1586_c7_1b92]
signal result_ram_value_MUX_uxn_opcodes_h_l1586_c7_1b92_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1586_c7_1b92]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1586_c7_1b92_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1586_c7_1b92]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_1b92_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1586_c7_1b92]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_1b92_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1586_c7_1b92]
signal result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_1b92_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1586_c7_1b92]
signal t16_MUX_uxn_opcodes_h_l1586_c7_1b92_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1586_c7_1b92]
signal n16_MUX_uxn_opcodes_h_l1586_c7_1b92_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1589_c11_5370]
signal BIN_OP_EQ_uxn_opcodes_h_l1589_c11_5370_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1589_c11_5370_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1589_c11_5370_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1589_c7_87d1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1589_c7_87d1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1589_c7_87d1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1589_c7_87d1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output : unsigned(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1589_c7_87d1]
signal result_ram_value_MUX_uxn_opcodes_h_l1589_c7_87d1_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1589_c7_87d1]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1589_c7_87d1_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1589_c7_87d1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1589_c7_87d1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1589_c7_87d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1589_c7_87d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1589_c7_87d1]
signal result_ram_addr_MUX_uxn_opcodes_h_l1589_c7_87d1_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1589_c7_87d1]
signal t16_MUX_uxn_opcodes_h_l1589_c7_87d1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1589_c7_87d1]
signal n16_MUX_uxn_opcodes_h_l1589_c7_87d1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1594_c11_3555]
signal BIN_OP_EQ_uxn_opcodes_h_l1594_c11_3555_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1594_c11_3555_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1594_c11_3555_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1594_c7_38ba]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1594_c7_38ba]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1594_c7_38ba]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_38ba_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output : unsigned(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1594_c7_38ba]
signal result_ram_value_MUX_uxn_opcodes_h_l1594_c7_38ba_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1594_c7_38ba]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_38ba_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1594_c7_38ba]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1594_c7_38ba_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1594_c7_38ba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_38ba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1594_c7_38ba]
signal result_ram_addr_MUX_uxn_opcodes_h_l1594_c7_38ba_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1594_c7_38ba]
signal t16_MUX_uxn_opcodes_h_l1594_c7_38ba_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1594_c7_38ba]
signal n16_MUX_uxn_opcodes_h_l1594_c7_38ba_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1597_c11_ee01]
signal BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ee01_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ee01_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ee01_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1597_c7_3570]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1597_c7_3570_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1597_c7_3570_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1597_c7_3570]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1597_c7_3570_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1597_c7_3570_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1597_c7_3570]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_3570_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_3570_return_output : unsigned(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1597_c7_3570]
signal result_ram_value_MUX_uxn_opcodes_h_l1597_c7_3570_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1597_c7_3570_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1597_c7_3570]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1597_c7_3570_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1597_c7_3570_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1597_c7_3570]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1597_c7_3570_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1597_c7_3570_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1597_c7_3570]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_3570_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_3570_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1597_c7_3570]
signal result_ram_addr_MUX_uxn_opcodes_h_l1597_c7_3570_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1597_c7_3570_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1597_c7_3570]
signal t16_MUX_uxn_opcodes_h_l1597_c7_3570_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1597_c7_3570_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1597_c7_3570]
signal n16_MUX_uxn_opcodes_h_l1597_c7_3570_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1597_c7_3570_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1598_c3_f550]
signal BIN_OP_OR_uxn_opcodes_h_l1598_c3_f550_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1598_c3_f550_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1598_c3_f550_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1601_c11_b5e2]
signal BIN_OP_EQ_uxn_opcodes_h_l1601_c11_b5e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1601_c11_b5e2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1601_c11_b5e2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1601_c7_e757]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_e757_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_e757_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1601_c7_e757]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1601_c7_e757_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1601_c7_e757_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1601_c7_e757]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1601_c7_e757_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1601_c7_e757_return_output : unsigned(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1601_c7_e757]
signal result_ram_value_MUX_uxn_opcodes_h_l1601_c7_e757_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1601_c7_e757_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1601_c7_e757]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1601_c7_e757_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1601_c7_e757_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1601_c7_e757]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1601_c7_e757_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1601_c7_e757_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1601_c7_e757]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_e757_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_e757_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1601_c7_e757]
signal result_ram_addr_MUX_uxn_opcodes_h_l1601_c7_e757_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1601_c7_e757_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1601_c7_e757]
signal n16_MUX_uxn_opcodes_h_l1601_c7_e757_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1601_c7_e757_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1604_c11_e366]
signal BIN_OP_EQ_uxn_opcodes_h_l1604_c11_e366_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1604_c11_e366_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1604_c11_e366_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1604_c7_b444]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1604_c7_b444_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1604_c7_b444_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1604_c7_b444]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_b444_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_b444_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1604_c7_b444]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_b444_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_b444_return_output : unsigned(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1604_c7_b444]
signal result_ram_value_MUX_uxn_opcodes_h_l1604_c7_b444_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1604_c7_b444_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1604_c7_b444]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1604_c7_b444_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1604_c7_b444_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1604_c7_b444]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1604_c7_b444_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1604_c7_b444_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1604_c7_b444]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_b444_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_b444_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1604_c7_b444]
signal result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_b444_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_b444_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1604_c7_b444]
signal n16_MUX_uxn_opcodes_h_l1604_c7_b444_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1604_c7_b444_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1609_c11_c880]
signal BIN_OP_EQ_uxn_opcodes_h_l1609_c11_c880_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1609_c11_c880_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1609_c11_c880_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1609_c7_3146]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1609_c7_3146_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1609_c7_3146_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1609_c7_3146]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1609_c7_3146_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1609_c7_3146_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1609_c7_3146]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1609_c7_3146_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1609_c7_3146_return_output : unsigned(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1609_c7_3146]
signal result_ram_value_MUX_uxn_opcodes_h_l1609_c7_3146_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1609_c7_3146_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1609_c7_3146]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1609_c7_3146_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1609_c7_3146_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1609_c7_3146]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1609_c7_3146_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1609_c7_3146_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1609_c7_3146]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_3146_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_3146_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1609_c7_3146]
signal result_ram_addr_MUX_uxn_opcodes_h_l1609_c7_3146_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1609_c7_3146_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1609_c7_3146]
signal n16_MUX_uxn_opcodes_h_l1609_c7_3146_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1609_c7_3146_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1612_c11_3941]
signal BIN_OP_EQ_uxn_opcodes_h_l1612_c11_3941_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1612_c11_3941_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1612_c11_3941_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1612_c7_0d51]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1612_c7_0d51_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1612_c7_0d51]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1612_c7_0d51]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_0d51_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1612_c7_0d51]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1612_c7_0d51]
signal result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_0d51_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1612_c7_0d51]
signal result_ram_value_MUX_uxn_opcodes_h_l1612_c7_0d51_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1612_c7_0d51]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1612_c7_0d51_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1612_c7_0d51]
signal n16_MUX_uxn_opcodes_h_l1612_c7_0d51_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1613_c3_a661]
signal BIN_OP_OR_uxn_opcodes_h_l1613_c3_a661_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1613_c3_a661_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1613_c3_a661_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1616_c32_6649]
signal BIN_OP_AND_uxn_opcodes_h_l1616_c32_6649_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1616_c32_6649_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1616_c32_6649_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1616_c32_a93c]
signal BIN_OP_GT_uxn_opcodes_h_l1616_c32_a93c_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1616_c32_a93c_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1616_c32_a93c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1616_c32_4472]
signal MUX_uxn_opcodes_h_l1616_c32_4472_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1616_c32_4472_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1616_c32_4472_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1616_c32_4472_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1618_c11_8b9f]
signal BIN_OP_EQ_uxn_opcodes_h_l1618_c11_8b9f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1618_c11_8b9f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1618_c11_8b9f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1618_c7_47d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_47d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_47d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_47d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1618_c7_47d1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_47d1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_47d1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_47d1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1618_c7_47d1]
signal result_ram_addr_MUX_uxn_opcodes_h_l1618_c7_47d1_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1618_c7_47d1_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1618_c7_47d1_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1618_c7_47d1]
signal result_ram_value_MUX_uxn_opcodes_h_l1618_c7_47d1_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1618_c7_47d1_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1618_c7_47d1_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1618_c7_47d1]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_47d1_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_47d1_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_47d1_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1622_c32_029f]
signal CONST_SR_8_uxn_opcodes_h_l1622_c32_029f_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1622_c32_029f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1624_c11_1894]
signal BIN_OP_EQ_uxn_opcodes_h_l1624_c11_1894_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1624_c11_1894_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1624_c11_1894_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1624_c7_af97]
signal result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_af97_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_af97_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_af97_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_af97_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1624_c7_af97]
signal result_ram_value_MUX_uxn_opcodes_h_l1624_c7_af97_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1624_c7_af97_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1624_c7_af97_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1624_c7_af97_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1624_c7_af97]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_af97_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_af97_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_af97_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_af97_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1624_c7_af97]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1624_c7_af97_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1624_c7_af97_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1624_c7_af97_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1624_c7_af97_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1626_c21_db48]
signal BIN_OP_PLUS_uxn_opcodes_h_l1626_c21_db48_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1626_c21_db48_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1626_c21_db48_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1629_c11_2480]
signal BIN_OP_EQ_uxn_opcodes_h_l1629_c11_2480_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1629_c11_2480_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1629_c11_2480_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1629_c7_262d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_262d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_262d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_262d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_262d_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1629_c7_262d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_262d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_262d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_262d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_262d_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1606_l1591_DUPLICATE_f5bc
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1606_l1591_DUPLICATE_f5bc_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1606_l1591_DUPLICATE_f5bc_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_e57a( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.ram_value := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.is_stack_read := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.ram_addr := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1580_c6_f6ad
BIN_OP_EQ_uxn_opcodes_h_l1580_c6_f6ad : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1580_c6_f6ad_left,
BIN_OP_EQ_uxn_opcodes_h_l1580_c6_f6ad_right,
BIN_OP_EQ_uxn_opcodes_h_l1580_c6_f6ad_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1580_c1_16c9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1580_c1_16c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1580_c1_16c9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1580_c1_16c9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1580_c1_16c9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1580_c1_16c9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_764a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_764a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_764a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_764a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1580_c2_764a
result_is_sp_shift_MUX_uxn_opcodes_h_l1580_c2_764a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1580_c2_764a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1580_c2_764a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_764a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_764a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_764a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_764a_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1580_c2_764a
result_ram_value_MUX_uxn_opcodes_h_l1580_c2_764a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1580_c2_764a_cond,
result_ram_value_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1580_c2_764a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_764a
result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_764a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_764a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_764a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1580_c2_764a
result_is_stack_read_MUX_uxn_opcodes_h_l1580_c2_764a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1580_c2_764a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1580_c2_764a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_764a
result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_764a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_764a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_764a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1580_c2_764a
result_ram_addr_MUX_uxn_opcodes_h_l1580_c2_764a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1580_c2_764a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1580_c2_764a_return_output);

-- t16_MUX_uxn_opcodes_h_l1580_c2_764a
t16_MUX_uxn_opcodes_h_l1580_c2_764a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1580_c2_764a_cond,
t16_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue,
t16_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse,
t16_MUX_uxn_opcodes_h_l1580_c2_764a_return_output);

-- n16_MUX_uxn_opcodes_h_l1580_c2_764a
n16_MUX_uxn_opcodes_h_l1580_c2_764a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1580_c2_764a_cond,
n16_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue,
n16_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse,
n16_MUX_uxn_opcodes_h_l1580_c2_764a_return_output);

-- printf_uxn_opcodes_h_l1581_c3_68bd_uxn_opcodes_h_l1581_c3_68bd
printf_uxn_opcodes_h_l1581_c3_68bd_uxn_opcodes_h_l1581_c3_68bd : entity work.printf_uxn_opcodes_h_l1581_c3_68bd_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1581_c3_68bd_uxn_opcodes_h_l1581_c3_68bd_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1586_c11_d428
BIN_OP_EQ_uxn_opcodes_h_l1586_c11_d428 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1586_c11_d428_left,
BIN_OP_EQ_uxn_opcodes_h_l1586_c11_d428_right,
BIN_OP_EQ_uxn_opcodes_h_l1586_c11_d428_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_1b92
result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_1b92 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_1b92
result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_1b92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_1b92
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_1b92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_1b92_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1586_c7_1b92
result_ram_value_MUX_uxn_opcodes_h_l1586_c7_1b92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1586_c7_1b92_cond,
result_ram_value_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1586_c7_1b92
result_is_ram_write_MUX_uxn_opcodes_h_l1586_c7_1b92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1586_c7_1b92_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_1b92
result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_1b92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_1b92_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_1b92
result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_1b92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_1b92_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_1b92
result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_1b92 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_1b92_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output);

-- t16_MUX_uxn_opcodes_h_l1586_c7_1b92
t16_MUX_uxn_opcodes_h_l1586_c7_1b92 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1586_c7_1b92_cond,
t16_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue,
t16_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse,
t16_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output);

-- n16_MUX_uxn_opcodes_h_l1586_c7_1b92
n16_MUX_uxn_opcodes_h_l1586_c7_1b92 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1586_c7_1b92_cond,
n16_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue,
n16_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse,
n16_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1589_c11_5370
BIN_OP_EQ_uxn_opcodes_h_l1589_c11_5370 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1589_c11_5370_left,
BIN_OP_EQ_uxn_opcodes_h_l1589_c11_5370_right,
BIN_OP_EQ_uxn_opcodes_h_l1589_c11_5370_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1589_c7_87d1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1589_c7_87d1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1589_c7_87d1
result_is_sp_shift_MUX_uxn_opcodes_h_l1589_c7_87d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1589_c7_87d1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1589_c7_87d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1589_c7_87d1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1589_c7_87d1
result_ram_value_MUX_uxn_opcodes_h_l1589_c7_87d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1589_c7_87d1_cond,
result_ram_value_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1589_c7_87d1
result_is_ram_write_MUX_uxn_opcodes_h_l1589_c7_87d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1589_c7_87d1_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1589_c7_87d1
result_is_stack_read_MUX_uxn_opcodes_h_l1589_c7_87d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1589_c7_87d1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1589_c7_87d1
result_is_opc_done_MUX_uxn_opcodes_h_l1589_c7_87d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1589_c7_87d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1589_c7_87d1
result_ram_addr_MUX_uxn_opcodes_h_l1589_c7_87d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1589_c7_87d1_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output);

-- t16_MUX_uxn_opcodes_h_l1589_c7_87d1
t16_MUX_uxn_opcodes_h_l1589_c7_87d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1589_c7_87d1_cond,
t16_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue,
t16_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse,
t16_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output);

-- n16_MUX_uxn_opcodes_h_l1589_c7_87d1
n16_MUX_uxn_opcodes_h_l1589_c7_87d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1589_c7_87d1_cond,
n16_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue,
n16_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse,
n16_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1594_c11_3555
BIN_OP_EQ_uxn_opcodes_h_l1594_c11_3555 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1594_c11_3555_left,
BIN_OP_EQ_uxn_opcodes_h_l1594_c11_3555_right,
BIN_OP_EQ_uxn_opcodes_h_l1594_c11_3555_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_38ba
result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_38ba : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_38ba
result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_38ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_38ba
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_38ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_38ba_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1594_c7_38ba
result_ram_value_MUX_uxn_opcodes_h_l1594_c7_38ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1594_c7_38ba_cond,
result_ram_value_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_38ba
result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_38ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_38ba_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1594_c7_38ba
result_is_stack_read_MUX_uxn_opcodes_h_l1594_c7_38ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1594_c7_38ba_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_38ba
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_38ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_38ba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1594_c7_38ba
result_ram_addr_MUX_uxn_opcodes_h_l1594_c7_38ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1594_c7_38ba_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output);

-- t16_MUX_uxn_opcodes_h_l1594_c7_38ba
t16_MUX_uxn_opcodes_h_l1594_c7_38ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1594_c7_38ba_cond,
t16_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue,
t16_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse,
t16_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output);

-- n16_MUX_uxn_opcodes_h_l1594_c7_38ba
n16_MUX_uxn_opcodes_h_l1594_c7_38ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1594_c7_38ba_cond,
n16_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue,
n16_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse,
n16_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ee01
BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ee01 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ee01_left,
BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ee01_right,
BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ee01_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1597_c7_3570
result_sp_relative_shift_MUX_uxn_opcodes_h_l1597_c7_3570 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1597_c7_3570_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1597_c7_3570_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1597_c7_3570
result_is_sp_shift_MUX_uxn_opcodes_h_l1597_c7_3570 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1597_c7_3570_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1597_c7_3570_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_3570
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_3570 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_3570_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_3570_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1597_c7_3570
result_ram_value_MUX_uxn_opcodes_h_l1597_c7_3570 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1597_c7_3570_cond,
result_ram_value_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1597_c7_3570_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1597_c7_3570
result_is_ram_write_MUX_uxn_opcodes_h_l1597_c7_3570 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1597_c7_3570_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1597_c7_3570_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1597_c7_3570
result_is_stack_read_MUX_uxn_opcodes_h_l1597_c7_3570 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1597_c7_3570_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1597_c7_3570_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_3570
result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_3570 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_3570_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_3570_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1597_c7_3570
result_ram_addr_MUX_uxn_opcodes_h_l1597_c7_3570 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1597_c7_3570_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1597_c7_3570_return_output);

-- t16_MUX_uxn_opcodes_h_l1597_c7_3570
t16_MUX_uxn_opcodes_h_l1597_c7_3570 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1597_c7_3570_cond,
t16_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue,
t16_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse,
t16_MUX_uxn_opcodes_h_l1597_c7_3570_return_output);

-- n16_MUX_uxn_opcodes_h_l1597_c7_3570
n16_MUX_uxn_opcodes_h_l1597_c7_3570 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1597_c7_3570_cond,
n16_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue,
n16_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse,
n16_MUX_uxn_opcodes_h_l1597_c7_3570_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1598_c3_f550
BIN_OP_OR_uxn_opcodes_h_l1598_c3_f550 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1598_c3_f550_left,
BIN_OP_OR_uxn_opcodes_h_l1598_c3_f550_right,
BIN_OP_OR_uxn_opcodes_h_l1598_c3_f550_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1601_c11_b5e2
BIN_OP_EQ_uxn_opcodes_h_l1601_c11_b5e2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1601_c11_b5e2_left,
BIN_OP_EQ_uxn_opcodes_h_l1601_c11_b5e2_right,
BIN_OP_EQ_uxn_opcodes_h_l1601_c11_b5e2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_e757
result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_e757 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_e757_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_e757_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1601_c7_e757
result_is_sp_shift_MUX_uxn_opcodes_h_l1601_c7_e757 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1601_c7_e757_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1601_c7_e757_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1601_c7_e757
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1601_c7_e757 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1601_c7_e757_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1601_c7_e757_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1601_c7_e757
result_ram_value_MUX_uxn_opcodes_h_l1601_c7_e757 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1601_c7_e757_cond,
result_ram_value_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1601_c7_e757_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1601_c7_e757
result_is_ram_write_MUX_uxn_opcodes_h_l1601_c7_e757 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1601_c7_e757_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1601_c7_e757_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1601_c7_e757
result_is_stack_read_MUX_uxn_opcodes_h_l1601_c7_e757 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1601_c7_e757_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1601_c7_e757_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_e757
result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_e757 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_e757_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_e757_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1601_c7_e757
result_ram_addr_MUX_uxn_opcodes_h_l1601_c7_e757 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1601_c7_e757_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1601_c7_e757_return_output);

-- n16_MUX_uxn_opcodes_h_l1601_c7_e757
n16_MUX_uxn_opcodes_h_l1601_c7_e757 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1601_c7_e757_cond,
n16_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue,
n16_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse,
n16_MUX_uxn_opcodes_h_l1601_c7_e757_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1604_c11_e366
BIN_OP_EQ_uxn_opcodes_h_l1604_c11_e366 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1604_c11_e366_left,
BIN_OP_EQ_uxn_opcodes_h_l1604_c11_e366_right,
BIN_OP_EQ_uxn_opcodes_h_l1604_c11_e366_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1604_c7_b444
result_sp_relative_shift_MUX_uxn_opcodes_h_l1604_c7_b444 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1604_c7_b444_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1604_c7_b444_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_b444
result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_b444 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_b444_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_b444_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_b444
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_b444 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_b444_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_b444_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1604_c7_b444
result_ram_value_MUX_uxn_opcodes_h_l1604_c7_b444 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1604_c7_b444_cond,
result_ram_value_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1604_c7_b444_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1604_c7_b444
result_is_ram_write_MUX_uxn_opcodes_h_l1604_c7_b444 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1604_c7_b444_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1604_c7_b444_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1604_c7_b444
result_is_stack_read_MUX_uxn_opcodes_h_l1604_c7_b444 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1604_c7_b444_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1604_c7_b444_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_b444
result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_b444 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_b444_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_b444_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_b444
result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_b444 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_b444_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_b444_return_output);

-- n16_MUX_uxn_opcodes_h_l1604_c7_b444
n16_MUX_uxn_opcodes_h_l1604_c7_b444 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1604_c7_b444_cond,
n16_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue,
n16_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse,
n16_MUX_uxn_opcodes_h_l1604_c7_b444_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1609_c11_c880
BIN_OP_EQ_uxn_opcodes_h_l1609_c11_c880 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1609_c11_c880_left,
BIN_OP_EQ_uxn_opcodes_h_l1609_c11_c880_right,
BIN_OP_EQ_uxn_opcodes_h_l1609_c11_c880_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1609_c7_3146
result_sp_relative_shift_MUX_uxn_opcodes_h_l1609_c7_3146 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1609_c7_3146_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1609_c7_3146_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1609_c7_3146
result_is_sp_shift_MUX_uxn_opcodes_h_l1609_c7_3146 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1609_c7_3146_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1609_c7_3146_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1609_c7_3146
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1609_c7_3146 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1609_c7_3146_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1609_c7_3146_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1609_c7_3146
result_ram_value_MUX_uxn_opcodes_h_l1609_c7_3146 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1609_c7_3146_cond,
result_ram_value_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1609_c7_3146_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1609_c7_3146
result_is_ram_write_MUX_uxn_opcodes_h_l1609_c7_3146 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1609_c7_3146_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1609_c7_3146_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1609_c7_3146
result_is_stack_read_MUX_uxn_opcodes_h_l1609_c7_3146 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1609_c7_3146_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1609_c7_3146_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_3146
result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_3146 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_3146_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_3146_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1609_c7_3146
result_ram_addr_MUX_uxn_opcodes_h_l1609_c7_3146 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1609_c7_3146_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1609_c7_3146_return_output);

-- n16_MUX_uxn_opcodes_h_l1609_c7_3146
n16_MUX_uxn_opcodes_h_l1609_c7_3146 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1609_c7_3146_cond,
n16_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue,
n16_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse,
n16_MUX_uxn_opcodes_h_l1609_c7_3146_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1612_c11_3941
BIN_OP_EQ_uxn_opcodes_h_l1612_c11_3941 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1612_c11_3941_left,
BIN_OP_EQ_uxn_opcodes_h_l1612_c11_3941_right,
BIN_OP_EQ_uxn_opcodes_h_l1612_c11_3941_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1612_c7_0d51
result_is_stack_read_MUX_uxn_opcodes_h_l1612_c7_0d51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1612_c7_0d51_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c7_0d51
result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c7_0d51 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_0d51
result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_0d51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_0d51_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c7_0d51
result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c7_0d51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_0d51
result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_0d51 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_0d51_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1612_c7_0d51
result_ram_value_MUX_uxn_opcodes_h_l1612_c7_0d51 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1612_c7_0d51_cond,
result_ram_value_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1612_c7_0d51
result_is_ram_write_MUX_uxn_opcodes_h_l1612_c7_0d51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1612_c7_0d51_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output);

-- n16_MUX_uxn_opcodes_h_l1612_c7_0d51
n16_MUX_uxn_opcodes_h_l1612_c7_0d51 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1612_c7_0d51_cond,
n16_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue,
n16_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse,
n16_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1613_c3_a661
BIN_OP_OR_uxn_opcodes_h_l1613_c3_a661 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1613_c3_a661_left,
BIN_OP_OR_uxn_opcodes_h_l1613_c3_a661_right,
BIN_OP_OR_uxn_opcodes_h_l1613_c3_a661_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1616_c32_6649
BIN_OP_AND_uxn_opcodes_h_l1616_c32_6649 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1616_c32_6649_left,
BIN_OP_AND_uxn_opcodes_h_l1616_c32_6649_right,
BIN_OP_AND_uxn_opcodes_h_l1616_c32_6649_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1616_c32_a93c
BIN_OP_GT_uxn_opcodes_h_l1616_c32_a93c : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1616_c32_a93c_left,
BIN_OP_GT_uxn_opcodes_h_l1616_c32_a93c_right,
BIN_OP_GT_uxn_opcodes_h_l1616_c32_a93c_return_output);

-- MUX_uxn_opcodes_h_l1616_c32_4472
MUX_uxn_opcodes_h_l1616_c32_4472 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1616_c32_4472_cond,
MUX_uxn_opcodes_h_l1616_c32_4472_iftrue,
MUX_uxn_opcodes_h_l1616_c32_4472_iffalse,
MUX_uxn_opcodes_h_l1616_c32_4472_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1618_c11_8b9f
BIN_OP_EQ_uxn_opcodes_h_l1618_c11_8b9f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1618_c11_8b9f_left,
BIN_OP_EQ_uxn_opcodes_h_l1618_c11_8b9f_right,
BIN_OP_EQ_uxn_opcodes_h_l1618_c11_8b9f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_47d1
result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_47d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_47d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_47d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_47d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_47d1
result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_47d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_47d1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_47d1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_47d1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1618_c7_47d1
result_ram_addr_MUX_uxn_opcodes_h_l1618_c7_47d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1618_c7_47d1_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1618_c7_47d1_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1618_c7_47d1_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1618_c7_47d1
result_ram_value_MUX_uxn_opcodes_h_l1618_c7_47d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1618_c7_47d1_cond,
result_ram_value_MUX_uxn_opcodes_h_l1618_c7_47d1_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1618_c7_47d1_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_47d1
result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_47d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_47d1_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_47d1_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_47d1_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1622_c32_029f
CONST_SR_8_uxn_opcodes_h_l1622_c32_029f : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1622_c32_029f_x,
CONST_SR_8_uxn_opcodes_h_l1622_c32_029f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1624_c11_1894
BIN_OP_EQ_uxn_opcodes_h_l1624_c11_1894 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1624_c11_1894_left,
BIN_OP_EQ_uxn_opcodes_h_l1624_c11_1894_right,
BIN_OP_EQ_uxn_opcodes_h_l1624_c11_1894_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_af97
result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_af97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_af97_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_af97_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_af97_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_af97_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1624_c7_af97
result_ram_value_MUX_uxn_opcodes_h_l1624_c7_af97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1624_c7_af97_cond,
result_ram_value_MUX_uxn_opcodes_h_l1624_c7_af97_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1624_c7_af97_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1624_c7_af97_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_af97
result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_af97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_af97_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_af97_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_af97_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_af97_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1624_c7_af97
result_is_ram_write_MUX_uxn_opcodes_h_l1624_c7_af97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1624_c7_af97_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1624_c7_af97_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1624_c7_af97_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1624_c7_af97_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1626_c21_db48
BIN_OP_PLUS_uxn_opcodes_h_l1626_c21_db48 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1626_c21_db48_left,
BIN_OP_PLUS_uxn_opcodes_h_l1626_c21_db48_right,
BIN_OP_PLUS_uxn_opcodes_h_l1626_c21_db48_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1629_c11_2480
BIN_OP_EQ_uxn_opcodes_h_l1629_c11_2480 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1629_c11_2480_left,
BIN_OP_EQ_uxn_opcodes_h_l1629_c11_2480_right,
BIN_OP_EQ_uxn_opcodes_h_l1629_c11_2480_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_262d
result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_262d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_262d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_262d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_262d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_262d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_262d
result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_262d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_262d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_262d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_262d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_262d_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1606_l1591_DUPLICATE_f5bc
CONST_SL_8_uint16_t_uxn_opcodes_h_l1606_l1591_DUPLICATE_f5bc : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1606_l1591_DUPLICATE_f5bc_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1606_l1591_DUPLICATE_f5bc_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1580_c6_f6ad_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1580_c1_16c9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_764a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1580_c2_764a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_764a_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1580_c2_764a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_764a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1580_c2_764a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_764a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1580_c2_764a_return_output,
 t16_MUX_uxn_opcodes_h_l1580_c2_764a_return_output,
 n16_MUX_uxn_opcodes_h_l1580_c2_764a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1586_c11_d428_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output,
 t16_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output,
 n16_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1589_c11_5370_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output,
 t16_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output,
 n16_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1594_c11_3555_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output,
 t16_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output,
 n16_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ee01_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1597_c7_3570_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1597_c7_3570_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_3570_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1597_c7_3570_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1597_c7_3570_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1597_c7_3570_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_3570_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1597_c7_3570_return_output,
 t16_MUX_uxn_opcodes_h_l1597_c7_3570_return_output,
 n16_MUX_uxn_opcodes_h_l1597_c7_3570_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1598_c3_f550_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1601_c11_b5e2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_e757_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1601_c7_e757_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1601_c7_e757_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1601_c7_e757_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1601_c7_e757_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1601_c7_e757_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_e757_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1601_c7_e757_return_output,
 n16_MUX_uxn_opcodes_h_l1601_c7_e757_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1604_c11_e366_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1604_c7_b444_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_b444_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_b444_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1604_c7_b444_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1604_c7_b444_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1604_c7_b444_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_b444_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_b444_return_output,
 n16_MUX_uxn_opcodes_h_l1604_c7_b444_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1609_c11_c880_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1609_c7_3146_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1609_c7_3146_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1609_c7_3146_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1609_c7_3146_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1609_c7_3146_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1609_c7_3146_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_3146_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1609_c7_3146_return_output,
 n16_MUX_uxn_opcodes_h_l1609_c7_3146_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1612_c11_3941_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output,
 n16_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1613_c3_a661_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1616_c32_6649_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1616_c32_a93c_return_output,
 MUX_uxn_opcodes_h_l1616_c32_4472_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1618_c11_8b9f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output,
 CONST_SR_8_uxn_opcodes_h_l1622_c32_029f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1624_c11_1894_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_af97_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1624_c7_af97_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_af97_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1624_c7_af97_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1626_c21_db48_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1629_c11_2480_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_262d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_262d_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1606_l1591_DUPLICATE_f5bc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_f6ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_f6ad_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_f6ad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1580_c1_16c9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1580_c1_16c9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1580_c1_16c9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1580_c1_16c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_764a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_764a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1580_c2_764a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1580_c2_764a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1583_c3_3fe0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_764a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_764a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1580_c2_764a_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1580_c2_764a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_764a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_764a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1580_c2_764a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1580_c2_764a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_764a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_764a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1580_c2_764a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1580_c2_764a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1580_c2_764a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1580_c2_764a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1580_c2_764a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1580_c2_764a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1581_c3_68bd_uxn_opcodes_h_l1581_c3_68bd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_d428_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_d428_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_d428_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1587_c3_68b2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_1b92_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1586_c7_1b92_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1586_c7_1b92_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_1b92_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_1b92_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_1b92_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1586_c7_1b92_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1586_c7_1b92_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1589_c11_5370_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1589_c11_5370_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1589_c11_5370_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1592_c3_1e06 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1589_c7_87d1_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1589_c7_87d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1589_c7_87d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1589_c7_87d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1589_c7_87d1_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1589_c7_87d1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1589_c7_87d1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1589_c7_87d1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_3555_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_3555_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_3555_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1597_c7_3570_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1597_c7_3570_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1595_c3_7038 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_3570_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_38ba_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1597_c7_3570_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1594_c7_38ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1597_c7_3570_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_38ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1597_c7_3570_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1594_c7_38ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_3570_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_38ba_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1597_c7_3570_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c7_38ba_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1597_c7_3570_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1594_c7_38ba_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1597_c7_3570_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1594_c7_38ba_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ee01_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ee01_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ee01_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_e757_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1597_c7_3570_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1601_c7_e757_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1597_c7_3570_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1599_c3_4fae : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1601_c7_e757_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_3570_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1601_c7_e757_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1597_c7_3570_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1601_c7_e757_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1597_c7_3570_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1601_c7_e757_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1597_c7_3570_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_e757_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_3570_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1601_c7_e757_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1597_c7_3570_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1597_c7_3570_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1601_c7_e757_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1597_c7_3570_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1598_c3_f550_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1598_c3_f550_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1598_c3_f550_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1601_c11_b5e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1601_c11_b5e2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1601_c11_b5e2_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1604_c7_b444_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_e757_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_b444_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1601_c7_e757_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1602_c3_5a6a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_b444_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1601_c7_e757_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1604_c7_b444_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1601_c7_e757_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1604_c7_b444_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1601_c7_e757_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1604_c7_b444_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1601_c7_e757_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_b444_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_e757_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_b444_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1601_c7_e757_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1604_c7_b444_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1601_c7_e757_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1604_c11_e366_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1604_c11_e366_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1604_c11_e366_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1609_c7_3146_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1604_c7_b444_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1609_c7_3146_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_b444_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1607_c3_d429 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1609_c7_3146_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_b444_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1609_c7_3146_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1604_c7_b444_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1609_c7_3146_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1604_c7_b444_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1609_c7_3146_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1604_c7_b444_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_3146_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_b444_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1609_c7_3146_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_b444_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1609_c7_3146_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1604_c7_b444_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1609_c11_c880_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1609_c11_c880_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1609_c11_c880_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1609_c7_3146_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1609_c7_3146_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1610_c3_9355 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1609_c7_3146_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1609_c7_3146_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1609_c7_3146_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1609_c7_3146_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1609_c7_3146_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_3146_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1609_c7_3146_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1609_c7_3146_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_3941_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_3941_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_3941_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1612_c7_0d51_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_0d51_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_0d51_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1612_c7_0d51_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1612_c7_0d51_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1612_c7_0d51_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1613_c3_a661_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1613_c3_a661_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1613_c3_a661_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1616_c32_4472_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1616_c32_4472_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1616_c32_4472_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1616_c32_6649_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1616_c32_6649_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1616_c32_6649_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1616_c32_a93c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1616_c32_a93c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1616_c32_a93c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1616_c32_4472_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_8b9f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_8b9f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_8b9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_47d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_47d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_af97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_47d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_47d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_47d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_47d1_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1618_c7_47d1_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1618_c7_47d1_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_af97_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1618_c7_47d1_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1618_c7_47d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1618_c7_47d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1624_c7_af97_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1618_c7_47d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_47d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_47d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1624_c7_af97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_47d1_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1622_c32_029f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1622_c32_029f_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1622_c22_8c58_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_1894_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_1894_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_1894_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_af97_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1626_c3_d050 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_af97_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_af97_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1624_c7_af97_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1624_c7_af97_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1624_c7_af97_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_af97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_af97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_262d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_af97_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1624_c7_af97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1624_c7_af97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_262d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1624_c7_af97_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1626_c21_db48_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1626_c21_db48_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1626_c21_db48_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1627_c22_e020_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_2480_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_2480_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_2480_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_262d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_262d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_262d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_262d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_262d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_262d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1604_l1601_DUPLICATE_fabc_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1597_l1609_l1594_l1586_l1589_l1580_l1604_l1618_l1601_DUPLICATE_2b6f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1624_l1604_l1601_DUPLICATE_1803_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1629_l1604_l1601_DUPLICATE_9487_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1624_l1604_l1601_DUPLICATE_91d3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1604_l1601_DUPLICATE_9883_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1629_l1624_l1604_l1618_l1601_DUPLICATE_8ed5_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1590_l1605_l1598_l1613_DUPLICATE_35d1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1606_l1591_DUPLICATE_f5bc_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1606_l1591_DUPLICATE_f5bc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e57a_uxn_opcodes_h_l1634_l1576_DUPLICATE_fc52_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1610_c3_9355 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1610_c3_9355;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1592_c3_1e06 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1592_c3_1e06;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1609_c11_c880_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_d428_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1601_c11_b5e2_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1589_c11_5370_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_3941_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_3555_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1604_c11_e366_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_f6ad_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_262d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1587_c3_68b2 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1587_c3_68b2;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1580_c1_16c9_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1595_c3_7038 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1595_c3_7038;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_8b9f_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_1894_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_2480_right := to_unsigned(11, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1616_c32_a93c_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1616_c32_4472_iffalse := resize(to_signed(-4, 4), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1607_c3_d429 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1607_c3_d429;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1626_c21_db48_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_262d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1602_c3_5a6a := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1602_c3_5a6a;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1583_c3_3fe0 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1583_c3_3fe0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1599_c3_4fae := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1599_c3_4fae;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1624_c7_af97_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_47d1_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_47d1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1616_c32_6649_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ee01_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l1616_c32_4472_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1580_c1_16c9_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1616_c32_6649_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1613_c3_a661_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1622_c32_029f_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_f6ad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_d428_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1589_c11_5370_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_3555_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ee01_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1601_c11_b5e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1604_c11_e366_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1609_c11_c880_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_3941_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_8b9f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_1894_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_2480_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1598_c3_f550_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1626_c21_db48_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1618_c7_47d1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse := t16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1624_l1604_l1601_DUPLICATE_1803 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1624_l1604_l1601_DUPLICATE_1803_return_output := result.ram_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1618_c11_8b9f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1618_c11_8b9f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_8b9f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1618_c11_8b9f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_8b9f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_8b9f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1618_c11_8b9f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1580_c6_f6ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1580_c6_f6ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_f6ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l1580_c6_f6ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_f6ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_f6ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l1580_c6_f6ad_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1604_l1601_DUPLICATE_9883 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1604_l1601_DUPLICATE_9883_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1589_c11_5370] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1589_c11_5370_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1589_c11_5370_left;
     BIN_OP_EQ_uxn_opcodes_h_l1589_c11_5370_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1589_c11_5370_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1589_c11_5370_return_output := BIN_OP_EQ_uxn_opcodes_h_l1589_c11_5370_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1616_c32_6649] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1616_c32_6649_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1616_c32_6649_left;
     BIN_OP_AND_uxn_opcodes_h_l1616_c32_6649_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1616_c32_6649_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1616_c32_6649_return_output := BIN_OP_AND_uxn_opcodes_h_l1616_c32_6649_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1597_l1609_l1594_l1586_l1589_l1580_l1604_l1618_l1601_DUPLICATE_2b6f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1597_l1609_l1594_l1586_l1589_l1580_l1604_l1618_l1601_DUPLICATE_2b6f_return_output := result.is_sp_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1627_c22_e020] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1627_c22_e020_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1586_c11_d428] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1586_c11_d428_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_d428_left;
     BIN_OP_EQ_uxn_opcodes_h_l1586_c11_d428_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_d428_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_d428_return_output := BIN_OP_EQ_uxn_opcodes_h_l1586_c11_d428_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1626_c21_db48] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1626_c21_db48_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1626_c21_db48_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1626_c21_db48_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1626_c21_db48_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1626_c21_db48_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1626_c21_db48_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1604_l1601_DUPLICATE_fabc LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1604_l1601_DUPLICATE_fabc_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1629_l1624_l1604_l1618_l1601_DUPLICATE_8ed5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1629_l1624_l1604_l1618_l1601_DUPLICATE_8ed5_return_output := result.is_opc_done;

     -- CONST_SR_8[uxn_opcodes_h_l1622_c32_029f] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1622_c32_029f_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1622_c32_029f_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1622_c32_029f_return_output := CONST_SR_8_uxn_opcodes_h_l1622_c32_029f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1609_c11_c880] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1609_c11_c880_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1609_c11_c880_left;
     BIN_OP_EQ_uxn_opcodes_h_l1609_c11_c880_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1609_c11_c880_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1609_c11_c880_return_output := BIN_OP_EQ_uxn_opcodes_h_l1609_c11_c880_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1609_c7_3146] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1609_c7_3146_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1624_c11_1894] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1624_c11_1894_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_1894_left;
     BIN_OP_EQ_uxn_opcodes_h_l1624_c11_1894_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_1894_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_1894_return_output := BIN_OP_EQ_uxn_opcodes_h_l1624_c11_1894_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1590_l1605_l1598_l1613_DUPLICATE_35d1 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1590_l1605_l1598_l1613_DUPLICATE_35d1_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1601_c11_b5e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1601_c11_b5e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1601_c11_b5e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1601_c11_b5e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1601_c11_b5e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1601_c11_b5e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1601_c11_b5e2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1612_c11_3941] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1612_c11_3941_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_3941_left;
     BIN_OP_EQ_uxn_opcodes_h_l1612_c11_3941_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_3941_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_3941_return_output := BIN_OP_EQ_uxn_opcodes_h_l1612_c11_3941_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1604_c11_e366] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1604_c11_e366_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1604_c11_e366_left;
     BIN_OP_EQ_uxn_opcodes_h_l1604_c11_e366_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1604_c11_e366_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1604_c11_e366_return_output := BIN_OP_EQ_uxn_opcodes_h_l1604_c11_e366_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1597_c11_ee01] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ee01_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ee01_left;
     BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ee01_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ee01_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ee01_return_output := BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ee01_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1624_l1604_l1601_DUPLICATE_91d3 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1624_l1604_l1601_DUPLICATE_91d3_return_output := result.ram_addr;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1629_l1604_l1601_DUPLICATE_9487 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1629_l1604_l1601_DUPLICATE_9487_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1594_c11_3555] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1594_c11_3555_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_3555_left;
     BIN_OP_EQ_uxn_opcodes_h_l1594_c11_3555_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_3555_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_3555_return_output := BIN_OP_EQ_uxn_opcodes_h_l1594_c11_3555_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1629_c11_2480] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1629_c11_2480_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_2480_left;
     BIN_OP_EQ_uxn_opcodes_h_l1629_c11_2480_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_2480_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_2480_return_output := BIN_OP_EQ_uxn_opcodes_h_l1629_c11_2480_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1616_c32_a93c_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1616_c32_6649_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1580_c1_16c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_f6ad_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1580_c2_764a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_f6ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_764a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_f6ad_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_764a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_f6ad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1580_c2_764a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_f6ad_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1580_c2_764a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_f6ad_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1580_c2_764a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_f6ad_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1580_c2_764a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_f6ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_764a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_f6ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_764a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_f6ad_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1580_c2_764a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_f6ad_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1586_c7_1b92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_d428_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_1b92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_d428_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1586_c7_1b92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_d428_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_d428_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_1b92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_d428_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_1b92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_d428_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1586_c7_1b92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_d428_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_d428_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_1b92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_d428_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1586_c7_1b92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_d428_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1589_c7_87d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1589_c11_5370_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1589_c7_87d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1589_c11_5370_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1589_c7_87d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1589_c11_5370_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1589_c11_5370_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1589_c7_87d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1589_c11_5370_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1589_c7_87d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1589_c11_5370_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1589_c7_87d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1589_c11_5370_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1589_c11_5370_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1589_c7_87d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1589_c11_5370_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1589_c7_87d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1589_c11_5370_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1594_c7_38ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_3555_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_38ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_3555_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_38ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_3555_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_3555_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1594_c7_38ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_3555_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c7_38ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_3555_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1594_c7_38ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_3555_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_3555_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_38ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_3555_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1594_c7_38ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_3555_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1597_c7_3570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ee01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_3570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ee01_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1597_c7_3570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ee01_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1597_c7_3570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ee01_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1597_c7_3570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ee01_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1597_c7_3570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ee01_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1597_c7_3570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ee01_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1597_c7_3570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ee01_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_3570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ee01_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1597_c7_3570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_ee01_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1601_c7_e757_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1601_c11_b5e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_e757_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1601_c11_b5e2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1601_c7_e757_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1601_c11_b5e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1601_c7_e757_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1601_c11_b5e2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1601_c7_e757_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1601_c11_b5e2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1601_c7_e757_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1601_c11_b5e2_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1601_c7_e757_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1601_c11_b5e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_e757_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1601_c11_b5e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1601_c7_e757_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1601_c11_b5e2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1604_c7_b444_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1604_c11_e366_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_b444_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1604_c11_e366_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1604_c7_b444_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1604_c11_e366_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_b444_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1604_c11_e366_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1604_c7_b444_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1604_c11_e366_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_b444_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1604_c11_e366_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1604_c7_b444_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1604_c11_e366_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1604_c7_b444_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1604_c11_e366_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_b444_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1604_c11_e366_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1609_c7_3146_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1609_c11_c880_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_3146_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1609_c11_c880_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1609_c7_3146_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1609_c11_c880_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1609_c7_3146_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1609_c11_c880_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1609_c7_3146_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1609_c11_c880_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1609_c7_3146_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1609_c11_c880_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1609_c7_3146_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1609_c11_c880_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1609_c7_3146_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1609_c11_c880_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1609_c7_3146_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1609_c11_c880_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1612_c7_0d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_3941_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_0d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_3941_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1612_c7_0d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_3941_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_3941_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1612_c7_0d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_3941_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_0d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_3941_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1612_c7_0d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_3941_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_3941_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_47d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_8b9f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_47d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_8b9f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_47d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_8b9f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1618_c7_47d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_8b9f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1618_c7_47d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_8b9f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_af97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_1894_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1624_c7_af97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_1894_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_af97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_1894_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1624_c7_af97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_1894_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_262d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_2480_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_262d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_2480_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1626_c3_d050 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1626_c21_db48_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1598_c3_f550_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1590_l1605_l1598_l1613_DUPLICATE_35d1_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1613_c3_a661_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1590_l1605_l1598_l1613_DUPLICATE_35d1_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1606_l1591_DUPLICATE_f5bc_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1590_l1605_l1598_l1613_DUPLICATE_35d1_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1624_c7_af97_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1627_c22_e020_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1604_l1601_DUPLICATE_fabc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1604_l1601_DUPLICATE_fabc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1604_l1601_DUPLICATE_fabc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1604_l1601_DUPLICATE_fabc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1604_l1601_DUPLICATE_fabc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1604_l1601_DUPLICATE_fabc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1604_l1601_DUPLICATE_fabc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1604_l1601_DUPLICATE_fabc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1604_l1601_DUPLICATE_fabc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1624_l1604_l1601_DUPLICATE_91d3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1624_l1604_l1601_DUPLICATE_91d3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1624_l1604_l1601_DUPLICATE_91d3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1624_l1604_l1601_DUPLICATE_91d3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1624_l1604_l1601_DUPLICATE_91d3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1624_l1604_l1601_DUPLICATE_91d3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1624_l1604_l1601_DUPLICATE_91d3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1624_l1604_l1601_DUPLICATE_91d3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1624_l1604_l1601_DUPLICATE_91d3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_af97_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1624_l1604_l1601_DUPLICATE_91d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1629_l1624_l1604_l1618_l1601_DUPLICATE_8ed5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1629_l1624_l1604_l1618_l1601_DUPLICATE_8ed5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1629_l1624_l1604_l1618_l1601_DUPLICATE_8ed5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1629_l1624_l1604_l1618_l1601_DUPLICATE_8ed5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1629_l1624_l1604_l1618_l1601_DUPLICATE_8ed5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1629_l1624_l1604_l1618_l1601_DUPLICATE_8ed5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1629_l1624_l1604_l1618_l1601_DUPLICATE_8ed5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1629_l1624_l1604_l1618_l1601_DUPLICATE_8ed5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_47d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1629_l1624_l1604_l1618_l1601_DUPLICATE_8ed5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_af97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1629_l1624_l1604_l1618_l1601_DUPLICATE_8ed5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_262d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1629_l1624_l1604_l1618_l1601_DUPLICATE_8ed5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1629_l1604_l1601_DUPLICATE_9487_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1629_l1604_l1601_DUPLICATE_9487_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1629_l1604_l1601_DUPLICATE_9487_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1629_l1604_l1601_DUPLICATE_9487_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1629_l1604_l1601_DUPLICATE_9487_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1629_l1604_l1601_DUPLICATE_9487_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1629_l1604_l1601_DUPLICATE_9487_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1629_l1604_l1601_DUPLICATE_9487_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1629_l1604_l1601_DUPLICATE_9487_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_262d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1629_l1604_l1601_DUPLICATE_9487_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1597_l1609_l1594_l1586_l1589_l1580_l1604_l1618_l1601_DUPLICATE_2b6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1597_l1609_l1594_l1586_l1589_l1580_l1604_l1618_l1601_DUPLICATE_2b6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1597_l1609_l1594_l1586_l1589_l1580_l1604_l1618_l1601_DUPLICATE_2b6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1597_l1609_l1594_l1586_l1589_l1580_l1604_l1618_l1601_DUPLICATE_2b6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1597_l1609_l1594_l1586_l1589_l1580_l1604_l1618_l1601_DUPLICATE_2b6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1597_l1609_l1594_l1586_l1589_l1580_l1604_l1618_l1601_DUPLICATE_2b6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1597_l1609_l1594_l1586_l1589_l1580_l1604_l1618_l1601_DUPLICATE_2b6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1597_l1609_l1594_l1586_l1589_l1580_l1604_l1618_l1601_DUPLICATE_2b6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_47d1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1597_l1609_l1594_l1586_l1589_l1580_l1604_l1618_l1601_DUPLICATE_2b6f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1604_l1601_DUPLICATE_9883_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1604_l1601_DUPLICATE_9883_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1604_l1601_DUPLICATE_9883_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1604_l1601_DUPLICATE_9883_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1604_l1601_DUPLICATE_9883_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1604_l1601_DUPLICATE_9883_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1604_l1601_DUPLICATE_9883_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1604_l1601_DUPLICATE_9883_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1624_l1604_l1601_DUPLICATE_1803_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1624_l1604_l1601_DUPLICATE_1803_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1624_l1604_l1601_DUPLICATE_1803_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1624_l1604_l1601_DUPLICATE_1803_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1624_l1604_l1601_DUPLICATE_1803_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1624_l1604_l1601_DUPLICATE_1803_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1624_l1604_l1601_DUPLICATE_1803_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1624_l1604_l1601_DUPLICATE_1803_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1624_l1604_l1601_DUPLICATE_1803_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1624_c7_af97_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1612_l1597_l1609_l1594_l1586_l1589_l1580_l1624_l1604_l1601_DUPLICATE_1803_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1609_c7_3146_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_af97_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1626_c3_d050;
     -- BIN_OP_OR[uxn_opcodes_h_l1598_c3_f550] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1598_c3_f550_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1598_c3_f550_left;
     BIN_OP_OR_uxn_opcodes_h_l1598_c3_f550_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1598_c3_f550_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1598_c3_f550_return_output := BIN_OP_OR_uxn_opcodes_h_l1598_c3_f550_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1629_c7_262d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_262d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_262d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_262d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_262d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_262d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_262d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_262d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_262d_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1606_l1591_DUPLICATE_f5bc LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1606_l1591_DUPLICATE_f5bc_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1606_l1591_DUPLICATE_f5bc_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1606_l1591_DUPLICATE_f5bc_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1606_l1591_DUPLICATE_f5bc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1612_c7_0d51] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1612_c7_0d51_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1612_c7_0d51_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1618_c7_47d1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_47d1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_47d1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_47d1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_47d1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_47d1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_47d1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1622_c22_8c58] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1622_c22_8c58_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1622_c32_029f_return_output);

     -- result_ram_addr_MUX[uxn_opcodes_h_l1624_c7_af97] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_af97_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_af97_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_af97_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_af97_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_af97_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_af97_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_af97_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_af97_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1613_c3_a661] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1613_c3_a661_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1613_c3_a661_left;
     BIN_OP_OR_uxn_opcodes_h_l1613_c3_a661_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1613_c3_a661_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1613_c3_a661_return_output := BIN_OP_OR_uxn_opcodes_h_l1613_c3_a661_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1580_c1_16c9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1580_c1_16c9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1580_c1_16c9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1580_c1_16c9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1580_c1_16c9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1580_c1_16c9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1580_c1_16c9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1580_c1_16c9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1580_c1_16c9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1629_c7_262d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_262d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_262d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_262d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_262d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_262d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_262d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_262d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_262d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1609_c7_3146] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1609_c7_3146_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1609_c7_3146_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1609_c7_3146_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1609_c7_3146_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1616_c32_a93c] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1616_c32_a93c_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1616_c32_a93c_left;
     BIN_OP_GT_uxn_opcodes_h_l1616_c32_a93c_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1616_c32_a93c_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1616_c32_a93c_return_output := BIN_OP_GT_uxn_opcodes_h_l1616_c32_a93c_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1624_c7_af97] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1624_c7_af97_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1624_c7_af97_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1624_c7_af97_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1624_c7_af97_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1624_c7_af97_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1624_c7_af97_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1624_c7_af97_return_output := result_ram_value_MUX_uxn_opcodes_h_l1624_c7_af97_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1616_c32_4472_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1616_c32_a93c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1598_c3_f550_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1613_c3_a661_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1618_c7_47d1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1622_c22_8c58_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1606_l1591_DUPLICATE_f5bc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1606_l1591_DUPLICATE_f5bc_return_output;
     VAR_printf_uxn_opcodes_h_l1581_c3_68bd_uxn_opcodes_h_l1581_c3_68bd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1580_c1_16c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_af97_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_262d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1624_c7_af97_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c7_262d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1618_c7_47d1_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_af97_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1618_c7_47d1_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1624_c7_af97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1609_c7_3146_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1618_c7_47d1] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1618_c7_47d1_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1618_c7_47d1_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1618_c7_47d1_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1618_c7_47d1_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1618_c7_47d1_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1618_c7_47d1_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1618_c7_47d1] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1618_c7_47d1_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1618_c7_47d1_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1618_c7_47d1_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1618_c7_47d1_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1618_c7_47d1_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1618_c7_47d1_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output := result_ram_value_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1624_c7_af97] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_af97_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_af97_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_af97_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_af97_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_af97_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_af97_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_af97_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_af97_return_output;

     -- printf_uxn_opcodes_h_l1581_c3_68bd[uxn_opcodes_h_l1581_c3_68bd] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1581_c3_68bd_uxn_opcodes_h_l1581_c3_68bd_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1581_c3_68bd_uxn_opcodes_h_l1581_c3_68bd_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1624_c7_af97] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1624_c7_af97_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1624_c7_af97_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1624_c7_af97_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1624_c7_af97_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1624_c7_af97_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1624_c7_af97_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1624_c7_af97_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1624_c7_af97_return_output;

     -- MUX[uxn_opcodes_h_l1616_c32_4472] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1616_c32_4472_cond <= VAR_MUX_uxn_opcodes_h_l1616_c32_4472_cond;
     MUX_uxn_opcodes_h_l1616_c32_4472_iftrue <= VAR_MUX_uxn_opcodes_h_l1616_c32_4472_iftrue;
     MUX_uxn_opcodes_h_l1616_c32_4472_iffalse <= VAR_MUX_uxn_opcodes_h_l1616_c32_4472_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1616_c32_4472_return_output := MUX_uxn_opcodes_h_l1616_c32_4472_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1604_c7_b444] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_b444_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_b444_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_b444_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_b444_return_output;

     -- n16_MUX[uxn_opcodes_h_l1612_c7_0d51] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1612_c7_0d51_cond <= VAR_n16_MUX_uxn_opcodes_h_l1612_c7_0d51_cond;
     n16_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue;
     n16_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output := n16_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1609_c7_3146] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1609_c7_3146_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1609_c7_3146_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1609_c7_3146_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1609_c7_3146_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1612_c7_0d51] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output;

     -- t16_MUX[uxn_opcodes_h_l1597_c7_3570] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1597_c7_3570_cond <= VAR_t16_MUX_uxn_opcodes_h_l1597_c7_3570_cond;
     t16_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue;
     t16_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1597_c7_3570_return_output := t16_MUX_uxn_opcodes_h_l1597_c7_3570_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue := VAR_MUX_uxn_opcodes_h_l1616_c32_4472_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_47d1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_af97_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_47d1_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1624_c7_af97_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1609_c7_3146_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_b444_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1597_c7_3570_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1604_c7_b444] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1604_c7_b444_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1604_c7_b444_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1604_c7_b444_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1604_c7_b444_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1612_c7_0d51] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_0d51_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_0d51_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1612_c7_0d51] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output;

     -- t16_MUX[uxn_opcodes_h_l1594_c7_38ba] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1594_c7_38ba_cond <= VAR_t16_MUX_uxn_opcodes_h_l1594_c7_38ba_cond;
     t16_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue;
     t16_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output := t16_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1601_c7_e757] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1601_c7_e757_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1601_c7_e757_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1601_c7_e757_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1601_c7_e757_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1612_c7_0d51] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1612_c7_0d51_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1612_c7_0d51_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output := result_ram_value_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1609_c7_3146] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1609_c7_3146_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1609_c7_3146_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1609_c7_3146_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1609_c7_3146_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1618_c7_47d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_47d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_47d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_47d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_47d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_47d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_47d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output;

     -- n16_MUX[uxn_opcodes_h_l1609_c7_3146] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1609_c7_3146_cond <= VAR_n16_MUX_uxn_opcodes_h_l1609_c7_3146_cond;
     n16_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue;
     n16_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1609_c7_3146_return_output := n16_MUX_uxn_opcodes_h_l1609_c7_3146_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1618_c7_47d1] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_47d1_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_47d1_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_47d1_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_47d1_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_47d1_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_47d1_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1609_c7_3146_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_47d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1609_c7_3146_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1604_c7_b444_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1601_c7_e757_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output;
     -- t16_MUX[uxn_opcodes_h_l1589_c7_87d1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1589_c7_87d1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1589_c7_87d1_cond;
     t16_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue;
     t16_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output := t16_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1609_c7_3146] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1609_c7_3146_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1609_c7_3146_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1609_c7_3146_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1609_c7_3146_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1601_c7_e757] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1601_c7_e757_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1601_c7_e757_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1601_c7_e757_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1601_c7_e757_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1612_c7_0d51] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1612_c7_0d51_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1612_c7_0d51_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output;

     -- n16_MUX[uxn_opcodes_h_l1604_c7_b444] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1604_c7_b444_cond <= VAR_n16_MUX_uxn_opcodes_h_l1604_c7_b444_cond;
     n16_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue;
     n16_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1604_c7_b444_return_output := n16_MUX_uxn_opcodes_h_l1604_c7_b444_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1597_c7_3570] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_3570_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_3570_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_3570_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_3570_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1609_c7_3146] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1609_c7_3146_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1609_c7_3146_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1609_c7_3146_return_output := result_ram_value_MUX_uxn_opcodes_h_l1609_c7_3146_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1604_c7_b444] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_b444_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_b444_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_b444_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_b444_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1612_c7_0d51] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_0d51_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_0d51_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_0d51_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_0d51_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1609_c7_3146] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1609_c7_3146_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1609_c7_3146_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1609_c7_3146_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1609_c7_3146_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1604_c7_b444_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1612_c7_0d51_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_b444_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1601_c7_e757_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1609_c7_3146_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1609_c7_3146_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1609_c7_3146_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_3570_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1609_c7_3146] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_3146_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_3146_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_3146_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_3146_return_output;

     -- t16_MUX[uxn_opcodes_h_l1586_c7_1b92] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1586_c7_1b92_cond <= VAR_t16_MUX_uxn_opcodes_h_l1586_c7_1b92_cond;
     t16_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue;
     t16_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output := t16_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output;

     -- n16_MUX[uxn_opcodes_h_l1601_c7_e757] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1601_c7_e757_cond <= VAR_n16_MUX_uxn_opcodes_h_l1601_c7_e757_cond;
     n16_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue;
     n16_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1601_c7_e757_return_output := n16_MUX_uxn_opcodes_h_l1601_c7_e757_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1594_c7_38ba] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_38ba_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_38ba_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1609_c7_3146] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1609_c7_3146_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1609_c7_3146_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1609_c7_3146_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1609_c7_3146_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1609_c7_3146_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1609_c7_3146_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1601_c7_e757] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1601_c7_e757_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1601_c7_e757_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1601_c7_e757_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1601_c7_e757_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1604_c7_b444] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_b444_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_b444_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_b444_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_b444_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1597_c7_3570] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1597_c7_3570_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1597_c7_3570_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1597_c7_3570_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1597_c7_3570_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1604_c7_b444] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1604_c7_b444_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1604_c7_b444_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1604_c7_b444_return_output := result_ram_value_MUX_uxn_opcodes_h_l1604_c7_b444_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1604_c7_b444] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1604_c7_b444_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1604_c7_b444_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1604_c7_b444_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1604_c7_b444_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1601_c7_e757_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_3146_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1609_c7_3146_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1601_c7_e757_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1597_c7_3570_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_b444_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1604_c7_b444_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1604_c7_b444_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1604_c7_b444] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1604_c7_b444_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1604_c7_b444_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1604_c7_b444_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1604_c7_b444_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1589_c7_87d1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1589_c7_87d1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1589_c7_87d1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1597_c7_3570] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1597_c7_3570_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1597_c7_3570_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1597_c7_3570_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1597_c7_3570_return_output;

     -- n16_MUX[uxn_opcodes_h_l1597_c7_3570] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1597_c7_3570_cond <= VAR_n16_MUX_uxn_opcodes_h_l1597_c7_3570_cond;
     n16_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue;
     n16_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1597_c7_3570_return_output := n16_MUX_uxn_opcodes_h_l1597_c7_3570_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1601_c7_e757] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1601_c7_e757_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1601_c7_e757_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1601_c7_e757_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1601_c7_e757_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1594_c7_38ba] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1594_c7_38ba_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1594_c7_38ba_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output;

     -- t16_MUX[uxn_opcodes_h_l1580_c2_764a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1580_c2_764a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1580_c2_764a_cond;
     t16_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue;
     t16_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1580_c2_764a_return_output := t16_MUX_uxn_opcodes_h_l1580_c2_764a_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1601_c7_e757] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1601_c7_e757_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1601_c7_e757_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1601_c7_e757_return_output := result_ram_value_MUX_uxn_opcodes_h_l1601_c7_e757_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1601_c7_e757] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_e757_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_e757_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_e757_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_e757_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1604_c7_b444] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_b444_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_b444_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_b444_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_b444_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_b444_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_b444_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1597_c7_3570_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_b444_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1604_c7_b444_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1597_c7_3570_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1601_c7_e757_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1601_c7_e757_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_e757_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1580_c2_764a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1601_c7_e757] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_e757_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_e757_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_e757_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_e757_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1586_c7_1b92] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_1b92_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_1b92_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1601_c7_e757] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1601_c7_e757_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1601_c7_e757_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1601_c7_e757_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1601_c7_e757_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1601_c7_e757_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1601_c7_e757_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1597_c7_3570] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1597_c7_3570_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1597_c7_3570_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1597_c7_3570_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1597_c7_3570_return_output;

     -- n16_MUX[uxn_opcodes_h_l1594_c7_38ba] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1594_c7_38ba_cond <= VAR_n16_MUX_uxn_opcodes_h_l1594_c7_38ba_cond;
     n16_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue;
     n16_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output := n16_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1597_c7_3570] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1597_c7_3570_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1597_c7_3570_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1597_c7_3570_return_output := result_ram_value_MUX_uxn_opcodes_h_l1597_c7_3570_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1597_c7_3570] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1597_c7_3570_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1597_c7_3570_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1597_c7_3570_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1597_c7_3570_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1589_c7_87d1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1589_c7_87d1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1589_c7_87d1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1594_c7_38ba] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_e757_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1601_c7_e757_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1597_c7_3570_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1597_c7_3570_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1597_c7_3570_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1589_c7_87d1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1594_c7_38ba] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1594_c7_38ba_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c7_38ba_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1586_c7_1b92] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_1b92_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_1b92_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1594_c7_38ba] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1594_c7_38ba_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1594_c7_38ba_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output := result_ram_value_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output;

     -- n16_MUX[uxn_opcodes_h_l1589_c7_87d1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1589_c7_87d1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1589_c7_87d1_cond;
     n16_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue;
     n16_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output := n16_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1597_c7_3570] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1597_c7_3570_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1597_c7_3570_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1597_c7_3570_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1597_c7_3570_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1597_c7_3570] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_3570_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_3570_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_3570_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_3570_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_3570_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_3570_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1594_c7_38ba] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1580_c2_764a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_764a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_764a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_764a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_764a_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_3570_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1597_c7_3570_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1586_c7_1b92] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output;

     -- n16_MUX[uxn_opcodes_h_l1586_c7_1b92] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1586_c7_1b92_cond <= VAR_n16_MUX_uxn_opcodes_h_l1586_c7_1b92_cond;
     n16_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue;
     n16_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output := n16_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1589_c7_87d1] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1589_c7_87d1_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1589_c7_87d1_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output := result_ram_value_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1580_c2_764a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1580_c2_764a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1580_c2_764a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1580_c2_764a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1580_c2_764a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1594_c7_38ba] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_38ba_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_38ba_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1589_c7_87d1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1589_c7_87d1] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1589_c7_87d1_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1589_c7_87d1_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1594_c7_38ba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_38ba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_38ba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_38ba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_38ba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_38ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1586_c7_1b92] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1586_c7_1b92_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1586_c7_1b92_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output := result_ram_value_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1586_c7_1b92] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1586_c7_1b92] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_1b92_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_1b92_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1589_c7_87d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1589_c7_87d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1589_c7_87d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1580_c2_764a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1580_c2_764a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1580_c2_764a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1580_c2_764a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1580_c2_764a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1580_c2_764a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1580_c2_764a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1580_c2_764a_cond;
     n16_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue;
     n16_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1580_c2_764a_return_output := n16_MUX_uxn_opcodes_h_l1580_c2_764a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1589_c7_87d1] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1589_c7_87d1_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1589_c7_87d1_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1589_c7_87d1_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1589_c7_87d1_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1580_c2_764a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1589_c7_87d1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1580_c2_764a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_764a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_764a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_764a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_764a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1580_c2_764a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1580_c2_764a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1580_c2_764a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1580_c2_764a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1580_c2_764a_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1580_c2_764a] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1580_c2_764a_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1580_c2_764a_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1580_c2_764a_return_output := result_ram_value_MUX_uxn_opcodes_h_l1580_c2_764a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1586_c7_1b92] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_1b92_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_1b92_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1586_c7_1b92] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1586_c7_1b92_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1586_c7_1b92_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1586_c7_1b92_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1586_c7_1b92_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1586_c7_1b92_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1580_c2_764a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_764a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_764a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_764a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_764a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1580_c2_764a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_764a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_764a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_764a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_764a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_764a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_764a_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e57a_uxn_opcodes_h_l1634_l1576_DUPLICATE_fc52 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e57a_uxn_opcodes_h_l1634_l1576_DUPLICATE_fc52_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e57a(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_764a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1580_c2_764a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_764a_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1580_c2_764a_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_764a_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1580_c2_764a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_764a_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1580_c2_764a_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e57a_uxn_opcodes_h_l1634_l1576_DUPLICATE_fc52_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e57a_uxn_opcodes_h_l1634_l1576_DUPLICATE_fc52_return_output;
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
