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
-- Submodules: 63
entity ldz_0CLK_7c2e709f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldz_0CLK_7c2e709f;
architecture arch of ldz_0CLK_7c2e709f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1629_c6_61ee]
signal BIN_OP_EQ_uxn_opcodes_h_l1629_c6_61ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1629_c6_61ee_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1629_c6_61ee_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1629_c1_21b0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_21b0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_21b0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_21b0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_21b0_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1629_c2_fee7]
signal t8_MUX_uxn_opcodes_h_l1629_c2_fee7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1629_c2_fee7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1629_c2_fee7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1629_c2_fee7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1629_c2_fee7]
signal result_stack_value_MUX_uxn_opcodes_h_l1629_c2_fee7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1629_c2_fee7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1629_c2_fee7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_fee7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1629_c2_fee7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_fee7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1629_c2_fee7]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1629_c2_fee7_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1629_c2_fee7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1629_c2_fee7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1629_c2_fee7]
signal result_ram_addr_MUX_uxn_opcodes_h_l1629_c2_fee7_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1629_c2_fee7]
signal tmp8_MUX_uxn_opcodes_h_l1629_c2_fee7_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1630_c3_20aa[uxn_opcodes_h_l1630_c3_20aa]
signal printf_uxn_opcodes_h_l1630_c3_20aa_uxn_opcodes_h_l1630_c3_20aa_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1635_c11_62d3]
signal BIN_OP_EQ_uxn_opcodes_h_l1635_c11_62d3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1635_c11_62d3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1635_c11_62d3_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1635_c7_5221]
signal t8_MUX_uxn_opcodes_h_l1635_c7_5221_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1635_c7_5221_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1635_c7_5221]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1635_c7_5221_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1635_c7_5221_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1635_c7_5221]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1635_c7_5221_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1635_c7_5221_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1635_c7_5221]
signal result_stack_value_MUX_uxn_opcodes_h_l1635_c7_5221_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1635_c7_5221_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1635_c7_5221]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1635_c7_5221_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1635_c7_5221_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1635_c7_5221]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_5221_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_5221_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1635_c7_5221]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_5221_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_5221_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1635_c7_5221]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_5221_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_5221_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1635_c7_5221]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_5221_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_5221_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1635_c7_5221]
signal result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_5221_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_5221_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1635_c7_5221]
signal tmp8_MUX_uxn_opcodes_h_l1635_c7_5221_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1635_c7_5221_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1638_c11_ea60]
signal BIN_OP_EQ_uxn_opcodes_h_l1638_c11_ea60_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1638_c11_ea60_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1638_c11_ea60_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1638_c7_2edf]
signal t8_MUX_uxn_opcodes_h_l1638_c7_2edf_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1638_c7_2edf]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1638_c7_2edf_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1638_c7_2edf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1638_c7_2edf]
signal result_stack_value_MUX_uxn_opcodes_h_l1638_c7_2edf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1638_c7_2edf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1638_c7_2edf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_2edf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1638_c7_2edf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_2edf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1638_c7_2edf]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_2edf_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1638_c7_2edf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_2edf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1638_c7_2edf]
signal result_ram_addr_MUX_uxn_opcodes_h_l1638_c7_2edf_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1638_c7_2edf]
signal tmp8_MUX_uxn_opcodes_h_l1638_c7_2edf_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1642_c32_8682]
signal BIN_OP_AND_uxn_opcodes_h_l1642_c32_8682_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1642_c32_8682_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1642_c32_8682_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1642_c32_e5e1]
signal BIN_OP_GT_uxn_opcodes_h_l1642_c32_e5e1_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1642_c32_e5e1_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1642_c32_e5e1_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1642_c32_d2ed]
signal MUX_uxn_opcodes_h_l1642_c32_d2ed_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1642_c32_d2ed_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1642_c32_d2ed_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1642_c32_d2ed_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1646_c11_8d5c]
signal BIN_OP_EQ_uxn_opcodes_h_l1646_c11_8d5c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1646_c11_8d5c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1646_c11_8d5c_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1646_c7_66d4]
signal result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_66d4_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1646_c7_66d4]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1646_c7_66d4_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1646_c7_66d4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_66d4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1646_c7_66d4]
signal result_stack_value_MUX_uxn_opcodes_h_l1646_c7_66d4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1646_c7_66d4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_66d4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1646_c7_66d4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_66d4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1646_c7_66d4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_66d4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1646_c7_66d4]
signal tmp8_MUX_uxn_opcodes_h_l1646_c7_66d4_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1650_c11_76bb]
signal BIN_OP_EQ_uxn_opcodes_h_l1650_c11_76bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1650_c11_76bb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1650_c11_76bb_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1650_c7_b8ee]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1650_c7_b8ee]
signal result_stack_value_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1650_c7_b8ee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1650_c7_b8ee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1650_c7_b8ee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1650_c7_b8ee]
signal tmp8_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1657_c11_7329]
signal BIN_OP_EQ_uxn_opcodes_h_l1657_c11_7329_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1657_c11_7329_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1657_c11_7329_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1657_c7_9498]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1657_c7_9498_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1657_c7_9498_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1657_c7_9498_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1657_c7_9498_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1657_c7_9498]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_9498_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_9498_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_9498_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_9498_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_c22c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_ram_read := ref_toks_7;
      base.is_stack_write := ref_toks_8;
      base.ram_addr := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1629_c6_61ee
BIN_OP_EQ_uxn_opcodes_h_l1629_c6_61ee : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1629_c6_61ee_left,
BIN_OP_EQ_uxn_opcodes_h_l1629_c6_61ee_right,
BIN_OP_EQ_uxn_opcodes_h_l1629_c6_61ee_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_21b0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_21b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_21b0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_21b0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_21b0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_21b0_return_output);

-- t8_MUX_uxn_opcodes_h_l1629_c2_fee7
t8_MUX_uxn_opcodes_h_l1629_c2_fee7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1629_c2_fee7_cond,
t8_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue,
t8_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse,
t8_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1629_c2_fee7
result_is_stack_read_MUX_uxn_opcodes_h_l1629_c2_fee7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1629_c2_fee7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_fee7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_fee7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1629_c2_fee7
result_stack_value_MUX_uxn_opcodes_h_l1629_c2_fee7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1629_c2_fee7_cond,
result_stack_value_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_fee7
result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_fee7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_fee7
result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_fee7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_fee7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_fee7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_fee7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_fee7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1629_c2_fee7
result_is_ram_read_MUX_uxn_opcodes_h_l1629_c2_fee7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1629_c2_fee7_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1629_c2_fee7
result_is_stack_write_MUX_uxn_opcodes_h_l1629_c2_fee7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1629_c2_fee7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1629_c2_fee7
result_ram_addr_MUX_uxn_opcodes_h_l1629_c2_fee7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1629_c2_fee7_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1629_c2_fee7
tmp8_MUX_uxn_opcodes_h_l1629_c2_fee7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1629_c2_fee7_cond,
tmp8_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue,
tmp8_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse,
tmp8_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output);

-- printf_uxn_opcodes_h_l1630_c3_20aa_uxn_opcodes_h_l1630_c3_20aa
printf_uxn_opcodes_h_l1630_c3_20aa_uxn_opcodes_h_l1630_c3_20aa : entity work.printf_uxn_opcodes_h_l1630_c3_20aa_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1630_c3_20aa_uxn_opcodes_h_l1630_c3_20aa_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1635_c11_62d3
BIN_OP_EQ_uxn_opcodes_h_l1635_c11_62d3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1635_c11_62d3_left,
BIN_OP_EQ_uxn_opcodes_h_l1635_c11_62d3_right,
BIN_OP_EQ_uxn_opcodes_h_l1635_c11_62d3_return_output);

-- t8_MUX_uxn_opcodes_h_l1635_c7_5221
t8_MUX_uxn_opcodes_h_l1635_c7_5221 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1635_c7_5221_cond,
t8_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue,
t8_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse,
t8_MUX_uxn_opcodes_h_l1635_c7_5221_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1635_c7_5221
result_is_stack_read_MUX_uxn_opcodes_h_l1635_c7_5221 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1635_c7_5221_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1635_c7_5221_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1635_c7_5221
result_sp_relative_shift_MUX_uxn_opcodes_h_l1635_c7_5221 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1635_c7_5221_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1635_c7_5221_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1635_c7_5221
result_stack_value_MUX_uxn_opcodes_h_l1635_c7_5221 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1635_c7_5221_cond,
result_stack_value_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1635_c7_5221_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1635_c7_5221
result_is_sp_shift_MUX_uxn_opcodes_h_l1635_c7_5221 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1635_c7_5221_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1635_c7_5221_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_5221
result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_5221 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_5221_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_5221_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_5221
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_5221 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_5221_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_5221_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_5221
result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_5221 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_5221_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_5221_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_5221
result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_5221 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_5221_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_5221_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_5221
result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_5221 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_5221_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_5221_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1635_c7_5221
tmp8_MUX_uxn_opcodes_h_l1635_c7_5221 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1635_c7_5221_cond,
tmp8_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue,
tmp8_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse,
tmp8_MUX_uxn_opcodes_h_l1635_c7_5221_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1638_c11_ea60
BIN_OP_EQ_uxn_opcodes_h_l1638_c11_ea60 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1638_c11_ea60_left,
BIN_OP_EQ_uxn_opcodes_h_l1638_c11_ea60_right,
BIN_OP_EQ_uxn_opcodes_h_l1638_c11_ea60_return_output);

-- t8_MUX_uxn_opcodes_h_l1638_c7_2edf
t8_MUX_uxn_opcodes_h_l1638_c7_2edf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1638_c7_2edf_cond,
t8_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue,
t8_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse,
t8_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1638_c7_2edf
result_is_stack_read_MUX_uxn_opcodes_h_l1638_c7_2edf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1638_c7_2edf_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c7_2edf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c7_2edf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1638_c7_2edf
result_stack_value_MUX_uxn_opcodes_h_l1638_c7_2edf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1638_c7_2edf_cond,
result_stack_value_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c7_2edf
result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c7_2edf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_2edf
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_2edf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_2edf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_2edf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_2edf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_2edf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_2edf
result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_2edf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_2edf_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_2edf
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_2edf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_2edf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1638_c7_2edf
result_ram_addr_MUX_uxn_opcodes_h_l1638_c7_2edf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1638_c7_2edf_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1638_c7_2edf
tmp8_MUX_uxn_opcodes_h_l1638_c7_2edf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1638_c7_2edf_cond,
tmp8_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue,
tmp8_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse,
tmp8_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1642_c32_8682
BIN_OP_AND_uxn_opcodes_h_l1642_c32_8682 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1642_c32_8682_left,
BIN_OP_AND_uxn_opcodes_h_l1642_c32_8682_right,
BIN_OP_AND_uxn_opcodes_h_l1642_c32_8682_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1642_c32_e5e1
BIN_OP_GT_uxn_opcodes_h_l1642_c32_e5e1 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1642_c32_e5e1_left,
BIN_OP_GT_uxn_opcodes_h_l1642_c32_e5e1_right,
BIN_OP_GT_uxn_opcodes_h_l1642_c32_e5e1_return_output);

-- MUX_uxn_opcodes_h_l1642_c32_d2ed
MUX_uxn_opcodes_h_l1642_c32_d2ed : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1642_c32_d2ed_cond,
MUX_uxn_opcodes_h_l1642_c32_d2ed_iftrue,
MUX_uxn_opcodes_h_l1642_c32_d2ed_iffalse,
MUX_uxn_opcodes_h_l1642_c32_d2ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1646_c11_8d5c
BIN_OP_EQ_uxn_opcodes_h_l1646_c11_8d5c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1646_c11_8d5c_left,
BIN_OP_EQ_uxn_opcodes_h_l1646_c11_8d5c_right,
BIN_OP_EQ_uxn_opcodes_h_l1646_c11_8d5c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_66d4
result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_66d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_66d4_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1646_c7_66d4
result_is_ram_read_MUX_uxn_opcodes_h_l1646_c7_66d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1646_c7_66d4_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_66d4
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_66d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_66d4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1646_c7_66d4
result_stack_value_MUX_uxn_opcodes_h_l1646_c7_66d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1646_c7_66d4_cond,
result_stack_value_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_66d4
result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_66d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_66d4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_66d4
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_66d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_66d4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_66d4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_66d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_66d4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1646_c7_66d4
tmp8_MUX_uxn_opcodes_h_l1646_c7_66d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1646_c7_66d4_cond,
tmp8_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue,
tmp8_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse,
tmp8_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1650_c11_76bb
BIN_OP_EQ_uxn_opcodes_h_l1650_c11_76bb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1650_c11_76bb_left,
BIN_OP_EQ_uxn_opcodes_h_l1650_c11_76bb_right,
BIN_OP_EQ_uxn_opcodes_h_l1650_c11_76bb_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1650_c7_b8ee
result_is_ram_read_MUX_uxn_opcodes_h_l1650_c7_b8ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1650_c7_b8ee
result_stack_value_MUX_uxn_opcodes_h_l1650_c7_b8ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond,
result_stack_value_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_b8ee
result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_b8ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_b8ee
result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_b8ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_b8ee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_b8ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1650_c7_b8ee
tmp8_MUX_uxn_opcodes_h_l1650_c7_b8ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond,
tmp8_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue,
tmp8_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse,
tmp8_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1657_c11_7329
BIN_OP_EQ_uxn_opcodes_h_l1657_c11_7329 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1657_c11_7329_left,
BIN_OP_EQ_uxn_opcodes_h_l1657_c11_7329_right,
BIN_OP_EQ_uxn_opcodes_h_l1657_c11_7329_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1657_c7_9498
result_is_stack_write_MUX_uxn_opcodes_h_l1657_c7_9498 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1657_c7_9498_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1657_c7_9498_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1657_c7_9498_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1657_c7_9498_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_9498
result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_9498 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_9498_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_9498_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_9498_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_9498_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t8,
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1629_c6_61ee_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_21b0_return_output,
 t8_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output,
 tmp8_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1635_c11_62d3_return_output,
 t8_MUX_uxn_opcodes_h_l1635_c7_5221_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1635_c7_5221_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1635_c7_5221_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1635_c7_5221_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1635_c7_5221_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_5221_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_5221_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_5221_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_5221_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_5221_return_output,
 tmp8_MUX_uxn_opcodes_h_l1635_c7_5221_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1638_c11_ea60_return_output,
 t8_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output,
 tmp8_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1642_c32_8682_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1642_c32_e5e1_return_output,
 MUX_uxn_opcodes_h_l1642_c32_d2ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1646_c11_8d5c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output,
 tmp8_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1650_c11_76bb_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output,
 tmp8_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1657_c11_7329_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1657_c7_9498_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_9498_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_61ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_61ee_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_61ee_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_21b0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_21b0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_21b0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_21b0_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1635_c7_5221_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1629_c2_fee7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1635_c7_5221_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1629_c2_fee7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1635_c7_5221_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_5221_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1629_c2_fee7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1635_c7_5221_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_5221_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_fee7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1632_c3_85d6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_5221_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_fee7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_5221_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1629_c2_fee7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_5221_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1629_c2_fee7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_5221_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1629_c2_fee7_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_5221_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1629_c2_fee7_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1630_c3_20aa_uxn_opcodes_h_l1630_c3_20aa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_62d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_62d3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_62d3_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1635_c7_5221_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1635_c7_5221_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1635_c7_5221_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_5221_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1635_c7_5221_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_5221_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1636_c3_e944 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_5221_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_5221_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_5221_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_5221_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_5221_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c11_ea60_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c11_ea60_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c11_ea60_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1638_c7_2edf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1638_c7_2edf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1638_c7_2edf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_2edf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_2edf_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_2edf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_2edf_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1638_c7_2edf_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1638_c7_2edf_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1642_c32_d2ed_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1642_c32_d2ed_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1642_c32_d2ed_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1642_c32_8682_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1642_c32_8682_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1642_c32_8682_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1642_c32_e5e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1642_c32_e5e1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1642_c32_e5e1_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1642_c32_d2ed_return_output : signed(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1644_c21_edf8_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_8d5c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_8d5c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_8d5c_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_66d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1646_c7_66d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_66d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_66d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_66d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_66d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_66d4_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1646_c7_66d4_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1648_c21_ad85_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_76bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_76bb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_76bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1657_c7_9498_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_9498_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1654_c3_c7bb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_7329_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_7329_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_7329_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1657_c7_9498_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1657_c7_9498_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1657_c7_9498_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_9498_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_9498_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_9498_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1635_l1638_l1629_DUPLICATE_ff04_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1650_l1646_l1638_l1635_l1629_DUPLICATE_1de6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1635_l1629_l1646_DUPLICATE_6d49_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1635_l1650_l1629_l1646_DUPLICATE_9f3c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1657_l1646_l1638_l1635_l1629_DUPLICATE_dbe9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1635_l1629_l1646_DUPLICATE_fb76_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1635_l1638_DUPLICATE_3eea_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1657_l1650_l1646_l1638_l1635_DUPLICATE_22c8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1650_l1638_l1646_DUPLICATE_dcbd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c22c_uxn_opcodes_h_l1625_l1662_DUPLICATE_5ac9_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_21b0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1642_c32_8682_right := to_unsigned(128, 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1642_c32_e5e1_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1642_c32_d2ed_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1654_c3_c7bb := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1654_c3_c7bb;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_8d5c_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_61ee_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_62d3_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1657_c7_9498_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_7329_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1632_c3_85d6 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1632_c3_85d6;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1636_c3_e944 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1636_c3_e944;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1642_c32_d2ed_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_76bb_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_9498_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c11_ea60_right := to_unsigned(2, 2);

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_21b0_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1642_c32_8682_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_61ee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_62d3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c11_ea60_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_8d5c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_76bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_7329_left := VAR_phase;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse := t8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse := tmp8;
     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1635_l1629_l1646_DUPLICATE_fb76 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1635_l1629_l1646_DUPLICATE_fb76_return_output := result.ram_addr;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1657_l1646_l1638_l1635_l1629_DUPLICATE_dbe9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1657_l1646_l1638_l1635_l1629_DUPLICATE_dbe9_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1638_c11_ea60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1638_c11_ea60_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c11_ea60_left;
     BIN_OP_EQ_uxn_opcodes_h_l1638_c11_ea60_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c11_ea60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c11_ea60_return_output := BIN_OP_EQ_uxn_opcodes_h_l1638_c11_ea60_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1635_l1638_l1629_DUPLICATE_ff04 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1635_l1638_l1629_DUPLICATE_ff04_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1635_l1650_l1629_l1646_DUPLICATE_9f3c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1635_l1650_l1629_l1646_DUPLICATE_9f3c_return_output := result.is_ram_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1650_c11_76bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1650_c11_76bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_76bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1650_c11_76bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_76bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_76bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1650_c11_76bb_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1648_c21_ad85] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1648_c21_ad85_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1650_l1646_l1638_l1635_l1629_DUPLICATE_1de6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1650_l1646_l1638_l1635_l1629_DUPLICATE_1de6_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1635_c11_62d3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1635_c11_62d3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_62d3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1635_c11_62d3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_62d3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_62d3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1635_c11_62d3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1657_c11_7329] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1657_c11_7329_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_7329_left;
     BIN_OP_EQ_uxn_opcodes_h_l1657_c11_7329_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_7329_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_7329_return_output := BIN_OP_EQ_uxn_opcodes_h_l1657_c11_7329_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1657_l1650_l1646_l1638_l1635_DUPLICATE_22c8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1657_l1650_l1646_l1638_l1635_DUPLICATE_22c8_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1646_c11_8d5c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1646_c11_8d5c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_8d5c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1646_c11_8d5c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_8d5c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_8d5c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1646_c11_8d5c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1629_c6_61ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1629_c6_61ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_61ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l1629_c6_61ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_61ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_61ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l1629_c6_61ee_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1644_c21_edf8] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1644_c21_edf8_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_AND[uxn_opcodes_h_l1642_c32_8682] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1642_c32_8682_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1642_c32_8682_left;
     BIN_OP_AND_uxn_opcodes_h_l1642_c32_8682_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1642_c32_8682_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1642_c32_8682_return_output := BIN_OP_AND_uxn_opcodes_h_l1642_c32_8682_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1650_l1638_l1646_DUPLICATE_dcbd LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1650_l1638_l1646_DUPLICATE_dcbd_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1635_l1638_DUPLICATE_3eea LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1635_l1638_DUPLICATE_3eea_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1635_l1629_l1646_DUPLICATE_6d49 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1635_l1629_l1646_DUPLICATE_6d49_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1642_c32_e5e1_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1642_c32_8682_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_21b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_61ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_fee7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_61ee_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1629_c2_fee7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_61ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_61ee_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1629_c2_fee7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_61ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1629_c2_fee7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_61ee_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1629_c2_fee7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_61ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_61ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_fee7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_61ee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1629_c2_fee7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_61ee_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1629_c2_fee7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_61ee_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1629_c2_fee7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_61ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_5221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_62d3_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_5221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_62d3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1635_c7_5221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_62d3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1635_c7_5221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_62d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_5221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_62d3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_5221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_62d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1635_c7_5221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_62d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_5221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_62d3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_5221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_62d3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1635_c7_5221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_62d3_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_5221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_62d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_2edf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c11_ea60_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_2edf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c11_ea60_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c11_ea60_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1638_c7_2edf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c11_ea60_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_2edf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c11_ea60_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1638_c7_2edf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c11_ea60_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c11_ea60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_2edf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c11_ea60_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1638_c7_2edf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c11_ea60_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1638_c7_2edf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c11_ea60_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1638_c7_2edf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c11_ea60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_66d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_8d5c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1646_c7_66d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_8d5c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_66d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_8d5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_66d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_8d5c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_66d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_8d5c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_66d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_8d5c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_66d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_8d5c_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1646_c7_66d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_8d5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_76bb_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_76bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_76bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_76bb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_76bb_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_76bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_9498_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_7329_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1657_c7_9498_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_7329_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1644_c21_edf8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1648_c21_ad85_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1635_l1638_l1629_DUPLICATE_ff04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1635_l1638_l1629_DUPLICATE_ff04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1635_l1638_l1629_DUPLICATE_ff04_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1635_l1629_l1646_DUPLICATE_fb76_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1635_l1629_l1646_DUPLICATE_fb76_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1635_l1629_l1646_DUPLICATE_fb76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1657_l1650_l1646_l1638_l1635_DUPLICATE_22c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1657_l1650_l1646_l1638_l1635_DUPLICATE_22c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1657_l1650_l1646_l1638_l1635_DUPLICATE_22c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1657_l1650_l1646_l1638_l1635_DUPLICATE_22c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_9498_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1657_l1650_l1646_l1638_l1635_DUPLICATE_22c8_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1635_l1650_l1629_l1646_DUPLICATE_9f3c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1635_l1650_l1629_l1646_DUPLICATE_9f3c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1635_l1650_l1629_l1646_DUPLICATE_9f3c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1635_l1650_l1629_l1646_DUPLICATE_9f3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1635_l1629_l1646_DUPLICATE_6d49_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1635_l1629_l1646_DUPLICATE_6d49_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1635_l1629_l1646_DUPLICATE_6d49_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1635_l1638_DUPLICATE_3eea_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1635_l1638_DUPLICATE_3eea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1657_l1646_l1638_l1635_l1629_DUPLICATE_dbe9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1657_l1646_l1638_l1635_l1629_DUPLICATE_dbe9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1657_l1646_l1638_l1635_l1629_DUPLICATE_dbe9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1657_l1646_l1638_l1635_l1629_DUPLICATE_dbe9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1657_c7_9498_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1657_l1646_l1638_l1635_l1629_DUPLICATE_dbe9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1650_l1638_l1646_DUPLICATE_dcbd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1650_l1638_l1646_DUPLICATE_dcbd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1650_l1638_l1646_DUPLICATE_dcbd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1650_l1646_l1638_l1635_l1629_DUPLICATE_1de6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1650_l1646_l1638_l1635_l1629_DUPLICATE_1de6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1650_l1646_l1638_l1635_l1629_DUPLICATE_1de6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1650_l1646_l1638_l1635_l1629_DUPLICATE_1de6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1650_l1646_l1638_l1635_l1629_DUPLICATE_1de6_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1650_c7_b8ee] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output := result_stack_value_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1629_c1_21b0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_21b0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_21b0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_21b0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_21b0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_21b0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_21b0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_21b0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_21b0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1650_c7_b8ee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1646_c7_66d4] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_66d4_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_66d4_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output;

     -- t8_MUX[uxn_opcodes_h_l1638_c7_2edf] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1638_c7_2edf_cond <= VAR_t8_MUX_uxn_opcodes_h_l1638_c7_2edf_cond;
     t8_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue;
     t8_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output := t8_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1650_c7_b8ee] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond;
     tmp8_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output := tmp8_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1650_c7_b8ee] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1657_c7_9498] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_9498_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_9498_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_9498_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_9498_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_9498_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_9498_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_9498_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_9498_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1638_c7_2edf] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1638_c7_2edf_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1638_c7_2edf_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1657_c7_9498] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1657_c7_9498_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1657_c7_9498_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1657_c7_9498_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1657_c7_9498_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1657_c7_9498_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1657_c7_9498_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1657_c7_9498_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1657_c7_9498_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1642_c32_e5e1] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1642_c32_e5e1_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1642_c32_e5e1_left;
     BIN_OP_GT_uxn_opcodes_h_l1642_c32_e5e1_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1642_c32_e5e1_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1642_c32_e5e1_return_output := BIN_OP_GT_uxn_opcodes_h_l1642_c32_e5e1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1646_c7_66d4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_66d4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_66d4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1642_c32_d2ed_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1642_c32_e5e1_return_output;
     VAR_printf_uxn_opcodes_h_l1630_c3_20aa_uxn_opcodes_h_l1630_c3_20aa_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_21b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_9498_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1657_c7_9498_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l1646_c7_66d4] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1646_c7_66d4_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1646_c7_66d4_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output;

     -- printf_uxn_opcodes_h_l1630_c3_20aa[uxn_opcodes_h_l1630_c3_20aa] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1630_c3_20aa_uxn_opcodes_h_l1630_c3_20aa_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1630_c3_20aa_uxn_opcodes_h_l1630_c3_20aa_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1650_c7_b8ee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1638_c7_2edf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1635_c7_5221] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1635_c7_5221_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1635_c7_5221_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1635_c7_5221_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1635_c7_5221_return_output;

     -- t8_MUX[uxn_opcodes_h_l1635_c7_5221] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1635_c7_5221_cond <= VAR_t8_MUX_uxn_opcodes_h_l1635_c7_5221_cond;
     t8_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue;
     t8_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1635_c7_5221_return_output := t8_MUX_uxn_opcodes_h_l1635_c7_5221_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1646_c7_66d4] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1646_c7_66d4_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1646_c7_66d4_cond;
     tmp8_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output := tmp8_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1638_c7_2edf] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1638_c7_2edf_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1638_c7_2edf_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1646_c7_66d4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1646_c7_66d4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_66d4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output := result_stack_value_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output;

     -- MUX[uxn_opcodes_h_l1642_c32_d2ed] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1642_c32_d2ed_cond <= VAR_MUX_uxn_opcodes_h_l1642_c32_d2ed_cond;
     MUX_uxn_opcodes_h_l1642_c32_d2ed_iftrue <= VAR_MUX_uxn_opcodes_h_l1642_c32_d2ed_iftrue;
     MUX_uxn_opcodes_h_l1642_c32_d2ed_iffalse <= VAR_MUX_uxn_opcodes_h_l1642_c32_d2ed_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1642_c32_d2ed_return_output := MUX_uxn_opcodes_h_l1642_c32_d2ed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1646_c7_66d4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_66d4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_66d4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1650_c7_b8ee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_b8ee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_b8ee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_b8ee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue := VAR_MUX_uxn_opcodes_h_l1642_c32_d2ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1635_c7_5221_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_b8ee_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1635_c7_5221_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1638_c7_2edf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1629_c2_fee7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1629_c2_fee7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1629_c2_fee7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1646_c7_66d4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_66d4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_66d4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1638_c7_2edf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1638_c7_2edf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1638_c7_2edf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output := result_stack_value_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1635_c7_5221] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_5221_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_5221_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_5221_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_5221_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1638_c7_2edf] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_2edf_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_2edf_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1638_c7_2edf] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1638_c7_2edf_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1638_c7_2edf_cond;
     tmp8_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output := tmp8_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1638_c7_2edf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_2edf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_2edf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1635_c7_5221] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1635_c7_5221_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1635_c7_5221_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1635_c7_5221_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1635_c7_5221_return_output;

     -- t8_MUX[uxn_opcodes_h_l1629_c2_fee7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1629_c2_fee7_cond <= VAR_t8_MUX_uxn_opcodes_h_l1629_c2_fee7_cond;
     t8_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue;
     t8_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output := t8_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1646_c7_66d4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_66d4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_66d4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_66d4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_66d4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1635_c7_5221_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_66d4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_5221_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1635_c7_5221] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_5221_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_5221_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_5221_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_5221_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1629_c2_fee7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1638_c7_2edf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_2edf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_2edf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1635_c7_5221] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_5221_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_5221_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_5221_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_5221_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1635_c7_5221] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1635_c7_5221_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1635_c7_5221_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1635_c7_5221_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1635_c7_5221_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1635_c7_5221] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1635_c7_5221_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_5221_cond;
     tmp8_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_5221_return_output := tmp8_MUX_uxn_opcodes_h_l1635_c7_5221_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1635_c7_5221] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1635_c7_5221_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_5221_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_5221_return_output := result_stack_value_MUX_uxn_opcodes_h_l1635_c7_5221_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1638_c7_2edf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_2edf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_2edf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_2edf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_2edf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1629_c2_fee7] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1629_c2_fee7_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1629_c2_fee7_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_5221_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_2edf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1635_c7_5221_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_5221_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_5221_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_5221_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1629_c2_fee7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1635_c7_5221] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_5221_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_5221_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_5221_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_5221_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1635_c7_5221] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_5221_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_5221_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_5221_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_5221_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_5221_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_5221_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1629_c2_fee7] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1629_c2_fee7_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1629_c2_fee7_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1629_c2_fee7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1629_c2_fee7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1629_c2_fee7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output := result_stack_value_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1629_c2_fee7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_fee7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_fee7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1629_c2_fee7] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1629_c2_fee7_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1629_c2_fee7_cond;
     tmp8_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output := tmp8_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_5221_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_5221_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1629_c2_fee7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_fee7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_fee7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1629_c2_fee7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1629_c2_fee7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1629_c2_fee7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1629_c2_fee7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1629_c2_fee7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c22c_uxn_opcodes_h_l1625_l1662_DUPLICATE_5ac9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c22c_uxn_opcodes_h_l1625_l1662_DUPLICATE_5ac9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c22c(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1629_c2_fee7_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c22c_uxn_opcodes_h_l1625_l1662_DUPLICATE_5ac9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c22c_uxn_opcodes_h_l1625_l1662_DUPLICATE_5ac9_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
